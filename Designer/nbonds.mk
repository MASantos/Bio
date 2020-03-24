# nbonds makefile
# nbonds library rules
OBJS_nbonds= \
	$(LIB)/nbonds.a(ace.o) \
	$(LIB)/nbonds.a(acean.o) \
	$(LIB)/nbonds.a(cenbf.o) \
	$(LIB)/nbonds.a(cnbnd.o) \
	$(LIB)/nbonds.a(enbf2.o) \
	$(LIB)/nbonds.a(enbfast.o) \
	$(LIB)/nbonds.a(enbond.o) \
	$(LIB)/nbonds.a(enbonda.o) \
	$(LIB)/nbonds.a(enbondg.o) \
	$(LIB)/nbonds.a(etable.o) \
	$(LIB)/nbonds.a(evdwf.o) \
	$(LIB)/nbonds.a(ewald.o) \
	$(LIB)/nbonds.a(ewaldf.o) \
	$(LIB)/nbonds.a(ewaldf2.o) \
	$(LIB)/nbonds.a(exelec.o) \
	$(LIB)/nbonds.a(fma.o) \
	$(LIB)/nbonds.a(grape.o) \
	$(LIB)/nbonds.a(heurist.o) \
	$(LIB)/nbonds.a(nbexcl.o) \
	$(LIB)/nbonds.a(nbndcc.o) \
	$(LIB)/nbonds.a(nbndf2p.o) \
	$(LIB)/nbonds.a(nbndfp.o) \
	$(LIB)/nbonds.a(nbndgc.o) \
	$(LIB)/nbonds.a(nbonda.o) \
	$(LIB)/nbonds.a(nbondg.o) \
	$(LIB)/nbonds.a(nbonds.o) \
	$(LIB)/nbonds.a(nbutil.o) \
	$(LIB)/nbonds.a(pme.o) \
	$(LIB)/nbonds.a(pmeutil.o)
#
$(LIB)/nbonds.a : $(OBJS_nbonds)
	$(RANLIB) $(LIB)/nbonds.a
	@echo nbonds COMPLETED
#
# nbonds source file rules
$(LIB)/nbonds.a(ace.o)  : $(SRC)/nbonds/ace.src
	$(FLX) $(SRC)/nbonds/ace.src
	$(FC2) ace.f
	ar rucv $(LIB)/nbonds.a ace.o
	rm ace.f
	rm ace.o
#
$(LIB)/nbonds.a(acean.o)  : $(SRC)/nbonds/acean.src
	$(FLX) $(SRC)/nbonds/acean.src
	$(FC2) acean.f
	ar rucv $(LIB)/nbonds.a acean.o
	rm acean.f
	rm acean.o
#
$(LIB)/nbonds.a(cenbf.o)  : $(SRC)/nbonds/cenbf.src
	$(FLX) $(SRC)/nbonds/cenbf.src
	$(FC2) cenbf.f
	ar rucv $(LIB)/nbonds.a cenbf.o
	rm cenbf.f
	rm cenbf.o
#
$(LIB)/nbonds.a(cnbnd.o)  : $(SRC)/nbonds/cnbnd.src
	$(FLX) $(SRC)/nbonds/cnbnd.src
	$(FC2) cnbnd.f
	ar rucv $(LIB)/nbonds.a cnbnd.o
	rm cnbnd.f
	rm cnbnd.o
#
$(LIB)/nbonds.a(enbf2.o)  : $(SRC)/nbonds/enbf2.src
	$(FLX) $(SRC)/nbonds/enbf2.src
	$(FC2) enbf2.f
	ar rucv $(LIB)/nbonds.a enbf2.o
	rm enbf2.f
	rm enbf2.o
#
$(LIB)/nbonds.a(enbfast.o)  : $(SRC)/nbonds/enbfast.src
	$(FLX) $(SRC)/nbonds/enbfast.src
	$(FC2) enbfast.f
	ar rucv $(LIB)/nbonds.a enbfast.o
	rm enbfast.f
	rm enbfast.o
#
$(LIB)/nbonds.a(enbond.o)  : $(SRC)/nbonds/enbond.src
	$(FLX) $(SRC)/nbonds/enbond.src
	$(FC2) enbond.f
	ar rucv $(LIB)/nbonds.a enbond.o
	rm enbond.f
	rm enbond.o
#
$(LIB)/nbonds.a(enbonda.o)  : $(SRC)/nbonds/enbonda.src
	$(FLX) $(SRC)/nbonds/enbonda.src
	$(FC2) enbonda.f
	ar rucv $(LIB)/nbonds.a enbonda.o
	rm enbonda.f
	rm enbonda.o
#
$(LIB)/nbonds.a(enbondg.o)  : $(SRC)/nbonds/enbondg.src
	$(FLX) $(SRC)/nbonds/enbondg.src
	$(FC2) enbondg.f
	ar rucv $(LIB)/nbonds.a enbondg.o
	rm enbondg.f
	rm enbondg.o
#
$(LIB)/nbonds.a(etable.o)  : $(SRC)/nbonds/etable.src
	$(FLX) $(SRC)/nbonds/etable.src
	$(FC2) etable.f
	ar rucv $(LIB)/nbonds.a etable.o
	rm etable.f
	rm etable.o
