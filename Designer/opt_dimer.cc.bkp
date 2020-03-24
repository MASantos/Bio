#include<iostream>
#include<fstream>
#include<list>
#include<vector>
#include<cstdio>
#include<string>
#include<strstream>
#include<ctime>
#include<map>
#include<algo.h>
using namespace std;


const float LARGE_FLOAT = 1e60;
const int BUFFER_SIZE = 3000;

class Weights{
public:
	// reads graph file
	Weights(char* name);
	// reads small graph file and pair_energies#.tmp
	Weights(char* dump_file, char* flag_file, int size_processes);
	int size_pos() const {return _colors.size();}
	int size_rot() const {return _rotamer.size();}
	// energy of a given configuration:
	float energy(vector<int> nodes) const;
	// pair_energy only works if we have read a graph file
	float pair_energy(int rot1, int rot2) const {
		return -(_weights[rot1][rot2]-(_weights[rot1][rot1]+_weights[rot2][rot2])/2);
	}
	// rotamers
	list<int> rotamers(int color) const {return _colors[color];}
	// the operator () only works if we have read a graph file
	float operator()(int row, int column) const {
		if (_weights.size()>0)return _weights[row][column];
		return weight(row,column);
	}
	// based on heuristic at 09112001
	void computeMaximum(float below_maximum, int heuristic_cycles);
	// based on heuristic at 09112001
	void collectBestNodes(bool below_flag, float below_maximum);
	// based on heuristic at 09112001
	void addToSolutions(float cost, const vector<int>& nodes);
	// if below_flag = true then it prints only the solutions with higher
	// total weight than the lower_limit, otherwise it prints all solutions found
	void printSolutions(bool below_flag, float lower_limit) const;
	istream& readRotCodes(istream& is);  // reads rotamer's amino acid codes
	ostream& printDimerGraph(ostream& os) const;
	
	// it outputs the opt weight (it already contains all energy terms and a minus sign).
	float weight(int rot1, int rot2) const {
		if (rot1>rot2){
			int tmp = rot1;
			rot1 = rot2;
			rot2 = tmp;
		}
		if (!_pair_flags[_position[rot1]][_position[rot2]])
			return -((_single_energies[rot1]+_single_energies[rot2])/(_size_pos-1));
		if (_position[rot1]==_position[rot2])
			return 0;
		if (_pair_number[_position[rot1]][_position[rot2]]<0){
			cerr<<"Weights::weight Error, pair ("<<_position[rot1]<<", "<<_position[rot2]<<") "<<" does not exist!"<<endl;
			exit(1);
		}
		return _opt_weights[_pair_number[_position[rot1]][_position[rot2]]][_rotamer[rot2]][_rotamer[rot1]];
		//return _opt_weights[_rotamer[rot1]][_rotamer[rot2]][_pair_number[_position[rot1]][_position[rot2]]];
	}
	float weight_dimer(int row, int column) const {
		if (_position[(_old_rot[row]).first]==_position[(_old_rot[column]).first])
			return 0;
		return ((weight((_old_rot[row]).first,(_old_rot[column]).first)-((_single_energies[(_old_rot[row]).first]+_single_energies[(_old_rot[column]).first])/(_size_pos-1)))+
			(weight((_old_rot[row]).second,(_old_rot[column]).second) -((_single_energies[(_old_rot[row]).second]+_single_energies[(_old_rot[column]).second])/(_size_pos-1)))+
			(weight((_old_rot[row]).first,(_old_rot[column]).second) -((_single_energies[(_old_rot[row]).first]+_single_energies[(_old_rot[column]).second])/(_size_pos-1)))+
			(weight((_old_rot[row]).second,(_old_rot[column]).first)-((_single_energies[(_old_rot[row]).second]+_single_energies[(_old_rot[column]).first])/(_size_pos-1)))+
			((_dimer_single_energies[row]+_dimer_single_energies[column])/(_mono_size_pos-1)));
	}
private:
	vector< vector<float> > _weights; // -{(rot_ener[row]+rot_ener[column])/(sz_pos - 1)+_pair_energies[row][column]}
	vector< vector< vector<float> > > _opt_weights ; // optimized storageof _weights
	// rotamer's list at each position:
	vector< list<int> > _colors;
	// dimer rotamer's list at each position:
	vector< list<int> > _rotamers_dimer;
	// position cut-off flags (true=we consider the pos1-pos2 interaction)
	vector< vector<bool> > _pair_flags;
	vector<float> _single_energies;
	vector<char> _rot_codes;
	vector<float> _dimer_single_energies;
	vector< pair<int,int> > _old_rot; // it gives the original rotamer number (cumulative) at each monomer
	int _mono_size_pos;
	int _size_pos;
	int _dimer_size_rot;
	// position of a given rotamer
	vector<int> _position;
	// position-dependent rotamer number
	vector<int> _rotamer;
	// pair-position number (we only store the pairs within the cut-off)
	vector< vector<int> > _pair_number;
	// state of the walk
	vector<int> _state;
	// best weight ever
	float _max_weight;
	// solutions
	map<float, vector<int> > _solutions;
};

