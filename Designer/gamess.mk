# gamess makefile
# gamess library rules
OBJS_gamess= \
	$(LIB)/gamess.a(aldeci.o) \
	$(LIB)/gamess.a(basecp.o) \
	$(LIB)/gamess.a(basext.o) \
	$(LIB)/gamess.a(bashuz.o) \
	$(LIB)/gamess.a(bashz2.o) \
	$(LIB)/gamess.a(basn21.o) \
	$(LIB)/gamess.a(basn31.o) \
	$(LIB)/gamess.a(bassto.o) \
	$(LIB)/gamess.a(blas.o) \
	$(LIB)/gamess.a(cphf.o) \
	$(LIB)/gamess.a(cprohf.o) \
	$(LIB)/gamess.a(ddi.o) \
	$(LIB)/gamess.a(delocl.o) \
	$(LIB)/gamess.a(drc.o) \
	$(LIB)/gamess.a(ecp.o) \
	$(LIB)/gamess.a(ecpder.o) \
	$(LIB)/gamess.a(ecphw.o) \
	$(LIB)/gamess.a(ecplib.o) \
	$(LIB)/gamess.a(ecpsbk.o) \
	$(LIB)/gamess.a(efdrvr.o) \
	$(LIB)/gamess.a(efelec.o) \
	$(LIB)/gamess.a(efgrd2.o) \
	$(LIB)/gamess.a(efgrda.o) \
	$(LIB)/gamess.a(efgrdb.o) \
	$(LIB)/gamess.a(efgrdc.o) \
	$(LIB)/gamess.a(efinp.o) \
	$(LIB)/gamess.a(efinta.o) \
	$(LIB)/gamess.a(efintb.o) \
	$(LIB)/gamess.a(efpaul.o) \
	$(LIB)/gamess.a(eigen.o) \
	$(LIB)/gamess.a(ffield.o) \
	$(LIB)/gamess.a(frfmt.o) \
	$(LIB)/gamess.a(gamess.o) \
	$(LIB)/gamess.a(gradex.o) \
	$(LIB)/gamess.a(grd1.o) \
	$(LIB)/gamess.a(grd2a.o) \
	$(LIB)/gamess.a(grd2b.o) \
	$(LIB)/gamess.a(grd2c.o) \
	$(LIB)/gamess.a(guess.o) \
	$(LIB)/gamess.a(gugdga.o) \
	$(LIB)/gamess.a(gugdgb.o) \
	$(LIB)/gamess.a(gugdm.o) \
	$(LIB)/gamess.a(gugdm2.o) \
	$(LIB)/gamess.a(gugdrt.o) \
	$(LIB)/gamess.a(gugem.o) \
	$(LIB)/gamess.a(gugsrt.o) \
	$(LIB)/gamess.a(gvb.o) \
	$(LIB)/gamess.a(hess.o) \
	$(LIB)/gamess.a(hss1a.o) \
	$(LIB)/gamess.a(hss1b.o) \
	$(LIB)/gamess.a(hss2a.o) \
	$(LIB)/gamess.a(hss2b.o) \
	$(LIB)/gamess.a(inputa.o) \
	$(LIB)/gamess.a(inputb.o) \
	$(LIB)/gamess.a(inputc.o) \
	$(LIB)/gamess.a(int1.o) \
	$(LIB)/gamess.a(int2a.o) \
	$(LIB)/gamess.a(int2b.o) \
	$(LIB)/gamess.a(iolib.o) \
	$(LIB)/gamess.a(lagran.o) \
	$(LIB)/gamess.a(local.o) \
	$(LIB)/gamess.a(loccd.o) \
	$(LIB)/gamess.a(locpol.o) \
	$(LIB)/gamess.a(mccas.o) \
	$(LIB)/gamess.a(mcqdpt.o) \
	$(LIB)/gamess.a(mcqud.o) \
	$(LIB)/gamess.a(mcscf.o) \
	$(LIB)/gamess.a(mctwo.o) \
	$(LIB)/gamess.a(morokm.o) \
	$(LIB)/gamess.a(mp2.o) \
	$(LIB)/gamess.a(mp2grd.o) \
	$(LIB)/gamess.a(mpcdat.o) \
	$(LIB)/gamess.a(mpcgrd.o) \
	$(LIB)/gamess.a(mpcint.o) \
	$(LIB)/gamess.a(mpcmol.o) \
	$(LIB)/gamess.a(mpcmsc.o) \
	$(LIB)/gamess.a(mthlib.o) \
	$(LIB)/gamess.a(nameio.o) \
	$(LIB)/gamess.a(ordint.o) \
	$(LIB)/gamess.a(parley.o) \
	$(LIB)/gamess.a(pcm.o) \
	$(LIB)/gamess.a(pcmcav.o) \
	$(LIB)/gamess.a(pcmder.o) \
	$(LIB)/gamess.a(pcmdis.o) \
	$(LIB)/gamess.a(pcmpol.o) \
	$(LIB)/gamess.a(pcmvch.o) \
	$(LIB)/gamess.a(prpel.o) \
	$(LIB)/gamess.a(prplib.o) \
	$(LIB)/gamess.a(prppop.o) \
	$(LIB)/gamess.a(rhfuhf.o) \
	$(LIB)/gamess.a(rxncrd.o) \
	$(LIB)/gamess.a(ryspol.o) \
	$(LIB)/gamess.a(scflib.o) \
	$(LIB)/gamess.a(scfmi.o) \
	$(LIB)/gamess.a(scrf.o) \
	$(LIB)/gamess.a(sobrt.o) \
	$(LIB)/gamess.a(soffac.o) \
	$(LIB)/gamess.a(sozeff.o) \
	$(LIB)/gamess.a(statpt.o) \
	$(LIB)/gamess.a(surf.o) \
	$(LIB)/gamess.a(symorb.o) \
	$(LIB)/gamess.a(symslc.o) \
	$(LIB)/gamess.a(tdhf.o) \
	$(LIB)/gamess.a(trans.o) \
	$(LIB)/gamess.a(trfdm2.o) \
	$(LIB)/gamess.a(trnstn.o) \
	$(LIB)/gamess.a(trudge.o) \
	$(LIB)/gamess.a(unport.o) \
	$(LIB)/gamess.a(vibanl.o) \
	$(LIB)/gamess.a(zheev.o) \
	$(LIB)/gamess.a(zhp9000.o) \
	$(LIB)/gamess.a(zmatrx.o) \
	$(LIB)/gamess.a(zunix.o)
