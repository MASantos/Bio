#include<iostream>
#include<iomanip>
#include<strstream>
#include<string>
#include<map>
#include<vector>
#include<algorithm>
#include<numeric>

template<class T1, class T2>
struct Pair {
	T1 first;
	T2 second;
	typedef pair<const T1,T2> STLPair;
	Pair()
		: first(T1()), second(T2()) { }
	Pair(const T1 f, const T2 s)
		: first(f), second(s) { }
	Pair(const Pair& x)
		: first(x.first), second(x.second) { }
	Pair(const STLPair& x)
		: first(x.first), second(x.second) { }
	const Pair& operator=(const Pair& x) { 
	  first = x.first; second = x.second;
		return *this;
	}
	bool operator<(const Pair& x) const { 
	  return second < x.second;
	}
	bool operator>(const Pair& x) const { 
	  return second > x.second;
	}
};

template<class T1, class T2>
inline T2 operator+(const T2 value, const Pair<T1,T2>& pair) {
	return value + pair.second;
}


int main() {
/*
	Pair<char,int> p('c',5);
	Pair<char,int> q(p);
	Pair<char,int> qq(pair<const char,int>('a',7));
	cout << q.second << endl;

	Pair<char,int> r = q;
	r = p;
	int i = 13 + q;
	cout << i << " " << (p < q) << endl;
*/

	char buffer[3000];
	string str;
	double d;
	int position;
	char res_code;

 	typedef map< char, int, less<char> > CharCount;
	typedef map< int, CharCount, less<int> > Profile;
	Profile profile;

	while(cin.getline(buffer,3000)) {
		istrstream is(buffer);
		is >> str >> d;
		for (;;) {
			is >> position >> res_code;
			if (!is) break;
			Profile::iterator it_position = profile.find(position);
			if (it_position == profile.end())
				it_position = profile.insert(
						Profile::value_type(position,CharCount()) ).first;
			CharCount::iterator it_char_count = 
					(*it_position).second.find(res_code);
			if (it_char_count == (*it_position).second.end())
				it_char_count = (*it_position).second.insert(
						CharCount::value_type(res_code,0) ).first;
			(*it_char_count).second++;
		}
	}

	Profile::const_iterator it_position;		// Compiler complains about something around ::
	for (it_position = profile.begin();
			it_position != profile.end();
			++it_position) {
		cout << (*it_position).first << " ";
		const CharCount& char_count = (*it_position).second;
		vector< Pair<char,int> > char_count_vec;
		copy(char_count.begin(),char_count.end(),
				back_inserter(char_count_vec) );
		sort(char_count_vec.begin(),char_count_vec.end(),
				greater< Pair<char,int> >());
		int char_sum =
				accumulate(char_count_vec.begin(),char_count_vec.end(),(int)0);
		vector< Pair<char,int> >::const_iterator it_char_count;
		for (it_char_count = char_count_vec.begin();
				it_char_count != char_count_vec.end();
				++it_char_count)
			cout << (*it_char_count).first
					<< " " << (int)((float)(*it_char_count).second/char_sum*1000)/10.0
					<< "(" << (*it_char_count).second << ")"
					<< " ";
		cout << endl;
	}
}