char* getline(istream& is) {
	static char buffer[BUFFER_SIZE];
	is.getline(buffer,BUFFER_SIZE);
	return buffer;
}
	
Weights::Weights(char* dump_file, char* flag_file, int size_processes){
	ifstream is_dmp(dump_file);
        if (!is_dmp) {
                cerr << dump_file<<" file not found!" << endl;
                exit(1);
        }
	// read .sing.dmp file
	// we will only extract size_pos,size_rot and the single energies (the pair flags are not there :-( )
	int size_pos = 0;
        int size_rot = 0;
	char buffer[BUFFER_SIZE];
	string str;
	int line_counter = 0;
	int rot_counter = 0;
	int pos_counter = 0;
	while(is_dmp.getline(buffer,BUFFER_SIZE)) {
		int pos;
		string segid;
		int num_rot;
		line_counter++;
		istrstream is(buffer);
		if (line_counter==13){
			is >> size_pos;
			_colors.insert(_colors.begin(),size_pos,list<int>() );
		}
		else if (line_counter==14){
			is >> size_rot;
		}
		else if (line_counter>=35){
			// new position
			// position segid #rotamers
			is >> pos >> segid >> num_rot;
			for (int rot=0; rot<num_rot; rot++){
				is_dmp.getline(buffer,BUFFER_SIZE);
				is_dmp.getline(buffer,BUFFER_SIZE);
				is_dmp.getline(buffer,BUFFER_SIZE);
				is_dmp.getline(buffer,BUFFER_SIZE);
				istrstream is2(buffer);
				float sing_energy;
				is2 >> sing_energy;
				_single_energies.push_back(sing_energy);
				_colors[pos_counter].push_back(rot_counter);
				_position.push_back(pos_counter);
				_rotamer.push_back(rot);
				rot_counter++;
			}
			pos_counter++;
			// empty line after finishing the rotamers of a posiion
			is_dmp.getline(buffer,BUFFER_SIZE);
		}
	}// end reading .sing.dmp file
	is_dmp.close();
	if (size_rot != rot_counter){
		cerr << "Error: size_rot= "<<size_rot<<" != rot_counter= "<<rot_counter<<endl;
		exit(1);
	}
	if (size_pos != pos_counter){
		cerr << "Error: size_pos= "<<size_pos<<" != pos_counter= "<<pos_counter<<endl;
		exit(1);
	}
	// weight ini
	//_weights.insert(_weights.begin(),size_rot,vector<float>(size_rot));
	_pair_number.insert(_pair_number.begin(),size_pos,vector<int>(size_pos));
	// pair_flags
	// ini _pair_flags[size_pos][size_pos]
	_pair_flags.insert(_pair_flags.begin(),size_pos,vector<bool>(size_pos));
	for (int pos1=0;pos1<size_pos;pos1++)
		for (int pos2=0;pos2<size_pos;pos2++){
			_pair_flags[pos1][pos2] = true;
			_pair_number[pos1][pos2] = -1;
		}
	ifstream is_flg(flag_file);
        if (!is_flg) {
                cerr << flag_file<<" file not found!" << endl;
                exit(1);
        }
	while(is_flg.getline(buffer,BUFFER_SIZE)) {
		int pos1, pos2;
		istrstream is(buffer);
		is >> pos1 >> pos2;
		#ifdef DEBUG
		cerr <<"flag "<<pos1<<" "<<pos2<<" set to 0"<<endl;
		#endif
		_pair_flags[pos1][pos2] = false;
		_pair_flags[pos2][pos1] = false;
		_pair_number[pos1][pos2] = -1; // no inter (outside cut-off)
		_pair_number[pos2][pos1] = -1; // no inter (outside cut-off)
	}
	is_flg.close();
	int pair_counter = 0;
	for (int pos1=0;pos1<size_pos;++pos1){
		_pair_number[pos1][pos1] = -1; // just in case...
		for (int pos2=pos1+1;pos2<size_pos;++pos2){
			if (_pair_flags[pos1][pos2]){
				_pair_number[pos1][pos2] = pair_counter;
				_pair_number[pos2][pos1] = pair_counter;
				// _opt_weights ini
				vector< vector<float> > pair_weights;
				pair_weights.insert(pair_weights.begin(),(_colors[pos2]).size(),vector<float>((_colors[pos1]).size()));
				_opt_weights.push_back(pair_weights);
				++pair_counter;
			}
		}
	}
	cerr<<"End weight initialization\n";
	// reading of the pair energies .tmp files
	// we add the solvation (add_surface_potential_flag = true)
	#ifdef DEBUG
	cerr<<"size_processes= "<<size_processes<<endl;
	#endif
	for (int process = 0; process < size_processes; process++) {
		char buffer[20];
		sprintf(buffer,"%d",process);
		ifstream pair_energies_is((string("pair_energies")+buffer+".tmp").c_str());
		if (!pair_energies_is) {
			cerr <<string("pair_energies")+buffer+".tmp" <<" file not found!" << endl;
			exit(1);
		}
		ifstream pair_solv_energies_is((string("pair_solv_energies")+buffer+".tmp").c_str());
		if (!pair_solv_energies_is) {
			cerr <<string("pair_solv_energies")+buffer+".tmp" <<" file not found!" << endl;
			exit(1);
		}
		#ifdef DEBUG
		cerr<<"Reading "<<string("pair_energies")+buffer+".tmp" <<endl;
		#endif
		for (int position1 = 0; position1 < size_pos; ++position1){
			for (int rot1=(_colors[position1]).front();rot1<=(_colors[position1]).back();++rot1){
				if ((rot1 % size_processes) != process)
					continue;
				for (int position2 = position1+1; position2 < size_pos; ++position2){
						#ifdef DEBUG
						cerr<<"Pair counter= "<<_pair_number[position1][position2]<<endl;
						#endif
					if (!_pair_flags[position2][position1])
						continue;
					for (int rot2=(_colors[position2]).front();rot2<=(_colors[position2]).back();++rot2){
						#ifdef DEBUG
						cerr<<"rot1= "<<rot1<<" rot2= "<<rot2<<endl;
						cerr<<"_position[rot1]= "<<_position[rot1]<<" _position[rot2]= "<<_position[rot2]<<endl;
						cerr<<"position1= "<<position1<<" position2= "<<position2<<endl;
						#endif
						float pair_ener=9999;
						pair_energies_is >> pair_ener;
						#ifdef DEBUG
						cerr<<"pair_ener= "<<pair_ener<<endl;
						#endif
						if (!pair_energies_is) {
							cerr << "Error: read on pair_energies failed!\nrot1= " << rot1 << " rot2= " << rot2 << endl;
							exit(1);
						}
						float pair_solv_ener;
						pair_solv_energies_is >>pair_solv_ener;
						if (!pair_solv_energies_is) {
							cout << "Error: read on pair_solv_energies failed!\nindices " << rot2 << " " << rot1 << endl;
							exit(1);
						}
						if (_pair_number[_position[rot1]][_position[rot2]]<0){
							cerr << "Position pair "<<_position[rot1]<<" "<<_position[rot2]<<" should not be here"<<endl;
							exit(1);
						}
						// notice that we don't store the diagonal (as position2>position1)
						//_weights[rot2][rot1] = -(((_single_energies[rot1]+_single_energies[rot2])/(size_pos-1))+(pair_ener-pair_solv_ener));
						
						#ifdef DEBUG
						cerr<<"Before _opt_weights "<<_pair_number[_position[rot1]][_position[rot2]]<<" "<<(_opt_weights[_pair_number[_position[rot1]][_position[rot2]]]).size()<<endl;
						#endif
						//(_opt_weights[_pair_number[_position[rot1]][_position[rot2]]])[_rotamer[rot2]][_rotamer[rot1]] = -(((_single_energies[rot1]+_single_energies[rot2])/(size_pos-1))+(pair_ener-pair_solv_ener));
						float surface_potential_factor = 0.5; // this should match with the .einp
						_opt_weights[_pair_number[_position[rot1]][_position[rot2]]][_rotamer[rot2]][_rotamer[rot1]] = -(((_single_energies[rot1]+_single_energies[rot2])/(size_pos-1))+(pair_ener-surface_potential_factor*pair_solv_ener));
						if (rot1 >= size_rot || rot2 >= size_rot){
							cerr << "Error: computePairEnergies BUG: index too high\nrot1= "<<rot1<<" rot2= "<<rot2<<" size_rot= "<<size_rot<<endl;
							exit(1);
						}
					}// end rot2 loop
				}// end position2 loop
			}// end rot1 loop
		}// end position1 loop
		pair_energies_is.close();
		pair_solv_energies_is.close();
	}// end process loop
	cerr<<"End process loop\n";
}