#
$(LIB)/gamess.a : $(OBJS_gamess)
	$(RANLIB) $(LIB)/gamess.a
	@echo gamess COMPLETED
#
# gamess source file rules
$(LIB)/gamess.a(aldeci.o)  : $(SRC)/gamint/gamess/aldeci.src
	$(GMS) $(SRC)/gamint/gamess/aldeci 
	ar rucv $(LIB)/gamess.a aldeci.o
	rm aldeci.f
	rm aldeci.o
#
$(LIB)/gamess.a(basecp.o)  : $(SRC)/gamint/gamess/basecp.src
	$(GMS) $(SRC)/gamint/gamess/basecp 
	ar rucv $(LIB)/gamess.a basecp.o
	rm basecp.f
	rm basecp.o
#
$(LIB)/gamess.a(basext.o)  : $(SRC)/gamint/gamess/basext.src
	$(GMS) $(SRC)/gamint/gamess/basext 
	ar rucv $(LIB)/gamess.a basext.o
	rm basext.f
	rm basext.o
#
$(LIB)/gamess.a(bashuz.o)  : $(SRC)/gamint/gamess/bashuz.src
	$(GMS) $(SRC)/gamint/gamess/bashuz 
	ar rucv $(LIB)/gamess.a bashuz.o
	rm bashuz.f
	rm bashuz.o
#
$(LIB)/gamess.a(bashz2.o)  : $(SRC)/gamint/gamess/bashz2.src
	$(GMS) $(SRC)/gamint/gamess/bashz2 
	ar rucv $(LIB)/gamess.a bashz2.o
	rm bashz2.f
	rm bashz2.o
#
$(LIB)/gamess.a(basn21.o)  : $(SRC)/gamint/gamess/basn21.src
	$(GMS) $(SRC)/gamint/gamess/basn21 
	ar rucv $(LIB)/gamess.a basn21.o
	rm basn21.f
	rm basn21.o
#
$(LIB)/gamess.a(basn31.o)  : $(SRC)/gamint/gamess/basn31.src
	$(GMS) $(SRC)/gamint/gamess/basn31 
	ar rucv $(LIB)/gamess.a basn31.o
	rm basn31.f
	rm basn31.o
#
$(LIB)/gamess.a(bassto.o)  : $(SRC)/gamint/gamess/bassto.src
	$(GMS) $(SRC)/gamint/gamess/bassto 
	ar rucv $(LIB)/gamess.a bassto.o
	rm bassto.f
	rm bassto.o
#
$(LIB)/gamess.a(blas.o)  : $(SRC)/gamint/gamess/blas.src
	$(GMS) $(SRC)/gamint/gamess/blas 
	ar rucv $(LIB)/gamess.a blas.o
	rm blas.f
	rm blas.o
#
$(LIB)/gamess.a(cphf.o)  : $(SRC)/gamint/gamess/cphf.src
	$(GMS) $(SRC)/gamint/gamess/cphf 
	ar rucv $(LIB)/gamess.a cphf.o
	rm cphf.f
	rm cphf.o
#
$(LIB)/gamess.a(cprohf.o)  : $(SRC)/gamint/gamess/cprohf.src
	$(GMS) $(SRC)/gamint/gamess/cprohf 
	ar rucv $(LIB)/gamess.a cprohf.o
	rm cprohf.f
	rm cprohf.o
