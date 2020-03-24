#include<iostream.h>
#include<fstream.h>
#include<list.h>
#include<vector.h>
#include<map.h>
#include<set.h>
#include<algo.h>

#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#include<signal.h>
#include<math.h>
#include<ctime>
#include<string>
using namespace std;

#define STATISTICS

const float LARGE_FLOAT = 1e25;
const int LARGE_INT = 60000;

#ifdef STATISTICS
int size_opt_problems = 0;
#endif
int size_solutions = 0;

// very bad, but I am tired of fiddling trivial flags
// through class hierarchies
int _higher_order_flag = 0;

//                   Functional objects

struct FabsDifference  {
	float operator()(float a, float b) {
		return fabs(a-b);
	}
};


	
//                      The graph



class MultiPartiteGraph {
public:
	MultiPartiteGraph();

		// Queries

	int sizeNodes() const;

	int sizeColors() const;

	const vector<float>& edgeWeights(int node) const;
		// vector of weights to ALL other nodes
		// require: 0 <= node < sizeNodes()

	int colorIndex(int color) const;
		// starting index for color in the above edgeWeights() vector
		// for the end index use color+1
		// require: 0 <= color < sizeColors() + 1

	float edgeWeights(int node1, int node2) const;
		// weight between arbitrary nodes
		// require: 0 <= node1, node2 < sizeNodes()

	const vector< list<int> >& colors() const;

		// Input, output

	friend istream& operator>>(istream& is, MultiPartiteGraph& graph);
		// adds all symmetric edges
		// require: well formed graph input file

	//friend ostream& operator<<(ostream& is, const MultiPartiteGraph& graph);

private:
	vector< vector<float> > _weights;
	vector< list<int> > _colors;
	vector<float> _node_weights;
	vector< vector<float> > _pure_weights;
};


MultiPartiteGraph::MultiPartiteGraph() {
}


int MultiPartiteGraph::sizeNodes() const {
	return _weights.size();
}


int MultiPartiteGraph::sizeColors() const {
	return _colors.size();
}


const vector<float>& MultiPartiteGraph::edgeWeights(int node) const {
	#ifdef REQUIRE
		assert(0 <= node && node < sizeNodes());
	#endif
	return _weights[node];
}


int MultiPartiteGraph::colorIndex(int color) const {
	#ifdef REQUIRE
		assert(0 <= color && color <= sizeColors());
	#endif
	return color < sizeColors() ? _colors[color].front() : sizeNodes();
}


float MultiPartiteGraph::edgeWeights(int node1, int node2) const {
	#ifdef REQUIRE
		assert(0 <= node1 && node1 < sizeNodes());
		assert(0 <= node2 && node2 <= sizeNodes());
	#endif
	return _weights[node1][node2];
}


const vector< list<int> >& MultiPartiteGraph::colors() const {
	return _colors;
}


istream& operator>>(istream& is, MultiPartiteGraph& graph) {
	int size_colors;  // sz_pos  (color=position)
	is >> size_colors;
	#ifdef SHOW
		cout << "number colors " << size_colors << endl;
	#endif
	int next_color, old_color = 0;
	graph._colors.insert(graph._colors.begin(),
			size_colors,list<int>() );	
	for (int color = 0; color < size_colors; ++color) {
		is >> next_color;  // cumulative_rotamers  (total # of rotamers acumulated until the given position=color)
		for (int i = old_color; i < next_color; ++i)
			graph._colors[color].push_back(i);   // rotamer # (starting from 0 at the first position) = Rotamer::_index
		old_color = next_color;
		#ifdef SHOW
			cout << "  color " << color << ": ";
			copy(graph._colors[color].begin(),
					graph._colors[color].end(),ostream_iterator<int>(cout," "));
			cout << endl;
		#endif
	}

	int size_nodes;   // size_rot
	is >> size_nodes; // = old_color

	float weight;
	graph._weights.insert(graph._weights.begin(),
			size_nodes,vector<float>());
	int row, column;
	for (row = 0; row < size_nodes; ++row) {
		#ifdef SHOW
			//cout << row << ": ";
		#endif
		for (column = 0; column <= row; ++column) {
			is >> weight;
			if (!is){
				cerr << "Error: reading of graph file ended prematurely at "<< row<<" "<<column<<endl;
				exit(1);
			}
			graph._weights[row].push_back(-weight);  // -{(rot_ener[row]+rot_ener[column])/(sz_pos - 1)+_pair_energies[row][column]}
			#ifdef SHOW
				//cout << graph._weights[row].back() << " ";
			#endif
		}
		#ifdef SHOW
			//cout << endl;
		#endif
	}
		// symmetrize
	for (row = 0; row < size_nodes; ++row) {
		#ifdef SHOW
			//cout << row << ": ";
		#endif
		for (column = row+1; column < size_nodes; ++column) {
			graph._weights[row].push_back(
					graph._weights[column][row]);
			#ifdef SHOW
				//cout << graph._weights[row].back() << " ";
			#endif
		}
		#ifdef REQUIRE
			assert(graph._weights[row].size() == size_nodes);
		#endif
		#ifdef SHOW
			//cout << endl;
		#endif
	}

	float problem_size = 1;
	vector<int> size_rotamers;
	int i;
	for (i = 0; i < graph._colors.size(); ++i) {
		problem_size *= graph._colors[i].size();
		size_rotamers.push_back(graph._colors[i].size());
	}
	cout << "problem size " << problem_size << endl << endl;
	cout << "level rotamers combinations:" << endl;
	sort(size_rotamers.begin(),size_rotamers.end());
	float combinations = 1;
	for (i = 0; i < size_rotamers.size(); ++i) {
		combinations *= size_rotamers[i];
		cout << i << " " << size_rotamers[i]
				<< " " << combinations << endl;
	}
	cout << endl;
	return is;
}





//                        Branch and Bound



typedef list<int> SetOfNodes;

class Problem {
public:
	virtual ~Problem() { }

		// Modifiers

	virtual void improveUpperBound(
			float current_lower_bound,
			float below_maximum = 0) = 0;
		// ensure: upperBound() <= old upperBound()
		//          || isInfeasible()

		// Queries

	virtual bool isInfeasible() const = 0;
		// has no solution given the current_lower_bound

	virtual bool isComplete() const = 0;

	virtual float upperBound() const = 0;

	virtual void setOfNodes(SetOfNodes& set_of_nodes) const = 0;
	// returns the unique nodes for the colors
		// in set_of_nodes
		// require: isComplete() == true

		// Operators

	bool operator<(const Problem& b) const {
		return upperBound() < b.upperBound();
	}

	bool operator>(const Problem& b) const {
		return upperBound() > b.upperBound();
	}

		// Function objects

	class UpperBoundLess : public binary_function<Problem,float,bool> {
	public:
		bool operator()(const Problem& a, float b) const {
			return a.upperBound() < b;
		}
	};

	class UpperBoundGreater : public binary_function<Problem,float,bool> {
	public:
		bool operator()(const Problem& a, float b) const {
			return a.upperBound() > b;
		}
	};

	class UpperBoundMax : public binary_function<float,Problem,float> {
	public:
		float operator()(float b, const Problem& problem) {
			return problem.upperBound() > b ? problem.upperBound() : b;
		}
	};
};



class Solution {
public:
	Solution();

		// Modifiers

	void setNodes(const Problem& problem);
		// sets nodes to unique nodes of problem
		// require: problem.isComplete()

	void setNodes(float cost, const vector<int>& nodes);

		// Queries

	float cost() const;

		// Input, output

	friend ostream& operator<<(ostream& os,
			const Solution& solution
		);

		// Function objects

	class CostGreater : public binary_function<Solution,float,bool> {
	public:
		bool operator()(const Solution& a, float b) const {
			return a.cost() > b;
		}
	};

	class CostBelow : public binary_function<Solution,float,bool> {
	public:
		bool operator()(const Solution& a, float b) const {
			return a.cost() < b;
		}
	};

private:
	float _cost;
	SetOfNodes _nodes;
};
	

Solution::Solution()
		: _cost(0), _nodes() {
}


float Solution::cost() const {
	return _cost;
}


void Solution::setNodes(const Problem& problem) {
	_cost = problem.upperBound();
	problem.setOfNodes(_nodes);
}


void Solution::setNodes(float cost, const vector<int>& nodes) {
	_cost = cost;
	copy(nodes.begin(),nodes.end(),back_inserter(_nodes));
}


ostream& operator<<(ostream& os, const Solution& solution) {
	os << "cost " << solution._cost << " ";
	copy(solution._nodes.begin(),
			solution._nodes.end(),ostream_iterator<int>(os," ") );
	return os;
}




class BranchAndBound {
public:
	virtual ~BranchAndBound() { }

		// Modifiers

	virtual float computeMaximum(
			float initial_lower_bound = -LARGE_FLOAT,
			float below_maximum = 0
		);
		// 

		// Queries

	virtual const list<Solution>& solutions() const;
		// all complete problems with costs c
		// maximum - below_maximum <= c <= maximum

protected:
	//SetOfNodes _best_set_of_nodes; ?
	list<Solution> _solutions;
	list<Solution> _possible_solutions;

		// Abstract virtual modifiers

	virtual void setUpProblems() = 0;
		// sets up problem list

	virtual void eraseAllProblemsBelow(float bound) = 0;
		// erases all problems with upperBound() < bound

	virtual void eraseProblem() = 0;
		// erases nextProblem()

	virtual void generateSplitProblems(
			float lower_bound_on_max, float below_maximum) = 0;
		// splits nextProblem() into subproblems and
    // tries to find best possible bound
		// using lower_bound_on_max and below_maximum
		// includes eraseProblem()

		// Abstract virtual queries

	virtual int sizeProblems() const = 0;
		// how many problems in list

	virtual const Problem& nextProblem() const = 0;
		// gets one problem from list

	virtual float upperBoundOnProblems() const = 0;

		// Modifiers

	virtual void addToSolutions(const Problem& problem);
		// require: problem.isComplete()

	virtual void eraseSolutionsBelow(float bound);
		// erases all solutions with cost() < bound

	virtual void checkForSureSolutions(float lower1, float lower2);
		// print good problems with value above
		// maximum of upperbound
};


//BranchAndBound::BranchAndBound()
//		: _best_set_of_nodes(), _solutions(), _possible_solutions() {
//}


float BranchAndBound::computeMaximum(
		float initial_lower_bound,
		float below_maximum) {
	float lower_bound_on_max = initial_lower_bound;
	float upper_bound_on_max = LARGE_FLOAT;
	float upper_bound_on_problems;
	//float cost;

	setUpProblems();
	while (sizeProblems() > 0) {
		const Problem& problem = nextProblem();
		if (problem.upperBound() < lower_bound_on_max - below_maximum
				|| problem.isInfeasible() ) {
			eraseProblem();
		}
		else if (problem.isComplete()) {
			if (problem.upperBound() > lower_bound_on_max) {
				#ifndef SILENT
					cout << "new lower_bound " << problem.upperBound() << endl;;
				#endif
				lower_bound_on_max = problem.upperBound();
				eraseAllProblemsBelow(lower_bound_on_max - below_maximum);
			}
			if (problem.upperBound() >= lower_bound_on_max - below_maximum)
				addToSolutions(problem);
			eraseProblem();
		}
		else {
				// problem is neither complete
				// nor is upperBound strong enough for elimination
				// splitting into subproblems necessary
			generateSplitProblems(lower_bound_on_max,below_maximum);
		}
		upper_bound_on_problems = upperBoundOnProblems();
		if (upper_bound_on_problems < upper_bound_on_max) {
			upper_bound_on_max = upper_bound_on_problems;
			#ifndef SILENT
				cout << "new UPPER bound " << upper_bound_on_max << endl;
			#endif
		}
		checkForSureSolutions(upper_bound_on_max, lower_bound_on_max - below_maximum);
		if (upper_bound_on_problems < lower_bound_on_max - below_maximum)
			break;
	}
	eraseSolutionsBelow(lower_bound_on_max - below_maximum);
	return lower_bound_on_max;
}


void BranchAndBound::addToSolutions(const Problem& problem) {
	#ifdef REQUIRE
		assert(problem.isComplete());
	#endif
	#ifdef SHOW
		cout << "adding problem " << problem.upperBound() << endl;
	#endif
	_possible_solutions.push_back(Solution());
	_possible_solutions.back().setNodes(problem);
}

	
void BranchAndBound::eraseSolutionsBelow(float bound) {
	#ifndef OLDSTL
	_solutions.remove_if(bind2nd(Solution::CostBelow(),bound));
	#else
	list<Solution>::iterator it_solution, it_del_solution;
	for (it_solution = _solutions.begin();
			it_solution != _solutions.end(); ) {
		if ((*it_solution).cost() < bound) {
			#ifdef SHOW
				cout << "erasing solution " << *it_solution << endl;
			#endif
			it_del_solution = it_solution;
			++it_solution;
			_solutions.erase(it_del_solution);
		}
		else
			++it_solution;
	}
	#endif
}

