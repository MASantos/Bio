//#include <bstring.h>
#include<string>
using namespace std;
// ***********  VERY IMPORTANT  VERY IMPORTANT  **********************

// !!! check constants with extended command 'PARA' !!!
// particularly when compiling a new charmm version (small, large, etc)
const int maxaim = 50280;
const int maxatc = 500;
const int maxa = 25140;
//const int maxlic = 25140;
const int maxres = 14000;
const int maxseg = 1000;

// constraints strings can become rather long, here is the current
// bound as specified in charmm_main.src: _consifc()
// see cmCons() below

const int cm_cons_length = 6000;
// also the selections cab be large. This parameter should be equal to 
// the comlyn length (soubroutine seleifc in charmm_main.src).
const int cm_sel_length = 7000;

// energy.fcm

int cm_print_cmd = 0;

const int lenenp = 50; // Maximum number of energy related properties. 
const int lenent = 64; // Maximum number of energy terms.  
const int lenenv = 50; // Maximum number of pressure/virial terms

// const for eprop
const int epot = 2;  // potential energy
const int tote = 0;  // total energy including EHFC
const int totke = 1; // total kinetic energy (u**2)
const int hydr = 43; // ACE hydrophobic effect
const int self = 44;   // ACE self energies
const int screen = 45; // ACE screening of coulombic interactions
const int coul = 46;   // ACE coulomb interactions
const int solv = 47;   // ACE solvation energy
const int inter = 48;  // ACE interaction energy

//const for eterm:
const int vdw = 5;
const int bond = 0;
const int angle = 1;
const int hbond = 7;
const int asp = 27;   // Atomic solvation parameter (surface) energy
const int dihe = 3;
const int elec = 6;
const int imdihe = 4; // improper planar of chiral energy
const int cdihe = 10; // dihedral restraint energy
//
//
const int noe = 13; /// NOE restraints ; added 18052006 Miguel A. Santos, HSC, Toronto
const int user = 8; /// USER energy term; added 18052006 Miguel A. Santos, HSC, Toronto
/// ~/charmm_fcm/dimens.fcm
const int MXCMSZ = 5000; /// max. length of command-line input. Must be SAME as found in dimens.fcm !!!
/*
*/
struct Ener {
	double eprop[lenenp];
	double eterm[lenent];
	double epress[lenenv];
};

// psf.fcm

struct Psfi {
	int natom, nres, nseg, nbond, ntheta, nphi,
			nimphi, ngrp, natomt, nrest, nsegt, nbondt,
			nthett, nphit, nimpht, ngrpt, nnb, ndon, nacc, nst2,
			nictot[maxseg+1], ibase[maxres+1];
};

struct Psfc {
	char segid[maxseg][4];
	char res[maxres][4];
	char resid[maxres][4];
	char type[maxaim][4];
};

// dimens.fcm

// coord.fcm

struct Coord {
	double x[maxaim];
	double y[maxaim];
	double z[maxaim];
	double wmain[maxaim];
};

// coordc.fcm

struct Coordc {
	double xcomp[maxa];
	double ycomp[maxa];
	double zcomp[maxa];
	double wcomp[maxa];
};

// heap.fcm

struct Heapst {
	int freehp;
	int heapsz;
	int* heap;
};

// bases.fcm

const int baseln = 50;

struct Bases {
	int bnbnd[baseln], lnbnd[baseln];
	int bimag[baseln], limag[baseln];
	int bnbndc[baseln], lnbndc[baseln];
	int bintcr[baseln], lintcr[baseln];
};


// intcr.fcm

struct Intcri {
	int lenic;  // Number of internal coordinates in use
};

struct Intcrd {
	int sintcr, intb1, intb2, intt1, intt2, intpic,
			intiar, intjar, intkar, intlar, inttar;
};
	

// there seems to be a slight confusion in charmm for the WRITIC has
//           WRITE(IUNIT,3) I,IIRES,AII,JJRES,AJJ,KKRES,AKK,LLRES,ALL,
//   2                        B2IC(I),T2IC(I),PIC(I),T1IC(I),B1IC(I)
// ie B2 and T2 first and B1 T1 second ???


//   eef1.fcm

struct Slv {
	int slvitc[maxatc];
	double volm[2*maxatc];
	double gref[2*maxatc];
	double ctfslv;
	double gsolv[maxaim];
};