#
$(LIB)/gamess.a(ddi.o)  : $(SRC)/gamint/gamess/ddi.src
	$(GMS) $(SRC)/gamint/gamess/ddi 
	ar rucv $(LIB)/gamess.a ddi.o
	rm ddi.f
	rm ddi.o
#
$(LIB)/gamess.a(delocl.o)  : $(SRC)/gamint/gamess/delocl.src
	$(GMS) $(SRC)/gamint/gamess/delocl 
	ar rucv $(LIB)/gamess.a delocl.o
	rm delocl.f
	rm delocl.o
#
$(LIB)/gamess.a(drc.o)  : $(SRC)/gamint/gamess/drc.src
	$(GMS) $(SRC)/gamint/gamess/drc 
	ar rucv $(LIB)/gamess.a drc.o
	rm drc.f
	rm drc.o
#
$(LIB)/gamess.a(ecp.o)  : $(SRC)/gamint/gamess/ecp.src
	$(GMS) $(SRC)/gamint/gamess/ecp 
	ar rucv $(LIB)/gamess.a ecp.o
	rm ecp.f
	rm ecp.o
#
$(LIB)/gamess.a(ecpder.o)  : $(SRC)/gamint/gamess/ecpder.src
	$(GMS) $(SRC)/gamint/gamess/ecpder 
	ar rucv $(LIB)/gamess.a ecpder.o
	rm ecpder.f
	rm ecpder.o
#
$(LIB)/gamess.a(ecphw.o)  : $(SRC)/gamint/gamess/ecphw.src
	$(GMS) $(SRC)/gamint/gamess/ecphw 
	ar rucv $(LIB)/gamess.a ecphw.o
	rm ecphw.f
	rm ecphw.o
#
$(LIB)/gamess.a(ecplib.o)  : $(SRC)/gamint/gamess/ecplib.src
	$(GMS) $(SRC)/gamint/gamess/ecplib 
	ar rucv $(LIB)/gamess.a ecplib.o
	rm ecplib.f
	rm ecplib.o
#
$(LIB)/gamess.a(ecpsbk.o)  : $(SRC)/gamint/gamess/ecpsbk.src
	$(GMS) $(SRC)/gamint/gamess/ecpsbk 
	ar rucv $(LIB)/gamess.a ecpsbk.o
	rm ecpsbk.f
	rm ecpsbk.o
#
$(LIB)/gamess.a(efdrvr.o)  : $(SRC)/gamint/gamess/efdrvr.src
	$(GMS) $(SRC)/gamint/gamess/efdrvr 
	ar rucv $(LIB)/gamess.a efdrvr.o
	rm efdrvr.f
	rm efdrvr.o
#
$(LIB)/gamess.a(efelec.o)  : $(SRC)/gamint/gamess/efelec.src
	$(GMS) $(SRC)/gamint/gamess/efelec 
	ar rucv $(LIB)/gamess.a efelec.o
	rm efelec.f
	rm efelec.o
#
$(LIB)/gamess.a(efgrd2.o)  : $(SRC)/gamint/gamess/efgrd2.src
	$(GMS) $(SRC)/gamint/gamess/efgrd2 
	ar rucv $(LIB)/gamess.a efgrd2.o
	rm efgrd2.f
	rm efgrd2.o
#
$(LIB)/gamess.a(efgrda.o)  : $(SRC)/gamint/gamess/efgrda.src
	$(GMS) $(SRC)/gamint/gamess/efgrda 
	ar rucv $(LIB)/gamess.a efgrda.o
	rm efgrda.f
	rm efgrda.o
#
$(LIB)/gamess.a(efgrdb.o)  : $(SRC)/gamint/gamess/efgrdb.src
	$(GMS) $(SRC)/gamint/gamess/efgrdb 
	ar rucv $(LIB)/gamess.a efgrdb.o
	rm efgrdb.f
	rm efgrdb.o
#
$(LIB)/gamess.a(efgrdc.o)  : $(SRC)/gamint/gamess/efgrdc.src
	$(GMS) $(SRC)/gamint/gamess/efgrdc 
	ar rucv $(LIB)/gamess.a efgrdc.o
	rm efgrdc.f
	rm efgrdc.o
#
$(LIB)/gamess.a(efinp.o)  : $(SRC)/gamint/gamess/efinp.src
	$(GMS) $(SRC)/gamint/gamess/efinp 
	ar rucv $(LIB)/gamess.a efinp.o
	rm efinp.f
	rm efinp.o
#
$(LIB)/gamess.a(efinta.o)  : $(SRC)/gamint/gamess/efinta.src
	$(GMS) $(SRC)/gamint/gamess/efinta 
	ar rucv $(LIB)/gamess.a efinta.o
	rm efinta.f
	rm efinta.o
#
$(LIB)/gamess.a(efintb.o)  : $(SRC)/gamint/gamess/efintb.src
	$(GMS) $(SRC)/gamint/gamess/efintb 
	ar rucv $(LIB)/gamess.a efintb.o
	rm efintb.f
	rm efintb.o