void BranchAndBound::checkForSureSolutions(float lower1, float lower2) {
	list<Solution>::iterator it_solution, it_del_solution;
	for (it_solution = _possible_solutions.begin();
			it_solution != _possible_solutions.end(); ) {
		if ((*it_solution).cost() > lower1
				&& (*it_solution).cost() > lower2) {
			cout << *it_solution << endl;
			size_solutions++;
			it_del_solution = it_solution;
			++it_solution;
			_solutions.splice(_solutions.end(),
					_possible_solutions,it_del_solution);
			//_solutions.push_back(*it_del_solution);
			//_possible_solutions.erase(it_del_solution);
		}
		else
			++it_solution;
	}
}	

const list<Solution>& BranchAndBound::solutions() const {
	return _solutions;
}




//                    Constraint Problem




class NonfixedNode {
public:
	NonfixedNode(int index, float weight = 0)
			: _index(index), _weight(weight) {
	}

		// Modifiers

	void setWeight(float weight) { _weight = weight; }

	void setWeight1(float weight) { _weight1 = weight; }

	void moveWeight() { _weight = _weight1; }

		// Queries

	int index() const { return _index; } 

	float weight() const { return _weight; }

	float weight1() const { return _weight1; }

	bool operator!=(int index) const { return index != _index; }

	friend ostream& operator<<(ostream& os, const NonfixedNode& node);

private:
	int _index;
	float _weight;
	float _weight1;
};


ostream& operator<<(ostream& os, const NonfixedNode& node) {
	#ifdef SHOW
		os << node._index << "(" << node._weight << ")";
	//#else
		//os << node._index;
	#endif
	return os;
}



class ConstraintsProblem : public Problem {
public:
	ConstraintsProblem(const MultiPartiteGraph& graph);

		// Modifiers

	virtual void initialize();
		// for efficiency (eg "push_back") not in the constructor

	virtual void split(list<ConstraintsProblem>& new_problems);
		// require: *this initialize()'d
		// ensure: push_backs children problems on new_problems
		// the bestSplitColor() is transformed into fixed_nodes

		// Redefined modifiers

	virtual void improveUpperBound(
			float current_lower_bound,
			float below_maximum = 0 );
		// require: *this in list returned by split()
		// 
		// higher order flag:
		// edge weights are taken into account as a node weight
		// computation per node twice as long
		// but for some problems serious reduction in number of nodes
		// and improvement of bound quality (about 1/3 improvement for smaller
		// examples)

		// Redefined queries

	virtual bool isInfeasible() const;

	virtual bool isComplete() const;

	virtual float upperBound() const;

	virtual void setOfNodes(SetOfNodes& set_of_nodes) const;

		// Input, output

	friend ostream& operator<<(ostream& os,
			const ConstraintsProblem& problem);

		// Queries

	int depth() const;

protected:
	const MultiPartiteGraph& _graph;
	float _upper_bound;
	list<int> _fixed_nodes;
	vector< list<NonfixedNode> > _nonfixed_nodes;
		// the problem is defined by the fixed nodes (colors)
		// and a handful of colors with several nodes
	vector<float> _nonfixed_colors_max_weights;
	bool _is_complete;
	bool _is_infeasible;
	int _depth;
	
		// Modifiers

	virtual void fillWithColors(const vector< list<int> >& colors);
		// fills nodes, MUST be called before nodes are used

	virtual void testOnComplete();
		// ensure: _is_complete == true iff all nonfixed singular

	virtual void fillNodeWeightToFixed();
		// ensure: for nonfixed_node b:
		//	if (_nonfixed_node.size() > 1)
		//		b.weight() == weightToFixed(b) / (_nonfixed_colors.size() - 1)
		//	else
		//		b.weight() == weightToFixed(b)

	virtual void computeMaxWeightsUpperBound();
		// ensure: _nonfixed_colors_max_weights[color]
		//		== max_{b from color} 
		//			if (_nonfixed_node.size() > 1)
		//				( weightToNonfixed(b) + b.weight()*(size-1) ) / 2
		//			else
		//				b.weight() 


		// Queries

	virtual float weightToFixed(int node_index) const;
		// ensure: return
		//	sum_{fixed b} weight(node_index,b)

	virtual float weightToNonfixed(int node_index, int node_color) const;
		// require: node_index from _nonfixed_nodes[node_color]
		// ensure: return
		//	sum_{color != node_color}
		//		max_{nonfixed b of color}
		//			weight(node_index,b) + (NonfixedNode b).weight()

	virtual int bestSplitColor() const;
		// require: !isComplete()
		// ensure: returns nonsingular color for splitting
		//	into subproblems


	virtual float totalFixedWeights() const;
		// ensure: return
		//	sum_{fixed_node a} sum_{fixed_node b > a} weight(a,b)

	virtual bool testInvariants() const;

	// Invariants:

		// upperBound() is upper bound

		// isComplete() iff _nonfixed_nodes all singular

		// nonfixed_nodes.size() == _nonfixed_colors_max_weights.size());

		// _upper_bound == accumulate(_nonfixed_colors_max_weights.begin(),
		//		_nonfixed_colors_max_weights.end(),totalFixedWeights() )
};


ConstraintsProblem::ConstraintsProblem(
		const MultiPartiteGraph& graph)
	: _graph(graph),
	_upper_bound(LARGE_FLOAT),
	_is_complete(false),
	_is_infeasible(false),
	_depth(0)
	{
}


void ConstraintsProblem::initialize() {
	fillWithColors(_graph.colors());
}


float ConstraintsProblem::weightToFixed(int node_index) const {
	float weight = 0;
	const vector<float>& weights = _graph.edgeWeights(node_index);
	list<int>::const_iterator it_fixed_node, it_fixed_node_end;
	it_fixed_node = _fixed_nodes.begin(),
	it_fixed_node_end = _fixed_nodes.end();
	for ( ; it_fixed_node != it_fixed_node_end; ++it_fixed_node)
		weight += weights[*it_fixed_node];
	return weight;
}


float ConstraintsProblem::weightToNonfixed(
		int node_index, int node_color) const {
	#ifdef REQUIRE
		assert(
			find(_nonfixed_nodes[node_color].begin(),
					_nonfixed_nodes[node_color].end(), node_index )
				!= _nonfixed_nodes[node_color].end()
		);
	#endif

	const vector<float>& weights = _graph.edgeWeights(node_index);
	int color;
	int size_nonfixed_colors = _nonfixed_nodes.size();
	float max_node_weight;
	list<NonfixedNode>::const_iterator it_node, it_node_end;
	float weight_sum = 0, weight;
	for (color = 0; color < size_nonfixed_colors; ++color) {
		if (color == node_color)
			continue;
		it_node = _nonfixed_nodes[color].begin();
		it_node_end = _nonfixed_nodes[color].end();
		max_node_weight = - LARGE_FLOAT;
		for ( ; it_node != it_node_end; ++it_node) {
			#ifdef FULLSHOW
				cout << " weight to " << (*it_node).index()
						<< " " << weights[(*it_node).index()]
						<< " + " << (*it_node).weight() << endl;
			#endif
			weight = weights[(*it_node).index()] + (*it_node).weight();
			if (weight > max_node_weight)
				max_node_weight = weight;
		}
		#ifdef FULLSHOW
			cout << " adding max_weight " << max_node_weight << endl;
		#endif
		weight_sum += max_node_weight;
	}

	#ifdef FULLSHOW
		cout << "weightsum " << weight << " from node " << node_index
				<< " problem color "
				<< node_color << endl;
		cout << "for " << *this << endl;
	#endif

	return weight_sum;
}


void ConstraintsProblem::improveUpperBound(
		float lower_bound_on_max, float below_maximum) {

	#ifdef SHOW
		cout << "Problem::solveRelaxation with bound "
				<< lower_bound_on_max << " and below " << below_maximum << endl;
	#endif

	if (_is_complete
			|| _upper_bound < lower_bound_on_max - below_maximum) {
		#ifdef SHOW
			cout << "problem " << *this << " complete! " << endl;
		#endif
		return;
	}

	int size_nonfixed_colors = _nonfixed_nodes.size();
	int color;
	assert(size_nonfixed_colors == _nonfixed_colors_max_weights.size());

	list<NonfixedNode>::iterator it_node, it_del_node;
	float node_weight, max_node_weight;
	float upper_bound_save_one;

	#ifdef CHECK
		assert (
			_upper_bound == accumulate(_nonfixed_colors_max_weights.begin(),
					_nonfixed_colors_max_weights.end(),totalFixedWeights() )
		);
	#endif
	bool is_nonfixed_reduced = true;
	int cycle = 4; //_max_nonfixed_reduced_cycles;
	while (is_nonfixed_reduced && cycle--) {
		#ifdef SHOW
			cout << "reduced so new cycle " << endl;
		#endif
		is_nonfixed_reduced = false;

		float weight_mul = 1.0;
		float weight_div = 2.0;

		if (_higher_order_flag) {
			for (color = 0; color < size_nonfixed_colors;
					++color)
				for (it_node = _nonfixed_nodes[color].begin();
						it_node != _nonfixed_nodes[color].end(); ++it_node)
					(*it_node).moveWeight();

			vector<float> direct_weights;
			for (color = 0; color < size_nonfixed_colors;
					++color)
				for (it_node = _nonfixed_nodes[color].begin();
						it_node != _nonfixed_nodes[color].end(); ++it_node)
					direct_weights.push_back(size_nonfixed_colors > 1 ?
							( weightToNonfixed((*it_node).index(),color)
									/ (size_nonfixed_colors - 1)
								+ (*it_node).weight1()
							)
							: (*it_node).weight1() );

			int i = 0;
			for (color = 0; color < size_nonfixed_colors;
					++color)
				for (it_node = _nonfixed_nodes[color].begin();
						it_node != _nonfixed_nodes[color].end(); ++it_node)
					(*it_node).setWeight(direct_weights[i++]);
			weight_mul = 2;
			weight_div = 4;
		}

		for (color = 0; color < size_nonfixed_colors;
				++color) {
			upper_bound_save_one = _upper_bound
					- _nonfixed_colors_max_weights[color];
			max_node_weight = -LARGE_FLOAT;
			#ifdef SHOW
				cout << "upper_save_" << color
						<< " is " << upper_bound_save_one << endl;
			#endif
			for (it_node = _nonfixed_nodes[color].begin();
					it_node != _nonfixed_nodes[color].end(); ) {
				#ifdef SHOW
					cout << "node " << *it_node << endl;
				#endif
				node_weight = size_nonfixed_colors > 1 ?
						( weightToNonfixed((*it_node).index(),color)
							+ weight_mul*(*it_node).weight1() * (size_nonfixed_colors - 1)
						) / weight_div
						: (*it_node).weight1();
				if (node_weight + upper_bound_save_one
						< lower_bound_on_max - below_maximum) {
					#ifdef SHOW
						cout << "del node " << *it_node
								<< " weight " << node_weight << endl;
					#endif
					it_del_node = it_node;
					++it_node;
					_nonfixed_nodes[color].erase(it_del_node);
					is_nonfixed_reduced = true;
				}
				else {
					if (node_weight > max_node_weight)
						max_node_weight = node_weight;
					++it_node;
				}
			}
			#ifdef SHOW
				cout << "max_node_weight " << max_node_weight << endl;
			#endif
			_nonfixed_colors_max_weights[color] = max_node_weight;
			_upper_bound = upper_bound_save_one + max_node_weight;
			if (_nonfixed_nodes[color].size() == 0) {
				_upper_bound = -LARGE_FLOAT;
				_is_infeasible = true;
				return;
			}
		}
	}

	#ifdef SHOW
		cout << "nonreduced exit " << endl;
	#endif

	testOnComplete();
}


void ConstraintsProblem::testOnComplete() {
	_is_complete = true;
	for (int color = 0; color < _nonfixed_nodes.size(); ++color) {
		if (_nonfixed_nodes[color].size() > 1)
			_is_complete = false;
	}
}


int ConstraintsProblem::bestSplitColor() const {
	#ifdef REQUIRE
		assert(!isComplete());
	#endif
	int min_size = LARGE_INT, min_color = -1;
	int size;
	for (int color = 0; color < _nonfixed_nodes.size(); ++color) {
		size = _nonfixed_nodes[color].size();
		if (size > 1 && size < min_size) {
			min_size = _nonfixed_nodes[color].size();
			min_color = color;
		}
	}
	return min_color;
	// return 0; slows it down considerably
}