Weights::Weights(char* name){
	ifstream is(name);
        if (!is) {
                cerr << "file not found!" << endl;
                exit(1);
        }
        // read graph file
	int size_colors;  // sz_pos  (color=position)
        is >> size_colors;
                //cout << "number colors " << size_colors << endl;
        int next_color, old_color = 0;
        _colors.insert(_colors.begin(),size_colors,list<int>() );      
        for (int color = 0; color < size_colors; ++color) {
                is >> next_color;  // cumulative_rotamers  (total # of rotamers acumulated until the given position=color)
                for (int i = old_color; i < next_color; ++i)
                        _colors[color].push_back(i);   // rotamer # (starting from 0 at the first position) = Rotamer::_index
                old_color = next_color;
        }

        int size_nodes;   // size_rot
        is >> size_nodes; // = old_color

        float weight;
        _weights.insert(_weights.begin(),size_nodes,vector<float>());
        int row, column;
        for (row = 0; row < size_nodes; ++row) {
                for (column = 0; column <= row; ++column) {
                        is >> weight;
			if (!is){
				cerr << "Error: reading of graph file ended prematurely at "<< row<<" "<<column<<endl;
				exit(1);
			}
                        _weights[row].push_back(-weight);  // -{(rot_ener[row]+rot_ener[column])/(sz_pos - 1)+_pair_energies[row][column]}
                }
	}
	is.close();
	// end of reading .gra file
}