#
$(LIB)/gamess.a(efpaul.o)  : $(SRC)/gamint/gamess/efpaul.src
	$(GMS) $(SRC)/gamint/gamess/efpaul 
	ar rucv $(LIB)/gamess.a efpaul.o
	rm efpaul.f
	rm efpaul.o
#
$(LIB)/gamess.a(eigen.o)  : $(SRC)/gamint/gamess/eigen.src
	$(GMS) $(SRC)/gamint/gamess/eigen 
	ar rucv $(LIB)/gamess.a eigen.o
	rm eigen.f
	rm eigen.o
#
$(LIB)/gamess.a(ffield.o)  : $(SRC)/gamint/gamess/ffield.src
	$(GMS) $(SRC)/gamint/gamess/ffield 
	ar rucv $(LIB)/gamess.a ffield.o
	rm ffield.f
	rm ffield.o
#
$(LIB)/gamess.a(frfmt.o)  : $(SRC)/gamint/gamess/frfmt.src
	$(GMS) $(SRC)/gamint/gamess/frfmt 
	ar rucv $(LIB)/gamess.a frfmt.o
	rm frfmt.f
	rm frfmt.o
#
$(LIB)/gamess.a(gamess.o)  : $(SRC)/gamint/gamess/gamess.src
	$(GMS) $(SRC)/gamint/gamess/gamess 
	ar rucv $(LIB)/gamess.a gamess.o
	rm gamess.f
	rm gamess.o
#
$(LIB)/gamess.a(gradex.o)  : $(SRC)/gamint/gamess/gradex.src
	$(GMS) $(SRC)/gamint/gamess/gradex 
	ar rucv $(LIB)/gamess.a gradex.o
	rm gradex.f
	rm gradex.o
#
$(LIB)/gamess.a(grd1.o)  : $(SRC)/gamint/gamess/grd1.src
	$(GMS) $(SRC)/gamint/gamess/grd1 
	ar rucv $(LIB)/gamess.a grd1.o
	rm grd1.f
	rm grd1.o
#
$(LIB)/gamess.a(grd2a.o)  : $(SRC)/gamint/gamess/grd2a.src
	$(GMS) $(SRC)/gamint/gamess/grd2a 
	ar rucv $(LIB)/gamess.a grd2a.o
	rm grd2a.f
	rm grd2a.o
#
$(LIB)/gamess.a(grd2b.o)  : $(SRC)/gamint/gamess/grd2b.src
	$(GMS) $(SRC)/gamint/gamess/grd2b 
	ar rucv $(LIB)/gamess.a grd2b.o
	rm grd2b.f
	rm grd2b.o
#
$(LIB)/gamess.a(grd2c.o)  : $(SRC)/gamint/gamess/grd2c.src
	$(GMS) $(SRC)/gamint/gamess/grd2c 
	ar rucv $(LIB)/gamess.a grd2c.o
	rm grd2c.f
	rm grd2c.o
#
$(LIB)/gamess.a(guess.o)  : $(SRC)/gamint/gamess/guess.src
	$(GMS) $(SRC)/gamint/gamess/guess 
	ar rucv $(LIB)/gamess.a guess.o
	rm guess.f
	rm guess.o
#
$(LIB)/gamess.a(gugdga.o)  : $(SRC)/gamint/gamess/gugdga.src
	$(GMS) $(SRC)/gamint/gamess/gugdga 
	ar rucv $(LIB)/gamess.a gugdga.o
	rm gugdga.f
	rm gugdga.o
#
$(LIB)/gamess.a(gugdgb.o)  : $(SRC)/gamint/gamess/gugdgb.src
	$(GMS) $(SRC)/gamint/gamess/gugdgb 
	ar rucv $(LIB)/gamess.a gugdgb.o
	rm gugdgb.f
	rm gugdgb.o
#
$(LIB)/gamess.a(gugdm.o)  : $(SRC)/gamint/gamess/gugdm.src
	$(GMS) $(SRC)/gamint/gamess/gugdm 
	ar rucv $(LIB)/gamess.a gugdm.o
	rm gugdm.f
	rm gugdm.o
#
$(LIB)/gamess.a(gugdm2.o)  : $(SRC)/gamint/gamess/gugdm2.src
	$(GMS) $(SRC)/gamint/gamess/gugdm2 
	ar rucv $(LIB)/gamess.a gugdm2.o
	rm gugdm2.f
	rm gugdm2.o
#
$(LIB)/gamess.a(gugdrt.o)  : $(SRC)/gamint/gamess/gugdrt.src
	$(GMS) $(SRC)/gamint/gamess/gugdrt 
	ar rucv $(LIB)/gamess.a gugdrt.o
	rm gugdrt.f
	rm gugdrt.o
#
$(LIB)/gamess.a(gugem.o)  : $(SRC)/gamint/gamess/gugem.src
	$(GMS) $(SRC)/gamint/gamess/gugem 
	ar rucv $(LIB)/gamess.a gugem.o
	rm gugem.f
	rm gugem.o