float ConstraintsProblem::totalFixedWeights() const {
	float total_fixed_weight = 0;
	list<int>::const_iterator
			it_fixed_node = _fixed_nodes.begin(),
			it_fixed_node_end = _fixed_nodes.end(),
			it_fixed_node_suc;
	for ( ; it_fixed_node != it_fixed_node_end; ++it_fixed_node) {
		const vector<float>& weights = _graph.edgeWeights(*it_fixed_node);
		it_fixed_node_suc = it_fixed_node;
		for (++it_fixed_node_suc;
				it_fixed_node_suc != it_fixed_node_end; ++it_fixed_node_suc)
			total_fixed_weight += weights[*it_fixed_node_suc];
	}
	return total_fixed_weight;
}


void ConstraintsProblem::fillNodeWeightToFixed() {
	int color;
	int size_nonfixed_colors = _nonfixed_nodes.size();
	float weight;
	list<NonfixedNode>::iterator it_node;
	for (color = 0; color < size_nonfixed_colors; ++color) {
		for (it_node = _nonfixed_nodes[color].begin();
				it_node != _nonfixed_nodes[color].end();
				++it_node) {
			weight = size_nonfixed_colors > 1 ?
					weightToFixed((*it_node).index())/(size_nonfixed_colors-1)
					: weightToFixed((*it_node).index());
			(*it_node).setWeight(weight);
			(*it_node).setWeight1(weight);
		}
	}
}


void ConstraintsProblem::computeMaxWeightsUpperBound() {
	#ifdef SHOW
		cout << "Problem::computeMaxWeights for " << endl;
		cout << *this << endl;
	#endif
	int size_nonfixed_colors = _nonfixed_nodes.size();
	float node_weight, max_node_weight;

	fillNodeWeightToFixed();
	_upper_bound = totalFixedWeights();

	list<NonfixedNode>::iterator it_node;
	int color;
	
	/* for (color = 0; color < size_nonfixed_colors;
			++color)
		for (it_node = _nonfixed_nodes[color].begin();
				it_node != _nonfixed_nodes[color].end(); ++it_node)
			(*it_node).moveWeight();
	*/

	float weight_mul = 1.0;
	float weight_div = 2.0;

	if (_higher_order_flag) {
		vector<float> direct_weights;
		for (color = 0; color < size_nonfixed_colors;
				++color)
			for (it_node = _nonfixed_nodes[color].begin();
					it_node != _nonfixed_nodes[color].end(); ++it_node)
				direct_weights.push_back(size_nonfixed_colors > 1 ?
						( weightToNonfixed((*it_node).index(),color)
								/ (size_nonfixed_colors - 1)
							+ (*it_node).weight1()
						)
						: (*it_node).weight1() );

		#ifdef SHOW
			cout << "direct_weights :" << endl;
			copy (direct_weights.begin(), direct_weights.end(),
					ostream_iterator<float>(cout," ") );
			cout << endl;
		#endif

		int i = 0;
		for (color = 0; color < size_nonfixed_colors;
				++color)
			for (it_node = _nonfixed_nodes[color].begin();
					it_node != _nonfixed_nodes[color].end(); ++it_node)
				(*it_node).setWeight(direct_weights[i++]);
		weight_mul = 2;
		weight_div = 4;
	}

	for (color = 0; color < size_nonfixed_colors; ++color) {
		max_node_weight = -LARGE_FLOAT;
		for (it_node = _nonfixed_nodes[color].begin();
				it_node != _nonfixed_nodes[color].end();
				++it_node) {
			#ifdef FULLSHOW
				float w = 0;
				node_weight = size_nonfixed_colors > 1 ?
						( (w = weightToNonfixed((*it_node).index(),color))
						+ weight_mul*(*it_node).weight1() * (size_nonfixed_colors-1)
						) / weight_div
						: (*it_node).weight1();
				if (node_weight > max_node_weight)
						max_node_weight = node_weight;
				cout << " to nonfixed for " << (*it_node).index()
						<< " " << w
						<< " + node itself " << (*it_node).weight() << endl;
			#else
				node_weight = size_nonfixed_colors > 1 ?
						( weightToNonfixed((*it_node).index(),color)
						+ weight_mul*(*it_node).weight1() * (size_nonfixed_colors-1)
						) / weight_div
						: (*it_node).weight1();
				if (node_weight > max_node_weight)
						max_node_weight = node_weight;
			#endif
		}
		_nonfixed_colors_max_weights.push_back(max_node_weight);
		_upper_bound += max_node_weight;
	}
}


void ConstraintsProblem::split(
		list<ConstraintsProblem>& new_problems) {
	int split_color = bestSplitColor();
	if (split_color < 0) {
		computeMaxWeightsUpperBound();
		_is_complete = true;
		return;
	}
	//cout << "splitting on color size " << _nonfixed_nodes[split_color].size()
	//		<< endl;
	list<NonfixedNode>::const_iterator it_node;

	#ifdef SHOW
		cout << "Problem::split on " << *this << endl;
	#endif
	
	for (it_node = _nonfixed_nodes[split_color].begin();
			it_node != _nonfixed_nodes[split_color].end();
			++it_node) {	
		#ifdef SHOW
			cout << "splitting on " << *it_node << endl;
		#endif
		new_problems.push_back(ConstraintsProblem(_graph));
		ConstraintsProblem&
				new_problem = new_problems.back();
		new_problem._fixed_nodes = _fixed_nodes;
		new_problem._fixed_nodes.push_back((*it_node).index());
		new_problem._is_complete = true;
		new_problem._depth = _depth + 1;
		for (int color = 0; color < _nonfixed_nodes.size(); ++color) {
			if (color == split_color)
				continue;
			if (_nonfixed_nodes[color].size() == 1) {
				new_problem._fixed_nodes.push_back(
						_nonfixed_nodes[color].front().index() );
				continue;
			}
			new_problem._is_complete = false;
			new_problem._nonfixed_nodes.push_back(
					_nonfixed_nodes[color] );
		}
		new_problem.computeMaxWeightsUpperBound();
		#ifdef SHOW
			cout << "generated new problem " << endl;
			cout << new_problem << endl;
		#endif
	}
}


void ConstraintsProblem::fillWithColors(
		const vector< list<int> >& colors) {
	#ifdef REQUIRE
		assert(_nonfixed_nodes.empty());
	#endif
	list<int>::const_iterator it_color;
	for (int i = 0; i < colors.size(); ++i) {
		_nonfixed_nodes.push_back(list<NonfixedNode>());
		for (it_color = colors[i].begin();
				it_color != colors[i].end(); ++it_color)
			_nonfixed_nodes.back().push_back(NonfixedNode(*it_color));
	}
}



float ConstraintsProblem::upperBound() const {
	return _upper_bound;
}


bool ConstraintsProblem::isComplete() const {
	return _is_complete;
}


bool ConstraintsProblem::isInfeasible() const {
	return _is_infeasible;
}


void ConstraintsProblem::setOfNodes(
		SetOfNodes& set_of_nodes) const {
	#ifdef REQUIRE
		assert(isComplete());
	#endif

	set_of_nodes.erase(set_of_nodes.begin(),set_of_nodes.end());
	set_of_nodes.insert(set_of_nodes.end(),
			_fixed_nodes.begin(),_fixed_nodes.end() );
	for (int color = 0;
			color < _nonfixed_nodes.size();
			++color)
		set_of_nodes.push_back(_nonfixed_nodes[color].front().index());
	#ifdef SHOW
		cout << "current best_nodes ";
		copy(set_of_nodes.begin(),set_of_nodes.end(),
				ostream_iterator<int>(cout," ") );
		cout << endl;
	#endif
}


bool ConstraintsProblem::testInvariants() const {
		// upperBound() is upper bound
		// isComplete() iff _nonfixed_nodes all singular
	return 
			_nonfixed_nodes.size() == _nonfixed_colors_max_weights.size()
			&&
			_upper_bound == accumulate(_nonfixed_colors_max_weights.begin(),
					_nonfixed_colors_max_weights.end(),totalFixedWeights() );
}


ostream& operator<<(ostream& os, const ConstraintsProblem& problem) {
	os << "Problem: " << endl;
	ostream_iterator<int> int_out(os," ");
	os << " fixed nodes: ";
	copy(problem._fixed_nodes.begin(),
			problem._fixed_nodes.end(),int_out);
	os << " (" << problem.totalFixedWeights() << ")";
	os << endl;
	for (int color = 0; color < problem._nonfixed_nodes.size(); ++color) {
		os << " color " << color << ": ";
		copy(problem._nonfixed_nodes[color].begin(),
				problem._nonfixed_nodes[color].end(),
				ostream_iterator<NonfixedNode>(os," ") );
		if (problem._nonfixed_colors_max_weights.size()
				== problem._nonfixed_nodes.size() )
			os << "   max_weight: "
					<< problem._nonfixed_colors_max_weights[color];
		else
			os << "  no max_weight ";
		os << endl;
	}
	os << " _upper_bound: " << problem._upper_bound << endl;
	os << " _is_complete "
			<< problem._is_complete << endl;
	os << " _is_infeasible "
			<< problem._is_infeasible;
	return os;
}


int ConstraintsProblem::depth() const {
	return _depth;
}



//                class ConstraintsBranchAndBound



class ConstraintsBranchAndBound: public BranchAndBound {
public:
	ConstraintsBranchAndBound(const MultiPartiteGraph& graph);

	virtual ~ConstraintsBranchAndBound() { }

		// Input, output

	ostream& printStatistics(ostream& os);

protected:
	const MultiPartiteGraph& _graph;
	list<ConstraintsProblem> _problems;

		// Redefined Modifiers

	virtual void setUpProblems();
		// initializes B&B procedure with first generation of problems
		// on problem stack

	virtual void eraseAllProblemsBelow(float bound);

	virtual void eraseProblem();
		// erases problem at top of stack

	virtual void generateSplitProblems(
			float lower_bound_on_max = LARGE_FLOAT,
			float below_maximum = 0);
		// generates problems from top of stack
		// calculates best upper bound for each

		// Redefined Queries

	virtual int sizeProblems() const;
		// size of problem stack

	virtual const Problem& nextProblem() const;
		// problem at top of stack

	virtual float upperBoundOnProblems() const;
		// problem at top of stack
};


ConstraintsBranchAndBound::ConstraintsBranchAndBound(
		const MultiPartiteGraph& graph)
		: BranchAndBound(), _graph(graph)
		{
}


void ConstraintsBranchAndBound::setUpProblems() {
	_problems.push_back(ConstraintsProblem(_graph));
	_problems.front().initialize();
	#ifdef STATISTICS
	size_opt_problems = 0;
	#endif
	generateSplitProblems();
	#ifdef SHOW
		cout << "begin with stack: ";
		copy(_problems.begin(),_problems.end(),
				ostream_iterator<ConstraintsProblem>(cout,"\n") );
	#endif
}


int ConstraintsBranchAndBound::sizeProblems() const {
	return _problems.size();
}


const Problem& ConstraintsBranchAndBound::nextProblem() const {
	assert(!_problems.empty());

	#ifdef SHOW
		cout << "next problem: " << endl;
		cout << _problems.back() << endl;
	#endif

	#ifdef STATISTICS
	if (++size_opt_problems % 1000 == 0)
		cout << " problem " << size_opt_problems
				<< " depth " << _problems.back().depth()
				<< " stack " << _problems.size()
				<< " solutions " << size_solutions << endl;
	#endif

	return _problems.back();
}


float ConstraintsBranchAndBound::upperBoundOnProblems() const {
	return accumulate(_problems.begin(),_problems.end(),
		-LARGE_FLOAT,Problem::UpperBoundMax() );
}


void ConstraintsBranchAndBound::eraseAllProblemsBelow(float bound) {
	#ifndef OLDSTL
	_problems.remove_if(bind2nd(Problem::UpperBoundLess(),bound));
	#else
	list<ConstraintsProblem>::iterator
			it_problem, it_del_problem;
	for (it_problem = _problems.begin();
			it_problem != _problems.end(); ) {
		if ((*it_problem).upperBound() <= bound) {
			#ifdef SHOW
				cout << "erasing all " << *it_problem << endl;
			#endif
			it_del_problem = it_problem;
			++it_problem;
			_problems.erase(it_del_problem);
		}
		else
			++it_problem;
	}
	#endif
}


void ConstraintsBranchAndBound::eraseProblem() {
	#ifdef SHOW
		cout << "erasing " << _problems.back() << endl;
	#endif
	_problems.pop_back();
}