float Weights::energy(vector<int> nodes) const {
	float weight_sum = 0;
	for (unsigned int color=0; color<_colors.size();++color){
		for (unsigned int color2=0; color2<color;++color2){
			if (_weights.size()>0)
				weight_sum += _weights[nodes[color]][nodes[color2]];
			else 
				weight_sum += weight(nodes[color], nodes[color2]);
		}
	}
	return -weight_sum;
}

void Weights::computeMaximum(float below_maximum, int heuristic_cycles) {
	_max_weight = -LARGE_FLOAT;
	vector<int> seq_walk;
	vector<int>& state = _state; // the vector state contains the current rotamer configuration
	
	for (int pos = 0; pos < _mono_size_pos; ++pos){
		seq_walk.push_back(pos);
		state.push_back(-1);
	}

	// the vector _nodes contains the current rotamer configuration
	float average_time=0;
	// main heuristic loop
	for (; heuristic_cycles; --heuristic_cycles) {
		clock_t ticks = clock();
				
		// random initial state
		for (int pos = 0; pos < _mono_size_pos; ++pos)
			state[pos] = _rotamers_dimer[pos].front()+ (int)(drand48()*_rotamers_dimer[pos].size());
		
		#ifdef DEBUG
		cerr<<"Initial state ";
		copy(state.begin(),state.end(),ostream_iterator<int>(cerr," ") );
		cerr<<endl;
		#endif
		// we could dynamically change the length of the improvement cycle
		int cycles = 500;  // it seems better not to increase this number (we prefer sampling over following a given minimum)
		bool improvement = true;
		while (improvement && cycles--) {  // improvement loop
			random_shuffle(seq_walk.begin(),seq_walk.end());
			improvement = false;
			for (int i = 0; i < _mono_size_pos; ++i) {  // loop over positions, but traversing randomly
				int& position = seq_walk[i];
				int best_rot = -1;
				#ifdef DEBUG
				cerr<<"cycle "<<heuristic_cycles<<" "<<cycles<<" "<<i<<" "<<state[position]<<" "<<_rotamers_dimer[position].front()<<" "<<_rotamers_dimer[position].back()<<endl;
				#endif
				float max_weight = -LARGE_FLOAT;
				// let's mutate a single position to all possible rot's
				for (int rot = _rotamers_dimer[position].front();  // loop over rotamers
						rot <= _rotamers_dimer[position].back(); ++rot) {
					float weight_sum = 0;
					// let's compute the sum of the pair energies involving this rot
					// against the environment of the others (notice that when pos2=position then weight=0).
					for (int pos2 = 0; pos2 < _mono_size_pos; ++pos2)
						weight_sum += weight_dimer(rot,state[pos2]);
					if (weight_sum > max_weight) {
						max_weight = weight_sum;
						best_rot = rot;
					}
				#ifdef DEBUG
				cerr<<rot<<" weight= "<<weight_sum<<endl;
				#endif
				}
				if (state[position] != best_rot) {
					improvement = true;
					state[position] = best_rot;
				}
					
				collectBestNodes(true,below_maximum);
			} // end loop over positions
			
			#ifdef DEBUG
			cout<<"End of cycle "<<cycles<<endl;
			#endif
			
		}  // end improvement loop
		average_time+=float(clock() - ticks)/CLOCKS_PER_SEC;
		if (heuristic_cycles%1000==0){
			cout << "average time spent for a heuristic loop: " << average_time/1000 << endl;
			cout<<"End of heuristic cycle # "<<heuristic_cycles<<" and last cycle= "<<cycles+1<<endl;
			cout << heuristic_cycles*average_time/1000 << " seconds to completion"<<endl;
			average_time=0;
		}
	}  // end heuristic loop
	printSolutions(true,_max_weight - below_maximum);
}