/// ~/charmm_fcm/comand.fcm
///   Standard command-line 
///   input of CHARMM . ~/charmm_fcm/comand.fcm
struct COMMAND {			/// Accessing COMLYN -CHARMM command line stream-
	char comlyn[MXCMSZ];		/// Miguel A. Santos, HSC, Toronto, 2006
};
struct USERUSE {			/// Flag: >0 switch on user energy term calculation
	int useuser;			/// While calculating interaction energies, CHARMM
};					/// does not calculate NOE term. 

struct COMLEN {
	int comlen;
};

/*
/// ~/source/misc/noes.src	Used in ~/source/misc/noes.src SUBROUTINES NOEWRIS, NOECNSS.	
struct VOLUME {				/// Integer flag VOLUMES for pseudo-protons method:
	int volumes;			/// VOLUMES=1 use standard SUM of VOLUMES
};
					/// VOLUMES=0 use charmm (non-standar) average over distances
*/
//   Utility functions

inline void getCmChars(char* source, char* target, int size) {
	int i;
	for (i = 0; isalnum(source[i]) && i < size; ++i)
		target[i] = source[i];
	target[i] = '\0';
}

inline int cch2ch(char* out,const char* in){	/// Accessing COMLYN -CHARMM command line stream-
	int i=0;				/// Miguel A. Santos, HSC, Toronto, 2006
	while(out[i]=in[i]) i++; 
	return i;
}
inline void toUPPER( char* ch){
	while( (*ch) = (char)toupper( (int)(*ch++)) );
}

//   The connection to the fortran code

// Data structures

extern "C" {
		// comand.fcm		/// NOT USED AT ALL; IN DESIGNER SOURCE CODE. dimension=80!? Did they ever make it work? 
	//extern int comlen_;		/// I will comment them out with the structure of same names. 
	//extern char comand_[80];	/// Miguel A. Santos, HSC, Toronto, 2006
		// energy.fcm
	extern struct Ener ener_;
		// coord.fcm
	extern struct Coord coord_;
		// coordc.fcm
	extern struct Coordc coordc_;
		// heap.fcm
	extern struct Heapst heapst_;
		// bases.fcm
	extern struct Bases bases_;
		// intcr.fcm
	extern struct Intcri intcri_;
	extern struct Intcrd intcrd_;
		// psf.fcm
	extern struct Psfi psfi_;
	extern struct Psfc psfc_;
		// eef1.fcm
	extern struct Slv slv_;
		/// ~/charmm_fcm/comand.fcm
	extern struct COMMAND comand_;		/// input of CHARMM . ~/charmm_fcm/comand.fcm. NOE, Miguel A. Santos, HSC, Toronto, 2006
	extern struct COMLEN comlen_;	/// input of CHARMM . ~/charmm_fcm/comand.fcm. NOE, Miguel A. Santos, HSC, Toronto, 2006
	extern struct USERUSE useruse_;	/// flag to switch on/off USERE during ENERGY calculation. See ./source/energy/energy.src and/or ../../source/energy/intere.src : NOE, Miguel A. Santos, HSC, Toronto, 2006
	//extern struct VOLUME volume_;  /// Integer flag VOLUMES. Used in ~/source/misc/noes.src SUBROUTINES NOEWRIS, NOECNSS.	
}

//   Function interfaces charmm_main.src