#
$(LIB)/nbonds.a(evdwf.o)  : $(SRC)/nbonds/evdwf.src
	$(FLX) $(SRC)/nbonds/evdwf.src
	$(FC2) evdwf.f
	ar rucv $(LIB)/nbonds.a evdwf.o
	rm evdwf.f
	rm evdwf.o
#
$(LIB)/nbonds.a(ewald.o)  : $(SRC)/nbonds/ewald.src
	$(FLX) $(SRC)/nbonds/ewald.src
	$(FC2) ewald.f
	ar rucv $(LIB)/nbonds.a ewald.o
	rm ewald.f
	rm ewald.o
#
$(LIB)/nbonds.a(ewaldf.o)  : $(SRC)/nbonds/ewaldf.src
	$(FLX) $(SRC)/nbonds/ewaldf.src
	$(FC2) ewaldf.f
	ar rucv $(LIB)/nbonds.a ewaldf.o
	rm ewaldf.f
	rm ewaldf.o
#
$(LIB)/nbonds.a(ewaldf2.o)  : $(SRC)/nbonds/ewaldf2.src
	$(FLX) $(SRC)/nbonds/ewaldf2.src
	$(FC2) ewaldf2.f
	ar rucv $(LIB)/nbonds.a ewaldf2.o
	rm ewaldf2.f
	rm ewaldf2.o
#
$(LIB)/nbonds.a(exelec.o)  : $(SRC)/nbonds/exelec.src
	$(FLX) $(SRC)/nbonds/exelec.src
	$(FC2) exelec.f
	ar rucv $(LIB)/nbonds.a exelec.o
	rm exelec.f
	rm exelec.o
#
$(LIB)/nbonds.a(fma.o)  : $(SRC)/nbonds/fma.src
	$(FLX) $(SRC)/nbonds/fma.src
	$(FC2) fma.f
	ar rucv $(LIB)/nbonds.a fma.o
	rm fma.f
	rm fma.o
#
$(LIB)/nbonds.a(grape.o)  : $(SRC)/nbonds/grape.src
	$(FLX) $(SRC)/nbonds/grape.src
	$(FC2) grape.f
	ar rucv $(LIB)/nbonds.a grape.o
	rm grape.f
	rm grape.o
#
$(LIB)/nbonds.a(heurist.o)  : $(SRC)/nbonds/heurist.src
	$(FLX) $(SRC)/nbonds/heurist.src
	$(FC2) heurist.f
	ar rucv $(LIB)/nbonds.a heurist.o
	rm heurist.f
	rm heurist.o
#
$(LIB)/nbonds.a(nbexcl.o)  : $(SRC)/nbonds/nbexcl.src
	$(FLX) $(SRC)/nbonds/nbexcl.src
	$(FC2) nbexcl.f
	ar rucv $(LIB)/nbonds.a nbexcl.o
	rm nbexcl.f
	rm nbexcl.o
#
$(LIB)/nbonds.a(nbndcc.o)  : $(SRC)/nbonds/nbndcc.src
	$(FLX) $(SRC)/nbonds/nbndcc.src
	$(FC2) nbndcc.f
	ar rucv $(LIB)/nbonds.a nbndcc.o
	rm nbndcc.f
	rm nbndcc.o
#
$(LIB)/nbonds.a(nbndf2p.o)  : $(SRC)/nbonds/nbndf2p.src
	$(FLX) $(SRC)/nbonds/nbndf2p.src
	$(FC2) nbndf2p.f
	ar rucv $(LIB)/nbonds.a nbndf2p.o
	rm nbndf2p.f
	rm nbndf2p.o
#
$(LIB)/nbonds.a(nbndfp.o)  : $(SRC)/nbonds/nbndfp.src
	$(FLX) $(SRC)/nbonds/nbndfp.src
	$(FC2) nbndfp.f
	ar rucv $(LIB)/nbonds.a nbndfp.o
	rm nbndfp.f
	rm nbndfp.o
#
$(LIB)/nbonds.a(nbndgc.o)  : $(SRC)/nbonds/nbndgc.src
	$(FLX) $(SRC)/nbonds/nbndgc.src
	$(FC2) nbndgc.f
	ar rucv $(LIB)/nbonds.a nbndgc.o
	rm nbndgc.f
	rm nbndgc.o
#
$(LIB)/nbonds.a(nbonda.o)  : $(SRC)/nbonds/nbonda.src
	$(FLX) $(SRC)/nbonds/nbonda.src
	$(FC2) nbonda.f
	ar rucv $(LIB)/nbonds.a nbonda.o
	rm nbonda.f
	rm nbonda.o
#
$(LIB)/nbonds.a(nbondg.o)  : $(SRC)/nbonds/nbondg.src
	$(FLX) $(SRC)/nbonds/nbondg.src
	$(FC2) nbondg.f
	ar rucv $(LIB)/nbonds.a nbondg.o
	rm nbondg.f
	rm nbondg.o
#
$(LIB)/nbonds.a(nbonds.o)  : $(SRC)/nbonds/nbonds.src
	$(FLX) $(SRC)/nbonds/nbonds.src
	$(FC2) nbonds.f
	ar rucv $(LIB)/nbonds.a nbonds.o
	rm nbonds.f
	rm nbonds.o