void Weights::collectBestNodes(bool below_flag, float below_maximum) {
	float total_weight = 0;
	const vector<int>& state = _state; // the vector state contains the current rotamer configuration
	for (int pos = 0; pos < _mono_size_pos; ++pos) {
		for (int pos2 = pos+1; pos2 < _mono_size_pos; ++pos2)
			total_weight += weight_dimer(state[pos],state[pos2]);
	}
	
	#ifdef DEBUGALF
	cout<<"total_weight= "<<total_weight<<endl;
	#endif
	
	if (total_weight > _max_weight) {
		_max_weight = total_weight;
		cout << "new weight " << total_weight << endl;
		// we print the best solution found till now:
		//copy(state.begin(),state.end(),ostream_iterator<int>(cout," ") );
		for (vector<int>::const_iterator it_rot = state.begin();it_rot != state.end(); ++it_rot)
			cout<<(_old_rot[*it_rot]).first<<" ";
		for (vector<int>::const_iterator it_rot = state.begin();it_rot != state.end(); ++it_rot)
			cout<<(_old_rot[*it_rot]).second<<" ";
		cout<<endl;
	}
	if (below_flag && total_weight > _max_weight - below_maximum)
		addToSolutions(total_weight,state);
}

void Weights::addToSolutions(float cost, const vector<int>& state) {
        _solutions[cost] = state;
}

void Weights::printSolutions(bool below_flag, float lower_limit) const{
	cout << "combinations" << endl;
	for (map<float, vector<int> >::const_iterator it_solution = _solutions.begin();
		it_solution != _solutions.end(); ++it_solution){
		if ((!below_flag)||((*it_solution).first >lower_limit)){
			const vector<int>& state = (*it_solution).second;
			cout << "cost " << (*it_solution).first << " ";
			//copy(state.begin(),state.end(),ostream_iterator<int>(cout," ") );
			for (vector<int>::const_iterator it_rot = state.begin();it_rot != state.end(); ++it_rot)
				cout<<(_old_rot[*it_rot]).first<<" ";
			for (vector<int>::const_iterator it_rot = state.begin();it_rot != state.end(); ++it_rot)
				cout<<(_old_rot[*it_rot]).second<<" ";
			cout<<endl;
		}
	}
}