extern "C" {
		// initialize charmm
	void cminit_();
		// enter charmm command loop
	void cmloop_();
		// command interfaces
	void cmisicars_(int* flag,
		const int* index,
		const int* a, const int* b,
		const int* c, const int* d);
	void cmicpic_(double* angle, int* index);

	void closifc_(const char* comlyn, int* comlen);
	void consifc_(const char* comlyn, int* comlen);
	void coorifc_(const char* comlyn, int* comlen);
	void coosifc_(const char* comlyn, int* comlen, int* islct);
	void coorinit_(int* islct);
	void deleifc_(const char* comlyn, int* comlen);
	void enerifc_(const char* comlyn, int* comlen);
	void gborifc_(const char* comlyn, int* comlen); //05022001
	void aceifc_(const char* comlyn, int* comlen); //21022001
	void geneifc_(const char* comlyn, int* comlen);
	void icifc_(const char* comlyn, int* comlen);
	void icedifc_(const char* comlyn, int* comlen);
	void inteifc_(const char* comlyn, int* comlen);
	void inteselifc_(const char* comlyn, int* comlen,
			int* islct, int* jslct);
	void miniifc_(const char* comlyn, int* comlen);
	void openifc_(const char* comlyn, int* comlen);
	void patcifc_(const char* comlyn, int* comlen);
	void readifc_(const char* comlyn, int* comlen);
	void renaifc_(const char* comlyn, int* comlen);
	void seleifc_(const char* comlyn, int* comlen,
			int* flags);
	void skipifc_(const char* comlyn, int* comlen);
	void seqrdifc_(const char* comlyn, int* comlen);
	void updaifc_(const char* comlyn, int* comlen);
	void hbonifc_(const char* comlyn, int* comlen);
	void writifc_(const char* comlyn, int* comlen);
		// dummy main for fortran link
	void eef1enifc_();
	void slvprintifc_();
	void eef1init_();
	void MAIN__() {};
	void noesets_();/// NOE DESIGNER, Miguel A. Santos, HSC, Toronto, 2006.
	//void noesets_(const char* comlyn, int* comlen);		/// NOE DESIGNER, Miguel A. Santos, HSC, Toronto, 2006.
	//void noese2s_(int* islct, int* jslct, const char* comlyn, int* comlen);		/// NOE DESIGNER, Miguel A. Santos, HSC, Toronto, 2006.
};
//CMINIT()
inline void cmInitialize() {
	cminit_();
}
//CMLOOP()
inline void cmMainLoop() {
	cmloop_();
}
inline void useSumOfVolumes(const int sov){
	//int oldv=volume_.volumes;
	if(sov!=0) {
		//volume_.volumes=1;
		cout<<"NOE: pseudo-protons: Using SUM_OF_VOLUMES ";
	}else{
		//volume_.volumes=0;
		cout<<"NOE: pseudo-protons: Using AVERAGE_OVER_DISTANCE	";
	}
	//cout<<volume_.volumes<<" (previous: "<<oldv<<")";
	cout<<endl;
}
/*
*/
inline void switchUser(const int yes){
	if(yes>0){
		useruse_.useuser=1;
	#ifdef NOEDEBUGFULL
		cout<<"NOE: USERE is ON"<<endl;
	#endif
	}
	else {
		useruse_.useuser=0;
	#ifdef NOEDEBUGFULL
		cout<<"NOE: USERE is OFF"<<endl;
	#endif
	}
}
inline int isUsingUser(){return useruse_.useuser;}
/*
inline void switchUser( int yes){
	if(yes>0){
		useruse_.useuser=1;
		cout<<"NOE: USERE is ON"<<endl;
	}
	else {
		useruse_.useuser=0;
		cout<<"NOE: USERE is OFF"<<endl;
	}
}
*/
		
//NOESETS()
inline void Noe(vector<string > noerest) {
        for(int i=0;i<noerest.size();i++){
		memset(comand_.comlyn,'\0',sizeof(comand_.comlyn));comlen_.comlen=0;
       		comlen_.comlen=cch2ch(comand_.comlyn,noerest[i].c_str());
       		toUPPER(comand_.comlyn);
		//cout<<"DEBUGGING: Sending NOE restraints array to CHARMM: "<<comand_.comlyn<<endl;
		noesets_();
	}
}
inline void Noe(string& cmd) {
	memset(comand_.comlyn,'\0',sizeof(comand_.comlyn));comlen_.comlen=0;
	comlen_.comlen=cch2ch(comand_.comlyn,cmd.c_str());
	toUPPER(comand_.comlyn);
	noesets_();
}
inline void Noe(const string& cmd) {
	memset(comand_.comlyn,'\0',sizeof(comand_.comlyn));comlen_.comlen=0;
	comlen_.comlen=cch2ch(comand_.comlyn,cmd.c_str());
	toUPPER(comand_.comlyn);
	noesets_();
}
//NOESE2S()
inline void cmNoe2(int* islct, int* jslct, const string& cmd) {
	int cmdlen = cmd.length();
	if (cm_print_cmd) cout << "NOE " << endl;
	//noese2s_(islct,jslct,cmd.c_str(),&cmdlen);
}
//cmNoeAssign()
inline void cmNoeAssign(const string& str) {
}

//cmisicars()
inline bool cmIsIcArs(int& index, int& a, int& b, int& c, int& d) {
	int flag;
	cmisicars_(&flag,&index,&a,&b,&c,&d);
	return flag == 1;
}

//cmicpic()
inline float cmIcPic(int index) {
	double angle;
	cmicpic_(&angle,&index);
	return angle;
}

inline void cmClos(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "CLOS " << str << endl;
	closifc_(str.c_str(),&str_len);
}

inline void cmCons(const string& str) {
	if (str.length() >= cm_cons_length)
		cout << " WARNING constraint too long " << endl;
	int str_len = str.length();
	if (cm_print_cmd) cout << "CONS " << str << endl;
	consifc_(str.c_str(),&str_len);
}