#
$(LIB)/gamess.a(gugsrt.o)  : $(SRC)/gamint/gamess/gugsrt.src
	$(GMS) $(SRC)/gamint/gamess/gugsrt 
	ar rucv $(LIB)/gamess.a gugsrt.o
	rm gugsrt.f
	rm gugsrt.o
#
$(LIB)/gamess.a(gvb.o)  : $(SRC)/gamint/gamess/gvb.src
	$(GMS) $(SRC)/gamint/gamess/gvb 
	ar rucv $(LIB)/gamess.a gvb.o
	rm gvb.f
	rm gvb.o
#
$(LIB)/gamess.a(hess.o)  : $(SRC)/gamint/gamess/hess.src
	$(GMS) $(SRC)/gamint/gamess/hess 
	ar rucv $(LIB)/gamess.a hess.o
	rm hess.f
	rm hess.o
#
$(LIB)/gamess.a(hss1a.o)  : $(SRC)/gamint/gamess/hss1a.src
	$(GMS) $(SRC)/gamint/gamess/hss1a 
	ar rucv $(LIB)/gamess.a hss1a.o
	rm hss1a.f
	rm hss1a.o
#
$(LIB)/gamess.a(hss1b.o)  : $(SRC)/gamint/gamess/hss1b.src
	$(GMS) $(SRC)/gamint/gamess/hss1b 
	ar rucv $(LIB)/gamess.a hss1b.o
	rm hss1b.f
	rm hss1b.o
#
$(LIB)/gamess.a(hss2a.o)  : $(SRC)/gamint/gamess/hss2a.src
	$(GMS) $(SRC)/gamint/gamess/hss2a 
	ar rucv $(LIB)/gamess.a hss2a.o
	rm hss2a.f
	rm hss2a.o
#
$(LIB)/gamess.a(hss2b.o)  : $(SRC)/gamint/gamess/hss2b.src
	$(GMS) $(SRC)/gamint/gamess/hss2b 
	ar rucv $(LIB)/gamess.a hss2b.o
	rm hss2b.f
	rm hss2b.o
#
$(LIB)/gamess.a(inputa.o)  : $(SRC)/gamint/gamess/inputa.src
	$(GMS) $(SRC)/gamint/gamess/inputa 
	ar rucv $(LIB)/gamess.a inputa.o
	rm inputa.f
	rm inputa.o
#
$(LIB)/gamess.a(inputb.o)  : $(SRC)/gamint/gamess/inputb.src
	$(GMS) $(SRC)/gamint/gamess/inputb 
	ar rucv $(LIB)/gamess.a inputb.o
	rm inputb.f
	rm inputb.o
#
$(LIB)/gamess.a(inputc.o)  : $(SRC)/gamint/gamess/inputc.src
	$(GMS) $(SRC)/gamint/gamess/inputc 
	ar rucv $(LIB)/gamess.a inputc.o
	rm inputc.f
	rm inputc.o
#
$(LIB)/gamess.a(int1.o)  : $(SRC)/gamint/gamess/int1.src
	$(GMS) $(SRC)/gamint/gamess/int1 
	ar rucv $(LIB)/gamess.a int1.o
	rm int1.f
	rm int1.o
#
$(LIB)/gamess.a(int2a.o)  : $(SRC)/gamint/gamess/int2a.src
	$(GMS) $(SRC)/gamint/gamess/int2a 
	ar rucv $(LIB)/gamess.a int2a.o
	rm int2a.f
	rm int2a.o
#
$(LIB)/gamess.a(int2b.o)  : $(SRC)/gamint/gamess/int2b.src
	$(GMS) $(SRC)/gamint/gamess/int2b 
	ar rucv $(LIB)/gamess.a int2b.o
	rm int2b.f
	rm int2b.o
#
$(LIB)/gamess.a(iolib.o)  : $(SRC)/gamint/gamess/iolib.src
	$(GMS) $(SRC)/gamint/gamess/iolib 
	ar rucv $(LIB)/gamess.a iolib.o
	rm iolib.f
	rm iolib.o
#
$(LIB)/gamess.a(lagran.o)  : $(SRC)/gamint/gamess/lagran.src
	$(GMS) $(SRC)/gamint/gamess/lagran 
	ar rucv $(LIB)/gamess.a lagran.o
	rm lagran.f
	rm lagran.o
#
$(LIB)/gamess.a(local.o)  : $(SRC)/gamint/gamess/local.src
	$(GMS) $(SRC)/gamint/gamess/local 
	ar rucv $(LIB)/gamess.a local.o
	rm local.f
	rm local.o
#
$(LIB)/gamess.a(loccd.o)  : $(SRC)/gamint/gamess/loccd.src
	$(GMS) $(SRC)/gamint/gamess/loccd 
	ar rucv $(LIB)/gamess.a loccd.o
	rm loccd.f
	rm loccd.o
#
$(LIB)/gamess.a(locpol.o)  : $(SRC)/gamint/gamess/locpol.src
	$(GMS) $(SRC)/gamint/gamess/locpol 
	ar rucv $(LIB)/gamess.a locpol.o
	rm locpol.f
	rm locpol.o