istream& Weights::readRotCodes(istream& is) {
	int size_pos2 = size_pos();
	int size_rot2 = size_rot();
	cerr<<"We have "<<size_pos2<<" positions and "<<size_rot2<<" rotamers"<<endl;
	int i;
	char code;
	// we don't care about the sequence
	//cerr<<"Reading sequence: ";
	for (i = 0; i < size_pos2; ++i) {
		is >> code;
		//_initial_sequence.push_back(code);
		//cout<<code<<" ";
	}
	//cout<<endl;
	for (i = 0; i < size_rot2; ++i) {
		if (!(is >> code))
			break;
		_rot_codes.push_back(code);
	}
	if (i<size_pos2){
		cerr<<"Weights::readRotCodes Error: read only "<<i<<" aa codes, but expected "<<size_pos2<<endl;
		exit(1);
	}
	
	_size_pos = size_pos();
	_mono_size_pos = int(size_pos2/2);
	if (2*_mono_size_pos != size_pos2){
		cerr<<"Error: size_pos is not an even number, do we have a dimer?\n";
		exit(1);
	}
	_rotamers_dimer.insert(_rotamers_dimer.begin(),_mono_size_pos,list<int>() );
	int rot_counter = 0;
	for (int position = 0; position < _mono_size_pos; ++position){
		int position2 = position + _mono_size_pos;
		for (int i=(rotamers(position)).front();i<=(rotamers(position)).back();++i){
			for (int j=(rotamers(position2)).front();j<=(rotamers(position2)).back();++j){
				if (_rot_codes[i]!=_rot_codes[j])
					continue; // homodimer!
				// those rotamers with an aa type the other position (at the other monomer) doesn't have are not considered
				_old_rot.push_back(pair<int,int>(i,j));
				// the single energy is given by each single energy + pair energy b/w both positions
				// which after some little algebra gives
				float dimer_single_energy = weight(i,j) + ((float(size_pos2-2)/float(size_pos2-1))*(_single_energies[i] + _single_energies[j]));
				_dimer_single_energies.push_back(dimer_single_energy);
				_rotamers_dimer[position].push_back(rot_counter);
				rot_counter++;
			}
		}
	}
	return is;
}

ostream& Weights::printDimerGraph(ostream& os) const{
	int size_rot2 = size_rot();
	cout<<_mono_size_pos<<endl;
	int rot = 0;
	for (int position = 0; position < _mono_size_pos; ++position){
		int position2 = position + _mono_size_pos;
		for (int i=(rotamers(position)).front();i<=(rotamers(position)).back();++i){
			for (int j=(rotamers(position2)).front();j<=(rotamers(position2)).back();++j){
				if (_rot_codes[i]!=_rot_codes[j])
					continue; // homodimer!
				++rot;
			}
		}
		cout<<rot<<" ";
	}
	cout<<endl<<endl<<rot<<endl<<endl<<endl;
	int new_size_rot = rot;
	cerr<<"new_size_rot= "<<new_size_rot<<" old size_rot= "<<size_rot2<<endl;
        for (int row = 0; row < new_size_rot; ++row) {
		for (int column = 0; column <= row; ++column) {
			cout<<0-weight_dimer(row, column)<<" ";
                }
		cout<<endl;
	}
	return os;
}