void ConstraintsBranchAndBound::generateSplitProblems(
		float lower_bound_on_max, float below_maximum) {
	assert(!_problems.empty());
	list<ConstraintsProblem> new_problems;
	_problems.back().split(new_problems);
	if (_problems.back().isComplete()) {
		return;
	}

	list<ConstraintsProblem>::iterator
			it_problem = new_problems.begin();
	for (; it_problem != new_problems.end(); ++it_problem)
		(*it_problem).improveUpperBound(lower_bound_on_max,below_maximum);

	eraseProblem();
	//if (_problems.back().depth() < 7)
		//new_problems.sort(greater<Problem>());
		new_problems.sort();
	//else 
	//new_problems.reverse();
	_problems.splice(_problems.end(),new_problems);
	//_problems.merge(new_problems);
	//_problems.merge(new_problems,greater<Problem>());
}


ostream& ConstraintsBranchAndBound::printStatistics(ostream& os) {
	#ifdef STATISTICS
		os << "total number of problems " << size_opt_problems;
	#endif
	return os;
}



//                class Density


class Density {
public:
	Density();

		// Modifiers

	void loadRandom(int size);
		// loads size probabilities with random numbers
		// and normalizes

	void loadSelect(int size);
		// loads size probabilities with 0 and a random 1

	void setProbabilities(const vector<float>& data);
		// require: normalized: sum p_i = 1

		// Queries

	const vector<float>& probabilities() const;

	float differenceTo(const vector<float>& probabilities) const;
		// L_1 difference to probabilities
		// note: probabilities should be normalized

	int maxIndex() const;
		// index with highest probability
		
		// Utility functions

	static int computeMaxIndex(vector<float> values);
		// index with highest probability
		
	static void convertLinear(vector<float>& values);
		// convert values into density by
		// linear conversion:
		// p_i = (v_i - v_min) & normalize

	static void convertMaximum(vector<float>& values);
		// convert values into density by
		// maximum:
		// p_max  = 1; 0 else

	static void convertRank(vector<float>& values);
		// convert values into density by
		// Rank conversion:
		// p_i = (v_i - v_min) & normalize

	static void convertBoltzmann(vector<float>& values, float beta);
		// convert values into density by
		// Boltzmann conversion:
		// p_i = exp(-beta*v_i) & normalize

	static void normalize(vector<float>& values);
		// require: all data positive
		// ensure: normalized: sum values[i] = 1

		// Input, Output

	friend ostream& operator<<(ostream& os, const Density& density);

	// Invariants

		// accumulate(_probabilities.begin(),_probabilities.end(),
		//     (float)0.0 ) == 1.0 +- eps

private:
	vector<float> _probabilities;
	int _max_index;
};


Density::Density()
	: _probabilities(), _max_index(-1) {
}


void Density::loadRandom(int size) {
	for (; size; --size)
		_probabilities.push_back(drand48());
	normalize(_probabilities);
	_max_index = computeMaxIndex(_probabilities);
}


void Density::loadSelect(int size) {
	_probabilities.erase(_probabilities.begin(),_probabilities.end());
	_probabilities.insert(_probabilities.begin(),(size_t)size,(float)0.0);
	int r = (int)floor(drand48()*size);
	_probabilities[r] = 1;
}


void Density::setProbabilities(const vector<float>& values) {
	#ifdef REQUIRE
		float sum = accumulate(values.begin(),values.end(),(float)0.0);
		assert(1-0.0001 < sum && sum < 1+0.0001);
	#endif
	_probabilities = values;
	_max_index = computeMaxIndex(_probabilities);
	#ifdef SHOW
		cout << " new probs ";
		copy(values.begin(),values.end(),ostream_iterator<float>(cout," "));
		cout << endl;
	#endif
}


const vector<float>& Density::probabilities() const {
	return _probabilities;
}


float Density::differenceTo(const vector<float>& probabilities) const {
	float diff = inner_product(_probabilities.begin(),_probabilities.end(),
			probabilities.begin(),(float)0.0,
			plus<float>(),FabsDifference() );
	#ifdef SHOW
		cout << " difference is " << diff << endl;
	#endif
	return diff;
}			


int Density::maxIndex() const {
	#ifdef CHECK
		assert(_max_index >= 0);
	#endif
	return _max_index;
}


int Density::computeMaxIndex(vector<float> values) {
	float max_prob = -LARGE_FLOAT;
	int max_index = -1;
	for (int i = 0; i < values.size(); ++i) {
		if (values[i] > max_prob) {
			max_prob = values[i];
			max_index = i;
		}
	}
	return max_index;
}


void Density::convertLinear(vector<float>& values) {
	float min_val = *min_element(values.begin(),values.end());
	transform(values.begin(),values.end(),values.begin(),
			bind2nd(minus<float>(),min_val) );
	normalize(values);
}


void Density::convertMaximum(vector<float>& values) {
	int max_index = computeMaxIndex(values);
	fill(values.begin(),values.end(),(float)0.0);
	values[max_index] = 1.0;
}


void Density::convertRank(vector<float>& values) {
	typedef map< float, int, less<float> > SortMap;
	SortMap sort_map;
	int i, size = values.size();
	for (i = 0; i < size; ++i)
		sort_map.insert(SortMap::value_type(values[i],i));
	SortMap::const_iterator it_map = sort_map.begin();
	for (i = 0 ; it_map != sort_map.end(); ++it_map, ++i)
		values[(*it_map).second] = i^2;
	normalize(values);
}


void Density::convertBoltzmann(vector<float>& values, float beta) {
	if (*max_element(values.begin(),values.end()) * beta < -100
			|| *min_element(values.begin(),values.end()) * beta > 100) {
		convertMaximum(values);
		return;
	}
	for(int i = 0; i < values.size(); ++i) {
		float e = values[i] * beta;
		values[i] = e < -100 ? 0 : exp(e);
	}
	normalize(values);
}


void Density::normalize(vector<float>& values) {
	#ifdef REQUIRE
		assert(*min_element(values.begin(),values.end()) >= 0);
	#endif
	float sum = accumulate(values.begin(),
		values.end(),(float)0.0); // (float) conversion essential
	if (sum != 0.0)
		transform(values.begin(),values.end(),values.begin(),
				bind2nd(divides<float>(),sum) );
}


ostream& operator<<(ostream& os, const Density& density) {
	copy(density._probabilities.begin(),density._probabilities.end(),
		ostream_iterator<float>(os," ") );
	return os;
}



//                class Heuristic



class Heuristic {
public:
	Heuristic(const MultiPartiteGraph& graph);

		// Modifiers

	void computePureMaximum(int heuristic_cycles);
		// selects one rotamer from each color
		// the heuristic is started heuristic_cycles times
    // on a new random starting selection

	istream& readRotCodes(istream& is);  // reads rotamer's amino acid codes
	istream& readGraphRes(istream& is);  // reads a .gra.out result file to use as starting positions for exploreMaximum
	void exploreMaximum(float below_maximum, int heuristic_cycles);
	void exploreMaximumRand(float below_maximum, int heuristic_cycles);
	void computeMaximum(float below_maximum, int heuristic_cycles);
		// same as above but collecting all solutions
		// in a window maxWeight() - below_maximum

	void computeDensityMaxima(int heuristic_cycles);
		// works on a node probability distribution
		// for each color
		// the heuristic is started heuristic_cycles times
    // on a new random starting selection

		// Queries

	const list<Solution>& solutions() const;
		// returns the solutions of computeMaximum()

	float maxWeight() const;
		// the maximum weight for computePureMaximum()

		// Input, Output

	ostream& printNodes(ostream& os);

	ostream& printDensityMaxima(ostream& os);
		// outputs the result of the computeDensityMaxima() search
		// in standard form

private:
	const MultiPartiteGraph& _graph;
	vector<int> _nodes;
	vector< vector<int> > _combinations;
	vector<char> _rot_codes;
	vector<char> _initial_sequence;
	int _collect_all_flag; // if 1 then this will tell pairMaximum to call collectBestNodes at each rotamer selection
	float _below_maximum;
	vector< map<char, vector<int> > > _rot_lst;  // rot indices classified by aa and pos
	list<Solution> _solutions;
	set<float> _costs;
	vector<int> _max_nodes;
	float _max_weight;
	float _max_soft_weight;    // max clique weight with density distribution
	float _max_hard_weight;    // max clique weight with single node
	vector<Density> _max_soft_densities;    // the corresponding densities
	vector<Density> _max_hard_densities;

		// Modifiers

	void clearMaxWeights();
		// initializes _max_[soft,hard]_weight;

	void testMaxWeights(const vector<Density>& densities);
		// updates _max_[soft,hard]_weight;

	void addToSolutions(float cost, const vector<int>& nodes);

	void eraseSolutionsBelow(float bound);

	void collectBestNodes(bool below_flag, float below_maximum);

		// Queries
	
	float hardWeight(const vector<Density>& densities) const;
		// the total weight of a clique when the maxIndex() node with
		// highest probability is taken from each color

	float softWeight(const vector<Density>& densities) const;
		// dummy function

	int maxNode(int color, const Density& density) const;
		// the node with the maximum density in color
	
	// It finds the pair of rotamers which give the maximum at positions color, color2
	// maintaining the aa types at the given positions
	float pairMaximum(int color, int color2, int& rot1, int& rot2, char aa1, char aa2);
	// the same, but using a heuristic procedure.
	float pairMaximumHeuristic(int color, int color2, int& rot1, int& rot2, char aa1, char aa2);
	// it computes the solutions around a fixed starting position (a thought global maximum):
};


Heuristic::Heuristic(const MultiPartiteGraph& graph)
	: _graph(graph), _nodes(graph.colors().size()),
	_max_nodes(graph.colors().size() ),
	_collect_all_flag(0) {
}


float Heuristic::maxWeight() const {
	return _max_weight;
}


void Heuristic::computePureMaximum(int heuristic_cycles) {
	vector< list<int> > colors = _graph.colors();
	int color;

	float total_weight;
	_max_weight = -LARGE_FLOAT;
	float weight_sum;

	for (; heuristic_cycles; --heuristic_cycles) {
		for (color = 0; color < colors.size(); ++color) {
			_nodes[color] = _graph.colorIndex(color)
					+ (int)(drand48()*colors[color].size());
		}
		int cycles = 500;
		bool improvement = true;
		list<int>::const_iterator it_node;
		while (improvement && cycles--) {
			improvement = false;
			for (color = 0; color < colors.size(); ++color) {
				int best_node = -1;
				float max_weight = -LARGE_FLOAT;
				for (it_node = colors[color].begin();
						it_node != colors[color].end(); ++it_node) {
					const vector<float>& weights =
							_graph.edgeWeights(*it_node);
					weight_sum = 0;
					for (int color2 = 0; color2 < colors.size(); ++color2)
						weight_sum += weights[_nodes[color2]];
					if (weight_sum > max_weight) {
						max_weight = weight_sum;
						best_node = *it_node;
					}
				}
				if (_nodes[color] != best_node) {
					improvement = true;
					_nodes[color] = best_node;
				}
			}
			total_weight = 0;
			for (color = 0; color < colors.size(); ++color) {
				const vector<float>& weights =
								_graph.edgeWeights(_nodes[color]);
				for (int color2 = color+1; color2 < colors.size(); ++color2)
					total_weight += weights[_nodes[color2]];
			}
			#ifdef SHOW
				cout << "current weight " << total_weight << endl;
			#endif
			if (total_weight > _max_weight) {
				_max_weight = total_weight;
				for (color = 0; color < colors.size(); ++color)
					_max_nodes[color] = _nodes[color];
				cout << "new weight " << total_weight << endl;
			}
		}
	}
}


void Heuristic::addToSolutions(float cost, const vector<int>& nodes) {
	if (_costs.find(cost) == _costs.end()) {
		_solutions.push_back(Solution());
		_solutions.back().setNodes(cost,nodes);
		_costs.insert(cost);
	}
}

	
void Heuristic::eraseSolutionsBelow(float bound) {
	#ifndef OLDSTL
	_solutions.remove_if(bind2nd(Solution::CostBelow(),bound));
	#else
	list<Solution>::iterator it_solution, it_del_solution;
	for (it_solution = _solutions.begin();
			it_solution != _solutions.end(); ) {
		if ((*it_solution).cost() < bound) {
			it_del_solution = it_solution;
			++it_solution;
			_solutions.erase(it_del_solution);
		}
		else
			++it_solution;
	}
	#endif
}


const list<Solution>& Heuristic::solutions() const {
	return _solutions;
}