inline void cmCoor(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "COOR " << str << endl;
	coorifc_(str.c_str(),&str_len);
}
//coorifc()
inline void cmCosf(const string& str,int* islct) {
	if (cm_print_cmd) {
		cout << "COSF islct: ";
		int i;
		for (i = 0; i < psfi_.natom; ++i)
			if (islct[i]) cout << i << " ";
		cout << endl;
	}
	string new_str = "SLSF " + str;
	int str_len = new_str.length();
	if (cm_print_cmd) cout << "COOS " << new_str << endl;
	coosifc_(new_str.c_str(),&str_len,islct);
}
//coosifc()
inline void cmCoorInit(int* islct) {
	coorinit_(islct);
}
//deleifc()
inline void cmDele(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "DELE " << str << endl;
	deleifc_(str.c_str(),&str_len);
}
//enerifc()
inline void cmEner(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "ENER " << str << endl;
	enerifc_(str.c_str(),&str_len);
}

inline void cmGene(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "GENE " << str << endl;
	geneifc_(str.c_str(),&str_len);
}
//icifc()
inline void cmIc(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "IC " << str << endl;
	icifc_(str.c_str(),&str_len);
}

inline void cmIcEd(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "IC EDIT " << str << endl;
	icedifc_(str.c_str(),&str_len);
}

inline void cmInte(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "INTE " << str << endl;
	inteifc_(str.c_str(),&str_len);
}
//inteselifc()
inline void cmInteSel(const string& str, int* islct, int* jslct) {
	int str_len = str.length();
	if (cm_print_cmd) {
		cout << "INTE islct: ";
		int i;
		for (i = 0; i < 600; ++i)
			if (islct[i]) cout << i << " ";
		cout << endl;
		cout << "INTE jslct: ";
		for (i = 0; i < 600; ++i)
			if (jslct[i]) cout << i << " ";
		cout << endl;
	}
	
	inteselifc_(str.c_str(),&str_len,islct,jslct);
}

inline void cmMini(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "MINI " << str << endl;
	miniifc_(str.c_str(),&str_len);
}

inline void cmOpen(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "OPEN " << str << endl;
	openifc_(str.c_str(),&str_len);
}
//patcifc()
inline void cmPatc(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "PATC " << str << endl;
	patcifc_(str.c_str(),&str_len);
}
//readifc()
inline void cmRead(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "READ " << str << endl;
	readifc_(str.c_str(),&str_len);
}

inline void cmRena(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "RENA " << str << endl;
	renaifc_(str.c_str(),&str_len);
}
//seleifc()
inline void cmSele(const string& str, int* flags) {
	if (str.length() >= cm_sel_length)
		cout << " cmSele ERROR: selection too long " << endl;
	string str1 = " SELE " + str + " END";
	int str_len = str1.length();
	if (cm_print_cmd) cout << str1 << endl;
	seleifc_(str1.c_str(),&str_len,flags);
}

inline void cmSkip(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "SKIP " << str << endl;
	skipifc_(str.c_str(),&str_len);
}

inline void cmSeqRd(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "READ SEQUENCE CARD " << endl << str << endl;
	seqrdifc_(str.c_str(),&str_len);
}
//updaifc()
inline void cmUpda(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "UPDA " << str << endl;
	updaifc_(str.c_str(),&str_len);
}
//hbonifc()
inline void cmHbon(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "HBON " << str << endl;
	hbonifc_(str.c_str(),&str_len);
}

inline void cmWrit(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "WRIT " << str << endl;
	writifc_(str.c_str(),&str_len);
}
// eef1enifc()
inline void cmEef1Energy() {
	eef1enifc_();
}

inline void cmEef1Print() {
	slvprintifc_();
}
// EEF1INIT()
inline void cmEef1Init() {
	eef1init_();
}

inline void cmAceOff() {
	string str = "OFF ";
	int str_len = str.length();
        if (cm_print_cmd) cout << "ACE " << str << endl;
	aceifc_(str.c_str(),&str_len);
}

inline void cmAceOn() {
        string str = "ON  ";
        int str_len = str.length();
        if (cm_print_cmd) cout << "ACE " << str << endl;
        aceifc_(str.c_str(),&str_len);
}

inline void cmGBor(const string& str) {
	int str_len = str.length();
	if (cm_print_cmd) cout << "GBOR " << str << endl;
	gborifc_(str.c_str(),&str_len);
}