#
$(LIB)/gamess.a(mccas.o)  : $(SRC)/gamint/gamess/mccas.src
	$(GMS) $(SRC)/gamint/gamess/mccas 
	ar rucv $(LIB)/gamess.a mccas.o
	rm mccas.f
	rm mccas.o
#
$(LIB)/gamess.a(mcqdpt.o)  : $(SRC)/gamint/gamess/mcqdpt.src
	$(GMS) $(SRC)/gamint/gamess/mcqdpt 
	ar rucv $(LIB)/gamess.a mcqdpt.o
	rm mcqdpt.f
	rm mcqdpt.o
#
$(LIB)/gamess.a(mcqud.o)  : $(SRC)/gamint/gamess/mcqud.src
	$(GMS) $(SRC)/gamint/gamess/mcqud 
	ar rucv $(LIB)/gamess.a mcqud.o
	rm mcqud.f
	rm mcqud.o
#
$(LIB)/gamess.a(mcscf.o)  : $(SRC)/gamint/gamess/mcscf.src
	$(GMS) $(SRC)/gamint/gamess/mcscf 
	ar rucv $(LIB)/gamess.a mcscf.o
	rm mcscf.f
	rm mcscf.o
#
$(LIB)/gamess.a(mctwo.o)  : $(SRC)/gamint/gamess/mctwo.src
	$(GMS) $(SRC)/gamint/gamess/mctwo 
	ar rucv $(LIB)/gamess.a mctwo.o
	rm mctwo.f
	rm mctwo.o
#
$(LIB)/gamess.a(morokm.o)  : $(SRC)/gamint/gamess/morokm.src
	$(GMS) $(SRC)/gamint/gamess/morokm 
	ar rucv $(LIB)/gamess.a morokm.o
	rm morokm.f
	rm morokm.o
#
$(LIB)/gamess.a(mp2.o)  : $(SRC)/gamint/gamess/mp2.src
	$(GMS) $(SRC)/gamint/gamess/mp2 
	ar rucv $(LIB)/gamess.a mp2.o
	rm mp2.f
	rm mp2.o
#
$(LIB)/gamess.a(mp2grd.o)  : $(SRC)/gamint/gamess/mp2grd.src
	$(GMS) $(SRC)/gamint/gamess/mp2grd 
	ar rucv $(LIB)/gamess.a mp2grd.o
	rm mp2grd.f
	rm mp2grd.o
#
$(LIB)/gamess.a(mpcdat.o)  : $(SRC)/gamint/gamess/mpcdat.src
	$(GMS) $(SRC)/gamint/gamess/mpcdat 
	ar rucv $(LIB)/gamess.a mpcdat.o
	rm mpcdat.f
	rm mpcdat.o
#
$(LIB)/gamess.a(mpcgrd.o)  : $(SRC)/gamint/gamess/mpcgrd.src
	$(GMS) $(SRC)/gamint/gamess/mpcgrd 
	ar rucv $(LIB)/gamess.a mpcgrd.o
	rm mpcgrd.f
	rm mpcgrd.o
#
$(LIB)/gamess.a(mpcint.o)  : $(SRC)/gamint/gamess/mpcint.src
	$(GMS) $(SRC)/gamint/gamess/mpcint 
	ar rucv $(LIB)/gamess.a mpcint.o
	rm mpcint.f
	rm mpcint.o
#
$(LIB)/gamess.a(mpcmol.o)  : $(SRC)/gamint/gamess/mpcmol.src
	$(GMS) $(SRC)/gamint/gamess/mpcmol 
	ar rucv $(LIB)/gamess.a mpcmol.o
	rm mpcmol.f
	rm mpcmol.o
#
$(LIB)/gamess.a(mpcmsc.o)  : $(SRC)/gamint/gamess/mpcmsc.src
	$(GMS) $(SRC)/gamint/gamess/mpcmsc 
	ar rucv $(LIB)/gamess.a mpcmsc.o
	rm mpcmsc.f
	rm mpcmsc.o
#
$(LIB)/gamess.a(mthlib.o)  : $(SRC)/gamint/gamess/mthlib.src
	$(GMS) $(SRC)/gamint/gamess/mthlib 
	ar rucv $(LIB)/gamess.a mthlib.o
	rm mthlib.f
	rm mthlib.o
#
$(LIB)/gamess.a(nameio.o)  : $(SRC)/gamint/gamess/nameio.src
	$(GMS) $(SRC)/gamint/gamess/nameio 
	ar rucv $(LIB)/gamess.a nameio.o
	rm nameio.f
	rm nameio.o
#
$(LIB)/gamess.a(ordint.o)  : $(SRC)/gamint/gamess/ordint.src
	$(GMS) $(SRC)/gamint/gamess/ordint 
	ar rucv $(LIB)/gamess.a ordint.o
	rm ordint.f
	rm ordint.o