void Heuristic::collectBestNodes(bool below_flag, float below_maximum) {
	float total_weight = 0;
	int color;
	vector< list<int> > colors = _graph.colors();
	for (color = 0; color < colors.size(); ++color) {
		const vector<float>& weights = _graph.edgeWeights(_nodes[color]);
		for (int color2 = color+1; color2 < colors.size(); ++color2)
			total_weight += weights[_nodes[color2]];
	}
	
	#ifdef DEBUGALF
	cout<<"total_weight= "<<total_weight<<endl;
	#endif
	
	if (total_weight > _max_weight) {
		_max_weight = total_weight;
		//for (color = 0; color < colors.size(); ++color)
		//	_max_nodes[color] = _nodes[color];
		cout << "new weight " << total_weight << endl;
		// we print the best solution found till now:
		copy(_nodes.begin(),_nodes.end(),ostream_iterator<int>(cout," ") ); // 09112000
		cout<<endl;
		if (!(_initial_sequence.empty())){
			for (color = 0; color < colors.size(); ++color)
				cout<<_rot_codes[_nodes[color]]<<" ";
			cout<<endl;
		}
	}
	if (below_flag && total_weight > _max_weight - below_maximum)
		addToSolutions(total_weight,_nodes);
}

istream& Heuristic::readRotCodes(istream& is) {
	int sz_pos = _graph.sizeColors();
	int size_nodes = _graph.sizeNodes();
	cout<<"We have "<<sz_pos<<" positions and "<<size_nodes<<" rotamers"<<endl;
	int i;
	char code;
	cout<<"Reading sequence: ";
	for (i = 0; i < sz_pos; ++i) {
		is >> code;
		_initial_sequence.push_back(code);
		cout<<code<<" ";
	}
	cout<<endl;
	for (i = 0; i < size_nodes; ++i) {
		if (!(is >> code))
			break;
		_rot_codes.push_back(code);
	}
	if (i<sz_pos){
		cout<<"Heuristic::readRotCodes Error: read only "<<i<<" aa codes, but expected "<<sz_pos<<endl;
		exit(1);
	}
	vector< list<int> > colors = _graph.colors(); // rotamer's indices accessed by position (color, i.e. continuous numbering)
	list<int>::const_iterator it_node;
	
	for (i = 0; i < sz_pos; ++i) {  // loop over positions
		map<char, vector<int> > rot_aa;  // rotamers of the given aa (fixed position)
		for (it_node = colors[i].begin();it_node != colors[i].end(); ++it_node){  // loop over rotamers at i
			(rot_aa[(_rot_codes[(*it_node)])]).push_back(*it_node);
			//cout<<"position "<<i<<", aa "<<(_rot_codes[(*it_node)])<<", rot "<<(rot_aa[(_rot_codes[(*it_node)])]).back()<<endl;
		}
		// there's no need to have positions with only one kind of aa, and our algortihm assumes that:
		/* if (rot_aa.size()<=1){
			cout<<"Heuristic::readRotCodes Error: too few aa types at position "<<i<<endl;
			exit(1);
		} */
		_rot_lst.push_back(rot_aa);	
	}
	return is;
}

istream& Heuristic::readGraphRes(istream& is) {
	int sz_pos = _graph.sizeColors();
	int size_nodes = _graph.sizeNodes();
	cout<<"We have "<<sz_pos<<" positions and "<<size_nodes<<" rotamers"<<endl;
	int i;
	cout<<"Reading graph file: "<<endl;
	string str;
	while(is >> str && str != "combinations")
		;

	for (;;) {
		if (!(is >> str) || str != "cost") 
			break;
		vector<int> nodes_ini;
		float energy;
		is >> energy;
		cout<<"solution "<<energy<<" ";
		for (i = 0; i < sz_pos; ++i) {
			int node;
			is >> node;
			nodes_ini.push_back(node);
			if (!(_initial_sequence.empty()))
				cout<<_rot_codes[node]<<" ";
		}
		cout<<endl;
		_combinations.push_back(nodes_ini);
	}
	return is;
}

float Heuristic::pairMaximumHeuristic(int color, int color2, int& rot1, int& rot2, char aa1, char aa2){
	// We have to find the best pair of rotamers. We'll use a heuristic procedure.
	float max_weight = -LARGE_FLOAT;
	vector<int>::const_iterator it_node;
	const vector< list<int> >& colors = _graph.colors();
	bool improvement = true;
	int old_rot1 = _nodes[color];
	int old_rot2 = _nodes[color2];
	_nodes[color] = rot1;
	_nodes[color2] = rot2;
	int cycles = 100; // best value?
	float weight_sum;
	int best_node;
	int position = color;
	int position2 = color2; // position2 points to the oposite position than position
	char aa = aa1;
	while (improvement && cycles--) {
		best_node = -1;
		max_weight = -LARGE_FLOAT;
		if (position==color2)
			improvement=false;  // we will only leave the improvement loop after doing position2
		const vector<float>& weights2 =_graph.edgeWeights(_nodes[position2]);
		for (it_node = (_rot_lst[position][aa]).begin();it_node != (_rot_lst[position][aa]).end(); ++it_node) {
			const vector<float>& weights =_graph.edgeWeights(*it_node);
			weight_sum = 0; // will contain sum of pair energies containing any of both positions
			for (int col = 0; col < colors.size(); ++col) 
				weight_sum += weights[_nodes[col]];
			for (int col = 0; col < colors.size(); ++col) 
				weight_sum += weights2[_nodes[col]];
			weight_sum -= weights[_nodes[color2]];
			if (weight_sum > max_weight) {
				max_weight = weight_sum;
				best_node = *it_node;
			}
		}
		if (_nodes[position] != best_node) {
			improvement = true;
			_nodes[position] = best_node;
		}
		// let's change position for the next iteration
		if (position==color){
			position = color2;
			position2 = color;
			aa = aa2;
		}else{
			position=color;
			position2 = color2;
			aa = aa1;
		}
	} // end improvement loop
	rot1 = _nodes[color];
	rot2 = _nodes[color2];
	cout<<"Heuristic::pairMaximum: Problem size= "<<(_rot_lst[color][aa1]).size()<<" x "<<(_rot_lst[color2][aa2]).size()<<" = "<<(_rot_lst[color][aa1]).size()*(_rot_lst[color2][aa2]).size()<<", end of heuristic loop after "<<cycles<<" cycles. rot1= "<<rot1<<", rot2="<<rot2<<", max_weight= "<<max_weight<<endl;
	_nodes[color] = old_rot1;
	_nodes[color2] = old_rot2;
	return max_weight;
}

float Heuristic::pairMaximum(int color, int color2, int& rot1, int& rot2, char aa1, char aa2){
	// We have to find the best pair of rotamers. We'll use a heuristic procedure.
	float max_weight = -LARGE_FLOAT;
	float weight_sum;
	int sz_pos = (_graph.colors()).size();
	int best_node = -1;
	int best_node2 = -1;
	vector<int>::const_iterator it_node;
	vector<int>::const_iterator it_node2;
	// store initial state
	int old_rot1 = _nodes[color];
	int old_rot2 = _nodes[color2];
	
	#ifdef DEBUGALF
	_nodes[color]=rot1;
	_nodes[color2]=rot2;
	const vector<float>& weightsd =_graph.edgeWeights(_nodes[color]);
	const vector<float>& weightsd2 =_graph.edgeWeights(_nodes[color2]);
	weight_sum = 0;
	for (int col = 0; col < sz_pos; ++col) 
		weight_sum += weightsd[_nodes[col]];
	for (int col = 0; col < sz_pos; ++col)
		weight_sum += weightsd2[_nodes[col]];
	weight_sum -= weightsd[_nodes[color2]];
	if (weightsd[_nodes[color2]]!=weightsd2[_nodes[color]])
		cout<<"Error: weightsd[_nodes[color2]]= "<<weightsd[_nodes[color2]]<<" weightsd2[_nodes[color]]= "<<weightsd2[_nodes[color]]<<endl;
	cout<<"ini_weight= "<<weight_sum<<" ini_rot1= "<<old_rot1<<" ini_rot2= "<<old_rot2<<" rot1= "<<rot1<<" rot2= "<<rot2<<endl;
	#endif
	
	for (it_node = (_rot_lst[color][aa1]).begin();it_node != (_rot_lst[color][aa1]).end(); ++it_node) {
		_nodes[color] = *it_node;
		const vector<float>& weights =_graph.edgeWeights(*it_node); // pair energies involving rotamer *it_node
		for (it_node2 = (_rot_lst[color2][aa2]).begin();it_node2 != (_rot_lst[color2][aa2]).end(); ++it_node2) {
			_nodes[color2] = *it_node2;
			const vector<float>& weights2 =_graph.edgeWeights(*it_node2);
			weight_sum = 0; // will contain sum of pair energies containing any of both positions
			for (int col = 0; col < sz_pos; ++col) 
				weight_sum += weights[_nodes[col]];
			for (int col = 0; col < sz_pos; ++col) 
				weight_sum += weights2[_nodes[col]];
			weight_sum -= weights[_nodes[color2]];
			if (weight_sum > max_weight) {
				max_weight = weight_sum;
				best_node = *it_node;
				best_node2 = *it_node2;
			}
			if (_collect_all_flag){
				collectBestNodes(true,_below_maximum);
			}
		} // end color2 rotamer loop
	} // end color rotamer loop
	rot1 = best_node;
	rot2 = best_node2;
	
	#ifdef DEBUGALF
	cout<<"Heuristic::pairMaximum: Problem size= "<<(_rot_lst[color][aa1]).size()<<" x "<<(_rot_lst[color2][aa2]).size()<<" = "<<(_rot_lst[color][aa1]).size()*(_rot_lst[color2][aa2]).size()<<" rot1= "<<rot1<<", rot2="<<rot2<<", max_weight= "<<max_weight<<endl;
	#endif
	
	_nodes[color] = old_rot1;
	_nodes[color2] = old_rot2;
	return max_weight;
}

