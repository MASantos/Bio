#include<fstream>
#include<cstdlib>
#include<strstream>
#include<iostream>

using namespace std; //Added to orginal source to compile with gcc3.x

double _energy_gap;
int _dee_short_flag;
int _size_processes;

		// That's for the C DEE program (will be changed later)
extern "C" {
	double** Reduced_Energies = 0;
	int** dead_pair = 0;
	int* dead_single = 0;
	double** dmatrix(long,long,long,long);
	void free_dmatrix(double**,long,long,long,long);
	int** imatrix(long,long,long,long);
	int* first_rotamer = 0;
	int* last_rotamer = 0;
	int* alive_rotamer = 0;
	void Dead_End(int sz_pos, int* dead_single,
			int** dead_pair, double energy_gap, int short_calculation);
	void Dead_End_Parallel(int sz_pos, int* dead_single,
			int** dead_pair, double energy_gap, int size_processes);
	int verbose = 1;
}

void deadEndElimination(istream& is) {
	int sz_pos;
	is >> sz_pos;
	
	if (first_rotamer)
		free(first_rotamer);
	first_rotamer = (int*)calloc(sz_pos+1+10,sizeof(int));
	if (last_rotamer)
		free(last_rotamer);
	last_rotamer = (int*)calloc(sz_pos+1+10,sizeof(int));

	int cumulative_rotamers = 0;
	int i;
	for (i = 0; i < sz_pos; ++i) {
		first_rotamer[i+1] = cumulative_rotamers + 1;
		is >> cumulative_rotamers;
		last_rotamer[i+1] = cumulative_rotamers;
	}

	int sz_rot;
	is >> sz_rot;

	if (Reduced_Energies)
		free_dmatrix(Reduced_Energies,0,sz_rot+10,0,sz_rot+10);
	Reduced_Energies = dmatrix(0,sz_rot+10,0,sz_rot+10);

	int j;
	double energy;
	for (i = 0; i < sz_rot; ++i)
		for (j = 0; j <= i; ++j) {
			is >> energy;
			Reduced_Energies[i+1][j+1] = Reduced_Energies[j+1][i+1] = energy;
		}

	dead_pair = imatrix(0,sz_rot,0,sz_rot);
	dead_single = (int*)calloc(sz_rot+1,sizeof(int));
	alive_rotamer = (int*)calloc(sz_rot+1,sizeof(int));

	for (i = 1; i < sz_rot + 1; ++i) {
		dead_single[i] = 0;
		for (j = 1; j < sz_rot + 1; ++j)
			dead_pair[i][j] = dead_pair[j][i] = 0;
	}

	//computePairEnergies();
	cout << "calling DEE " << endl;
	if (_size_processes <= 1)
		Dead_End(sz_pos, dead_single, dead_pair,
				_energy_gap, _dee_short_flag);
	else
		Dead_End_Parallel(sz_pos, dead_single, dead_pair,
				_energy_gap,_size_processes);
	cout << "DEE OK " << endl;
	cout << "dead_rotamers" << endl;
	cout << sz_rot << endl;
	for (i = 0; i < sz_rot; ++i)
		cout << dead_single[i+1] << " ";
	cout << endl;
}

int main(int argc, char* argv[]) {

	if (argc != 5) {
		cout << "usage: " << argv[0]
				<< " <filename> <energy gap> <short_flag> <number procs> "
				<< endl
				<< " filename ... file name of a *.gra energy file "
				<< endl
				<< " short_flag ... 1 skips the pair-pair calculation "
				<< endl
				<< " number procs ... number of processes "
				<< endl;
		exit(1);
	}
	
	ifstream is(argv[1]);
	if (!is) {
		cout << "cannot open file " << argv[1] << endl;
		exit(1);
	}

	istrstream istr2(argv[2]);
	istr2 >> _energy_gap;

	istrstream istr3(argv[3]);
	istr3 >> _dee_short_flag;

	istrstream istr4(argv[4]);
	istr4 >> _size_processes;

	deadEndElimination(is);
}