#
$(LIB)/gamess.a(parley.o)  : $(SRC)/gamint/gamess/parley.src
	$(GMS) $(SRC)/gamint/gamess/parley 
	ar rucv $(LIB)/gamess.a parley.o
	rm parley.f
	rm parley.o
#
$(LIB)/gamess.a(pcm.o)  : $(SRC)/gamint/gamess/pcm.src
	$(GMS) $(SRC)/gamint/gamess/pcm 
	ar rucv $(LIB)/gamess.a pcm.o
	rm pcm.f
	rm pcm.o
#
$(LIB)/gamess.a(pcmcav.o)  : $(SRC)/gamint/gamess/pcmcav.src
	$(GMS) $(SRC)/gamint/gamess/pcmcav 
	ar rucv $(LIB)/gamess.a pcmcav.o
	rm pcmcav.f
	rm pcmcav.o
#
$(LIB)/gamess.a(pcmder.o)  : $(SRC)/gamint/gamess/pcmder.src
	$(GMS) $(SRC)/gamint/gamess/pcmder 
	ar rucv $(LIB)/gamess.a pcmder.o
	rm pcmder.f
	rm pcmder.o
#
$(LIB)/gamess.a(pcmdis.o)  : $(SRC)/gamint/gamess/pcmdis.src
	$(GMS) $(SRC)/gamint/gamess/pcmdis 
	ar rucv $(LIB)/gamess.a pcmdis.o
	rm pcmdis.f
	rm pcmdis.o
#
$(LIB)/gamess.a(pcmpol.o)  : $(SRC)/gamint/gamess/pcmpol.src
	$(GMS) $(SRC)/gamint/gamess/pcmpol 
	ar rucv $(LIB)/gamess.a pcmpol.o
	rm pcmpol.f
	rm pcmpol.o
#
$(LIB)/gamess.a(pcmvch.o)  : $(SRC)/gamint/gamess/pcmvch.src
	$(GMS) $(SRC)/gamint/gamess/pcmvch 
	ar rucv $(LIB)/gamess.a pcmvch.o
	rm pcmvch.f
	rm pcmvch.o
#
$(LIB)/gamess.a(prpel.o)  : $(SRC)/gamint/gamess/prpel.src
	$(GMS) $(SRC)/gamint/gamess/prpel 
	ar rucv $(LIB)/gamess.a prpel.o
	rm prpel.f
	rm prpel.o
#
$(LIB)/gamess.a(prplib.o)  : $(SRC)/gamint/gamess/prplib.src
	$(GMS) $(SRC)/gamint/gamess/prplib 
	ar rucv $(LIB)/gamess.a prplib.o
	rm prplib.f
	rm prplib.o
#
$(LIB)/gamess.a(prppop.o)  : $(SRC)/gamint/gamess/prppop.src
	$(GMS) $(SRC)/gamint/gamess/prppop 
	ar rucv $(LIB)/gamess.a prppop.o
	rm prppop.f
	rm prppop.o
#
$(LIB)/gamess.a(rhfuhf.o)  : $(SRC)/gamint/gamess/rhfuhf.src
	$(GMS) $(SRC)/gamint/gamess/rhfuhf 
	ar rucv $(LIB)/gamess.a rhfuhf.o
	rm rhfuhf.f
	rm rhfuhf.o
#
$(LIB)/gamess.a(rxncrd.o)  : $(SRC)/gamint/gamess/rxncrd.src
	$(GMS) $(SRC)/gamint/gamess/rxncrd 
	ar rucv $(LIB)/gamess.a rxncrd.o
	rm rxncrd.f
	rm rxncrd.o
#
$(LIB)/gamess.a(ryspol.o)  : $(SRC)/gamint/gamess/ryspol.src
	$(GMS) $(SRC)/gamint/gamess/ryspol 
	ar rucv $(LIB)/gamess.a ryspol.o
	rm ryspol.f
	rm ryspol.o
#
$(LIB)/gamess.a(scflib.o)  : $(SRC)/gamint/gamess/scflib.src
	$(GMS) $(SRC)/gamint/gamess/scflib 
	ar rucv $(LIB)/gamess.a scflib.o
	rm scflib.f
	rm scflib.o
#
$(LIB)/gamess.a(scfmi.o)  : $(SRC)/gamint/gamess/scfmi.src
	$(GMS) $(SRC)/gamint/gamess/scfmi 
	ar rucv $(LIB)/gamess.a scfmi.o
	rm scfmi.f
	rm scfmi.o
#
$(LIB)/gamess.a(scrf.o)  : $(SRC)/gamint/gamess/scrf.src
	$(GMS) $(SRC)/gamint/gamess/scrf 
	ar rucv $(LIB)/gamess.a scrf.o
	rm scrf.f
	rm scrf.o
#
$(LIB)/gamess.a(sobrt.o)  : $(SRC)/gamint/gamess/sobrt.src
	$(GMS) $(SRC)/gamint/gamess/sobrt 
	ar rucv $(LIB)/gamess.a sobrt.o
	rm sobrt.f
	rm sobrt.o