void Heuristic::exploreMaximum(float below_maximum, int heuristic_cycles) {
	vector< list<int> > colors = _graph.colors();  // rotamer's list at each position
	int color, i;
	_max_weight = -LARGE_FLOAT;
	_below_maximum = below_maximum;
	int _collect_all_flag = 1;  // this will be used by pairMaximum to call collectBestNodes at each rotamer selection
	float weight_sum;
	int heuristic_cycles2 = heuristic_cycles;
	vector<char> sequence=_initial_sequence;
	
	int const_seq_flag = 0;
	if (!(_initial_sequence.empty())) // if we have read the rotamer's codes then we'll keep constant the sequence
		const_seq_flag = 1;
	
	for (int solution = 0; solution < _combinations.size(); ++solution){// beginning of the combinations loop
		vector<int> random_color;
		cout<<"Doing solution "<<solution<<" out of "<<_combinations.size()<<endl;
		// we'll collect our starting position in the list of best nodes
		for (color = 0; color < colors.size(); ++color){
			random_color.push_back(color);
			_nodes[color] = _combinations[solution][color];
		}
		collectBestNodes(true,below_maximum);

		heuristic_cycles2 = heuristic_cycles;
		// the first heuristic loop already explores all the solutions that can be reached by one mutation
		// so it only makes sense to use heuristic_cycles > 1 if we use another algorithm.
		
		// the vector _nodes contains the current rotamer configuration
		// main heuristic loop
		for (; heuristic_cycles2; --heuristic_cycles2) {
			clock_t ticks = clock();
			// fresh random start
			/* if (const_seq_flag){
				bool bad_seq = true;
				while (bad_seq){
					random_shuffle(sequence.begin(),sequence.end());
					// let's check for positions with no rotamers of a given aa
					bad_seq = false;
					for (color = 0; color < colors.size(); ++color)
						if ((_rot_lst[color][(sequence[color])]).empty())
							bad_seq = true;
				}
			} */
				
			// we always start from our given maximum _combinations[solution]
			for (color = 0; color < colors.size(); ++color) {
				_nodes[color] = _combinations[solution][color];
				/* if (const_seq_flag){
					_nodes[color] =(_rot_lst[color][(sequence[color])]).front()+ (int)(drand48()*((_rot_lst[color][(sequence[color])]).size()));
					//cout<<"from "<<(_rot_lst[color][(sequence[color])]).front()<<" to "<<(_rot_lst[color][(sequence[color])]).back()<<" ( "<<(_rot_lst[color][(sequence[color])]).size()<<" ), "<<sequence[color]<<", chosen "<<_nodes[color]<<endl;
				}else{
					_nodes[color] = _graph.colorIndex(color)
						+ (int)(drand48()*colors[color].size());
				} */
			}
			// for const composition we replace colors[color] by _rot_lst[color][(sequence[color])]
		
			// we could dynamically change the length of the improvement cycle
			int cycles = 50;  // it seems better not to increase this number (we prefer sampling over following a given minimum)
			bool improvement = true;
			list<int>::const_iterator it_node;
			vector<int>::const_iterator it_node2;
			while (improvement && cycles--) {  // improvement loop
				random_shuffle(random_color.begin(),random_color.end());
				//if (const_seq_flag)
				//	random_shuffle(sequence.begin(),sequence.end());
				improvement = false;
				for (i = 0; i < colors.size(); ++i) {  // loop over positions, but traversing randomly
					int& color = random_color[i];
					int best_node = -1;
					int previous_node = -1;
					float max_weight = -LARGE_FLOAT;
					if (const_seq_flag){
						// at constant composition, we have to do a combined loop bw two positions
						// Method:
						// 1- Choose two positions (e.g. the current one and a random one)
						//	- check that those positions have at least one rotamer of the given aa
						// 2- Find best rotamer combination with fixed aa (i.e. side chain modelling)
						// 3- Exchange aa id's at given posiitons
						// 4- Select rotamers for both positions (random, the first one...)
						// 5- Do step 2
						// 6- Decide if the combination of best rotamers with original sequence (of two aa's)
						//    is better or not than the one with exchanged aa's. For that we have to compute
						//    the difference of the corresponding total energies for both states. Both states
						//    share the same pair energies except for the pairs i,j (i<j) where j=position1, position2
						// 7- Put the corresponding aa id's and rotamers.
										
						// we want always to give to the first position the chance to mutate to a different aa type
						// for the second one, this is not mandatory. Therefore  position 1 (color) has to have at least 
						// one rotamer of aa sequence[color2], but _rot_lst[color2][(sequence[color])] could be empty.
					
						// step 1
						// we choose the position2 randomly
						int color2;
						bool bad_seq = true;
						while (bad_seq){
							color2 = (int)(drand48()*colors.size());
							if (!((_rot_lst[color][(sequence[color2])]).empty()))
								bad_seq = false;
						}
						// step 2
						int rot1 = _nodes[color];  // 
						int rot2 = _nodes[color2];
						float ener_pair = pairMaximum(color,color2,rot1,rot2,sequence[color],sequence[color2]);
					
						#ifdef DEBUGALF
						cout<<"ener_pair= "<<ener_pair<<endl;
						#endif
					
						// steps 3, 4 & 5
						// random rotamers at both positions
						if (!((_rot_lst[color2][(sequence[color])]).empty())){
							int exchanged_rot1 = (_rot_lst[color][(sequence[color2])]).front() + (int)(drand48()*((_rot_lst[color][(sequence[color2])]).size()));
							int exchanged_rot2 = (_rot_lst[color2][(sequence[color])]).front() + (int)(drand48()*((_rot_lst[color2][(sequence[color])]).size()));
							//cout<<"Heuristic::computeMaximum: ex_rot= "<<(_rot_lst[color][(sequence[color2])]).front()<<", sz= "<<((_rot_lst[color][(sequence[color2])]).size())<<" ("<<exchanged_rot1<<") "<<endl;
							//cout<<"Heuristic::computeMaximum: ex_rot= "<<(_rot_lst[color2][(sequence[color])]).front()<<", sz= "<<((_rot_lst[color2][(sequence[color])]).size())<<" ("<<exchanged_rot2<<") "<<endl;
							float ener_pair2 = pairMaximum(color,color2,exchanged_rot1,exchanged_rot2,sequence[color2],sequence[color]);
						
							#ifdef DEBUGALF
							cout<<"ener_pair2= "<<ener_pair2<<endl;
							#endif
						
							// step 6 & 7
							if (ener_pair2> ener_pair){
								rot1 = exchanged_rot1;
								rot2 = exchanged_rot2;
								char tmp = sequence[color];
								sequence[color] = sequence[color2];
								sequence[color2] = tmp;
								ener_pair = ener_pair2;
							}
						}
						// have we improved the state?
						if (_nodes[color] != rot1||_nodes[color2] != rot2){
							_nodes[color] = rot1;
							_nodes[color2] = rot2;
							improvement = true;
							#ifdef DEBUGALF
							copy(_nodes.begin(),_nodes.end(),ostream_iterator<int>(cout," ") );cout<<endl;
							#endif
						}
					}else{
						for (it_node = colors[color].begin();  // loop over rotamers
								it_node != colors[color].end(); ++it_node) {
							const vector<float>& weights =
									_graph.edgeWeights(*it_node);
							weight_sum = 0;
							for (int color2 = 0; color2 < colors.size(); ++color2)
								weight_sum += weights[_nodes[color2]];
							if (weight_sum > max_weight) {
								max_weight = weight_sum;
								best_node = *it_node;
							}
							// we have to actualize temporally _nodes[color] so we can call collectBestNodes
							previous_node = _nodes[color];
							_nodes[color] = *it_node;
							collectBestNodes(true,below_maximum);
							_nodes[color] = previous_node;
						}
						if (_nodes[color] != best_node) {
							improvement = true;
							_nodes[color] = best_node;
						}
					
					}
					collectBestNodes(true,below_maximum);
				} // end loop over positions
			
				#ifdef DEBUGALF
				cout<<"End of cycle "<<cycles<<endl;
				#endif
			
			}  // end improvement loop
			cout << "time spent for heuristic loop: " << float(clock() - ticks)/CLOCKS_PER_SEC << endl;
			cout<<"End of heuristic cycle # "<<heuristic_cycles<<" and last cycle= "<<cycles+1<<endl;
			if (const_seq_flag){
				cout<<"Current sequence= ";
				for (int c=0;c<colors.size(); ++c)
					cout<<_rot_codes[_nodes[c]]<<" ";
				cout<<endl;
			}
		}  // end heuristic loop
	} // end of the combinations loop
	eraseSolutionsBelow(_max_weight - below_maximum);
}

void Heuristic::exploreMaximumRand(float below_maximum, int heuristic_cycles) {
	vector< list<int> > colors = _graph.colors();  // rotamer's list at each position
	bool accept = true;
	int color, i;
	_max_weight = -LARGE_FLOAT;
	_below_maximum = below_maximum;
	int _collect_all_flag = 1;  // this will be used by pairMaximum to call collectBestNodes at each rotamer selection
	float weight_sum;
	int combinations_counter = 0;
	int heuristic_cycles2 = heuristic_cycles;
	vector<char> sequence=_initial_sequence;
	
	int const_seq_flag = 0;
	if (!(_initial_sequence.empty())) // if we have read the rotamer's codes then we'll keep constant the sequence
		const_seq_flag = 1;
	
	for (int solution = 0; solution < _combinations.size(); ++solution){// beginning of the combinations loop
		vector<int> random_color;
		++combinations_counter;
		cout<<"Doing solution "<<solution<<" out of "<<_combinations.size()<<endl;
		// we'll collect our starting position in the list of best nodes
		for (color = 0; color < colors.size(); ++color){
			random_color.push_back(color);
			_nodes[color] = _combinations[solution][color];
		}
		collectBestNodes(true,below_maximum);

		heuristic_cycles2 = heuristic_cycles;
		// the first heuristic loop already explores all the solutions that can be reached by one mutation
		// so it only makes sense to use heuristic_cycles > 1 if we use another algorithm.
		
		// the vector _nodes contains the current rotamer configuration
		float average_time=0;
		// main heuristic loop
		for (; heuristic_cycles2; --heuristic_cycles2) {
			clock_t ticks = clock();
			// fresh random start
			/* if (const_seq_flag){
				bool bad_seq = true;
				while (bad_seq){
					random_shuffle(sequence.begin(),sequence.end());
					// let's check for positions with no rotamers of a given aa
					bad_seq = false;
					for (color = 0; color < colors.size(); ++color)
						if ((_rot_lst[color][(sequence[color])]).empty())
							bad_seq = true;
				}
			} */
				
			// we always start from our given maximum _combinations[solution]
			for (color = 0; color < colors.size(); ++color) {
				_nodes[color] = _combinations[solution][color];
				/* if (const_seq_flag){
					_nodes[color] =(_rot_lst[color][(sequence[color])]).front()+ (int)(drand48()*((_rot_lst[color][(sequence[color])]).size()));
					//cout<<"from "<<(_rot_lst[color][(sequence[color])]).front()<<" to "<<(_rot_lst[color][(sequence[color])]).back()<<" ( "<<(_rot_lst[color][(sequence[color])]).size()<<" ), "<<sequence[color]<<", chosen "<<_nodes[color]<<endl;
				}else{
					_nodes[color] = _graph.colorIndex(color)
						+ (int)(drand48()*colors[color].size());
				} */
			}
			// for const composition we replace colors[color] by _rot_lst[color][(sequence[color])]
		
			// we could dynamically change the length of the improvement cycle
			int cycles = 5;
			bool improvement = true;
			list<int>::const_iterator it_node;
			vector<int>::const_iterator it_node2;
			//while (improvement && cycles--) {  // improvement loop
			while (cycles--) {  // mutation depth loop
			random_shuffle(random_color.begin(),random_color.end());
				//if (const_seq_flag)
				//	random_shuffle(sequence.begin(),sequence.end());
				improvement = false;
				//for (i = 0; i < colors.size(); ++i) {  // loop over positions, but traversing randomly
					i = (int)(drand48()*colors.size()); // just one random position
					int& color = random_color[i];
					int best_node = -1;
					int previous_node = -1;
					float max_weight = -LARGE_FLOAT;
					if (const_seq_flag){
						// at constant composition, we have to do a combined loop bw two positions
						// Method:
						// 1- Choose two positions (e.g. the current one and a random one)
						//	- check that those positions have at least one rotamer of the given aa
						// 2- Find best rotamer combination with fixed aa (i.e. side chain modelling)
						// 3- Exchange aa id's at given posiitons
						// 4- Select rotamers for both positions (random, the first one...)
						// 5- Do step 2
						// 6- Decide if the combination of best rotamers with original sequence (of two aa's)
						//    is better or not than the one with exchanged aa's. For that we have to compute
						//    the difference of the corresponding total energies for both states. Both states
						//    share the same pair energies except for the pairs i,j (i<j) where j=position1, position2
						// 7- Put the corresponding aa id's and rotamers.
										
						// we want always to give to the first position the chance to mutate to a different aa type
						// for the second one, this is not mandatory. Therefore  position 1 (color) has to have at least 
						// one rotamer of aa sequence[color2], but _rot_lst[color2][(sequence[color])] could be empty.
					
						// step 1
						// we choose the position2 randomly
						int color2;
						bool bad_seq = true;
						while (bad_seq){
							color2 = (int)(drand48()*colors.size());
							if (!((_rot_lst[color][(sequence[color2])]).empty()))
								bad_seq = false;
						}
						// step 2
						int rot1 = _nodes[color];  // 
						int rot2 = _nodes[color2];
						float ener_pair = pairMaximum(color,color2,rot1,rot2,sequence[color],sequence[color2]);
					
						#ifdef DEBUGALF
						cout<<"ener_pair= "<<ener_pair<<endl;
						#endif
					
						// steps 3, 4 & 5
						// random rotamers at both positions
						if (!((_rot_lst[color2][(sequence[color])]).empty())){
							int exchanged_rot1 = (_rot_lst[color][(sequence[color2])]).front() + (int)(drand48()*((_rot_lst[color][(sequence[color2])]).size()));
							int exchanged_rot2 = (_rot_lst[color2][(sequence[color])]).front() + (int)(drand48()*((_rot_lst[color2][(sequence[color])]).size()));
							//cout<<"Heuristic::computeMaximum: ex_rot= "<<(_rot_lst[color][(sequence[color2])]).front()<<", sz= "<<((_rot_lst[color][(sequence[color2])]).size())<<" ("<<exchanged_rot1<<") "<<endl;
							//cout<<"Heuristic::computeMaximum: ex_rot= "<<(_rot_lst[color2][(sequence[color])]).front()<<", sz= "<<((_rot_lst[color2][(sequence[color])]).size())<<" ("<<exchanged_rot2<<") "<<endl;
							float ener_pair2 = pairMaximum(color,color2,exchanged_rot1,exchanged_rot2,sequence[color2],sequence[color]);
						
							#ifdef DEBUGALF
							cout<<"ener_pair2= "<<ener_pair2<<endl;
							#endif
						
							// step 6 & 7
							if ((ener_pair2> ener_pair)||accept){// if accept=true we always accept the mutations
								rot1 = exchanged_rot1;
								rot2 = exchanged_rot2;
								char tmp = sequence[color];
								sequence[color] = sequence[color2];
								sequence[color2] = tmp;
								ener_pair = ener_pair2;
							}
						}
						// have we improved the state?
						if (_nodes[color] != rot1||_nodes[color2] != rot2){
							_nodes[color] = rot1;
							_nodes[color2] = rot2;
							improvement = true;
							#ifdef DEBUGALF
							copy(_nodes.begin(),_nodes.end(),ostream_iterator<int>(cout," ") );cout<<endl;
							#endif
						}
					}else{
						//for (it_node = colors[color].begin();  // loop over rotamers
						//		it_node != colors[color].end(); ++it_node) {
						int rand_node = (colors[color]).front()+(int)(drand48()*(colors[color]).size());
						const vector<float>& weights =
								_graph.edgeWeights(rand_node);
						weight_sum = 0;
						for (int color2 = 0; color2 < colors.size(); ++color2)
							weight_sum += weights[_nodes[color2]];
						if (weight_sum > max_weight) {
							max_weight = weight_sum;
							best_node = rand_node;
						}
						if (accept)
							best_node = rand_node;// if accept=true we always accept the mutation
						// we have to actualize temporally _nodes[color] so we can call collectBestNodes
						previous_node = _nodes[color];
						_nodes[color] = rand_node;
						collectBestNodes(true,below_maximum);
						_nodes[color] = previous_node;
						//}
						if (_nodes[color] != best_node) {
							improvement = true;
							_nodes[color] = best_node;
						}
						// the previous step makes always a single mutation
						// in the background of that mutation we'll explore all positions
						// and all rotamers, but without making mutations but only calling collectBestNodes
						//for (int i2 = 0; i2 < colors.size(); ++i2) {  // loop over positions (this time will be done sequencially)
						int i2 = (int)(drand48()*colors.size()); // just one random position
						for (it_node = colors[i2].begin();it_node != colors[i2].end(); ++it_node) {// loop over rotamers
							const vector<float>& weights2 = _graph.edgeWeights(*it_node);
							weight_sum = 0;
							for (int color2 = 0; color2 < colors.size(); ++color2)
								weight_sum += weights2[_nodes[color2]];
							previous_node = _nodes[i2];
							_nodes[i2] = *it_node;
							collectBestNodes(true,below_maximum);
							_nodes[i2] = previous_node;
						}
						//}
					}
					collectBestNodes(true,below_maximum);
				//} // end loop over positions
			
				#ifdef DEBUGALF
				cout<<"End of cycle "<<cycles<<endl;
				#endif
			
			}  // end improvement loop
			average_time+=float(clock() - ticks)/CLOCKS_PER_SEC;
			if (heuristic_cycles2%100==0){
				cout << "time spent for heuristic loop: " << average_time/100 << endl;
				cout<<"End of heuristic cycle # "<<heuristic_cycles2<<" and last cycle= "<<cycles+1<<endl;
				cout << heuristic_cycles2*average_time/100 + (heuristic_cycles*average_time/100)*(_combinations.size()-combinations_counter)<< " seconds to completion"<<endl;
				average_time=0;
				if (const_seq_flag){
					cout<<"Current sequence= ";
					for (int c=0;c<colors.size(); ++c)
						cout<<_rot_codes[_nodes[c]]<<" ";
					cout<<endl;
				}
			}
		}  // end heuristic loop
	} // end of the combinations loop
	eraseSolutionsBelow(_max_weight - below_maximum);
}

