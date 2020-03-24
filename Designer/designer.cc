// General disclaimer: parts of this code were written,
// when the author had access
// to prehistoric C++ compilers (SGI, gnu) only. That's the main reason for
// some preposterous code for string handling. With the availability
// of modern C++ compilers in the far future, there may be a nicer
// version one day

// Headers to correct shortcomings of available SGI and g++ headers
// should be dispensed with for an ANSI C++ compiler!

//#include <bstring.h>
#include<string>

const int DUMMY_RETURN = 0;
const int LARGE_INT = 10000000;
const float LARGE_FLOAT = 1e60;

//

extern "C" {
	#include <sys/types.h>
	#include <sys/wait.h>
	#include <unistd.h>
}

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
//#include <iostream.h>
#include <fstream>
//#include <strstream>
#include <sstream>
#include <ctype.h>

#include <list.h>
#include <map.h>
#include <set.h>
#include <algo.h>
#include <cmath>
#include <vector>
#include<ctime>

#include "charmm_bind.h"
using namespace std;

#ifdef NOEDEBUGFULL		/// Flag to print out full NOE related debugging info
#define NOEDEBUG
#endif
#ifdef NOEDEBUG		/// Flag to print out NOE restraints used at each single and pair energy calculation 
#define NOEPRN
#endif

#ifdef NOEPRN		/// Flag to print out NOE info foreach each rotamer
//#define NOE
#define NOEWRTINFO
#endif

#ifdef NOEWRTINFO	/// Adds NOE sumary to WriteCombinations & WriteFullInf, 
#define NOE
#endif

#ifdef NOE
#ifndef NOEWRTINFO	/// Until fully tested, it will facilitate debugging if we keep NOEWRTINFO separate from NOE
#define NOEWRTINFO	/// But we want NOEWRTINFO to get NOE info on final output files (designer.0 files) as given
#endif			/// by writeAllCombinations.
#endif		

bool WriteFullInfo=false;	/// Flag==true once written full_info file. On a second attempt, break control flow. 13072006

void exitError(const string& str) {
	cout << str << endl;
	exit(1);
}

//     some utility functions 		// MASL, HSC, Toronto, 2006

template <typename T>
inline string ToString(const T& x){
        ostringstream os;
        os << x;
        return os.str();
}

const int buffer_size = 5000;
char buffer[buffer_size];

const char* getChars () {
	char c;
	char* bufferp = buffer;
	for (;;) {
		scanf("%c",&c);
		if (c == '#') break;
		if (c == '\n' || c == '\t') continue;
		*(bufferp++) = c;
		if (bufferp - buffer > buffer_size)
			exitError("buffer too small, exiting!");
	}
	*bufferp = '\0';
	return buffer;
}

int getInt() {
	int n = 9999;
	scanf("%d",&n);
	return n;
}

char getChar() {
	char c = '-';
	scanf("%c",&c);
	return c;
}

float getFloat() {
	float f = 999.999;
	scanf("%f",&f);
	return f;
}

ofstream ofs;
bool ofs_cout_flag;

ostream& open_ostream(const string& file_name) {
	ofs_cout_flag = true;
	if (file_name == "cout")
		return cout;
	else {
		ofs.open(file_name.c_str());
		if (!ofs)
			cout << "WARNING: cannot generate output file "
					<< file_name << ", goes to cout" << endl;
		else {
			ofs_cout_flag = false;
			return ofs;
		}
	}
	return cout;
}

void close_ostream() {
	if (!ofs_cout_flag);
		ofs.close();
}

ofstream append_stream;

void open_append_stream(const string& file_name) {
	append_stream.open(file_name.c_str(),ios::app);
	if (!append_stream)
		cout << "WARNING: cannot generate append output file "
				<< file_name << ", goes to cout" << endl;
}

void close_append_stream() {
	append_stream.close();
}

ifstream ifs;

istream& open_istream(const string& file_name) {
	ifs.open(file_name.c_str());
	if (!ifs)
		exitError("cannot open input file '" + file_name + "'");
	return ifs;
}

void close_istream() {
	ifs.close();
	ifs.clear();
}

char ibuffer[50];
string intToString(int i) {
	sprintf(ibuffer,"%d",i);
	return ibuffer;
}


string resStr(char res_code) {
	switch(res_code) {
	case 'A': return "ALA";
	case 'G': return "GLY";
	case 'V': return "VAL";
	case 'L': return "LEU";
	case 'I': return "ILE";
	case 'S': return "SER";
	case 'T': return "THR";
	case 'C': return "CYS";
	case 'M': return "MET";
	case 'P': return "PRO";
	case 'D': return "ASP";
	case 'N': return "ASN";
	case 'E': return "GLU";
	case 'Q': return "GLN";
	case 'K': return "LYS";
	case 'R': return "ARG";
	case 'H': return "HIS";
	case 'F': return "PHE";
	case 'Y': return "TYR";
	case 'W': return "TRP";
	case 'X': return "ALX";
	}
	return "XXX";
}

char resCode(const string& res_name) {
	if      (res_name == "ALA")
		return 'A';
	else if (res_name == "ARG")
		return 'R';
	else if (res_name == "ASN")
		return 'N';
	else if (res_name == "ASP")
		return 'D';
	else if (res_name == "CYS")
		return 'C';
	else if (res_name == "GLN")
		return 'Q';
	else if (res_name == "GLU")
		return 'E';
	else if (res_name == "GLY")
		return 'G';
	else if (res_name == "HIS")
		return 'H';
	else if (res_name == "HSD")
		return 'H';
	else if (res_name == "ILE")
		return 'I';
	else if (res_name == "LEU")
		return 'L';
	else if (res_name == "LYS")
		return 'K';
	else if (res_name == "MET")
		return 'M';
	else if (res_name == "PHE")
		return 'F';
	else if (res_name == "PRO")
		return 'P';
	else if (res_name == "SER")
		return 'S';
	else if (res_name == "THR")
		return 'T';
	else if (res_name == "TRP")
		return 'W';
	else if (res_name == "TYR")
		return 'Y';
	else if (res_name == "VAL")
		return 'V';
	else if (res_name == "ANY")
		return 'X';
	return 0;
}

int sizeChis(char res_code) {
	switch (res_code) {
	case 'G':
	case 'A':
		return 0;
	case 'C':
	case 'S':
	case 'T':
	case 'V':
		return 1;
	case 'D':
	case 'N':
	case 'H':
	case 'I':
	case 'L':
	case 'F':
	case 'P':
	case 'W':
	case 'Y':
		return 2;
	case 'E':
	case 'Q':
	case 'M':
		return 3;
	case 'R':
	case 'K':
		return 4;
	default:
		exitError("sizeChis: code not found " + string(&res_code,1));
	}
	return -1;
}

// 11052001
ostream& operator<<(ostream& os, const  vector<string>& str){
        if (str.empty())
           os<<"Nothing";
        copy(str.begin(),str.end(),ostream_iterator<string>(os, ", "));
        return os;
        }

ostream& operator<<(ostream& os, const map<string,string>& mp) {
        for (map<string,string>::const_iterator it = mp.begin();
            it != mp.end(); ++it){
            os << (*it).first << " = " << (*it).second << endl;
            };
        return os;
        }

ostream& operator<<(ostream& os, const map<string,vector<string> >& mp) {
        for (map<string,vector<string> >::const_iterator it = mp.begin();
            it != mp.end(); ++it){
            os << (*it).first << " = " << ((*it).second) << endl;
            };
        return os;
        }


//                          class Coordinate

class Coordinate {
public:
	Coordinate()
			: _x(888.888), _y(888.888), _z(888.888) {
	}
	Coordinate(float x, float y, float z)
			: _x(x), _y(y), _z(z) {
	}
	float x() const { return _x; }
	float y() const { return _y; }
	float z() const { return _z; }
	ostream& printDump(ostream& os) const;
	istream& readDump(istream& is);
	friend ostream& operator<<(ostream& os, const Coordinate& coordinate);
private:
	float _x, _y, _z;
};

ostream& Coordinate::printDump(ostream& os) const {
	return os << _x << " " << _y << " " << _z;
}

istream& Coordinate::readDump(istream& is) {
	return is >> _x >> _y >> _z;
}

ostream& operator<<(ostream& os, const Coordinate& coordinate) {
	os << "(" << coordinate._x << ","
			<< coordinate._y << "," << coordinate._z << ")";
	return os;
}


//                             class Dihedral



class Dihedral {
public:
	Dihedral();
	Dihedral(const string& first, const string& second, const string& third,
			const string& fourth, float angle);
	void addToAngle(float angle);
	const string& first() const;
	const string& second() const;
	const string& third() const;
	const string& fourth() const;
	float angle() const;
	float setAngle(float angle);
	float refAngle() const;
	ostream& printDump(ostream& os) const;
	istream& readDump(istream& is);
	friend ostream& operator<<(ostream& os, const Dihedral& dihedral);
private:
	string _first, _second, _third, _fourth;
	float _angle, _ref_angle;
};

Dihedral::Dihedral()
	: _first("XX"), _second("XX"), _third("XX"),
	_fourth("XX"), _angle(0.0), _ref_angle(0.0) {
}

Dihedral::Dihedral(const string& first, const string& second,
		const string& third, const string& fourth, float angle)
	: _first(first), _second(second), _third(third),
	_fourth(fourth), _angle(angle), _ref_angle(angle) {
}

void Dihedral::addToAngle(float angle) {
	_angle += angle;
}

const string& Dihedral::first() const {
	return _first;
}

const string& Dihedral::second() const {
	return _second;
}

const string& Dihedral::third() const {
	return _third;
}

const string& Dihedral::fourth() const {
	return _fourth;
}

float Dihedral::angle() const {
	return _angle;
}

float Dihedral::setAngle(float angle) {
	return _angle = angle;
}

float Dihedral::refAngle() const {
	return _ref_angle;
}

ostream& Dihedral::printDump(ostream& os) const {
	return os << _first << " " << _second << " "
			<< _third << " " << _fourth << " "
			<< _angle << " " << _ref_angle;
}

istream& Dihedral::readDump(istream& is) {
	return is >> _first >> _second >> _third >> _fourth
			>> _angle >> _ref_angle;
}

ostream& operator<<(ostream& os, const Dihedral& dihedral) {
	os << dihedral._first << " " << dihedral._second
			<< " " << dihedral._third << " " << dihedral._fourth
			<< " " << dihedral._angle << "(" << dihedral._ref_angle << ")";
	return os;
}



//                          class Rotamer



class Rotamer {
public:
	Rotamer();
	Rotamer(int id, char rescode);
	Rotamer(int id, char rescode, float probability);
	Rotamer& operator=(const Rotamer& rotamer);
	void empty();
	void addDihedral(const string& first, const string& second,
			const string& third, const string& fourth, float angle);
	void addDihedrals(char res_code, const vector<float>& chis);
 	void addToDihedralLevels(float angle, int level);
 	void addToDihedralAngle(int index, float angle);
	float setEnergy(float energy);
	#ifdef NOE
	float setNOEEnergy(float energy);	// NOE restraints term
						// User defined energy term could likewise be added
						// HSC, 16062006
	float setElecEnergy(float energy);
	float setVdwEnergy(float energy);
	#endif
	float setASPot(float aspot);
	float setASPotIsolated(float aspot);
	float setASPRatio(float aspot);
	float divideASPRatio(float aspot);
	float setTemplateBSPot(float bspot);
	void setProbability(float probability);
	float addEnergy(float delta_energy);
	void addASPotToEnergy();
	float addASPot(float delta_aspot);
	void setDihedralAngles(const vector<float>& angles);
	const vector<Coordinate>& coordinates() const;
	vector<Coordinate>& coordinatesRef();
	float setASA(float asa);
	int setIndex(int index);
	int index() const;
	float energy() const;
		// addEnergy ONLY adds to _energy, NOT _energy_ref
		// eg for adding entropy and the like
	#ifdef NOE
	float NOEEnergy() const {return _noe_energy;}		// NOE restraints term
                                                // HSC, 16062006
	float elecEnergy() const {return _elec_energy;}
	float vdwEnergy() const {return _vdw_energy;}
	#endif
	float energyRef() const;
	float aspot() const;
	float aspotIsolated() const;
	float aspotRatio() const;
	float templateBSPot() const;
	float probability() const;
	float asa() const;
	char resCode() const;
	int id() const;
	const list<Dihedral>& dihedrals() const;
	bool operator<(const Rotamer& rotamer) const;
	ostream& printDump(ostream& os) const;
	istream& readDump(istream& is);
	friend ostream& operator<<(ostream& os, const Rotamer& rotamer);
private:
	int _id;
	char _res_code;
	list<Dihedral> _dihedrals;
	vector<Coordinate> _coordinates;
	float _energy;
	#ifdef NOE
	float _noe_energy;  	/// You want to sort rotamers on the value of a user-defined enery term, like, NOE restraint term
				/// HSC, 16062006
	float _elec_energy;
	float _vdw_energy;	/// Also, we add two _elec_energy & _vdw_energy to the accessible properties of a Rotamer. Full info will show this.
	#endif
	float _energy_ref;
	float _aspot;
	float _aspot_isolated;
	float _aspot_ratio;
	float _template_bspot;
	float _asa;
	float _probability;
	int _index;
};

Rotamer::Rotamer()
		: _id(-1), _res_code('X'), _energy(0.0), 
		#ifdef NOE
		_noe_energy(0.0),
		_elec_energy(0.0),
		_vdw_energy(0.0),
		#endif
		_energy_ref(0.0), _aspot(0.0), _aspot_isolated(0.0),
		_aspot_ratio(1.0),
		_template_bspot(0.0), _asa(0.0), _index(0) {
}

Rotamer::Rotamer(int id, char rescode)
		: _id(id), _res_code(rescode), _energy(0.0),
		#ifdef NOE
		_noe_energy(0.0),
		_elec_energy(0.0),
		_vdw_energy(0.0),
		#endif
		_energy_ref(0.0), _aspot(0.0), _aspot_isolated(0.0),
		_aspot_ratio(1.0),
		_template_bspot(0.0),
		_asa(0.0), _index(0),
		_probability(1) {
}

Rotamer::Rotamer(int id, char rescode, float probability)
		: _id(id), _res_code(rescode), _energy(0.0),
		#ifdef NOE
		_noe_energy(0.0),
		_elec_energy(0.0),
		_vdw_energy(0.0),
		#endif
		_energy_ref(0.0), _aspot(0.0),  _aspot_isolated(0.0),
		_aspot_ratio(1.0),
		_template_bspot(0.0),
		_asa(0.0), _index(0),
		_probability(probability) {
}

	// necessary for GNU's inability to cope with
	// list and vector operator=
Rotamer& Rotamer::operator=(const Rotamer& r) {
	_id = r._id; _res_code = r._res_code;
	_dihedrals = r._dihedrals;
	_coordinates = r._coordinates;
	_energy = r._energy; _energy_ref = r._energy_ref;
	_aspot = r._aspot;
	_aspot_isolated = r._aspot_isolated;
	_aspot_ratio = r._aspot_ratio,
	_template_bspot = r._template_bspot;
	_asa = r._asa; _probability = r._probability;
	_index = r._index;
	return *this;
}

void Rotamer::empty() {
	_dihedrals.erase(_dihedrals.begin(),_dihedrals.end());
}

inline void Rotamer::addDihedral(const string& first,
		const string& second, const string& third,
		const string& fourth, float angle) {
	_dihedrals.push_back(Dihedral(first,second,third,fourth,angle));
}

float Rotamer::setEnergy(float energy) {
	return _energy = _energy_ref = energy;
}
#ifdef NOE 				// NOE DESIGNER, Miguel A. Santos, HSC, Toronto, 2006
float Rotamer::setNOEEnergy(float energy) {
	return _noe_energy = energy;
}
float Rotamer::setElecEnergy(float energy) {
	return _elec_energy = energy;
}
float Rotamer::setVdwEnergy(float energy) {
	return _vdw_energy = energy;
}
#endif 
float Rotamer::setASPot(float aspot) {
	return _aspot = aspot;
}

float Rotamer::setASPotIsolated(float aspot) {
	return _aspot_isolated = aspot;
}

float Rotamer::setASPRatio(float aspot) {
	return _aspot_ratio = aspot;
}

float Rotamer::divideASPRatio(float aspot) {
	if (aspot > 0.01)
		_aspot_ratio /= aspot;
	else
		_aspot_ratio = 0;
	return _aspot_ratio;
}

float Rotamer::setTemplateBSPot(float bspot) {
	return _template_bspot = bspot;
}

void Rotamer::setProbability(float probability) {
	_probability = probability;
}

float Rotamer::addEnergy(float delta_energy) {
	return _energy += delta_energy;
}

void Rotamer::addASPotToEnergy() {
	_energy += _aspot - _template_bspot;
}

float Rotamer::addASPot(float delta_aspot) {
	return _aspot += delta_aspot;
}

void Rotamer::setDihedralAngles(const vector<float>& angles) {
	//cout << "set dihedrals for " << *this << endl;
	//copy(angles.begin(),angles.end(),ostream_iterator<float>(cout," "));
	list<Dihedral>::iterator it_dihedral;
	vector<float>::const_iterator it_angle;
	for (it_dihedral = _dihedrals.begin(), it_angle = angles.begin();
			it_dihedral != _dihedrals.end() && it_angle != angles.end();
			++it_dihedral, ++it_angle) {
		(*it_dihedral).setAngle(*it_angle);
	}
	if (it_dihedral != _dihedrals.end() || it_angle != angles.end())
		exitError("Rotamer::setDihedralAngles bug: incompatible length");
}

void Rotamer::addDihedrals(char res_code,
		const vector<float>& chis) {
	switch (res_code) {
	case 'G':
	case 'A': break;
	case 'R':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","CD",chis[1]);
		addDihedral("CB","CG","CD","NE",chis[2]);
		addDihedral("CG","CD","NE","CZ",chis[3]);
		break;
	case 'N':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","OD1",chis[1]);
		break;
	case 'D':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","OD1",chis[1]);
		break;
	case 'C':
		addDihedral("N","CA","CB","SG",chis[0]);
		break;
	case 'Q':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","CD",chis[1]);
		addDihedral("CB","CG","CD","OE1",chis[2]);
		break;
	case 'E':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","CD",chis[1]);
		addDihedral("CB","CG","CD","OE1",chis[2]);
		break;
	case 'H':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","ND1",chis[1]);
		break;
	case 'I':
		addDihedral("N","CA","CB","CG1",chis[0]);
		addDihedral("CA","CB","CG1","CD",chis[1]);
		break;
	case 'L':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","CD1",chis[1]);
		break;
	case 'K':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","CD",chis[1]);
		addDihedral("CB","CG","CD","CE",chis[2]);
		addDihedral("CG","CD","CE","NZ",chis[3]);
		break;
	case 'M':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","SD",chis[1]);
		addDihedral("CB","CG","SD","CE",chis[2]);
		break;
	case 'F':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","CD1",chis[1]);
		break;
	case 'P':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","CD",chis[1]);
		break;
	case 'S':
		addDihedral("N","CA","CB","OG",chis[0]);
		break;
	case 'T':
		addDihedral("N","CA","CB","OG1",chis[0]);
		break;
	case 'W':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","CD1",chis[1]);
		break;
	case 'Y':
		addDihedral("N","CA","CB","CG",chis[0]);
		addDihedral("CA","CB","CG","CD1",chis[1]);
		break;
	case 'V':
		addDihedral("N","CA","CB","CG1",chis[0]);
		break;
	default:
		exitError("Rotamer::addDihedrals: unknown res_code");
	}
}

void Rotamer::addToDihedralLevels(float angle, int level) {
	list<Dihedral>::iterator it_dihedral;
	for (it_dihedral = _dihedrals.begin();
			it_dihedral != _dihedrals.end() && level--;
			++it_dihedral)
		(*it_dihedral).addToAngle(angle);
}

void Rotamer::addToDihedralAngle(int index, float angle) {
	list<Dihedral>::iterator it_dihedral;
	for (it_dihedral = _dihedrals.begin();
			it_dihedral != _dihedrals.end() && index;
			++it_dihedral, --index)
		;
	(*it_dihedral).addToAngle(angle);
}

const vector<Coordinate>& Rotamer::coordinates() const {
	return _coordinates;
}

vector<Coordinate>& Rotamer::coordinatesRef() {
	return _coordinates;
}

int Rotamer::setIndex(int index) {
	return _index = index;
}

int Rotamer::index() const {
	return _index;
}

float Rotamer::setASA(float asa) {
	return _asa = asa;
}

float Rotamer::energy() const {
	return _energy;
}

float Rotamer::energyRef() const {
	return _energy_ref;
}

float Rotamer::aspot() const {
	return _aspot;
}

float Rotamer::aspotIsolated() const {
	return _aspot_isolated;
}

float Rotamer::aspotRatio() const {
	return _aspot_ratio;
}

float Rotamer::templateBSPot() const {
	return _template_bspot;
}

float Rotamer::probability() const {
	return _probability;
}

float Rotamer::asa() const {
	return _asa;
}

char Rotamer::resCode() const {
	return _res_code;
}

int Rotamer::id() const {
	return _id;
}

const list<Dihedral>& Rotamer::dihedrals() const {
	return _dihedrals;
}

bool Rotamer::operator<(const Rotamer& rotamer) const {
	return _res_code < rotamer._res_code;
}

ostream& Rotamer::printDump(ostream& os) const {
	os << _id << " " << _res_code << " " << endl;
	os << _dihedrals.size() << " ";
	list<Dihedral>::const_iterator it_dihedral;
	for (it_dihedral = _dihedrals.begin();
			it_dihedral != _dihedrals.end();
			++it_dihedral)
		(*it_dihedral).printDump(os) << " ";
	os << endl;
	os << _coordinates.size() << " ";
	for (int i = 0; i < _coordinates.size(); ++i)
		_coordinates[i].printDump(os) << " ";
	os << endl;
	os << _energy << " " << _energy_ref << " "
		#ifdef NOEWRTINFO
		<< _elec_energy<< " " 
		<< _vdw_energy<< " " 
		<< _noe_energy<< " " 
		#endif
			<< _aspot << " " << _template_bspot << " "
			<< _asa << " " << _probability << " "
			<< _index;
	return os;
}

istream& Rotamer::readDump(istream& is) {
	is >> _id >> _res_code;
	int size, i;
	is >> size;
	for (i = 0; i < size; ++i) {
		_dihedrals.push_back(Dihedral());
		_dihedrals.back().readDump(is);
	}
	is >> size;
	for (i = 0; i < size; ++i) {
		_coordinates.push_back(Coordinate());
		_coordinates.back().readDump(is);
	}
	is >> _energy >> _energy_ref
		#ifdef NOEWRTINFO
		>> _elec_energy
		>> _vdw_energy
		>> _noe_energy
		#endif
			>> _aspot >> _template_bspot
			>> _asa >> _probability
			>> _index;
	return is;
}

ostream& operator<<(ostream& os, const Rotamer& rotamer) {
	os << "Rotamer " << rotamer._id
		<< "(" << rotamer._index << ")"
		<< " " << rotamer._res_code
		<< "  e " << rotamer._energy
		<< "  er " << rotamer._energy_ref
		#ifdef NOEWRTINFO
		<< "  el " << rotamer._elec_energy
		<< "  vdw " << rotamer._vdw_energy
		<< "  noe " << rotamer._noe_energy
		#endif
		<< "  as " << rotamer._aspot
		//<< "  asi " << rotamer._aspot_isolated   // before 05012001
		<< "  asi " << rotamer._asa
		<< "  asr " << rotamer._aspot_ratio
		<< "  bs " << rotamer._template_bspot
		//<< "  a " << rotamer._asa;
		<< "  p " << rotamer._probability;
	list<Dihedral>::const_iterator itr = rotamer._dihedrals.begin();
	for (; itr != rotamer._dihedrals.end(); ++itr)
		os << " /  " << *itr;
	//os << endl;
	//copy(rotamer._coordinates.begin(),rotamer._coordinates.end(),
	//		ostream_iterator<Coordinate>(os," "));
	return os;
}



//           class SolvationInfo



class SolvationInfo {
public:
	SolvationInfo();
	void readInfos(string filename);
	bool empty() const;
	void insert(string res, string type,
			float weight, float radius, float refvalue);
	void setIterators();
	float weight(char res_code, string atom_type);
	float weight(string res_name, string atom_type);
	float radius(char res_code, string atom_type);
	float radius(string res_name, string atom_type);
private:
	struct Info {
		Info(float weight, float radius)
			: _weight(weight), _radius(radius) { }
		float weight() const { return _weight; };
		float radius() const { return _radius; };
		float _weight;
		float _radius;
	};
	Info _dummy_info;
	const Info& info(char res_code, string atom_type);
	typedef map< string, Info, less<string> > TypeInfo;
	typedef map< char, TypeInfo, less<char> > ResTypeInfo;
	ResTypeInfo	_res_type_info;
	ResTypeInfo::const_iterator _it_last_res_type_info;
	ResTypeInfo::const_iterator _it_any_type_info;
	bool _empty;
};

SolvationInfo::SolvationInfo()
	: _dummy_info(0,0), _empty(true) {
}

bool SolvationInfo::empty() const {
	return _empty;
}

void SolvationInfo::insert(string res, string type,
		float weight, float radius, float refvalue) {

	//cout << "inserting " << res << " " << type << " " << weight << endl;
	char res_code = resCode(res);
	ResTypeInfo::iterator it_res_type_info
			= _res_type_info.find(res_code);
	if (it_res_type_info != _res_type_info.end())
		(*it_res_type_info).second.insert(
				TypeInfo::value_type(type,Info(weight,radius)) );
	else {
		it_res_type_info = _res_type_info.insert(
				ResTypeInfo::value_type(res_code,TypeInfo()) ).first;
		(*it_res_type_info).second.insert(
				TypeInfo::value_type(type,Info(weight,radius)) );
	}
}

void SolvationInfo::setIterators() {
	_it_last_res_type_info = _res_type_info.end();
	_it_any_type_info = _res_type_info.find(resCode("ANY"));
}

const SolvationInfo::Info& SolvationInfo::info(char res_code, string type) {
	ResTypeInfo::const_iterator it_res_type_info;
	if (_it_last_res_type_info == _res_type_info.end() ||
			(*_it_last_res_type_info).first != res_code)
		_it_last_res_type_info = _res_type_info.find(res_code);
	if (_it_last_res_type_info == _res_type_info.end())
		_it_last_res_type_info = _res_type_info.find(resCode("ANY"));
	if (_it_last_res_type_info == _res_type_info.end())
		exitError(string("SolvationInfo::info: unknown res_code ANY ")
				+ resCode("ANY"));

	TypeInfo::const_iterator it_type_info =
			(*_it_last_res_type_info).second.find(type);
	if (it_type_info == (*_it_last_res_type_info).second.end()) {
		if (_it_any_type_info == _res_type_info.end())
			exitError(string("SolvationInfo::info: unknown (res,type), ")
					+ res_code + " " + type);
		it_type_info = (*_it_any_type_info).second.find(type);
		if (it_type_info == (*_it_any_type_info).second.end()) {
			string dummy_type = type.substr(0,1) + "*";
			it_type_info = (*_it_any_type_info).second.find(dummy_type);
			if (it_type_info == (*_it_any_type_info).second.end()) {
				//exitError(string("SolvationInfo::info: unknown (res,type), ")
				//		+ res_code + " " + type);
				//cout << string("SolvationInfo::info: unknown (res,type), ")
				//		+ res_code + " " + type << endl;
				return _dummy_info;
			}
		}
	}
	return (*it_type_info).second;
}

float SolvationInfo::weight(char res_code, string type) {
	return info(res_code,type).weight();
}

float SolvationInfo::weight(string res, string type) {
	return info(resCode(res),type).weight();
}

float SolvationInfo::radius(char res_code, string type) {
	return info(res_code,type).radius();
}

float SolvationInfo::radius(string res, string type) {
	return info(resCode(res),type).radius();
}

void SolvationInfo::readInfos(string filename) {
	ifstream infile(filename.c_str());
	if (!infile) {
		exitError("no infile " + filename + ", exiting!");
	}
	
	char buffer[300];
	char str[300], res[10], type[10];
	float weight, radius, refvalue;
	while (infile.getline(buffer,300)) {
		sscanf(buffer,"%s",str);
		if (!resCode(str))
			continue;
		sscanf(buffer,"%s %s %f %f %f",res,type,&weight,&radius,&refvalue);
		insert(res,type,weight,radius,refvalue);
	}
	setIterators();
	_empty = false;
}



#ifdef NOE
/// 			Classs NOErestraints
/*
vector<string > noeRest;			/// Reading NOE restraints file. Uses ToString
float noeScale=1.0;			
inline int readNOE(const char* filen){
        noeRest.clear();			/// Miguel A. Santos, HSC, Toronto, 2006
        ifstream is(filen);
        if(!is) {
                cout<<"Error reading file "<<filen<<endl;
                //exit(0);
        }
        int i=0;
        cout<<"Reading NOE restraints "<<filen<<endl;
        char ch[200];
        while(is.getline(ch,200)){
                noeRest.push_back(ToString(ch));
                i++;
                cout<<"DEBUGGING: Found noeRest:"<<noeRest[i-1]<<endl;
                //cout<<"Found noe: "<<ch<<endl;
                //cout<<"in noeRest:"<<ToString(ch)<<endl;
        }
        is.close();
        return i;
}
*/

typedef pair<int,int> noePairPos;					/// Reading NOE restraints file. Uses ToString
ostream& operator<< (ostream& os, const noePairPos& p) {		/// Miguel A. Santos, HSC, Toronto, 2006
   os << "( "<<p.first<< " , " << p.second << " )" <<endl;
}

class NOErestraints{
        map<string,noePairPos> _noeRest;
        int _noenum;
	float _noeScale;
	char* _filen;			
        map< int, bool > _designPosition;
	int _readNOE(const char* filen);
public:
        NOErestraints();
	int readNOE(const char* filen, const vector<int >& despos);	/// In slave.einp script, it is read_sing_dump that provides with despos data.
        noePairPos getnoePairPos(const char* x);
        vector<string> getRestraints();
        vector<string> getRestraints(const int pos);
        vector<string> getRestraints(const int pos1, const int pos2);
        vector<string> getRestraintsWithTemplate(const int& pos);
        vector<string> getRestraintsSingle(const int& pos);
        map<string,noePairPos> full(){ return _noeRest;}
	void setScale(float scale){ _noeScale=scale;}
	float getScale(){return _noeScale;}
        void setDesignPos(const vector< int>& despos);
	void reset();
	void printRestraints(vector<string > noeres);
	int number(){return _noenum;}
	//void print();
	//friend ostream& operator<<(ostream& os, const map<string,noePairPos> NOEres);
};
	
void NOErestraints::printRestraints(vector<string > noeres){
	#ifdef NOEDEBUGFULL
        cout<<"DEBUGGING: printRestraints: "<<noeres.size()<<endl;
	#endif
	for(vector<string >::iterator it=noeres.begin();it!=noeres.end();it++)
		cout<<"NOE: "<<*it<<endl;
}
	
void NOErestraints::reset(){
	_noeRest.clear();
        _noenum=0;
	_noeScale=1.0;
	_filen="\0";
	_designPosition.clear();
}

NOErestraints::NOErestraints(){
	reset();
}
noePairPos NOErestraints::getnoePairPos(const char* x){
        istringstream is;
        is.str(ToString(x));
        string str;
        noePairPos pos;
        int i=0,a=9999,b=9999;
        while(is >> str) {
		i++;
		#ifdef NOEDEBUGFULL
                cout<<"DEBUGGING: NOErestraints::getnoePairPos: "<<i<<": "<<str<<" ";
		#endif
                if(i==5 || i==14){
                        if(i==5)  a=atoi(str.c_str());
                        if(i==14) b=atoi(str.c_str());
			#ifdef NOEDEBUGFULL
                        cout<<"\nPos="<<i<<endl;
			#endif
                        pos=noePairPos(a,b);
                }
		#ifdef NOEDEBUGFULL
		else 
			cout<<endl;
		#endif
        }
	#ifdef NOEDEBUG
        cout<<"\nDEBUGGING: NOErestraints::getnoePairPos: Pos: Pair["<<a<<"]="<<pos.second<<"; b="<<b<<endl;
	#endif
        return pos;
}

int NOErestraints::readNOE(const char* filen, const vector<int >& despos){
	//*_filen=*filen;  /// gives segmentation fault at runtime.
	#ifdef NOEDEBUGFULL
        cout<<"DEBUGGING: NOErestraints::readNOE found "<<despos.size()<<" designed positions with restraints file "<<filen<<endl;
	#endif
	if(despos.empty())
		exitError("ERROR: NOErestraints::readNOE found no designed positions!");
	setDesignPos(despos);
	return _readNOE(filen);
}
void NOErestraints::setDesignPos(const vector< int>& despos){
	#ifdef NOEDEBUG
        cout<<"DEBUGGING: setDesignPos: Found "<<despos.size()<<" positions for design: ";
	#endif
        for(int i=0;i<despos.size();i++){
                _designPosition.insert(pair<int, bool > (despos[i],true));
		#ifdef NOEDEBUG
        	cout<<despos[i]<<" ";
		#endif
	}
	#ifdef NOEDEBUG
        cout<<endl;
	#endif
}
int NOErestraints::_readNOE(const char* filen){
        _noeRest.clear();
	pair<map<string, noePairPos>::iterator,bool> insertResult;
        ifstream is(filen);
        if(!is) {
                cout<<"ERROR: NOErestraints::readNOE Error reading file "<<filen<<endl;
                exit(0);
        }
        int i=0;
	#ifdef NOEDEBUGFULL
        cout<<"DEBUGGING: Reading NOE restraints "<<filen<<endl;
	#endif
        char ch[200];
        string str;
        while(is.getline(ch,200) ){
                //_noeRest[ToString(ch)]=getnoePairPos(ch);
                //cout<<"DEBUGGING: Found noeRest: "<<_noeRest.first<<endl;
                insertResult=_noeRest.insert (make_pair (ToString(ch),getnoePairPos(ch)) );
	#ifdef NOEDEBUG
                cout<<"DEBUGGING: Found noeRest: "<<insertResult.first->first<<endl;
	#endif
        }
        cout<<endl;

        is.close();
        _noenum=_noeRest.size();
        return _noenum;
}
vector<string > NOErestraints::getRestraints(){
        vector<string > noe;
        //noe.clear();
        for(map<string,noePairPos>::iterator it=_noeRest.begin();it!=_noeRest.end();it++)
                        noe.push_back((*it).first);
        return noe;
}
vector<string > NOErestraints::getRestraints(const int pos){
        vector<string > noe; //noe.clear();
	int n=0;
	//cout<<"DEBUGGING: getRestraints: pos="<<pos<<endl;
        for(map<string,noePairPos>::iterator it=_noeRest.begin();it!=_noeRest.end();it++){
		//cout<<"DEBUGGING: getRestraints: checking restraint "<<n++<<" "<<((*it).second).first<<" "<< \
		( ((*it).second).first == ((*it).second).second? 1:0)<<endl;
                if( ((*it).second).first == pos && ((*it).second).second == pos ){
                        noe.push_back((*it).first);
			//cout<<*(noe.end()-1)<<endl;
		}
	}
        return noe;
}
vector<string > NOErestraints::getRestraints(const int pos1, const int pos2){
        vector<string > noe;
        noe.clear();
        for(map<string,noePairPos>::iterator it=_noeRest.begin();it!=_noeRest.end();it++)
                if( ((*it).second).first == pos1 && ((*it).second).second == pos2 )
                        noe.push_back((*it).first);
	#ifdef NOEDEBUG
        cout<<"DEBUGGING: getRestraints: Found "<<noe.size()<<" Pair-restraints for positions "<<pos1<<" , "<<pos2<<endl;
	#endif
        return noe;
}
vector<string> NOErestraints::getRestraintsWithTemplate(const int& pos){
        vector<string > noe;
	//print();
        for(map<string,noePairPos>::iterator it=_noeRest.begin();it!=_noeRest.end();it++) {
                if( ( ((*it).second).first == pos && ! _designPosition[((*it).second).second] ) || ( ((*it).second).second == pos && ! _designPosition[((*it).second).first] ) ) 
                        noe.push_back((*it).first);
		#ifdef NOEDEBUG
        	cout<<"DEBUGGING: getRestraintsWithTemplate: "
		    <<"( "<<((*it).second).first <<" == "<<pos<<" && !"<<_designPosition[((*it).second).second]<<" ) || "
		    <<"( "<<((*it).second).second<<" == "<<pos<<" && !"<<_designPosition[((*it).second).first]<<" )"
		<<endl;
		#endif
	}
	#ifdef NOEDEBUG
        cout<<"DEBUGGING: getRestraintsWithTemplate: Found "<<noe.size()<<"("<<_noeRest.size()<<")"<<" template-restraints for position "<<pos<<endl;
	#endif
        return noe;

}
vector<string> NOErestraints::getRestraintsSingle(const int& pos){
        vector<string > noeS=getRestraints(pos);
        vector<string > noeT=getRestraintsWithTemplate(pos);
        for(vector<string>::iterator it=noeT.begin();it!=noeT.end();it++)
                noeS.push_back(*it);
	#ifdef NOEDEBUG
        cout<<"DEBUGGING: getRestraintsSingle: Found "<<noeS.size()<<"("<<_noeRest.size()<<")"<<" single-restraints for position "<<pos<<endl;
	#endif
        return noeS;
}

/*
ostream& operator<<(ostream& os, const map<string,noePairPos> NOEres){
        for(map<string,noePairPos>::iterator it=NOEres.begin();it!=NOEres.end();it++) {
		os<<"("<<((*it).second).first<< (this._designPosition[((*it).second).first]?"*, ":" , ")
		      <<((*it).second).second<< (this._designPosition[((*it).second).second]?"*) :  ":")  :  ")
		  <<(*it).first<<endl;
	}
	return os;
}
void NOErestraints::print(){
	cout<<"NOE: #restrainst="<<_noenum
		<<" , Scale= "<<_noeScale
		<<" , file= "<<_filen
		<<endl;
	cout<<"Design positions: ";
	for(map< int, bool >::iterator it=_designPosition.begin();it!=_designPosition.end();it++)
		if(it->second)
			cout<<it->first<<" ";
	cout<<endl;
	string s1,s2;
	cout<<"NOE: Restraints:\n";
	for(map<string,noePairPos>::iterator it=_noeRest.begin();it!=_noeRest.end();it++){
		s1=_designPosition[(it->second).first]?"*, ":" , ";
		s2=_designPosition[(it->second).second]?"*) ":"   ";
		//cout<<"NOE: ( "<<(it->second).first<<_designPosition[(it->second).first]?"*, ":" , "
		//<<(it->second).second<<_designPosition[(it->second).second]?"*) ":"   "
		cout<<"NOE: ( "<<(it->second).first<<s1
		<<(it->second).second<<s2
		<<it->first
		<<endl;
	}
		
}
*/
NOErestraints NOEres;	// NOE DESIGNER, Miguel A. Santos, HSC, Toronto, 2006.

#endif



//             Charmm computations

class CharmmComputations {
public:
	CharmmComputations();
	~CharmmComputations();
	void setDummyResCode(char dummy_res_code);
	void setConsParam(const string& cons_param);
	void setTemplateEnergy(float template_energy);
	float templateEnergy();
	float templateEnergyVdw();
	float templateEnergyElec();
	void setTemplateEnergyVdw(float template_energy_vdw);
	void setTemplateEnergyElec(float template_energy_elec);
	#ifdef NOE
	float templateEnergyNOE();
	void setTemplateEnergyNOE(float template_energy_noe);
	#endif
	void setConsHarmForce(float force);
	void setIncludeBackboneFlag(int include_backbone_flag);
	int IncludeBackboneFlag();
	void setConsFlag(int cons_flag);
	void setUpdaParam(const string& upda_param);
	void setHbonParam(const string& hbon_param);
	void setSurfParam(const string& surf_param);
	void setMiniParam(const string& mini_param);
	void setMiniFlag(int mini_flag);
	void setHbonFlag(int mini_flag);
	void setSingleCoordinatesFlag(int single_coordinates_flag);
	void setSkipMiniParam(const string& skip_mini_param);
	void setSkipEnerParam(const string& skip_ener_param);
	void setEnerSelection(const string& skip_ener_param);
	void setSolvSkipParam(const string& skip_solv_param);
	void setGBornParam(const string& gborn_param);
	void setACEParam(const string& ace_param);
	void setExtraEnerFlag(int extra_ener_flag);
	void setNoSelfFlag(int no_self_flag);
	void setSeperateEnergyFlag(int seperate_energy_flag);
	void setSolvationParamFile(const string& solvation_param_file);
	void readPairSolvationParamFile(const string& solvation_param_file);
	void setASPFactor(float factor);
	float ASPFactor() const;
	void setPairTemplateFactor(float factor);
	void setLocalTemplateFlag(int flag);
	void setAllAtomsFlag(int flag);
	int AllAtomsFlag() const;
	float templateBSPotFactor() const;
	void cmBuild();
	void cmUpdate();
	void Skip();
	void patchResidue(char res_code, int pos_number,
			const string& segid);
	//-void patchResidueMA(char res_code, int pos_number,
	//-		const string& segid);
	void fixTemplate(const vector<int>& pos_numbers, const vector<string>& segids,
			bool include_backbone);
	void selectIResidue(int pos_number,
			const string& segid);
	void selectIResidues(vector<int>& pos_numbers,
			vector<string>& segids);
	void minimizeAroundDihedrals(const Rotamer& rotamer, int pos_number, const string& segid );
	void selectISelection(const string& selection);
	void selectJSelection(const string& selection);
	float inteIJSel();
	void selectKSelection(const string& selection);
	void selectLSelection(const string& selection);
	void selectEnerSelection();
	float inteKLSel();
	float inteILSel();
	float inteJKSel();
	void selectJResidue(int pos_number,
			const string& segid);
	void selectKResidueBack(int pos_number, const string& segid);
	void selectLResidueBack(int pos_number, const string& segid);
	void selectComplementJResidue(int pos_number,
			const string& segid);
	void selectIniIResidue(int pos_number,
			const string& segid);
	void selectIniJResidue(int pos_number,
			const string& segid);
	void sslctAround(const string& str);
	void sslctAndNot(const string& str);
	void coorInitIniI();
	void coorInitIniJ();
	void coorInitK();
	void coorInitL();
	float minDistanceIJSelect();
	//void setNTerminal(int n_terminal);
	//void setCTerminal(int c_terminal);
	int nres();
	char getResCode(int index);
	void getIniICoordinates(const string& segid,
			int number, vector<Coordinate>& coordinates);
	void setRotamerCoordinates(const string& segid,
			int number, const Rotamer& rotamer, int* flags);
	void setRotamerIniICoordinates(const string& segid,
			int number, const Rotamer& rotamer);
	void setRotamerIniJCoordinates(const string& segid,
			int number, const Rotamer& rotamer);
	void checkTerminus();
	void setTerminus(pair<int,string> position, string prefix);
	void fixSele(const string& fix_sele);
	void patchDummyResidue(int pos_number, const string& segid);
	void computeASA();
	float getASA(const string& sele_cmd);
	void computeSurface();
	float aspotAll();
	float aspotAll(const string& sele_cmd);
	float aspotSslct();
	pair<float,float> getWeightedASA(char res_code, const string& sele_cmd);
	pair<float,float> getWeightedASA(char res_code, const int* flags);
		// patches the second position, eg, in a GLY-X-GLY psf:
	float freeASA(const Rotamer& rotamer, const string& segid);
	float getResidASA(int resid, const string& segid);
		// call before getRotamerDihedrals after change of coordinates:
	void icFill() const;
	void icDiff() const;
	void getRotamerDihedrals(const string& segid, int number,
			const Rotamer& rotamer, vector<float>& dihedral_angles);
	float getPhiDihedral(const string& segid, int number);
	float getPsiDihedral(const string& segid, int number);
	float distance(
			int number1, const string& segid1,
			int number2, const string& segid2);
	float invalidAngle() const;
	float defaultPhi() const;
	float defaultPsi() const;
	pair<float,int> getRMS(const string& segid, int number);
	void editDihedral(const Rotamer& rotamer,
			int pos_number, const string& segid) const;
	void setDihedral(const Rotamer& rotamer,
			int pos_number, const string& segid) const;
	void setPhiPsi(float phi, float psi,
			int pos_number, const string& segid) const;
	void readSolvationReference(istream& is);
	float eef1FromISelect() const;
	float eef1FromJSelect() const;
	float eef1FromAll() const;
	void setSolvFlag(int cmsolv_flag);
	int SolvFlag() const;
	float SolvEnergy();
	void activateGB();
	float energySingleRotamer(const Rotamer& rotamer, int pos_number,
			const string& segid);
	pair<float,float> aspotSingleRotamer(int pos_number,const string& segid,char res_code);
	pair<float,float> aspotSingleRotamer(
			const Rotamer& rotamer, int pos_number,
			const string& segid);
	pair<float,float> aspotSingleRotamerIsolated(
			const Rotamer& rotamer, int pos_number,
			const string& segid);
	float bspotSingleRotamer(int pos_number,
			const string& segid, float residue_aspot,
			float template_aspot);
	float bspotSingleRotamer(const Rotamer& rotamer, int pos_number,
			const string& segid, float residue_aspot,
			float template_aspot);
	void aspotTest(int pos_number, char res_code, const string& segid);
	float energyBuiltRotamer(const Rotamer& rotamer, int pos_number,
			const string& segid);
	float minimizeSingleRotamer(const Rotamer& rotamer, int pos_number,
			const string& segid);
	float energyPairRotamers(const Rotamer& rotamer1, const Rotamer& rotamer2,
			int pos_number1, const string& segid1,
			int pos_number2, const string& segid2);
	void unfix() const;
	void eef1Energy() const;
	//void eef1InteEnergy() const;
	float CharmmComputations::eef1PairRotamers(
			const Rotamer& rotamer1, const Rotamer& rotamer2,
			float template_aspot) const;
	float bspotPairRotamers(const Rotamer& rotamer1, const Rotamer& rotamer2,
			int pos_number1, const string& segid1,
			int pos_number2, const string& segid2,
			float template_aspot);
	float bspotPairRotamersIsolated(const Rotamer& rotamer1,
			const Rotamer& rotamer2,
			int pos_number1, const string& segid1,
			int pos_number2, const string& segid2,
			float template_aspot);
	float energyVecRotamers(
			const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
			const vector<int>& pos_numbers,
			const vector<string>& segids, bool include_backbone);
	float solvationVecRotamers(
			const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
			const vector<int>& pos_numbers,
			const vector<string>& segids, bool include_backbone);
	float energyFoldedStructure(
			const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
			const vector<int>& pos_number,
			const string& segid);	
	float energyRefStructure(
			const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
			const vector<int>& pos_number,
			const vector<string>& segids);
	float lastVdwEnergy() const;
	float lastElecEnergy() const;
	#ifdef NOE
	float lastNOEEnergy() const;		/// For getting pair rotamer NOE restraint energy, MA. Santos, HSC, Toronto, 2006
	#endif
	int miniFlag() const;
	int singleCoordinatesFlag() const;
		// symmetry correction according to Dunbrack, Cohen paper:
	void symmetryCorrect(Rotamer& rotamer,
			vector<float>& angles, int pos_number, string segid);
	void symmetryCorrectAngleVector(const Rotamer& rotamer,
			vector<float>& diff_dihedrals);
	void writePDB(const string& file_name);
	float writeShortInfo(ostream& os,
			const vector< vector<float> >& pair_energies,
			int number,
			const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
			const vector<int>& pos_numbers, const vector<string>& segids);
	void writeSolvation(ostream& os, float ener2gy,
			const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
			int number);
	float getShortEnergy(
			const vector< vector<float> >& pair_energies,
			const vector<list<Rotamer>::const_iterator>& vec_it_rotamer);
	void writeShortRefInfo(ostream& os, int number,
			const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
			const vector<int>& pos_numbers, const vector<string>& segids);
	void writeFullInfo(ostream& os, int number,
			const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
			const vector<int>& pos_numbers,
			const vector<string>& segids,
			const vector< vector<float> >& pair_energies,
			#ifdef VDWELEC
			const vector< vector<float> >& pair_vdw_energies,
			const vector< vector<float> >& pair_elec_energies,
			#endif
			#ifdef NOEWRTINFO
			const vector< vector<float> >& pair_noe_energies,
			#endif
			const vector< vector<float> >& pair_solv_energies,
			float solvation);
	void printIslct();
	void printJslct();
	void printKslct();
	void printLslct();
	void printIniIslct();
	void printIniJslct();
	void printSslct();
	ostream& printDump(ostream& os);
	istream& readDump(istream& is);
private:
	#ifdef VDWELEC
	float _last_elec_energy;
	float _last_vdw_energy;
	#endif
	#ifdef NOE
	float _last_noe_energy; // added 18052006 for NOE computations, Miguel A. Santos, HSC, Toronto.
	float _template_energy_noe;
	#endif
	float _include_backbone_energy;
	float _template_energy;
	float _template_energy_vdw;
	float _template_energy_elec;
	float _ref_structure_energy;
	string _backbone_selection_full;
	string _backbone_selection;
	string _cons_param;
	int _cons_flag;
	float _cons_harm_force;
	string _mini_param;
	int _mini_flag;
	int _hbon_flag;
	int _cmsolv_flag;
	int _include_backbone_flag;
	string _upda_param;
	string _hbon_param;
	string _skip_mini_param;
	string _skip_ener_param;
	bool _ener_selection_flag;
	string _ener_selection;
	string _skip_solv_param;
	string _gborn_param;
	string _ace_param;
	string _solv_type;
	string _surf_param;
	string _solvation_param_file;
	map < char, float, less<char> > _solvation_reference;
	float _surface_potential_factor;
	float _template_bspot_factor;
	int _local_template_flag;
	int _all_atoms_flag;
	map<pair<int,string>, string> _pref_patch;
	string _fix_sele;
	SolvationInfo _solvation_info;
	int _extra_ener_flag;
	int _no_self_flag;
	int _single_coordinates_flag;
	char _dummy_res_code;
	string _rms_exclusion;
	int getAtomNumber(const string& selection);
	int _flags_size;
	int* _flags;
	int _islct_size;
	int* _islct;
	int _jslct_size;
	int* _jslct;
	int _kslct_size;
	int* _kslct;
	int _lslct_size;
	int* _lslct;
	int _ini_islct_size;
	int* _ini_islct;
	int _ini_jslct_size;
	int* _ini_jslct;
	int _sslct_size;
	int* _sslct;
	void checkFlagsSize(int size);
	void checkIslctSize(int size);
	void checkJslctSize(int size);
	void checkKslctSize(int size);
	void checkLslctSize(int size);
	void checkIniIslctSize(int size);
	void checkIniJslctSize(int size);
	void checkSslctSize(int size);
	float _default_phi;
	float _default_psi;
	//int _n_terminal;
	//int _c_terminal;
};

//int* _flags;

CharmmComputations::CharmmComputations() {
	//_backbone_selection_full = string(" ( TYPE N .OR. TYPE HN ")
	_backbone_selection_full = string(" ( TYPE N .OR. TYPE HN .OR. TYPE H ")
		+ " .OR. TYPE HA .OR. TYPE CA .OR. TYPE C .OR. TYPE O "
		+ " .OR. TYPE OT1 .OR. TYPE OT2 "
		+ " .OR. TYPE HA1 "
		+ " .OR. TYPE HT1 .OR. TYPE HT2 .OR. TYPE HT3 ) ";
	_backbone_selection = _backbone_selection_full;
	//_backbone_selection = " ( TYPE N .OR. TYPE CA .OR. TYPE C ) ";
	//_backbone_selection = " ( TYPE H .OR. TYPE N .OR. TYPE CA .OR. TYPE C .OR. TYPE O ) ";
	_mini_param = "CONJ NSTEP 50 NPRINT 10"; //19022001
	_mini_flag = 0;
	_hbon_flag = 0;
	_cmsolv_flag = 0;
	_solv_type = "";
	_fix_sele = "NONE";
	_include_backbone_flag = 0; // 14102001 include_backbone = false (used in threadcomb()) is the default
	_cons_param = "FORCE 200 PERI 0";
	_cons_flag = 1;
	_cons_harm_force = 0;
	_upda_param = "RDIE SWITCH CTONNB 6.0 CTOFNB 7.0 CUTNB 8.0";
	_hbon_param = "";
	_skip_mini_param = "NONE ASP";
	_skip_ener_param = "NONE";
	_ener_selection_flag = false;
	_ener_selection = "nothing";
	_skip_solv_param = "ALL EXCL ASP";
	_gborn_param = "";
	_ace_param = "";
	_surf_param = "ACCE RPROBE 1.4 ACCU 0.1";
	_extra_ener_flag = 1;
	_single_coordinates_flag = 1;  //31102000
	_no_self_flag = 0;
	_dummy_res_code = 'X';
	//_dummy_res_code = 'A';
	_surface_potential_factor = 1;
	_template_bspot_factor = 1;
	_local_template_flag = 1;
	_all_atoms_flag = 0;   // united atoms default
	_rms_exclusion =  string(".NOT. HYDROGEN")
		+ " .AND. .NOT. " + _backbone_selection_full;
	_flags_size = 1000;
	_flags = (int*)calloc(_flags_size,sizeof(int));
	_islct_size = 1000;
	_islct = (int*)calloc(_islct_size,sizeof(int));
	_jslct_size = 1000;
	_jslct = (int*)calloc(_jslct_size,sizeof(int));
	_kslct_size = 1000;
	_kslct = (int*)calloc(_kslct_size,sizeof(int));
	_lslct_size = 1000;
	_lslct = (int*)calloc(_lslct_size,sizeof(int));
	_ini_islct_size = 1000;
	_ini_islct = (int*)calloc(_ini_islct_size,sizeof(int));
	_ini_jslct_size = 1000;
	_ini_jslct = (int*)calloc(_ini_jslct_size,sizeof(int));
	_sslct_size = 1000;
	_sslct = (int*)calloc(_sslct_size,sizeof(int));
	_default_phi = -90.0;
	_default_psi = 120;
	//_n_terminal = 1;
	//_c_terminal = -1;
}

CharmmComputations::~CharmmComputations() {
	free(_flags);
	free(_islct);
	free(_jslct);
	free(_kslct);
	free(_lslct);
	free(_ini_islct);
	free(_ini_jslct);
	free(_sslct);
}

void CharmmComputations::checkFlagsSize(int size) {
	if (size > _flags_size) {
		_flags_size = size;
		free(_flags);
		_flags = (int*)calloc(_flags_size,sizeof(int));
	}
}

void CharmmComputations::checkIslctSize(int size) {
	if (size > _islct_size) {
		_islct_size = size;
		free(_islct);
		_islct = (int*)calloc(_islct_size,sizeof(int));
	}
	else
		while (size--) _islct[size] = 0;
}

void CharmmComputations::checkJslctSize(int size) {
	if (size > _jslct_size) {
		_jslct_size = size;
		free(_jslct);
		_jslct = (int*)calloc(_jslct_size,sizeof(int));
	}
	else
		while (size--) _jslct[size] = 0;
}

void CharmmComputations::checkKslctSize(int size) {
	if (size > _kslct_size) {
		_kslct_size = size;
		free(_kslct);
		_kslct = (int*)calloc(_kslct_size,sizeof(int));
	}
	else
		while (size--) _kslct[size] = 0;
}

void CharmmComputations::checkLslctSize(int size) {
	if (size > _lslct_size) {
		_lslct_size = size;
		free(_lslct);
		_lslct = (int*)calloc(_lslct_size,sizeof(int));
	}
	else
		while (size--) _lslct[size] = 0;
}

void CharmmComputations::checkIniIslctSize(int size) {
	if (size > _ini_islct_size) {
		_ini_islct_size = size;
		free(_ini_islct);
		_ini_islct = (int*)calloc(_ini_islct_size,sizeof(int));
	}
	else
		while (size--) _ini_islct[size] = 0;
}

void CharmmComputations::checkIniJslctSize(int size) {
	if (size > _ini_jslct_size) {
		_ini_jslct_size = size;
		free(_ini_jslct);
		_ini_jslct = (int*)calloc(_ini_jslct_size,sizeof(int));
	}
	else
		while (size--) _ini_jslct[size] = 0;
}

void CharmmComputations::checkSslctSize(int size) {
	if (size > _sslct_size) {
		_sslct_size = size;
		free(_sslct);
		_sslct = (int*)calloc(_sslct_size,sizeof(int));
	}
	else
		while (size--) _sslct[size] = 0;
}

void CharmmComputations::setDummyResCode(char dummy_res_code) {
	_dummy_res_code = dummy_res_code;
}

void CharmmComputations::setMiniParam(const string& mini_param) {
	_mini_param = mini_param;
}

void CharmmComputations::setMiniFlag(int mini_flag) {
	_mini_flag = mini_flag;
}

void CharmmComputations::setSolvFlag(int cmsolv_flag) {
	_cmsolv_flag = cmsolv_flag;
}

void CharmmComputations::setHbonFlag(int flag) {
	_hbon_flag = flag;
}

void CharmmComputations::setASPFactor(float factor) {
	_surface_potential_factor = factor;
}

float CharmmComputations::ASPFactor() const {
	return _surface_potential_factor;
}

void CharmmComputations::setPairTemplateFactor(float factor) {
	_template_bspot_factor = factor;
}

void CharmmComputations::setLocalTemplateFlag(int flag) {
	_local_template_flag = flag;
}

void CharmmComputations::setAllAtomsFlag(int flag) {
	_all_atoms_flag = flag;
	if (_all_atoms_flag==0){
		_backbone_selection_full = string(" ( TYPE N .OR. TYPE HN .OR. TYPE H ")
			+ " .OR. TYPE HA .OR. TYPE CA .OR. TYPE C .OR. TYPE O "
			+ " .OR. TYPE OT1 .OR. TYPE OT2 "
			+ " .OR. TYPE HA1 "
			+ " .OR. TYPE HT1 .OR. TYPE HT2 .OR. TYPE HT3 ) ";
		_backbone_selection = _backbone_selection_full;
	}else if (_all_atoms_flag==1){ 
		_backbone_selection_full = string(" ( TYPE N .OR. TYPE HN ")
			+ " .OR. TYPE HA .OR. TYPE CA .OR. TYPE C .OR. TYPE O "
			+ " .OR. TYPE OT1 .OR. TYPE OT2 "
			+ " .OR. TYPE HA1 "
			+ " .OR. TYPE HT1 .OR. TYPE HT2 .OR. TYPE HT3 ) ";
		_backbone_selection = " ( TYPE N .OR. TYPE CA .OR. TYPE C ) ";
		_skip_mini_param = "NONE";		
	}else if (_all_atoms_flag==2){ //23022001
		_backbone_selection_full = string(" ( TYPE N .OR. TYPE HN ")
			+ " .OR. TYPE HA .OR. TYPE CA .OR. TYPE C .OR. TYPE O "
			+ " .OR. TYPE OT1 .OR. TYPE OT2 "
			+ " .OR. TYPE HA1 "
			+ " .OR. TYPE HT1 .OR. TYPE HT2 .OR. TYPE HT3 ) ";
		_backbone_selection = " NONE ";
	}
}

int CharmmComputations::AllAtomsFlag() const {
	return _all_atoms_flag;
}

float CharmmComputations::templateBSPotFactor() const {
	return _template_bspot_factor;
}

void CharmmComputations::setSingleCoordinatesFlag(int flag) {
	_single_coordinates_flag = flag;
}
	
void CharmmComputations::setConsParam(const string& cons_param) {
	_cons_param = cons_param;
}

void CharmmComputations::setTemplateEnergy(float template_energy) {
	_template_energy = template_energy;
}

float CharmmComputations::templateEnergy() {
	return _template_energy;
}

float CharmmComputations::templateEnergyVdw() {
	return _template_energy_vdw;
}

float CharmmComputations::templateEnergyElec() {
	return _template_energy_elec;
}
#ifdef NOE
float CharmmComputations::templateEnergyNOE() {
	return _template_energy_noe;
}
#endif

void CharmmComputations::setTemplateEnergyVdw(float template_energy_vdw) {
	_template_energy_vdw = template_energy_vdw;
}

void CharmmComputations::setTemplateEnergyElec(float template_energy_elec) {
	_template_energy_elec = template_energy_elec;
}
#ifdef NOE
void CharmmComputations::setTemplateEnergyNOE(float template_energy_noe) {
	_template_energy_noe = template_energy_noe;
}
#endif

void CharmmComputations::setConsHarmForce(float force) {
	_cons_harm_force = force;
}

void CharmmComputations::setIncludeBackboneFlag(int include_backbone_flag) {
	_include_backbone_flag = include_backbone_flag;
}

int CharmmComputations::IncludeBackboneFlag() {
	return _include_backbone_flag;
}

void CharmmComputations::setConsFlag(int cons_flag) {
	_cons_flag = cons_flag;
}

void CharmmComputations::setUpdaParam(const string& upda_param) {
	_upda_param = upda_param;
}

void CharmmComputations::setHbonParam(const string& hbon_param) {
	_hbon_param = hbon_param;
}

void CharmmComputations::setSurfParam(const string& surf_param) {
	_surf_param = surf_param;
}

void CharmmComputations::setSkipMiniParam(const string& skip_mini_param) {
	_skip_mini_param = skip_mini_param;
}

void CharmmComputations::setSkipEnerParam(const string& skip_ener_param) {
	_skip_ener_param = skip_ener_param;
}

void CharmmComputations::setEnerSelection(const string& ener_selection) {
	_ener_selection = ener_selection;
	_ener_selection_flag = true;
}

void CharmmComputations::setSolvSkipParam(const string& skip_solv_param) {
	_skip_solv_param = skip_solv_param;
}

void CharmmComputations::setGBornParam(const string& gborn_param) {
	_gborn_param = gborn_param;
	_solv_type = "GBORN";
}

void CharmmComputations::setACEParam(const string& ace_param) {
	_ace_param = ace_param;
	_solv_type = "ACE";
}

void CharmmComputations::setExtraEnerFlag(int extra_ener_flag) {
	_extra_ener_flag = extra_ener_flag;
}

void CharmmComputations::setNoSelfFlag(int no_self_flag) {
	_no_self_flag = no_self_flag;
}

void CharmmComputations::setSolvationParamFile(
		const string& solvation_param_file) {
	_solvation_param_file = solvation_param_file;
	_solv_type = "ASP"; //05022001
}

void CharmmComputations::readPairSolvationParamFile(
		const string& solvation_param_file) {
	_solvation_info.readInfos(solvation_param_file);
}

void CharmmComputations::computeASA() {
	//cmCoor("SURF RPROBE 1.4 SELE .NOT. TYPE H* END");
	cmCoor("SURF RPROBE 1.4");
}

float CharmmComputations::getASA(const string& sele_cmd) {
	checkFlagsSize(psfi_.natom+500);
	float surf = 0.0;
	cmSele(sele_cmd,_flags);
	for (int i = 0; i < psfi_.natom; i++)
		if (_flags[i]) {
			//cout << i << " " << coord_.wmain[i] << endl;
			surf += coord_.wmain[i];
		}
	//cout << "returning " << surf << endl;
	return surf;
}

void CharmmComputations::computeSurface() {
		cmCoor("SURF SELE .NOT. TYPE H* END " + _surf_param);
}

float CharmmComputations::aspotAll(const string&) {
	return 0;
}

float CharmmComputations::aspotSslct() {
	int nres = psfi_.nres;
	float surf = 0.0;
	int i, j;
	char res[5];
	char type[5];

	if (_solvation_info.empty())
		exitError("aspotSslct: no solvation potential parameters");

	//int nseg = psfi_.nseg;
	//for (i = 0; i < nseg; ++i) {
	//	getCmChars(psfc_.segid[i],res,4);
	//	cout << " segid " << i << " " << res << endl;
	//}
	for (i = 0; i < nres; ++i) {
		getCmChars(psfc_.res[i],res,4);
		#ifdef SURFDEBUG
			getCmChars(psfc_.resid[i],res,4);
			cout << " resid " << i << " " << res;
			cout << " res " << res << "     " << endl;
		#endif
		for (j = psfi_.ibase[i]; j < psfi_.ibase[i+1]; ++j) {
			if (_sslct[j]) {
				getCmChars(psfc_.type[j],type,5);
				#ifdef SURFDEBUG
					float access = coord_.wmain[j];
					cout << " acc surf pot for " << res << " " << type << " "
							<< access << " "
							<< access *_solvation_info.weight((string)res,type) << endl;
				#endif
				surf += coord_.wmain[j]
						* _solvation_info.weight((string)res,type);
			}
		}
		#ifdef SURFDEBUG
			cout << endl;
		#endif
	}
	//cout << "total " << surf << endl << endl;
	return 0.001*surf;
}

float CharmmComputations::aspotAll() {
	int nres = psfi_.nres;
	float surf = 0.0;
	int i, j;
	char res[5];
	char type[5];

	if (_solvation_info.empty())
		exitError("aspotAll: no solvation potential parameters");

	//int nseg = psfi_.nseg;
	//for (i = 0; i < nseg; ++i) {
	//	getCmChars(psfc_.segid[i],res,4);
	//	cout << " segid " << i << " " << res << endl;
	//}
	for (i = 0; i < nres; ++i) {
		getCmChars(psfc_.res[i],res,4);
		#ifdef SURFDEBUG
			getCmChars(psfc_.resid[i],res,4);
			cout << " resid " << i << " " << res;
			cout << " res " << res << "     " << endl;
		#endif
		for (j = psfi_.ibase[i]; j < psfi_.ibase[i+1]; ++j) {
			getCmChars(psfc_.type[j],type,5);
			#ifdef SURFDEBUG
				float access = coord_.wmain[j];
				cout << " acc surf pot for " << res << " " << type << " "
						<< access << " "
						<< access *_solvation_info.weight((string)res,type)
						<< " surf " << surf << endl;
			#endif
			surf += coord_.wmain[j]
					* _solvation_info.weight((string)res,type);
		}
		#ifdef SURFDEBUG
			cout << endl;
		#endif
	}
	//cout << "aspot all " << surf << endl;
	return 0.001*surf;
}

int CharmmComputations::nres() {
	return psfi_.nres;
}

char CharmmComputations::getResCode(int index) {
	--index;  // 09112000
	if (index > psfi_.nres)
		exitError("CharmmComputations:resCode: index to high");
	char res[5];
	getCmChars(psfc_.res[index],res,4);
	//cout << "finding res_name '" << res << "' for " << index << endl;
	return resCode(res);
}

pair<float,float> CharmmComputations::getWeightedASA(
		char res_code, const string& sele_cmd) {
	checkFlagsSize(psfi_.natom+500);
	cmSele(sele_cmd,_flags);
	return getWeightedASA(res_code,_flags);
}

pair<float,float> CharmmComputations::getWeightedASA(
		char res_code, const int* flags) {
	float surf = 0.0;
	float asa = 0.0;
	char type[6];
	for (int i = 0; i < psfi_.natom; i++)
		if (flags[i]) {
			getCmChars(psfc_.type[i],type,5);
			surf += coord_.wmain[i]
					* _solvation_info.weight(res_code,type);
			asa += coord_.wmain[i];
			#ifdef SURFDEBUG
				cout << i << " " << type << " "
						<< coord_.wmain[i]
								* _solvation_info.weight(res_code,type)
						<< " " << coord_.wmain[i] << endl;
			#endif
		}
		#ifdef SURFDEBUG
			cout << "total " << surf << endl;
		#endif

	return pair<float,float>(0.001*surf,asa);
}

int CharmmComputations::getAtomNumber(const string& selection)  {
	checkFlagsSize(psfi_.natom+500);
	cmSele(selection,_flags);
	int i;
	for (i = 0; (i < psfi_.natom) && !_flags[i]; ++i)
		;
	return i+1;
}

void CharmmComputations::icFill() const {
	cmIc("FILL PRESERVE");
}

void CharmmComputations::icDiff() const {
	cmIc("DIFF");
}

void CharmmComputations::getRotamerDihedrals(const string& segid, int number,
		const Rotamer& rotamer, vector<float>& dihedral_angles) {
	dihedral_angles.erase(dihedral_angles.begin(),dihedral_angles.end());
	char number_str[20];
	sprintf(number_str,"%d",number);
	string selection = "ATOM " + segid + " " + number_str + " ";
	list<Dihedral>::const_iterator it_dihedral;
	int i, a, b, c, d;

	for (it_dihedral = rotamer.dihedrals().begin();
			it_dihedral != rotamer.dihedrals().end();
			++it_dihedral) {
		a = getAtomNumber(selection + (*it_dihedral).first());
		b = getAtomNumber(selection + (*it_dihedral).second());
		c = getAtomNumber(selection + (*it_dihedral).third());
		d = getAtomNumber(selection + (*it_dihedral).fourth());
		for (i = 1; i <= intcri_.lenic; ++i) {
			//cout << "intiar " << intcrd_.intiar
			//		<< " bintcr(intiar) " << bases_.bintcr[intcrd_.intiar]
			//		<< endl;
			if (cmIsIcArs(i,a,b,c,d))
				break;
		}
		dihedral_angles.push_back(i <= intcri_.lenic ?
				cmIcPic(i) : invalidAngle() );
		//dihedral_angles.push_back(intcrr_.pic[i]);
	}
}

void CharmmComputations::getIniICoordinates(const string& segid,
		int number, vector<Coordinate>& coordinates) {
	coordinates.erase(coordinates.begin(),coordinates.end());
	selectIniIResidue(number,segid);
	for (int i = 0; i < psfi_.natom; ++i)
		if (_ini_islct[i])
			coordinates.push_back(
					Coordinate(coord_.x[i],coord_.y[i],coord_.z[i]) );
}
	
void CharmmComputations::setRotamerCoordinates(const string& segid,
		int number, const Rotamer& rotamer, int* flags) {
	int i, j;
	const vector<Coordinate>& coordinates = rotamer.coordinates();
	for (i = 0, j = 0; i < psfi_.natom; ++i)
		if (flags[i]) {
			if (j >= coordinates.size()) {
				cout << "flags " << endl;
				char type[5];
				for (j = 0; j < psfi_.natom; ++j) {
					if (flags[j]) {
						getCmChars(psfc_.type[j],type,5);
						cout << " atom " << j << " " << type << endl;
					}
				}
				cout << "number " << number << " i " << i
					<< " j " << j << " coors " << coordinates.size() << endl;
				cout << rotamer << endl;
				int j;
				char res[5];
				getCmChars(psfc_.res[number-1],res,4);
				cout << "residue data " << endl;
				for (j = psfi_.ibase[number-1];
						j < psfi_.ibase[number-1+1]; ++j) {
					getCmChars(psfc_.type[j],type,5);
					cout << " resid " << res << " atom " << j
							<< " " << type << endl;
				}
				exitError("setRotamerCoordinates BUG: too few coordinates stored");
			}
			coord_.x[i] = coordinates[j].x();
			coord_.y[i] = coordinates[j].y();
			coord_.z[i] = coordinates[j].z();
			++j;
			//cout << "setting atom " << i << " "
			//		<< coord_.x[i] << " " << coord_.y[i] << " " << coord_.z[i] << endl;
		}
	if (j < coordinates.size())
		exitError("setRotamerCoordinates BUG: too many coordinates stored");
}

void CharmmComputations::setRotamerIniICoordinates(const string& segid,
		int number, const Rotamer& rotamer) {
	setRotamerCoordinates(segid,number,rotamer,_ini_islct);
}

void CharmmComputations::setRotamerIniJCoordinates(const string& segid,
		int number, const Rotamer& rotamer) {
	setRotamerCoordinates(segid,number,rotamer,_ini_jslct);
}

float CharmmComputations::getPhiDihedral(const string& segid, int number) {
	char number_str[20];
	sprintf(number_str,"%d",number-1);
	string selection_minus = "ATOM " + segid + " " + number_str + " ";
	sprintf(number_str,"%d",number);
	string selection = "ATOM " + segid + " " + number_str + " ";
	int i, a, b, c, d;			
	a = getAtomNumber(selection_minus + "C");
	b = getAtomNumber(selection + "N");
	c = getAtomNumber(selection + "CA");
	d = getAtomNumber(selection + "C");
	for (i = 1; i <= intcri_.lenic; ++i)
			if (cmIsIcArs(i,a,b,c,d))
				break;
	return i < intcri_.lenic ? cmIcPic(i) : invalidAngle();
}

float CharmmComputations::getPsiDihedral(const string& segid, int number) {
	char number_str[20];
	sprintf(number_str,"%d",number+1);
	string selection_plus = "ATOM " + segid + " " + number_str + " ";
	sprintf(number_str,"%d",number);
	string selection = "ATOM " + segid + " " + number_str + " ";
	int i, a, b, c, d;			
	a = getAtomNumber(selection + "N");
	b = getAtomNumber(selection + "CA");
	c = getAtomNumber(selection + "C");
	d = getAtomNumber(selection_plus + "N");
	for (i = 1; i <= intcri_.lenic; ++i) {
			//cout << "intiar " << intcrd_.intiar
			//		<< " bintcr(intiar) " << bases_.bintcr[intcrd_.intiar]
			//		<< endl;
			if (cmIsIcArs(i,a,b,c,d))
				break;
	}
	return i < intcri_.lenic ? cmIcPic(i) : invalidAngle();
}

float CharmmComputations::distance(int number1, const string& segid1,
			int number2, const string& segid2) {
	char number_str1[20], number_str2[20];
	sprintf(number_str1,"%d",number1);
	sprintf(number_str2,"%d",number2);
	checkFlagsSize(psfi_.natom+500);
	cmSele("( ( SEGID " + segid1 + " .AND. RESID " + number_str1
			+ " ) .OR. ( ( SEGID " + segid2 + " .AND. RESID " + number_str2
			+ " ) ) ) .AND. TYPE CB ",_flags );
	int i;
	for (i = 0; (i < psfi_.natom) && !_flags[i]; ++i)
		;
	int i1 = i;
	for (++i; (i < psfi_.natom) && !_flags[i]; ++i)
		;
	if (i1 >= psfi_.natom || i >= psfi_.natom) {
		cout << "current i1 " << i1 << " current i " << i << endl;
		exitError("CharmmComputations::distance: problem with selection "
			+ segid1 + " " + number_str1 + " - " + segid2 + " " + number_str2);
	}
	//cout << " coor1 " << coord_.x[i1] << " " << coord_.y[i1] << " " << coord_.z[i1] << endl;
	//cout << " coor2 " << coord_.x[i] << " " << coord_.y[i] << " " << coord_.z[i] << endl;
	float x = coord_.x[i1] - coord_.x[i];
	float y = coord_.y[i1] - coord_.y[i];
	float z = coord_.z[i1] - coord_.z[i];
	cout << "dist " << segid1 << " " << number1
		<< " - " << segid2 << " " << number2
		<< " " << sqrt((double)x*x + y*y + z*z) << endl;
	return sqrt((double)x*x + y*y + z*z);
}

float CharmmComputations::invalidAngle() const {
	return 3333.0;
}

float CharmmComputations::defaultPhi() const {
	return _default_phi;
}

float CharmmComputations::defaultPsi() const {
	return _default_psi;
}

pair<float,int> CharmmComputations::getRMS(const string& segid, int number) {
	checkFlagsSize(psfi_.natom+500);
	char number_str[20];
	sprintf(number_str,"%d",number);
	string selection = "ATOM " + segid + " " + number_str + " * "
			+ " .AND. " + _rms_exclusion;
	cmSele(selection,_flags);

	float sum_sq = 0, tmp;
	int count = 0;
	for (int i = 0; i < psfi_.natom; ++i)
		if (_flags[i]) {
			count++;
			tmp = (coord_.x[i]-coordc_.xcomp[i]);
			sum_sq += tmp*tmp;
			tmp = (coord_.y[i]-coordc_.ycomp[i]);
			sum_sq += tmp*tmp;
			tmp = (coord_.z[i]-coordc_.zcomp[i]);
			sum_sq += tmp*tmp;
		}
	//return sqrt(count ? sum_sq / count : 9999.99);
	return pair<float,int>(sum_sq,count);
}

float CharmmComputations::freeASA(const Rotamer& rotamer, const string& segid) {
	char buffer[30];
	cmDele(string("ATOM SELE SEGID ") + segid + " .AND. RESID 2 .AND. ( .NOT. "
			+ _backbone_selection + " ) END");
	cmPatc("P" + resStr(rotamer.resCode()) + " " + segid + " 2 SETUP");
	cmRena("RESNAME " + resStr(rotamer.resCode())
			+ " SELE ( SEGID " + segid + " .AND. RESID 2 ) END");
	list<Dihedral>::const_iterator it_dihedral;
	for (it_dihedral = rotamer.dihedrals().begin();
			it_dihedral != rotamer.dihedrals().end();
			++it_dihedral) {
		sprintf(buffer,"%f",(*it_dihedral).angle());
		cmIcEd((string)"DIHE"
				+ " " + segid + " 2 " + (*it_dihedral).first()
				+ " " + segid + " 2 " + (*it_dihedral).second()
				+ " " + segid + " 2 " + (*it_dihedral).third()
				+ " " + segid + " 2 " + (*it_dihedral).fourth()
				+ " " + buffer);
		cmIcEd("END");
	}
	cmIc("PURGE");
	cmIc("PARA");
	cmIc("BUILD");

	computeASA();
	//return getASA("SEGID " + segid + " .AND. RESID 2 .AND. .NOT. " + _backbone_selection_full);
	// 18062001 modification to include GLY:
	return getASA("SEGID " + segid + " .AND. RESID 2");
}

float CharmmComputations::getResidASA(int resid, const string& segid) {
	char buffer[20];
	sprintf(buffer,"%d",resid);
	//return getASA("SEGID " + segid + " .AND. RESID "+ buffer+ " .AND. .NOT. " + _backbone_selection_full);
	// 18062001 modification to include GLY:
	return getASA("SEGID " + segid + " .AND. RESID "+ buffer);
}

void CharmmComputations::checkTerminus(){
	// 14032002 we'll compute the first and last residues for each segment
	int nres = psfi_.nres;
	// better to use a map<pair<int,string>,string> and store the prefix_patch for all pos_number, segid entries
	if ( _pref_patch.size() > 0 ) return;  // we just do it once
	if (psfi_.nres == 0 ){
		cout<<"Warning: entered DESIGNER mode without having read/created any structure"<<endl;
		return;
	}
	char res[5];
	int resid = 9999;
	int last_resid = 9999;
	vector<string> segids;
	for (int i = 0; i < psfi_.nseg; ++i){
		getCmChars(psfc_.segid[i],res,4);
		string segid = res;
		segids.push_back(segid);
	}
	vector<int> nter;
	vector<int> cter;
	int seg = 0;
	string pref_patch = "P";
	pair<int, string> residue;
	for (int i = 0; i < psfi_.nres; ++i) {
		pref_patch="P";
		getCmChars(psfc_.resid[i],res,4);
		//istrstream is(res);
		istringstream is(res);
		is >> resid;
		if (resid <= last_resid ){
			nter.push_back(resid);
			pref_patch="N";
			if ( i > 0 ){
				seg++;
				// we discover a C-terminus by entering a new segment
				cter.push_back(last_resid);
				_pref_patch[residue]="C"; // still residue contains the previous position, so we overwrite
				//cout<<"Setting _pref_patch at "<<residue.first<<"-"<<residue.second<<" to C"<<endl;
			}
		}
		last_resid = resid;
		residue = pair<int, string>(resid, segids[seg]);
		_pref_patch[residue]=pref_patch;
		//cout<<"Setting _pref_patch at "<<residue.first<<"-"<<residue.second<<" to "<<pref_patch<<endl;
	}
	// the C-terminus of the last segment has to be set
	cter.push_back(resid);
	_pref_patch[pair<int, string>(resid,segids[seg])]="C";
	//cout<<"Overwritting _pref_patch at "<<resid<<"-"<< segids[seg] <<" to C"<<endl;
	if (nter.size()!= psfi_.nseg || cter.size()!= psfi_.nseg ){
		cerr<<nter.size()<<" "<<cter.size()<<" "<<psfi_.nseg<<endl;
		exitError("CharmmComputations::checkTerminus: I cannot guess the N-C terminus by the numbering");
	}
        for (int i = 0; i < psfi_.nseg; ++i){
		cout<<"Detected segment "<<segids[i]<<" starting at "<<nter[i]<<" and ending at "<<cter[i]<<endl;
        }
}

void CharmmComputations::setTerminus(pair<int,string> position, string prefix){
	if (psfi_.nres == 0 )
		exitError("CharmmComputations::setTerminus: structure not found");
	if (_pref_patch.find(position) == _pref_patch.end()){
		cout<<"I cannot find " << position.first << "-" << position.second<<endl;
		exitError("CharmmComputations::setTerminus: position not found");
	}
	_pref_patch[position] = prefix;
	if (prefix.length()>1)
		cout<<"Warning: the prefix does not have length one, I hope you know what are you doing"<<endl;
	cout<<"We will patch " <<prefix<<"xxx at position "<< position.first << "-" << position.second<<endl;
}

void CharmmComputations::patchDummyResidue(int pos_number, const string& segid) {
	if (_all_atoms_flag==1){
		patchResidue(_dummy_res_code,pos_number,segid);
	} else if (_all_atoms_flag==0){
		char buffer[30];
		sprintf(buffer,"%d",pos_number);
		string number_str = buffer;
		cmDele("ATOM SELE ( SEGID " + segid + " .AND. RESID " + number_str
			+ " ) .AND. ( .NOT. " + _backbone_selection_full + " ) END");
		// comment following 2 lines for no patch:
		//cmPatc(" PALX " + segid
		//		+ " " + number_str + " SETUP");
		cmRena(string("RESNAME ALX ")
				+ " SELE SEGID " + segid + " .AND. RESID " + number_str + " END");
	} else if (_all_atoms_flag==2){
		//here we will have to delete part of the backbone as well
		patchResidue(_dummy_res_code,pos_number,segid);
		// we could also edit the IC's corresponding to the phi,psi dihedrals
		// for instance, we could use the native phi,psi and a few +-10 degrees variation, 
		// which would triplicate the rotamer library
	} else
		exitError("CharmmComputations::patchDummyResidue: unknown _all_atoms_flag, exiting"); 
}

void CharmmComputations::patchResidue(char res_code,
		int pos_number, const string& segid) {
	string prefix_patch=" ";
	//string backbone_selection = " ( TYPE N .OR. TYPE CA .OR. TYPE C .OR. H*) ";
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: patchresidue invoked. rescode="<<res_code<<" pos#="<<pos_number<<" segid="<<segid<<endl;
		//	" backbone_selection="<<backbone_selection<<endl;
	#endif
	//if (pos_number == 1)  // improved this on 14032002
	prefix_patch=_pref_patch[pair<int,string>(pos_number,segid)];
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;
	cmDele("ATOM SELE ( SEGID " + segid + " .AND. RESID " + number_str
		+ " ) .AND. ( .NOT. " + _backbone_selection + " ) END");
	cmPatc(prefix_patch + resStr(res_code) + " " + segid
			+ " " + number_str + " SETUP");
	cmRena("RESNAME " + resStr(res_code)
			+ " SELE SEGID " + segid + " .AND. RESID " + number_str + " END");
}

void CharmmComputations::cmBuild() {
	cmIc("PURGE");
	cmIc("PARA");
	cmIc("BUILD");
}

void CharmmComputations::cmUpdate() {
	cmUpda(_upda_param);
}

void CharmmComputations::Skip() {
	cmSkip(_skip_ener_param);
}

void CharmmComputations::fixTemplate(const vector<int>& pos_numbers, const vector<string>& segids, bool include_backbone) {
	char buffer[50];
	int i;

	int sz_pos = pos_numbers.size();
	vector<string> number_str(sz_pos);
	for (i = 0; i < sz_pos; ++i) {
		sprintf(buffer,"%d",pos_numbers[i]);
		number_str[i] = buffer;
	}
	
	string constraint;
	if (include_backbone) {
		constraint = "FIX SELE " + _fix_sele + " END";
	}
	else {
		constraint = "FIX SELE ( ";
		for (int i = 0; i < sz_pos; ++i) {
			constraint += ".NOT. ( SEGID " + segids[i]
					+ " .AND. RESID " + number_str[i] + " ) ";
			if (i < sz_pos-1)
				constraint += " .AND. ";
		}
		constraint += " ) .OR. " + _backbone_selection_full+" END";
		if (constraint.length() >= cm_cons_length)
			exitError("CharmmComputations::fixTemplate: constraint too long");
	}
	cmCons(constraint);
	cmUpda(_upda_param); // 26112000
}

void CharmmComputations::selectIResidue(int pos_number,
		const string& segid) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;
	checkIslctSize(psfi_.natom+500);
	cmSele("SEGID " + segid + " .AND. RESID " + number_str
		+ "  .AND. ( .NOT. " + _backbone_selection_full + " )",_islct);
}

void CharmmComputations::selectIResidues(vector<int>& pos_numbers,
		vector<string>& segids) {
	int sz_pos = pos_numbers.size();
	//cout<<"sz_pos= "<<sz_pos<<endl;
	string str="";
	vector<int>::iterator it_pos=pos_numbers.begin();
	vector<string>::iterator it_seg = segids.begin();
	int i=0;
	for (i = 0; i<sz_pos; ++i){
		str += " ( SEGID " + *it_seg + " .AND. RESID " + intToString(*it_pos)+" )";
		if ( i< sz_pos-1)
			str += " .OR.";
		++it_pos;++it_seg;
	}
	str += " .AND. ( .NOT. " + _backbone_selection_full + " )";
	//cout<<"length str= "<<str.length()<<endl;
	selectISelection(str);
}

void CharmmComputations::minimizeAroundDihedrals(const Rotamer& rotamer, int pos_number, const string& segid ) {
	if (_mini_flag) {
		char buffer[50];
		sprintf(buffer,"%d",pos_number);
		string number_str = buffer;
		if (_cons_flag) {	
			cmCons("CLDH");
			string segid_number = segid + " " + number_str;
			list<Dihedral>::const_iterator it_dihedral;
			for (it_dihedral = rotamer.dihedrals().begin();
					it_dihedral != rotamer.dihedrals().end();
					++it_dihedral) {
				sprintf(buffer,"%f",(*it_dihedral).angle());
				cmCons((string)"DIHE"
						+ " " + segid_number + " " + (*it_dihedral).first()
						+ " " + segid_number + " " + (*it_dihedral).second()
						+ " " + segid_number + " " + (*it_dihedral).third()
						+ " " + segid_number + " " + (*it_dihedral).fourth()
						+ " " + _cons_param + " MIN " + buffer);
			}
		}
		cmCons("FIX SELE .NOT. ( SEGID " + segid + " .AND. RESID " + number_str + " ) .OR. "+ _backbone_selection_full + " END");
		cmUpda(_upda_param);
		cmSkip(_skip_mini_param);
		cmMini(_mini_param);
		if (_cons_flag)
			cmCons("CLDH");
	}
}

		
void CharmmComputations::selectISelection(const string& sel) {
	checkIslctSize(psfi_.natom+500);
	if (sel.length() >= cm_sel_length)
		exitError("CharmmComputations::selectISelection: selection too long");
	cmSele(sel,_islct);
}

void CharmmComputations::selectJSelection(const string& sel) {
	checkJslctSize(psfi_.natom+500);
	if (sel.length() >= cm_sel_length)
		exitError("CharmmComputations::selectISelection: selection too long");
	cmSele(sel,_jslct);
}

float CharmmComputations::inteIJSel(){
	// IMPORTANT: _isclt and _jslct must contain the select flags;
	cmInteSel("",_islct,_jslct);
	return ener_.eprop[epot];
}

void CharmmComputations::selectKSelection(const string& sel) {
	checkKslctSize(psfi_.natom+500);
	if (sel.length() >= cm_sel_length)
		exitError("CharmmComputations::selectKSelection: selection too long");
	cmSele(sel,_kslct);
}

void CharmmComputations::selectLSelection(const string& sel) {
	checkLslctSize(psfi_.natom+500);
	if (sel.length() >= cm_sel_length)
		exitError("CharmmComputations::selectLSelection: selection too long");
	// 17042003 debug
	cout<<"AlfLSel"<<endl;
	printLslct();
	cmSele(sel,_lslct);
	printLslct();
}

void CharmmComputations::selectEnerSelection(){
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING"<<endl;
	cout<<"_ener_selection_flag="<<_ener_selection_flag<<" _ener_selection="<<_ener_selection<<endl;
	#endif
	if (_ener_selection_flag){
		selectLSelection(_ener_selection);
	}
}

float CharmmComputations::inteKLSel(){
	// IMPORTANT: _ksclt and _lslct must contain the select flags;
	cmInteSel("",_kslct,_lslct);
	return ener_.eprop[epot];
}

float CharmmComputations::inteILSel(){
	// IMPORTANT: _isclt and _lslct must contain the select flags;
	cmInteSel("",_islct,_lslct);
	return ener_.eprop[epot];
}

float CharmmComputations::inteJKSel(){
	// IMPORTANT: _jsclt and _kslct must contain the select flags;
	cmInteSel("",_jslct,_kslct);
	return ener_.eprop[epot];
}

void CharmmComputations::selectJResidue(int pos_number,
		const string& segid) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;
	checkJslctSize(psfi_.natom+500);
	cmSele("SEGID " + segid + " .AND. RESID " + number_str
		+ "  .AND. ( .NOT. " + _backbone_selection_full + " )",_jslct);
}

void CharmmComputations::selectKResidueBack(int pos_number, const string& segid) {
	selectKSelection("SEGID " + segid + " .AND. RESID " + intToString(pos_number)+ " .AND. " + _backbone_selection_full);
}

void CharmmComputations::selectLResidueBack(int pos_number, const string& segid) {
	selectLSelection("SEGID " + segid + " .AND. RESID " + intToString(pos_number)+ " .AND. " + _backbone_selection_full);
}

void CharmmComputations::selectComplementJResidue(int pos_number,
		const string& segid) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;
	checkJslctSize(psfi_.natom+500);
	cmSele(".NOT. ( SEGID " + segid + " .AND. RESID " + number_str
		+ " )  .OR. ( " + _backbone_selection_full + " )",_jslct);
}

void CharmmComputations::sslctAround(const string& res_str) {
	const float dist = 6.0;
	checkSslctSize(psfi_.natom+500);
	cmSele(res_str,_sslct);
	int natom = psfi_.natom;
	vector<int> res_atoms;

	int i, j;
	for (i = 0; i < natom; ++i)
		if (_sslct[i]) {
			res_atoms.push_back(i);
			_sslct[i] = 0;
		}

	checkFlagsSize(psfi_.natom+500);
	cmSele(string("TYPE H*"),_flags);
	for (j = 0; j < res_atoms.size(); ++j) {
		float x = coord_.x[res_atoms[j]];
		float y = coord_.y[res_atoms[j]];
		float z = coord_.z[res_atoms[j]];
		for (i = 0; i < natom; ++i)
			if (!_flags[i]
					&& fabs(coord_.x[i] - x) < dist
					&& fabs(coord_.y[i] - y) < dist
					&& fabs(coord_.z[i] - z) < dist )
							_sslct[i] = 1;
	}
}

void CharmmComputations::sslctAndNot(const string& restriction) {
	checkFlagsSize(psfi_.natom+500);
	cmSele(restriction,_flags);
	for (int i = 0; i < psfi_.natom+50; ++i)
		_sslct[i] *= _flags[i] ? 0 : 1;
}

void CharmmComputations::printIslct() {
	cout << " islct: ";
	for (int i = 0; i < psfi_.natom; ++i)
		if (_islct[i]) cout << i << " ";
	cout << endl;
}

void CharmmComputations::printJslct() {
	cout << " jslct: ";
	for (int i = 0; i < psfi_.natom; ++i)
		if (_jslct[i]) cout << i << " ";
	cout << endl;
}

void CharmmComputations::printKslct() {
	cout << " kslct: ";
	for (int i = 0; i < psfi_.natom; ++i)
		if (_kslct[i]) cout << i << " ";
	cout << endl;
}

void CharmmComputations::printLslct() {
	cout << " lslct: ";
	for (int i = 0; i < psfi_.natom; ++i)
		if (_lslct[i]) cout << i << " ";
	cout << endl;
}

void CharmmComputations::printIniIslct() {
	cout << " ini_islct: ";
	for (int i = 0; i < psfi_.natom; ++i)
		if (_ini_islct[i]) cout << i << " ";
	cout << endl;
}

void CharmmComputations::printIniJslct() {
	cout << " ini_jslct: ";
	for (int i = 0; i < psfi_.natom; ++i)
		if (_ini_jslct[i]) cout << i << " ";
	cout << endl;
}

void CharmmComputations::printSslct() {
	cout << " sslct: ";
	for (int i = 0; i < psfi_.natom; ++i)
		if (_sslct[i]) cout << i << " ";
	cout << endl;
}

void CharmmComputations::selectIniIResidue(int pos_number,
		const string& segid) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;
	checkIniIslctSize(psfi_.natom+500);
	cmSele("SEGID " + segid + " .AND. RESID " + number_str
		+ "  .AND. ( .NOT. " + _backbone_selection + " )",_ini_islct);
}

void CharmmComputations::selectIniJResidue(int pos_number,
		const string& segid) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;
	checkIniJslctSize(psfi_.natom+500);
	cmSele("SEGID " + segid + " .AND. RESID " + number_str
		+ "  .AND. ( .NOT. " + _backbone_selection + " )",_ini_jslct);
}

void CharmmComputations::coorInitIniI() {
	cmCoorInit(_ini_islct);
}

void CharmmComputations::coorInitIniJ() {
	cmCoorInit(_ini_jslct);
}

void CharmmComputations::coorInitK() {
	cmCoorInit(_kslct);
}

void CharmmComputations::coorInitL() {
	cmCoorInit(_lslct);
}

//void CharmmComputations::setNTerminal(int n_terminal) {
//	_n_terminal = n_terminal;
//}

//void CharmmComputations::setCTerminal(int c_terminal) {
//	_c_terminal = c_terminal;
//}

void CharmmComputations::editDihedral(const Rotamer& rotamer,
		int pos_number, const string& segid) const {
	char buffer[50];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;
	list<Dihedral>::const_iterator it_dihedral;
	for (it_dihedral = rotamer.dihedrals().begin();
			it_dihedral != rotamer.dihedrals().end();
			++it_dihedral) {
		sprintf(buffer,"%f",(*it_dihedral).angle());
		cmIcEd((string)"DIHE"
				+ " " + segid + " " + number_str + " " + (*it_dihedral).first()
				+ " " + segid + " " + number_str + " " + (*it_dihedral).second()
				+ " " + segid + " " + number_str + " " + (*it_dihedral).third()
				+ " " + segid + " " + number_str + " " + (*it_dihedral).fourth()
				+ " " + buffer);
	}
	cmIcEd("END");
		// in order to activate these IC changes coords must be invalidated:
	//cmCoor("INIT SELE ATOM " + segid + " " + number_str + " * "
	//cmCoor("INIT SELE RESID " + number_str
	//		+ " .AND. .NOT. " + _backbone_selection + " END");
}

void CharmmComputations::setDihedral(const Rotamer& rotamer,
		int pos_number, const string& segid) const {
	char buffer[50];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;

	editDihedral(rotamer,pos_number,segid);
	cmCoor("INIT SELE SEGID " + segid + " .AND. RESID " + number_str
			+ " .AND. .NOT. " + _backbone_selection + " END");
	cmIc("PURGE");
	cmIc("PARA");
	cmIc("BUILD");
}

void CharmmComputations::setPhiPsi(float phi, float psi,
		int pos_number, const string& segid) const {

	char buffer[100];
	sprintf(buffer,"%d", pos_number-1);
	string previous_str = buffer;
	sprintf(buffer,"%d", pos_number);
	string current_str = buffer;
	sprintf(buffer,"%d", pos_number+1);
	string next_str = buffer;
	
	sprintf(buffer,"%f",phi);
	string phi_str = buffer;
	sprintf(buffer,"%f",psi);
	string psi_str = buffer;

	cmIcEd((string) "DIHE"  + " " + previous_str + " C" 
				+ " " + segid + " " + current_str  + " N"
				+ " " + segid + " " + current_str  + " CA"
				+ " " + segid + " " + current_str  + " C"
				+ " " + segid + " " + phi_str) ;
	cmIcEd((string) "DIHE"  + " " + current_str  + " N" 
				+ " " + segid + " " + current_str  + " CA"
				+ " " + segid + " " + current_str  + " C"
				+ " " + segid + " " + next_str     + " N"
				+ " " + segid + " " + psi_str) ;
	cmIcEd("END") ;
	//cmCoor("INIT SELE .NOT. (RESID " + current_str + ") END") ;
	cmCoor("INIT");
	cmIc("PURGE");
	cmIc("PARA");
	cmIc("SEED " + segid + " 1 CA " + segid + " 1 C " + segid + " 2 N");
	cmIc("BUILD");
}

void CharmmComputations::readSolvationReference(istream& is) {
	char res_code;
	float energy;
	while (is >> res_code >> energy)
		_solvation_reference[res_code] = energy;
}
	
float CharmmComputations::energyBuiltRotamer(
		const Rotamer& rotamer, int pos_number,
		const string& segid) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;

	// rotamer_res_code must be constructed
	// (patched + IC edit + IC build ,,,) already!!

	cmCons("FIX SELE .NOT. ( SEGID " + segid + " .AND. RESID " + number_str + " ) .OR. "
			+ _backbone_selection_full + " END");

	if (_cons_flag) {
		cmCons("CLDH");
		string segid_number = segid + " " + number_str;
		list<Dihedral>::const_iterator it_dihedral;
		for (it_dihedral = rotamer.dihedrals().begin();
				it_dihedral != rotamer.dihedrals().end();
				++it_dihedral) {
			sprintf(buffer,"%f",(*it_dihedral).angle());
			cmCons((string)"DIHE"
					+ " " + segid_number + " " + (*it_dihedral).first()
					+ " " + segid_number + " " + (*it_dihedral).second()
					+ " " + segid_number + " " + (*it_dihedral).third()
					+ " " + segid_number + " " + (*it_dihedral).fourth()
					+ " " + _cons_param + " MIN " + buffer);
		}
	}
	cmUpda(_upda_param);
	if (_hbon_flag)
		cmHbon(_hbon_param);
	if (_mini_flag) {
		cmSkip(_skip_mini_param);
		cmMini(_mini_param);
	}
	if (_cons_flag)
		cmCons("CLDH");

	if (_extra_ener_flag || !_mini_flag)
		cmSkip(_skip_ener_param);
	
	cmEner("");

	#ifdef VDWELEC
	_last_elec_energy = ener_.eterm[elec];
	_last_vdw_energy = ener_.eterm[vdw];
	#endif

	return ener_.eprop[epot];
}

float CharmmComputations::minimizeSingleRotamer(
		const Rotamer& rotamer, int pos_number,
		const string& segid) {
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: minimizeSingleRotamer"<<endl; 
	#endif
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;

	// rotamer_res_code must be patched already!!

	editDihedral(rotamer,pos_number,segid);
	cmCoor("INIT SELE SEGID " + segid + " .AND. RESID " + number_str
			+ " .AND. .NOT. " + _backbone_selection + " END");
	cmIc("PURGE");
	cmIc("PARA");
	cmIc("BUILD");
	//cmIc("PRINT");

	cmCons("FIX SELE .NOT. ( SEGID " + segid + " .AND. RESID " + number_str + " ) .OR. "
			+ _backbone_selection_full + " END");

	cmUpda(_upda_param);
	if (_hbon_flag)
		cmHbon(_hbon_param);
	if (_cons_flag) {
		cmCons("CLDH");
		string segid_number = segid + " " + number_str;
		list<Dihedral>::const_iterator it_dihedral;
		for (it_dihedral = rotamer.dihedrals().begin();
				it_dihedral != rotamer.dihedrals().end();
				++it_dihedral) {
			sprintf(buffer,"%f",(*it_dihedral).angle());
			cmCons((string)"DIHE"
					+ " " + segid_number + " " + (*it_dihedral).first()
					+ " " + segid_number + " " + (*it_dihedral).second()
					+ " " + segid_number + " " + (*it_dihedral).third()
					+ " " + segid_number + " " + (*it_dihedral).fourth()
					+ " " + _cons_param + " MIN " + buffer);
		}
	}
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: Going to minimization. _skip_mini_param="<<_skip_mini_param<<endl;
	#endif

	cmSkip(_skip_mini_param);

	#ifdef NOEDEBUGFULL
	//cmEner("");  /// Using cmEner while calculating PairEnergies CHANGES RESULTS !! Run noedebugfull w/o cmEner
	#endif

	cmMini(_mini_param);

	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: Done minimization. _skip_mini_param="<<_skip_mini_param<<endl;
	cout<<"DEBUGGING: _extra_ener_flag="<<_extra_ener_flag<<" _skip_ener_param="<<_skip_ener_param<<endl;
	#endif

	if (_cons_flag)
		cmCons("CLDH");

	if (_extra_ener_flag)
		cmSkip(_skip_ener_param);

	if (_no_self_flag)
		cmInteSel("",_islct,_jslct);
	else if (_ener_selection_flag)
		inteILSel();
	else
		cmEner("");

	#ifdef VDWELEC
	_last_elec_energy = ener_.eterm[elec];
	_last_vdw_energy = ener_.eterm[vdw];
	#endif
	#ifdef NOE
	_last_noe_energy = ener_.eterm[noe];
	#endif
	#ifdef NOEDEBUGFULL
	//cout << "mini ener hbond " << ener_.eterm[hbond] << endl;
	cout<<"DEBUGGING: _last_elec_energy="<<_last_elec_energy<<" _last_vdw_energy="<<_last_vdw_energy<<endl;
	cout<<"_last_noe_energy="<<_last_noe_energy<<endl;
	//rotamer.setUserEnergy(_last_noe_energy);
	//cout<<" _user_energy="<<rotamer.userEnergy()<<endl;
	cout<<"ener_.eprop[epot]="<<ener_.eprop[epot]<<endl;

	cout<<"DEBUGGING: minimizeSingleRotamer ...FIN"<<endl; 
	#endif
	return ener_.eprop[epot];
}

float CharmmComputations::energySingleRotamer(
		const Rotamer& rotamer, int pos_number,
		const string& segid) {
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: energySingleRotamer"<<endl; 
	#endif
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;

	// rotamer_res_code must be patched already!!

	editDihedral(rotamer,pos_number,segid);
	cmCoor("INIT SELE SEGID " + segid + " .AND. RESID " + number_str
			+ " .AND. .NOT. " + _backbone_selection + " END");
	cmIc("PURGE");
	cmIc("PARA");
	cmIc("BUILD");
	//cmIc("PRINT");

	cmCons("FIX SELE .NOT. ( SEGID " + segid + " .AND. RESID " + number_str + " ) .OR. "
			+ _backbone_selection_full + " END");
	cmUpda(_upda_param);
	if (_hbon_flag)
		cmHbon(_hbon_param);

 	if (_extra_ener_flag || !_mini_flag) {
		cmSkip(_skip_ener_param);
		if (_no_self_flag)
			cmInteSel("",_islct,_jslct);
		else if (_ener_selection_flag)
			inteILSel();
		else
			cmEner("");
 	}

	#ifdef VDWELEC
	_last_elec_energy = ener_.eterm[elec];
	_last_vdw_energy = ener_.eterm[vdw];
	#endif
	#ifdef NOE
	_last_noe_energy = ener_.eterm[noe];
	#endif
	#ifdef NOEDEBUGFULL
	//cout << "mini ener hbond " << ener_.eterm[hbond] << endl;
	cout<<"DEBUGGING: _last_elec_energy="<<_last_elec_energy<<" _last_vdw_energy="<<_last_vdw_energy<<endl;
	cout<<"_last_noe_energy="<<_last_noe_energy<<endl;
	//rotamer.setUserEnergy(_last_noe_energy);
	//cout<<" _user_energy="<<rotamer.userEnergy()<<endl;
	cout<<"ener_.eprop[epot]="<<ener_.eprop[epot]<<endl;

	cout<<"DEBUGGING: energySingleRotamer ...FIN"<<endl; 
	#endif
	return ener_.eprop[epot];
}

/* float CharmmComputations::aspotTemplate() {
	cmCoor("SURF SELE .NOT. TYPE H* END " + _surf_param);
	return getWeightedASA(
			rotamer.resCode(),
			"SEGID " + segid + " .AND. RESID " + number_str );
*/
pair<float,float> CharmmComputations::aspotSingleRotamer( int pos_number, const string& segid, char res_code) {
	Rotamer dummy(-1,res_code);
	return aspotSingleRotamer(dummy, pos_number,segid);
} 

pair<float,float> CharmmComputations::aspotSingleRotamer(
		const Rotamer& rotamer, int pos_number,
		const string& segid) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;

	// rotamer_res_code must be patched already
	// and with coordinates

	
	if (_local_template_flag) {
		string res_str = " (.NOT. TYPE H*) .AND. ( SEGID " + segid
				+ " .AND. RESID " +
				buffer + " .AND. .NOT. " + _backbone_selection_full + ") ";
		sslctAround(res_str);
		cmCosf(_surf_param,_sslct);
		//cmCoor("SURF SELE (.NOT. TYPE H*) .AND. " + template_residue_str
		//		+ " END " + _surf_param);
	}
	else {
		cmCoor("SURF SELE .NOT. TYPE H* END " + _surf_param);
	}

	return getWeightedASA(
			rotamer.resCode(),
			"SEGID " + segid + " .AND. RESID " + number_str
			+ " .AND. .NOT. " + _backbone_selection_full);
}

float CharmmComputations::eef1FromISelect() const {
	double total_gsolv = 0.0;
	int i;
	for (i = 0; i < psfi_.natom; ++i)
		if (_islct[i]) {
			//cout << "gsolv " << i << " " << slv_.gsolv[i] << endl;
			total_gsolv += slv_.gsolv[i];
		}
	//cout << " total isel" << total_gsolv << endl;
	return total_gsolv;
}

float CharmmComputations::eef1FromJSelect() const {
	double total_gsolv = 0.0;
	int i;
	for (i = 0; i < psfi_.natom; ++i)
		if (_jslct[i]) {
			//cout << "gsolv " << i << " " << slv_.gsolv[i] << endl;
			total_gsolv += slv_.gsolv[i];
		}
	//cout << " total jsel " << total_gsolv << endl;
	return total_gsolv;
}

int CharmmComputations::SolvFlag() const {
	return _cmsolv_flag;
}

float CharmmComputations::SolvEnergy(){
	unfix();
	// we have to re-initialize the atomic solvation parameters for ALL atoms after patching
	if (_solv_type == "ASP"){
		cmOpen(string("READ CARD UNIT 15 NAME ") + _solvation_param_file);
		cmRead("SURF UNIT 15");
	} else if (_solv_type == "GBORN"){
		cmGBor(_gborn_param);
	} else if (_solv_type == "ACE"){
		cmAceOn();
		cmUpda(_ace_param);
	} else if (_solv_type == "")
		exitError("CharmmComputations::SolvEnergy: No solvation type specified, exiting");
	// we should skip all energy terms except the ones for solvation
	cmSkip(_skip_solv_param);
	cmEner("");
	float solvation_energy = ener_.eprop[epot];
	if (_solv_type == "GBORN"){
		cmGBor("CLEAR");
	} else if (_solv_type == "ACE"){
		// The COUL energy property name should match the ELEC term when ACE is switched off
		solvation_energy -= ener_.eprop[coul];
		cmAceOff();
	}
	cmSkip("NONE");
	return solvation_energy;
}

void CharmmComputations::activateGB(){
	cmGBor(_gborn_param);
	//cmSkip(_skip_solv_param);
}

float CharmmComputations::eef1FromAll() const {
	double total_gsolv = 0.0;
	char type[5];
	int i;
	for (i = 0; i < psfi_.natom; ++i) {
		getCmChars(psfc_.type[i],type,5);
		//cout << "gsolv " << i << " " << type << flush;
		//cout << " " << slv_.gsolv[i] << endl;
		total_gsolv += slv_.gsolv[i];
	}
	//cmEef1Print();
	//cout << " total all " << total_gsolv << endl;
	return total_gsolv;
}

pair<float,float> CharmmComputations::aspotSingleRotamerIsolated(
		const Rotamer& rotamer, int pos_number,
		const string& segid) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;

	// rotamer_res_code must be patched already
	// and with coordinates

	string res_str = " ( SEGID " + segid + " .AND. RESID " +
			buffer + " .AND. .NOT. " + _backbone_selection_full + " ) ";  // no bspot
			//buffer + " ) ";
	cmCoor("SURF SELE (.NOT. TYPE H*) .AND. "
			//+ res_str + " END " + _surf_param);
			//+ res_str + " END " + " ACCE RPROBE 1.4 ACCU 0.03" );
			+ res_str + " END " + " ACCE RPROBE 1.4" );

	//cmCoor("PRINT SELE SEGID " + segid + " .AND. RESID " + buffer + " END");

	return getWeightedASA(
			rotamer.resCode(),
			"(.NOT. TYPE H*) .AND. SEGID " + segid + " .AND. RESID " + number_str
			+ " .AND. .NOT. " + _backbone_selection_full);
	//cout << " have now iso_weight " << iso_weight << endl;

	//cout << " compare " << getASA("(.NOT. TYPE H*) .AND. SEGID " + segid
	//		+ " .AND. RESID " + buffer + " .AND. .NOT. "
	//		+ _backbone_selection_full) << endl;
}

float CharmmComputations::bspotSingleRotamer( int pos_number,
		const string& segid, float residue_aspot,
		float template_aspot) {
	if (!(_local_template_flag))
		cout<<"WARNING: _local_template_flag= "<<_local_template_flag<<endl;
	Rotamer dummy;
	return bspotSingleRotamer(dummy,pos_number,segid,residue_aspot,template_aspot);
}

float CharmmComputations::bspotSingleRotamer(
		const Rotamer& rotamer, int pos_number,
		const string& segid, float residue_aspot,
		float template_aspot) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);

	// rotamer_res_code must be patched already
	// and with coordinates

	float template_residue_aspot;

	if (_local_template_flag) {
		// template + residue aspot
		// assuming cmCosf already called in aspotSingleRotamer():
		template_residue_aspot = aspotSslct();

		// template without residue aspot:
		string res_str = " ( SEGID " + segid + " .AND. RESID " +
				buffer + " .AND. .NOT. " + _backbone_selection_full + ") ";
		sslctAndNot(res_str);
		cmCosf(_surf_param,_sslct);
		template_aspot = aspotSslct();
	}
	else {
		// template_aspot from paramter;
		template_residue_aspot = aspotAll();
	}

	return template_aspot - (template_residue_aspot - residue_aspot);
}

void CharmmComputations::aspotTest(
		int pos_number, char res_code, const string& segid) {
	char buffer[30];
	sprintf(buffer,"%d",pos_number);
	string number_str = buffer;

	cout << "testing res " << res_code << " "
			<< segid << " " << number_str << endl;
	string res_str = " ( SEGID " + segid + " .AND. RESID " +
			buffer + " .AND. .NOT. " + _backbone_selection_full + ") ";
	sslctAround(res_str);
	cmCosf(_surf_param,_sslct);

	//float residue_aspot = getWeightedASA(res_code,res_str).first;
	//cout << "residue_aspot " << residue_aspot << endl;

	float template_residue_aspot = aspotSslct();
	cout << "template_residue_aspot " << template_residue_aspot << endl;

	//template without residue aspot:
	sslctAndNot(res_str);
	cmCosf(_surf_param,_sslct);
	float template_aspot = aspotSslct();
	cout << "template_aspot " << template_aspot << endl;
	cout << "diff aspots "
			<< template_aspot - template_residue_aspot << endl;

	//float residue_bspot = template_aspot
	//		- (template_residue_aspot - residue_aspot);
	//cout << "residue_bspot " << residue_bspot << endl;

	cmCoor("SURF SELE (.NOT. TYPE H*) END " + _surf_param);
	float aspot_all = aspotAll();
	cout << "aspot_all " << aspot_all << endl;

	cmCoor("SURF SELE (.NOT. TYPE H*) .AND. .NOT. ("
			+ res_str + ") END " + _surf_param);
	float aspot_template = aspotAll();
	cout << "aspot_template " << aspot_template << endl;
	cout << "new diff aspots " << aspot_template - aspot_all << endl;

	//float new_residue_bspot = aspot_template - (aspot_all - residue_aspot);
	//cout << "new_residue_bspot " << new_residue_bspot << endl;

	cout << "SUMMARY " << endl;
	cout << "template_residue_aspot " << template_residue_aspot << endl;
	cout << "template_aspot " << template_aspot << endl;
	cout << "diff aspots " << template_aspot - template_residue_aspot << endl;
	cout << "aspot_all " << aspot_all << endl;
	cout << "aspot_template " << aspot_template << endl;
	cout << "new diff aspots " << aspot_template - aspot_all << endl;
}

float CharmmComputations::energyPairRotamers(
		const Rotamer& rotamer1, const Rotamer& rotamer2,
		int pos_number1, const string& segid1,
		int pos_number2, const string& segid2) {
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: energyPairRotamers"<<endl; 
	#endif
	
	// VERY IMPORTANT!!!
	// rotamer1_res_code and rotamer2_res_code must be
	// patched already !!!

	char buffer[50];
	sprintf(buffer,"%d",pos_number1);
	string number_str1 = buffer;
	sprintf(buffer,"%d",pos_number2);
	string number_str2 = buffer;

	if (_single_coordinates_flag) {
		setRotamerIniICoordinates(segid1,pos_number1,rotamer1);
		setRotamerIniJCoordinates(segid2,pos_number2,rotamer2);
			// if no BUILD segmentation fault when warnings are shown (???):
		//cmIc("PARA");  //31102000 this was in the c25 version
		if (_all_atoms_flag==1)
			cmIc("PARA");
		cmIc("BUILD");
	}
	else {
		// VERY IMPORTANT!!!
		// editDihedral(rotamer1,pos_number1,segid1) must already be called
		cmCoorInit(_ini_islct);

		editDihedral(rotamer2,pos_number2,segid2);
		cmCoorInit(_ini_jslct);

		cmIc("PARA");
		cmIc("BUILD");
	}
			// EXTREMELY important: without PURGE stack overflow, undefined
			// coors and a lot of other problems:
	cmIc("PURGE");

	cmUpda(_upda_param);
	if (_hbon_flag)
		cmHbon(_hbon_param);
	if (_mini_flag) {
		if (_cons_flag) {	
			cmCons("CLDH");
			string segid_number1 = segid1 + " " + number_str1;
			list<Dihedral>::const_iterator it_dihedral;
			for (it_dihedral = rotamer1.dihedrals().begin();
					it_dihedral != rotamer1.dihedrals().end();
					++it_dihedral) {
				sprintf(buffer,"%f",(*it_dihedral).angle());
				cmCons((string)"DIHE"
						+ " " + segid_number1 + " " + (*it_dihedral).first()
						+ " " + segid_number1 + " " + (*it_dihedral).second()
						+ " " + segid_number1 + " " + (*it_dihedral).third()
						+ " " + segid_number1 + " " + (*it_dihedral).fourth()
						+ " " + _cons_param + " MIN " + buffer);
			}

			string segid_number2 = segid2 + " " + number_str2;
			for (it_dihedral = rotamer2.dihedrals().begin();
					it_dihedral != rotamer2.dihedrals().end();
					++it_dihedral) {
				sprintf(buffer,"%f",(*it_dihedral).angle());
				cmCons((string)"DIHE"
						+ " " + segid_number2 + " " + (*it_dihedral).first()
						+ " " + segid_number2 + " " + (*it_dihedral).second()
						+ " " + segid_number2 + " " + (*it_dihedral).third()
						+ " " + segid_number2 + " " + (*it_dihedral).fourth()
						+ " " + _cons_param + " MIN " + buffer);
			}
		}
		cmCons("FIX SELE ( ( ( .NOT. ( SEGID "
				+ segid1 + " .AND. RESID " + number_str1 + " ) ) "
				+ " .AND. ( .NOT.  ( SEGID "
				+ segid2 + " .AND. RESID " + number_str2 + " ) ) ) ) .OR.  "
				+ _backbone_selection_full + " END");

		if (_cons_harm_force!=0){
			sprintf(buffer,"%f",_cons_harm_force);
			cmCons("HARM FORCE "+ string(buffer) + " MASS SELE ( ( SEGID " + segid1 
				+ " .AND. RESID " + number_str1 + " ) .OR. ( SEGID "
				+ segid2 + " .AND. RESID " + number_str2 + " ) ) .AND. .NOT. "
				+ _backbone_selection_full + " END");
		}
		cmSkip(_skip_mini_param);
		cmMini(_mini_param);
		if (_cons_harm_force!=0)
			cmCons("HARM CLEAR");
		if (_cons_flag)
			cmCons("CLDH");
	}
	#ifdef NOE
	_last_noe_energy = ener_.eterm[noe];
	#endif
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: after mini: _last_elec_energy="<<ener_.eterm[elec]<<" _last_vdw_energy="<<ener_.eterm[vdw]<<" _last_noe_energy="<<_last_noe_energy<<endl;
	cout<<"DEBUGGING: ener_.eprop[epot]="<<ener_.eprop[epot]<<endl;
	cout<<"DEBUGGING: NOT Running cmEner()..."<<endl;
	//cmEner("");  /// Using cmEner while calculating PairEnergies CHANGES RESULTS !! Run noedebugfull w/o cmEner
	#endif
	/*
	*/

 	/* if (_extra_ener_flag || !_mini_flag) {
		cmSkip(_skip_ener_param);
		cmEner("");
 	} */
	//if (_extra_ener_flag)
	//	cmSkip(_skip_ener_param);
	//if (!_mini_flag)
	//	cmEner("");
	cmSkip(_skip_ener_param);

	if (_all_atoms_flag==1)
		cmUpda("ATOM VATOM");  //31102000
	if (_hbon_flag)
		cmHbon(_hbon_param);
	/* cmInte("SELE RESID " + number_str1
			+ " .AND. .NOT. " + _backbone_selection_full + " END"
		// RESID faster than ATOM * ??
	//		+ " SELE ATOM " + segid + " " + number_str2 + " * "
			+ " SELE RESID " + number_str2
			+ " .AND. .NOT. " + _backbone_selection_full + " END");
	*/

	//-cmSkip(_skip_ener_param);
	#ifdef NOE
	switchUser(1);
	#endif
	// IMPORTANT: _isclt and _jslct must contain the select flags;
	cmInteSel("",_islct,_jslct);
	#ifdef NOE
	switchUser(0);	/// We could as well use the NOE energy obtained in last minimization step
			/// Miguel A. Santos, HSC, Toronto, 2006
	#endif
	
	#ifdef VDWELEC
	_last_elec_energy = ener_.eterm[elec];
	_last_vdw_energy = ener_.eterm[vdw];
	#endif
	#ifdef NOE
	_last_noe_energy = ener_.eterm[noe]==0? ener_.eterm[user] : ener_.eterm[noe]; /// Modified INTERE code gives NOE in ETERM[USER] , USER=9; MA Santos, 11072006
	//(*it_rotamer).setUserEnergy(_last_noe_energy);
	#endif
	//#ifdef NOEDEBUG
	#ifdef NOEPRN
	printf("NOE:  Pair %4d,%4d  ",pos_number1,pos_number2);
	//cout<<"NOE:  Pair "<<pos_number1<<","<<pos_number2<<"     elec="<<_last_elec_energy<<
	cout<<" elec="<<_last_elec_energy<<
				" vdw="<<_last_vdw_energy<<
				" noe="<<_last_noe_energy<<" (user="<<ener_.eterm[user]<<")"<<
				" epot="<<ener_.eprop[epot]<<endl;
	#endif
	#ifdef NOEDEBUGFULL

	cout<<"DEBUGGING: NOT Running cmEner()..."<<endl;
	//cmEner("");  /// Using cmEner while calculating PairEnergies CHANGES RESULTS !! Run noedebugfull w/o cmEner
	//cout<<"Exiting..."<<endl;
	//exit(1);

	cout<<"DEBUGGING: energyPairRotamers ...FIN"<<endl; 
	#endif
	return ener_.eprop[epot];
}

void CharmmComputations::unfix() const {
	cmCons("FIX SELE " + _fix_sele + " END");
	cmUpda(_upda_param);
}

void CharmmComputations::fixSele(const string& fix_sele){
	_fix_sele = fix_sele;
}

void CharmmComputations::eef1Energy() const {
	cmEef1Init();
	cmEef1Energy();
}

//void CharmmComputations::eef1InteEnergy() const {
//	cmEef1Energy(1);
//}

float CharmmComputations::eef1PairRotamers(
		const Rotamer& rotamer1, const Rotamer& rotamer2,
		float template_aspot ) const {
	unfix();
	eef1Energy();
	float residues_aspot = eef1FromISelect();
	residues_aspot += eef1FromJSelect();

	float template_residues_aspot = eef1FromAll();
	float template_bspot = template_aspot
			- (template_residues_aspot - residues_aspot);
	float template_bspot_intersect =
			rotamer1.templateBSPot() + rotamer2.templateBSPot()
			- template_bspot;
	return (rotamer1.aspot() + rotamer2.aspot() - residues_aspot)
			- template_bspot_intersect;
}

float CharmmComputations::bspotPairRotamers(
		const Rotamer& rotamer1, const Rotamer& rotamer2,
		int pos_number1, const string& segid1,
		int pos_number2, const string& segid2,
		float template_aspot) {

	// VERY IMPORTANT!!!
	// rotamer1_res_code and rotamer2_res_code must be
	// patched already !!!

	char buffer[50];
	sprintf(buffer,"%d",pos_number1);
	string number_str1 = buffer;
	sprintf(buffer,"%d",pos_number2);
	string number_str2 = buffer;

	float template_residues_aspot;

	float residues_aspot = 0;
	if (_local_template_flag) {
		string res_str = string(".NOT. TYPE H* .AND. ")
				+ " ( ( ( SEGID " + segid1 + " .AND.  RESID " + number_str1 + " ) .OR. "
				+ " ( SEGID " + segid2 + " .AND.  RESID " + number_str2 + " ) ) "
				+ " .AND. .NOT. " + _backbone_selection_full + " ) ";

		// template + residues aspot:
		sslctAround(res_str);
		cmCosf(_surf_param,_sslct);
		template_residues_aspot = aspotSslct();
		residues_aspot = getWeightedASA(rotamer1.resCode(),
				"SEGID " + segid1 + " .AND. RESID " + number_str1
				+ " .AND. .NOT. " + _backbone_selection_full).first;
		residues_aspot += getWeightedASA(rotamer2.resCode(),
				"SEGID " + segid2 + " .AND. RESID " + number_str2
				+ " .AND. .NOT. " + _backbone_selection_full).first;

		// template without residues aspot:
		sslctAndNot(res_str);
		cmCosf(_surf_param,_sslct);
		template_aspot = aspotSslct();
	}
	else {
		// template_aspot from parameter
		cmCoor("SURF SELE .NOT. TYPE H* END " + _surf_param);
		template_residues_aspot = aspotAll();
		residues_aspot = getWeightedASA(rotamer1.resCode(),
				"SEGID " + segid1 + " .AND. RESID " + number_str1
				+ " .AND. .NOT. " + _backbone_selection_full).first;
		residues_aspot += getWeightedASA(rotamer2.resCode(),
				"SEGID " + segid2 + " .AND. RESID " + number_str2
				+ " .AND. .NOT. " + _backbone_selection_full).first;
	}

	float template_bspot = template_aspot
			- (template_residues_aspot - residues_aspot);
	float template_bspot_intersect =
			rotamer1.templateBSPot() + rotamer2.templateBSPot()
			- template_bspot;


	/* cout << "bspot for " << pos_number1 << " " << pos_number2 << endl
			<< "template_aspot " << template_aspot << endl
			<< "template_residues_aspot " << template_residues_aspot << endl
			<< "residues_aspot " << residues_aspot << endl
			<< "-> template_bspot " << template_bspot << endl
			<< "rotamer1.templateBSPot() " << rotamer1.templateBSPot() << endl
			<< "rotamer2.templateBSPot() " << rotamer2.templateBSPot() << endl
			<< "-> template_bspot_intersect " << template_bspot_intersect << endl
			<< "return "  << -template_bspot_intersect
								+ _surface_potential_factor * 
					(rotamer1.aspot() + rotamer2.aspot() - residues_aspot)
			<< endl;
   */


	return -template_bspot_intersect + _surface_potential_factor *
			(rotamer1.aspot() + rotamer2.aspot() - residues_aspot);
}

float CharmmComputations::bspotPairRotamersIsolated(
		const Rotamer& rotamer1, const Rotamer& rotamer2,
		int pos_number1, const string& segid1,
		int pos_number2, const string& segid2,
		float template_aspot) {

	// VERY IMPORTANT!!!
	// rotamer1_res_code and rotamer2_res_code must be
	// patched already !!!

	char buffer[50];
	sprintf(buffer,"%d",pos_number1);
	string number_str1 = buffer;
	sprintf(buffer,"%d",pos_number2);
	string number_str2 = buffer;

	string res_str =
			" ( ( ( SEGID " + segid1 + " .AND.  RESID " + number_str1 + " ) .OR. "
			+ " ( SEGID " + segid2 + " .AND.  RESID " + number_str2 + " ) ) "
			//+ " .AND. .NOT. " + _backbone_selection_full + " ) ";
			+ " ) ";
	cmCoor("SURF SELE (.NOT. TYPE H*) .AND. "
			//+ res_str + " END " + _surf_param);
			//+ res_str + " END " + " ACCE RPROBE 1.4 ACCU 0.03");
			+ res_str + " END " + " ACCE RPROBE 1.4");
	//cmCoor("PRINT SELE RESID 3 .OR. RESID 4 END");

	//cout << "bspotpair for " << segid1 << number_str1
	//	<< " " << segid2 << number_str2 << endl;

	float residues_aspot_isolated1 = 
			getWeightedASA(rotamer1.resCode(),_islct).second;
	//cout << "first res surf " << residues_aspot_isolated1 << endl;
	float residues_aspot_isolated2 =
			getWeightedASA(rotamer2.resCode(),_jslct).second;
	//cout << "second surf " << residues_aspot_isolated2 << endl;

	//cout << "isolated 1 " << rotamer1.aspotIsolated() << endl;
	//cout << "isolated 2 " << rotamer2.aspotIsolated() << endl;

	cout << "old " << _surface_potential_factor *
			(rotamer1.aspotIsolated() + rotamer2.aspotIsolated()
			- residues_aspot_isolated1 - residues_aspot_isolated2 ) << endl;

	//cout << "new " << _surface_potential_factor * (
	//		rotamer1.aspotRatio()*(rotamer1.aspotIsolated() - residues_aspot_isolated1)
	//		+
	//		rotamer2.aspotRatio()*(rotamer2.aspotIsolated() - residues_aspot_isolated2)
	//	) << endl;

	//cout << "ratio1 " << rotamer1.aspotRatio() << endl;
	//cout << rotamer1 << endl;
	//cout << "ratio2 " << rotamer2.aspotRatio() << endl;

	//return _surface_potential_factor * (
	//		rotamer1.aspotRatio()*(rotamer1.aspotIsolated() - residues_aspot_isolated1)
	//		+
	//		rotamer2.aspotRatio()*(rotamer2.aspotIsolated() - residues_aspot_isolated2)
	//	);
	return _surface_potential_factor *
			(rotamer1.aspotIsolated() + rotamer2.aspotIsolated()
			- residues_aspot_isolated1 - residues_aspot_isolated2 );
}

float CharmmComputations::minDistanceIJSelect() {
	vector<int> jresidues;
	int i, j;
	for (j = 0; j < psfi_.natom; ++j)
		if (_jslct[j])
			jresidues.push_back(j);
	float x, y, z, dist;
	float min_dist = LARGE_FLOAT;
	for (i = 0; i < psfi_.natom; ++i)
		if (_islct[i])
			for (j = 0; j < jresidues.size(); ++j) {
				x = coord_.x[i] - coord_.x[jresidues[j]];
				y = coord_.y[i] - coord_.y[jresidues[j]];
				z = coord_.z[i] - coord_.z[jresidues[j]];
				dist = sqrt((double)x*x + y*y + z*z);
				if (dist < min_dist)
					min_dist = dist;
			}
	//cout << "min_dist " << min_dist << endl;
	return min_dist;
}

float CharmmComputations::energyVecRotamers(
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers,
		const vector<string>& segids, bool include_backbone) {
	char buffer[50];
	int i;

	int sz_pos = pos_numbers.size();
	if (sz_pos != vec_it_rotamer.size())
		exitError("energyListRotamer BUG: unequal vector sizes");

	#ifdef NOEDEBUGFULL
	for (i = 0; i < sz_pos; ++i)
		cout<<"DEBUGGING: Pos="<<i<<" NOEEnergy="<<(*(vec_it_rotamer[i])).NOEEnergy()
			<<endl;
	#endif
	for (i = 0; i < sz_pos; ++i)
		patchResidue((*(vec_it_rotamer[i])).resCode(),pos_numbers[i],segids[i]);
	vector<string> number_str(sz_pos);
	for (i = 0; i < sz_pos; ++i) {
		sprintf(buffer,"%d",pos_numbers[i]);
		number_str[i] = buffer;
	}

	if (_single_coordinates_flag) {
		for (i = 0; i < sz_pos; ++i) {
			selectIniIResidue(pos_numbers[i],segids[i]);
			setRotamerIniICoordinates(segids[i],pos_numbers[i],
					*(vec_it_rotamer[i]) );
		}
			// see comment in energyPairRotamers():
		cmIc("BUILD");
	}
	else {
		for (i = 0; i < sz_pos; ++i) {
			editDihedral(*(vec_it_rotamer[i]),pos_numbers[i],segids[i]);
			cmCoor("INIT SELE SEGID " + segids[i] + " .AND. RESID " + number_str[i]
					+ " .AND. .NOT. " + _backbone_selection + " END");
		}
		cmIc("PURGE");
		cmIc("PARA");
		cmIc("BUILD");
	}
	cmIc("PURGE");

	if (_include_backbone_flag==1) { // we only unfix the backbone if include_backbone_flag=1
		cmCons("FIX SELE " + _fix_sele + " END");
	}
	else {
		string constraint = "FIX SELE ( ";
		for (i = 0; i < sz_pos; ++i) {
			//constraint += ".NOT. RESID " + number_str[i];
			constraint += ".NOT. ( SEGID " + segids[i]
					+ " .AND. RESID " + number_str[i] + " ) ";
			if (i < sz_pos-1)
				constraint += " .AND. ";
		}
		constraint += " ) .OR. " + _backbone_selection_full + " END";
		if (constraint.length() >= cm_cons_length)
			exitError("energyVecRotamers: constraint too long");
		cmCons(constraint);
	}

	if (_cons_flag) {
		cmCons("CLDH");
		for (i = 0; i < sz_pos; ++i) {
			string segid_number = " " + segids[i] + " " + number_str[i] + " ";
			list<Dihedral>::const_iterator it_dihedral;
			for (it_dihedral = (*(vec_it_rotamer[i])).dihedrals().begin();
					it_dihedral != (*(vec_it_rotamer[i])).dihedrals().end();
					++it_dihedral) {
				sprintf(buffer,"%f",(*it_dihedral).angle());
				cmCons((string)"DIHE"
						+ segid_number + (*it_dihedral).first()
						+ segid_number + (*it_dihedral).second()
						+ segid_number + (*it_dihedral).third()
						+ segid_number + (*it_dihedral).fourth()
						+ " " + _cons_param + " MIN " + buffer);
			}
		}
	}
	
	cmUpda(_upda_param);
	if (_hbon_flag)
		cmHbon(_hbon_param);
	if (_mini_flag) {
	  #ifdef NOEWRTINFO	// We want all restraints 
		#ifdef NOEDEBUGFULL
		cout<<"DEBUGGING: energyVecRotamers: re-loading NOE restraints for all residues "<<endl;
		NOEres.printRestraints(NOEres.getRestraints());
		#endif
		Noe("RESET");
		Noe("SCALE "+ToString(NOEres.getScale()));
		Noe(NOEres.getRestraints());
	  #endif
	
		cmSkip(_skip_mini_param);
		cmMini(_mini_param);
	
		#ifdef NOEDEBUG
		cout<<"NOE: energyVecRotamers: after mini, noe="<<ener_.eterm[noe]<<endl;
		#endif
	}
	if (_cons_flag)
		cmCons("CLDH");

		// we don't repatch the dummy patch because the assumption is
		// that all positions are patched anyway
		// but we rename the residues
	if (include_backbone) { // the include_backbone is used here in order to request the whole energy (1) or just the side-chains (0)
		cmCons("FIX SELE " + _fix_sele + " END");
	}
	for (i = 0; i < sz_pos; ++i)
		cmRena("RESNAME " + resStr((*(vec_it_rotamer[i])).resCode())
				+ " SELE SEGID " + segids[i] + " .AND. RESID " + number_str[i] + " END");

 	if (_extra_ener_flag || !_mini_flag) {
	  #ifdef NOEWRTINFO	// We want all restraints 
		#ifdef NOEDEBUGFULL
		cout<<"DEBUGGING: energyVecRotamers: re-loading NOE restraints for all residues "<<endl;
		NOEres.printRestraints(NOEres.getRestraints());
		#endif
		Noe("RESET");
		Noe("SCALE "+ToString(NOEres.getScale()));
		Noe(NOEres.getRestraints());
	  #endif
	
		cmSkip(_skip_ener_param);
		cmEner("");
	
		#ifdef NOEDEBUG
		cout<<"NOE: energyVecRotamers: after ener, noe="<<ener_.eterm[noe]<<endl;
		#endif
 	}

	if (include_backbone) {
		_include_backbone_energy = ener_.eprop[epot];
	}
	
	return ener_.eprop[epot];
}

/* float CharmmComputations::solvationVecRotamers(
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers,
		const vector<string>& segids, bool include_backbone) {
	char buffer[50];
	int i;

	int sz_pos = pos_numbers.size();
	if (sz_pos != vec_it_rotamer.size())
		exitError("solvationVecRotamers BUG: unequal vector sizes");

	for (i = 0; i < sz_pos; ++i)
		patchResidue((*(vec_it_rotamer[i])).resCode(),pos_numbers[i],segids[i]);

	vector<string> number_str(sz_pos);
	for (i = 0; i < sz_pos; ++i) {
		sprintf(buffer,"%d",pos_numbers[i]);
		number_str[i] = buffer;
	}

	cmCoor("SURF SELE .NOT. TYPE H* END " + _surf_param);

	float surf = 0;
	for (i = 0; i < sz_pos; ++i) {
		surf += getWeightedASA((*(vec_it_rotamer[i])).resCode(),
				"SEGID " + segids[i] + " .AND. RESID " + number_str[i] ).first
				- (*(vec_it_rotamer[i])).aspot();
	}

	return _surface_potential_factor * surf;
} */

void CharmmComputations::writeSolvation(ostream& os,
		float energy,
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		int number) {

	int sz_pos = vec_it_rotamer.size();
	float solvation_reference = 0;
	for (int i = 0; i < sz_pos; ++i) {
		solvation_reference
				+= _solvation_reference[(*(vec_it_rotamer[i])).resCode()];
		cout << "subtracting solv " << (*(vec_it_rotamer[i])).resCode()
				<< " " << _solvation_reference[(*(vec_it_rotamer[i])).resCode()]
				<< endl;
	}

	//cmCons(string("FIX SELE .NOT. ") + _backbone_selection_full + " END");
		// IMPORTANT!
		// the whole setup of the protein inclusive RENA, FIX etc must come
		// BEFORE the solvation parameter file is read

	// the constraint on the selected side chains should in
	// energyVecRotamer should still be valid
	cmOpen(string("READ CARD UNIT 15 NAME ") + _solvation_param_file);
	cmRead("SURF UNIT 15");
	//cmClos("UNIT 15"); is closed automatically 
	cmSkip("ALL EXCL ASP");
	cmEner("");

	float solvation = ener_.eterm[asp] - solvation_reference;
	os << "#" << number << " " << solvation
			<< "        " << energy + solvation << endl;
}

float CharmmComputations::energyRefStructure(
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers,
		const vector<string>& segids) {
	string first,second,last;
	int i,j ;
	string buff ;
	char buffer[50] ;
	
	cout << "energyRefStructure OK" << endl;

	cmCons("FIX SELE " + _fix_sele + " END");

		// FIRST: CONSTRUCT conformation (as in energyVecRotamers)
	int sz_pos = pos_numbers.size();
	if (sz_pos != vec_it_rotamer.size())
		exitError("energyListRotamer BUG: unequal vector sizes");

		// patch residues as in energyVecRotamers = DELE + PATCH
		// but without keeping coordintes neither editing chi dihedral angles
	for (i = 0; i < sz_pos; ++i)
			patchResidue((*(vec_it_rotamer[i])).resCode(),pos_numbers[i],segids[i]);
	cmIc("PURGE");
	cmIc("PARA");
	cmIc("SAVE");
	
		// INIT and BUILD coordinates
	vector<string> number_str(sz_pos);
	for (i = 0; i < sz_pos; ++i) {
		sprintf(buffer,"%d",pos_numbers[i]);
		number_str[i] = buffer;
	}
	for (i = 0; i < sz_pos; ++i) 
		cmCoor("INIT SELE SEGID " + segids[i] + " .AND. RESID " + number_str[i] 
				+ " .AND. .NOT. " + _backbone_selection + " END");
	cmIc("BUILD");
	for (i = 0; i < sz_pos; ++i)
		cmRena("RESNAME " + resStr((*(vec_it_rotamer[i])).resCode())
				+ " SELE SEGID " + segids[i] + " .AND. RESID " + number_str[i] + " END");

		// SECOND: build EXT CONF. IN COMP 

	cmCoor("COPY COMP");
		// edit dihe for phi and psi angles
		// first phi
	cmIcEd((string)"DIHE " + segids[0] + " 1 HT1 " + segids[0] + " 1 N "
			+ segids[0] + " 1 CA " + segids[0] + " 1 C -120.0");
	for (i = 1, j = 2; i < (psfi_.nres); ++i, j++) {
		sprintf(buffer,"%d",i);
		first = segids[i-1] + buffer;
		sprintf(buffer,"%d",j);
		second = segids[j-1] + buffer;
			//psi
		cmIcEd((string)"DIHE " + first + " N "
				+ first + " CA " + first + " C "
				+ second + " N  140.0");
			//phi
		cmIcEd((string)"DIHE " + first + " C "
				+ second + " N " + second + " CA "
				+ second + " C -120.0");
	}

		//last psi
	sprintf(buffer,"%d",psfi_.nres);
	last = segids[psfi_.nres-1] + buffer;
	cmIcEd((string)"DIHE " + last + " N " + last
			+ " CA " + last + " C " + last + " OT2 140.0");
	cmIcEd((string)"END");

	cmCoor("INIT COMP SELE .NOT. ( SEGID " + segids[0]
			+ " .AND. RESID 1 .AND. (TYPE N .OR. TYPE CA .OR. TYPE C)) END");
	cmIc("PURGE");
	cmIc("PARA");
	cmIc("BUILD COMP");

	cmSkip(_skip_ener_param);
	cmEner("COMP");
	
	cmIc("RESTORE");

	return _ref_structure_energy = ener_.eprop[epot];
}

#ifdef VDWELEC
float CharmmComputations::lastElecEnergy() const {
	return _last_elec_energy;
}

float CharmmComputations::lastVdwEnergy() const {
	return _last_vdw_energy;
}
#endif
#ifdef NOE
float CharmmComputations::lastNOEEnergy() const {
	return _last_noe_energy;
}
#endif


int CharmmComputations::miniFlag() const {
	return _mini_flag;
}

int CharmmComputations::singleCoordinatesFlag() const {
	return _single_coordinates_flag;
}

void CharmmComputations::writePDB(const string& file_name) {
	cmOpen("WRITE UNIT 14 CARD NAME " + file_name);
	cmWrit("COOR PDB UNIT 14 CARD");
	cmClos("UNIT 14");
}

float CharmmComputations::writeShortInfo(ostream& os,
		const vector< vector<float> >& pair_energies,
		int number,
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers, const vector<string>& segids) {
	int sz_pos = pos_numbers.size(), i;
	float energy;
	//os << "#" << number << " " // << ener_.eprop[epot] << " ";
	//		<< (energy = getShortEnergy(pair_energies,vec_it_rotamer)) << " ";
	energy = getShortEnergy(pair_energies,vec_it_rotamer);
	char buffer[50];
	sprintf(buffer,"#%-6d %10.4lf  ",number,energy);
	os << buffer;
	for (i = 0; i < sz_pos; ++i)
		os << segids[i] << " " << pos_numbers[i] 
			<< (*(vec_it_rotamer[i])).resCode() << " ";
	os << endl;
	return energy;
}

float CharmmComputations::getShortEnergy(
		const vector< vector<float> >& pair_energies,
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer) {
	
	int sz_pos = vec_it_rotamer.size();
	int i, j;

	float single_sum = 0, single_ref_sum = 0;
	for (i = 0; i < sz_pos; ++i) {
		single_ref_sum += (*(vec_it_rotamer[i])).energyRef();
		single_sum += (*(vec_it_rotamer[i])).energy();
	}

	float pair_sum = 0;
	int index1, index2;
	for (i = 0; i < sz_pos - 1; ++i) {
		index1 = (*(vec_it_rotamer[i])).index();
		for (j = i+1; j < sz_pos; ++j) {
			index2 = (*(vec_it_rotamer[j])).index();
			// pair_vdw_energies[index2][index1]
			// pair_elec_energies[index2][index1]
			// pair_solv_energies[index2][index1]
			pair_sum += pair_energies[index2][index1];
		}
	}
	return single_sum + pair_sum;	
}

void CharmmComputations::writeShortRefInfo(ostream& os,
		int number,
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers, const vector<string>& segids) {
	os << "     " << _include_backbone_energy - _ref_structure_energy
			<< " (b " << _include_backbone_energy
			<< " - r " << _ref_structure_energy << ")";
	os << endl;
}

void CharmmComputations::writeFullInfo(ostream& os, int number,
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers,
		const vector<string>& segids,
		const vector< vector<float> >& pair_energies,
		#ifdef VDWELEC
		const vector< vector<float> >& pair_vdw_energies,
		const vector< vector<float> >& pair_elec_energies,
		#endif
		#ifdef NOEWRTINFO
		const vector< vector<float> >& pair_noe_energies,
		#endif
		const vector< vector<float> >& pair_solv_energies,
		float solvation) {
	int sz_pos = pos_numbers.size();
	int i, j;

	os << "#" << number << endl;
	os << "pot " << ener_.eprop[epot]
			#ifdef VDWELEC
			<< " vdw " << ener_.eterm[vdw]
			<< " elec " << ener_.eterm[elec]
			#endif
			<< " bond " << ener_.eterm[bond]
			<< " angle " << ener_.eterm[angle]
			<< endl
			<< "hbond " << ener_.eterm[hbond]
			<< " dihe " << ener_.eterm[dihe]
			<< " solv " << ener_.eterm[asp]
			<< " impr " << ener_.eterm[imdihe]
			<< " cdihe " << ener_.eterm[cdihe]
		#ifdef NOEWRTINFO
			<< " noe " << ener_.eterm[noe]
			<< " (NOES= " << NOEres.getScale()<<") "
		#endif
			<< endl;
	float total_energy = ener_.eprop[epot];

	float single_sum = 0, single_ref_sum = 0;
	float single_solv_sum = 0;
	#ifdef NOEWRTINFO
	float single_noe = 0;
	#endif
	for (i = 0; i < sz_pos; ++i) {
		os << "   " << pos_numbers[i] << " " << segids[i] << " "
				<< (*(vec_it_rotamer[i])) << endl;
		single_ref_sum += (*(vec_it_rotamer[i])).energyRef();
		single_sum += (*(vec_it_rotamer[i])).energy();
		single_solv_sum += //(*(vec_it_rotamer[i])).aspot();
				(*(vec_it_rotamer[i])).aspot() - (*(vec_it_rotamer[i])).templateBSPot();
		#ifdef NOEWRTINFO
		single_noe += (*(vec_it_rotamer[i])).NOEEnergy();
		#endif
	}
	os << endl;

	char buffer[50];
	vector<string> number_str(sz_pos);
	for (i = 0; i < sz_pos; ++i) {
		sprintf(buffer,"%d",pos_numbers[i]);
		number_str[i] = string(buffer) + " " + segids[i];
	}

	float pair_sum = 0;
	float pair_solv_sum = 0;
	#ifdef NOEWRTINFO
	float pair_noe = 0;
	#endif
	int index1, index2;
	for (i = 0; i < sz_pos - 1; ++i) {
		os << number_str[i] << ": " << endl;;
		index1 = (*(vec_it_rotamer[i])).index();
		for (j = i+1; j < sz_pos; ++j) {
			index2 = (*(vec_it_rotamer[j])).index();
			os << "   " << number_str[j] << " ";
			os << pair_energies[index2][index1]
					<< " ("
					#ifdef VDWELEC
					<< "vdw " << pair_vdw_energies[index2][index1]
					<< "  elec " << pair_elec_energies[index2][index1]
					#endif
					<< "  solv " << pair_solv_energies[index2][index1]
					#ifdef NOEWRTINFO
					<< "  noe " << pair_noe_energies[index2][index1]
					#endif
					<< ") " << endl;
			pair_sum += pair_energies[index2][index1];
			pair_solv_sum += pair_solv_energies[index2][index1];
			#ifdef NOEWRTINFO
			pair_noe += pair_noe_energies[index2][index1];
			#endif
		}
		os << endl;
	}

	os << "total single " << single_sum
			<< "  (" << single_ref_sum
			<< " + " << single_sum - single_ref_sum << ")" 
			#ifdef NOEWRTINFO
			<< " ( noe= "<< single_noe << ")"
			#endif
			<< endl
			<< "total pair " << pair_sum 
			#ifdef NOEWRTINFO
			<< " ( noe= "<< pair_noe << ")"
			#endif
			<< endl
			<< "total " << single_sum + pair_sum
			<< "  (our pot=" << single_ref_sum + pair_sum + pair_solv_sum << ")"
			<< " (real delta " << total_energy - single_ref_sum - pair_sum - pair_solv_sum
			<< ")" << endl;
	os << "solvation single " << single_solv_sum
			<< " pair " << pair_solv_sum
			<< " total " << single_solv_sum - pair_solv_sum 
			<< " compare " << solvation
			<< " (delta " << single_solv_sum - pair_solv_sum - solvation
			<< ") "
			<< endl;
}

void CharmmComputations::symmetryCorrect(Rotamer& rotamer,
		vector<float>& diff_dihedrals, int pos_number, string segid) {
	vector<float> dihedral_angles;
	switch(rotamer.resCode()) {
		case 'F':
		case 'Y':
		case 'H':
		case 'D':
			if (diff_dihedrals[1] > 90.0 || diff_dihedrals[1] < -90.0) {
				//cout << "correcting " << rotamer.resCode() << " "
				//		<< diff_dihedrals[1] << endl;
				diff_dihedrals[1] -= diff_dihedrals[1] > 0 ? 180.0 : -180.0;
				icFill();
				getRotamerDihedrals(segid,pos_number,
						rotamer,dihedral_angles);
				rotamer.setDihedralAngles(dihedral_angles);
				rotamer.addToDihedralAngle(1,
						diff_dihedrals[1] > 0 ? -180.0 : 180.0);
				setDihedral(rotamer,pos_number,segid);
				icDiff();
			}
			break;
		case 'E':
			if (diff_dihedrals[2] > 90.0 || diff_dihedrals[2] < -90.0) {
				//cout << "correcting " << rotamer.resCode() << " "
				//		<< diff_dihedrals[2] << endl;
				diff_dihedrals[2] -= diff_dihedrals[2] > 0 ? 180.0 : -180.0;
				icFill();
				getRotamerDihedrals(segid,pos_number,
						rotamer,dihedral_angles);
				rotamer.setDihedralAngles(dihedral_angles);
				rotamer.addToDihedralAngle(2,
						diff_dihedrals[2] > 0 ? -180.0 : 180.0);
				setDihedral(rotamer,pos_number,segid);
				icDiff();
			}
			break;
	}
}

void CharmmComputations::symmetryCorrectAngleVector(const Rotamer& rotamer,
		vector<float>& diff_dihedrals) {
	switch(rotamer.resCode()) {
		case 'F':
		case 'Y':
		case 'H':
		case 'D':
			if (diff_dihedrals[1] > 90.0 || diff_dihedrals[1] < -90.0) {
				//cout << "correcting " << rotamer.resCode() << " "
				//		<< diff_dihedrals[1] << endl;
				diff_dihedrals[1] -= diff_dihedrals[1] > 0 ? 180.0 : -180.0;
			}
			break;
		case 'E':
			if (diff_dihedrals[2] > 90.0 || diff_dihedrals[2] < -90.0) {
				//cout << "correcting " << rotamer.resCode() << " "
				//		<< diff_dihedrals[2] << endl;
				diff_dihedrals[2] -= diff_dihedrals[2] > 0 ? 180.0 : -180.0;
			}
			break;
		default:
			break;
	}
}

ostream& CharmmComputations::printDump(ostream& os) {
	os << _no_self_flag << " " << endl;
	os << _backbone_selection_full << endl;
	os << _backbone_selection << endl;
	os << _mini_param << endl;
	os << _mini_flag << " " << endl;
	os << _hbon_flag << " " << endl;
	os << _cons_param << endl;
	os << _cons_flag << " " << endl;
	os << _upda_param << endl;
	os << _hbon_param << endl;
	os << _skip_mini_param << endl;
	os << _skip_ener_param << endl;
	os << _surf_param << endl;
	os << _extra_ener_flag << endl;
	os << _single_coordinates_flag << endl;
	os << _dummy_res_code << endl;
	os << _surface_potential_factor << endl;
	os << _template_bspot_factor << " " << endl;
	os << _rms_exclusion << endl;
	return os;
}

char* getline(istream& is) {
	static char buffer[1024];
	is.getline(buffer,1024);
	return buffer;
}
	
istream& CharmmComputations::readDump(istream& is) {
	
	is >> _no_self_flag;
		cout << "  no_self_flag " << _no_self_flag << endl;
	getline(is); 
	_backbone_selection_full = (string)getline(is);
		//cout << "  backbone_selection_full '"
		//		<< _backbone_selection_full << "'" << endl;
	_backbone_selection = (string)getline(is);
		//cout << "  backbone_selection '" << _backbone_selection << "'" << endl;
	_mini_param = (string)getline(is);
		cout << "  mini_param '" << _mini_param << "'" << endl;
	is >> _mini_flag;
	getline(is); 
		cout << "  mini_flag " << _mini_flag << endl;
	is >> _hbon_flag;
	getline(is); 
		cout << "  hbon_flag " << _hbon_flag << endl;
	_cons_param = (string)getline(is);
		cout << "  cons_param '" << _cons_param << "'" << endl;
	is >> _cons_flag;
	getline(is); 
		cout << "  cons_flag " << _cons_flag << endl;
	_upda_param = (string)getline(is);
		cout << "  upda param '" << _upda_param << "'" << endl;
	_hbon_param = (string)getline(is);
		cout << "  hbon param '" << _hbon_param << "'" << endl;
	_skip_mini_param = (string)getline(is);
		cout << "  skip_mini_param '" << _skip_mini_param << "'" << endl;
	_skip_ener_param = (string)getline(is);
		cout << "  skip_ener_param '" << _skip_ener_param << "'" << endl;
	_surf_param = (string)getline(is);
		cout << "  surf_param '" << _surf_param << "'" << endl;
	is >> _extra_ener_flag;
		cout << "  extra_ener_flag " << _extra_ener_flag << endl;
	is >> _single_coordinates_flag;
		cout << "  single_coordinates_flag " << _single_coordinates_flag << endl;
	is >> _dummy_res_code;
		cout << "  dummy_res_code " << _dummy_res_code << endl;
	is >> _surface_potential_factor;
		cout << "  surface_potential_factor " << _surface_potential_factor << endl;
	is >> _template_bspot_factor;
		cout << "  template_bspot_factor " << _template_bspot_factor << endl;
	getline(is);
	_rms_exclusion = (string)getline(is);
		//cout << "  rms_exclusion '" << _rms_exclusion << "'" << endl;
	return is;
}

CharmmComputations charmm_computations;


//                       class RotamerLib



class RotamerLib {
public:
	RotamerLib();
	void readDunbrack(string filename);
	void readTuffery(string filename);
	void addRotamerVariants(float delta_angle, int number, int level);
	static void scanDunbrackDependendLine(const char* line,
			Rotamer& rotamer, int rotamer_id);
	const list<Rotamer>& allRotamersByCode(char code) const;
	void computeFreeASA(const string& segid);
	float freeASAByCode(char code) const;
	friend ostream& operator<<(ostream& os, const RotamerLib& rotamer_lib);
private:
	void readLib(string filename);
	void (*_get_chis_fct)(istream& is, int count, vector<float>& chis, float& probability);
	static void getDunbrackChis(istream& is, int count, vector<float>& chis, float& probability);
	static void getTufferyChis(istream& is, int count, vector<float>& chis, float& probability);
	map< char, list<Rotamer>, less<char> > _code_rotamers;
	map< char, float, less<char> > _code_asa;
};

RotamerLib::RotamerLib() {
}

void RotamerLib::readDunbrack(string filename) {
	_get_chis_fct = getDunbrackChis;
	readLib(filename);
}

void RotamerLib::readTuffery(string filename) {
	_get_chis_fct = getTufferyChis;
	readLib(filename);
}

void RotamerLib::readLib(string filename) {
	ifstream infile(filename.c_str());
	if (!infile) {
		exitError("no infile " + filename + ", exiting!");
	}
	vector<float> chis(6);
	float probability;
	string res_name;
	char res_code;
	int id_count = 0;
	while (infile >> res_name)
		if (res_code = resCode(res_name)) {
			_code_rotamers[res_code].push_back(Rotamer(id_count++,res_code));
			if (res_code != 'A' && res_code != 'G') {
				(*_get_chis_fct)(infile,sizeChis(res_code),chis,probability);
				_code_rotamers[res_code].back().addDihedrals(res_code,chis);
				_code_rotamers[res_code].back().setProbability(probability);
			}
		}

		// normalize probabilities
	map< char, list<Rotamer>, less<char> >::iterator it_code_rotamers;
	list<Rotamer>::iterator it_rotamer;
	for (it_code_rotamers = _code_rotamers.begin();
			it_code_rotamers != _code_rotamers.end();
			it_code_rotamers++) {
		float sum_probabilities = 0;
		for (it_rotamer = (*it_code_rotamers).second.begin();
				it_rotamer != (*it_code_rotamers).second.end();
				it_rotamer++)
			sum_probabilities += (*it_rotamer).probability();
		for (it_rotamer = (*it_code_rotamers).second.begin();
				it_rotamer != (*it_code_rotamers).second.end();
				it_rotamer++)
			(*it_rotamer).setProbability((*it_rotamer).probability()/sum_probabilities);
	}
}

void RotamerLib::getDunbrackChis(istream& is, int count, vector<float>& chis, float& probability) {
	int di;
	float df;
	is >> di >> di >> di >> di >> di >> di;    // 6 dummy integer
	is >> probability;
	is >> df >> df >> df;    // 3 dummy floats
	for (int i = 0; i < count; ++i)
		is >> chis[i] >> df;    // alternating with dummy float
}

void RotamerLib::getTufferyChis(istream& is, int count, vector<float>& chis, float& probability) {
	int di;
	probability = 1;
	is >> di; // 1 dummy integer
	for (int i = 0; i < count; ++i)
		is >> chis[i];
}

void RotamerLib::addRotamerVariants(float delta_angle, int number, int level) {
	float angle;
	map< char, list<Rotamer>, less<char> >::iterator it_code_lst;
	list<Rotamer> new_lst_rotamer;
	list<Rotamer>::const_iterator it_rotamer;
	for (it_code_lst = _code_rotamers.begin();
			it_code_lst != _code_rotamers.end(); ++it_code_lst) {
		char res_code = (*it_code_lst).first;
		if (res_code!='A' && res_code != 'G'){
			list<Rotamer>& lst_rotamer = (*it_code_lst).second;
			for (it_rotamer = lst_rotamer.begin();
					it_rotamer != lst_rotamer.end();
					++it_rotamer) {
				angle = delta_angle;
				for (int i = 0; i < number; ++i) {
					new_lst_rotamer.push_back(*it_rotamer);
					new_lst_rotamer.back().addToDihedralLevels(angle,level);
					new_lst_rotamer.push_back(*it_rotamer);
					new_lst_rotamer.back().addToDihedralLevels(-angle,level);
					angle += delta_angle;
				}
			}
			cout<<res_code<<" before: "<<lst_rotamer.size();
			lst_rotamer.splice(lst_rotamer.end(),new_lst_rotamer);
			cout<<"  after: "<<lst_rotamer.size()<<endl;
		}
	}
}	

const list<Rotamer>& RotamerLib::allRotamersByCode(char code) const {
	map<char, list<Rotamer>, less<char> >::const_iterator
			it_code_list = _code_rotamers.find(code);
	if (it_code_list == _code_rotamers.end())
		exitError(string("amino acid not in library '") + code + "'");
	return (*it_code_list).second;
}

float RotamerLib::freeASAByCode(char code) const {
	map<char, float, less<char> >::const_iterator
			it_code = _code_asa.find(code);
	if (it_code == _code_asa.end())
		exitError(string("amino acid not in library ") + code);
	return (*it_code).second;
}

void RotamerLib::computeFreeASA(const string& segid) {
	map< char, list<Rotamer>, less<char> >::iterator it_code;
	list<Rotamer>::iterator it_rotamer;
	float max_asa;
	float asa;
	for (it_code = _code_rotamers.begin();
			it_code != _code_rotamers.end(); ++it_code) {
		max_asa = -1e+100;
		for (it_rotamer = (*it_code).second.begin();
				it_rotamer != (*it_code).second.end(); ++it_rotamer)
			asa = (*it_rotamer).setASA(
					charmm_computations.freeASA(*it_rotamer,segid));
			if (asa > max_asa)
				max_asa = asa;
		//_code_asa[(*it_code).first] = sum_asa / (*it_code).second.size();
		_code_asa[(*it_code).first] = max_asa;
		cout << "max for " << (*it_code).first
				<< " " << _code_asa[(*it_code).first] << endl;
	}
}

ostream& operator<<(ostream& os, const RotamerLib& rotamer_lib) {
	map< char, list<Rotamer>, less<char> >::const_iterator itrlb;
	for (itrlb = rotamer_lib._code_rotamers.begin();
			itrlb != rotamer_lib._code_rotamers.end(); ++itrlb)
		copy((*itrlb).second.begin(),(*itrlb).second.end(),
				ostream_iterator<Rotamer>(os,"\n"));
	return os;
}


class RefEnergy {
public:
	RefEnergy();
	istream& fill(istream& is);
	istream& fillWithFactor(istream& is, float factor);
	float operator[](char res_code) const;
private:
	map< char, float, less<char> > _code_energies;
};

RefEnergy::RefEnergy() {
}

istream& RefEnergy::fill(istream& is) {
	char res_code;
	float energy;
	while(is >> res_code) {
		is >> energy;
		_code_energies[res_code] = -energy;
	}
	return is;
}

istream& RefEnergy::fillWithFactor(istream& is, float factor) {
	char res_code;
	float energy;
	while(is >> res_code) {
		is >> energy;
		_code_energies[res_code] = -energy*factor;
	}
	return is;
}

float RefEnergy::operator[](char res_code) const {
		// that operator[]() const is not implemented is a pain
		// in the neck:
	map< char, float, less<char> >::const_iterator it_code;
	if ((it_code = _code_energies.find(res_code)) == _code_energies.end())
		exitError("RefEnergy: residue code not in table");
	return (*it_code).second;
}




//                    class ResPosition


class ResPosition {
public:
	ResPosition();
	ResPosition(string segid, int number);
	void addCode(char res_code);
	void addRotamers(const RotamerLib& rotamer_lib);
	void addSingleRotamer(char res_code,
			int rotamer_id, vector<float> chis, float probability);
	void sortRotamers();
	int patchPosition();
	int computeEnergies(int single_dihedrals_flag,
			int single_repatch_flag,
			int eef1_flag,
			int surface_potential_flag,
			int surface_isolated_flag,
			int add_surface_potential_flag, float template_aspot);
	// this is the all_atoms version: 31102000
	int computeEnergies(int single_dihedrals_flag,
			int single_repatch_flag, int surface_potential_flag,
			int surface_isolated_flag,
			int add_surface_potential_flag, float template_aspot);
	void addMinRefEnergy(float factor);
	float phi() const;
	float psi() const;
	void setFilledFlag(int flag);
	bool isFilled();
	int removeAboveMinEnergy(float delta);
	void selectFromAngleTable(
			list< vector<float> >& angle_diffs, int size, float allowed_dev,
			const vector<float>& angle_weights);
	void ResPosition::removeButClosest(int size, float allowed_dev,
			const vector<float>& angle_weights, int print_flag);
	void setSingleEnergy(float energy);
	int computeMinMax();
	void removeRotamer(int rotamer_id);
	void removeDeadRotamers(const int* dead_single, int& nr_rotamer);
	int addEntropy(float entropy_factor);
	void addRefEnergy(const RefEnergy& ref_energy);
	void addRefSolvation(const RefEnergy& ref_energy);
	const list<char>& resCodes() const;
	const list<Rotamer>& rotamers() const;
	list<Rotamer>& rotamersVar();
	int sizeRotamers() const;
	float minEnergy() const;
	float maxEnergy() const;
	int number() const;
	const string& segid() const;
	istream& readDump(istream& is, int index);
	ostream& printAminoAcids(ostream& os);
	ostream& printReferenceEnergies(ostream& os, int nb_phi, int nb_psi, 
			float T, int ramachandran);
	friend ostream& operator<<(ostream& os, const ResPosition& res_position);
		// GNU is unable to instantiate
		// list<Rotamer>::operator=(list<Rotamer> const &)'
		// in default operator=()
	ResPosition& operator=(const ResPosition& res_position) {
		_segid = res_position._segid;
		_number = res_position._number;
		_rotamers = res_position._rotamers;
		_res_codes = res_position._res_codes;
		_min_energy = res_position._min_energy;
		_max_energy = res_position._max_energy;
		_filled_flag = res_position._filled_flag;
		return (*this);
	};
private:
	string _segid;
	int _number;
	list<Rotamer> _rotamers;
	list<char> _res_codes;
	float _min_energy, _max_energy;
	int _filled_flag;
};

ResPosition::ResPosition()
		: _segid("XXX"), _number(0), _filled_flag(0) {
}

ResPosition::ResPosition(string segid, int number)
		: _segid(segid), _number(number),
		_max_energy(-1E+100), _min_energy(1E+100), _filled_flag(0) {
}

void ResPosition::addCode(char res_code) {
	_res_codes.push_front(res_code);
}

void ResPosition::setFilledFlag(int flag) {
	_filled_flag = flag;
}

bool ResPosition::isFilled() {
	return _filled_flag != 0;
}

void ResPosition::addRotamers(const RotamerLib& rotamer_lib) {
	list<char>::const_iterator it_res_code;
	for (it_res_code = _res_codes.begin();
			it_res_code != _res_codes.end(); ++it_res_code) {
		//cout << "add rotamers for '" << *it_res_code << "'" << endl;
		const list<Rotamer>& rotamers = 
				rotamer_lib.allRotamersByCode(*it_res_code);
		copy(rotamers.begin(),rotamers.end(),back_inserter(_rotamers));
	}
}

void ResPosition::addSingleRotamer(char res_code,
		int rotamer_id, vector<float> chis, float probability) {
	_rotamers.push_back(Rotamer(rotamer_id,res_code,probability));
	_rotamers.back().addDihedrals(res_code,chis);
}

int ResPosition::addEntropy(float entropy_factor) {
	list<Rotamer>::iterator it_rotamer;
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end(); ++it_rotamer) {
		(*it_rotamer).addEnergy(
				- entropy_factor*log((*it_rotamer).probability()));
		cout << "prob " << (*it_rotamer).probability();
		cout << " energy " << (*it_rotamer).energy()
				<< " " << (*it_rotamer).energy()
				- entropy_factor*log((*it_rotamer).probability()) << endl;
	}
	return DUMMY_RETURN;
}

void ResPosition::addRefEnergy(const RefEnergy& ref_energy) {
	list<Rotamer>::iterator it_rotamer;
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end(); ++it_rotamer)
		(*it_rotamer).addEnergy(ref_energy[(*it_rotamer).resCode()]);
}

void ResPosition::addRefSolvation(const RefEnergy& ref_energy) {
	list<Rotamer>::iterator it_rotamer;
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end(); ++it_rotamer)
		(*it_rotamer).addASPot(ref_energy[(*it_rotamer).resCode()]);
}

void ResPosition::sortRotamers() {
	_rotamers.sort();
}

class RotamerIdEq {
	int _id;
public:
	RotamerIdEq(int id) : _id(id) {
	}
	bool operator()(const Rotamer& rotamer) const {
		return rotamer.id() == _id;
	}
};

void ResPosition::removeRotamer(int rotamer_id) {
	_rotamers.erase(find_if(_rotamers.begin(),_rotamers.end(),
			RotamerIdEq(rotamer_id)));
}

void ResPosition::removeDeadRotamers(const int* dead_single, int& nr_rotamer) {
	list<Rotamer>::iterator it_rotamer;
	list<list<Rotamer>::iterator> dead_list;

	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end();
			++it_rotamer, ++nr_rotamer)
		if (dead_single[nr_rotamer]) {
			//cout << "put to list nr_rotamer " << nr_rotamer << endl;
			dead_list.push_back(it_rotamer);
		}

	list<list<Rotamer>::iterator>::const_iterator it_list;
	for (it_list = dead_list.begin();
			it_list != dead_list.end();
			++it_list)  {
		//cout << " removing dead " << *(*it_list) << endl;
		_rotamers.erase(*it_list);
	}
}

int ResPosition::patchPosition() {
	charmm_computations.patchDummyResidue(_number,_segid);
	return DUMMY_RETURN;
}

int ResPosition::computeEnergies(int single_dihedrals_flag,
		int single_repatch_flag,
		int eef1_flag,
		int surface_potential_flag,
		int surface_isolated_flag,
		int add_surface_potential_flag, float template_aspot) {
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: computeEnergies"<<endl;
	#endif
	#ifdef NOE
	float  rotamer_elec_energy,rotamer_vdw_energy,rotamer_noe_energy;
	#endif
	float rotamer_energy;
	list<Rotamer>::iterator it_rotamer;
	vector<float> dihedral_angles;
	vector<float> coordinates;
	char res_code;
	charmm_computations.selectComplementJResidue(_number,_segid);
	res_code = '@';
	charmm_computations.patchDummyResidue(_number,_segid); // why ?
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end(); ++it_rotamer) {
		if (res_code != (*it_rotamer).resCode()) {
			res_code = (*it_rotamer).resCode();
			charmm_computations.patchResidue(res_code,_number,_segid);
			charmm_computations.selectIResidue(_number,_segid);
			charmm_computations.selectComplementJResidue(_number,_segid);
			// 05022003 the following is only executed if _ener_selection_flag==true:
			// (we don't waste any time compared with the patch)
			charmm_computations.selectEnerSelection();
		}
	      #ifdef NOE
		//cout<<"DEBUGGING: writing pdb after repatch actual residue"<<endl;
		//charmm_computations.writePDB("alxse.pdb");
		//exitError("STOP after writing alxse.pdb");
		//charmm_computations.setNOErestraints();
		#ifdef NOEDEBUG
		cout<<"DEBUGGING: Total NOE restraints="<<NOEres.number()<<" : "<<endl;
		NOEres.printRestraints(NOEres.getRestraints());
		cout<<"DEBUGGING: computeSingleEnergies: re-loading NOE restraints for residue "<<_number<<" segment "<<_segid<<endl;
		NOEres.printRestraints(NOEres.getRestraintsSingle(_number));
		#endif
		if(cm_print_cmd)cout<<"NOE: Reset"<<endl;
		Noe("RESET");
		Noe("SCALE "+ToString(NOEres.getScale()));
		Noe(NOEres.getRestraintsSingle(_number));
	      #endif
		if (charmm_computations.miniFlag()) {
			rotamer_energy = charmm_computations.minimizeSingleRotamer(
					*it_rotamer,_number,_segid);  // it only needs _islct,_jslct if _no_self_flag = 1
			#ifdef NOE
			rotamer_elec_energy=charmm_computations.lastElecEnergy();
			rotamer_vdw_energy=charmm_computations.lastVdwEnergy();
			rotamer_noe_energy=charmm_computations.lastNOEEnergy();
			#ifdef NOEDEBUGFULL
			cout<<"DEBUGGING: rotamer_noe_energy="<<rotamer_noe_energy
				<<" rotamer_vdw_energy="<<rotamer_vdw_energy
				<<" rotamer_elec_energy="<<rotamer_elec_energy
				<<endl;
			#endif
			(*it_rotamer).setNOEEnergy(rotamer_noe_energy);
			(*it_rotamer).setVdwEnergy(rotamer_vdw_energy);
			(*it_rotamer).setElecEnergy(rotamer_elec_energy);
			#endif
			//if (charmm_computations.singleCoordinatesFlag()) {
				charmm_computations.getIniICoordinates(_segid,_number,
						(*it_rotamer).coordinatesRef());
			//}
			charmm_computations.setSingleCoordinatesFlag(1);
			if (single_dihedrals_flag
					|| charmm_computations.singleCoordinatesFlag()) {
				charmm_computations.icFill();
				charmm_computations.getRotamerDihedrals(_segid,_number,
						(*it_rotamer),dihedral_angles);
				(*it_rotamer).setDihedralAngles(dihedral_angles);
			}
			//if (single_repatch_flag) {
			//	charmm_computations.patchDummyResidue(_number,_segid);
			//	charmm_computations.patchResidue(res_code,_number,_segid);
			//	rotamer_energy = charmm_computations.energySingleRotamer(
			//			*it_rotamer,_number,_segid);
			//}
			#ifdef NOE
			//_last_noe_energy = ener_.eterm[noe];
			//(*it_rotamer).setNOEEnergy();
			#endif
			/*
			#ifdef NOEPRN
			//cout<<" _user_energy="<<(*it_rotamer).userEnergy()<<endl;
			cout<<"NOE: SingleEnergy: pos= "<<_number<<
				" rot_idx="<<(*it_rotamer).index()<< \
				" rot_prob="<<(*it_rotamer).probability()<< \
				" rot_noe= "<<(*it_rotamer).NOEEnergy()<< \
				" rotamer_energy= "<<rotamer_energy<<endl;
			#endif
			*/
			(*it_rotamer).setEnergy(rotamer_energy);
		}
		else {
			rotamer_energy = charmm_computations.energySingleRotamer(
					*it_rotamer,_number,_segid);
			#ifdef NOE
			rotamer_elec_energy=charmm_computations.lastElecEnergy();
			rotamer_vdw_energy=charmm_computations.lastVdwEnergy();
			rotamer_noe_energy=charmm_computations.lastNOEEnergy();
			(*it_rotamer).setNOEEnergy(rotamer_noe_energy);
			(*it_rotamer).setVdwEnergy(rotamer_vdw_energy);
			(*it_rotamer).setElecEnergy(rotamer_elec_energy);
			#endif
			/*
			#ifdef NOEPRN
			//cout<<" _user_energy="<<(*it_rotamer).userEnergy()<<endl;
			cout<<"NOE: SingleEnergy: pos= "<<_number<<
				" rot_idx="<<(*it_rotamer).index()<< \
				" rot_prob="<<(*it_rotamer).probability()<< \
				" rot_noe= "<<(*it_rotamer).NOEEnergy()<< \
				" rotamer_energy= "<<rotamer_energy<<endl;
			#endif
			*/
			(*it_rotamer).setEnergy(rotamer_energy);
		}
		//#ifdef NOEDEBUG
		#ifdef NOEPRN
		//cout<<" _user_energy="<<(*it_rotamer).userEnergy()<<endl;
		cout<<"NOE: SingleEnergy: pos= "<<_number<<
			" rot_idx="<<(*it_rotamer).index()<< \
			" rot_prob="<<(*it_rotamer).probability()<< \
			" rot_noe= "<<(*it_rotamer).NOEEnergy()<< \
			" rotamer_energy= "<<rotamer_energy<<endl;
		#endif

		if (eef1_flag) {
			charmm_computations.unfix();
			charmm_computations.eef1Energy();
			float rotamer_aspot = charmm_computations.eef1FromISelect();
			(*it_rotamer).setASPot(rotamer_aspot);
			float rotamer_template_aspot =
					charmm_computations.eef1FromAll();
			//cout << "ta " << template_aspot
			//		<< " rta " << rotamer_template_aspot
			//		<< " ra " << rotamer_aspot << endl;
			(*it_rotamer).setTemplateBSPot(template_aspot
					- (rotamer_template_aspot - rotamer_aspot) );
			if (add_surface_potential_flag)
				(*it_rotamer).addASPotToEnergy();
		}
		else if (surface_potential_flag) {
//		if (surface_potential_flag) {
			pair<float,float> rotamer_aspot = 
					charmm_computations.aspotSingleRotamer(
					*it_rotamer,_number,_segid);
			#ifdef NOEDEBUGFULL
			cout<<"DEBUGGING: aspotSingleRotamer: rescode="<<res_code<<" aspot1="<< \
				rotamer_aspot.first<<" aspot2="<<rotamer_aspot.second<<endl;
			#endif
			(*it_rotamer).setASPot(rotamer_aspot.first);
			(*it_rotamer).setASPRatio(rotamer_aspot.second);
			float rotamer_template_bspot =
					charmm_computations.templateBSPotFactor() *
					charmm_computations.bspotSingleRotamer(
							*it_rotamer,_number,_segid,rotamer_aspot.first,template_aspot); 
			(*it_rotamer).setTemplateBSPot(rotamer_template_bspot);
			if (surface_isolated_flag) {
				pair<float,float> rotamer_aspot =
						charmm_computations.aspotSingleRotamerIsolated(
						*it_rotamer,_number,_segid );
				(*it_rotamer).setASPotIsolated(rotamer_aspot.second);
				// the following line is incompatible with "compute_free_lib_asa"
				(*it_rotamer).setASA(rotamer_aspot.second);  // 05012001  we store _aspot_isolated in _asa for the dump file
				(*it_rotamer).divideASPRatio(rotamer_aspot.second);
			}
			if (add_surface_potential_flag)
				(*it_rotamer).addASPotToEnergy();
		} else if (charmm_computations.SolvFlag()) {
			float rotamer_template_aspot = charmm_computations.SolvEnergy();
			// notice that rotamer_aspot already contains minus bspot (bspot = template_aspot - rotamer_template_aspot + rotamer_aspot)
			float rotamer_aspot = rotamer_template_aspot - template_aspot;
			(*it_rotamer).setASPot(rotamer_aspot);
			// therefore we set bspot to zero
			(*it_rotamer).setTemplateBSPot( 0.0 );
			if (add_surface_potential_flag)
				(*it_rotamer).addASPotToEnergy();
		}
		//exitError("STOP after calculatin energy rot & aspot");
	}
	charmm_computations.patchDummyResidue(_number,_segid);
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: computeEnergies pos="<<_number<<"...FIN"<<endl;
	//exitError("STOP after calculatin energies");
	#endif
	return DUMMY_RETURN;
}

int ResPosition::computeEnergies(int single_dihedrals_flag,
		int single_repatch_flag, int surface_potential_flag,
		int surface_isolated_flag,
		int add_surface_potential_flag, float template_aspot) {
	int eef1_flag = 0;
	return computeEnergies(single_dihedrals_flag,
			single_repatch_flag,
			eef1_flag,
			surface_potential_flag,
			surface_isolated_flag,
			add_surface_potential_flag,
			template_aspot);
}


int ResPosition::computeMinMax() {
	float energy;
	_min_energy = 1E+100;
	_max_energy = -1E+100;
	list<Rotamer>::iterator it_rotamer;	
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end(); ++it_rotamer) {
		energy = (*it_rotamer).energy();
		if (energy < _min_energy)
			_min_energy = energy;
		if (energy > _max_energy)
			_max_energy = energy;
	}
	return DUMMY_RETURN;
}

float ResPosition::phi() const {
	float angle = charmm_computations.getPhiDihedral(_segid,_number);
	return angle != charmm_computations.invalidAngle() ?
			angle : charmm_computations.defaultPhi();
}

float ResPosition::psi() const {
	float angle = charmm_computations.getPsiDihedral(_segid,_number);
	return angle != charmm_computations.invalidAngle() ?
			angle : charmm_computations.defaultPsi();
}

//int ResPosition::removeAboveMinEnergy(float delta) {
//	list<Rotamer>::iterator it_rotamer = _rotamers.begin();
//	while (it_rotamer != _rotamers.end())
//		if ((*it_rotamer).energy() > _min_energy+delta)
//			_rotamers.erase(it_rotamer++);
//		else
//			it_rotamer++;
//	return DUMMY_RETURN;
//}

int ResPosition::removeAboveMinEnergy(float delta) {
	list<list<Rotamer>::iterator> list_it;
	list<Rotamer>::iterator it_rotamer = _rotamers.begin();
	computeMinMax();
	for (; it_rotamer != _rotamers.end(); ++it_rotamer)
		if ((*it_rotamer).energy() > _min_energy+delta)
			list_it.push_back(it_rotamer);
	list<list<Rotamer>::iterator>::const_iterator
			it_list = list_it.begin();
	for (; it_list != list_it.end(); ++it_list)
		_rotamers.erase(*it_list);
	return DUMMY_RETURN;
}

void ResPosition::selectFromAngleTable(
		list< vector<float> >& angle_diffs, int size, float allowed_dev,
		const vector<float>& angle_weights) {

		// first selection round: get rid of rotamers with chi1, chi2, ...
		// not in the allowed_dev range
	list<Rotamer>::iterator it_rotamer, it_rotamer1;
	list< vector<float> >::iterator it_angle_diffs, it_angle_diffs1;
	int count;
	for (int chi_level = 0; chi_level < angle_diffs.front().size(); ++chi_level) {
		count = 0;
			// how many angle diffs at this chi_level are within the range:
		for (it_rotamer = _rotamers.begin(),
				it_angle_diffs = angle_diffs.begin();
				it_rotamer != _rotamers.end();
				++it_rotamer, ++it_angle_diffs)
			if ((*it_angle_diffs)[chi_level] <= allowed_dev)
				count++;
		//cout << "level " << chi_level << " within range " << count << endl;
		if (count > 0) {
				// OK there are still some at this chi_level
				// let's get rid of those outside the range
			it_rotamer = _rotamers.begin();
			it_angle_diffs = angle_diffs.begin();
			while (it_rotamer != _rotamers.end())
				if ((*it_angle_diffs)[chi_level] > allowed_dev) {
					(it_rotamer1 = it_rotamer)++;
					(it_angle_diffs1 = it_angle_diffs)++;
					//cout << "removing " << endl;
					//cout << *it_rotamer << endl;
					_rotamers.erase(it_rotamer);
					angle_diffs.erase(it_angle_diffs);
					it_rotamer = it_rotamer1;
					it_angle_diffs = it_angle_diffs1;
				}
				else {
					it_rotamer++; it_angle_diffs++;
				}
		}
		else  // not enough rotamers left exit first selection round
			break;
	}

	if (_rotamers.size() > size) {
		//cout << " we have to remove from " << _rotamers.size() << endl;
			// too many passed the range test
			// second selection round: the weighted angle sum is used
			// to select the 'size' closest rotamers
			// algorithm a bit inefficient but OK for small lists:
		float weighted_sum;
		for (count = _rotamers.size() - size; count--; ) {
			float max_weighted_sum = -1e25;
			for (it_rotamer = _rotamers.begin(),
					it_angle_diffs = angle_diffs.begin();
					it_rotamer != _rotamers.end();
					++it_rotamer, ++it_angle_diffs) {
				weighted_sum = inner_product(
						(*it_angle_diffs).begin(),(*it_angle_diffs).end(),
						angle_weights.begin(),0);
				if (weighted_sum > max_weighted_sum) {
					max_weighted_sum = weighted_sum;
					it_rotamer1 = it_rotamer;
					it_angle_diffs1 = it_angle_diffs;
				}
			}
				// remove maximum
			//cout << "size removing " << endl;
			//cout << *it_rotamer1 << endl;
			_rotamers.erase(it_rotamer1);
			angle_diffs.erase(it_angle_diffs1);
		}
	}
}

void ResPosition::removeButClosest(int size, float allowed_dev,
		const vector<float>& angle_weights, int print_flag) {
	char res_code = _rotamers.front().resCode();
	vector<float> dihedral_angles;
	list< vector<float> > angle_diffs;

	list<Rotamer>::iterator it_rotamer;
	list<Dihedral>::const_iterator it_dihedral;
	charmm_computations.getRotamerDihedrals(_segid,
			_number,_rotamers.front(),dihedral_angles);
	if (print_flag) {
		cout << "dihedral for " << _segid << " " << _number << " " <<
					res_code << endl;
		copy(dihedral_angles.begin(),dihedral_angles.end(),
					ostream_iterator<float>(cout," "));
		cout << endl;
	}
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end(); ++it_rotamer) {
		if (res_code != (*it_rotamer).resCode())
			exitError("removeButClosest: only one residue type allowed");
		angle_diffs.push_back(vector<float>());
		vector<float>& rotamer_angles = angle_diffs.back();
		int i = 0;
		for (it_dihedral = (*it_rotamer).dihedrals().begin();
				it_dihedral != (*it_rotamer).dihedrals().end();
				++it_dihedral) {
			rotamer_angles.push_back(
					(*it_dihedral).angle() - dihedral_angles[i++] );
		}
		if (print_flag) cout << (*it_rotamer) << " ";
		charmm_computations.symmetryCorrectAngleVector(
				*it_rotamer,rotamer_angles );
		for (i = 0; i < rotamer_angles.size(); ++i) {
			rotamer_angles[i] = fabs(rotamer_angles[i]);
			if (rotamer_angles[i] > 180.0)
				rotamer_angles[i] = 360.0 - rotamer_angles[i];
		}
		if (print_flag) {
			cout << " abs ";
			copy(rotamer_angles.begin(),rotamer_angles.end(),
					ostream_iterator<float>(cout," "));
			cout << endl;
		}
	}

	selectFromAngleTable(angle_diffs,size,allowed_dev,angle_weights);
}


void ResPosition::setSingleEnergy(float energy) {
	list<Rotamer>::iterator it_rotamer;
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end(); ++it_rotamer){
		(*it_rotamer).setEnergy(energy);
			if (energy == 0){
				// When we use 'set_single_energy_to 0' we mean to reset everything (needed by threadCombinations)
				(*it_rotamer).setASPot(0);
				(*it_rotamer).setTemplateBSPot(0);
			}
		}
	//for_each(_rotamers.begin(),_rotamers.end(),
	//		my_bind2nd(my_mem_fun1_ref(&Rotamer::setEnergy),energy) );
}

const list<char>& ResPosition::resCodes() const {
	return _res_codes;
}

const list<Rotamer>& ResPosition::rotamers() const {
	return _rotamers;
}

list<Rotamer>& ResPosition::rotamersVar() {
	return _rotamers;
}

int ResPosition::sizeRotamers() const {
	return _rotamers.size();
}

int ResPosition::number() const {
	return _number;
}

const string& ResPosition::segid() const {
	return _segid;
}

istream& ResPosition::readDump(istream& is, int index) {
	is >> _number;
	is >> _segid;
	_rotamers.erase(_rotamers.begin(),_rotamers.end());
	int size;
	is >> size;
	for (int i = 0; i < size; ++i) {
		_rotamers.push_back(Rotamer());
		_rotamers.back().readDump(is);
		_rotamers.back().setIndex(index);
		++index;
	}
	computeMinMax();	
	return is;
}

typedef pair<char, vector<float> > ResEnergy;
struct ResEnergyLess
		: public binary_function<ResEnergy,ResEnergy,bool> {
	bool operator()(const ResEnergy& a, const ResEnergy& b) const {
		return a.second[0] < b.second[0];
	}
};

void ResPosition::addMinRefEnergy(float factor) {
	list<Rotamer>::iterator it_rotamer;
	map<char,float> min_energy;
	char res_code = '@';
	vector<ResEnergy> res_energy;
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end();
			++it_rotamer) {
		if (res_code != (*it_rotamer).resCode()) {
			res_energy.push_back(pair< char, vector<float> >(
					(*it_rotamer).resCode(),vector<float>() ));
			res_code = (*it_rotamer).resCode();
		}
		res_energy.back().second.push_back((*it_rotamer).energy());
	}
	vector<ResEnergy>::iterator it_res_energy;
	for (it_res_energy = res_energy.begin();
			it_res_energy != res_energy.end();
			++it_res_energy) {
		sort((*it_res_energy).second.begin(),(*it_res_energy).second.end());
	}
	sort(res_energy.begin(),res_energy.end(),ResEnergyLess());
	for (it_res_energy = res_energy.begin();
			it_res_energy != res_energy.end();
			++it_res_energy) {
		min_energy[(*it_res_energy).first] = (*it_res_energy).second[0];
			//	<< "(" << (*it_res_energy).second.size() << ")"
	}
	for (it_rotamer = _rotamers.begin();it_rotamer != _rotamers.end();++it_rotamer)
		(*it_rotamer).addEnergy(-factor*min_energy[(*it_rotamer).resCode()]);
}

ostream& ResPosition::printAminoAcids(ostream& os) {
	list<Rotamer>::iterator it_rotamer;
	char res_code = '@';
	vector<ResEnergy> res_energy;
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end();
			++it_rotamer) {
		if (res_code != (*it_rotamer).resCode()) {
			res_energy.push_back(pair< char, vector<float> >(
					(*it_rotamer).resCode(),vector<float>() ));
			res_code = (*it_rotamer).resCode();
		}
		res_energy.back().second.push_back((*it_rotamer).energy());
	}
	vector<ResEnergy>::iterator it_res_energy;
	for (it_res_energy = res_energy.begin();
			it_res_energy != res_energy.end();
			++it_res_energy) {
		sort((*it_res_energy).second.begin(),(*it_res_energy).second.end());
	}
	sort(res_energy.begin(),res_energy.end(),ResEnergyLess());
	for (it_res_energy = res_energy.begin();
			it_res_energy != res_energy.end();
			++it_res_energy) {
		os << " " << (*it_res_energy).first
				<< "(" << (*it_res_energy).second.size() << ")"
				<< " " << (int)((*it_res_energy).second[0]*100)/100.0;
	}
	return os;
}


ostream& ResPosition::printReferenceEnergies(ostream& os,
		int nb_phi, int nb_psi, float T, int ramachandran)  {

	const float R_joules = 8.314510;
	const float joule_kcal = 1/4186.;
	const float R_kcal = R_joules * joule_kcal;

	list<Rotamer>::iterator it_rotamer;

// REMARK : 	first implementation needed dep. Dunbrack library
//		this implementation needs a loop on rotamers and then on phi/psi 
//		so we use the tuffery library ----> BOTH NOT COMPATIBLE

	if ( (nb_phi <= 0) || (nb_psi <= 0) ) {
		float energy, integral_energy, Z;
		float min_enthalpy;
		char res_code = '@';
		for (it_rotamer = _rotamers.begin();
				it_rotamer != _rotamers.end(); ) {
			if (res_code != (*it_rotamer).resCode()) {
				integral_energy = 0.0;
				Z = 0.0;
				min_enthalpy = 1e100;
				res_code = (*it_rotamer).resCode();
			}
			// os << "   " << (*it_rotamer);
			energy = (*it_rotamer).energy();
			integral_energy +=
					energy * exp( -energy / (R_kcal * T) );
			Z += exp( -energy / (R_kcal * T) );
			if ((*it_rotamer).energy() < min_enthalpy)
				min_enthalpy = (*it_rotamer).energy();
	
			++it_rotamer; // lookahead
			if (it_rotamer == _rotamers.end()
					|| res_code != (*it_rotamer).resCode()) {
				if (nb_phi == -1)
					os << res_code << "   " << integral_energy/Z << endl;
				else if (nb_phi == -2)
					os << res_code << "   " << min_enthalpy << endl;
				else {
					os << res_code
							<< "   H   " << integral_energy/Z
							<< "   M   " << min_enthalpy
							<< endl;
				}
			}
		}
		return os;
	}
	
		// Eref = Emoy - TS = F
		//= sum_i {Ei*pi} - T{ -R sum_i pi ln(pi)}
		//= sum_i {Ei*exp(-Ei/RT)/Z} 
		//	+ RT sum_i pi ln(pi)
		//= -RTln(Z)

		// Emoy	= sum_i {Ei*pi} 
		//= sum_i {Ei*exp(-Ei/RT)/Z}

	int i, j;
	float phi, psi;
	float int_phi = 360.0/nb_phi;
	float int_psi = 360.0/nb_psi;
	cout << "PARAMETER VALUES:" << endl;
	cout << "\t" << "nb_phi,nb_psi: "
			<< nb_phi << " " << nb_psi << endl;
	cout << "\t" << "int_phi,int_psi: "
			<< int_phi << " " << int_psi << endl;
	float energy, integral_energy, Z;

		// rotamer loop
	//vector<float> energies;
	
	vector< vector<float> > res_energies;
	if (ramachandran) {
		res_energies.insert(
				res_energies.begin(),nb_phi,vector<float>());
		for (i = 0; i < nb_phi; ++i)
			res_energies[i].insert(
					res_energies[i].begin(),nb_psi,0.0);
	}

	char res_code = '@';
	list<Rotamer>::iterator it_begin_rotamer,
			it_rotamer2;
	for (it_rotamer = _rotamers.begin();
			it_rotamer != _rotamers.end(); ) {
		if (res_code != (*it_rotamer).resCode()) { // new residue
			it_begin_rotamer = it_rotamer;
			res_code = (*it_rotamer).resCode();
			charmm_computations.patchResidue(res_code,_number,_segid);
			//energies.erase(energies.begin(),energies.end());
			integral_energy = 0.0;
			Z = 0.0;
			cout << resStr(res_code) << endl;
			if (ramachandran)
				for (i = 0; i < nb_phi; i++)
					for (j = 0; j < nb_psi; j++)
						if (ramachandran == 1)
							res_energies[i][j] = 1e+100;
						else
							res_energies[i][j] = 0;
		}
		charmm_computations.setDihedral((*it_rotamer),_number,_segid);
			// phi,psi loop
		float rotamer_energy = 1e+100;
		//float rotamer_energy = 0;
		float rotamer_probability = 0;
		for (i = 0; i < nb_phi; i++) {
			phi = -180 + i*int_phi;
			for (j = 0; j < nb_psi; j++) {
				psi = -180 + j*int_psi;
				charmm_computations.setPhiPsi(phi,psi,
						_number,_segid);
				energy = charmm_computations.energyBuiltRotamer(
						*it_rotamer,_number,_segid);
				
				//energies.push_back(energy);
				Z += exp( -energy / (R_kcal * T) );
				integral_energy += energy * exp( -energy / (R_kcal * T) );
				if (energy < rotamer_energy)
					rotamer_energy = energy;
				//rotamer_energy = energy * exp( -energy / (R_kcal * T) );
				rotamer_probability += exp( -energy / (R_kcal * T) );

				if (ramachandran == 1 && energy < res_energies[i][j])
					res_energies[i][j] = energy;
				if (ramachandran > 1)
					res_energies[i][j] += energy * exp( -energy / (R_kcal * T) );

				//cout << " (" << phi << "," << psi << ") "
				//		<< energy << " sum " << integral_energy << " Z " << Z << endl;
			}
		}
		(*it_rotamer).setEnergy(rotamer_energy);
		(*it_rotamer).setProbability(rotamer_probability);

		++it_rotamer;  // lookahead
		if (it_rotamer == _rotamers.end()
				|| res_code != (*it_rotamer).resCode()) {
			//float enthalpy = 0.0;
			//float prob;
			//for (i = 0; i < energies.size(); ++i) {
			//	prob = exp( - energies[i] / (R_kcal * T) ) / Z;
			//	enthalpy += energies[i] * prob;
			//}
			float prob_entropy = 0;
			for (it_rotamer2 = it_begin_rotamer;
					it_rotamer2 != it_rotamer;
					it_rotamer2++) {
				//(*it_rotamer2).setEnergy((*it_rotamer2).energy()/Z);
				(*it_rotamer2).setProbability((*it_rotamer2).probability()/Z);
				prob_entropy += (*it_rotamer2).probability()*log((*it_rotamer2).probability());
				os << *it_rotamer2;
			}

			float enthalpy = integral_energy/Z;
			float free_energy = -(R_kcal * T) * log(Z);
			os << res_code
					<< "   H   " << enthalpy
					<< "   G   " << free_energy
					<< "   TS   " << enthalpy - free_energy
					<< "   S/R  " << (enthalpy - free_energy) / (R_kcal * T)
					<< "   PS/R  " << prob_entropy / (R_kcal * T)
					<< endl;
			if (ramachandran) {
				ofstream ofs((resStr(res_code) + ".ener").c_str());
				for (i = 0; i < nb_phi; i++)
					for (j = 0; j < nb_psi; j++)
						ofs << -180 + i*int_phi
								<< " " << -180 + j*int_psi
								<< " " << ( ramachandran == 1 ? res_energies[i][j]
										: res_energies[i][j]*nb_phi*nb_psi/Z )
								<< endl;
			}
		}
	// charmm_computations.initPhiPsi(_number,_segid);
	}
	return os;
}

ostream& operator<<(ostream& os, const ResPosition& res_position) {
	os << "Residue position " << res_position._number
		<< " in " << res_position._segid << endl
		<< " min energy " << res_position._min_energy 
		<< " max energy " << res_position._max_energy << endl;
	copy(res_position._rotamers.begin(),res_position._rotamers.end(),
			ostream_iterator<Rotamer>(os,"\n"));
	return os;
}




//             classes RPPElement and  RPPHashTable




class RPPElement {
public:
	RPPElement();
	RPPElement(char res_code, const char* phi_code,
			const char* psi_code, int number);
	bool isEquivalentTo(char res_code, const char* phi_code,
			const char* psi_code) const;
	int number() const;
	friend ostream& operator<<(ostream& os, const RPPElement& rpp_element);
private:
	char _res_code;
	char _phi_code[4];
	char _psi_code[4];
	int _number;
};

RPPElement::RPPElement()
		: _res_code('x'), _number(-1) { }

RPPElement::RPPElement(char res_code, const char* phi_code,
			const char* psi_code, int number) {
	_res_code = res_code;
	_phi_code[0] = phi_code[0]; _phi_code[1] = phi_code[1]; 
	_phi_code[2] = phi_code[2]; _phi_code[3] = 0;
	_psi_code[0] = psi_code[0]; _psi_code[1] = psi_code[1]; 
	_psi_code[2] = psi_code[2]; _psi_code[3] = 0;
	_number = number;
}

bool RPPElement::isEquivalentTo(char res_code, const char* phi_code,
		const char* psi_code) const {
	return _res_code == res_code
			&& _phi_code[0] == phi_code[0] && _phi_code[1] == phi_code[1] 
			&& _phi_code[2] == phi_code[2]
			&& _psi_code[0] == psi_code[0] && _psi_code[1] == psi_code[1]
			&& _psi_code[2] == psi_code[2];
}

int RPPElement::number() const {
	return _number;
}

ostream& operator<<(ostream& os, const RPPElement& rpp_element) {
	return os << rpp_element._res_code
			<< " " << rpp_element._number
			<< " <" << rpp_element._phi_code << "> <"
			<< rpp_element._psi_code << "> ";
}



class RPPHashTable {
public:
	RPPHashTable(int size);
	void insertResCodes(const list<char>& res_codes,
			float phi, float psi, int number);
	int findEntry(const char* line) const;
	bool isEntryEmpty(int entry) const;
	void allPositions(int entry, const char* line,
			list<int>& positions) const;
	friend ostream& operator<<(ostream& os,
			const RPPHashTable& rpp_hash_table);
private:
	int hash(char code, const char* num1, const char* num2) const;
	long _size;
	vector< list<RPPElement> > _table;
};

RPPHashTable::RPPHashTable(int size)
		: _size(size) {
	_table.insert(_table.begin(),(size_t)_size,list<RPPElement>());
}

inline int RPPHashTable::hash(char code,
		const char* num1, const char* num2) const {
	long ret = 
			(((((((((((code << 3)
			^ *(num1++)) << 3) ^ *(num1++)) << 3) ^ *num1) << 3)
			^ *(num2++)) << 3) ^ *(num2++)) << 3) ^ *num2;
	return (int) ((ret >= 0 ? ret : -ret) % _size);
}

void RPPHashTable::insertResCodes(const list<char>& res_codes,
		float phi, float psi, int number) {
	char sphi[20], spsi[20];
	int iphi, ipsi;
	iphi = (int)rint(phi/10.0);
	ipsi = (int)rint(psi/10.0);
	iphi == 0 ? sprintf(sphi,"   ") : sprintf(sphi,"%3d",iphi);
	ipsi == 0 ? sprintf(spsi,"   ") : sprintf(spsi,"%3d",ipsi);
	list<char>::const_iterator it_res_code;
	for (it_res_code = res_codes.begin();
			it_res_code != res_codes.end(); ++it_res_code) {
		_table[hash(*it_res_code,sphi,spsi)].push_back(
				RPPElement(*it_res_code,sphi,spsi,number));
	}
}

inline int RPPHashTable::findEntry(const char* line) const {
	return hash(*line,line+2,line+7);
}

inline bool RPPHashTable::isEntryEmpty(int entry) const {
	return _table[entry].begin() == _table[entry].end();
}

void RPPHashTable::allPositions(int entry, const char* line,
		list<int>& positions) const {
	positions.erase(positions.begin(),positions.end());
	list<RPPElement>::const_iterator it_rpp,
			it_rpp_fin = _table[entry].end();
	for (it_rpp = _table[entry].begin();
			it_rpp != it_rpp_fin; ++it_rpp) {
		if ((*it_rpp).isEquivalentTo(*line,line+2,line+7))
			positions.push_back((*it_rpp).number());
	}
}

ostream& operator<<(ostream& os,
			const RPPHashTable& rpp_hash_table) {
	for (int i = 0; i < rpp_hash_table._size; ++i)
		if (rpp_hash_table._table[i].begin()
				!= rpp_hash_table._table[i].end()) {
			os << "entry " << i << ": ";
			copy(rpp_hash_table._table[i].begin(),
					rpp_hash_table._table[i].end(),
					ostream_iterator<RPPElement>(os," "));
			os << endl;
		}
	return os;
}


//                     class AllPositions

class RemoteMachines {
public:
	RemoteMachines();
	void readMachines(istream& is);
	void readScript(istream& is);
	void startProcesses(int begin_process, int end_process);
	int size() const;
//private: //changed for RemoteMachinesAlf (11052001)
protected:
	vector<string> _machines;
	vector<string> _machines_charmmb_path;
	string _working_directory;
	string _script_template_prefix;
	string _script_template_postfix;
	void writeScript(int process, int size_processes);
};

RemoteMachines::RemoteMachines() {
}

void RemoteMachines::readMachines(istream& is) {
	//istream& is = open_istream(file_name);
	is >> _working_directory;
	string istring;
	while (1) {
		is >> istring;
		if (!is || istring == "stop") break;
		_machines.push_back(istring);
		is >> istring;
		_machines_charmmb_path.push_back(istring);
		cout << " got " << _machines.back() << endl; 		
	}
	close_istream();
}

void RemoteMachines::readScript(istream& is) {
	char c;
	_script_template_prefix = "";
	while (is.get(c) && c != '&')
		_script_template_prefix += c;
	_script_template_postfix = "";
	while (is.get(c))
		_script_template_postfix += c;
	//cout << "read prefix '" << _script_template_prefix << "'" << endl;
	//cout << "read postfix '" << _script_template_postfix << "'" << endl;
}

void RemoteMachines::writeScript(int process, int size_processes) {
	ofstream ofs(("slave"+intToString(process)+".einp").c_str());
	ofs << _script_template_prefix;

	ofs << process << " " << size_processes;
	ofs << _script_template_postfix;
	ofs.close();
}

void RemoteMachines::startProcesses(
		int begin_process, int end_process) {
	if (end_process-begin_process > _machines.size())
		exitError("not enough machines specified");
	int machine;
	int process;
	char *dispatcher = getenv("DES_DISPATCHER");
	if (dispatcher == NULL) {
		for (process = begin_process, machine = 0;
				process < end_process; ++process, ++machine) {
			writeScript(process,end_process);
			string call_string = "rsh -n " + _machines[machine]
					+ " 'cd " + _working_directory + "; "
					+ _machines_charmmb_path[machine]
					+ " < slave" + intToString(process) + ".einp"
					+ " >! slave" + intToString(process) + ".out"
					+ "' &";
			cout << "calling " << call_string << endl;
			system(call_string.c_str()); 
			sleep(2);
		}
	}else{
		ofstream ctlFile("slaves.ctl");
		for (process = begin_process, machine = 0;
				process < end_process; ++process, ++machine) {
			writeScript(process, end_process);
			string process_line = intToString(process)
				+ " " + _machines[machine]
				+ " " + _working_directory
				+ " " + _machines_charmmb_path[machine]
				+ " slave" + intToString(process) + ".einp"
				+ " slave" + intToString(process) + ".out";
			ctlFile << process_line << endl;
		}
		ctlFile.close();
		cout << "calling dispatcher:" << dispatcher << endl;
		int rc = system(dispatcher);
		if (rc != 0)
			cout << dispatcher << " failed, return node=" << rc << endl;
	}
}	

int RemoteMachines::size() const {
	return _machines.size();
}

/**  New class RemoteMachines.11052001
*/
class RemoteMachinesAlf : public RemoteMachines {
private:
/// username for each physical machine
	vector<string> _user;
/// local directory for each physical machine
	vector<string> _local_directory;
/// virtual machines factor (how many virtual machines we have for each physical one)
	int _njobs;
/// It stores the list of process waiting for execution
	list<int> _process_wait;
/// List of completed process without output 
	set<int> _outfiles_wait;
/// here we associate to each completed process without output to the machine where the output lies
	map<int,int> _outfiles_machines;	
/// files to be send (sparated by commas with no spaces between them)
	string _files_to_send;
/// it creates a vector of strings from strings like "string1Xstring2Xstring3" where separator=X
	vector<string> Split(string multi, char separator);
/// In the string 'stringrp' it replaces all 'old_char' by 'new_char'
	void Replace(string& stringrp, string old_char, string new_char);
/// It stores  the process number for each given machine. A negative value means an idle machine:
/// -1= the machine is not currently reachable, -2=machine never used, -3=machine stopped by the user.
	map<int,int> _machines_status;
/// it stores the rsh commands to access the given physical machine. It is accessed by Send
	map<string,string> _mrsh;
/// it stores the rsh commands to access the end machine. It is accessed by Send
	map<int,string> _mrshlast;
/// it stores the working directory of the end machine. It is accessed by Send
	map<int,string> _lastdir;
/// it stores a given machine's information (either an intermediate or computational node)
	struct Machine {
	private:
		/// computing machine number (>=0). If <0 then it is an intermediate node. 
		int _number;
		/// process number (>=0). -2=idle machine never used, -1=machine temporally not reachable.
		/// for the future: -3=machine temporaly stopped by the user
		int _status;
		/// number of jobs done
		int _jobs_done;
		/// number of failures to reach the machine
		int _failures;
	public:
		/// Machines are by default non-computing nodes (number=-1)
		Machine(int number=-1, string username="nouser", 
			string hostname="nohostname", string directory="nodirectory"):
			_number(number), _status(-2), _jobs_done(0),
			_failures(0),username(username),hostname(hostname),
			directory(directory){}
		vector<string> files;
		/// username.
		string username;
		/// hostname
		string hostname;
		/// directory
		string directory;
		int number() const { return _number; };
		void number(int number) { _number=number; };
		int status() const { return _status; };
		void status(int status) { _status = status;};
		int jobs_done() const { return _jobs_done; };
		void jobs_done(int jobs_done) { _jobs_done=jobs_done;};
		int failures() const { return _failures; };
		void failures(int failures) { _failures=failures;};
	};
	map<string,Machine> _machine_list;
	friend ostream& operator<<(ostream& os, const Machine& machine) {
		return os<< "Machine "<<machine.username<<"@"<<machine.hostname
		<< ":"<<endl<<"directory= "<<machine.directory<<endl<<"files= "
		<< machine.files<<endl<<"number= "<<machine.number()<<", status= "
		<< machine.status()<<", jobs_done= "<<machine.jobs_done()
		<< ", failures= "<<machine.failures()<<endl;
		}
	friend ostream& operator<<(ostream& os, const map<string,Machine >& lmp) {
		for (map<string,Machine >::const_iterator it = lmp.begin();
  		    it != lmp.end(); ++it){
  		    os << it->first << " = " << it->second << endl;
  		    };
		return os;
		}				
public:
	RemoteMachinesAlf():RemoteMachines(), _njobs(10){}
	// watch out with the startProcesses(int,int)
/// It starts remote processes for each machine within begin_process and end_process.
/// size_processes=(number of physical machines)*_njobs
/// The return value is the exit status (0=normal completion of the task).
	void startProcesses(int begin_process, int end_process, int size_processes);
/// It starts a remote process (current_process=virtual machine number, machine=physical
/// machine number, size_processes=(number of physical machines)*_njobs).
	void startAProcess(int current_process, int machine, int size_processes);
/// it copies back the files to the master. If it fails it writes an entry to _outfiles_wait
/// and _outfiles_machines
	void finishAProcess(int current_process, int machine);
/// It starts a process executing 'command' on node 'machine' and later executing
/// 'postcommand' on the local (master) node.
	void startAProcess(int machine, string command, string postcommand);
/// It reads the file in 'is' containing the information on the physical machines.
/// The syntax of this file is as follows. The first line should contain:
/// _njob single_dump_files,pdb_file_name,parameter_file
/// Then, for each physical machine we have to add a line like:
/// user1:user2:user3 host1:host2:host3 dir1:dir2:dir3 executable_path
/// the ':' are only for machines in other networks, in that case the files and
/// jobs will be forwarded to user1@host1:/dir1, then to user2@host2:/dir2 and so on.
/// The user must take care that no intermediate directory should match a final one,
/// because an erasing of the files at intermediate ('on route') positions is performed.
/// Future implementations will solve this. 
	void readMachines(istream& is);
/// Remote job control
	void ControlProcesses(int size_processes);
/// parsing for run-time commands
	void doCommands(istream& is);
/// It sends the files in 'files' to the physical machine number 'machine'
/// if sendto=1 we send to the remote host, sendto=0 we send back to the master
	int Send(int machine, int sendto, vector<string> files);
/// It gives the value of _njobs
	int njobs() const;
};

void RemoteMachinesAlf::readMachines(istream& is) {
	//istream& is = open_istream(file_name);
	is >> _njobs;
	is >> _files_to_send;
	string istring;
// we'll have to fix this while (it's too fragile)
	while (1) {
	   is >> istring;
	   if (!is || istring == "stop") break;
	   _user.push_back(istring);
	   is >> istring;
	   _machines.push_back(istring);
	   is >> istring;
	   _local_directory.push_back(istring);
	   is >> istring;
	   _machines_charmmb_path.push_back(istring);
	   cout << " got " << _machines.back() << endl; 	   
	   }
	close_istream();
}

void RemoteMachinesAlf::doCommands(istream& is) {
	string command;
	while (is) {
	is >> command;
	if ( command == "status" ) {
	   cout<<"Status:"<<endl<<"_machine_list="<<endl<<_machine_list<<endl;
	   }
	else if ( command == "set" ){
	   is >> command;
	   if ( command == "machine" ){
	      int mch;
	      is >> mch;
	      is >> command;
	      if ( command == "off" ){
	         cout <<"machine "<<mch<<" will be switched off"<<endl;
	         _machines_status[mch]==-3;
	         }
	      else if ( command == "on" ){
	         cout <<"machine "<<mch<<" will be switched on"<<endl;
	         _machines_status[mch]==-1;
	         }
	      }
	   }
	}
	cout <<endl<<"End of processing the command file"<<endl;
}

vector<string> RemoteMachinesAlf::Split(string multi, char separator) {
	// See below for explanation on change to `int '
	//unsigned current = multi.find(separator);
	int current = multi.find(separator);
	vector<string> several;
	//unsigned last = 0;
	int last = 0;
	while ( current != multi.npos ){
	   several.push_back(multi.substr(last,current-last));
	   last = ++current;
	   current = multi.find(separator,current);
	   }
	several.push_back(multi.substr(last,current-last));
	return several;
}

void RemoteMachinesAlf::Replace(string& stringrp, string old_char, string new_char){
	//unsigned fc=stringrp.find(old_char);
	/*
	Weird, but intermittently, this error would appear at compilation time. But string::npos is int. Fixed. HSC, 19062006

	designer.cc:5321: warning: comparison is always true due to limited range of
	   data type
	designer.cc:5323: warning: comparison is always false due to limited range of
	   data type
	/usr/include/g++/bits/stl_numeric.h: In function `_Tp
	   std::inner_product(_InputIterator1, _InputIterator1, _InputIterator2, _Tp)
	   [with _InputIterator1 = __gnu_cxx::__normal_iterator<float*,
	   std::vector<float, std::allocator<float> > >, _InputIterator2 =
	   __gnu_cxx::__normal_iterator<const float*, std::vector<float,
	   std::allocator<float> > >, _Tp = int]':
	designer.cc:4509:   instantiated from here
	/usr/include/g++/bits/stl_numeric.h:102: warning: assignment to `int' from `
	   float'
	/usr/include/g++/bits/stl_numeric.h:102: warning: argument to `int' from `float
	   '
	make: *** [designer] Error 1
	*/
	int fc=stringrp.find(old_char);
  	while ( fc != stringrp.npos ){
  	   stringrp.replace(fc,old_char.size(),new_char);
  	   fc = (fc >= stringrp.npos-1) ? stringrp.npos :stringrp.find(old_char,fc+2);
  	   }
}

int RemoteMachinesAlf::Send(int machine, int sendto, vector<string> files){
// if sendto>0 we are sending the files to the remote host, but
// if sendto=0 we are sending back the files to the master (but for that we need
// to have done previously a Send to the remote hosts in order to know _mrsh)
	int rtn_error=0;
	string rcp_in = "";
	string rcp_out = "";
	string localdir = _local_directory[0];
	string node = _machines[machine];
	string call_string;
	int ways_flag = 0;
	vector<string> nodes_twoways;
	vector<string> nodes_ways;
	// the following is for being able to send jobs to remote networks,
	// the hosts should be separated by a semicolon with no spaces
	// optionally one can introduce the way out for the rcp by introducing the alias of 
	// the same nodes (separated by semicolons) after a coma and in the inverse order.
	if ( node.find(",") != node.npos ) {
	   nodes_twoways = Split(_machines[machine],',');
	   nodes_ways = Split(nodes_twoways[0],':');
	   ways_flag = 1;
	   cout<<"Nodes:"<<endl;
	   copy(nodes_twoways.begin(),nodes_twoways.end(),ostream_iterator<string>(cout, ", "));
	   cout<<endl;
	   }
	// username for each physical machine on the route to the remote host
	// it includes the initial (local) and final (where the job will run) destinations.
	vector<string> remote_users = Split(_user[machine],':');
	// hostname for each physical machine on the route to the remote host
	vector<string> remote_nodes = ways_flag ? nodes_ways : Split(_machines[machine],':');
	// local directory for each physical machine on the route to the remote host
	vector<string> remote_dirs = Split(_local_directory[machine],':');
	remote_dirs.insert(remote_dirs.begin(), _local_directory[0]);
	remote_users.insert(remote_users.begin(), _user[0]);
	remote_nodes.insert(remote_nodes.begin(), _machines[0]);
	// here we'll store again remote_nodes for the wayout with (ways_flag=1), because
	// the access to the nodes is done with the path learned while sending to the remote host
	vector<string> remote_nodes_in=remote_nodes;
	// the three fields should have the same number of data:
	if ( remote_users.size() != remote_nodes.size() || remote_users.size() != remote_dirs.size() )
	     exitError("Not enough remote net info: "+intToString(remote_users.size())+
	     " users, "+intToString(remote_nodes.size())+" nodes, "+intToString(remote_dirs.size())+
	     " directories");
	string mrsh = "";
	string fcuote = "";
	string bcuote = "";
	string lastcuote = "";
	// here we'll send a rcp process to copy the input files to the next node
	// each time we'll start a process and we leave to future implementations the 
	// possibility to purge the intermediate temp files upon user request.
	if ( sendto == 0 ){
	   // if we are sending back the files to the master then we reverse the path
	   reverse(remote_users.begin(),remote_users.end());
	   reverse(remote_dirs.begin(),remote_dirs.end());
	   reverse(remote_nodes.begin(),remote_nodes.end());
	   // we save the remote_nodes (for the mrsh only).
	   remote_nodes_in = remote_nodes;
	   if ( ways_flag ) {
	      // we overwrite remote_nodes if we specify the way out (ways_flag=1), 
	      // then we have to put the master node as well!!.
	      remote_nodes = Split(nodes_twoways[1],':');
	      }
	   }
	string dir_from;
	string dir_to;
	//
	// Main loop
	// Let's traverse the path to forward the files:
	for ( int k = 1; k < remote_nodes.size(); k++){
	   Machine current_machine(machine, remote_users[k], remote_nodes[k], remote_dirs[k]);
//	   cout<<"created Machine instance "<<current_machine<<endl;
	   // We'll only perform the rcp of the files which are not already there
	   // First we search for the user:node:directory Machine entry
	   // Notice that _machine_list uses the 'wayin' node nomenclature (remote_nodes_in)
	   vector<string> files_tocopy;
	   map<string,Machine>::iterator findm = _machine_list.find(remote_users[k]+":"+remote_nodes_in[k]+":"+dir_to);
	   int found_machine=0;
	   if ( findm != _machine_list.end() )
		found_machine=1;
	   // we have found the destination machine in the machines list
	   //
	   // we skip the forwarding of files if the destination node (k) is called NFS (in case of sending to remote nodes)
	   // or if the origin node (k-1) is called NFS (for sending files back to the master).
	   if ( ((remote_dirs[k] != "NFS") && (sendto !=0)) || ((remote_dirs[k-1] != "NFS") && (sendto ==0)) ) {
	      // way in:
	      // we'll copy the files even if they are already there (in the future we may improve this)
	      rcp_in = "";
	      // when we are sitting on NFS we pick up the directory name from the last non-NFS one.
	      // But sometimes the same directory is exported with diferents path names!, for
	      // that case we have to get the directory from the user (e.g. by putting 'NFS>dir_name').
	      // This is left for the future.
	      dir_from = remote_dirs[k-1];
	      dir_to = remote_dirs[k];
	      if ( ((sendto != 0) && ( k > 1)) ){
		 if ( remote_dirs[k-1] == "NFS" ){
		    int last_dir = k-1;
		    while ( remote_dirs[last_dir] == "NFS" )
			  --last_dir;
		    dir_from = remote_dirs[last_dir];
		    }
		 }
	      if ( ((sendto == 0) && (k < remote_nodes.size()-1)) ){
		 if ( remote_dirs[k] == "NFS" ){
		    int last_dir = k;
		    while ( remote_dirs[last_dir] == "NFS" )
			  ++last_dir;
		    dir_to = remote_dirs[last_dir];
		    }
		 }
	      for (vector<string>::const_iterator it_infiles = files.begin(); 
		  it_infiles != files.end(); ++it_infiles){
		  int copy_flag=1;
//		  cout<<"DEBUG  _machine_list="<<_machine_list<<endl<<"k="<<k<<". remote_users="<<remote_users<<". remote_nodes_in="<<remote_nodes_in<<endl;
		     if ( found_machine == 1) { 
		     vector<string>::const_iterator fdstr;
		     // here, the STL's find didn't work, so I have used the brute force
		     for (fdstr = findm->second.files.begin(); (fdstr != findm->second.files.end() ) && (*fdstr != *it_infiles ) ;fdstr++){}
		     if ( fdstr != findm->second.files.end()){
		        // found the file, so it won't copy it
	  		copy_flag=0;
	  		}
	 	     }
//	          cout<<"DEBUG rcp_in="<<rcp_in<<endl;
	 	  if ( copy_flag == 1 ) {
	 	     rcp_in += "rcp " + dir_from + "/" + (*it_infiles) + " " + remote_users[k]
			   + "@" + remote_nodes[k] + ":" + dir_to + " ; ";
		     files_tocopy.push_back(*it_infiles);
		     if ( found_machine == 1)
		        findm->second.files.push_back(*it_infiles); 
		     }
		  }
	      current_machine.directory=dir_to;
	      if ( sendto != 0 ){
		 // we send to the remote
		 call_string = mrsh + fcuote + rcp_in + bcuote;
		 }
	      else {
		 // we get from the remote
		 map<string,string> mrsh_tmp = _mrsh;
		 // although we have taken (for the 'rcp_in') the nodes from the user's wayout input,
		 // we are going to take the access to that node from the user's wayin input (which
		 // has been already stored in _mrsh).
		 map<string,string>::iterator find = mrsh_tmp.find(remote_users[k-1]+":"+remote_nodes_in[k-1]);
		 //cout << ((*find).first) << "->" << ((*find).second) << endl;
		 call_string = ((*find).second).replace(((*find).second).find("command"),7,rcp_in);
		 }
	      // If we don't copy rtn_error will remain 0
//	      cout<<"DEBUG rcp_in="<<rcp_in<<endl;
	      if ( (machine != 0) && (rcp_in != "") ) {
		 cout << "calling " << call_string << endl;
		 // we can't use the system() return error for rsh, so we'll test it later
		 rtn_error=system(call_string.c_str());
		 if (rtn_error == 0){
		    if ( found_machine == 0)
		       for (vector<string>::const_iterator it_infiles = files_tocopy.begin(); 
		  	   it_infiles != files_tocopy.end(); ++it_infiles){
		 	   current_machine.files.push_back(*it_infiles);
		 	   }
		    }
		 else {
		    cout <<endl<< "DEBUG command failed"<<endl;
		    // status = not currently reachable. For the moment this is for information purposes only
		    if ( found_machine == 1) {
		       findm->second.status(-1);
		       findm->second.failures(findm->second.failures()+1);
		       }
		    else {
		       current_machine.status(-1);
		       current_machine.failures(current_machine.failures()+1);
		       }
		    }
		 }
	      }
	  if ( sendto !=0 ) {
	    if ( k == 1 ){
	      lastcuote = " '";
	      }
	    else {
	      // each time that we go to a new node we have to protect the backslash
	      Replace(lastcuote,"\\","\\\\");
	      // and the cuote  (watch out with the order!).
	      Replace(lastcuote,"'","\\'");
	      }
	   fcuote = lastcuote + fcuote;
	   bcuote += lastcuote;
	   mrsh += "rsh -l " + remote_users[k] + " -n " + remote_nodes[k]+" ";
	   // let's store the rsh access to the current node
	   _mrsh[remote_users[k]+":"+remote_nodes[k]]=mrsh + fcuote + " command " + bcuote;
	   if ( found_machine == 0 ) {
	      _machine_list[remote_users[k]+":"+remote_nodes[k]+":"+dir_to]=current_machine;
	      } 
	   }
	}
     //
     // end of main loop
     //
     if ( sendto != 0 ){ 
	_mrshlast[machine] = mrsh + fcuote + " command " + bcuote;
	// if the most remote local directory is NFS then we take the last non-NFS one.
	// Again this has to be changed if we implement the possibility of having NFS with diferent dirs
	int last_dir = remote_dirs.size()-1;
	while ( remote_dirs[last_dir] == "NFS" )
	      --last_dir;
	_lastdir[machine] = remote_dirs[last_dir];
	}
//     cout<<endl<<remote_users<<endl<<remote_nodes<<endl<<remote_dirs<<endl<<_machine_list<<endl;
	return rtn_error;
}

void RemoteMachinesAlf::ControlProcesses(int size_processes){
	// We look for stopped*.tmp files to see if the job has finished, so we remove them before
	system("rm stopped*.tmp");
	//
	char buffer[20];
	vector<string> numbers;
	set<int> process_tocomplete;
	for (int process = 1; process <= size_processes; process++) {
		sprintf(buffer,"%d",process);
		numbers.push_back((string)buffer);
		_process_wait.push_back(process);
		process_tocomplete.insert(process);
	}
	//
	// begin 
	//
	// we don't start here the forked process on the master.
	//
	// Start processes for each physical machine. Some machine might fail
	// startProcesses should take care of the
	startProcesses(1,size(),size_processes);
	// 
	int current_process = -1; 
	//
	// we'll be done after all processes have ben executed and all output files taken
	// The first idle machine (after finishing the list of pending jobs) will execute
	// again the process corresponding to any element of _outfiles_wait.
	// We will take the result from the first one to finish and leave the other process
	// at its own (finishing after the master has processed the files)
	// 
	// main loop
	//
	// the command file is for run-time orders, so we could remove any existing ones before execution
//	system("rm command.tmp");
	ifstream test;
	while ((_process_wait.size() > 0) || (_outfiles_wait.size() > 0) || (process_tocomplete.size() > 0) ){
		//cout<<_process_wait.size()<<" "<<_outfiles_wait.size()<<" "<<process_tocomplete.size()<<endl;
		sleep(15);
		// before anything we look for a command.tmp file
		string file_commands = "command.tmp";
		test.open(file_commands.c_str());
		if (test){
			doCommands(test);
			// we close the openned file
			test.close();
			test.clear();
			system("rm command.tmp"); 
		}
		// Let's try to finish the processes in _outfiles_wait
		for (set<int>::const_iterator process_notfinished = _outfiles_wait.begin();process_notfinished !=_outfiles_wait.end(); ++process_notfinished){
			// if the files are successfully transfered back to the master the corresponding
			// entry at _outfiles_wait is removed
			finishAProcess( *process_notfinished, _outfiles_machines[*process_notfinished] );
		}
		// Now, we will try to send a job to an idle machine (which failed previously, or which has already finished)
		// test for machines which had failed in starting a job (failure rcp or/and rsh)
		current_process=-1;
		map<int,int>::const_iterator machine_it;
		// find a machine with a negative process number (i.e. idle machine)
		for (machine_it = _machines_status.begin(); (machine_it != _machines_status.end()) && (machine_it->second >= 0); ++machine_it){}
		if ( machine_it != _machines_status.end() ){
			// we have found an idle machine, so we'll look for the next process in the waiting list
			// _process_wait takes preference over _outfiles_wait 
			if (_process_wait.size() > 0) {
				current_process = _process_wait.front();
			}else {
				// we have finished with the waiting list, so we'll go to the _outfiles_wait list
				// only finishAProcess can put this process back to the _outfiles_wait list 
				if ( _outfiles_wait.size() > 0) {
					current_process = *(_outfiles_wait.begin());
					_outfiles_wait.erase(current_process);
				}
			}
			if (current_process != -1 ) {
				// startAProcess changes _machines_status according to the rsh's success 
				startAProcess(current_process,machine_it->first,size_processes);
			}
		}
		// Let's look for stopped files among the list of computing machines
		for (map<int,int>::const_iterator machine_status_it = _machines_status.begin(); machine_status_it != _machines_status.end(); ++machine_status_it){
			// we may have a machine running a process that it has been finished (with another machine)
			if ( (machine_status_it->second >= 0) &&( process_tocomplete.find(machine_status_it->second) != process_tocomplete.end() ) ){
				int process = machine_status_it->second; 
				// this is a running machine
				string filename = string("stopped")+intToString(process)+".tmp";
				test.open(filename.c_str());
				if (test){
					// we have found a stopped file
					int machine = machine_status_it->first;
					cout << " process " << process << " returned from machine " << machine<< endl;
					process_tocomplete.erase(process);
					//remove finishAProcess if we are not doing pair energies?
					finishAProcess(process,machine);
					// we set the status machine to idle
					_machines_status[machine]=-1;
					// we have to actualize the machine's _jobs_done and _status
					// ...
					// we close the openned file
					test.close();
					test.clear();
				}
			}
		}
	}
	//
	// end of main loop
	//
	cout << endl<<"Master has received all the files from the finished jobs"<<endl;
}	
	

void RemoteMachinesAlf::finishAProcess(
	int current_process, int machine) {
	int rtn_error=0;
	vector<string> out_files;
	out_files.push_back("pair_*energies" + intToString(current_process) + ".tmp");
	// we send back the jobs (except if it is the master machine)
	if (machine !=0 )
	   rtn_error=Send(machine,0,out_files);
	if (rtn_error != 0) {
	   _outfiles_wait.insert(current_process);
	   _outfiles_machines[current_process]=machine;
	   cout<<"could not get the data of process "<<current_process<<" from machine number "<<machine<<endl;
	   }
	else {
	   // this is only if this was not the first time we tried to finish a process
	   _outfiles_wait.erase(current_process);
	   }
}

void RemoteMachinesAlf::startAProcess(
	int current_process, int machine, int size_processes) {
	// here we deal with the errors internally, so we've defined this method as void
	cout << "current_process " << current_process<<", machine "<<machine<<endl;
	if ( _machines_status[machine]==-3 ){
	   cout<<"machine "<<machine<<" skipped by user request"<<endl;
	   return;
	   }
	int rtn_error=0;
	writeScript(current_process,size_processes);
	vector<string> in_files = Split(_files_to_send,',');
	in_files.push_back("slave" + intToString(current_process) + ".einp");
	// we send the jobs
	rtn_error=Send(machine,1,in_files);
	if ( rtn_error != 0 )
	    return;
	// don't put cuotes (nor '&')
	string command = "cd " + _lastdir[machine] + "; "
			+ _machines_charmmb_path[machine]
			+ " < slave" + intToString(current_process) + ".einp"
			+ " >! slave" + intToString(current_process) + ".out";
	// the next command is executed outside the mrsh:
	// we touch the stopped file on the current dir. We could also put the path
	string postcommand = " ; touch stopped" + intToString(current_process) + ".tmp";
	// we start a process executing the given command on the remote node
	startAProcess(machine,command, postcommand);
	// because the process is done in the background, we cannot look for the
	// termination error number, so we have to do something else:
	sleep(2);
	// if after 2 seconds we see the stopped file, then something went wrong
	// hopefully this is enough time
	ifstream test;
	string stopped_file = "stopped" + intToString(current_process) + ".tmp";
	test.open(stopped_file.c_str());
	if (test){
	   rtn_error=1;
	   test.close();
	   test.clear();
	   }
	if ( rtn_error != 0 ){
	    cout<<"WARNING: could not start process "<<current_process<<" on machine "
	    <<_machines[machine]<<endl<<"It will remain in the waitting list"<<endl;
	    _machines_status[machine]=-1;
	    // even if the rsh fails, the touch to the stopped file is done, so we have to remove it
	    command = "rm stopped" + intToString(current_process) + ".tmp";
	    system(command.c_str()); 
	    }
	else {
	    // we remove the job from the waiting list and actualize the list of machine status
	    _process_wait.remove(current_process);
	    _machines_status[machine]=current_process;
	    }
	// we'll send back the files with finishAprocess later, when the process is over 
}
void RemoteMachinesAlf::startAProcess(
	int machine, string command, string postcommand) {
	map<int,string> mrshlast_tmp = _mrshlast;
	string call_string = "( "+mrshlast_tmp[machine].replace(mrshlast_tmp[machine].find("command"),7,command);
	call_string += postcommand + ") &";
	cout << "calling " << call_string << endl;
	// we can't look for the return error code for a job in the background
	system(call_string.c_str()); 	
	}	

void RemoteMachinesAlf::startProcesses(
		int begin_process, int end_process, int size_processes) {
	if (end_process-begin_process > _machines.size())
	    exitError("RemoteMachinesAlf::startProcesses not enough machines specified");
	//process 0 is running on the master
	_machines_status[0]=0;// no jobs on the master for the time being
	//_process_wait.remove(0);
	cout << "Master is " + _user[0] +"@" + _machines[0] + ":" + _local_directory[0] << endl;
	// the first machine names the master but it's not used in the first round
	int machine;
	int process;
	for (process = begin_process, machine = 1; 
	process < end_process; ++process, ++machine) {
	    // the same startAProcess sets the _machine_status, so we don't have to do
	    // anything here with the error number.
	    startAProcess(process,machine,size_processes);
	    //sleep(2);
	    }
	cout << "The stored table of machines and their access is:"<<endl<<_mrsh<<endl;
/*	for (map<string,string>::const_iterator it = _mrsh.begin();
	    it != _mrsh.end(); it++){
	    cout << (*it).first << " = " << (*it).second << endl;
	    }; */
}

int RemoteMachinesAlf::njobs() const {
	return _njobs;
}
	

class AllPositions {
public:
	AllPositions();
	void scanForResCodes(const string& segid_name);
	void storeInitialSequence();
	void storeInitialSequence(const string& seq);
	void fillWithResCodes(const string& segid_name);
	void computePhiPsi(RPPHashTable& rpp_hash_table);
	void fillWithLibrary(const RotamerLib& rotamer_lib);
	void fillWithDependentLibrary(istream& istr,
			const RPPHashTable& rpp_hash_table);
	void computeBuriedASA();
	ostream& printBurial(ostream& os,
			const RotamerLib& rotamer_lib, float burial_threshold);
	void keepBurial(const RotamerLib& rotamer_lib,
			float keep_threshold);
	ostream& printRMSDihedrals(ostream& os,
			float allowed_dev, const RotamerLib& rotamer_lib);
	void setEntropyFlag(int flag);
	void skip_read_pair_energies();
	void setEntropyFactor(float factor);
	void setSegId(const string& segid);
	void setPDBFilePrefix(const string& prefix);
	void setFullInfoFilePrefix(const string& prefix);
	void setRelEnergiesFilePrefix(const string& prefix);
	void setSingleDihedralsFlag(int flag);
	void setSingleRepatchFlag(int flag);
	void setEef1Flag(int flag);
	void setASPFlag(int flag);
	void setASPIsolatedFlag(int flag);
	void setASPDistance(float distance);
	void setAddASPFlag(int flag);
	void addSurfacePotential(int which = 3);
	void setSizeProcesses(int size_processes);
	void setEnergyGap(float energy_gap);
	void setRefStructureFlag(int ref_structure_flag);
	void setDeeShortFlag(int dee_short_flag);
	void setSingleEnergy(float energy);
	void addRefEnergy(const RefEnergy& ref_energy);
	void addRefSolvation(const RefEnergy& ref_energy);
	void openShortInfoFile(const string& file_name);
	void closeShortInfoFile();
	void openSolvationFile(const string& file_name);
	#ifdef NOE
	void patchAllPositions(); 				// 13062006 For testing porpouses mainly
	vector<int > getPosNumbers();			/// For NOE ; Miguel A. Santos, HSC, Toronto, 2006
	#endif
	void computeSingleEnergies();
	void setRemoteMachines(
		const string& machines_file, const string& script_file);
	void pairListEnergies();
	void computePairEnergies();
	void computePairEnergiesSingleProcess();
	void computePairEnergiesMultiProcesses();
	void computePairEnergies(int process, int size_processes);
	void computePairEnergiesGLY(int process, int size_processes); // 09052001 for correcting GLY/PRO (still buggy)
	void restrictPairEnergies(float max_dist);
	void penalizeUnequalPairs(const string& segid1, int resid1,
			const string& segid2, int resid2,
			float weight);
	void deadEndElimination();
	void readDeeResults(istream& is);
	void generateCombinations();
	void writeAllCombinations();
	// new things
	float energyPositions(vector<int> pos_numbers,vector<string> segids);
	float energyPosition(int pos_number, string segid, char res_code, bool& patch_alx, float& alx_aspot, float rotamer_ref_energy);
	void threadCombinations();
	void threadCombinations(int process, int size_processes);
	void distributed();
	void computeMinimum(int n_iter);
	void addMinRefEnergy(float factor);
	void scaleElecPairEnergies(float factor);
	void Design();
	void Design(int n_iter);
	void setWriteGraphFile(const string& file_name);
	void setRemoteMachinesAlf(
		const string& machines_file, const string& script_file);
	void markAsFilled();
	ostream& printAminoAcids(ostream& os);
	void removeAboveMinEnergy(float delta);
	void removeButClosest(int size, float allowed_dev,
			const vector<float>& angle_weights, int print_flag);
	int sizePositions() const;
	int sizeRotamers() const;
	ostream& dumpRotamersEnergies(ostream& os) const;
	istream& readRotamersEnergies(istream& is);
	ostream& printReferenceEnergies(ostream& os,
			int nb_phi, int nb_psi, float temp, int ramachandran);
	ostream& printPairEnergies(ostream& os) const;
	ostream& printGraph(ostream& os) const;
	ostream& printRotCodes(ostream& os) const;
	ostream& printFullGraph(ostream& os) const;
	istream& readGraphResults(istream& is);
	ostream& printDump(ostream& os, bool only_single = false) const;
	istream& readDump(istream& is, bool only_single = false);
	friend ostream& operator<<(ostream& os, const AllPositions& all_positions);
private:
	//SG string _segid;
	void initializeCumulativeRotamers();
	vector<char> _initial_sequence;
	vector<int> _cumulative_rotamers;
	vector<ResPosition> _positions;
	vector<float> _buried_asa;
	void removeDeadRotamers(int* dead_single);
	string _pdb_file_prefix;
	string _full_info_file_prefix;
	string _write_graph_file;
	ofstream _short_info_file;
	ofstream _solvation_file;
	int _single_dihedrals_flag;
	int _single_repatch_flag;
	int _eef1_flag;
	int _surface_potential_flag;
	int _surface_isolated_flag;
	float _surface_potential_distance;
	int _add_surface_potential_flag;
	int _ref_structure_flag;
	int _dee_short_flag;
	float _entropy_factor;
	float _energy_gap;
	int _entropy_flag;
	int _size_processes;
	int _size_fork_processes;
	RemoteMachines _remote_machines;
	int _remote_machines_alf_flag;
	RemoteMachinesAlf _remote_machines_alf;
	bool _skip_read_pair_energies;
	vector< vector<float> > _pair_energies;
	#ifdef VDWELEC
	vector< vector<float> > _pair_elec_energies;
	vector< vector<float> > _pair_vdw_energies;
	#endif
	#ifdef NOE
	vector< vector<float> > _pair_noe_energies;  /// For NOE. Complements rotamer._user_energy. Miguel A. Santos, HSC, Toronto, 2006
	#endif
	vector< vector<float> > _pair_solv_energies;
	vector< vector<char> > _pair_flags;
	float _template_aspot;
	list< vector<list<Rotamer>::const_iterator> > _combinations;
	void writeCombination(int number,
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers, const vector<string>& segids,
		float solvation);
	void writeRefCombination(int number,
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers, const vector<string>& segids);
	void initCombination(
		vector<list<Rotamer>::const_iterator>& vec_it_rotamer);
	bool nextCombination(
		vector<list<Rotamer>::const_iterator>& vec_it_rotamer);
	void splitPositions(vector< list<int> >& position_lists);
};

AllPositions::AllPositions()
	//SG : _segid("YYY"),
	: _pdb_file_prefix(""), _full_info_file_prefix(""),
	_short_info_file(), _solvation_file(),
	_entropy_factor(1), _entropy_flag(0), _energy_gap(0.0),
	_size_processes(1), _size_fork_processes(1),
	_single_dihedrals_flag(0), _single_repatch_flag(0),
	_eef1_flag(1),  // 31102000  changed the default from 0 to 1
	_surface_potential_flag(0), _surface_isolated_flag(1),
	_remote_machines_alf_flag(0),
	_surface_potential_distance(4.0),
	_add_surface_potential_flag(0),
	_ref_structure_flag(0), _dee_short_flag(0), _skip_read_pair_energies(false) {
}

void AllPositions::scanForResCodes(const string& segid_name) {
	int pos_number;
	char res_code;
        //_positions.erase(_positions.begin(),_positions.end());
	for (;;) {
		pos_number = -5;
		scanf("%d",&pos_number);
		if (pos_number == -5) break;
		// cout << "adding position " << pos_number << endl;
		_positions.push_back(ResPosition(segid_name,pos_number));
		ResPosition& res_position = _positions.back();
		for (;;) {
			res_code = '$';
			do {
				scanf("%c",&res_code);
			} while (isspace(res_code));
			if (res_code == '$')
				exitError("something wrong in reading AA's");
			if (res_code == '#') break;
			//cout << " adding code ," << res_code << "," << endl;
			res_position.addCode(res_code);
			//res_position.addRotamers(rotamer_lib.allRotamersByCode(res_code));
		}
	}

	int sz_pos = sizePositions(), i;
	_pair_flags.erase(_pair_flags.begin(),_pair_flags.end());
	_pair_flags.insert(
			_pair_flags.begin(),(size_t)sz_pos,vector<char>());
	for (i = 0; i < sz_pos; ++i)
		_pair_flags[i].insert(
				_pair_flags[i].begin(),(size_t)(i+1),1);
}

void AllPositions::storeInitialSequence(){
	int sz_pos = sizePositions();
	vector<ResPosition>::iterator it_position;
	_initial_sequence.clear();
	cout<<"Storing sequence ";
	for (it_position = _positions.begin();it_position != _positions.end();++it_position){
		_initial_sequence.push_back(charmm_computations.getResCode((*it_position).number()));
		cout<<(*it_position).number()<<charmm_computations.getResCode((*it_position).number())<<" ";
	}
	cout<<endl;
}

void AllPositions::storeInitialSequence(const string& seq){
	int sz_pos = sizePositions();
	int i;
	vector<ResPosition>::iterator it_position;
	_initial_sequence.clear();
	cout<<"Storing sequence ";
	for (i=0,it_position = _positions.begin();it_position != _positions.end();++it_position,++i){
		_initial_sequence.push_back(seq[i]);
		cout<<(*it_position).number()<<seq[i]<<" ";
	}
	cout<<endl;
}


void AllPositions::fillWithResCodes(const string& segid_name) {
	int nres = charmm_computations.nres();
	for (int pos = 0; pos < nres; ++pos) {
		//cout << "adding position " << pos << ", "<<ResPosition(segid_name,pos+1)<<", "<<charmm_computations.getResCode(pos+1)<<endl;
		_positions.push_back(ResPosition(segid_name,pos+1));
		ResPosition& res_position = _positions.back();
		res_position.addCode(charmm_computations.getResCode(pos+1)); //18062001 changed pos to pos+1
	}
}

void AllPositions::fillWithLibrary(const RotamerLib& rotamer_lib) {
	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		if (!(*it_position).isFilled()) {
			(*it_position).addRotamers(rotamer_lib);
		}
	markAsFilled();
}

void AllPositions::markAsFilled() {
	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
			(*it_position).setFilledFlag(1);
}
#ifdef NOE
/// For use with NOE: makes NOE setup easier having defined a method that gives all designed positions.  Miguel A. Santos, HSC, Toronto, 2006.
vector<int > AllPositions::getPosNumbers(){
	vector<int> pos_numbers;
	//vector<string> segids;
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: _positions.size()="<<_positions.size()<<" : ";
	#endif
	for (vector<ResPosition>::iterator it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		pos_numbers.push_back((*it_position).number());
		#ifdef NOEDEBUGFULL
		cout<<pos_numbers.back()<<" ";
		#endif
	//	segids.push_back((*it_position).segid());
	}
	#ifdef NOEDEBUGFULL
	cout<<endl; 
	#endif
	return pos_numbers;
}
#endif
void AllPositions::computeBuriedASA() {
	charmm_computations.computeASA();
	vector<ResPosition>::const_iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		_buried_asa.push_back(
				charmm_computations.getResidASA(
						(*it_position).number(),(*it_position).segid() ));
}

ostream& AllPositions::printBurial(ostream& os,
		const RotamerLib& rotamer_lib, float burial_threshold) {
	char pos_res_code;
	float free_asa;
	float burial;
	for (int i = 0; i < _positions.size(); ++i) {
		pos_res_code = _positions[i].rotamers().front().resCode();
		free_asa = rotamer_lib.freeASAByCode(pos_res_code);
		if (free_asa == 0)
			continue;
		burial = free_asa > 0 ? _buried_asa[i] / free_asa : 0;
		if (burial <= burial_threshold)
			cout << _positions[i].segid() << " " << _positions[i].number()
					<< " " << pos_res_code
					<< " " << burial
					<< " (" << _buried_asa[i] << "," << free_asa << ")"
					<< endl;
	}
	return os;
}

void AllPositions::keepBurial(const RotamerLib& rotamer_lib,
		float keep_threshold) {
	char pos_res_code;
	float free_asa;
	float burial;
	vector<ResPosition>::iterator it_position = _positions.begin();
	vector<float>::iterator it_buried = _buried_asa.begin();
	int i = 0;
	while (it_position != _positions.end()) {
		pos_res_code = (*it_position).rotamers().front().resCode();
		free_asa = rotamer_lib.freeASAByCode(pos_res_code);
		burial = free_asa > 0 ? _buried_asa[i] / free_asa : 0;
		if (burial > keep_threshold) {
			_positions.erase(it_position);
			_buried_asa.erase(it_buried);
		}
		else {
			++it_position;
			++it_buried;
		}
		++i;
	}
	//for (i = 0; i < _positions.size(); ++i) {
	//	cout << "resdiue " << i << " number "
	//			<< _positions[i].number() << endl;
	//}
}


ostream& AllPositions::printRMSDihedrals(ostream& os, float allowed_dev,
		const RotamerLib& rotamer_lib) {
	vector<float> diff_dihedrals;
	const int max_dihedrals = 4;
	vector<float> sum((size_t)max_dihedrals,0.0);
	vector<float> sum_sq((size_t)max_dihedrals,0.0);
	vector<int> ok((size_t)max_dihedrals,0);
	vector<int> excl_ok((size_t)max_dihedrals,0);
	vector<int> count((size_t)max_dihedrals,0);
	int i, j;
	bool ok_flag;
	float rms, total_rms = 0, total_rms_sq = 0;
	int total_rms_count = 0;
	pair<float,int> rotamer_rms;

	charmm_computations.icDiff();

	for (i = 0; i < _positions.size(); ++i) {
		Rotamer& rotamer = _positions[i].rotamersVar().front();
		//SG
		charmm_computations.getRotamerDihedrals(_positions[i].segid(),
				_positions[i].number(),rotamer,diff_dihedrals);
		charmm_computations.symmetryCorrect(rotamer,diff_dihedrals,
				_positions[i].number(),_positions[i].segid());
		os << _positions[i].segid() << " " << _positions[i].number()
				<< " " << rotamer.resCode();
		rotamer_rms = charmm_computations.getRMS(_positions[i].segid(),
				_positions[i].number());
		total_rms_sq += rotamer_rms.first;
		total_rms_count += rotamer_rms.second;
		total_rms += rms = sqrt((double)rotamer_rms.first/rotamer_rms.second);
		os << " " << rms;
		ok_flag = true;
		int dihedrals_size = diff_dihedrals.size();
		for (j = 0; j < dihedrals_size; ++j) {
			count[j]++;
			os << "  x" << j+1;
			if (ok_flag = (ok_flag && fabs(diff_dihedrals[j]) < allowed_dev)) {
				os << " ";
				ok[j]++;
				if (j + 1 >= dihedrals_size)
					excl_ok[j]++;
			}
			else
				os << "*";
			os << " " << diff_dihedrals[j];
			sum[j] += fabs(diff_dihedrals[j]);
			sum_sq[j] += diff_dihedrals[j]*diff_dihedrals[j];
		}
		os << endl;
	}
	os << endl
			<< "rms av " << total_rms/_positions.size()
			<< "   rms total " << sqrt((double)total_rms_sq / total_rms_count) << endl
			<< "difference statistics (dev "
			<< allowed_dev << ")" << endl;
	float av;
	int excl_count;
	for (j = 0; j < max_dihedrals; ++j) {
		excl_count = j < max_dihedrals-1 ? count[j]-count[j+1] : count[j];
		os << "x" << j+1
				<< " " << excl_ok[j]
				<< "/" << excl_count
				<< " ("
				<< (excl_count ? 100*(float)excl_ok[j] / excl_count : 0) << "%)"
				<< " " << ok[j]
				<< "/" << count[j]
				<< " (" << (count[j] ? 100*(float)ok[j] / count[j] : 0) << "%)"
				<< "  average "
				<< (count[j] ? av = sum[j] / count[j] : 0)
				<< "  stddev "
				<< (count[j] ? sqrt((double)sum_sq[j] / count[j] - av*av) : 0)
				<< endl;
	}
	os << endl;
	os << "x1+x2    " << excl_ok[0]+ok[1] << "/"
			<< count[0] << " ("
			<< 100*(float)( excl_ok[0]+ ok[1])/(count[0])
			<< "%)" << endl;
	os << "x1+x2+x3 " << excl_ok[0]+excl_ok[1]+ok[2] << "/"
			<< count[0] << " ("
			<< 100*(float)( excl_ok[0]+excl_ok[1]+ok[2] )/(count[0])
			<< "%)" << endl;
	return os;
}

//SG void AllPositions::setSegId(const string& segid) {
//	_segid = segid;
//}

void AllPositions::setPDBFilePrefix(const string& prefix) {
	_pdb_file_prefix = prefix;
}

void AllPositions::setFullInfoFilePrefix(const string& prefix) {
	_full_info_file_prefix = prefix;
}

void AllPositions::setSingleDihedralsFlag(int flag) {
	_single_dihedrals_flag = flag;
}

void AllPositions::setSingleRepatchFlag(int flag) {
	_single_repatch_flag = flag;
}

void AllPositions::setEef1Flag(int flag) {
	_eef1_flag = flag;
}

void AllPositions::setASPFlag(int flag) {
	_surface_potential_flag = flag;
}

void AllPositions::setASPIsolatedFlag(int flag) {
	_surface_isolated_flag = flag;
}

void AllPositions::setASPDistance(float distance) {
	_surface_potential_distance = distance;
}

void AllPositions::setAddASPFlag(int flag) {
	_add_surface_potential_flag = flag;
}

void AllPositions::skip_read_pair_energies() {
	_skip_read_pair_energies = true;
}

void AllPositions::setSizeProcesses(int size_processes) {
	_size_processes = size_processes;
	_size_fork_processes = size_processes;
}

void AllPositions::setEntropyFlag(int flag) {
	_entropy_flag = flag;
}

void AllPositions::setEnergyGap(float energy_gap) {
	_energy_gap = energy_gap;
}

void AllPositions::setRefStructureFlag(int ref_structure_flag) {
	_ref_structure_flag = ref_structure_flag;
}

void AllPositions::setDeeShortFlag(int dee_short_flag) {
	_dee_short_flag = dee_short_flag;
}


void AllPositions::setEntropyFactor(float factor) {
	_entropy_factor = factor;
}

void AllPositions::openShortInfoFile(const string& file_name) {
	_short_info_file.open(file_name.c_str());
	if (!_short_info_file)
		exitError("cannot open output file " + file_name);
}

void AllPositions::closeShortInfoFile() {
	if (_short_info_file.rdbuf()->is_open())
		_short_info_file.close();
}

void AllPositions::openSolvationFile(const string& file_name) {
	_solvation_file.open(file_name.c_str());
	if (!_solvation_file)
		exitError("cannot open output file " + file_name);
}

void AllPositions::computePhiPsi(RPPHashTable& rpp_hash_table) {
	for (int i = 0; i < _positions.size(); ++i) {
		if (_positions[i].isFilled())
			continue;
		rpp_hash_table.insertResCodes(_positions[i].resCodes(),
				_positions[i].phi(),_positions[i].psi(),i);
		//cout << _positions[i].number() << " "
		//		<< _positions[i].phi() << " "
		//		<< _positions[i].psi() << endl;
	}
	cout << "HASH is" << endl << rpp_hash_table << endl;
}	

void AllPositions::fillWithDependentLibrary(istream& istr,
		const RPPHashTable& rpp_hash_table) {
	char buffer[300];
	vector<float> chis;
	char res_code;
	int size;
	Rotamer rotamer;
	float angle, probability;
	int rotamer_id = 0;
	list<int> positions;
	list<int>::iterator it_position_index;
	int entry;

	while (istr.getline(buffer,200)) {
		entry = rpp_hash_table.findEntry(buffer);
		if (!rpp_hash_table.isEntryEmpty(entry)) {
			//cout << "found in " << entry << endl;
			res_code = *buffer;
			rpp_hash_table.allPositions(entry,buffer,positions);
			for (it_position_index = positions.begin();
					it_position_index != positions.end();
					++it_position_index) {
				rotamer_id++;
				size = sizeChis(res_code);
				chis.erase(chis.begin(),chis.end());
				for (int i = 0; i < size; ++i) {
					sscanf(&buffer[40+i*8],"%f",&angle);
					chis.push_back(angle);
					//cout << chis[i] << " ";
				}
				//cout << endl;
				sscanf(&buffer[31],"%f",&probability);
				_positions[*it_position_index].addSingleRotamer(
						res_code,rotamer_id,chis,probability);
			}
		}
	}
	for (int i = 0; i < _positions.size(); ++i)
		_positions[i].sortRotamers();
	markAsFilled();
}
/*
*/
#ifdef NOE
void AllPositions::patchAllPositions(){
	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).patchPosition();
}
#endif
void AllPositions::computeSingleEnergies() {
	vector<ResPosition>::iterator it_position;

		/* charmm_computations.cmBuild();
		charmm_computations.unfix();
		//charmm_computations.cmUpdate();
		charmm_computations.eef1Energy();
		cout << "untouched " <<  charmm_computations.eef1FromAll() << endl; */
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).patchPosition();
	if (_eef1_flag) {
		charmm_computations.cmBuild();
		charmm_computations.unfix();
		//charmm_computations.cmUpdate();
		charmm_computations.eef1Energy();
		_template_aspot =  charmm_computations.eef1FromAll();
		//charmm_computations.writePDB("alx.pdb");
		//exitError("STOP after writePDB");
	}  else if (charmm_computations.SolvFlag()) {
		charmm_computations.cmBuild();
		_template_aspot = charmm_computations.SolvEnergy();
	}
	else if (_surface_potential_flag) {		// Default step in common simulations  03062006
		charmm_computations.cmBuild();
		//charmm_computations.writePDB("alx.pdb");
		//exitError("STOP after writePDB");
		charmm_computations.computeSurface();
		_template_aspot =  charmm_computations.aspotAll();
	}
	#ifdef NOEDEBUGFULL
	cout << "DEBUGGING: total aspot " << _template_aspot << endl;
	//exitError("STOP after printing (template) aspot");
	#endif

	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).computeEnergies(_single_dihedrals_flag,
				_single_repatch_flag,
				_eef1_flag,
				_surface_potential_flag,
				_surface_isolated_flag,
				_add_surface_potential_flag,_template_aspot);
	if (_entropy_flag)
		for (it_position = _positions.begin();
				it_position != _positions.end(); ++it_position)
			(*it_position).addEntropy(_entropy_factor);
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).computeMinMax();
}

void AllPositions::removeAboveMinEnergy(float delta) {
	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).removeAboveMinEnergy(delta);
	//for_each(_positions.begin(),_positions.end(),
	//		my_bind2nd(my_mem_fun1_ref(&ResPosition::removeAboveMinEnergy),
	//				delta) );
}

void AllPositions::removeButClosest(int size, float allowed_dev,
		const vector<float>& angle_weights, int print_flag) {
	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).removeButClosest(size,allowed_dev,
				angle_weights,print_flag);
}

void AllPositions::setSingleEnergy(float energy) {
	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).setSingleEnergy(energy);
	//for_each(_positions.begin(),_positions.end(),
	//		my_bind2nd(my_mem_fun1_ref(&ResPosition::setSingleEnergy),
	//				energy) );
}


void AllPositions::computePairEnergies() {
	if (_size_processes <= 1)
		computePairEnergiesSingleProcess();
	else
		computePairEnergiesMultiProcesses();
}

void AllPositions::computePairEnergiesSingleProcess() {
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: computePairEnergiesSingleProcess"<<endl; 
	#endif
	int sz_rot = sizeRotamers();
	int sz_pos = sizePositions();
	int i;

	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).patchPosition();

	_pair_energies.insert(
			_pair_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_energies[i].insert(
				_pair_energies[i].begin(),(size_t)(i+1),0.0);

	#ifdef VDWELEC
	_pair_vdw_energies.insert(
			_pair_vdw_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_vdw_energies[i].insert(
				_pair_vdw_energies[i].begin(),(size_t)(i+1),0.0);

	_pair_elec_energies.insert(
			_pair_elec_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_elec_energies[i].insert(
				_pair_elec_energies[i].begin(),(size_t)(i+1),0.0);
	#endif
	#ifdef NOE
	_pair_noe_energies.insert(					/// _pair_noe_energies holds "pair" rotamers NOE restraint energy
			_pair_noe_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_noe_energies[i].insert(
				_pair_noe_energies[i].begin(),(size_t)(i+1),0.0);
	#endif

	_pair_solv_energies.insert(
			_pair_solv_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_solv_energies[i].insert(
				_pair_solv_energies[i].begin(),(size_t)(i+1),0.0);

	initializeCumulativeRotamers();
	int ind_position1, ind_position2;
	int ind_rotamer1, ind_rotamer2;
	list<Rotamer>::iterator it_rotamer1, it_rotamer2;

	int total_pairs = 0;
	ind_position1 = 0;
	for (vector<ResPosition>::iterator it_position1=_positions.begin();
		ind_position1 < sz_pos - 1; ++it_position1, ind_position1++){
		cout << " " << (*it_position1).number() << flush;
		char res_code1 = '@';
		for (it_rotamer1 = (*it_position1).rotamersVar().begin(),
				ind_rotamer1 = _cumulative_rotamers[ind_position1];
				it_rotamer1 != (*it_position1).rotamersVar().end();
				++it_rotamer1, ++ind_rotamer1) {
			(*it_rotamer1).setIndex(ind_rotamer1);
			if (res_code1 != (*it_rotamer1).resCode()) {
				res_code1 = (*it_rotamer1).resCode();
				//SG
				charmm_computations.patchResidue(res_code1,
						(*it_position1).number(),(*it_position1).segid());
				charmm_computations.selectIResidue(
						(*it_position1).number(),(*it_position1).segid());
				charmm_computations.selectIniIResidue(
						(*it_position1).number(),(*it_position1).segid());
				charmm_computations.coorInitIniI();
			}
			if (!charmm_computations.singleCoordinatesFlag())
				charmm_computations.editDihedral(*it_rotamer1,
						(*it_position1).number(),(*it_position1).segid());
			for (ind_position2 = ind_position1 + 1; ind_position2 < sz_pos;
					++ind_position2) {
				//const vector<ResPosition>::iterator&
				//		it_position2 = &_positions[ind_position2];
				ResPosition *it_position2 = &_positions[ind_position2];
					if (!_pair_flags[ind_position2][ind_position1]) {
					//cout << "skipping pos pair "
					//		<< (*it_position1).segid() << " " << (*it_position1).number()
					//		<< " - "
					//		<< (*it_position2).segid() << " " << (*it_position2).number() << endl;
					continue;
				}
				//cout << "calculating pos pair "
				//		<< (*it_position1).segid() << " " << (*it_position1).number()
				//		<< " - "
				//		<< (*it_position2).segid() << " " << (*it_position2).number() << endl;
				char res_code2 = '@';
				for (it_rotamer2 = (*it_position2).rotamersVar().begin(),
						ind_rotamer2 = _cumulative_rotamers[ind_position2];
						it_rotamer2 != (*it_position2).rotamersVar().end();
						++it_rotamer2, ++ind_rotamer2) {
					total_pairs++;
					if (!(total_pairs % 25000))
						cout << "\npairs done " << total_pairs << endl;
					//cout << "rot " << ind_rotamer1 << " to " << ind_rotamer2 << endl;
					//cout << "pos " <<  (*it_position1).number()
					//		<< " " << (*it_position2).number() << endl;
					//cout << *it_rotamer1 << endl;
					//cout << *it_rotamer2 << endl;
					(*it_rotamer2).setIndex(ind_rotamer2);
					if (res_code2 != (*it_rotamer2).resCode()) {
						res_code2 = (*it_rotamer2).resCode();
						charmm_computations.patchResidue(res_code2,
								(*it_position2).number(),(*it_position2).segid());
						charmm_computations.selectJResidue(
								(*it_position2).number(),(*it_position2).segid());
						charmm_computations.selectIniJResidue(
								(*it_position2).number(),(*it_position2).segid());
					}
				      #ifdef NOE	/// NOE DESIGNER, Miguel A. Santos, HSC, Toronto, 2006
					//Noe(noeRest);
					#ifdef NOEDEBUG
					cout<<"DEBUGGING: computePairEnergiesSingleProcess: re-loading NOE restraints for residues "<<(*it_position1).number()<<", "<<(*it_position2).number()<<endl;
					NOEres.printRestraints(NOEres.getRestraints((*it_position1).number(),(*it_position2).number()));
					#endif
					Noe("RESET");
					Noe("SCALE "+ToString(NOEres.getScale()));
					Noe(NOEres.getRestraints((*it_position1).number(),(*it_position2).number()));
				      #endif
					// 01022001 we may compute the pair solvation before the minimization
					_pair_energies[ind_rotamer2][ind_rotamer1] =
							charmm_computations.energyPairRotamers(
									(*it_rotamer1),(*it_rotamer2),
									(*it_position1).number(),(*it_position1).segid(),
									(*it_position2).number(),(*it_position2).segid() );
					if (_eef1_flag) {
						//charmm_computations.eef1Energy();
						//float isurf = charmm_computations.eef1FromISelect();
						//float jsurf = charmm_computations.eef1FromJSelect();
						//float template_residue = charmm_computations.eef1FromAll();
						//_pair_solv_energies[ind_rotamer2][ind_rotamer1] =
						//		(*it_rotamer1).aspot() - isurf +
						//		(*it_rotamer2).aspot() - jsurf;
						_pair_solv_energies[ind_rotamer2][ind_rotamer1] =
								charmm_computations.eef1PairRotamers(
										(*it_rotamer1),(*it_rotamer2),_template_aspot );
						if (_add_surface_potential_flag)
							_pair_energies[ind_rotamer2][ind_rotamer1] -=
									_pair_solv_energies[ind_rotamer2][ind_rotamer1];
					}  else if (charmm_computations.SolvFlag()) {
						float template_residues_aspot = charmm_computations.SolvEnergy();
						// for backwards compatibility we change the sign of the pair solvation energy (later it'll be changed back)
						_pair_solv_energies[ind_rotamer2][ind_rotamer1] = -(template_residues_aspot - _template_aspot
							- (*it_rotamer1).aspot() - (*it_rotamer2).aspot());
						if (_add_surface_potential_flag)
							_pair_energies[ind_rotamer2][ind_rotamer1] +=
									_pair_solv_energies[ind_rotamer2][ind_rotamer1];
					}
					else if (_surface_potential_flag) {
						float solvation_pair =
						_pair_solv_energies[ind_rotamer2][ind_rotamer1] =
								_surface_isolated_flag
								&& (
								_pair_energies[ind_rotamer2][ind_rotamer1]
										> 100.0
								|| charmm_computations.minDistanceIJSelect()
										> _surface_potential_distance
								//||
								//charmm_computations.bspotPairRotamersIsolated(
								//		(*it_rotamer1),(*it_rotamer2),
								//		(*it_position1).number(),(*it_position1).segid(),
								//		(*it_position2).number(),(*it_position2).segid(),
								//		_template_aspot) < 200.0
								) ?
								0.0
								:
								charmm_computations.bspotPairRotamers(
										(*it_rotamer1),(*it_rotamer2),
										(*it_position1).number(),(*it_position1).segid(),
										(*it_position2).number(),(*it_position2).segid(),
										_template_aspot);
						if (_add_surface_potential_flag)
							_pair_energies[ind_rotamer2][ind_rotamer1] -=
									solvation_pair;
					}
					#ifdef VDWELEC
					_pair_elec_energies[ind_rotamer2][ind_rotamer1] =
							charmm_computations.lastElecEnergy();
					_pair_vdw_energies[ind_rotamer2][ind_rotamer1] =
							charmm_computations.lastVdwEnergy();
					#endif
					#ifdef NOE
					_pair_noe_energies[ind_rotamer2][ind_rotamer1] =
							charmm_computations.lastNOEEnergy();
					#endif
					if (ind_rotamer1 >= sz_rot || ind_rotamer2 >= sz_rot)
						exitError("computePairEnergies BUG: index too high");
				}
				charmm_computations.patchDummyResidue(
						(*it_position2).number(),(*it_position2).segid());
			}
		}
		charmm_computations.patchDummyResidue(
				(*it_position1).number(),(*it_position1).segid());
	}
	cout << endl;
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: computePairEnergiesSingleProcess ...FIN"<<endl; 
	#endif
}

void AllPositions::penalizeUnequalPairs(
		const string& segid1, int resid1,
		const string& segid2, int resid2,
		float weight) {
	int i, sz_pos = sizePositions();
	int pos1, pos2;
	for (i = 0; i < sz_pos; ++i)
		if (_positions[i].segid() == segid1
				&& _positions[i].number() == resid1) {
			pos1 = i;
			break;
		}
	for ( ; i < sz_pos; ++i)
		if (_positions[i].segid() == segid2
				&& _positions[i].number() == resid2) {
			pos2 = i;
			break;
		}
	if (i == sz_pos)
		exitError("pair for energy addition not found");

	list<Rotamer>::const_iterator it_rotamer1, it_rotamer2;
	for (it_rotamer1 = _positions[pos1].rotamers().begin();
			it_rotamer1 != _positions[pos1].rotamers().end();
			++it_rotamer1)
		for (it_rotamer2 = _positions[pos2].rotamers().begin();
				it_rotamer2 != _positions[pos2].rotamers().end();
				++it_rotamer2)
			if ((*it_rotamer1).resCode() != (*it_rotamer2).resCode())
				_pair_energies[(*it_rotamer2).index()][(*it_rotamer1).index()]
						+= weight;
}

void AllPositions::initializeCumulativeRotamers() {
	_cumulative_rotamers.erase(_cumulative_rotamers.begin(),
			_cumulative_rotamers.end());
	_cumulative_rotamers.insert(_cumulative_rotamers.begin(),
			(size_t)_positions.size(),0);
	int sum_rotamers = 0;
	for (int i = 0; i < _positions.size(); ++i) {
		_cumulative_rotamers[i] = sum_rotamers;
		sum_rotamers += _positions[i].sizeRotamers();
	}
}

void AllPositions::splitPositions(vector< list<int> >& position_lists) {
	int i, j, sz_pos = _positions.size();
	vector<int> pairs_to_do(sz_pos);
	int sum;
	for (i = sz_pos-1; i >= 0; --i) {
		sum = 0;
		for (j = i+1; j < sz_pos; ++j)
			if (_pair_flags[j][i])
				sum += _positions[j].sizeRotamers();
		pairs_to_do[i] = _positions[i].sizeRotamers() * sum;
	}
	cout << "pairs_to_do ";
	copy (pairs_to_do.begin(),pairs_to_do.end(),ostream_iterator<int>(cout," "));
	cout << endl;
	int total = 0;
	accumulate(pairs_to_do.begin(),pairs_to_do.end(),total);
	cout << "total " << total << endl;

	vector<int> bin_sizes(_size_processes,0);
	position_lists.erase(position_lists.begin(),position_lists.end());
	position_lists.insert(position_lists.begin(),
			size_t(_size_processes),list<int>() );

		// approximate minimum makespan
	int max, min, max_index, min_index;
	for (i = 0; i < sz_pos; ++i) {
		max = -1;
		for (j = 0; j < sz_pos; ++j) {
			if (pairs_to_do[j] > max) {
				max_index = j;
				max = pairs_to_do[j];
			}
		}
		min = LARGE_INT;
		for (j = 0; j < _size_processes; ++j) {
			if (bin_sizes[j] < min) {
				min_index = j;
				min = bin_sizes[j];
			}
		}
		position_lists[min_index].push_back(max_index);
		bin_sizes[min_index] += pairs_to_do[max_index];
		pairs_to_do[max_index] = -1;
	}

	for (i = 0; i < _size_processes; ++i) {
		cout << "list " << i << " size " << bin_sizes[i] << " is ";
		copy (position_lists[i].begin(),position_lists[i].end(),
				ostream_iterator<int>(cout," "));
		cout << endl;
	}
}

void AllPositions::setRemoteMachines(
		const string& machines_file, const string& script_file) {
	_remote_machines.readMachines(
			open_istream(machines_file.c_str()) );
	close_istream();
	_remote_machines.readScript(
			open_istream(script_file.c_str()) );
	close_istream();
	_size_processes += _remote_machines.size();
}

void AllPositions::setRemoteMachinesAlf(
		const string& machines_file, const string& script_file) {
	_remote_machines_alf.readMachines(
			open_istream(machines_file.c_str()) );
	close_istream();
	_remote_machines_alf.readScript(
			open_istream(script_file.c_str()) );
	close_istream();
	_size_processes += _remote_machines_alf.size()*_remote_machines_alf.njobs()-1;
	_remote_machines_alf_flag = 1;
}

void AllPositions::computePairEnergiesMultiProcesses() {
	int sz_rot = sizeRotamers();
	int sz_pos = sizePositions();
	int i;

	//remm vector< list<int> > position_lists;
	//remm splitPositions(position_lists);

	initializeCumulativeRotamers();

	pid_t pid;
	string str;
	//map< pid_t, int, less<pid_t> > child_pids;
	set< int, less<int> > processes;
	int process;

	system("rm stopped*.tmp");

	#ifdef NOEDEBUGFULL
	cout << "DEBUGGING: computeEnergiesMultiprocesses: "
		<<"_size_fork_processes="<<_size_fork_processes
		<<" _size_processes="<<_size_processes
		<<endl;
	#endif
		// fork local processes
	for (process = 0; process < _size_fork_processes; ++process) {
		processes.insert(process);
		pid = fork();
		if (pid == 0) { // I am a child
			//cout << "I am child " << process << endl;
			//remm computePairEnergies(process,position_lists[process]);
			#ifdef NOEDEBUGFULL
			cout << "DEBUGGING: computeEnergiesMultiprocesses: Child process="
				<<process
				<<endl;
			#endif
			computePairEnergies(process,_size_processes);
			exit(0);
		}
		sleep(2);
		//else  // parent
			//child_pids.insert(pair<const pid_t,int>(pid,process));
			//child_pids[pid] = process;
	}

		// now start remote processes
	//remm _remote_machines.startProcesses(
	//		process,_size_processes,position_lists);
	#ifdef NOEDEBUGFULL
	cout << "DEBUGGING: computeEnergiesMultiprocesses: "
		<<" Parent goes on..."
		<<" process="<<process
		<<" _size_processes="<<_size_processes
		<<endl;
	#endif
	_remote_machines.startProcesses(
			process,_size_processes);
	for (; process < _size_processes; ++process)
		processes.insert(process);
		// I am the parent, waiting until all children are dead
		// then processing output files of children
	//map< pid_t, int, less<pid_t> >::iterator it_proc;
	//while (child_pids.size() > 0) {
	//	pid = wait(0);
	//	if ((it_proc = child_pids.find(pid)) != child_pids.end()) {
	//		cout << " process " << (*it_proc).second
	//				<< " (" << (*it_proc).first << ") returned" << endl;
	//		child_pids.erase(it_proc);
	//	}
	//	else
	//		cout << "warning: termination signal from unknown process "
	//				<< pid << endl;
	//}
	//cout << endl;

	char buffer[20];
	vector<string> numbers;
	for (process = 0; process < _size_processes; process++) {
		sprintf(buffer,"%d",process);
		numbers.push_back((string)buffer);
	}

	int returned = 0;
	cout<<"Waiting for "<<_size_processes<<" processes to finish"<<endl;
	//ifstream test;
	while (returned != _size_processes) {
		sleep(3);
		returned = _size_processes;
			// poll stop files
		for (process = 0; process < _size_processes; process++) {
			string filename = string("stopped")+numbers[process]+".tmp";
			//test.open(filename.c_str());
			ifstream test(filename.c_str());
			if (!test)
				returned--;
			else {
				if (processes.find(process) != processes.end()) {
					cout << " process " << process << " returned " << endl;
					processes.erase(process);
				}
				test.close();
				//test.clear();
			}
		}
	}
	cout << endl;

	if (_skip_read_pair_energies){
		cout<< "Skipping read of pair energies"<<endl;
		return;
	}
	_pair_energies.insert(
			_pair_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_energies[i].insert(
				_pair_energies[i].begin(),(size_t)(i+1),0.0);

	#ifdef VDWELEC
	_pair_vdw_energies.insert(
			_pair_vdw_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_vdw_energies[i].insert(
				_pair_vdw_energies[i].begin(),(size_t)(i+1),0.0);

	_pair_elec_energies.insert(
			_pair_elec_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_elec_energies[i].insert(
				_pair_elec_energies[i].begin(),(size_t)(i+1),0.0);
	#endif

	#ifdef NOEWRTINFO
	_pair_noe_energies.insert(
			_pair_noe_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_noe_energies[i].insert(
				_pair_noe_energies[i].begin(),(size_t)(i+1),0.0);
	#endif

	_pair_solv_energies.insert(
			_pair_solv_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_solv_energies[i].insert(
				_pair_solv_energies[i].begin(),(size_t)(i+1),0.0);

	for (process = 0; process < _size_processes; ++process) {
		char buffer[20];
		sprintf(buffer,"%d",process);
		//cout << " treating process " << process << endl;
		ifstream pair_energies_is(
				(string("pair_energies")+buffer+".tmp").c_str());
		#ifdef VDWELEC
		ifstream pair_elec_energies_is(
				(string("pair_elec_energies")+buffer+".tmp").c_str());
		ifstream pair_vdw_energies_is(
				(string("pair_vdw_energies")+buffer+".tmp").c_str());
		#endif
		#ifdef NOEWRTINFO
		ifstream pair_noe_energies_is(
				(string("pair_noe_energies")+buffer+".tmp").c_str());
		#endif
		ifstream pair_solv_energies_is(
				(string("pair_solv_energies")+buffer+".tmp").c_str());
	
		list<int>::iterator it_list_position1;
		list<Rotamer>::iterator it_rotamer1, it_rotamer2;
		int ind_rotamer1, ind_rotamer2;
		int ind_position1, ind_position2;
			
		//for (ind_position1 = 0; ind_position1 < sz_pos - 1; ++ind_position1) {
		//	const vector<ResPosition>::iterator& it_position1
		//			= &_positions[ind_position1];
		ind_position1 = 0;
		for (vector<ResPosition>::iterator it_position1=_positions.begin();
			ind_position1 < sz_pos - 1; ++it_position1, ind_position1++){
			//cout << " reading " << (*it_position1).number() << flush;
			for (it_rotamer1 = (*it_position1).rotamersVar().begin(),
					ind_rotamer1 = _cumulative_rotamers[ind_position1];
					it_rotamer1 != (*it_position1).rotamersVar().end();
					++it_rotamer1, ++ind_rotamer1) {
				if ((ind_rotamer1 % _size_processes) != process)
					continue;
				//cout << "g" << process;
				(*it_rotamer1).setIndex(ind_rotamer1);
				for (ind_position2 = ind_position1 + 1; ind_position2 < sz_pos;
					++ind_position2) {
					if (!_pair_flags[ind_position2][ind_position1]) {
						continue;
					}
					//const vector<ResPosition>::iterator&
					//		it_position2 = &_positions[ind_position2];
					ResPosition *it_position2 = &_positions[ind_position2];
					for (it_rotamer2 = (*it_position2).rotamersVar().begin(),
							ind_rotamer2 = _cumulative_rotamers[ind_position2];
							it_rotamer2 != (*it_position2).rotamersVar().end();
							++it_rotamer2, ++ind_rotamer2) {
						(*it_rotamer2).setIndex(ind_rotamer2);
						//cout << "pair " << ind_rotamer1+1 << " " << ind_rotamer2+1 << endl;
						//cout << "pos " <<  (*it_position1).number()
						//		<< " " << (*it_position2).number() << " " << _segid << endl;
						//cout << *it_rotamer1 << endl;
						//cout << *it_rotamer2 << endl;
						pair_energies_is >>
								_pair_energies[ind_rotamer2][ind_rotamer1];
						if (!pair_energies_is) {
							cout << "indices " << ind_rotamer2 << " " << ind_rotamer1 << endl;
							exitError("read on pair_energies failed");
						}
						#ifdef VDWELEC
						pair_elec_energies_is >>
								_pair_elec_energies[ind_rotamer2][ind_rotamer1];
						if (!pair_elec_energies_is) {
							cout << "indices " << ind_rotamer2 << " " << ind_rotamer1 << endl;
							exitError("read on pair_elec_energies failed");
						}
						#endif

						pair_solv_energies_is >>
								_pair_solv_energies[ind_rotamer2][ind_rotamer1];
						if (!pair_solv_energies_is) {
							cout << "indices " << ind_rotamer2 << " " << ind_rotamer1 << endl;
							exitError("read on pair_solv_energies failed");
						}
						if (_add_surface_potential_flag)
							_pair_energies[ind_rotamer2][ind_rotamer1] -=
									_pair_solv_energies[ind_rotamer2][ind_rotamer1];
						#ifdef VDWELEC
						pair_vdw_energies_is >>
								_pair_vdw_energies[ind_rotamer2][ind_rotamer1];
						if (!pair_vdw_energies_is) {
							cout << "indices " << ind_rotamer2 << " " << ind_rotamer1 << endl;
							exitError("read on pair_vdw_energies failed");
						}
						#endif
						#ifdef NOEWRTINFO
						pair_noe_energies_is >>
								_pair_noe_energies[ind_rotamer2][ind_rotamer1];
						if (!pair_noe_energies_is) {
							cout << "indices " << ind_rotamer2 << " " << ind_rotamer1 << endl;
							exitError("read on pair_noe_energies failed");
						}
						#endif
						if (ind_rotamer1 >= sz_rot || ind_rotamer2 >= sz_rot)
							exitError("computePairEnergies BUG: index too high");
					}
				}
			}
		}
	}
}

void AllPositions::pairListEnergies() {
	int process, size_processes;
	scanf("%d",&process); // from CHARMM, input only with scanf
	scanf("%d",&size_processes); // from CHARMM, input only with scanf
	computePairEnergies(process,size_processes);
}

void AllPositions::computePairEnergies(int process, int size_processes) {
	int sz_rot = sizeRotamers();
	int sz_pos = sizePositions();

	char buffer[20];
	sprintf(buffer,"%d",process);
	ofstream pair_energies_os(
			(string("pair_energies")+buffer+".tmp").c_str());
	#ifdef VDWELEC
	ofstream pair_elec_energies_os(
			(string("pair_elec_energies")+buffer+".tmp").c_str());
	ofstream pair_vdw_energies_os(
			(string("pair_vdw_energies")+buffer+".tmp").c_str());
	#endif
	#ifdef NOEWRTINFO
	ofstream pair_noe_energies_os(
			(string("pair_noe_energies")+buffer+".tmp").c_str());
	#endif
	ofstream pair_solv_energies_os(
			(string("pair_solv_energies")+buffer+".tmp").c_str());

	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).patchPosition();

	initializeCumulativeRotamers();
	int ind_rotamer1, ind_rotamer2;
	int ind_position1, ind_position2;
	list<Rotamer>::iterator it_rotamer1, it_rotamer2;
	float pair_energy, pair_solv_energy;

	//cout << "process " << process << " doing " << endl;
	int total_pairs = 0;
	//for (ind_position1 = 0; ind_position1 < sz_pos - 1; ++ind_position1) {
	//	const vector<ResPosition>::iterator& it_position1
	//			= &_positions[ind_position1];
	ind_position1 = 0;
	for (vector<ResPosition>::iterator it_position1=_positions.begin();
		ind_position1 < sz_pos - 1; ++it_position1, ind_position1++){

		char res_code1 = '@';
		for (it_rotamer1 = (*it_position1).rotamersVar().begin(),
				ind_rotamer1 = _cumulative_rotamers[ind_position1];
				it_rotamer1 != (*it_position1).rotamersVar().end();
				++it_rotamer1, ++ind_rotamer1) {
			//cout << "t" << ind_rotamer1;
			if ((ind_rotamer1 % size_processes) != process)
				continue;
			cout << process << "(" << (*it_position1).number()
					<< "/" << ind_rotamer1 << ") " << flush;
			//cout << "!" << ind_rotamer1 << "!";
			if (res_code1 != (*it_rotamer1).resCode()) {
				res_code1 = (*it_rotamer1).resCode();
				charmm_computations.patchResidue(res_code1,
						(*it_position1).number(),(*it_position1).segid());
				charmm_computations.selectIResidue(
						(*it_position1).number(),(*it_position1).segid());
				charmm_computations.selectIniIResidue(
						(*it_position1).number(),(*it_position1).segid());
				charmm_computations.coorInitIniI();
			}
			if (!charmm_computations.singleCoordinatesFlag())
				charmm_computations.editDihedral(*it_rotamer1,
						(*it_position1).number(),(*it_position1).segid());
			for (ind_position2 = ind_position1 + 1; ind_position2 < sz_pos;
					++ind_position2) {
				//cout << "ind_pos2 " << ind_position2 << endl;
				//const vector<ResPosition>::iterator&
				//		it_position2 = &_positions[ind_position2];
				ResPosition *it_position2 = &_positions[ind_position2];
				if (!_pair_flags[ind_position2][ind_position1]) {
					//cout << "process " << process << " skipping pos pair "
					//		<< (*it_position1).segid() << " " << (*it_position1).number()
					//		<< " - "
					//		<< (*it_position2).segid() << " " << (*it_position2).number() << endl;
					continue;
				}
				//cout << "process " << process << " calculating pos pair "
				//		<< (*it_position1).segid() << " " << (*it_position1).number()
				//		<< " - "
				//		<< (*it_position2).segid() << " " << (*it_position2).number() << endl;
				char res_code2 = '@';
				for (it_rotamer2 = (*it_position2).rotamersVar().begin();
						it_rotamer2 != (*it_position2).rotamersVar().end();
						++it_rotamer2) {
					total_pairs++;
					if (!(total_pairs % 25000))
						cout << "\nprocess " << process
								<< " pairs done " << total_pairs << endl;
					if (res_code2 != (*it_rotamer2).resCode()) {
						res_code2 = (*it_rotamer2).resCode();
						charmm_computations.patchResidue(res_code2,
								(*it_position2).number(),(*it_position2).segid());
						charmm_computations.selectJResidue(
								(*it_position2).number(),(*it_position2).segid());
						charmm_computations.selectIniJResidue(
								(*it_position2).number(),(*it_position2).segid());
					}
				      #ifdef NOE	/// NOE DESIGNER, Miguel A. Santos, HSC, Toronto, 2006
					//Noe(noeRest);
					#ifdef NOEDEBUG
					cout<<"DEBUGGING: computePairEnergiesProcess: re-loading NOE restraints for residues "<<(*it_position1).number()<<", "<<(*it_position2).number()<<endl;
					NOEres.printRestraints(NOEres.getRestraints((*it_position1).number(),(*it_position2).number()));
					#endif
					Noe("RESET");
					Noe("SCALE "+ToString(NOEres.getScale()));
					Noe(NOEres.getRestraints((*it_position1).number(),(*it_position2).number()));
				      #endif
					//cout << "pair " << ++count << endl;
					//pair_energies_os << (pair_energy =
					// 31102000  in c25 pair_energy went to pair_energies_os
					
					// 01022001 we may compute the pair solvation before the minimization
					pair_energy =
							charmm_computations.energyPairRotamers(
									(*it_rotamer1),(*it_rotamer2),
									(*it_position1).number(),(*it_position1).segid(),
									(*it_position2).number(),(*it_position2).segid());
					//		<< " ";
					#ifdef VDWELEC
					pair_elec_energies_os <<
							charmm_computations.lastElecEnergy() << " ";
					#endif
					#ifdef NOEWRTINFO
					pair_noe_energies_os <<
							charmm_computations.lastNOEEnergy() << " ";
					#endif

					if (_eef1_flag) {
						pair_solv_energy =
								charmm_computations.eef1PairRotamers(
										(*it_rotamer1),(*it_rotamer2),_template_aspot );
					}  else if (charmm_computations.SolvFlag()) {
						float template_residues_aspot = charmm_computations.SolvEnergy();
						// for backwards compatibility we change the sign of the pair solvation energy (later it'll be changed back)
						pair_solv_energy = -(template_residues_aspot - _template_aspot
							- (*it_rotamer1).aspot() - (*it_rotamer2).aspot());
					}
					else if (_surface_potential_flag) {
						pair_solv_energy =
								(_surface_isolated_flag
								&& (
								pair_energy > 100.0
								|| charmm_computations.minDistanceIJSelect()
										> _surface_potential_distance
								//||
								//charmm_computations.bspotPairRotamersIsolated(
								//		(*it_rotamer1),(*it_rotamer2),
								//		(*it_position1).number(),(*it_position1).segid(),
								//		(*it_position2).number(),(*it_position2).segid(),
								//		_template_aspot) < 200.0
								) ?
								0.0
								:
								charmm_computations.bspotPairRotamers(
										(*it_rotamer1),(*it_rotamer2),
										(*it_position1).number(),(*it_position1).segid(),
										(*it_position2).number(),(*it_position2).segid(),
										_template_aspot)
								);
						//if (_add_surface_potential_flag)
						//	pair_energy -= pair_solv_energy;
					} else
						pair_solv_energy = 0.0;

					pair_energies_os << pair_energy << " ";
					pair_solv_energies_os	<< pair_solv_energy << " ";

					#ifdef VDWELEC
					pair_vdw_energies_os <<
							charmm_computations.lastVdwEnergy() << " ";
					#endif
				}
				charmm_computations.patchDummyResidue(
						(*it_position2).number(),(*it_position2).segid());
			}
		}
		charmm_computations.patchDummyResidue(
				(*it_position1).number(),(*it_position1).segid());
	}
	//system(
	//		(string("touch stopped")+buffer+".tmp").c_str());

	pair_energies_os.close();
	#ifdef VDWELEC
	pair_elec_energies_os.close();
	pair_vdw_energies_os.close();
	#endif
	#ifdef NOEWRTINFO
	pair_noe_energies_os.close();
	#endif
	pair_solv_energies_os.close();

	open_ostream(string("stopped")+buffer+".tmp");
	close_ostream();
}

void AllPositions::computePairEnergiesGLY(int process, int size_processes) {
	// 02052001 Note about the correction for the CA of the GLY's.& PRO's:
	// If either rot1 or rot2 are GLY/PRO then we'll substitute the pair energy inte(rot1,rot2) by
	// inte(rot1+back1,rot2+back2)-inte(back1.ALX,back2.ALX)-inte(rot1,back2.ALX)-inte(rot2,back1.ALX)
	// where rot1 and back1 are the side chain and backbone parts of position 1 respectively.
	// The last two terms substract the, already computed, single energies.
	// The equation could be simplified to:
	// inte(rot1,rot2)+inte(rot1+back1,rot2+back2)-inte(rot1+back1.ALX,rot2+back2.ALX)
	// (if backN.ALX=backN then we get back the usual pair energy inte(rot1,rot2) )
	// Notice that at the end (write_combinations, generate_combinations...) we'll have to change
	// the energy computation to inte(protein,protein)-inte(back.ALX,back.ALX)
	// where back.ALX=\sum_N backN.ALX
	// we may have to correct for solvation (the solvation of the residue's backbone depends on the amino acid type, although not in Ooi)
	// We'll have to patch ALX's and, at the end, patch back the original rotamers (as it's needed for the solvation)
		
	// Implementation details for time optimization:
	// 1- The rotamer's side chains only get coordinates after energyPairRotamers, already in the inner loop
	//      - We'll use flags to compute the energy terms only once:
	// 2- At the end we'll have to put rot1 and rot2 in the I and J selection flags respectively
	//      - Alternatively we could create selectKSelection, selectLSelection and inteKLSel()
	// 3- We have to compute: 
	//    inte(rot1,back2)-inte(rot1,back2.ALX)+inte(back1,rot2)-inte(back1.ALX,rot2)+inte(back1,back2)-inte(back1.ALX,back2.ALX)
	//    The first two need to be computed only if rot2=G,P. The next two only if rot1=G,P and the last two in either case.
	// 4- inte(back1.ALX,rot2) has to be done in a new loop and only by the node computing the given rot1(=G,P)
	// 5- Warning: when we patch (&delete) atoms, we change the atom numeration, rendering the selection arrays obsolete
	//    for those atoms with number greater than the ones manipulated.
	//    IMPORTANT: we always assume that the residue number increase with position number, so we have
	//    to put the residues in 'position_amino_acids' sorted!!!!! (also if we have several position_amino_acids's)
	int sz_rot = sizeRotamers();
	int sz_pos = sizePositions();

	char buffer[20];
	sprintf(buffer,"%d",process);
	ofstream pair_energies_os(
			(string("pair_energies")+buffer+".tmp").c_str());
	#ifdef VDWELEC
	ofstream pair_elec_energies_os(
			(string("pair_elec_energies")+buffer+".tmp").c_str());
	ofstream pair_vdw_energies_os(
			(string("pair_vdw_energies")+buffer+".tmp").c_str());
	#endif
	ofstream pair_solv_energies_os(
			(string("pair_solv_energies")+buffer+".tmp").c_str());

	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position)
		(*it_position).patchPosition();

	initializeCumulativeRotamers();
	int ind_rotamer1, ind_rotamer2;
	int ind_position1, ind_position2;
	list<Rotamer>::iterator it_rotamer1, it_rotamer2;
	float pair_energy, pair_solv_energy;

	//cout << "process " << process << " doing " << endl;
	int total_pairs = 0;
	//for (ind_position1 = 0; ind_position1 < sz_pos - 1; ++ind_position1) {
	//	const vector<ResPosition>::iterator& it_position1
	//			= &_positions[ind_position1];
	ind_position1 = 0;
	for (vector<ResPosition>::iterator it_position1=_positions.begin();
		ind_position1 < sz_pos - 1; ++it_position1, ind_position1++){

		// inte1, inte2, inte3, inte4, inte5, inte6 are inte(rot1,back2), inte(rot1,back2.ALX), inte(back1,rot2), 
		// inte(back1.ALX,rot2), inte(back1,back2), inte(back1.ALX,back2.ALX) respectively.
		float inte1, inte2, inte3, inte4, inte5, inte6;
		inte1=inte2=inte3=inte4=inte5=inte6=0;
		// GLY/PRO flags for optimization
		bool rot1_flag = false;
		bool rot2_flag = false;
		bool notdone_backback_flag = true;
		bool notvisited_position1_flag = true;
		bool notvisited_position2_flag = true;
		bool inte4_flag = true;
		char res_code1 = '@';
		for (it_rotamer1 = (*it_position1).rotamersVar().begin(),
				ind_rotamer1 = _cumulative_rotamers[ind_position1];
				it_rotamer1 != (*it_position1).rotamersVar().end();
				++it_rotamer1, ++ind_rotamer1) {
			//cout << "t" << ind_rotamer1;
			if ((ind_rotamer1 % size_processes) != process)
				continue;
			cout << process << "(" << (*it_position1).number()
					<< "/" << ind_rotamer1 << ") " << flush;
			//cout << "!" << ind_rotamer1 << "!";
			if (res_code1 != (*it_rotamer1).resCode()) {
				res_code1 = (*it_rotamer1).resCode();
				charmm_computations.patchResidue(res_code1,
						(*it_position1).number(),(*it_position1).segid());
				charmm_computations.selectIResidue(
						(*it_position1).number(),(*it_position1).segid());
				charmm_computations.selectIniIResidue(
						(*it_position1).number(),(*it_position1).segid());
				charmm_computations.coorInitIniI();
				if ((res_code1 == 'G'||res_code1 == 'P')&&charmm_computations.AllAtomsFlag()!=2){
					// for each new aa type=G,P in position we'll compute the back,back energy
					notdone_backback_flag = true;
					rot1_flag = true;
				}
				// we always select back1 because rot2 eventually becomes G,P and we need it for inte(back1,back2)
				charmm_computations.selectKResidueBack((*it_position1).number(),(*it_position1).segid());
				if (res_code1 != 'G'&&res_code1 != 'P')
					rot1_flag = false;
			}
			if (!charmm_computations.singleCoordinatesFlag())
				charmm_computations.editDihedral(*it_rotamer1,
						(*it_position1).number(),(*it_position1).segid());// done here instead of in energyPairRotamers
			for (ind_position2 = ind_position1 + 1; ind_position2 < sz_pos;
					++ind_position2) {
				//cout << "ind_pos2 " << ind_position2 << endl;
				//const vector<ResPosition>::iterator&
				//		it_position2 = &_positions[ind_position2];
				ResPosition *it_position2 = &_positions[ind_position2];
				if (!_pair_flags[ind_position2][ind_position1]) {
					//cout << "process " << process << " skipping pos pair "
					//		<< (*it_position1).segid() << " " << (*it_position1).number()
					//		<< " - "
					//		<< (*it_position2).segid() << " " << (*it_position2).number() << endl;
					continue;
				}
				// Nothing above here (pair-positions cut-off)!!!
				
				//cout << "process " << process << " calculating pos pair "
				//		<< (*it_position1).segid() << " " << (*it_position1).number()
				//		<< " - "
				//		<< (*it_position2).segid() << " " << (*it_position2).number() << endl;
				// GLY/PRO
				// here we'll store inte(back1.ALX,rot2) for each rot2 if rot1_flag=true
				vector<float> inte4_energies((*it_position2).sizeRotamers());
				if (rot1_flag&&inte4_flag){
					cout<<"inte4 ("<<(*it_position1).number()<<","<<(*it_position2).number()<<")";//D
					//charmm_computations.printKslct();//D
					//cmCoor("PRIN SELE RESID "+intToString((*it_position1).number())+" END");//D
					// only once at position1 if rot1_flag=true. But if position2 changes then we have to compute it again
					inte4_flag = false;
					// inte(back1.ALX,rot2)
					// loop over rot2 (patching also):
					int rot2_counter = 0;
					char res_code2 = '@';
					for (it_rotamer2 = (*it_position2).rotamersVar().begin();
							it_rotamer2 != (*it_position2).rotamersVar().end();
							++it_rotamer2) {
						if (res_code2 != (*it_rotamer2).resCode()) {
							res_code2 = (*it_rotamer2).resCode();
							charmm_computations.patchResidue(res_code2,(*it_position2).number(),(*it_position2).segid());
							charmm_computations.selectJResidue((*it_position2).number(),(*it_position2).segid());
							charmm_computations.selectIniJResidue((*it_position2).number(),(*it_position2).segid());
						}
						// energyPairRotamers generates the rotamer's coordinates (rot2 coors depend on rot1)
						float dummy_energy = charmm_computations.energyPairRotamers((*it_rotamer1),(*it_rotamer2),
								(*it_position1).number(),(*it_position1).segid(),
								(*it_position2).number(),(*it_position2).segid());
						// manipulation of atoms with lower id: position1 (and later) selection arrays invalidated
						charmm_computations.patchDummyResidue((*it_position1).number(),(*it_position1).segid());
						charmm_computations.selectIResidue((*it_position1).number(),(*it_position1).segid());
						charmm_computations.selectJResidue((*it_position2).number(),(*it_position2).segid());
						charmm_computations.selectKResidueBack((*it_position1).number(),(*it_position1).segid());
						//charmm_computations.coorInitK();
						charmm_computations.cmBuild();
						//charmm_computations.cmUpdate();
						charmm_computations.unfix();
						charmm_computations.Skip();
						//inte4_energies.push_back(charmm_computations.inteJKSel());
						inte4_energies[rot2_counter] = charmm_computations.inteJKSel();
						// Let's restore rot1 (energyPairRotamers needs it until we leave the rot2 loop)
						// manipulation of atoms with lower id: position1 (and later) selection arrays invalidated
						// but we don't care, because we'll either go back and do energyPairRotamers,patchDummyResidue
						// or we compute inte6 (and do patchDummyResidue also)
						charmm_computations.patchResidue(res_code1,(*it_position1).number(),(*it_position1).segid());
						charmm_computations.selectIResidue((*it_position1).number(),(*it_position1).segid());
						charmm_computations.selectIniIResidue((*it_position1).number(),(*it_position1).segid());
						charmm_computations.coorInitIniI();
						rot2_counter++;
						cout<<"#";//D
					}
					charmm_computations.patchDummyResidue((*it_position2).number(),(*it_position2).segid());
				}
				if (notvisited_position1_flag){
					cout<<"inte6 ("<<(*it_position1).number()<<","<<(*it_position2).number()<<")"<<endl;//D
					// only once at position1
					// inte(back1.ALX,back2.ALX). 
					// back2.ALX are already patched but not back1.ALX if rot1_flag=false (most common case)
					// manipulation of atoms with lower id: position1 (and later) selection arrays invalidated
					charmm_computations.patchDummyResidue((*it_position1).number(),(*it_position1).segid());
					//charmm_computations.selectIResidue((*it_position1).number(),(*it_position1).segid());
					//charmm_computations.selectJResidue((*it_position2).number(),(*it_position2).segid());
					charmm_computations.selectKResidueBack((*it_position1).number(),(*it_position1).segid());
					charmm_computations.selectLResidueBack((*it_position2).number(),(*it_position2).segid());
					//charmm_computations.coorInitK();
					//charmm_computations.coorInitL();
					charmm_computations.cmBuild();
					//charmm_computations.cmUpdate();
					charmm_computations.unfix();
					charmm_computations.Skip();

					inte6 = charmm_computations.inteKLSel();
					notvisited_position1_flag = false;
					
					// Let's restore rot1:
					// manipulation of atoms with lower id: position1 (and later) selection arrays invalidated
					charmm_computations.patchResidue(res_code1,(*it_position1).number(),(*it_position1).segid());
					charmm_computations.selectIResidue((*it_position1).number(),(*it_position1).segid());
					charmm_computations.selectIniIResidue((*it_position1).number(),(*it_position1).segid());
					charmm_computations.coorInitIniI();
					charmm_computations.selectKResidueBack((*it_position1).number(),(*it_position1).segid());
					if (!charmm_computations.singleCoordinatesFlag())
						charmm_computations.editDihedral(*it_rotamer1,(*it_position1).number(),(*it_position1).segid());
				}
				// inte(rot1,back2.ALX)
				// we do it always because usually position2 will contain some G,P (but at this moment we don't know)
				// we have an ALX at position 2 without coor
				charmm_computations.selectLResidueBack((*it_position2).number(),(*it_position2).segid());
				//charmm_computations.coorInitL();
				charmm_computations.cmBuild();
				//charmm_computations.cmUpdate();
				charmm_computations.unfix();
				charmm_computations.Skip();
				inte2 = charmm_computations.inteILSel();
				
				int rot2_counter = 0;
				rot2_flag = false;
				char res_code2 = '@';
				for (it_rotamer2 = (*it_position2).rotamersVar().begin();
						it_rotamer2 != (*it_position2).rotamersVar().end();
						++it_rotamer2) {
					total_pairs++;
					if (!(total_pairs % 25000))
						cout << "\nprocess " << process
								<< " pairs done " << total_pairs << endl;
					if (res_code2 != (*it_rotamer2).resCode()) {
						res_code2 = (*it_rotamer2).resCode();
						charmm_computations.patchResidue(res_code2,
								(*it_position2).number(),(*it_position2).segid());
						charmm_computations.selectJResidue(
								(*it_position2).number(),(*it_position2).segid());
						charmm_computations.selectIniJResidue(
								(*it_position2).number(),(*it_position2).segid());
						if ((res_code2 == 'G'||res_code2 == 'P')&&charmm_computations.AllAtomsFlag()!=2){
							charmm_computations.selectLResidueBack((*it_position2).number(),(*it_position2).segid());
							rot2_flag = true;
						// for inte(back1,back2) we need to select back2 if rot1=G,P, although rot2!=G,P
						// we use rot1_flag because we want to compute it for the first rotamer rot1 (as back2=back2.ALX=const)
						} else if (rot1_flag)
							charmm_computations.selectLResidueBack((*it_position2).number(),(*it_position2).segid());
						if (res_code2 != 'G'&&res_code2 != 'P')
							rot2_flag = false;
					}
					//cout << "pair " << ++count << endl;
					//pair_energies_os << (pair_energy =
					// 31102000  in c25 pair_energy went to pair_energies_os
					
					pair_energy =
							charmm_computations.energyPairRotamers(
									(*it_rotamer1),(*it_rotamer2),
									(*it_position1).number(),(*it_position1).segid(),
									(*it_position2).number(),(*it_position2).segid());
					//		<< " ";
					#ifdef VDWELEC
					float pair_ener_lastElecEnergy;
					float pair_ener_lastVdwEnergy;
					pair_ener_lastElecEnergy = charmm_computations.lastElecEnergy();
					pair_ener_lastVdwEnergy = charmm_computations.lastVdwEnergy();
					#endif

					// GLY/PRO (before solvation, as some solvation compute energy terms)
					if (rot1_flag||rot2_flag)
						charmm_computations.unfix();
					// inte(back1,rot2). Computed for all rot2
					if (rot1_flag){
						inte3 = charmm_computations.inteJKSel();
					} else 
						inte3 = 0;
					// inte(rot1,back2). Computed for all rot2=G,P
					if (rot2_flag){
						inte1 = charmm_computations.inteILSel();
					} else
						inte1 = 0;
					// inte(back1,back2)
					// if rot1=G,P and rot2=G,P then we do it
					// if rot1=G,P and rot2!=G,P then we do it once
					// if rot1!=G,P and rot2=G,P then we do it
					// if rot1!=G,P and rot2!=G,P then we don't do it and set inte5=0
					if (rot2_flag){
						cout<<"inte5 (rot2)"<<endl;//D
						inte5 = charmm_computations.inteKLSel();
					}else if (rot1_flag&&notdone_backback_flag){
						cout<<"inte5"<<endl;//D
						//cout<<"inteILSel (inte1)= "<<charmm_computations.inteILSel()<<endl;//D
						//cout<<"inteJKSel (inte3)= "<<charmm_computations.inteJKSel()<<endl;//D
						//cmCoor("PRIN SELE RESID "+intToString((*it_position1).number())+" .OR. RESID "+intToString((*it_position2).number())+" END");//D
						// here we could also have rot2_flag=true
						inte5 = charmm_computations.inteKLSel();
						notdone_backback_flag = false;
					}else if (!rot1_flag){
						inte5 = 0;
						// next time rot1=G,P it may have a different back1
						notdone_backback_flag = true;
					}					
					//charmm_computations.energyInteRotBackbone((*it_position1).number(),(*it_position1).segid(),(*it_position2).number(),(*it_position2).segid());
					if (_eef1_flag) {
						pair_solv_energy =
								charmm_computations.eef1PairRotamers(
										(*it_rotamer1),(*it_rotamer2),_template_aspot );
					}  else if (charmm_computations.SolvFlag()) {
						float template_residues_aspot = charmm_computations.SolvEnergy();
						// for backwards compatibility we change the sign of the pair solvation energy (later it'll be changed back)
						pair_solv_energy = -(template_residues_aspot - _template_aspot
							- (*it_rotamer1).aspot() - (*it_rotamer2).aspot());
					}
					else if (_surface_potential_flag) {
						pair_solv_energy =
								(_surface_isolated_flag
								&& (
								pair_energy > 100.0
								|| charmm_computations.minDistanceIJSelect()
										> _surface_potential_distance
								//||
								//charmm_computations.bspotPairRotamersIsolated(
								//		(*it_rotamer1),(*it_rotamer2),
								//		(*it_position1).number(),(*it_position1).segid(),
								//		(*it_position2).number(),(*it_position2).segid(),
								//		_template_aspot) < 200.0
								) ?
								0.0
								:
								charmm_computations.bspotPairRotamers(
										(*it_rotamer1),(*it_rotamer2),
										(*it_position1).number(),(*it_position1).segid(),
										(*it_position2).number(),(*it_position2).segid(),
										_template_aspot)
								);
						//if (_add_surface_potential_flag)
						//	pair_energy -= pair_solv_energy;
					} else
						pair_solv_energy = 0.0;

					//02052001 Correction for the CA of the GLY's.& PRO's:
					// inte(rot1+back1,rot2+back2)-inte(rot1+back1.ALX,rot2+back2.ALX) = 
					// inte(rot1,back2)+inte(back1,rot2)+inte(back1,back2)-inte(back1.ALX,back2.ALX)-inte(rot1,back2.ALX)-inte(rot2,back1.ALX)
					// To optimize a little bit the code, each term will be computed in a different stage
										
					if ((res_code1 == 'G'||res_code1 == 'P'||res_code2 == 'G'||res_code2 == 'P')&&
						charmm_computations.AllAtomsFlag()!=2){
						float total_correction = 0;
						if (res_code2 == 'G'||res_code2 == 'P')
							total_correction += inte1-inte2;
						if (res_code1 == 'G'||res_code1 == 'P')
							total_correction += inte3-inte4_energies[rot2_counter];
						total_correction += inte5-inte6;
						/* pair_energy += ((res_code2 == 'G'||res_code2 == 'P')?(inte1-inte2):0)+
							((res_code1 == 'G'||res_code1 == 'P')?(inte3-inte4_energies[rot2_counter]):0)+
							(inte5-inte6); */
						pair_energy += total_correction;
						cout<<"Correcting for G/P at "<<(*it_position1).number()<<","<<(*it_position2).number()<<" corr= "<<total_correction
							<<" "<<inte1<<", "<<inte2<<", "<<inte3<<", "<<inte4_energies[rot2_counter]<<", "<<inte5<<", "<<inte6<<endl;
					}
					
					pair_energies_os << pair_energy << " ";
					pair_solv_energies_os	<< pair_solv_energy << " ";

					#ifdef VDWELEC
					pair_elec_energies_os << pair_ener_lastElecEnergy << " ";
					pair_vdw_energies_os << pair_ener_lastVdwEnergy << " ";
					#endif
					rot2_counter++;
				}// end rotamer2 loop
				// we patch an ALX at position 2
				charmm_computations.patchDummyResidue(
						(*it_position2).number(),(*it_position2).segid());
				// GLY/PRO
				notvisited_position2_flag = true;
				notvisited_position1_flag = true;
				inte4_flag = true;
				notdone_backback_flag = true;
				inte1=inte2=inte3=inte4=inte5=inte6=0;// we reset the correction terms once we leave position2
				for (int rot2; rot2<(*it_position2).sizeRotamers();rot2++)
					inte4_energies[rot2] = 0;
			}// end position2 loop
		}// end rotamer1 loop
		charmm_computations.patchDummyResidue(
				(*it_position1).number(),(*it_position1).segid());
		// GLY/PRO
		notvisited_position1_flag = true;
	}// end position1 loop
	//system(
	//		(string("touch stopped")+buffer+".tmp").c_str());

	pair_energies_os.close();
	#ifdef VDWELEC
	pair_elec_energies_os.close();
	pair_vdw_energies_os.close();
	#endif
	pair_solv_energies_os.close();

	open_ostream(string("stopped")+buffer+".tmp");
	close_ostream();
}

void AllPositions::restrictPairEnergies(float max_dist) {
	int sz_pos = sizePositions();
	int pos1, pos2;

	vector<ResPosition>::iterator it_position1,
			it_position1_plus, it_position2;
	for (it_position1 = _positions.begin();
			it_position1 != _positions.end();
			++it_position1) {
		charmm_computations.patchResidue('A',
				(*it_position1).number(),(*it_position1).segid());
	}
	charmm_computations.cmBuild();

	for (it_position1 = _positions.begin(), pos1 = 0;
			it_position1 != _positions.end();
			++it_position1, ++pos1) {
		it_position1_plus = it_position1;
		if (++it_position1_plus == _positions.end())
			break;
		for (it_position2 = it_position1_plus, pos2 = pos1+1;
				it_position2 != _positions.end();
				++it_position2, ++pos2) {
			if (charmm_computations.distance(
					(*it_position1).number(),(*it_position1).segid(),
					(*it_position2).number(),(*it_position2).segid() )
					> max_dist) {
				_pair_flags[pos2][pos1] = 0;
				cout << " flag " << pos2 << " " << pos1 << " set to 0" << endl;
			}
		}
	}

	//for (it_position1 = _positions.begin();
	//		it_position1 != _positions.end();
	//		++it_position1) {
	//	charmm_computations.patchDummyResidue(
	//			(*it_position1).number(),(*it_position1).segid());
	//}
}


		// That's for the C DEE program (will be changed later)
extern "C" {
	float** Reduced_Energies = 0;
	int** dead_pair = 0;
	int* dead_single = 0;
	float** dmatrix(long,long,long,long);
	void free_dmatrix(float**,long,long,long,long);
	void free_imatrix(int **m, long nrl, long nrh, long ncl, long nch);
	int** imatrix(long,long,long,long);
	int* first_rotamer = 0;
	int* last_rotamer = 0;
	int* alive_rotamer = 0;
	void Dead_End(int sz_pos, int* dead_single,
			int** dead_pair, float energy_gap, int short_calculation);
	void Dead_End_Parallel(int sz_pos, int* dead_single,
			int** dead_pair, float energy_gap, int size_processes);
	int verbose = 0;
}

void AllPositions::deadEndElimination() {
	int sz_rot = sizeRotamers();
	int sz_pos = sizePositions();

	if (dead_pair)
		 free_imatrix(dead_pair,0,sz_rot+10,0,sz_rot+10);
	dead_pair = imatrix(0,sz_rot+10,0,sz_rot+10);
	if (dead_single)
		 free(dead_single);
	dead_single = (int*)calloc(sz_rot+1+50,sizeof(int));
	if (alive_rotamer)
		 free(alive_rotamer);
	alive_rotamer = (int*)calloc(sz_rot+1+50,sizeof(int));

	if (first_rotamer)
		free(first_rotamer);
	first_rotamer = (int*)calloc(sz_pos+1+50,sizeof(int));
	if (last_rotamer)
		free(last_rotamer);
	last_rotamer = (int*)calloc(sz_pos+1+50,sizeof(int));

	if (Reduced_Energies)
		free_dmatrix(Reduced_Energies,0,sz_rot+50,0,sz_rot+50);
	Reduced_Energies = dmatrix(0,sz_rot+50,0,sz_rot+50);

	int i, j;
	for (i = 0; i <= sz_rot; ++i)
		for (j = 0; j <= sz_rot; ++j)
			Reduced_Energies[i][j] = 0;

	int cumulative_rotamers = 0;
	list<Rotamer>::const_iterator it_rotamer1, it_rotamer2;
	for (i = 0; i < sz_pos; ++i) {
		first_rotamer[i+1] = cumulative_rotamers + 1;
		cumulative_rotamers += _positions[i].sizeRotamers();
		last_rotamer[i+1] = cumulative_rotamers;
		for (it_rotamer2 = _positions[i].rotamers().begin();
				it_rotamer2 != _positions[i].rotamers().end();
				++it_rotamer2) {
			for (j = 0; j < i; ++j) 
				for (it_rotamer1 = _positions[j].rotamers().begin();
						it_rotamer1 != _positions[j].rotamers().end();
						++it_rotamer1) {
					Reduced_Energies[(*it_rotamer2).index()+1][(*it_rotamer1).index()+1] =
							Reduced_Energies[(*it_rotamer1).index()+1][(*it_rotamer2).index()+1] =
									( (*it_rotamer1).energy()
											+ (*it_rotamer2).energy() ) / (sz_pos - 1)
									//+ ( (*it_rotamer1).solvation()
									//		+ (*it_rotamer2).solvation() ) / (sz_pos - 1)
					 				+ _pair_energies[(*it_rotamer2).index()][(*it_rotamer1).index()];
									//+ _pair_solv_energies[(*it_rotamer2).index()][(*it_rotamer1).index()];
				}
		}
	}
	/* for (i = 0; i < sz_pos; ++i) {
		cout << "first " << first_rotamer[i+1];
		cout << " last " << last_rotamer[i+1] << endl;
	}
	for (i = 0; i < sz_rot; ++i)
		for (j = 0; j < i; ++j)
			cout <<  Reduced_Energies[i+1][j+1] << ' ';
	cout << endl; */

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
	removeDeadRotamers(dead_single);
	cout << "dead_singles" << endl;
	for (i = 0; i < sz_rot; ++i)
		cout << dead_single[i+1] << " ";
	cout << endl;	
}

void AllPositions::readDeeResults(istream& is) {
	string key;
	while (is >> key && key != "dead_rotamers")
		;
	if (key != "dead_rotamers")
		exitError("readDeeResults: no key 'dead_rotamers'");

	int sz_rot;
	is >> sz_rot;
	if (sz_rot != sizeRotamers())
		exitError("readDeeResults: number of rotamers not identical");

	dead_single = (int*)calloc(sz_rot+1,sizeof(int));
	int flag;
	int i = 1;
	while (is >> flag) {
		dead_single[i++] = flag;
	}
	if (i != sz_rot+1)
		exitError("readDeeResults: wrong number of rotamer flags");
	removeDeadRotamers(dead_single);
}

void AllPositions::initCombination(
		vector<list<Rotamer>::const_iterator>& vec_it_rotamer) {
	vector<ResPosition>::const_iterator it_position;
	vec_it_rotamer.erase(vec_it_rotamer.begin(),
			vec_it_rotamer.end());
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		vec_it_rotamer.push_back((*it_position).rotamers().begin());
		if ((*it_position).rotamers().begin()
				== (*it_position).rotamers().end())
			exitError("generateCombinations BUG: list empty, exiting!");
	}
}

bool AllPositions::nextCombination(
		vector<list<Rotamer>::const_iterator>& vec_it_rotamer) {
		// increment iterator list by one:
	vector<ResPosition>::const_iterator it_position;
	vector<list<Rotamer>::const_iterator>::iterator it_it_rotamer;
	for (it_position = _positions.begin(),
				it_it_rotamer = vec_it_rotamer.begin();
			it_position != _positions.end();
			++it_position, ++it_it_rotamer) {
			// try to increment iterator at current position
		if (++(*it_it_rotamer) != (*it_position).rotamers().end())
			break;
		else  // iterator already at top: reset it and go to next position
			(*it_it_rotamer) = (*it_position).rotamers().begin();
	}
	return it_position != _positions.end();
}

void AllPositions::writeAllCombinations() {
	if (_combinations.empty())
		exitError("printCombinations: no combinations");

	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: writeAllCombinations"<<endl;
	#endif
	list< vector<list<Rotamer>::const_iterator> >::iterator
			it_vec_it_rotamer;

	vector<ResPosition>::const_iterator it_position;
	vector<int> pos_numbers;
	vector<string> segids;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		pos_numbers.push_back((*it_position).number());
		segids.push_back((*it_position).segid());
	}
	#ifdef NOEDEBUGFULL
	//vector<list<Rotamer>::const_iterator> vec_it_rotamer= *_combinations.begin();
	int numero;
	vector<list<Rotamer>::const_iterator> vec_it_rotamer;
	for( numero=0,it_vec_it_rotamer = _combinations.begin();it_vec_it_rotamer != _combinations.end();it_vec_it_rotamer++,numero++){
	cout<<"DEBUGGING: Sol="<<numero<<" Pos="; vec_it_rotamer = *it_vec_it_rotamer;
	for (int i = 0; i < pos_numbers.size(); ++i)
		cout<<i<<"-NOEEnergy="<<(*(vec_it_rotamer[i])).NOEEnergy()<<" "
			<<"-Energy="<<(*(vec_it_rotamer[i])).energy()<<" "
			<<"-EnergyRef="<<(*(vec_it_rotamer[i])).energyRef()<<" "
			;
	cout<<endl;
	}
	#endif
	// 08052001:
	// we patch ALX to compute the backbone/template energy
	for (vector<ResPosition>::iterator it_positionbis = _positions.begin();
		it_positionbis != _positions.end(); ++it_positionbis)
			(*it_positionbis).patchPosition(); 
	charmm_computations.cmBuild();
	charmm_computations.unfix();
	charmm_computations.Skip();
	
       #ifdef NOEWRTINFO	/// We want those restraints relating to backbone. NOE restraints go by residue # & atomd id, and
	#ifdef NOEDEBUG		/// do not use residue type.
	cout<<"DEBUGGING: writeAllCombinations: re-loading NOE restraints for all residues "<<endl;
	NOEres.printRestraints(NOEres.getRestraints());
	#endif
	Noe("RESET");
	Noe("SCALE "+ToString(NOEres.getScale()));
	Noe(NOEres.getRestraints());
       #endif
	
	cmEner("");
	charmm_computations.setTemplateEnergy(ener_.eprop[epot]);
        #ifdef VDWELEC
        charmm_computations.setTemplateEnergyVdw(ener_.eterm[vdw]);
        charmm_computations.setTemplateEnergyElec(ener_.eterm[elec]);
        #endif
	#ifdef NOEWRTINFO
        charmm_computations.setTemplateEnergyNOE(ener_.eterm[noe]);
	#endif
	#ifdef NOEDEBUG
	cout<<"NOE: writeAllCombinations: TemplateEnergyNOE="<<ener_.eterm[noe]<<endl;
	#endif

	int number;
	float energy;
	float solvation = 0;
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: before "<<_solvation_file.rdbuf()->is_open()<<" - "<<_pdb_file_prefix<<" - "<<_full_info_file_prefix<<endl;
	#endif
	
	for(it_vec_it_rotamer = _combinations.begin(), number = 0;
			it_vec_it_rotamer != _combinations.end();
			++it_vec_it_rotamer, ++number) {
	//cout<<number<<" ";
		if (_short_info_file.rdbuf()->is_open()) {
			energy = charmm_computations.writeShortInfo(_short_info_file,
					_pair_energies,number,*it_vec_it_rotamer,pos_numbers,segids);
			#ifdef NOEDEBUGFULL
			cout<<"DEBUGGING: after shor_info"<<number<<endl;
			#endif
			//_short_info_file.close(); // of course, we cannot close it here
		}
		if (_solvation_file.rdbuf()->is_open() || _pdb_file_prefix != ""
				|| _full_info_file_prefix != "") {
			charmm_computations.energyVecRotamers(
					*it_vec_it_rotamer,pos_numbers,segids,false);
			if (_pdb_file_prefix != "" || _full_info_file_prefix != "") {
				if (_eef1_flag) {
						charmm_computations.unfix();
						charmm_computations.eef1Energy();
						solvation = charmm_computations.eef1FromAll()
								- _template_aspot;					
				}   else if (charmm_computations.SolvFlag()) {
					solvation = charmm_computations.SolvEnergy() - _template_aspot;
					// Now we have to compute again the energy (SolvEnergy overwrited the one computed by energyVecRotamers)
					charmm_computations.fixTemplate(pos_numbers,segids,false);
					charmm_computations.Skip();
					cmEner("");
				}
				else if (_surface_potential_flag) {
					charmm_computations.computeSurface();
					solvation = charmm_computations.aspotAll()-_template_aspot;
				}
				// 08052001
				//charmm_computations.unfix();
				//charmm_computations.Skip();
				//cmEner("");
				writeCombination(number,*it_vec_it_rotamer,pos_numbers,segids,solvation);
			}
			if (_solvation_file.rdbuf()->is_open())
				charmm_computations.writeSolvation(_solvation_file,energy,
						*it_vec_it_rotamer,number);
			#ifdef NOEDEBUGFULL
			cout<<"DEBUGGING: after full_info"<<endl;
			#endif
		}
	}
	#ifdef NOEDEBUGFULL
	cout<<"DEBUGGING: writeAllCombinations...FIN"<<endl;
	#endif
}

float AllPositions::energyPositions(vector<int> pos_numbers, vector<string> segids){
	float solv_ini;
	float current_all_energy;
	bool include_backbone = false;
	cmCons("CLDH");
	charmm_computations.unfix();
	charmm_computations.fixTemplate(pos_numbers, segids, include_backbone);
	charmm_computations.Skip();
	cmEner("");
	if (_eef1_flag) {	
		// we need to unfix, so the eef1Energy will evaluate properly the asp!
		charmm_computations.unfix();
		charmm_computations.eef1Energy();
		solv_ini = charmm_computations.eef1FromAll();
	} else if (_surface_potential_flag) {
		charmm_computations.computeSurface();
		solv_ini = charmm_computations.aspotAll();
	}else if (charmm_computations.SolvFlag()) {
		solv_ini = charmm_computations.SolvEnergy();
		// Now we have to compute again the energy (SolvEnergy overwrited the energy)
		charmm_computations.fixTemplate(pos_numbers,segids,false);
		charmm_computations.Skip();
		cmEner("");
	}

	if (_eef1_flag||_surface_potential_flag||charmm_computations.SolvFlag()) {	
		if (_add_surface_potential_flag||charmm_computations.SolvFlag()){
			current_all_energy = ener_.eprop[epot]+solv_ini-_template_aspot;
		} else {
			current_all_energy = ener_.eprop[epot];
		}

	} else {
		current_all_energy = ener_.eprop[epot];
	}
	return current_all_energy;
}

float AllPositions::energyPosition(int pos_number, string segid, char res_code, bool& patch_alx, float& alx_aspot, float rotamer_ref_energy){
	float rotamer_aspot;
	float rotamer_bspot;
	float current_all_energy;
	float rotamer_energy;
	bool include_backbone = false;
	vector<int> pos_one;
	vector<string> segid_one;
	pos_one.push_back(pos_number);
	segid_one.push_back(segid);
	//cmCons("CLDH"); // remove
	charmm_computations.unfix();
	//charmm_computations.selectIResidue(pos_number,segid); // it has already been selected
	charmm_computations.fixTemplate(pos_one, segid_one, include_backbone);
	charmm_computations.Skip();
	cmEner("");
	rotamer_energy = ener_.eprop[epot];
	if (_eef1_flag) {	
		// we need to unfix, so the eef1Energy will evaluate properly the asp!
		charmm_computations.unfix();
		charmm_computations.eef1Energy();
		rotamer_aspot = charmm_computations.eef1FromISelect();
		float rotamer_template_aspot = charmm_computations.eef1FromAll();
		rotamer_bspot = - (rotamer_template_aspot - rotamer_aspot); // we'll add later alx_aspot
	} else if (_surface_potential_flag) {
		pair<float,float> rotamer_aspot_pair = charmm_computations.aspotSingleRotamer(pos_number,segid,res_code);
		rotamer_aspot = rotamer_aspot_pair.first;
		// here if charmm_computations._local_template_flag=1 (default?) then alx_aspot is computed, otherwise we'd have to add it to the result later
		rotamer_bspot = charmm_computations.templateBSPotFactor() * charmm_computations.bspotSingleRotamer(pos_number,segid,rotamer_aspot_pair.first,alx_aspot);
	}
	if (patch_alx){
		// we 'patch' the ALX (i.e. no side chain)
		charmm_computations.patchDummyResidue(pos_number,segid);
		charmm_computations.cmBuild();
		if (_eef1_flag) {
			charmm_computations.unfix();
			charmm_computations.eef1Energy();
			alx_aspot =  charmm_computations.eef1FromAll();
		} else if (_surface_potential_flag) {
			charmm_computations.computeSurface();
			alx_aspot =  charmm_computations.aspotAll();
		}
		patch_alx=false; // only it patches alx the first time
	}
	if (_eef1_flag)
		rotamer_bspot += alx_aspot;
	if (_add_surface_potential_flag)
		rotamer_energy += rotamer_aspot - rotamer_bspot;
	
	//float rotamer_ref_energy = rotamer_ini.energyRef()-rotamer_ini.energy()+rotamer_ini.aspot()-rotamer_ini.templateBSPot();
	rotamer_energy -= -rotamer_ref_energy;
	return rotamer_energy;
}

void AllPositions::distributed(){
        int process, size_processes;
        scanf("%d",&process); // from CHARMM, input only with scanf
        scanf("%d",&size_processes); // from CHARMM, input only with scanf
	threadCombinations(process, size_processes);
}

void AllPositions::threadCombinations(){
	int process = -1;  // master job
	int size_processes =(_remote_machines_alf.size()-1)*_remote_machines_alf.njobs();
	cout<<"size_processes= "<<size_processes<<endl;
	threadCombinations(process, size_processes);
}

void AllPositions::threadCombinations(int process, int size_processes){
	if (_remote_machines_alf_flag) {
		// distributed job:
		_remote_machines_alf.ControlProcesses(size_processes);
		return;
	}
	vector<ResPosition>::iterator it_position;
	list< vector<list<Rotamer>::const_iterator> >::iterator it_vec_it_rotamer;
	vector<int> pos_numbers;
	vector<string> segids;
	bool include_backbone = charmm_computations.IncludeBackboneFlag() == 0 ? false : true;
	char buffer[50];
	if (!(_add_surface_potential_flag))
		cout<<"WARNING: add_surface_potential_flag = 0"<<endl;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		pos_numbers.push_back((*it_position).number());
		segids.push_back((*it_position).segid());
	}
	int sz_pos = pos_numbers.size();
	if (_write_graph_file != ""&&size_processes>1)
		_write_graph_file = _write_graph_file + "." + intToString(process);
	ofstream ofs(_write_graph_file.c_str());
	if (_write_graph_file != "") {
		if (!ofs) exitError("cannot open file " + _write_graph_file);
		//ofs<<"Output graph file created by threadCombinations (non-pairwise)"<<endl;
		ofs<<"combinations"<<endl;
	} else {
		if (_short_info_file.rdbuf()->is_open()&&size_processes==1){ 
			cout<<"WARNING: no write_graph_file has been defined but will write to short_info_file"<<endl;
		} else {
			exitError("no write_graph_file nor short_info_file defined!");
		}
	}
	int number;
	//charmm_computations.activateGB(); // now the total energy will also contain the GB solvation!
	// we save the template into the comparison set
	for (vector<ResPosition>::iterator it_positionbis = _positions.begin();it_positionbis != _positions.end(); ++it_positionbis)
		(*it_positionbis).patchPosition();
	charmm_computations.cmBuild();
	//charmm_computations.icFill();
	//cmIc("SAVE");
	cmCoor("COPY COMP");
	float backbone_energy_nosolv = 0;
	float backbone_energy_solv = 0;
	if (!include_backbone){ // we don't compute the backbone energy unless we minimize the backbone
		charmm_computations.Skip();
		cmEner("");
		backbone_energy_nosolv = ener_.eprop[epot];
		// solvation
		if (_eef1_flag) {	
			// we need to unfix, so the eef1Energy will evaluate properly the asp!
			charmm_computations.eef1Energy();
			backbone_energy_solv = charmm_computations.eef1FromAll();
		} else if (_surface_potential_flag) {
			charmm_computations.computeSurface();
			backbone_energy_solv = charmm_computations.aspotAll();
		}else if (charmm_computations.SolvFlag()) {
			backbone_energy_solv = charmm_computations.SolvEnergy();
		}
	}
	float backbone_energy = backbone_energy_nosolv+backbone_energy_solv;
	cout << "Template energy ( (elec+vdw) + solv ) = "<<backbone_energy_nosolv<<" + "<<backbone_energy_solv<<" = "<<backbone_energy<<endl;
	// beginning combinations loop
	for(it_vec_it_rotamer = _combinations.begin(), number = 0; it_vec_it_rotamer != _combinations.end();
		++it_vec_it_rotamer, ++number) {
		clock_t ticks = clock();
		if ((number % size_processes) != process-1)
			continue;
		// 11052001 We'll use the total energy (all atoms unfixed)
		//cout<< "vdw+elec= "<<charmm_computations.energyVecRotamers(*it_vec_it_rotamer,pos_numbers,segids,false)<<" ";
		
		// we should restore the backbone only if we minimize it (IncludeBackboneFlag()=1)
		// we restore the template from the comp[arison set. But because of the numbering
		// we have to delete everything except the template
		for (vector<ResPosition>::iterator it_positionbis = _positions.begin();it_positionbis != _positions.end(); ++it_positionbis)
			(*it_positionbis).patchPosition();
		//cmCoor("PRIN");
		//cmCoor("INIT SELE ALL END");
		cmCoor("COPY");
		charmm_computations.icFill();
		charmm_computations.cmBuild();
		//cmIc("BUIL SAVE");
		/* cmIc("PRIN");
		cmIc("REST OVER");
		cmIc("PRIN");
		charmm_computations.cmBuild();
		cmIc("PRIN");
		cmCoor("PRIN");*/
		// 10102001 for the moment we'll test include_backbone=true in energyVecRotamers, so the energy reported will include the backbone (but backbone minim only if charmm_computations.IncludeBackboneFlag()=1)
		float nonsolv_energy = charmm_computations.energyVecRotamers(*it_vec_it_rotamer,pos_numbers,segids,true);
		//charmm_computations.unfix();
		// for the moment the only solv implementation is GB
		//charmm_computations.Skip();
		//charmm_computations.activateGB(); // now the total energy will also contain the GB solvation!
		//cmEner("");
		//nonsolv_energy = ener_.eprop[epot];
		float ref_energy = 0;
		float solv_ener = 0;
		for (int i = 0; i < sz_pos; ++i){
			ref_energy += (*((*it_vec_it_rotamer)[i])).energyRef()-(*((*it_vec_it_rotamer)[i])).energy()+(*((*it_vec_it_rotamer)[i])).aspot()-(*((*it_vec_it_rotamer)[i])).templateBSPot();
		}
		//float tot_energy = energyPositions(pos_numbers,segids)-ref_energy;
		if (_eef1_flag) {	
			// we need to unfix, so the eef1Energy will evaluate properly the asp!
			charmm_computations.eef1Energy();
			solv_ener = charmm_computations.eef1FromAll();
		} else if (_surface_potential_flag) {
			charmm_computations.computeSurface();
			solv_ener = charmm_computations.aspotAll();
		}else if (charmm_computations.SolvFlag()) {
			// for the moment the only solv implementation is GB
			solv_ener = charmm_computations.SolvEnergy();
		}
		float tot_energy = nonsolv_energy + solv_ener -backbone_energy - ref_energy;
		cout<< "tot_energy= "<<tot_energy<<" solv= "<< solv_ener-backbone_energy_solv<<" ref_energy= "<<ref_energy<<endl;
		if (_short_info_file.rdbuf()->is_open()&&size_processes==1) {
			sprintf(buffer,"#%-6d %10.4lf  ",number,tot_energy);
			_short_info_file << buffer;
			for (int i = 0; i < sz_pos; ++i)
				_short_info_file << segids[i] << " " << pos_numbers[i] << (*((*it_vec_it_rotamer)[i])).resCode() << " ";
			_short_info_file << endl;
		}
		if (_write_graph_file != "") {
			//ofstream ofs(_write_graph_file.c_str(),ios::app);
			//if (!ofs) exitError("cannot reopen file " + _write_graph_file);
			ofs<<"cost "<<-tot_energy<<" "; // according to opt, we store MINUS the energy
			for (int i = 0; i < sz_pos; ++i)
				ofs<< (*((*it_vec_it_rotamer)[i])).index() << " ";
			ofs<<endl;
		}
		cout << "time spent: " << float(clock() - ticks)/CLOCKS_PER_SEC << " seconds"<<endl;
	} // end of combinations loop
	if (_write_graph_file != "")
		ofs.close();
}

void AllPositions::computeMinimum(int n_iter) {
	vector<ResPosition>::iterator it_position;
	list< vector<list<Rotamer>::const_iterator> >::iterator it_vec_it_rotamer;
	vector<Coordinate> rotamer_coordinates;
	Rotamer rotamer_ini;
	Rotamer best_rotamer;
	vector<int> pos_numbers;
	vector<string> segids;
	char buffer[50];
	long what_time;
	(void)time(&what_time);
	srand48(what_time);
	if (!(_add_surface_potential_flag))
		cout<<"WARNING: add_surface_potential_flag = 0"<<endl;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		pos_numbers.push_back((*it_position).number());
		segids.push_back((*it_position).segid());
	}
	int sz_pos = pos_numbers.size();
	vector<Rotamer> best_rotamer_all(sz_pos);	
	vector<float> rotamer_ref_energies(sz_pos);
	vector<int> random_position;
	vector<string> number_str(sz_pos);
	for (int i = 0; i < sz_pos; ++i) {
		sprintf(buffer,"%d",pos_numbers[i]);
		number_str[i] = buffer;
		random_position.push_back(i);
	}	
	ofstream ofs(_write_graph_file.c_str());
	if (_write_graph_file != "") {
		if (!ofs) exitError("cannot open file " + _write_graph_file);
		ofs<<"Output graph file created by computeMinimum (non-pairwise)"<<endl;
		ofs<<"combinations"<<endl;
	} else {
		if (_short_info_file.rdbuf()->is_open()){ 
			cout<<"WARNING: no write_graph_file has been defined but will write to short_info_file"<<endl;
		} else {
			exitError("no write_graph_file nor short_info_file defined!");
		}
	}
	int number;
	// beginning combinations loop
	for(it_vec_it_rotamer = _combinations.begin(), number = 0; it_vec_it_rotamer != _combinations.end();
		++it_vec_it_rotamer, ++number) {
		cout<< "vdw+elec= "<<charmm_computations.energyVecRotamers(*it_vec_it_rotamer,pos_numbers,segids,false)<<" ";
		float ref_energy=0;
		for (int i = 0; i < sz_pos; ++i){
			ref_energy += (*((*it_vec_it_rotamer)[i])).energyRef()-(*((*it_vec_it_rotamer)[i])).energy()+(*((*it_vec_it_rotamer)[i])).aspot()-(*((*it_vec_it_rotamer)[i])).templateBSPot();
			best_rotamer_all[i]=(*((*it_vec_it_rotamer)[i]));
			rotamer_ref_energies[i] = (*((*it_vec_it_rotamer)[i])).energyRef()-(*((*it_vec_it_rotamer)[i])).energy()+(*((*it_vec_it_rotamer)[i])).aspot()-(*((*it_vec_it_rotamer)[i])).templateBSPot();
		}
		float current_ref_energy = ref_energy;
		float energy_gain;
		float tot_energy = energyPositions(pos_numbers,segids)-ref_energy;
		cout<< "tot_energy= "<<tot_energy<<" ref_energy= "<<ref_energy<<endl;
		float prev_all_energy=tot_energy;
		float current_all_energy = tot_energy;
		int iter;
		for ( iter=1; iter<=n_iter; ++iter){  // heuristic loop
			prev_all_energy = current_all_energy;
			random_shuffle(random_position.begin(),random_position.end());
			ref_energy = 0;
			int i_pos;
			ResPosition position;
			for (i_pos=0;i_pos<sz_pos;++i_pos){  // loop over positions
				clock_t ticks = clock();
				position = _positions[random_position[i_pos]];
				rotamer_ini = best_rotamer_all[random_position[i_pos]];
				bool patch_alx = true; // we patch at each new position
				char res_code = '@';
				float alx_aspot=0;
				int number = position.number();
				string segid = position.segid();
				// let's store the coordinates of the initial rotamer
				charmm_computations.getIniICoordinates(segid,number,rotamer_ini.coordinatesRef());
				float rotamer_ref_energy = rotamer_ini.energyRef()-rotamer_ini.energy()+rotamer_ini.aspot()-rotamer_ini.templateBSPot();
				float best_rotamer_ref_energy = rotamer_ref_energy;
				float rotamer_energy=energyPosition(number,segid,res_code,patch_alx,alx_aspot,rotamer_ref_energy);
				// energyPosition has patched an ALX, so it's important to have res_code = '@'
				float rotamer_ini_energy = rotamer_energy; // we need it?
				float prev_energy = rotamer_energy; // to improve we have to get better than the initial rot
				//float prev_energy=LARGE_FLOAT;
				float best_rotamer_energy = rotamer_energy;
				current_ref_energy -= rotamer_ref_energy;
				cout<<"pos "<<number<<" "<<rotamer_ini<<endl;
				best_rotamer = rotamer_ini;
				energy_gain = 0;
				list<Rotamer>::iterator it_rotamer;
				for (it_rotamer = (position.rotamersVar()).begin(); it_rotamer != (position.rotamersVar()).end(); ++it_rotamer) { // loop over rotamers
					// we only patch if we've got a different aa type
					if (res_code != (*it_rotamer).resCode()) {
						// the reference energy will be the sum of all "add_ref_energy_table" for the given aa
						rotamer_ref_energy = (*it_rotamer).energyRef()-(*it_rotamer).energy()+(*it_rotamer).aspot()-(*it_rotamer).templateBSPot();
						res_code = (*it_rotamer).resCode();
						charmm_computations.patchResidue(res_code,number,segid);
						//charmm_computations.selectIResidue(number,segid); 
						charmm_computations.selectIniIResidue(number,segid);
						//charmm_computations.selectComplementJResidue(number,segid); // remove
					}
					// rotamer's atomic coordinates
					//charmm_computations.selectIniIResidue(number,segid);
					charmm_computations.setRotamerIniICoordinates(segid,number,*it_rotamer);
					cmIc("BUILD"); // if no BUILD segmentation fault when warnings are shown (???)
					cmIc("PURGE"); // important: without PURGE stack overflow, undefined coors and a lot of other problems
					// we minimize around dihedrals
					charmm_computations.minimizeAroundDihedrals(*it_rotamer,number,segid);
					rotamer_energy = energyPosition(number,segid,res_code,patch_alx,alx_aspot,rotamer_ref_energy);
					// DEBUG
					float tot_ref_energy=0;
					for (int i = 0; i < sz_pos; ++i)
						tot_ref_energy += rotamer_ref_energies[i];
					float all_energy = energyPositions(pos_numbers,segids)-tot_ref_energy;
					//cout<<"prev_all_energy= "<<prev_all_energy<<"  all_energy= "<< all_energy <<endl;
					//cout<<prev_all_energy<<"+"<<best_rotamer_energy -rotamer_ini_energy<<"="<<prev_all_energy+best_rotamer_energy -rotamer_ini_energy<<endl;
					// END DEBUG
					//if (rotamer_energy<prev_energy-0.01){
					if (all_energy<prev_all_energy-0.01){
						cout<<"prev_all_energy= "<<prev_all_energy<<"  all_energy= "<< all_energy <<endl;
						// we change the rotamer coordinates forever
						charmm_computations.getIniICoordinates(segid,number,(*it_rotamer).coordinatesRef());
						best_rotamer = *it_rotamer;
						cout<<(best_rotamer_all[random_position[i_pos]]).resCode()<<"->"<<best_rotamer.resCode()<<endl;
						best_rotamer_all[random_position[i_pos]] = best_rotamer;
						prev_all_energy = all_energy;
						rotamer_ref_energies[random_position[i_pos]] = rotamer_ref_energy;
						best_rotamer_ref_energy = rotamer_ref_energy;
						best_rotamer_energy = rotamer_energy;
						prev_energy = rotamer_energy;
						cout<<"gained "<<best_rotamer_energy -rotamer_ini_energy<<endl;
					}
				}  // end of loop over rotamers
				ref_energy += best_rotamer_ref_energy;
				current_ref_energy += best_rotamer_ref_energy;
				energy_gain += best_rotamer_energy -rotamer_ini_energy;
				if (best_rotamer.resCode() != res_code)
					charmm_computations.patchResidue(best_rotamer.resCode(),number,segid);
				cout<<"accepted "<<best_rotamer<<" which has "<<(best_rotamer.coordinates()).size()<<" coords"<<endl;
				// rotamer's atomic coordinates
				charmm_computations.selectIniIResidue(number,segid);
				charmm_computations.setRotamerIniICoordinates(segid,number,best_rotamer);
				cmIc("BUILD"); // if no BUILD segmentation fault when warnings are shown (???)
				cmIc("PURGE"); // important: without PURGE stack overflow, undefined coors and a lot of other problems
				// we minimize around dihedrals
				//charmm_computations.minimizeAroundDihedrals(best_rotamer,number,segid);
				//cout<<best_rotamer<<endl;
				cout << "time spent: " << float(clock() - ticks)/CLOCKS_PER_SEC << " seconds"<<endl;
			} // end of loop over positions
			cout<<"the energy E+solv-Eref should be "<<prev_all_energy + energy_gain<<", compare with ";
			float current_all_energy=energyPositions(pos_numbers,segids)-ref_energy;
			cout<<current_all_energy<<endl;
			float tot_ref_energy=0;
			for (int i = 0; i < sz_pos; ++i)
				tot_ref_energy += rotamer_ref_energies[i];
			cout<<"ref_energy= "<<ref_energy<<" = "<<tot_ref_energy<<endl;
			if (int((current_all_energy-prev_all_energy)*100)==0)
				break;
		} // end of heuristic loop
		
		if (_short_info_file.rdbuf()->is_open()) {
			sprintf(buffer,"#%-6d %10.4lf  ",number,tot_energy);
			_short_info_file << buffer;
			for (int i = 0; i < sz_pos; ++i)
				_short_info_file << segids[i] << " " << pos_numbers[i] << (best_rotamer_all[i]).resCode() << " ";
			_short_info_file << endl;
		}
		if (_write_graph_file != "") {
			//ofstream ofs(_write_graph_file.c_str(),ios::app);
			//if (!ofs) exitError("cannot reopen file " + _write_graph_file);
			ofs<<"cost "<<-tot_energy<<" "; // according to opt, we store MINUS the energy
			for (int i = 0; i < sz_pos; ++i)
				ofs<< (*((*it_vec_it_rotamer)[i])).index() << " ";
			ofs<<endl;
		}
	} // end of combinations loop
	if (_write_graph_file != "")
		ofs.close();	
}
void AllPositions::Design(){
	Design(10);
}

void AllPositions::Design(int n_iter) {
	if (!(_add_surface_potential_flag))
		cout<<"WARNING: add_surface_potential_flag = 0"<<endl;
	vector<ResPosition>::iterator it_position;
	ResPosition position;
	list<Rotamer>::iterator it_rotamer;
	list< vector<list<Rotamer>::const_iterator> >::iterator it_vec_it_rotamer;
	bool include_backbone = false;
	Rotamer best_rotamer;
	vector<float> dihedral_angles;
	vector<float> coordinates;
	vector<vector<int> > solutions;
	vector<float> solutions_energies;
	float current_ref_energy;
	float rotamer_energy;
	float rotamer_aspot;
	float rotamer_bspot;
	float rotamer_solv;
	float prev_all_energy;
	float best_all_energy=LARGE_FLOAT;
	char res_code = '@';
	float aspot_ini=0;
	float solv_ini;
	float alx_aspot;
	
	if (!(_add_surface_potential_flag))
		cout<<"WARNING: add_surface_potential_flag = 0"<<endl;
	// random seed given by current time
	long what_time;
        (void)time(&what_time);
        srand48(what_time);      //  27112000  remember to uncomment this later
	//(int)(drand48()*colors)
	
	// designed positions numbers and segid's
	char buffer[50];
	vector<int> pos_numbers;
	vector<string> segids;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		pos_numbers.push_back((*it_position).number());
		segids.push_back((*it_position).segid());
	}
	int sz_pos = pos_numbers.size();
	vector<int> random_position;
	vector<Rotamer> best_rotamer_all(sz_pos);	
	vector<string> number_str(sz_pos);
	for (int i = 0; i < sz_pos; ++i) {
		sprintf(buffer,"%d",pos_numbers[i]);
		number_str[i] = buffer;
		random_position.push_back(i);
	}

	/* for (it_position = _positions.begin();
			it_position != _positions.end(); ++it_position){
		(*it_position).patchPosition();
		charmm_computations.cmBuild();
	}*/
	//map<int,int> pos_ord;
	//map<int,int> rot_ord;

	if (_write_graph_file != "") {
		ofstream ofs(_write_graph_file.c_str());
		if (!ofs) exitError("cannot open file " + _write_graph_file);
		ofs<<"Output graph file created by Design (non pairwise)"<<endl;
		ofs<<"combinations"<<endl;
		ofs.close();
	}
	int number;
	// beginning combinations loop
	for(it_vec_it_rotamer = _combinations.begin(), number = 0; it_vec_it_rotamer != _combinations.end();
		++it_vec_it_rotamer, ++number) {
		float ref_energy=0;
		float rotamer_ref_energy;
		float best_rotamer_ref_energy;
		float best_rotamer_energy;
		float rotamer_ini_energy;
		int i;
		cout<<"Redesign of #"<<number<<" by "<<n_iter<<" iterations"<<endl;
		// we patch the given solution (and do mini if it had been requested so), it had to return epot but we cast it to void
		cout<< "epot_vec= "<<charmm_computations.energyVecRotamers(*it_vec_it_rotamer,pos_numbers,segids,false)<<endl;
		// and compute the reference energy and store current configuration
		for (i = 0; i < sz_pos; ++i){
			ref_energy += (*((*it_vec_it_rotamer)[i])).energyRef()-(*((*it_vec_it_rotamer)[i])).energy()+(*((*it_vec_it_rotamer)[i])).aspot()-(*((*it_vec_it_rotamer)[i])).templateBSPot();
			best_rotamer_all[i]=(*((*it_vec_it_rotamer)[i]));
		}

		cmCons("CLDH");
		charmm_computations.unfix();
		charmm_computations.selectIResidues(pos_numbers,segids);
		charmm_computations.fixTemplate(pos_numbers, segids, include_backbone);
		charmm_computations.Skip();
		cmEner("");
		if (_eef1_flag) {	
			// we need to unfix, so the eef1Energy will evaluate properly the asp!
			charmm_computations.unfix();
			charmm_computations.eef1Energy();
			solv_ini = charmm_computations.eef1FromAll();
			aspot_ini =  charmm_computations.eef1FromISelect();
		} else if (_surface_potential_flag) {
			//solv_ini = ener_.eterm[asp];
			//solv_ini = charmm_computations.eef1FromAll();
			//aspot_ini =  charmm_computations.eef1FromISelect();
			// alternatively
			//charmm_computations.unfix(); // do we need to unfix?
			charmm_computations.computeSurface();
			solv_ini = charmm_computations.aspotAll();
			//cout<<"aspot from eef= "<<solv_ini<<"  aspot from exper (with bad radius)= "<<charmm_computations.aspotAll()-_template_aspot<<endl;
		}else if (charmm_computations.SolvFlag()) {
			solv_ini = charmm_computations.SolvEnergy();
		}
		cout<<"_template_aspot= "<<_template_aspot<<endl;
		cout<<"ref_energy= "<<ref_energy<<endl;
		if (_eef1_flag||_surface_potential_flag||charmm_computations.SolvFlag()) {	
			if (_add_surface_potential_flag){  // WATCH OUT:  we only include solvation if _add_surface_potential_flag=1
				prev_all_energy = ener_.eprop[epot]+solv_ini-_template_aspot - ref_energy;
			} else {
				prev_all_energy = ener_.eprop[epot] - ref_energy;
			}
			cout<<"Epot= "<<ener_.eprop[epot]<<"  vdw= "<<ener_.eterm[vdw]<<"  elec= "<<ener_.eterm[elec]<<" solv= "<<solv_ini-_template_aspot<<"  aspot= "<<aspot_ini<<"  ref_energy= "<<ref_energy<<"  E+solv-Eref= "<<prev_all_energy<<endl;
		} else {
			prev_all_energy = ener_.eprop[epot] - ref_energy;
			cout<<"Epot= "<<ener_.eprop[epot]<<"  vdw= "<<ener_.eterm[vdw]<<"  elec= "<<ener_.eterm[elec]<<"  E+solv-Eref= "<<prev_all_energy<<endl;
		}
		charmm_computations.unfix();
		float prev_energy;
		current_ref_energy = ref_energy;
		float current_all_energy = prev_all_energy;
		int iter;
		for ( iter=1; iter<=n_iter; ++iter){  // heuristic loop
			clock_t ticks = clock();
			prev_all_energy = current_all_energy;
			best_rotamer_ref_energy = 0;
			ref_energy = 0;
			int i_pos=0;
			float energy_gain;
			random_shuffle(random_position.begin(),random_position.end());
			// loop over all positions randomly
			//for (it_position = random_position.begin(); it_position != random_position.end(); ++it_position,++i_pos){
			for (i_pos=0;i_pos<sz_pos;++i_pos){  // loop over positions
				clock_t ticks = clock();
				position = _positions[random_position[i_pos]];
				cout<<"i_pos= "<<i_pos<<" random_position[i_pos]= "<<random_position[i_pos]<<endl;
				prev_energy=LARGE_FLOAT;
				int number = position.number();
				string segid = position.segid();
				Rotamer rotamer_ini = best_rotamer_all[random_position[i_pos]];
				cout<<"rotamer_ini= "<<rotamer_ini.index()<<"("<<rotamer_ini.resCode()<<") position= "<<number<<" "<<segid<<endl;
				cout<<rotamer_ini<<endl;
				vector<int> pos_one;
				vector<string> segid_one;
				pos_one.push_back(number);
				segid_one.push_back(segid);
				// we always start patching at a new position:
				res_code = '@';
				
				// before doing the loop over rotamers we'd like to know the energy of the current one
				cmCons("CLDH"); // we can remove this
				charmm_computations.unfix();
				charmm_computations.selectIResidue(number,segid);
				charmm_computations.fixTemplate(pos_one, segid_one, include_backbone);
				charmm_computations.Skip();
				cmEner("");
				rotamer_energy = ener_.eprop[epot];
				if (_eef1_flag) {
					charmm_computations.unfix();
					charmm_computations.eef1Energy();
					rotamer_aspot = charmm_computations.eef1FromISelect();
					float rotamer_template_aspot = charmm_computations.eef1FromAll();
					rotamer_bspot = - (rotamer_template_aspot - rotamer_aspot); // we'll add later alx_aspot
				} else if (_surface_potential_flag) {
					pair<float,float> rotamer_aspot_pair = charmm_computations.aspotSingleRotamer(rotamer_ini,number,segid);
					rotamer_aspot = rotamer_aspot_pair.first;
					rotamer_bspot = charmm_computations.templateBSPotFactor() * charmm_computations.bspotSingleRotamer(rotamer_ini,number,segid,rotamer_aspot_pair.first,alx_aspot);
				}
				// we 'patch' the ALX (i.e. no side chain)
				charmm_computations.patchDummyResidue(number,segid);
				charmm_computations.cmBuild();
				if (_eef1_flag) {
					charmm_computations.unfix();
					charmm_computations.eef1Energy();
					alx_aspot =  charmm_computations.eef1FromAll();
				} else if (_surface_potential_flag) {
					charmm_computations.computeSurface();
					alx_aspot =  charmm_computations.aspotAll();
				}
				if (_eef1_flag)
					rotamer_bspot += alx_aspot;
				if (_add_surface_potential_flag)
					rotamer_energy += rotamer_aspot - rotamer_bspot;
				
				rotamer_ref_energy = rotamer_ini.energyRef()-rotamer_ini.energy()+rotamer_ini.aspot()-rotamer_ini.templateBSPot();
				rotamer_ini_energy = rotamer_energy -rotamer_ref_energy;
				best_rotamer_energy = rotamer_ini_energy;
				current_ref_energy -= rotamer_ref_energy;
				res_code = rotamer_ini.resCode();
				energy_gain = 0;
				for (it_rotamer = (position.rotamersVar()).begin(); it_rotamer != (position.rotamersVar()).end(); ++it_rotamer) { // loop over rotamers
					// we only patch if we've got a different aa type
					if (res_code != (*it_rotamer).resCode()) {
						// the reference energy will be the sum of all "add_ref_energy_table" for the given aa
						rotamer_ref_energy = (*it_rotamer).energyRef()-(*it_rotamer).energy()+(*it_rotamer).aspot()-(*it_rotamer).templateBSPot();
						res_code = (*it_rotamer).resCode();
						// add rotamer's aa IC's from RTF into main IC
						charmm_computations.patchResidue(res_code,number,segid);
						// select the side chain and put that selection into charmm_computations::_islct for later use
						charmm_computations.selectIResidue(number,segid);
						// select everything which is not the given side chain and put it into charmm_computations::_jslct for later use
						// we don't need it if we don't have to make a double selection. If no_self_flag=0 (the default) we can comment it here.
						charmm_computations.selectComplementJResidue(number,segid);
					}
					if (charmm_computations.miniFlag()) {
						// the minimization does: 
						// 1-rebuild side chain coordinates with the *it_rotamer dihedrals, 
						// 2-dihe constraints around those dihedrals
						// 3-minimize, evaluate energy and return it (ener_.eprop[epot])
						rotamer_energy = charmm_computations.minimizeSingleRotamer(*it_rotamer,number,segid);		
						/* the following is to store the minimize position into the rotamer
						// we put the coordinates of selected ( in _islct) atoms into *it_rotamer::_coordinates
						charmm_computations.getIniICoordinates(it_position->segid,it_position->number,it_rotamer->coordinatesRef());
						if (single_dihedrals_flag|| charmm_computations.singleCoordinatesFlag()) {
							charmm_computations.icFill();
							charmm_computations.getRotamerDihedrals(it_position->segid,it_position->number,*it_rotamer,dihedral_angles);
							it_rotamer->setDihedralAngles(dihedral_angles);
						} */
					}else{
						rotamer_energy = charmm_computations.energySingleRotamer(
								*it_rotamer,number,segid);
					}
					// it_rotamer->setEnergy(rotamer_energy); // we store the energy only if we have stored the minimized position
					if (_eef1_flag) {
						charmm_computations.unfix();
						charmm_computations.eef1Energy();
						rotamer_aspot = charmm_computations.eef1FromISelect();
						// we should include the bspot:
						//it_rotamer->setASPot(rotamer_aspot);
						float rotamer_template_aspot = charmm_computations.eef1FromAll();
						rotamer_bspot = alx_aspot - (rotamer_template_aspot - rotamer_aspot);
					}
					else if (_surface_potential_flag) {
						pair<float,float> rotamer_aspot_pair = charmm_computations.aspotSingleRotamer(*it_rotamer,number,segid);
						rotamer_aspot = rotamer_aspot_pair.first;
						//it_rotamer->setASPot(rotamer_aspot.first);
						//it_rotamer->setASPRatio(rotamer_aspot.second);
						rotamer_bspot = charmm_computations.templateBSPotFactor() * charmm_computations.bspotSingleRotamer(*it_rotamer,number,segid,rotamer_aspot_pair.first,alx_aspot);
						//it_rotamer->setTemplateBSPot(rotamer_template_bspot);
						//if (_surface_isolated_flag) {
						//	pair<float,float> rotamer_aspot_pair = charmm_computations.aspotSingleRotamerIsolated(*it_rotamer,(*it_position).number(),(*it_position).segid());
						//	//it_rotamer->setASPotIsolated(rotamer_aspot.second);
						//	//it_rotamer->divideASPRatio(rotamer_aspot.second);
						//}
					}
					if (_add_surface_potential_flag){
						//it_rotamer->addASPotToEnergy();
						rotamer_energy += rotamer_aspot - rotamer_bspot;
					}
					
					// Substraction of the unfolded state contribution (it should contain the bspot):
					rotamer_energy += -rotamer_ref_energy;
					
					if (rotamer_energy<=prev_energy){
						best_rotamer = *it_rotamer;
						best_rotamer_all[random_position[i_pos]] = best_rotamer;
						best_rotamer_ref_energy = rotamer_ref_energy;
						best_rotamer_energy = rotamer_energy;
						cout<<"lowered the energy by "<<prev_energy-rotamer_energy<<" or by (abs) "<<rotamer_ini_energy-rotamer_energy<<endl;
						prev_energy = rotamer_energy;
					}
					if (rotamer_energy<rotamer_ini_energy+7.0){ // we compute the total energy if within 7kcal of last best energy
						float tot_energy = energyPositions(pos_numbers,segids)-(current_ref_energy+rotamer_ref_energy);
						if (tot_energy<best_all_energy+2.0){
							cout<<"storing seq with energy "<<tot_energy<<" ";
							vector<int> solution;
							for (int i = 0; i < sz_pos; ++i){
								solution.push_back((best_rotamer_all[i]).index());
								cout<<(best_rotamer_all[i]).index()<<" ";
							}
							cout<<endl;
							solutions.push_back(solution);
							solutions_energies.push_back(tot_energy);
							if (tot_energy<best_all_energy){
								best_all_energy=tot_energy;
								cout<<"New minimum "<<best_all_energy<<endl;
							}
						}
						//solutions_energies.push_back(prev_all_energy + energy_gain + rotamer_energy -rotamer_ini_energy);
					}
				}  // end of loop over rotamers
				ref_energy += best_rotamer_ref_energy;
				current_ref_energy += best_rotamer_ref_energy;
				cout<<"current_ref_energy= "<<current_ref_energy<<endl;
				energy_gain += best_rotamer_energy -rotamer_ini_energy;
				cout<<"best_rotamer= "<<best_rotamer.index()<<" ("<<best_rotamer.resCode()<<")"<<endl;
				if (best_rotamer.resCode() != res_code)
					charmm_computations.patchResidue(best_rotamer.resCode(),number,segid);
				if (charmm_computations.miniFlag()) {
					charmm_computations.minimizeSingleRotamer(best_rotamer,number,segid);
				}else{
					charmm_computations.energySingleRotamer(best_rotamer,number,segid);
				}
				cout << "time spent: " << float(clock() - ticks)/CLOCKS_PER_SEC << " seconds"<<endl;
			}  // end of loop over positions
			cout<<"the energy E+solv-Eref should be "<<prev_all_energy + energy_gain<<endl;
			cmCons("CLDH");
			charmm_computations.unfix();
			charmm_computations.selectIResidues(pos_numbers,segids);
			charmm_computations.fixTemplate(pos_numbers, segids, include_backbone);
			charmm_computations.Skip();
			cmEner("");
			if (_eef1_flag) {	
				// we need to unfix, so the eef1Energy will evaluate properly the asp!
				charmm_computations.unfix();
				charmm_computations.eef1Energy();
				solv_ini = charmm_computations.eef1FromAll();
				aspot_ini =  charmm_computations.eef1FromISelect();
			} else if (_surface_potential_flag) {
				//solv_ini = ener_.eterm[asp];
				//solv_ini = charmm_computations.eef1FromAll();
				//aspot_ini =  charmm_computations.eef1FromISelect();
				// alternatively
				charmm_computations.computeSurface();
				solv_ini = charmm_computations.aspotAll();
				//cout<<"aspot from eef= "<<solv_ini<<"  aspot from exper (with bad radius)= "<<charmm_computations.aspotAll()-_template_aspot<<endl;
			}
			if (_eef1_flag||_surface_potential_flag) {	
				if (_add_surface_potential_flag){
					current_all_energy = ener_.eprop[epot]+solv_ini-_template_aspot - ref_energy;
				} else {
					current_all_energy = ener_.eprop[epot]-ref_energy;
				}
				cout<<"Epot= "<<ener_.eprop[epot]<<"  vdw= "<<ener_.eterm[vdw]<<"  elec= "<<ener_.eterm[elec]<<" solv= "<<solv_ini-_template_aspot<<"  aspot= "<<aspot_ini<<"  E+solv-Eref= "<<current_all_energy<<endl;
			} else {
				current_all_energy = ener_.eprop[epot]-ref_energy;
				cout<<"Epot= "<<ener_.eprop[epot]<<"  vdw= "<<ener_.eterm[vdw]<<"  elec= "<<ener_.eterm[elec]<<"  E+solv-Eref= "<<current_all_energy<<endl;
			}
			cout<<"ref_energy= "<<ref_energy<<endl;
			float ref_chk=0;
			// let's output the sequence
			for (int i = 0; i < sz_pos; ++i){
				cout<<segids[i] << " " << pos_numbers[i] << (best_rotamer_all[i]).resCode() << " ";
				ref_chk += (best_rotamer_all[i]).energyRef()-(best_rotamer_all[i]).energy()+(best_rotamer_all[i]).aspot()-(best_rotamer_all[i]).templateBSPot();
				//cout<<segids[i] << " " << pos_numbers[i] << (*((*it_vec_it_rotamer)[i])).resCode() << " ";
			}
			cout<<"ref_chk= "<<ref_chk<<endl;
			if (int((current_all_energy-prev_all_energy)*100)==0)
				break;
		} // end of heuristic loop
		if (_short_info_file.rdbuf()->is_open()) {
			sprintf(buffer,"#%-6d %10.4lf  ",number,current_all_energy);
			_short_info_file << buffer;
			for (int i = 0; i < sz_pos; ++i)
				_short_info_file << segids[i] << " " << pos_numbers[i] << (best_rotamer_all[i]).resCode() << " ";
				//_short_info_file << segids[i] << " " << pos_numbers[i] << (*((*it_vec_it_rotamer)[i])).resCode() << " ";
			_short_info_file << endl;
		}
		if (_pdb_file_prefix != "") {
			string file_name = _pdb_file_prefix + intToString(number) + ".pdb";
			charmm_computations.writePDB(file_name);
		}
		if (_full_info_file_prefix != "") {
			string file_name = _full_info_file_prefix + intToString(number);
			ofstream ofs(file_name.c_str(),ios::app);  // we open in append mode
			if (!ofs) exitError("cannot open file " + file_name);
			ofs<<"Energies after "<<iter<<" iterations"<<endl;
			for (int i = 0; i < sz_pos; ++i)
				ofs<< "   " << pos_numbers[i] << " " << segids[i] << " "<<(best_rotamer_all[i])<<endl;
				//ofs<< "   " << pos_numbers[i] << " " << segids[i] << " "<<(*((*it_vec_it_rotamer)[i]))<<endl;
			ofs.close();
		}
	} //end of combinations loop
	if (_write_graph_file != "") {
		ofstream ofs(_write_graph_file.c_str(),ios::app);
		if (!ofs) exitError("cannot reopen file " + _write_graph_file);
		int sol=0;
		for (vector<vector<int> >::const_iterator it_solution = solutions.begin(); it_solution != solutions.end(); ++it_solution, ++sol){
			if (solutions_energies[sol]<best_all_energy+2.0){
				ofs<<"cost "<<-solutions_energies[sol]<<" "; // we store MINUS the energy (following opt)
				for (int i = 0; i < sz_pos; ++i)
					ofs<< (*it_solution)[i] << " ";
				ofs<<endl;
			}
		}
		//ofs<<"cost ";
		//for (int i = 0; i < sz_pos; ++i)
		//	ofs<< (best_rotamer_all[i]).index() << " ";
		//ofs<<endl;
		ofs.close();
	}
}
			
void AllPositions::setWriteGraphFile(const string& file_name){
	_write_graph_file = file_name;
}

void AllPositions::generateCombinations() {
	vector<list<Rotamer>::const_iterator> vec_it_rotamer;
	vector<int> pos_numbers;
	vector<ResPosition>::const_iterator it_position;

	float min_energy = 1E+100, total_energy;
	if (_energy_gap > 0) {
		initCombination(vec_it_rotamer);
		do {
			if ((total_energy = charmm_computations.getShortEnergy(
					_pair_energies,vec_it_rotamer)) < min_energy)
				min_energy = total_energy;
		} while (nextCombination(vec_it_rotamer));
	}

	initCombination(vec_it_rotamer);
	vector<string> segids;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		pos_numbers.push_back((*it_position).number());
		segids.push_back((*it_position).segid());
	}
        // 08052001:
        // we patch ALX to compute the backbone/template energy
        for (vector<ResPosition>::iterator it_positionbis = _positions.begin();
                it_positionbis != _positions.end(); ++it_positionbis)
                        (*it_positionbis).patchPosition(); 
        charmm_computations.cmBuild();
        charmm_computations.unfix();
        charmm_computations.Skip();
        cmEner("");
        charmm_computations.setTemplateEnergy(ener_.eprop[epot]);
	#ifdef VDWELEC
        charmm_computations.setTemplateEnergyVdw(ener_.eterm[vdw]);
        charmm_computations.setTemplateEnergyElec(ener_.eterm[elec]);
	#endif
	//cout<<"Template energy= "<<charmm_computations.templateEnergy()<<endl;

	int number = 0;
	float energy;
	float solvation = 0;
	do {
		if (_energy_gap > 0
				&& charmm_computations.getShortEnergy(
						_pair_energies,vec_it_rotamer) > min_energy + _energy_gap)
			continue;
		if (_short_info_file.rdbuf()->is_open()) {
			charmm_computations.writeShortInfo(_short_info_file,
					_pair_energies,number,vec_it_rotamer,pos_numbers,segids);
		}		
		if (_solvation_file.rdbuf()->is_open() || _pdb_file_prefix != ""
				|| _full_info_file_prefix != "") {
			energy = charmm_computations.energyVecRotamers(
					vec_it_rotamer,pos_numbers,segids,false);
			if (_pdb_file_prefix != "" || _full_info_file_prefix != "") {
				if (_eef1_flag) {
						charmm_computations.unfix();
						charmm_computations.eef1Energy();
						solvation = charmm_computations.eef1FromAll()
								- _template_aspot;					
				}   else if (charmm_computations.SolvFlag()) {
					solvation = charmm_computations.SolvEnergy() - _template_aspot;
					// Now we have to compute again the energy (SolvEnergy overwrited the one computed by energyVecRotamers)
					charmm_computations.fixTemplate(pos_numbers,segids,false);
					charmm_computations.Skip();
					cmEner("");
				}
				else if (_surface_potential_flag) {
					charmm_computations.computeSurface();
					solvation = charmm_computations.aspotAll()-_template_aspot;
				}
                               // 08052001
                                //charmm_computations.unfix();
                                //charmm_computations.Skip();
                                //cmEner("");
				writeCombination(number,vec_it_rotamer,pos_numbers,segids,solvation);
			}			
			if (_solvation_file.rdbuf()->is_open())
				charmm_computations.writeSolvation(_solvation_file,energy,
						vec_it_rotamer,number);
		}
		else cout<<"Skiping combination "<<number<<endl;
		//if (_pdb_file_prefix != "" || _full_info_file_prefix != "") {
		//	charmm_computations.energyVecRotamers(
		//			vec_it_rotamer,pos_numbers,segids,false);
		//	writeCombination(number,vec_it_rotamer,pos_numbers);
		//}

		if (_ref_structure_flag)
		{
			charmm_computations.energyVecRotamers(
					vec_it_rotamer,pos_numbers,segids,true);
			charmm_computations.energyRefStructure(
					vec_it_rotamer,pos_numbers,segids);
			writeRefCombination(number,vec_it_rotamer,pos_numbers,segids);
		}
		number++;
	} while (nextCombination(vec_it_rotamer));
}

void AllPositions::writeCombination(int number,
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers, const vector<string>& segids,
		float solvation) {
	char buffer[50];
	sprintf(buffer,"%d",number);
	if (_pdb_file_prefix != "") {
		string file_name = _pdb_file_prefix + buffer + ".pdb";
		charmm_computations.writePDB(file_name);
		/// Trying to fix write_full_info problem, 13072006
		WriteFullInfo=true;
	}
	if (_full_info_file_prefix != "") {
		string file_name = _full_info_file_prefix + buffer;
		ofstream ofs(file_name.c_str());
		if (!ofs) exitError("cannot open file " + file_name);
		charmm_computations.writeFullInfo(ofs,number,
				vec_it_rotamer,pos_numbers,segids,
				_pair_energies,
				#ifdef VDWELEC
				_pair_vdw_energies,
				_pair_elec_energies,
				#endif
				#ifdef NOEWRTINFO
				_pair_noe_energies,
				#endif
				_pair_solv_energies,
				solvation);
		ofs.close();
	}
	//if (_short_info_file.rdbuf()->is_open()) {
	//	charmm_computations.writeShortInfo(_short_info_file,number,
	//			vec_it_rotamer,pos_numbers,segids);
	//}
}

void AllPositions::writeRefCombination(int number,
		const vector<list<Rotamer>::const_iterator>& vec_it_rotamer,
		const vector<int>& pos_numbers, const vector<string>& segids) {
	if (_short_info_file) {
		charmm_computations.writeShortRefInfo(_short_info_file,number,
				vec_it_rotamer,pos_numbers,segids);
	}
}

void AllPositions::removeDeadRotamers(int* dead_single) {
	vector<ResPosition>::iterator it_position;
	int ind_rotamer = 1;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		//cout << " remove from position " << (*it_position).number() << endl;
		(*it_position).removeDeadRotamers(dead_single,ind_rotamer);
	}
}

void AllPositions::addRefEnergy(const RefEnergy& ref_energy) {
	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position)
		(*it_position).addRefEnergy(ref_energy);
}

void AllPositions::addRefSolvation(const RefEnergy& ref_energy) {
	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position)
		(*it_position).addRefSolvation(ref_energy);
}

int AllPositions::sizePositions() const {
	return _positions.size();
}

int AllPositions::sizeRotamers() const {
	int size = 0;
	vector<ResPosition>::const_iterator itrp = _positions.begin();
	for (; itrp != _positions.end(); ++itrp)
		size += (*itrp).sizeRotamers();
	return size;
}

ostream& AllPositions::printAminoAcids(ostream& os) {
	vector<ResPosition>::iterator it_position;
	os << "Minimum single energies of amino acids" << endl;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		os << "pos " << (*it_position).number();
		(*it_position).printAminoAcids(os);
		os << endl;
	}
	return os;
}

void AllPositions::addMinRefEnergy(float factor) {
	vector<ResPosition>::iterator it_position;
	cout << "Applying minimum reference energies with factor " <<factor<< endl;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		(*it_position).addMinRefEnergy(factor);
	}
}

ostream& AllPositions::printReferenceEnergies(ostream& os,
		int nb_phi, int nb_psi, float temp, int ramachandran)  {
	vector<ResPosition>::iterator it_position;
	for (it_position = _positions.begin();
			it_position != _positions.end();
			++it_position) {
		//os << "position " << (*it_position).number() << endl;
		(*it_position).printReferenceEnergies(os,nb_phi,nb_psi,temp,ramachandran);
	}
	return os;
}

ostream& AllPositions::printGraph(ostream& os) const {
	int sz_pos = sizePositions();
	int i, j, k, ind_rotamer2;

		// last_residue
	os << sz_pos << endl;
	int cumulative_rotamers = 0;
	for (i = 0; i < sz_pos; ++i) {
		cumulative_rotamers += _positions[i].sizeRotamers();
		os << cumulative_rotamers << " ";
	}
	os << endl << endl;

		// energy table
	os << cumulative_rotamers << endl;
	os << endl << endl;
	list<Rotamer>::const_iterator it_rotamer1, it_rotamer2;
	for (i = 0; i < sz_pos; ++i) {
		for (it_rotamer2 = _positions[i].rotamers().begin(),
				ind_rotamer2 = 0;
				it_rotamer2 != _positions[i].rotamers().end();
				++it_rotamer2, ++ind_rotamer2) {
			//os << 0 << endl;
			for (j = 0; j < i; ++j) 
				for (it_rotamer1 = _positions[j].rotamers().begin();
						it_rotamer1 != _positions[j].rotamers().end();
						++it_rotamer1)
					os << ( (*it_rotamer1).energy()
									+ (*it_rotamer2).energy() ) / (sz_pos - 1)
					 		+ _pair_energies[(*it_rotamer2).index()][(*it_rotamer1).index()]
							//+ _pair_solv_energies[(*it_rotamer2).index()][(*it_rotamer1).index()]
						<< " ";
			for(k = 0; k <= ind_rotamer2; ++k)   // case j=i  07112000 No inter bw rot at the same position (also no self-energy)
				os << "0 ";
			os << endl;
		}
	}
	return os;
}

ostream& AllPositions::printRotCodes(ostream& os) const {
	int sz_pos = sizePositions();
	int i, ind_rotamer2;

	if (_initial_sequence.empty())
		exitError("AllPositions::printRotCodes: Initial sequence has not been stored, exiting");
	for (i = 0; i < sz_pos; ++i)
		os << _initial_sequence[i]<<" ";
	os<<endl;
	list<Rotamer>::const_iterator it_rotamer2;
	for (i = 0; i < sz_pos; ++i) {
		for (it_rotamer2 = _positions[i].rotamers().begin(),
				ind_rotamer2 = 0;
				it_rotamer2 != _positions[i].rotamers().end();
				++it_rotamer2, ++ind_rotamer2) {
			os << (*it_rotamer2).resCode() << endl;
		}
	}
	return os;
}

ostream& AllPositions::printFullGraph(ostream& os) const {
	int sz_pos = sizePositions();
	int i, j, k, ind_rotamer2;

		// last_residue
	os << sz_pos << endl;
	int cumulative_rotamers = 0;
	for (i = 0; i < sz_pos; ++i) {
		cumulative_rotamers += _positions[i].sizeRotamers();
		os << cumulative_rotamers << " ";
	}
	os << endl << endl;

		// energy table
	os << cumulative_rotamers << endl;
	os << endl << endl;
	list<Rotamer>::const_iterator it_rotamer1, it_rotamer2;
	for (i = 0; i < sz_pos; ++i) {
		for (it_rotamer2 = _positions[i].rotamers().begin(),
				ind_rotamer2 = 0;
				it_rotamer2 != _positions[i].rotamers().end();
				++it_rotamer2, ++ind_rotamer2) {
			os << (*it_rotamer2).energy() << endl;
			for (j = 0; j < i; ++j) 
				for (it_rotamer1 = _positions[j].rotamers().begin();
						it_rotamer1 != _positions[j].rotamers().end();
						++it_rotamer1)
					os << _pair_energies[(*it_rotamer2).index()][(*it_rotamer1).index()]
							//+ _pair_solv_energies[(*it_rotamer2).index()][(*it_rotamer1).index()]
						<< " ";
			for(k = 0; k <= ind_rotamer2; ++k)
				os << "0 ";
			os << endl;
		}
	}
	return os;
}

istream& AllPositions::readGraphResults(istream& is) {
	int sz_pos = sizePositions();
	int i, j;
	// this will allow us to read a graph file several times:
	_combinations.clear();

	string str;
	while(is >> str && str != "combinations")
		;

	for (;;) {
		if (!(is >> str) || str != "cost") 
			break;
		float energy;
		is >> energy;
		_combinations.push_back(vector<list<Rotamer>::const_iterator>());
		vector<list<Rotamer>::const_iterator>&
				combination = _combinations.back();
		vector<int> rotamer_indices(sz_pos);
		for (i = 0; i < sz_pos; ++i)
			is >> rotamer_indices[i];
		sort(rotamer_indices.begin(),rotamer_indices.end());

		list<Rotamer>::const_iterator it_rotamer;
		int ind_rotamer = 0;
		for (i = 0, j = 0; i < sz_pos; ++i)
			for (it_rotamer = _positions[i].rotamers().begin();
					it_rotamer != _positions[i].rotamers().end();
					++it_rotamer, ++ind_rotamer)
				if (ind_rotamer == rotamer_indices[j]) {
					j++;
					combination.push_back(it_rotamer);
				}
	}
	return is;
}

void AllPositions::addSurfacePotential(int which) {
		// which: 1 only single, 2 only pairs, 3 both,
		// 4 pair only with factor
	int sz_pos = sizePositions();
	int sz_rot = sizeRotamers();
	int i, j, ind_rotamer2;

		// positions with rotamers:
	list<Rotamer>::iterator it_rotamer;
	if (which == 1 || which == 3) {
		for (i = 0; i < sz_pos; ++i)
			for (it_rotamer = _positions[i].rotamersVar().begin();
					it_rotamer != _positions[i].rotamersVar().end();
					++it_rotamer)
				(*it_rotamer).addASPotToEnergy();
	}

		// energy table
	list<Rotamer>::const_iterator it_rotamer1, it_rotamer2;
	if (which == 2 || which == 3 || which == 4) {
		for (i = 0; i < sz_pos; ++i)
			for (it_rotamer2 = _positions[i].rotamers().begin(),
					ind_rotamer2 = 0;
					it_rotamer2 != _positions[i].rotamers().end();
					++it_rotamer2, ++ind_rotamer2)
				for (j = 0; j < i; ++j) 
					for (it_rotamer1 = _positions[j].rotamers().begin();
							it_rotamer1 != _positions[j].rotamers().end();
							++it_rotamer1) {
						if (which == 4)
							_pair_solv_energies[(*it_rotamer2).index()][(*it_rotamer1).index()]
									*=  charmm_computations.ASPFactor();
						_pair_energies[(*it_rotamer2).index()][(*it_rotamer1).index()] -=
								_pair_solv_energies[(*it_rotamer2).index()][(*it_rotamer1).index()];
				}
	}
}

void AllPositions::scaleElecPairEnergies(float factor) {
	int sz_pos = sizePositions();
	int sz_rot = sizeRotamers();
	int i, j, ind_rotamer2;

	#ifdef VDWELEC
	// energy table
	list<Rotamer>::const_iterator it_rotamer1, it_rotamer2;
		for (i = 0; i < sz_pos; ++i)
			for (it_rotamer2 = _positions[i].rotamers().begin(),
					ind_rotamer2 = 0;
					it_rotamer2 != _positions[i].rotamers().end();
					++it_rotamer2, ++ind_rotamer2)
				for (j = 0; j < i; ++j) 
					for (it_rotamer1 = _positions[j].rotamers().begin();
							it_rotamer1 != _positions[j].rotamers().end();
							++it_rotamer1) {
							_pair_energies[(*it_rotamer2).index()][(*it_rotamer1).index()] -=
								_pair_elec_energies[(*it_rotamer2).index()][(*it_rotamer1).index()];
							_pair_elec_energies[(*it_rotamer2).index()][(*it_rotamer1).index()]
									*=  factor;
							_pair_energies[(*it_rotamer2).index()][(*it_rotamer1).index()] +=
								_pair_elec_energies[(*it_rotamer2).index()][(*it_rotamer1).index()];
					}
	#endif
	#ifndef VDWELEC
	exitError("AllPositions::scaleElecPairEnergies: VDWELEC not defined at compile time, exiting");
	#endif
}

ostream& AllPositions::printDump(
		ostream& os, bool only_single) const {
	int sz_pos = sizePositions();
	int sz_rot = sizeRotamers();
	int i, j, ind_rotamer2;

		// parameters
	os << _single_dihedrals_flag << endl;
	os << _single_repatch_flag << endl;
	os << _surface_potential_flag << endl;
	os << _surface_potential_distance << endl;
	os << _surface_isolated_flag << endl;
	os << _add_surface_potential_flag << endl;
	os << _ref_structure_flag << endl;
	os << _dee_short_flag << endl;
	os << _entropy_factor << endl;
	os << _energy_gap << endl;
	os << _entropy_flag << endl;
	os << _size_processes << endl;
	os << sz_pos << endl;
	os << sz_rot << endl;
	os << _template_aspot << endl;

	charmm_computations.printDump(os);

		// positions with rotamers:
	list<Rotamer>::const_iterator it_rotamer;
	for (i = 0; i < sz_pos; ++i) {
		os << _positions[i].number() << " "
				<< _positions[i].segid() << " "
				<< _positions[i].sizeRotamers() << endl;
		for (it_rotamer = _positions[i].rotamers().begin();
				it_rotamer != _positions[i].rotamers().end();
				++it_rotamer)
			(*it_rotamer).printDump(os) << endl;
		os << endl;
	}

	if (only_single)
		return os;


		// energy table
	os << endl << endl;
	list<Rotamer>::const_iterator it_rotamer1, it_rotamer2;
	for (i = 0; i < sz_pos; ++i) {
		for (it_rotamer2 = _positions[i].rotamers().begin(),
				ind_rotamer2 = 0;
				it_rotamer2 != _positions[i].rotamers().end();
				++it_rotamer2, ++ind_rotamer2) {
			for (j = 0; j < i; ++j) 
				for (it_rotamer1 = _positions[j].rotamers().begin();
						it_rotamer1 != _positions[j].rotamers().end();
						++it_rotamer1) {
					os << _pair_energies[(*it_rotamer2).index()][(*it_rotamer1).index()] << " ";
					#ifdef VDWELEC
					os << _pair_elec_energies[(*it_rotamer2).index()][(*it_rotamer1).index()] << " ";
					#endif
					os << _pair_solv_energies[(*it_rotamer2).index()][(*it_rotamer1).index()] << " ";
					#ifdef VDWELEC
					os << _pair_vdw_energies[(*it_rotamer2).index()][(*it_rotamer1).index()] << " ";
					#endif
					#ifdef NOEWRTINFO
					os << _pair_noe_energies[(*it_rotamer2).index()][(*it_rotamer1).index()] << " ";
					#endif
				}
			//for(k = 0; k <= ind_rotamer2; ++k)
			//	os << "0 ";
			//os << endl;
		}
	}
	return os;
}

istream& AllPositions::readDump(istream& is, bool only_single) {
	int i, j;
	int sz_pos, sz_rot; // number, size;

	cout << "PARAMETERS in dump: " << endl;
	is >> _single_dihedrals_flag;
		cout << "  single_dihedrals_flag " << _single_dihedrals_flag << endl;
	is >> _single_repatch_flag;
		cout << "  single_repatch_flag " << _single_repatch_flag << endl;
	is >> _surface_potential_flag;
		cout << "  surface_potential_flag " << _surface_potential_flag << endl;
	is >> _surface_potential_distance;
		cout << "  surface_potential_distance " << _surface_potential_distance << endl;
	is >> _surface_isolated_flag;
		cout << "  surface_isolated_flag " << _surface_isolated_flag << endl;
	is >> _add_surface_potential_flag;
		cout << "  add_surface_potential_flag " << _add_surface_potential_flag << endl;
	is >> _ref_structure_flag;
		cout << "  ref_structure_flag " << _ref_structure_flag << endl;
	is >> _dee_short_flag;
		cout << "  dee_short_flag " << _dee_short_flag << endl;
	is >> _entropy_factor;
		cout << "  entropy_factor " << _entropy_factor << endl;
	is >> _energy_gap;
		cout << "  energy_gap " << _energy_gap << endl;
	is >> _entropy_flag;
		cout << "  entropy_flag " << _entropy_flag << endl;
	is >> _size_processes;
		cout << "  size_processes " << _size_processes << endl;
	is >> sz_pos >> sz_rot;
		cout << "  size_pos " << sz_pos << endl;
		cout << "  size_rot " << sz_rot << endl;
	is >> _template_aspot;

	charmm_computations.readDump(is);

	vector<int> first_index;
	_positions.erase(_positions.begin(),_positions.end());
	int start_index = 0;
	for (i = 0; i < sz_pos; ++i) {
		_positions.push_back(ResPosition());
		_positions.back().readDump(is,start_index);
		first_index.push_back(start_index);
		start_index += _positions.back().sizeRotamers();
	}
	first_index.push_back(start_index);

	if (only_single) {
		int sz_pos = sizePositions(), i;
		_pair_flags.erase(_pair_flags.begin(),_pair_flags.end());
		_pair_flags.insert(
				_pair_flags.begin(),(size_t)sz_pos,vector<char>());
		for (i = 0; i < sz_pos; ++i)
			_pair_flags[i].insert(
					_pair_flags[i].begin(),(size_t)(i+1),1);
		return is;
	}

	_pair_energies.erase(_pair_energies.begin(),_pair_energies.end());
	_pair_energies.insert(
			_pair_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_energies[i].insert(
				_pair_energies[i].begin(),(size_t)(i+1),0.0);

	#ifdef VDWELEC
	_pair_vdw_energies.erase(_pair_vdw_energies.begin(),
			_pair_vdw_energies.end());
	_pair_vdw_energies.insert(
			_pair_vdw_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_vdw_energies[i].insert(
				_pair_vdw_energies[i].begin(),(size_t)(i+1),0.0);

	_pair_elec_energies.erase(_pair_elec_energies.begin(),
			_pair_elec_energies.end());
	_pair_elec_energies.insert(
			_pair_elec_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_elec_energies[i].insert(
				_pair_elec_energies[i].begin(),(size_t)(i+1),0.0);
	#endif

	#ifdef NOEWRTINFO
	_pair_noe_energies.erase(_pair_noe_energies.begin(),
			_pair_noe_energies.end());
	_pair_noe_energies.insert(
			_pair_noe_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_noe_energies[i].insert(
				_pair_noe_energies[i].begin(),(size_t)(i+1),0.0);
	#endif

	_pair_solv_energies.erase(_pair_solv_energies.begin(),
			_pair_solv_energies.end());
	_pair_solv_energies.insert(
			_pair_solv_energies.begin(),(size_t)sz_rot,vector<float>());
	for (i = 0; i < sz_rot; ++i)
		_pair_solv_energies[i].insert(
				_pair_solv_energies[i].begin(),(size_t)(i+1),0.0);

	//float reduced_dummy;
	int ind_rotamer1, ind_rotamer2;
	for (i = 0; i < sz_pos; ++i)
		for (ind_rotamer2 = first_index[i];
				ind_rotamer2 < first_index[i+1];
				++ind_rotamer2)
			for (j = 0; j < i; ++j) 
				for (ind_rotamer1 = first_index[j];
						ind_rotamer1 < first_index[j+1];
						++ind_rotamer1) {
					is >> _pair_energies[ind_rotamer2][ind_rotamer1];
					#ifdef VDWELEC
					is >> _pair_elec_energies[ind_rotamer2][ind_rotamer1];
					#endif
					is >> _pair_solv_energies[ind_rotamer2][ind_rotamer1];
					#ifdef VDWELEC
					is >> _pair_vdw_energies[ind_rotamer2][ind_rotamer1];
					#endif
					#ifdef NOEWRTINFO
					is >> _pair_noe_energies[ind_rotamer2][ind_rotamer1];
					#endif
						//is >> reduced_dummy;
				}

	return is;
}

ostream& AllPositions::printPairEnergies(ostream& os) const {
	int sz_pos = sizePositions();
	int sz_rot = sizeRotamers();
	int i, j;

	os << " \n\n---------- PURE PAIR ENERGIES -------------\n\n" << endl;
	for (i = 0; i < sz_rot; i++) {
		os << i << ": ";
		for (j = 0; j < i+1; j++)
			os << j << " " << _pair_energies[i][j] << " / ";
		os << endl;
	}

	os << " \n\n---------- DETAILED ENERGIES -------------\n\n" << endl;
	list<Rotamer>::const_iterator it_rotamer1, it_rotamer2;
	for (i = 1; i < sz_pos; ++i)
		for (it_rotamer1 = _positions[i].rotamers().begin();
				it_rotamer1 != _positions[i].rotamers().end();
				++it_rotamer1) {
			os << endl << "pos " << _positions[i].number()
					<< " (" << (*it_rotamer1).resCode()
					<< "," << (*it_rotamer1).id()
					<< "," << (*it_rotamer1).energy() << "): " << endl;
			for (j = 0; j < i; ++j)
				for (it_rotamer2 = _positions[j].rotamers().begin();
						it_rotamer2 != _positions[j].rotamers().end();
						++it_rotamer2) {
					os << _positions[j].number() << " (" << (*it_rotamer2).resCode()
							<< "," << (*it_rotamer2).id()
							<< "," << (*it_rotamer2).energy()
							<< ") (" << _pair_energies[(*it_rotamer1).index()][(*it_rotamer2).index()]
							#ifdef VDWELEC
							<< ",v" << _pair_vdw_energies[(*it_rotamer1).index()][(*it_rotamer2).index()]
							<< ",e" << _pair_elec_energies[(*it_rotamer1).index()][(*it_rotamer2).index()]
							#endif
							<< ",s" << _pair_solv_energies[(*it_rotamer1).index()][(*it_rotamer2).index()]
							#ifdef NOEWRTINFO
							<< ",n" << _pair_noe_energies[(*it_rotamer1).index()][(*it_rotamer2).index()]
							#endif
							<< ")" << " / ";
				}
				os << endl;
		}

	return os;
}

ostream& operator<<(ostream& os, const AllPositions& all_positions) {
	copy(all_positions._positions.begin(),all_positions._positions.end(),
			ostream_iterator<ResPosition>(os,""));
	return os;
}



//                           main


//extern "C" {
//	void mainesc_();
//}


int main() {

	cout<<"Designer27 created by Lorenz Wernisch. Later revised by :"<<endl;	
	cout<<"Alfonso Jaramillo"<<endl;
	cout<<"Miguel A. Santos"<<endl<<endl;
	cout<<" Version "<<__DATE__<<endl;
	char buffer[300];
	string des_cmd = "end";
	string file_name = "bbind.lib";
	string current_segid_name = "XXX";
	int write_pdb_flag = 0;  // cmWrite destroys input buffer
	int verbose_des_cmds = 0;
	
	#ifdef NOE
	switchUser(0);		/// User energy switched off. For NOE: Miguel, HSC, Toronto, 2006
	useSumOfVolumes(1);		/// Pseudo-atoms method: Sum of volumes
	cout<<"NOE: compile options: "
        	#ifdef NOEDEBUGFULL
		<<"NOEDEBUGFULL "
		#endif
		#ifdef NOEDEBUG
		<<"NOEDEBUG "
		#endif
		#ifdef NOEPRN
		<<"NOEPRN "
		#endif
		#ifdef NOEWRTINFO
		<<"NOEWRTINFO "
		#endif
		#ifdef NOE
		<<"NOE "
		#else
		<<"I saw a ghost!"
		#endif
		<<endl;
	#endif
	RotamerLib rotamer_lib;
	AllPositions all_positions;
	RPPHashTable app_hash_table(10003);
	RefEnergy ref_energy;

	cmInitialize();

		// !!! input from CHARMM only with scanf (no cin) !!!!

	do {
		cmMainLoop();
		charmm_computations.checkTerminus();
		//cout << "###########   ROTAMER SELECTION TAKING OVER  #########" << endl;

		for (;;) {
			scanf("%s",buffer);
			des_cmd = buffer;
			if (verbose_des_cmds && des_cmd != "@")
				cout << " command is " << des_cmd << endl;
			if (des_cmd == "@") { // comments between two @'s
				while (getChar() != '@')
					;
			}
			else if (des_cmd == "verbose_des_cmds") { // 0/1
				verbose_des_cmds = getInt();
			}
			//else if (des_cmd == "n_terminal") { // int
			//	charmm_computations.setNTerminal(getInt());
			//}
			//else if (des_cmd == "c_terminal") { // int
			//	charmm_computations.setCTerminal(getInt());
			//}
			// read_dunbrack_library=read_dunbrack_indep_library!!!
			else if (des_cmd == "read_dunbrack_library") { // file_name
				scanf("%s",buffer); 
				rotamer_lib.readDunbrack(buffer);
			}
			else if (des_cmd == "read_tuffery_library") { // file_name
				scanf("%s",buffer); 
				rotamer_lib.readTuffery(buffer);
			}
			else if (des_cmd == "add_rotamer_variants") {  // angle number level
				float angle;
				int number, level;
				scanf("%f",&angle);
				scanf("%d",&number);
				scanf("%d",&level);
				rotamer_lib.addRotamerVariants(angle,number,level);
			}
			else if (des_cmd == "print_lib") {
				cout << rotamer_lib << endl;
			}
			else if (des_cmd == "compute_free_lib_asa") { // segid
				scanf("%s",buffer);
				rotamer_lib.computeFreeASA(buffer);
			}
			else if (des_cmd == "compute_buried_asa") {
				all_positions.computeBuriedASA();
			}
			else if (des_cmd == "keep_burial") {
					// float burial
				float burial = getFloat();
				all_positions.keepBurial(rotamer_lib,burial);
				close_ostream();
			}
			else if (des_cmd == "print_burial") {
					// float burial, "cout" or file_name
				float burial = getFloat();
				scanf("%s",buffer);
				all_positions.printBurial(open_ostream(buffer),
						rotamer_lib,burial);
				close_ostream();
			}
			else if (des_cmd == "print_rms_dihedrals") {
					// int dev, "cout" or file_name
				float allowed_dev;
				scanf("%f",&allowed_dev);
				scanf("%s",buffer);
				all_positions.printRMSDihedrals(open_ostream(buffer),
						allowed_dev,rotamer_lib);
				close_ostream();
			}
				// deprecated
			else if (des_cmd == "segid") { // segid
				exitError("ERROR: SEGID no longer supported\n use position_amino_acids <segid> instead");
				//scanf("%s",buffer);
				//current_segid_name = buffer;
			}
			else if (des_cmd == "position_amino_acids") { // <segid> 5 A #  8 Y # ...
				scanf("%s",buffer);
				all_positions.scanForResCodes(buffer);
			}
			else if (des_cmd == "fill_position_amino_acids") { // <segid>
				scanf("%s",buffer);
				all_positions.fillWithResCodes(buffer);
			}
			else if (des_cmd == "compute_phi_psi") {
				all_positions.computePhiPsi(app_hash_table);
			}
			else if (des_cmd == "fill_with_dunbrack_dep_library") { // file_name
				scanf("%s",buffer); 
				all_positions.fillWithDependentLibrary(
						open_istream(buffer),app_hash_table);
				close_istream();
			}
			else if (des_cmd == "fill_with_dunbrack_indep_library") { // file_name
				scanf("%s",buffer); 
				rotamer_lib.readDunbrack(buffer);
				all_positions.fillWithLibrary(rotamer_lib);
			}
			else if (des_cmd == "read_dunbrack_indep_library") { // file_name
				scanf("%s",buffer); 
				rotamer_lib.readDunbrack(buffer);
			}
			//else if (des_cmd == "read_tuffery_library") { // file_name
			//	scanf("%s",buffer); 
			//	rotamer_lib.readDunbrack(buffer);
			//}
			else if (des_cmd == "fill_with_library") { 
				all_positions.fillWithLibrary(rotamer_lib);
			}
			else if (des_cmd == "fill_with_tuffery_library") { // file_name
				scanf("%s",buffer); 
				rotamer_lib.readTuffery(buffer);
				all_positions.fillWithLibrary(rotamer_lib);
			}
			else if (des_cmd == "entropy_factor") { // float
				all_positions.setEntropyFlag(1);
				all_positions.setEntropyFactor(getFloat());
			}
			else if (des_cmd == "set_single_energy_to") { // float
				all_positions.setSingleEnergy(getFloat());
			}
			else if (des_cmd == "add_ref_energy_table") { // file_name
				scanf("%s",buffer);
				ref_energy.fill(open_istream(buffer));
				close_istream();
				all_positions.addRefEnergy(ref_energy);
			}
			else if (des_cmd == "add_ref_energy_table_factor") { // file_name <float>
				scanf("%s",buffer);
				ref_energy.fillWithFactor(open_istream(buffer),getFloat());
				close_istream();
				all_positions.addRefEnergy(ref_energy);
			}
			else if (des_cmd == "add_ref_solvation_table") { // file_name
				scanf("%s",buffer);
				ref_energy.fill(open_istream(buffer));
				close_istream();
				all_positions.addRefSolvation(ref_energy);
			}
			else if (des_cmd == "solvation_reference_file") { // file_name
				scanf("%s",buffer);
				charmm_computations.readSolvationReference(open_istream(buffer));
				close_istream();
			}
			else if (des_cmd == "open_append_file") { // file_name
				scanf("%s",buffer);
				open_append_stream(buffer);
			}
			else if (des_cmd == "close_append_file") { // file_name
				close_append_stream();
			}
			else if (des_cmd == "mini_param") { // string #
				charmm_computations.setMiniParam(getChars());
			}
			else if (des_cmd == "mini_flag") { // 0/1
				int flag = getInt();
				charmm_computations.setMiniFlag(flag);
				//charmm_computations.setSingleCoordinatesFlag(flag);
				// not that easy: mini_flag 0 for global construction?
			}
			else if (des_cmd == "hbon_flag") { // 0/1
				charmm_computations.setHbonFlag(getInt());
			}
			else if (des_cmd == "single_coordinates_flag") { // 0/1
				charmm_computations.setSingleCoordinatesFlag(getInt());
			}
			else if (des_cmd == "cons_param") { // string #
				charmm_computations.setConsParam(getChars());
			}
			else if (des_cmd == "cons_flag") { // 0/1
				charmm_computations.setConsFlag(getInt());
			}
			else if (des_cmd == "upda_param") { // string #
				charmm_computations.setUpdaParam(getChars());
			}
			else if (des_cmd == "hbon_param") { // string #
				charmm_computations.setHbonParam(getChars());
			}
			else if (des_cmd == "surf_param") { // string #
				charmm_computations.setSurfParam(getChars());
			}
			else if (des_cmd == "skip_mini_param") { // string #
				charmm_computations.setSkipMiniParam(getChars());
			}
			else if (des_cmd == "skip_ener_param") { // string #
				charmm_computations.setSkipEnerParam(getChars());
			}
			else if (des_cmd == "ener_selection") { // string #
				charmm_computations.setEnerSelection(getChars());
			}
			else if (des_cmd == "extra_ener_flag") { // 0/1
				charmm_computations.setExtraEnerFlag(getInt());
			}
			else if (des_cmd == "no_self_flag") { // 0/1
				charmm_computations.setNoSelfFlag(getInt());
			}
			else if (des_cmd == "verbose_cm_cmds") { // 0/1
				scanf("%d", &cm_print_cmd);
			}
			else if (des_cmd == "dummy_res_code") { // reschar
				scanf("%s",buffer);
				charmm_computations.setDummyResCode(buffer[0]);
			}
			else if (des_cmd == "verbose_dee") { // 0/1
				scanf("%d",&verbose);
			}
			else if (des_cmd == "single_energies") {
				all_positions.computeSingleEnergies();
			}
			else if (des_cmd == "print_reference_energies") {
					// "cout" or file_name, int n_phi, int n_psi, float temp
				scanf("%s",buffer);
				int nphi = getInt();
				int npsi = getInt();
				float temp = getFloat();
				int ramachandran = getInt();
				all_positions.printReferenceEnergies(
						open_ostream(buffer),nphi,npsi,temp,ramachandran);
				close_ostream();
			}
				// take dihedrals from single energy minimization
			else if (des_cmd == "single_dihedrals_flag") { // 0/1
				all_positions.setSingleDihedralsFlag(getInt());
			}
				// 
			else if (des_cmd == "single_repatch_flag") { // 0/1
				all_positions.setSingleRepatchFlag(getInt());
			}
			else if (des_cmd == "eef1_flag") { // 0/1
				all_positions.setEef1Flag(getInt());
			}
			else if (des_cmd == "surface_potential_flag") { // 0/1
				all_positions.setASPFlag(getInt());
			}
			else if (des_cmd == "surface_potential_distance") { // float
				all_positions.setASPIsolatedFlag(1);
				all_positions.setASPDistance(getFloat());
			}
			else if (des_cmd == "add_surface_potential_flag") { // 0/1
				all_positions.setAddASPFlag(getInt());
			}
			else if (des_cmd == "add_surface_potential") { // 1/2/3/4
					// 1 only single, 2 only pairs, 3 both,
					// 4 pair with surface_potential_factor
					// option 1 is useful when we had add_surface_potential_flag=0 during the single energies
				all_positions.addSurfacePotential(getInt());
			}
			else if (des_cmd == "surface_potential_factor") { // float
				charmm_computations.setASPFactor(getFloat());
			}
			else if (des_cmd == "surface_potential_all") {
				charmm_computations.computeSurface();
				float aspot_all = charmm_computations.aspotAll();
				//cout << "aspot all " << aspot_all << endl;
				append_stream << aspot_all << endl;
			}
			else if (des_cmd == "surface_potential_select") { // string #
				charmm_computations.computeSurface();
				float aspot_all = charmm_computations.aspotAll(getChars());
				//cout << "aspot all " << aspot_all << endl;
				append_stream << aspot_all << endl;
			}
			else if (des_cmd == "pair_template_factor") { // float
				charmm_computations.setPairTemplateFactor(getFloat());
			}
			else if (des_cmd == "local_template_flag") { // int
				charmm_computations.setLocalTemplateFlag(getInt());
			}
			else if (des_cmd == "size_processes") { // int
				all_positions.setSizeProcesses(getInt());
			}
			else if (des_cmd == "ref_structure_flag") { // 0/1
				all_positions.setRefStructureFlag(getInt());
			}			
			else if (des_cmd == "include_backbone_flag") { // 0/1
				charmm_computations.setIncludeBackboneFlag(getInt());
			}			
			else if (des_cmd == "restrict_pair_energies") { // int
				all_positions.restrictPairEnergies(getFloat());
			}			
			else if (des_cmd == "dee_short_flag") { // 0/1
				all_positions.setDeeShortFlag(getInt());
			}			
			else if (des_cmd == "skip_read_pair_energies") {
				all_positions.skip_read_pair_energies();
			}			
			else if (des_cmd == "pair_energies") {
				all_positions.computePairEnergies();
			}
			else if (des_cmd == "remote_machines") {
					// <machinefile> <slave script file>
				char str1[50]; char str2[50];
				scanf("%s",str1); scanf("%s",str2);
				all_positions.setRemoteMachines(str1,str2);
			}
			else if (des_cmd == "pair_list_energies") {
					// int int ...  # 
				all_positions.pairListEnergies();
			}
			else if (des_cmd == "penalize_unequal_pairs") {
					// string, int, string, int, float
				scanf("%s",buffer);
				string segid1 = buffer;
				int resid1 = getInt();
				scanf("%s",buffer);
				string segid2 = buffer;
				int resid2 = getInt();
				all_positions.penalizeUnequalPairs(
						segid1,resid1,segid2,resid2,getFloat());
			}
			else if (des_cmd == "set_patch_prefix"){
				// residue_position, residue_segid, prefix  15032002
				int residue_position = getInt();
				scanf("%s",buffer);
				string residue_segid = buffer;
				scanf("%s",buffer);
				string prefix = buffer;
				charmm_computations.setTerminus(pair<int,string>(residue_position,residue_segid),prefix);
			}
			else if (des_cmd == "fix_sele"){ // string #
				charmm_computations.fixSele(getChars());
			}
			else if (des_cmd == "remove_above") {
				all_positions.removeAboveMinEnergy(getFloat());
			}
			else if (des_cmd == "energy_gap") {
				all_positions.setEnergyGap(getFloat());
			}
			else if (des_cmd == "remove_but_closest") {
					// int size, int dev, int print_flag,
					// float chi1, float chi2,
					// float chi3, float chi4
				int size; size = getInt();
				float allowed_dev; allowed_dev = getFloat();
				int print_flag = getInt();
				vector<float> angle_weights;
				for (int i = 0; i < 4; ++i)
					angle_weights.push_back(getFloat());
				all_positions.removeButClosest(size,allowed_dev,
						angle_weights,print_flag);
			}
			else if (des_cmd == "dead_end_elimination") {
				all_positions.deadEndElimination();
			}
			else if (des_cmd == "read_dee_results") {
					// "cout" or file_name
				scanf("%s",buffer);
				all_positions.readDeeResults(open_istream(buffer));
				close_istream();
			}
			else if (des_cmd == "print_reduced_energies") {
					// "cout" or file_name
				scanf("%s",buffer);
				all_positions.printPairEnergies(open_ostream(buffer));
				close_ostream();
			}
			else if (des_cmd == "print_amino_acids") {
					// "cout" or file_name
				scanf("%s",buffer);
				all_positions.printAminoAcids(open_ostream(buffer));
				close_ostream();
			}
			else if (des_cmd == "print_dump") { // "cout" or file_name
					// "cout" or file_name
				scanf("%s",buffer);
				all_positions.printDump(open_ostream(buffer));
				close_ostream();
			}
			else if (des_cmd == "print_single_dump") { // "cout" or file_name
					// "cout" or file_name
				scanf("%s",buffer);
				all_positions.printDump(open_ostream(buffer),true);
				close_ostream();
			}
			else if (des_cmd == "read_dump") { // file_name
				scanf("%s",buffer);
				all_positions.readDump(open_istream(buffer));
				close_istream();
			}
			else if (des_cmd == "read_single_dump") { // file_name
				scanf("%s",buffer);
				all_positions.readDump(open_istream(buffer),true);
				close_istream();
			}
			else if (des_cmd == "print_graph") { // "cout" or file_name
					// "cout" or file_name
				scanf("%s",buffer);
				all_positions.printGraph(open_ostream(buffer));
				close_ostream();
			}
			else if (des_cmd == "print_rot_codes") { // "cout" or file_name 08112000
					// "cout" or file_name
				scanf("%s",buffer);
				all_positions.printRotCodes(open_ostream(buffer));
				close_ostream();
			}
			else if (des_cmd == "print_full_graph") { // "cout" or file_name
					// "cout" or file_name
				scanf("%s",buffer);
				all_positions.printFullGraph(open_ostream(buffer));
				close_ostream();
			}
			else if (des_cmd == "system") {
					// file_name energy_bound
				//string cmd = string("bab_rotamer_select ")+getChars();
				string cmd(getChars());
				cout << "calling " << cmd << endl;
				system(cmd.c_str());
			}
			else if (des_cmd == "read_graph_results") { // file_name
				scanf("%s",buffer);
				all_positions.readGraphResults(open_istream(buffer));
				close_istream();
			}
			else if (des_cmd == "write_all_combinations") {
				all_positions.writeAllCombinations();
				if (write_pdb_flag) {
					cout << "Sorry, cmWrite destroys the input buffer," << endl
							<< "SOME RUBBISH MAY FOLLOW NEXT, IGNORE!" << endl;
					des_cmd = "stop";
					break;
				}
				if (WriteFullInfo) {
					cout<< "Full info file already successfully written though."<<endl;
					cout<< "Break flow."<<endl;
					des_cmd = "stop";
					exit(0);
					//break;
				}
			}
			else if (des_cmd == "skip_solv_param") { // string #
				charmm_computations.setSolvSkipParam(getChars());
			}
			else if (des_cmd == "cmsolv_flag") { // 0/1
				charmm_computations.setSolvFlag(getInt());
			}
			else if (des_cmd == "gborn_param") { // string #
				charmm_computations.setGBornParam(getChars());
			}
			else if (des_cmd == "ace_param") { // string #
				charmm_computations.setACEParam(getChars());
			}
			else if (des_cmd == "store_ini_seq"){ // no parameters. Use it after all position_amino_acids
				all_positions.storeInitialSequence();
			}
			else if (des_cmd == "store_seq"){ // sequence
				scanf("%s",buffer);
				all_positions.storeInitialSequence(buffer);
			}
			else if (des_cmd == "add_min_ref_energy"){  // float  (multiplicative factor)
				all_positions.addMinRefEnergy(getFloat());
			}
			else if (des_cmd == "cons_harm_force"){  // float  (multiplicative factor)
				charmm_computations.setConsHarmForce(getFloat());
			}
			else if (des_cmd == "scale_pair_elec"){  // float  (multiplicative factor)
				all_positions.scaleElecPairEnergies(getFloat());
			}
			else if (des_cmd == "design"){ // here we use the default number of iterations
				des_cmd="ESCAPE";
				all_positions.Design();
			}
			else if (des_cmd == "design_it"){ // int  (number of iterations)
				des_cmd="ESCAPE";
				all_positions.Design(getInt());
				break;// back to charmm parsing (to avoid recursive loops)
			}
			else if (des_cmd == "compute_minimum"){ // int  (number of iterations)
				des_cmd="ESCAPE";
				all_positions.computeMinimum(getInt());
				break;// back to charmm parsing (to avoid recursive loops)
			}
			else if (des_cmd == "thread_combinations"){ // we should have defined the write_graph_file and short_info_file
				all_positions.threadCombinations();
			}
			else if (des_cmd == "write_graph_file"){ // string  (output graph file after design)
				scanf("%s",buffer);
				all_positions.setWriteGraphFile(buffer);
			}
			else if (des_cmd == "all_atoms_flag"){  // 0/1
				charmm_computations.setAllAtomsFlag(getInt());
				all_positions.setEef1Flag(0);
			}
                        else if (des_cmd == "remote_machines_alf") {
                                        // <machinefile> <slave script file>
                                char str1[50]; char str2[50];
                                scanf("%s",str1); scanf("%s",str2);
                                all_positions.setRemoteMachinesAlf(str1,str2);
                        }
			else if (des_cmd == "distributed") {
					// int int ...  # 
				all_positions.distributed();
			}
			else if (des_cmd == "generate_combinations") {
				all_positions.generateCombinations();
				if (write_pdb_flag) {
					cout << "Sorry, cmWrite destroys the input buffer," << endl
							<< "no further command line processing possible" << endl;
					des_cmd = "stop";
					break;
				}
			}
			else if (des_cmd == "pdb_file_prefix") {
				scanf("%s",buffer);
				all_positions.setPDBFilePrefix(buffer);
				write_pdb_flag = 1;
			}
			else if (des_cmd == "full_info_file_prefix") {
				scanf("%s",buffer);
				all_positions.setFullInfoFilePrefix(buffer);
			}
			else if (des_cmd == "short_info_file_name") {
				scanf("%s",buffer);
				all_positions.closeShortInfoFile(); // with this we can have several short_info_file_name
				all_positions.openShortInfoFile(buffer);
			}
			else if (des_cmd == "solvation_file_name") {
				scanf("%s",buffer);
				all_positions.openSolvationFile(buffer);
			}
			else if (des_cmd == "solvation_param_file") { // file_name (It also sets solv_type = "ASP")
				scanf("%s",buffer);
				charmm_computations.setSolvationParamFile(buffer);
			}
			else if (des_cmd == "surface_potential_param_file") { // file_name
				scanf("%s",buffer);
				charmm_computations.readPairSolvationParamFile(buffer);
			}
			else if (des_cmd == "print_positions") {
					// "cout" or file_name
				scanf("%s",buffer);
				open_ostream(buffer) << all_positions;
				close_ostream();
			}
			#ifdef NOE	// NOE DESIGNER, Miguel A. Santos, HSC, Toronto, 2006.
			else if (des_cmd == "read_noe") {
				// NOE restraints will be loaded into vector<string> noeRest
				scanf("%s",buffer);
				//#ifdef NOEDEBUG
				#ifdef NOEPRN
				cout<<"DEBUGGING: going to read restraints from "<<buffer<<endl;
				#endif
				cout<<"NOE: Found "<<NOEres.readNOE(buffer,all_positions.getPosNumbers())<<" NOE restraints."<<endl;
			}
			else if (des_cmd == "set_noe") {
				if(NOEres.full().empty())
					exitError("Empty NOE restraints!");
				//Noe(noeRest);
				Noe(NOEres.getRestraints());
			}
			else if (des_cmd == "reset_noe") {
				//noeScale=1.0;
				NOEres.reset();
				string cmd="RESET";
				Noe(cmd);
			}
			else if (des_cmd == "set_noe_scale") {
				//noeScale=getFloat();
				//string cmd="SCALE "+ToString(noeScale);
				NOEres.setScale(getFloat());
				string cmd="SCALE "+ToString(NOEres.getScale());
				Noe(cmd);
			}
			else if (des_cmd == "cm_noe_cmd") {	/// Directly issue a NOE charmm comand.
				string cmd(getChars());
				Noe(cmd);
			}
			else if (des_cmd == "read_noe_constraints") { // file_name	NOE aware DESIGNER needs to apply contraints after patching
				scanf("%s",buffer); 
				all_positions.fillWithDependentLibrary(
						open_istream(buffer),app_hash_table);
				close_istream();
			}
			#ifdef NOEDEBUGFULL
			else if (des_cmd == "cm_energy") { //  testing energy calculation
				cout << " DEBUGGING: calling cm_energy..." << endl;
                		charmm_computations.cmBuild();
                		//charmm_computations.writePDB("alx.pdb");
                		//exitError("STOP after writePDB");
                		charmm_computations.computeSurface();
                		float _template_aspot =  charmm_computations.aspotAll();
				cout<< "Template_aspot: "<< _template_aspot<<endl;
				cout << "Surface: "<<endl;
				charmm_computations.computeSurface();
				cout << "SolvationAspot: "<< charmm_computations.aspotAll()-_template_aspot<<endl;
				charmm_computations.cmBuild();
				charmm_computations.unfix();
				charmm_computations.Skip();
				cmEner("");
				cout << "Energy(Pot/Elec/VDW/Solv): "<<ener_.eprop[epot]<<" "<< \
				ener_.eterm[elec]<<" "<<ener_.eterm[vdw]<<" "<<ener_.eterm[solv]<<endl;
				cout << " DEBUGGING: call to cm_energy done." << endl;
			}
			else if (des_cmd == "cm_noe_energy") {
			        //_last_noe_energy = ener_.eterm[noe];
       				cout<<"DEBUGGING: _last_noe_energy="<<ener_.eterm[noe]<<endl;
			}
			else if (des_cmd == "patch_all_positions") {
       				cout<<"DEBUGGING: patching all positions."<<endl;
				all_positions.patchAllPositions();
			}
			else if (des_cmd == "cm_build") {
       				cout<<"DEBUGGING: charmm build "<<endl;
				charmm_computations.cmBuild();
			}
			#endif
			#endif
			else if (des_cmd == "test") {
				cout << charmm_computations.getPsiDihedral("1CKA",4) << endl;
				cout << charmm_computations.getPhiDihedral("1CKA",4) << endl;
			}
			else if (des_cmd == "end" || des_cmd == "stop")
				break;
			else if (des_cmd == "ESCAPE" || des_cmd == "escape")
				;
			else {
				cout << " command not recognized " << des_cmd << endl;
				cout << " exiting!" << endl;
				//exit(1);
				return 1;
			}
			buffer[0] = 'x'; // empty buffer
			buffer[1] = '\0';
			des_cmd = "xxx";
		}
	} while (des_cmd != "stop" || des_cmd != "");

	cout << "rotamer selection terminated normally" << endl;
	return 0;
}