#
$(LIB)/gamess.a(soffac.o)  : $(SRC)/gamint/gamess/soffac.src
	$(GMS) $(SRC)/gamint/gamess/soffac 
	ar rucv $(LIB)/gamess.a soffac.o
	rm soffac.f
	rm soffac.o
#
$(LIB)/gamess.a(sozeff.o)  : $(SRC)/gamint/gamess/sozeff.src
	$(GMS) $(SRC)/gamint/gamess/sozeff 
	ar rucv $(LIB)/gamess.a sozeff.o
	rm sozeff.f
	rm sozeff.o
#
$(LIB)/gamess.a(statpt.o)  : $(SRC)/gamint/gamess/statpt.src
	$(GMS) $(SRC)/gamint/gamess/statpt 
	ar rucv $(LIB)/gamess.a statpt.o
	rm statpt.f
	rm statpt.o
#
$(LIB)/gamess.a(surf.o)  : $(SRC)/gamint/gamess/surf.src
	$(GMS) $(SRC)/gamint/gamess/surf 
	ar rucv $(LIB)/gamess.a surf.o
	rm surf.f
	rm surf.o
#
$(LIB)/gamess.a(symorb.o)  : $(SRC)/gamint/gamess/symorb.src
	$(GMS) $(SRC)/gamint/gamess/symorb 
	ar rucv $(LIB)/gamess.a symorb.o
	rm symorb.f
	rm symorb.o
#
$(LIB)/gamess.a(symslc.o)  : $(SRC)/gamint/gamess/symslc.src
	$(GMS) $(SRC)/gamint/gamess/symslc 
	ar rucv $(LIB)/gamess.a symslc.o
	rm symslc.f
	rm symslc.o
#
$(LIB)/gamess.a(tdhf.o)  : $(SRC)/gamint/gamess/tdhf.src
	$(GMS) $(SRC)/gamint/gamess/tdhf 
	ar rucv $(LIB)/gamess.a tdhf.o
	rm tdhf.f
	rm tdhf.o
#
$(LIB)/gamess.a(trans.o)  : $(SRC)/gamint/gamess/trans.src
	$(GMS) $(SRC)/gamint/gamess/trans 
	ar rucv $(LIB)/gamess.a trans.o
	rm trans.f
	rm trans.o
#
$(LIB)/gamess.a(trfdm2.o)  : $(SRC)/gamint/gamess/trfdm2.src
	$(GMS) $(SRC)/gamint/gamess/trfdm2 
	ar rucv $(LIB)/gamess.a trfdm2.o
	rm trfdm2.f
	rm trfdm2.o
#
$(LIB)/gamess.a(trnstn.o)  : $(SRC)/gamint/gamess/trnstn.src
	$(GMS) $(SRC)/gamint/gamess/trnstn 
	ar rucv $(LIB)/gamess.a trnstn.o
	rm trnstn.f
	rm trnstn.o
#
$(LIB)/gamess.a(trudge.o)  : $(SRC)/gamint/gamess/trudge.src
	$(GMS) $(SRC)/gamint/gamess/trudge 
	ar rucv $(LIB)/gamess.a trudge.o
	rm trudge.f
	rm trudge.o
#
$(LIB)/gamess.a(unport.o)  : $(SRC)/gamint/gamess/unport.src
	$(GMS) $(SRC)/gamint/gamess/unport 
	ar rucv $(LIB)/gamess.a unport.o
	rm unport.f
	rm unport.o
#
$(LIB)/gamess.a(vibanl.o)  : $(SRC)/gamint/gamess/vibanl.src
	$(GMS) $(SRC)/gamint/gamess/vibanl 
	ar rucv $(LIB)/gamess.a vibanl.o
	rm vibanl.f
	rm vibanl.o
#
$(LIB)/gamess.a(zheev.o)  : $(SRC)/gamint/gamess/zheev.src
	$(GMS) $(SRC)/gamint/gamess/zheev 
	ar rucv $(LIB)/gamess.a zheev.o
	rm zheev.f
	rm zheev.o
#
$(LIB)/gamess.a(zhp9000.o)  : $(SRC)/gamint/gamess/zhp9000.c
	$(CC) -c $(SRC)/gamint/gamess/zhp9000.c
	ar rucv $(LIB)/gamess.a zhp9000.o
	rm zhp9000.o
#
$(LIB)/gamess.a(zmatrx.o)  : $(SRC)/gamint/gamess/zmatrx.src
	$(GMS) $(SRC)/gamint/gamess/zmatrx 
	ar rucv $(LIB)/gamess.a zmatrx.o
	rm zmatrx.f
	rm zmatrx.o
#
$(LIB)/gamess.a(zunix.o)  : $(SRC)/gamint/gamess/zunix.c
	$(CC) -c $(SRC)/gamint/gamess/zunix.c
	ar rucv $(LIB)/gamess.a zunix.o
	rm zunix.o
#
#
# gamess dependency file
#
#