void Heuristic::computeMaximum(float below_maximum, int heuristic_cycles) {
	vector< list<int> > colors = _graph.colors();  // rotamer's list at each position
	int color, i;
	_max_weight = -LARGE_FLOAT;
	float weight_sum;
	vector<int> random_color;
	vector<char> sequence=_initial_sequence;
	
	int const_seq_flag = 0;
	if (!(_initial_sequence.empty())) // if we have read the rotamer's codes then we'll keep constant the sequence
		const_seq_flag = 1;
	for (color = 0; color < colors.size(); ++color)
		random_color.push_back(color);

	// the vector _nodes contains the current rotamer configuration
	float average_time=0;
	// main heuristic loop
	for (; heuristic_cycles; --heuristic_cycles) {
		clock_t ticks = clock();
		// fresh random start
		if (const_seq_flag){
			bool bad_seq = true;
			while (bad_seq){
				random_shuffle(sequence.begin(),sequence.end());
				// let's check for positions with no rotamers of a given aa
				bad_seq = false;
				for (color = 0; color < colors.size(); ++color)
					if ((_rot_lst[color][(sequence[color])]).empty())
						bad_seq = true;
			}
		}
				
		for (color = 0; color < colors.size(); ++color) {
			if (const_seq_flag){
				_nodes[color] =(_rot_lst[color][(sequence[color])]).front()+ (int)(drand48()*((_rot_lst[color][(sequence[color])]).size()));
				//cout<<"from "<<(_rot_lst[color][(sequence[color])]).front()<<" to "<<(_rot_lst[color][(sequence[color])]).back()<<" ( "<<(_rot_lst[color][(sequence[color])]).size()<<" ), "<<sequence[color]<<", chosen "<<_nodes[color]<<endl;
			}else{
				_nodes[color] = _graph.colorIndex(color)
					+ (int)(drand48()*colors[color].size());
			}
		}
		// for const composition we replace colors[color] by _rot_lst[color][(sequence[color])]
		
		// we could dynamically change the length of the improvement cycle
		int cycles = 500;  // it seems better not to increase this number (we prefer sampling over following a given minimum)
		bool improvement = true;
		list<int>::const_iterator it_node;
		vector<int>::const_iterator it_node2;
		while (improvement && cycles--) {  // improvement loop
			random_shuffle(random_color.begin(),random_color.end());
			//if (const_seq_flag)
			//	random_shuffle(sequence.begin(),sequence.end());
			improvement = false;
			for (i = 0; i < colors.size(); ++i) {  // loop over positions, but traversing randomly
				int& color = random_color[i];
				int best_node = -1;
				float max_weight = -LARGE_FLOAT;
				if (const_seq_flag){
					// at constant composition, we have to do a combined loop bw two positions
					// Method:
					// 1- Choose two positions (e.g. the current one and a random one)
					//	- check that those positions have at least one rotamer of the given aa
					// 2- Find best rotamer combination with fixed aa (i.e. side chain modelling)
					// 3- Exchange aa id's at given posiitons
					// 4- Select rotamers for both positions (random, the first one...)
					// 5- Do step 2
					// 6- Decide if the combination of best rotamers with original sequence (of two aa's)
					//    is better or not than the one with exchanged aa's. For that we have to compute
					//    the difference of the corresponding total energies for both states. Both states
					//    share the same pair energies except for the pairs i,j (i<j) where j=position1, position2
					// 7- Put the corresponding aa id's and rotamers.
										
					// we want always to give to the first position the chance to mutate to a different aa type
					// for the second one, this is not mandatory. Therefore  position 1 (color) has to have at least 
					// one rotamer of aa sequence[color2], but _rot_lst[color2][(sequence[color])] could be empty.
					
					// step 1
					// we choose the position2 randomly
					int color2;
					bool bad_seq = true;
					while (bad_seq){
						color2 = (int)(drand48()*colors.size());
						if (!((_rot_lst[color][(sequence[color2])]).empty()))
							bad_seq = false;
					}
					// step 2
					int rot1 = _nodes[color];  // 
					int rot2 = _nodes[color2];
					float ener_pair = pairMaximum(color,color2,rot1,rot2,sequence[color],sequence[color2]);
					
					#ifdef DEBUGALF
					cout<<"ener_pair= "<<ener_pair<<endl;
					#endif
					
					// steps 3, 4 & 5
					// random rotamers at both positions
					if (!((_rot_lst[color2][(sequence[color])]).empty())){
						int exchanged_rot1 = (_rot_lst[color][(sequence[color2])]).front() + (int)(drand48()*((_rot_lst[color][(sequence[color2])]).size()));
						int exchanged_rot2 = (_rot_lst[color2][(sequence[color])]).front() + (int)(drand48()*((_rot_lst[color2][(sequence[color])]).size()));
						//cout<<"Heuristic::computeMaximum: ex_rot= "<<(_rot_lst[color][(sequence[color2])]).front()<<", sz= "<<((_rot_lst[color][(sequence[color2])]).size())<<" ("<<exchanged_rot1<<") "<<endl;
						//cout<<"Heuristic::computeMaximum: ex_rot= "<<(_rot_lst[color2][(sequence[color])]).front()<<", sz= "<<((_rot_lst[color2][(sequence[color])]).size())<<" ("<<exchanged_rot2<<") "<<endl;
						float ener_pair2 = pairMaximum(color,color2,exchanged_rot1,exchanged_rot2,sequence[color2],sequence[color]);
						
						#ifdef DEBUGALF
						cout<<"ener_pair2= "<<ener_pair2<<endl;
						#endif
						
						// step 6 & 7
						if (ener_pair2> ener_pair){
							rot1 = exchanged_rot1;
							rot2 = exchanged_rot2;
							char tmp = sequence[color];
							sequence[color] = sequence[color2];
							sequence[color2] = tmp;
							ener_pair = ener_pair2;
						}
					}
					// have we improved the state?
					if (_nodes[color] != rot1||_nodes[color2] != rot2){
						_nodes[color] = rot1;
						_nodes[color2] = rot2;
						improvement = true;
						#ifdef DEBUGALF
						copy(_nodes.begin(),_nodes.end(),ostream_iterator<int>(cout," ") );cout<<endl;
						#endif
					}
				}else{
					for (it_node = colors[color].begin();  // loop over rotamers
							it_node != colors[color].end(); ++it_node) {
						const vector<float>& weights =
								_graph.edgeWeights(*it_node);
						weight_sum = 0;
						for (int color2 = 0; color2 < colors.size(); ++color2)
							weight_sum += weights[_nodes[color2]];
						if (weight_sum > max_weight) {
							max_weight = weight_sum;
							best_node = *it_node;
						}
					}
					if (_nodes[color] != best_node) {
						improvement = true;
						_nodes[color] = best_node;
					}
					
				}
				collectBestNodes(true,below_maximum);
			} // end loop over positions
			
			#ifdef DEBUGALF
			cout<<"End of cycle "<<cycles<<endl;
			#endif
			
		}  // end improvement loop
		average_time+=float(clock() - ticks)/CLOCKS_PER_SEC;
		if (heuristic_cycles%1000==0){
			cout << "average time spent for a heuristic loop: " << average_time/1000 << endl;
			cout<<"End of heuristic cycle # "<<heuristic_cycles<<" and last cycle= "<<cycles+1<<endl;
			cout << heuristic_cycles*average_time/1000 << " seconds to completion"<<endl;
			average_time=0;
			if (const_seq_flag){
				cout<<"Current sequence= ";
				for (int c=0;c<colors.size(); ++c)
					cout<<_rot_codes[_nodes[c]]<<" ";
				cout<<endl;
			}
		}
	}  // end heuristic loop
	eraseSolutionsBelow(_max_weight - below_maximum);
}


void Heuristic::clearMaxWeights() {
	_max_soft_weight = -LARGE_FLOAT;
	_max_hard_weight = -LARGE_FLOAT;
}


int Heuristic::maxNode(int color, const Density& density) const {
	return _graph.colorIndex(color) + density.maxIndex();
}


float Heuristic::softWeight (
		const vector<Density>& densities) const {
	return 0;
}


float Heuristic::hardWeight (
		const vector<Density>& densities) const {
	const vector< list<int> >& colors = _graph.colors();
	float total_hard_weight = 0;
	for (int color = 0; color < colors.size()-1; ++color) {
		const vector<float>& weights =
						_graph.edgeWeights(maxNode(color,densities[color]));
		#ifdef SHOW
			cout << "hardweight for density " << densities[color]
					<< " from " << maxNode(color,densities[color]) << " to ";
		#endif
		for (int color2 = color+1; color2 < colors.size(); ++color2) {
			total_hard_weight += weights[maxNode(color2,densities[color2])];
			#ifdef SHOW
				cout << maxNode(color2,densities[color2]) << " ";
				cout << "(" << densities[color2] << ") "; 
			#endif
		}
		#ifdef SHOW
			cout << "\n   is " << total_hard_weight << endl;
		#endif
	}
	return total_hard_weight;
}


void Heuristic::testMaxWeights(const vector<Density>& densities) {
	float total_soft_weight = softWeight(densities);
	float total_hard_weight = hardWeight(densities);
	//cout << " current hard weight " << total_hard_weight << endl;
	if (total_soft_weight > _max_soft_weight) {
		cout << "new soft weight " << total_soft_weight << endl;
		_max_soft_weight = total_soft_weight;
		_max_soft_densities = densities;
	}
	if (total_hard_weight > _max_hard_weight) {
		cout << " new hard weight " << total_hard_weight << endl;
		_max_hard_weight = total_hard_weight;
		_max_hard_densities = densities;
	}
}


float innerProduct(const vector<float>& probs,
		vector<float>::const_iterator it_weight) {
	vector<float>::const_iterator it_prob;
	float weight = 0.0;
	for (it_prob = probs.begin(); it_prob < probs.end();
			++it_prob, ++it_weight) {
		weight += *it_prob * *it_weight;
		#ifdef FULLSHOW
			cout << *it_prob << " with " << *it_weight << endl;
		#endif
	}
	#ifdef SHOW
		cout << " inner product " << weight << endl;
	#endif
	return weight;
}


