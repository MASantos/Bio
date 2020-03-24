# CHARMM 26 makefile for GNU compilers (Linux or elsewhere)
ROOT = /R1/home/shoshana/msantos/designer/devel/c27b1_des
SRC = $(ROOT)/source
FLX = $(ROOT)/tool/preflx
GMS = $(ROOT)/tool/gmscomp_gnu
LIB = $(ROOT)/lib/gnu
EXEC = $(ROOT)/exec/gnu
#CC = gcc -Dnographics -O -Dgnu
CC = gcc
CPPC = g++
# Note that CC on line 8 and GLIB on line 10, sorry
GLIB =
CPP = /bin/cat
INCLUDE = 
ADDLIB = 
# spaceholder to get GLIB on line 10....
ADDLIB := $(ADDLIB) $(GLIB)
# GNU options for MBO(N)D code:
# note that -fno-automatic -finit-local-zero are dangerous
# options because they mask incorrect behaviour. They are
# here only to simulate SGI compiler behaviour to facilitate
# initial porting from SGI (with -static)
# and eventually should be removed and offending code fixed.
# NOTE: BLAS library is needed by MBO(N) code
# BLAS for Linux/PPro from: http://www.cs.utk.edu/~ghenry/distrib
ifdef MBOND
MBONDFLG = -fno-automatic -finit-local-zero -O -Wall -Wsurprising -W -DCHARMM
INCLUDE = -I../../source/moldyn
ADDLIB := $(ADDLIB) -lblas
endif

RANLIB = ranlib
.SUFFIXES: .fcm .src .o
VPATH = fcm

ifdef GNU_F2C
FC := fort77 -O2 -w -malign-double -Nn3000 -Nx1000
LD := fort77 -O2 -w -malign-double
endif

ifdef GNU_G77
# solaris doesn's like -malign-double
#FFLAGS = -malign-double -fno-f2c -fno-backslash -O2 -fugly-complex -fno-globals -Wno-globals
FFLAGS = -fno-f2c -fno-backslash -O2 -fugly-complex -fno-globals -Wno-globals
DEFS   = -DGNU
FC := g77 $(FFLAGS) $(DEFS)
LD := g77 $(FFLAGS)
CPPC = g++
endif

# Absoft f77 v3.4
ifdef ABSOFT_F77_V34
FC := f77 -N9 -O -U -f
LD := f77 -N9 -O -U -f
endif

# pgi pgf77 3.0
ifdef PGI_F77
FC = pgf77 -O2 -Munroll -tp p6 -Mnoframe -Msecond_underscore
LD = pgf77 -O2 -Munroll -tp p6 -Mnoframe -Msecond_underscore
CPPC = pgCC
CC = pgcc -O
endif

# Absoft  f77 4.4 (f90 v5.0):
# options: f lower case symbolic names, N3 include record length in unformatted
# files, N26 big endian unformatted files, B108 append underscore to external
# procedure names, B100 optimize for PentiumPro, N86 optimize address expr.,
# U enable loop unrolling
#
ifdef ABSOFT_F77_V44
FC := f77 -f -N3 -N26 -B108 -O -U -B100 -B101  -N86
LD := f77 -O
ADDLIB := $(ADDLIB) -lU77
endif

FC := $(FC) $(INCLUDE)

ifdef PGI_F77
FC0 = pgf77 -c
else
FC0 = $(FC) -c
endif
FC1 = $(FC) -c
FC2 = $(FC) -c
FC3 = $(FC) -c
FCR = $(FC) -c -O -K -V +R +T -u
FCD = $(FC) -c -g 
FCRD = $(FC) -c -g +T +R -V -w
OBJS = \
        $(LIB)/charmm_main.o \
        $(LIB)/help.o \
        $(LIB)/iniall.o \
        $(LIB)/miscom.o \
        $(LIB)/usersb.o