#
$(LIB)/nbonds.a(nbutil.o)  : $(SRC)/nbonds/nbutil.src
	$(FLX) $(SRC)/nbonds/nbutil.src
	$(FC2) nbutil.f
	ar rucv $(LIB)/nbonds.a nbutil.o
	rm nbutil.f
	rm nbutil.o
#
$(LIB)/nbonds.a(pme.o)  : $(SRC)/nbonds/pme.src
	$(FLX) $(SRC)/nbonds/pme.src
	$(FC2) pme.f
	ar rucv $(LIB)/nbonds.a pme.o
	rm pme.f
	rm pme.o
#
$(LIB)/nbonds.a(pmeutil.o)  : $(SRC)/nbonds/pmeutil.src
	$(FLX) $(SRC)/nbonds/pmeutil.src
	$(FC2) pmeutil.f
	ar rucv $(LIB)/nbonds.a pmeutil.o
	rm pmeutil.f
	rm pmeutil.o
#
#
# nbonds dependency file
#
$(LIB)/nbonds.a(ace.o) : block.fcm
$(LIB)/nbonds.a(ace.o) : consta.fcm
$(LIB)/nbonds.a(ace.o) : coord.fcm
$(LIB)/nbonds.a(ace.o) : deriv.fcm
$(LIB)/nbonds.a(ace.o) : dimens.fcm
$(LIB)/nbonds.a(ace.o) : energy.fcm
$(LIB)/nbonds.a(ace.o) : exfunc.fcm
$(LIB)/nbonds.a(ace.o) : impnon.fcm
$(LIB)/nbonds.a(ace.o) : inbnd.fcm
$(LIB)/nbonds.a(ace.o) : number.fcm
$(LIB)/nbonds.a(ace.o) : parallel.fcm
$(LIB)/nbonds.a(ace.o) : param.fcm
$(LIB)/nbonds.a(ace.o) : pbound.fcm
$(LIB)/nbonds.a(ace.o) : psf.fcm
$(LIB)/nbonds.a(ace.o) : rtf.fcm
$(LIB)/nbonds.a(ace.o) : stream.fcm
#
#
$(LIB)/nbonds.a(acean.o) : bases.fcm
$(LIB)/nbonds.a(acean.o) : consta.fcm
$(LIB)/nbonds.a(acean.o) : coord.fcm
$(LIB)/nbonds.a(acean.o) : dimens.fcm
$(LIB)/nbonds.a(acean.o) : energy.fcm
$(LIB)/nbonds.a(acean.o) : exfunc.fcm
$(LIB)/nbonds.a(acean.o) : heap.fcm
$(LIB)/nbonds.a(acean.o) : impnon.fcm
$(LIB)/nbonds.a(acean.o) : inbnd.fcm
$(LIB)/nbonds.a(acean.o) : number.fcm
$(LIB)/nbonds.a(acean.o) : param.fcm
$(LIB)/nbonds.a(acean.o) : psf.fcm
$(LIB)/nbonds.a(acean.o) : stream.fcm
#
#
$(LIB)/nbonds.a(cenbf.o) : consta.fcm
$(LIB)/nbonds.a(cenbf.o) : coord.fcm
$(LIB)/nbonds.a(cenbf.o) : dimens.fcm
$(LIB)/nbonds.a(cenbf.o) : impnon.fcm
$(LIB)/nbonds.a(cenbf.o) : number.fcm
$(LIB)/nbonds.a(cenbf.o) : pbound.fcm
#
#
$(LIB)/nbonds.a(cnbnd.o) : consta.fcm
$(LIB)/nbonds.a(cnbnd.o) : dimens.fcm
$(LIB)/nbonds.a(cnbnd.o) : impnon.fcm
$(LIB)/nbonds.a(cnbnd.o) : number.fcm
$(LIB)/nbonds.a(cnbnd.o) : pbound.fcm
$(LIB)/nbonds.a(cnbnd.o) : psf.fcm
$(LIB)/nbonds.a(cnbnd.o) : replica.fcm
$(LIB)/nbonds.a(cnbnd.o) : stream.fcm
$(LIB)/nbonds.a(cnbnd.o) : timer.fcm
#
#
$(LIB)/nbonds.a(enbf2.o) : consta.fcm
$(LIB)/nbonds.a(enbf2.o) : dimens.fcm
$(LIB)/nbonds.a(enbf2.o) : impnon.fcm
$(LIB)/nbonds.a(enbf2.o) : number.fcm
$(LIB)/nbonds.a(enbf2.o) : stream.fcm
#
#
$(LIB)/nbonds.a(enbfast.o) : bases.fcm
$(LIB)/nbonds.a(enbfast.o) : block.fcm
$(LIB)/nbonds.a(enbfast.o) : consta.fcm
$(LIB)/nbonds.a(enbfast.o) : coord.fcm
$(LIB)/nbonds.a(enbfast.o) : deriv.fcm
$(LIB)/nbonds.a(enbfast.o) : dimens.fcm
$(LIB)/nbonds.a(enbfast.o) : ewald.fcm
$(LIB)/nbonds.a(enbfast.o) : exfunc.fcm
$(LIB)/nbonds.a(enbfast.o) : galgor.fcm
$(LIB)/nbonds.a(enbfast.o) : heap.fcm
$(LIB)/nbonds.a(enbfast.o) : impnon.fcm
$(LIB)/nbonds.a(enbfast.o) : inbnd.fcm
$(LIB)/nbonds.a(enbfast.o) : lambda.fcm
$(LIB)/nbonds.a(enbfast.o) : mbmts1.fcm
$(LIB)/nbonds.a(enbfast.o) : number.fcm
$(LIB)/nbonds.a(enbfast.o) : param.fcm
$(LIB)/nbonds.a(enbfast.o) : pbound.fcm
$(LIB)/nbonds.a(enbfast.o) : stream.fcm
$(LIB)/nbonds.a(enbfast.o) : tbmts.fcm
#
#
$(LIB)/nbonds.a(enbond.o) : block.fcm
$(LIB)/nbonds.a(enbond.o) : dimens.fcm
$(LIB)/nbonds.a(enbond.o) : etable.fcm
$(LIB)/nbonds.a(enbond.o) : ewald.fcm
$(LIB)/nbonds.a(enbond.o) : exfunc.fcm
$(LIB)/nbonds.a(enbond.o) : fast.fcm
$(LIB)/nbonds.a(enbond.o) : ffield.fcm
$(LIB)/nbonds.a(enbond.o) : fma.fcm
$(LIB)/nbonds.a(enbond.o) : grape.fcm
$(LIB)/nbonds.a(enbond.o) : heap.fcm
$(LIB)/nbonds.a(enbond.o) : impnon.fcm
$(LIB)/nbonds.a(enbond.o) : inbnd.fcm
$(LIB)/nbonds.a(enbond.o) : machdep.fcm
$(LIB)/nbonds.a(enbond.o) : mc.fcm
$(LIB)/nbonds.a(enbond.o) : mmff.fcm
$(LIB)/nbonds.a(enbond.o) : number.fcm
$(LIB)/nbonds.a(enbond.o) : parallel.fcm
$(LIB)/nbonds.a(enbond.o) : param.fcm
$(LIB)/nbonds.a(enbond.o) : stack.fcm
$(LIB)/nbonds.a(enbond.o) : stream.fcm
$(LIB)/nbonds.a(enbond.o) : timer.fcm
#
#
$(LIB)/nbonds.a(enbonda.o) : block.fcm
$(LIB)/nbonds.a(enbonda.o) : consta.fcm
$(LIB)/nbonds.a(enbonda.o) : dimb.fcm
$(LIB)/nbonds.a(enbonda.o) : dimens.fcm
$(LIB)/nbonds.a(enbonda.o) : econt.fcm
$(LIB)/nbonds.a(enbonda.o) : euler.fcm
$(LIB)/nbonds.a(enbonda.o) : ewald.fcm
$(LIB)/nbonds.a(enbonda.o) : exfunc.fcm
$(LIB)/nbonds.a(enbonda.o) : fourd.fcm
$(LIB)/nbonds.a(enbonda.o) : heap.fcm
$(LIB)/nbonds.a(enbonda.o) : impnon.fcm
$(LIB)/nbonds.a(enbonda.o) : lambda.fcm
$(LIB)/nbonds.a(enbonda.o) : mbond.fcm
$(LIB)/nbonds.a(enbonda.o) : number.fcm
$(LIB)/nbonds.a(enbonda.o) : pbound.fcm
$(LIB)/nbonds.a(enbonda.o) : stream.fcm
#
#
$(LIB)/nbonds.a(enbondg.o) : block.fcm
$(LIB)/nbonds.a(enbondg.o) : consta.fcm
$(LIB)/nbonds.a(enbondg.o) : dimb.fcm
$(LIB)/nbonds.a(enbondg.o) : dimens.fcm
$(LIB)/nbonds.a(enbondg.o) : ewald.fcm
$(LIB)/nbonds.a(enbondg.o) : exfunc.fcm
$(LIB)/nbonds.a(enbondg.o) : heap.fcm
$(LIB)/nbonds.a(enbondg.o) : impnon.fcm
$(LIB)/nbonds.a(enbondg.o) : mbond.fcm
$(LIB)/nbonds.a(enbondg.o) : number.fcm
$(LIB)/nbonds.a(enbondg.o) : pbound.fcm
$(LIB)/nbonds.a(enbondg.o) : stream.fcm
$(LIB)/nbonds.a(enbondg.o) : tbmts.fcm
#
#
$(LIB)/nbonds.a(etable.o) : consta.fcm
$(LIB)/nbonds.a(etable.o) : ctitla.fcm
$(LIB)/nbonds.a(etable.o) : dimb.fcm
$(LIB)/nbonds.a(etable.o) : dimens.fcm
$(LIB)/nbonds.a(etable.o) : etable.fcm
$(LIB)/nbonds.a(etable.o) : exfunc.fcm
$(LIB)/nbonds.a(etable.o) : heap.fcm
$(LIB)/nbonds.a(etable.o) : impnon.fcm
$(LIB)/nbonds.a(etable.o) : stream.fcm
#
#
$(LIB)/nbonds.a(evdwf.o) : block.fcm
$(LIB)/nbonds.a(evdwf.o) : consta.fcm
$(LIB)/nbonds.a(evdwf.o) : dimens.fcm
$(LIB)/nbonds.a(evdwf.o) : ewald.fcm
$(LIB)/nbonds.a(evdwf.o) : exfunc.fcm
$(LIB)/nbonds.a(evdwf.o) : fast.fcm
$(LIB)/nbonds.a(evdwf.o) : heap.fcm
$(LIB)/nbonds.a(evdwf.o) : impnon.fcm
$(LIB)/nbonds.a(evdwf.o) : inbnd.fcm
$(LIB)/nbonds.a(evdwf.o) : machdep.fcm
$(LIB)/nbonds.a(evdwf.o) : number.fcm
$(LIB)/nbonds.a(evdwf.o) : param.fcm
$(LIB)/nbonds.a(evdwf.o) : stream.fcm
#
#
$(LIB)/nbonds.a(ewald.o) : consta.fcm
$(LIB)/nbonds.a(ewald.o) : dimens.fcm
$(LIB)/nbonds.a(ewald.o) : econt.fcm
$(LIB)/nbonds.a(ewald.o) : ewald.fcm
$(LIB)/nbonds.a(ewald.o) : exfunc.fcm
$(LIB)/nbonds.a(ewald.o) : heap.fcm
$(LIB)/nbonds.a(ewald.o) : impnon.fcm
$(LIB)/nbonds.a(ewald.o) : inbnd.fcm
$(LIB)/nbonds.a(ewald.o) : number.fcm
$(LIB)/nbonds.a(ewald.o) : parallel.fcm
$(LIB)/nbonds.a(ewald.o) : param.fcm
$(LIB)/nbonds.a(ewald.o) : stream.fcm
#
#
$(LIB)/nbonds.a(ewaldf.o) : consta.fcm
$(LIB)/nbonds.a(ewaldf.o) : dimens.fcm
$(LIB)/nbonds.a(ewaldf.o) : ewald.fcm
$(LIB)/nbonds.a(ewaldf.o) : exfunc.fcm
$(LIB)/nbonds.a(ewaldf.o) : fast.fcm
$(LIB)/nbonds.a(ewaldf.o) : heap.fcm
$(LIB)/nbonds.a(ewaldf.o) : image.fcm
$(LIB)/nbonds.a(ewaldf.o) : impnon.fcm
$(LIB)/nbonds.a(ewaldf.o) : inbnd.fcm
$(LIB)/nbonds.a(ewaldf.o) : machdep.fcm
$(LIB)/nbonds.a(ewaldf.o) : number.fcm
$(LIB)/nbonds.a(ewaldf.o) : parallel.fcm
$(LIB)/nbonds.a(ewaldf.o) : pme.fcm
$(LIB)/nbonds.a(ewaldf.o) : stack.fcm
$(LIB)/nbonds.a(ewaldf.o) : stream.fcm
$(LIB)/nbonds.a(ewaldf.o) : tsms.fcm
#
#
$(LIB)/nbonds.a(ewaldf2.o) : consta.fcm
$(LIB)/nbonds.a(ewaldf2.o) : dimens.fcm
$(LIB)/nbonds.a(ewaldf2.o) : ewald.fcm
$(LIB)/nbonds.a(ewaldf2.o) : exfunc.fcm
$(LIB)/nbonds.a(ewaldf2.o) : heap.fcm
$(LIB)/nbonds.a(ewaldf2.o) : image.fcm
$(LIB)/nbonds.a(ewaldf2.o) : impnon.fcm
$(LIB)/nbonds.a(ewaldf2.o) : inbnd.fcm
$(LIB)/nbonds.a(ewaldf2.o) : machdep.fcm
$(LIB)/nbonds.a(ewaldf2.o) : number.fcm
$(LIB)/nbonds.a(ewaldf2.o) : parallel.fcm
$(LIB)/nbonds.a(ewaldf2.o) : tsmh.fcm
$(LIB)/nbonds.a(ewaldf2.o) : tsms.fcm
#
#
$(LIB)/nbonds.a(exelec.o) : consta.fcm
$(LIB)/nbonds.a(exelec.o) : dimens.fcm
$(LIB)/nbonds.a(exelec.o) : impnon.fcm
$(LIB)/nbonds.a(exelec.o) : number.fcm
$(LIB)/nbonds.a(exelec.o) : parallel.fcm
$(LIB)/nbonds.a(exelec.o) : stream.fcm
#
#
$(LIB)/nbonds.a(fma.o) : consta.fcm
$(LIB)/nbonds.a(fma.o) : coord.fcm
$(LIB)/nbonds.a(fma.o) : deriv.fcm
$(LIB)/nbonds.a(fma.o) : dimens.fcm
$(LIB)/nbonds.a(fma.o) : exfunc.fcm
$(LIB)/nbonds.a(fma.o) : fast.fcm
$(LIB)/nbonds.a(fma.o) : fmacons.fcm
$(LIB)/nbonds.a(fma.o) : heap.fcm
$(LIB)/nbonds.a(fma.o) : impnon.fcm
$(LIB)/nbonds.a(fma.o) : inbnd.fcm
$(LIB)/nbonds.a(fma.o) : number.fcm
$(LIB)/nbonds.a(fma.o) : psf.fcm
$(LIB)/nbonds.a(fma.o) : stream.fcm
$(LIB)/nbonds.a(fma.o) : timer.fcm
#
#
$(LIB)/nbonds.a(grape.o) : consta.fcm
$(LIB)/nbonds.a(grape.o) : dimens.fcm
$(LIB)/nbonds.a(grape.o) : energy.fcm
$(LIB)/nbonds.a(grape.o) : ewald.fcm
$(LIB)/nbonds.a(grape.o) : exfunc.fcm
$(LIB)/nbonds.a(grape.o) : grape.fcm
$(LIB)/nbonds.a(grape.o) : heap.fcm
$(LIB)/nbonds.a(grape.o) : image.fcm
$(LIB)/nbonds.a(grape.o) : impnon.fcm
$(LIB)/nbonds.a(grape.o) : number.fcm
$(LIB)/nbonds.a(grape.o) : param.fcm
$(LIB)/nbonds.a(grape.o) : psf.fcm
#
#
$(LIB)/nbonds.a(heurist.o) : bases.fcm
$(LIB)/nbonds.a(heurist.o) : contrl.fcm
$(LIB)/nbonds.a(heurist.o) : dimens.fcm
$(LIB)/nbonds.a(heurist.o) : energy.fcm
$(LIB)/nbonds.a(heurist.o) : exelec.fcm
$(LIB)/nbonds.a(heurist.o) : exfunc.fcm
$(LIB)/nbonds.a(heurist.o) : fast.fcm
$(LIB)/nbonds.a(heurist.o) : ffield.fcm
$(LIB)/nbonds.a(heurist.o) : hbond.fcm
$(LIB)/nbonds.a(heurist.o) : heap.fcm
$(LIB)/nbonds.a(heurist.o) : image.fcm
$(LIB)/nbonds.a(heurist.o) : impnon.fcm
$(LIB)/nbonds.a(heurist.o) : inbnd.fcm
$(LIB)/nbonds.a(heurist.o) : mbmts.fcm
$(LIB)/nbonds.a(heurist.o) : number.fcm
$(LIB)/nbonds.a(heurist.o) : parallel.fcm
$(LIB)/nbonds.a(heurist.o) : param.fcm
$(LIB)/nbonds.a(heurist.o) : psf.fcm
$(LIB)/nbonds.a(heurist.o) : stack.fcm
$(LIB)/nbonds.a(heurist.o) : stream.fcm
$(LIB)/nbonds.a(heurist.o) : tsms.fcm
#
#
$(LIB)/nbonds.a(nbexcl.o) : bases.fcm
$(LIB)/nbonds.a(nbexcl.o) : cff.fcm
$(LIB)/nbonds.a(nbexcl.o) : dimens.fcm
$(LIB)/nbonds.a(nbexcl.o) : ewald.fcm
$(LIB)/nbonds.a(nbexcl.o) : exclar.fcm
$(LIB)/nbonds.a(nbexcl.o) : exfunc.fcm
$(LIB)/nbonds.a(nbexcl.o) : fast.fcm
$(LIB)/nbonds.a(nbexcl.o) : ffield.fcm
$(LIB)/nbonds.a(nbexcl.o) : heap.fcm
$(LIB)/nbonds.a(nbexcl.o) : image.fcm
$(LIB)/nbonds.a(nbexcl.o) : impnon.fcm
$(LIB)/nbonds.a(nbexcl.o) : inbnd.fcm
$(LIB)/nbonds.a(nbexcl.o) : machdep.fcm
$(LIB)/nbonds.a(nbexcl.o) : number.fcm
$(LIB)/nbonds.a(nbexcl.o) : param.fcm
$(LIB)/nbonds.a(nbexcl.o) : psf.fcm
$(LIB)/nbonds.a(nbexcl.o) : replica.fcm
$(LIB)/nbonds.a(nbexcl.o) : stack.fcm
$(LIB)/nbonds.a(nbexcl.o) : stream.fcm
$(LIB)/nbonds.a(nbexcl.o) : timer.fcm
$(LIB)/nbonds.a(nbexcl.o) : tsmh.fcm
$(LIB)/nbonds.a(nbexcl.o) : tsms.fcm
#
#
$(LIB)/nbonds.a(nbndcc.o) : actclus.fcm
$(LIB)/nbonds.a(nbndcc.o) : consta.fcm
$(LIB)/nbonds.a(nbndcc.o) : dimens.fcm
$(LIB)/nbonds.a(nbndcc.o) : exclar.fcm
$(LIB)/nbonds.a(nbndcc.o) : exfunc.fcm
$(LIB)/nbonds.a(nbndcc.o) : heap.fcm
$(LIB)/nbonds.a(nbndcc.o) : impnon.fcm
$(LIB)/nbonds.a(nbndcc.o) : number.fcm
$(LIB)/nbonds.a(nbndcc.o) : psf.fcm
$(LIB)/nbonds.a(nbndcc.o) : stream.fcm
$(LIB)/nbonds.a(nbndcc.o) : timer.fcm
#
#
$(LIB)/nbonds.a(nbndf2p.o) : consta.fcm
$(LIB)/nbonds.a(nbndf2p.o) : dimens.fcm
$(LIB)/nbonds.a(nbndf2p.o) : impnon.fcm
$(LIB)/nbonds.a(nbndf2p.o) : number.fcm
$(LIB)/nbonds.a(nbndf2p.o) : psf.fcm
$(LIB)/nbonds.a(nbndf2p.o) : replica.fcm
$(LIB)/nbonds.a(nbndf2p.o) : stream.fcm
$(LIB)/nbonds.a(nbndf2p.o) : timer.fcm
#
#
$(LIB)/nbonds.a(nbndfp.o) : dimens.fcm
$(LIB)/nbonds.a(nbndfp.o) : exfunc.fcm
$(LIB)/nbonds.a(nbndfp.o) : heap.fcm
$(LIB)/nbonds.a(nbndfp.o) : impnon.fcm
$(LIB)/nbonds.a(nbndfp.o) : inbnd.fcm
$(LIB)/nbonds.a(nbndfp.o) : machdep.fcm
$(LIB)/nbonds.a(nbndfp.o) : number.fcm
$(LIB)/nbonds.a(nbndfp.o) : psf.fcm
$(LIB)/nbonds.a(nbndfp.o) : replica.fcm
$(LIB)/nbonds.a(nbndfp.o) : stream.fcm
$(LIB)/nbonds.a(nbndfp.o) : timer.fcm
$(LIB)/nbonds.a(nbndfp.o) : tsmh.fcm
$(LIB)/nbonds.a(nbndfp.o) : tsms.fcm
#
#
$(LIB)/nbonds.a(nbndgc.o) : consta.fcm
$(LIB)/nbonds.a(nbndgc.o) : dimens.fcm
$(LIB)/nbonds.a(nbndgc.o) : exfunc.fcm
$(LIB)/nbonds.a(nbndgc.o) : heap.fcm
$(LIB)/nbonds.a(nbndgc.o) : impnon.fcm
$(LIB)/nbonds.a(nbndgc.o) : mbond.fcm
$(LIB)/nbonds.a(nbndgc.o) : psf.fcm
$(LIB)/nbonds.a(nbndgc.o) : replica.fcm
$(LIB)/nbonds.a(nbndgc.o) : stream.fcm
$(LIB)/nbonds.a(nbndgc.o) : timer.fcm
#
#
$(LIB)/nbonds.a(nbonda.o) : dimens.fcm
$(LIB)/nbonds.a(nbonda.o) : excl.fcm
$(LIB)/nbonds.a(nbonda.o) : exfunc.fcm
$(LIB)/nbonds.a(nbonda.o) : fourd.fcm
$(LIB)/nbonds.a(nbonda.o) : gamess.fcm
$(LIB)/nbonds.a(nbonda.o) : heap.fcm
$(LIB)/nbonds.a(nbonda.o) : impnon.fcm
$(LIB)/nbonds.a(nbonda.o) : mbmts.fcm
$(LIB)/nbonds.a(nbonda.o) : mbond.fcm
$(LIB)/nbonds.a(nbonda.o) : number.fcm
$(LIB)/nbonds.a(nbonda.o) : parallel.fcm
$(LIB)/nbonds.a(nbonda.o) : pbound.fcm
$(LIB)/nbonds.a(nbonda.o) : pert.fcm
$(LIB)/nbonds.a(nbonda.o) : psf.fcm
$(LIB)/nbonds.a(nbonda.o) : replica.fcm
$(LIB)/nbonds.a(nbonda.o) : stream.fcm
$(LIB)/nbonds.a(nbonda.o) : tbmts.fcm
$(LIB)/nbonds.a(nbonda.o) : timer.fcm
#
#
$(LIB)/nbonds.a(nbondg.o) : consta.fcm
$(LIB)/nbonds.a(nbondg.o) : dimens.fcm
$(LIB)/nbonds.a(nbondg.o) : excl.fcm
$(LIB)/nbonds.a(nbondg.o) : exfunc.fcm
$(LIB)/nbonds.a(nbondg.o) : fourd.fcm
$(LIB)/nbonds.a(nbondg.o) : heap.fcm
$(LIB)/nbonds.a(nbondg.o) : impnon.fcm
$(LIB)/nbonds.a(nbondg.o) : mbmts.fcm
$(LIB)/nbonds.a(nbondg.o) : mbond.fcm
$(LIB)/nbonds.a(nbondg.o) : number.fcm
$(LIB)/nbonds.a(nbondg.o) : parallel.fcm
$(LIB)/nbonds.a(nbondg.o) : pbound.fcm
$(LIB)/nbonds.a(nbondg.o) : pert.fcm
$(LIB)/nbonds.a(nbondg.o) : psf.fcm
$(LIB)/nbonds.a(nbondg.o) : replica.fcm
$(LIB)/nbonds.a(nbondg.o) : stream.fcm
$(LIB)/nbonds.a(nbondg.o) : tbmts.fcm
$(LIB)/nbonds.a(nbondg.o) : timer.fcm
#
#
$(LIB)/nbonds.a(nbonds.o) : actclus.fcm
$(LIB)/nbonds.a(nbonds.o) : bases.fcm
$(LIB)/nbonds.a(nbonds.o) : block.fcm
$(LIB)/nbonds.a(nbonds.o) : dimens.fcm
$(LIB)/nbonds.a(nbonds.o) : ewald.fcm
$(LIB)/nbonds.a(nbonds.o) : excl.fcm
$(LIB)/nbonds.a(nbonds.o) : exelec.fcm
$(LIB)/nbonds.a(nbonds.o) : exfunc.fcm
$(LIB)/nbonds.a(nbonds.o) : fast.fcm
$(LIB)/nbonds.a(nbonds.o) : ffield.fcm
$(LIB)/nbonds.a(nbonds.o) : fourd.fcm
$(LIB)/nbonds.a(nbonds.o) : gamess.fcm
$(LIB)/nbonds.a(nbonds.o) : heap.fcm
$(LIB)/nbonds.a(nbonds.o) : image.fcm
$(LIB)/nbonds.a(nbonds.o) : impnon.fcm
$(LIB)/nbonds.a(nbonds.o) : inbnd.fcm
$(LIB)/nbonds.a(nbonds.o) : machdep.fcm
$(LIB)/nbonds.a(nbonds.o) : mbmts.fcm
$(LIB)/nbonds.a(nbonds.o) : mmff.fcm
$(LIB)/nbonds.a(nbonds.o) : number.fcm
$(LIB)/nbonds.a(nbonds.o) : parallel.fcm
$(LIB)/nbonds.a(nbonds.o) : pbound.fcm
$(LIB)/nbonds.a(nbonds.o) : pert.fcm
$(LIB)/nbonds.a(nbonds.o) : psf.fcm
$(LIB)/nbonds.a(nbonds.o) : quantm.fcm
$(LIB)/nbonds.a(nbonds.o) : replica.fcm
$(LIB)/nbonds.a(nbonds.o) : stack.fcm
$(LIB)/nbonds.a(nbonds.o) : stream.fcm
$(LIB)/nbonds.a(nbonds.o) : tbmts.fcm
$(LIB)/nbonds.a(nbonds.o) : tbmtsp1.fcm
$(LIB)/nbonds.a(nbonds.o) : tsmh.fcm
$(LIB)/nbonds.a(nbonds.o) : tsms.fcm
#
#
$(LIB)/nbonds.a(nbutil.o) : actclus.fcm
$(LIB)/nbonds.a(nbutil.o) : bases.fcm
$(LIB)/nbonds.a(nbutil.o) : contrl.fcm
$(LIB)/nbonds.a(nbutil.o) : coord.fcm
$(LIB)/nbonds.a(nbutil.o) : deflts.fcm
$(LIB)/nbonds.a(nbutil.o) : dimens.fcm
$(LIB)/nbonds.a(nbutil.o) : ewald.fcm
$(LIB)/nbonds.a(nbutil.o) : excl.fcm
$(LIB)/nbonds.a(nbutil.o) : exclar.fcm
$(LIB)/nbonds.a(nbutil.o) : exelec.fcm
$(LIB)/nbonds.a(nbutil.o) : exfunc.fcm
$(LIB)/nbonds.a(nbutil.o) : ffield.fcm
$(LIB)/nbonds.a(nbutil.o) : fma.fcm
$(LIB)/nbonds.a(nbutil.o) : fmacons.fcm
$(LIB)/nbonds.a(nbutil.o) : grape.fcm
$(LIB)/nbonds.a(nbutil.o) : heap.fcm
$(LIB)/nbonds.a(nbutil.o) : image.fcm
$(LIB)/nbonds.a(nbutil.o) : impnon.fcm
$(LIB)/nbonds.a(nbutil.o) : inbnd.fcm
$(LIB)/nbonds.a(nbutil.o) : number.fcm
$(LIB)/nbonds.a(nbutil.o) : pert.fcm
$(LIB)/nbonds.a(nbutil.o) : pme.fcm
$(LIB)/nbonds.a(nbutil.o) : psf.fcm
$(LIB)/nbonds.a(nbutil.o) : stack.fcm
$(LIB)/nbonds.a(nbutil.o) : stream.fcm
#
#
$(LIB)/nbonds.a(pme.o) : consta.fcm
$(LIB)/nbonds.a(pme.o) : dimens.fcm
$(LIB)/nbonds.a(pme.o) : energy.fcm
$(LIB)/nbonds.a(pme.o) : ewald.fcm
$(LIB)/nbonds.a(pme.o) : exfunc.fcm
$(LIB)/nbonds.a(pme.o) : heap.fcm
$(LIB)/nbonds.a(pme.o) : image.fcm
$(LIB)/nbonds.a(pme.o) : impnon.fcm
$(LIB)/nbonds.a(pme.o) : inbnd.fcm
$(LIB)/nbonds.a(pme.o) : number.fcm
$(LIB)/nbonds.a(pme.o) : parallel.fcm
$(LIB)/nbonds.a(pme.o) : pme.fcm
$(LIB)/nbonds.a(pme.o) : pme_par.fcm
$(LIB)/nbonds.a(pme.o) : stack.fcm
#
#
$(LIB)/nbonds.a(pmeutil.o) : consta.fcm
$(LIB)/nbonds.a(pmeutil.o) : exfunc.fcm
$(LIB)/nbonds.a(pmeutil.o) : heap.fcm
$(LIB)/nbonds.a(pmeutil.o) : impnon.fcm
$(LIB)/nbonds.a(pmeutil.o) : number.fcm
$(LIB)/nbonds.a(pmeutil.o) : parallel.fcm
$(LIB)/nbonds.a(pmeutil.o) : pme.fcm
$(LIB)/nbonds.a(pmeutil.o) : pme_par.fcm
$(LIB)/nbonds.a(pmeutil.o) : stack.fcm
$(LIB)/nbonds.a(pmeutil.o) : stream.fcm
#