void Heuristic::computeDensityMaxima(int heuristic_cycles) {
	const vector< list<int> >& colors = _graph.colors();
	int color, node;
	const float eps = 0.01;

	clearMaxWeights();
	for (; heuristic_cycles; --heuristic_cycles) {
		#ifdef SHOW
			cout << "\n\nHEURISTIC countdown " << heuristic_cycles << endl;
		#endif
		vector<Density> densities(colors.size());
		for (color = 0; color < colors.size(); ++color)
			if (colors[color].size() > 1)
				//densities[color].loadRandom(colors[color].size());
				densities[color].loadSelect(colors[color].size());
		int cycles = 500;
		bool change_flag = true;
		while (change_flag && cycles--) {
			#ifdef SHOW
				cout << "\n new cycle" << endl;
			#endif
			change_flag = false;
			for (color = 0; color < colors.size(); ++color) {
				vector<float> nodes_weight;
				#ifdef SHOW
					cout << "color " << color << " current density ";
					copy(densities[color].probabilities().begin(),
							densities[color].probabilities().end(),
							ostream_iterator<float>(cout," ") );
					cout << endl;
				#endif
				for (node = _graph.colorIndex(color);
						node < _graph.colorIndex(color+1); ++node) {
					#ifdef SHOW
						cout << "  node " << node;
					#endif
					const vector<float>& weights =	_graph.edgeWeights(node);
					float weight_sum = 0;
					for (int color2 = 0; color2 < colors.size(); ++color2) {
						if (color == color2)
							continue;
						weight_sum += inner_product(
								densities[color2].probabilities().begin(),
								densities[color2].probabilities().end(),
								&weights[_graph.colorIndex(color2)],(float)0.0 );
						//#ifdef FULLSHOW
						//cout << "weight test "
						//		<< ( weight != 0.0 ? (weight - 
						//				innerProduct(densities[color2].probabilities(),
						//				&weights[_graph.colorIndex(color2)]) ) / weight 
						//				: innerProduct(densities[color2].probabilities(),
						//				&weights[_graph.colorIndex(color2)]) ) << endl;
						//#endif
					}
					#ifdef SHOW
						cout << " with weight sum " << weight_sum << endl;
					#endif
					nodes_weight.push_back(weight_sum);
				}
				//Density::convertBoltzmann(nodes_weight,1);
				//Density::convertLinear(nodes_weight);
				Density::convertMaximum(nodes_weight);
				//Density::convertRank(nodes_weight);
				if (densities[color].differenceTo(nodes_weight) > eps)
					change_flag = true;
				densities[color].setProbabilities(nodes_weight);
			}
			testMaxWeights(densities);
		}
	}
}


ostream& Heuristic::printDensityMaxima(ostream& os) {
	//cout << "soft weight: " << _max_soft_weight << endl;
	//cout << "soft weight hardened: " << hardWeight(_max_soft_densities) << endl;
	cout << "hard weight: " << _max_hard_weight << endl;

	cout << "combinations" << endl;
	//cout << "cost " << hardWeight(_max_soft_densities) << "  ";
	int color;
	//for (color = 0; color < _graph.colors().size(); ++color)
	//	cout << _graph.colorIndex(color)
	//			+ _max_soft_densities[color].maxIndex() << " ";
	//cout << endl;
	cout << "cost " << _max_hard_weight << "  ";
	for (color = 0; color < _graph.colors().size(); ++color)
		cout << _graph.colorIndex(color)
				+ _max_hard_densities[color].maxIndex() << " ";
	cout << endl;

	return os;
}
	

ostream& Heuristic::printNodes(ostream& os) {
	cout << "combinations" << endl;
	cout << "cost " << _max_weight << "  ";
	copy(_nodes.begin(),_nodes.end(),
			ostream_iterator<int>(os," ") );
	os << endl;
	return os;
}



class Connectivity {
public:
	Connectivity(const MultiPartiteGraph& graph);
	ostream& printAnalysis(ostream& os);
private:
	const MultiPartiteGraph& _graph;
};


Connectivity::Connectivity(const MultiPartiteGraph& graph)
		: _graph(graph) {
}

ostream& Connectivity::printAnalysis(ostream& os) {
	int color1, color2;
	float max_weight, total_max = -LARGE_FLOAT, total_min = LARGE_FLOAT;
	float total_sum = 0;
	const vector< list<int> >& colors = _graph.colors();
	list<int>::const_iterator it_node1, it_node2;
	for (color1 = 0; color1 < colors.size(); ++color1) {
		os << color1 << ": ";
		for (color2 = color1 + 1; color2 < colors.size(); ++color2) {
			max_weight = -LARGE_FLOAT;
			for (it_node1 = colors[color1].begin();
					it_node1 != colors[color1].end();
					++it_node1)
				for (it_node2 = colors[color2].begin();
						it_node2 != colors[color2].end();
						++it_node2)
					if (_graph.edgeWeights(*it_node1,*it_node2)
							> max_weight)
						max_weight = _graph.edgeWeights(*it_node1,*it_node2);
			os << color2 << "(" << max_weight << ") ";
			total_sum += max_weight;
			if (max_weight > total_max) total_max = max_weight;
			if (max_weight < total_min) total_min = max_weight;
		}
		os << endl;
	}
	os << "max " << total_max << "  min " << total_min
			<< "  avg " << total_sum * 2/(colors.size()*(colors.size()-1))
			<< "  sum " << total_sum
			<< endl;
	return os;
}



//                      main part



ConstraintsBranchAndBound* p_cbb;
Heuristic* p_heuristic;

void printSolutions(int s = 0) {
	cout << "\ngot signal " << s << " printing optimal solutions " << endl;

	p_cbb->printStatistics(cout) << endl;
	
	const list<Solution>& solutions = p_cbb->solutions();

	if (solutions.begin() != solutions.end()) {
		//cout << "problems in [" << opt - below_maximum
		//		<< ", " << opt << "]" << endl;
		cout << "combinations" << endl;
		copy(solutions.begin(),solutions.end(),
				ostream_iterator<Solution>(cout,"\n") );
		cout << endl;
	}
	signal(SIGCONT,printSolutions);
}


void printHeuristicSolutions(int s = 0) {
	cout << "\ngot signal " << s << " printing heuristic solutions " << endl;

	const list<Solution>& solutions = p_heuristic->solutions();

	if (solutions.begin() != solutions.end()) {
		//cout << "problems in [" << opt - below_maximum
		//		<< ", " << opt << "]" << endl;
		cout << "combinations" << endl;
		copy(solutions.begin(),solutions.end(),
				ostream_iterator<Solution>(cout,"\n") );
		cout << endl;
	}
	signal(SIGCONT,printSolutions);
}


int main(int argc, char* argv[]) {
	// This is opt_alf with a random seed improvement: if the variable RSEED is defined
	// then its value is taken as seed. For instance, add the following before executing (csh):
	// # Random seed according to the task id and process id:
	// set seed=`awk 'BEGIN{printf("'$TASK_ID'%s\n",substr("'$$'00000",1,5))}'`
	// setenv RSEED $seed		
	//    
	// here $TASK_ID contains the virtual node number, which should be unique.

	cout<<"optimizera created by Lorenz Wernisch. Version "<<__DATE__<<"\nLater revised by: \nAlfonso Jaramillo "<<endl;
	#ifdef IGCF
	system("echo IGCF: `hostname`");
	//cout<<"IGCF: Start "<<endl;
	system("echo IGCF: `date` Start ");
	#endif
	if (argc < 5) {
		cout << "usage: <filename> <o(ptimize)|m(aximum)|b(oltzmann)> <int below_max> <int heuristics cycles>" << endl;
		exit(1);
	}
	ifstream is(argv[1]);
	if (!is) {
		cout << "file not found " << endl;
		exit(1);
	}

	char algorithm;
	sscanf(argv[2],"%c",&algorithm);

	float below_maximum = 0;
	sscanf(argv[3],"%f",&below_maximum);

	int heuristic_cycles = 0;
	sscanf(argv[4],"%d",&heuristic_cycles);

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
	cout<<"Using seed "<<what_seed<<endl;
        srand48(what_seed);
	cout << "alg  is " << algorithm << endl;
	cout << "reading graph" << endl;
	cout << "alg  is " << algorithm << endl;
	#ifdef IGCF
	//cout<<"IGCF: reading file: "<<endl;
	system("echo IGCF: `date` reading file: ");
	#endif
	MultiPartiteGraph graph;
	is >> graph;
	cout << "alg  is " << algorithm << endl;


	Heuristic heuristic(graph);
	p_heuristic = & heuristic;
	
	if (argc > 5) {
		// if we want to use 'explore' then: if we only provide one additional file then NO const composition
		//                                   otherwise we'll understand const composition
		// if we don't want to use 'explore': if we don't provide any additional file then NO const composition
		//                                    otherwise we'll understand const composition
		//char buffer[80];
		//sscanf(argv[5],"%s",buffer);
		char* graph_res_file = argv[5];
		char* rot_codes_file = argv[5];
		if (algorithm == 'e' && argc > 6 ){ // explore and constant composition
			graph_res_file = argv[6];
		}
		if (algorithm == 'e'){ // we'll read the graph results file (in the 5th or 6th argument, no const comp or const comp respectively)
			cout<<"graph results file= "<<graph_res_file<<endl;
			ifstream ifsg(graph_res_file);
			if (!ifsg){
				cout<<"Error: cannot open "<<graph_res_file<<" file!"<<endl;
				exit(1);
			}
			heuristic.readGraphRes(ifsg);
			ifsg.close();
		}
		if ((algorithm == 'e' && argc > 6)|| algorithm!='e'){  // constant composition (always in the 5th argument)
			// we read the rotamer's aa codes, for use in the constant composition algorithm
			cout<<"rotamer codes file= "<<rot_codes_file<<endl;
			ifstream ifs(rot_codes_file);
			if (!ifs){
				cout<<"Error: cannot open "<< rot_codes_file <<" file!"<<endl;
				exit(1);
			}
			heuristic.readRotCodes(ifs);
			ifs.close();
		}
	}

	Connectivity(graph).printAnalysis(cout) << endl;

	if (algorithm == 'o' || algorithm == 's') {
		ConstraintsBranchAndBound cbb(graph);
		p_cbb = &cbb;

		cout << "starting heuristic for optimization bound" << endl;
		heuristic.computePureMaximum(heuristic_cycles);
		cout << "heuristic gives " << heuristic.maxWeight() << endl;
		cout << "computing maximum with below maximum of "
				<< below_maximum << " by algorithm " << algorithm << endl;
		signal(SIGCONT,printSolutions);
		_higher_order_flag = algorithm == 's' ? 1 : 0;
		float opt = cbb.computeMaximum(heuristic.maxWeight(),below_maximum);
		//float opt = cbb.computeMaximum(187.136,below_maximum);
		printSolutions();
	}
	else if (algorithm == 'p') {
		cout << "starting pure heuristic" << endl;
		heuristic.computePureMaximum(heuristic_cycles);
		cout << "heuristic gives " << heuristic.maxWeight();
	}
	else if (algorithm == 'm') {
		cout << "starting maximum heuristic" << endl;
		#ifdef IGCF
		system("echo IGCF: `date` starting maximum heuristic ");
		#endif
		signal(SIGCONT,printHeuristicSolutions);
		heuristic.computeMaximum(below_maximum,heuristic_cycles);
		#ifdef IGCF
		system("echo IGCF: `date` ended maximum heuristic ");
		#endif
		//heuristic.printNodes(cout) << endl;
		printHeuristicSolutions();
	}
	else if (algorithm == 'e') {
		cout << "starting maximum explorer ";
		signal(SIGCONT,printHeuristicSolutions);
		if (heuristic_cycles>1){
			cout << " (rand)"<<endl;
			heuristic.exploreMaximumRand(below_maximum,heuristic_cycles);
		} else{
			cout << " (enum)"<<endl;
			heuristic.exploreMaximum(below_maximum,heuristic_cycles);
		}
		//heuristic.printNodes(cout) << endl;
		printHeuristicSolutions();
	}
	else if (algorithm == 'b') {
		heuristic.computeDensityMaxima(heuristic_cycles);
		heuristic.printDensityMaxima(cout);
	}
	else {
		cout << "unknown optimization option " << algorithm << ", choose " << endl
				<< "o: optimization, branch and bound" << endl
				<< "m: heuristic with maximum rotamer selection" << endl
				<< "b: heuristic with Boltzmann density" << endl;
	}
	#ifdef IGCF
	//cout << "IGCF: Optimizer finished "<<endl;
	system("echo IGCF: `date` Optimizer finished ");
	#endif
	return 0;
}