LIBS = \
	$(LIB)/adumb.a \
	$(LIB)/cadint.a \
	$(LIB)/cff.a \
	$(LIB)/correl.a \
	$(LIB)/dimb.a \
	$(LIB)/dynamc.a \
	$(LIB)/energy.a \
	$(LIB)/gamint.a \
	$(LIB)/gener.a \
	$(LIB)/image.a \
	$(LIB)/io.a \
	$(LIB)/machdep.a \
	$(LIB)/manip.a \
	$(LIB)/mbond.a \
	$(LIB)/mc.a \
	$(LIB)/minmiz.a \
	$(LIB)/misc.a \
	$(LIB)/mmff.a \
	$(LIB)/molvib.a \
	$(LIB)/nbonds.a \
	$(LIB)/pert.a \
	$(LIB)/quantum.a \
	$(LIB)/rxncor.a \
	$(LIB)/shapes.a \
	$(LIB)/solvation.a \
	$(LIB)/util.a \
	$(LIB)/vibran.a
OBJEX = numrec.o dee2neg.o dee2negpar.o
FLAGEX = -DVDWELEC
NOE = 
NOE = -DNOEPRN
NOE = -DNOEDEBUG
NOE = -DNOEDEBUGFULL
NOE = -DNOEWRTINFO 
NOE = -DNOEWRTINFO -DNOEPRN
NOE = -DNOEWRTINFO -DNOEDEBUG
NOE = -DNOEDEBUG -DNOEWRTINFO 
NOE = -DNOEDEBUGFULL -DNOEWRTINFO 
NOE = -DNOE 
# See designer.cc for meaning of NOE compilation flags
#
# NOE implementation in DESIGNER implied modification of following CHARMM source files
# ../../source/misc/noe.src
# ../../source/energy/intere.src - initial tests changed also source/energy/energy.src, but it's not required.
# ~/charmm_fcm/dimens.fcm   - For using 1800 NOE restrainst it required to increase some max values.
# and interface+designer sources
# charmm_bind.h
# designer.cc
#
all: ces designer-static designer dee optimizer opt_dimer profile tags

ces: numrec.c dee2neg.c dee2negpar.c
	$(CC) -c *.c

designer : $(LIBS) $(OBJS) $(OBJEX) designer.cc
	$(CPPC) -o designer designer.cc $(FLAGEX) $(NOE) $(OBJEX) $(LIB)/*.o $(LIBS) $(LIBS) $(ADDLIB) $(GLIB) -lg2c -lpthread
	echo "Please check that the following parameters are the same:"
	./designer < para.inp | grep "^MAX"
	grep "^const int max" charmm_bind.h
	echo "des-comp: Updating all source tags" 
	rm tags
	./make-tags 

designer-static : $(LIBS) $(OBJS) $(OBJEX) designer.cc
	$(CPPC) -static -o designer-static designer.cc $(FLAGEX) $(NOE) $(OBJEX) $(LIB)/*.o $(LIBS) $(LIBS) $(ADDLIB) $(GLIB) -lg2c -lpthread
#	echo "Please check that the following parameters are the same:"
#	./designer-static < para.inp | grep "^MAX"
#	grep "^const int max" charmm_bind.h
#	echo "des-comp: Updating all source tags" 
	rm tags
	./make-tags 

dee : dee.cc $(OBJEX)
	$(CPPC) -o dee dee.cc $(OBJEX) -lg2c -lpthread -Wno-deprecated
optimizer : opt.cc
	$(CPPC) -o optimizer opt.cc -Wno-deprecated
opt_dimer : opt.cc
	$(CPPC) -o opt_dimer opt_dimer.cc -Wno-deprecated
#profile : profile.cc
#	$(CPPC) -o profile profile.cc
profile : 
	echo "SKIPPING program profile.cc due to unsolved compilation errors!"
tags : 
	echo "Updating all source tags" 
	rm tags
	./make-tags 

clean :
	rm -f ../../tool/prefx_gnu
	rm -f gnu.log 
	rm -f pref.dat 
	rm -rf ../../lib/gnu
	rm -f *.o
	rm -f designer optimizer opt_dimer dee profile