int main(int argc, char* argv[]) {
	// This is opt_dimer with a random seed improvement: if the variable RSEED is defined
	// then its value is taken as seed. For instance, add the following before executing (csh):
	// # Random seed according to the task id and process id:
	// set seed=`awk 'BEGIN{printf("'$TASK_ID'%s\n",substr("'$$'00000",1,5))}'`
	// setenv RSEED $seed
	//
	// here $TASK_ID contains the virtual node number, which should be unique.
	cerr<<"opt_dimer created by Alfonso Jaramillo. Version "<<__DATE__<<endl;
	if (argc < 5) {
                cout << "usage: gra2dimer file.sing.dmp file.rta numer_of_processes below_maximum heuristic_cycles" << endl;
                exit(1);
        }
	long what_seed;
	// we'll read a random seed from the RSEED variable if defined
	char* rseed = getenv("RSEED");
	if (rseed == NULL){
		// seed not defined, we'll take it from the current time
		(void)time(&what_seed);
	} else {
		what_seed = strtol(rseed, (char **)NULL, 10);
		cout<<"Using seed "<<what_seed<<endl;
		if (what_seed==LONG_MIN||what_seed==LONG_MAX){
			cout<<"Fatal error reading the seed: "<<rseed<<endl;
			exit(1);
		}
	}
	srand48(what_seed);
	int size_processes = 0;
	sscanf(argv[3],"%d",&size_processes);
        Weights weights(argv[1],"flags",size_processes);
	char* rot_codes_file = argv[2];
	cerr<<"rotamer codes file= "<<rot_codes_file<<endl;
	ifstream ifs(rot_codes_file);
	if (!ifs){
		cerr<<"Error: cannot open "<< rot_codes_file <<" file!"<<endl;
		exit(1);
	}
	weights.readRotCodes(ifs);
	ifs.close();
	//weights.printDimerGraph(cout);
	int size_pos = weights.size_pos();  //(color=position)
        //int size_rot = weights.size_rot();
	
	//cerr<<"size_pos= "<< size_pos<<" size_rot= "<<size_rot<<endl;
	float below_maximum; 
	int heuristic_cycles;
	sscanf(argv[4],"%f",&below_maximum);
	sscanf(argv[5],"%d",&heuristic_cycles);
	weights.computeMaximum(below_maximum, heuristic_cycles);
	exit(0);
	//int size_nodes = weights.size_rot();
	
	vector<int> fix(argc);
	vector<int> fix2(argc-2);
	vector<bool> pos_flag(size_pos);
	for (int i=2; i < argc; ++i){
		sscanf(argv[i],"%d",&fix[i]);
		fix2[i-2]=fix[i];
	}
	float weight_sum = 0;
	for (int color=0; color<size_pos;++color){
		for (int color2=0; color2<color;++color2)
			weight_sum += weights(fix2[color],fix2[color2]);
	}
	cout<<weights.energy(fix2)<<" "<<weight_sum<<endl;
	int new_size_pos = 0;
	for (int position = 0; position < size_pos; ++position){
		bool remove = false;
		#ifdef DEBUG
		cout<<position<<": "<<(weights.rotamers(position)).front()<<"-"<<(weights.rotamers(position)).back();
		#endif
		for (int i=2; i < argc; ++i){
			if (fix[i]>=(weights.rotamers(position)).front()&&fix[i]<=(weights.rotamers(position)).back())
				remove = true;
		}
		if (!remove){
			++new_size_pos;
			pos_flag[position] = true;
		}else {
			#ifdef DEBUG
			cout<<" removed";
			#endif
			pos_flag[position] = false;
		}
		#ifdef DEBUG
		cout<<endl;
		#endif
	}
	/* 
	// output new .gra file
	cout<<new_size_colors<<endl;
	vector<int> old_numeration(size_nodes);
	vector<bool> nodes_flag(size_nodes);
	for (row = 0; row < size_nodes; ++row)
		nodes_flag[row]=false;
	int rot = 0;
	for (int color = 0; color < size_colors; ++color){
		if (colors_flag[color]){
			for (int i=(colors[color]).front();i<=(colors[color]).back();++i){
				old_numeration[rot]=i;
				nodes_flag[i]=true;
				++rot;
			}
			cout<<rot<<" ";
		}
	}
	cout<<endl<<endl<<rot<<endl<<endl<<endl;
        for (row = 0; row < size_nodes; ++row) {
                for (column = 0; column <= row; ++column) {
                        if (nodes_flag[row]&&nodes_flag[column])
				cout<<-1.0*weights[row][column]<<" ";
                }
		if (nodes_flag[row])
			cout<<endl;
	} 
	*/
	return 0;
}
