# energy makefile
# energy library rules
OBJS_energy= \
	$(LIB)/energy.a(anal.o) \
	$(LIB)/energy.a(cenerf.o) \
	$(LIB)/energy.a(dmcons.o) \
	$(LIB)/energy.a(ecnstr.o) \
	$(LIB)/energy.a(ecntrl.o) \
	$(LIB)/energy.a(ediff.o) \
	$(LIB)/energy.a(efour.o) \
	$(LIB)/energy.a(ehbond.o) \
	$(LIB)/energy.a(eintern.o) \
	$(LIB)/energy.a(enefscal.o) \
	$(LIB)/energy.a(enefst2.o) \
	$(LIB)/energy.a(enefst2q.o) \
	$(LIB)/energy.a(enefvect.o) \
	$(LIB)/energy.a(enefvp.o) \
	$(LIB)/energy.a(energy.o) \
	$(LIB)/energy.a(enst2.o) \
	$(LIB)/energy.a(epath.o) \
	$(LIB)/energy.a(epull.o) \
	$(LIB)/energy.a(eutil.o) \
	$(LIB)/energy.a(genborn.o) \
	$(LIB)/energy.a(inertia.o) \
	$(LIB)/energy.a(intere.o) \
	$(LIB)/energy.a(pathint.o) \
	$(LIB)/energy.a(polar.o) \
	$(LIB)/energy.a(printe.o) \
	$(LIB)/energy.a(rgy.o)
#
$(LIB)/energy.a : $(OBJS_energy)
	$(RANLIB) $(LIB)/energy.a
	@echo energy COMPLETED
#
# energy source file rules
$(LIB)/energy.a(anal.o)  : $(SRC)/energy/anal.src
	$(FLX) $(SRC)/energy/anal.src
	$(FC2) anal.f
	ar rucv $(LIB)/energy.a anal.o
	rm anal.f
	rm anal.o
#
$(LIB)/energy.a(cenerf.o)  : $(SRC)/energy/cenerf.src
	$(FLX) $(SRC)/energy/cenerf.src
	$(FC2) cenerf.f
	ar rucv $(LIB)/energy.a cenerf.o
	rm cenerf.f
	rm cenerf.o
#
$(LIB)/energy.a(dmcons.o)  : $(SRC)/energy/dmcons.src
	$(FLX) $(SRC)/energy/dmcons.src
	$(FC2) dmcons.f
	ar rucv $(LIB)/energy.a dmcons.o
	rm dmcons.f
	rm dmcons.o
#
$(LIB)/energy.a(ecnstr.o)  : $(SRC)/energy/ecnstr.src
	$(FLX) $(SRC)/energy/ecnstr.src
	$(FC2) ecnstr.f
	ar rucv $(LIB)/energy.a ecnstr.o
	rm ecnstr.f
	rm ecnstr.o
#
$(LIB)/energy.a(ecntrl.o)  : $(SRC)/energy/ecntrl.src
	$(FLX) $(SRC)/energy/ecntrl.src
	$(FC2) ecntrl.f
	ar rucv $(LIB)/energy.a ecntrl.o
	rm ecntrl.f
	rm ecntrl.o
#
$(LIB)/energy.a(ediff.o)  : $(SRC)/energy/ediff.src
	$(FLX) $(SRC)/energy/ediff.src
	$(FC2) ediff.f
	ar rucv $(LIB)/energy.a ediff.o
	rm ediff.f
	rm ediff.o
#
$(LIB)/energy.a(efour.o)  : $(SRC)/energy/efour.src
	$(FLX) $(SRC)/energy/efour.src
	$(FC2) efour.f
	ar rucv $(LIB)/energy.a efour.o
	rm efour.f
	rm efour.o
#
$(LIB)/energy.a(ehbond.o)  : $(SRC)/energy/ehbond.src
	$(FLX) $(SRC)/energy/ehbond.src
	$(FC0) ehbond.f
	ar rucv $(LIB)/energy.a ehbond.o
	rm ehbond.f
	rm ehbond.o
#
$(LIB)/energy.a(eintern.o)  : $(SRC)/energy/eintern.src
	$(FLX) $(SRC)/energy/eintern.src
	$(FC2) eintern.f
	ar rucv $(LIB)/energy.a eintern.o
	rm eintern.f
	rm eintern.o
#
$(LIB)/energy.a(enefscal.o)  : $(SRC)/energy/enefscal.src
	$(FLX) $(SRC)/energy/enefscal.src
	$(FC2) enefscal.f
	ar rucv $(LIB)/energy.a enefscal.o
	rm enefscal.f
	rm enefscal.o
#
$(LIB)/energy.a(enefst2.o)  : $(SRC)/energy/enefst2.src
	$(FLX) $(SRC)/energy/enefst2.src
	$(FC2) enefst2.f
	ar rucv $(LIB)/energy.a enefst2.o
	rm enefst2.f
	rm enefst2.o
#
$(LIB)/energy.a(enefst2q.o)  : $(SRC)/energy/enefst2q.src
	$(FLX) $(SRC)/energy/enefst2q.src
	$(FC2) enefst2q.f
	ar rucv $(LIB)/energy.a enefst2q.o
	rm enefst2q.f
	rm enefst2q.o
#
$(LIB)/energy.a(enefvect.o)  : $(SRC)/energy/enefvect.src
	$(FLX) $(SRC)/energy/enefvect.src
	$(FC2) enefvect.f
	ar rucv $(LIB)/energy.a enefvect.o
	rm enefvect.f
	rm enefvect.o
#
$(LIB)/energy.a(enefvp.o)  : $(SRC)/energy/enefvp.src
	$(FLX) $(SRC)/energy/enefvp.src
	$(FC2) enefvp.f
	ar rucv $(LIB)/energy.a enefvp.o
	rm enefvp.f
	rm enefvp.o
#
$(LIB)/energy.a(energy.o)  : $(SRC)/energy/energy.src
	$(FLX) $(SRC)/energy/energy.src
	$(FC2) energy.f
	ar rucv $(LIB)/energy.a energy.o
	rm energy.f
	rm energy.o
#
$(LIB)/energy.a(enst2.o)  : $(SRC)/energy/enst2.src
	$(FLX) $(SRC)/energy/enst2.src
	$(FC2) enst2.f
	ar rucv $(LIB)/energy.a enst2.o
	rm enst2.f
	rm enst2.o
#
$(LIB)/energy.a(epath.o)  : $(SRC)/energy/epath.src
	$(FLX) $(SRC)/energy/epath.src
	$(FC2) epath.f
	ar rucv $(LIB)/energy.a epath.o
	rm epath.f
	rm epath.o
#
$(LIB)/energy.a(epull.o)  : $(SRC)/energy/epull.src
	$(FLX) $(SRC)/energy/epull.src
	$(FC2) epull.f
	ar rucv $(LIB)/energy.a epull.o
	rm epull.f
	rm epull.o
#
$(LIB)/energy.a(eutil.o)  : $(SRC)/energy/eutil.src
	$(FLX) $(SRC)/energy/eutil.src
	$(FC2) eutil.f
	ar rucv $(LIB)/energy.a eutil.o
	rm eutil.f
	rm eutil.o
#
$(LIB)/energy.a(genborn.o)  : $(SRC)/energy/genborn.src
	$(FLX) $(SRC)/energy/genborn.src
	$(FC2) genborn.f
	ar rucv $(LIB)/energy.a genborn.o
	rm genborn.f
	rm genborn.o
#
$(LIB)/energy.a(inertia.o)  : $(SRC)/energy/inertia.src
	$(FLX) $(SRC)/energy/inertia.src
	$(FC2) inertia.f
	ar rucv $(LIB)/energy.a inertia.o
	rm inertia.f
	rm inertia.o
#
$(LIB)/energy.a(intere.o)  : $(SRC)/energy/intere.src
	$(FLX) $(SRC)/energy/intere.src
	$(FC2) intere.f
	ar rucv $(LIB)/energy.a intere.o
	rm intere.f
	rm intere.o
#
$(LIB)/energy.a(pathint.o)  : $(SRC)/energy/pathint.src
	$(FLX) $(SRC)/energy/pathint.src
	$(FC2) pathint.f
	ar rucv $(LIB)/energy.a pathint.o
	rm pathint.f
	rm pathint.o
#
$(LIB)/energy.a(polar.o)  : $(SRC)/energy/polar.src
	$(FLX) $(SRC)/energy/polar.src
	$(FC2) polar.f
	ar rucv $(LIB)/energy.a polar.o
	rm polar.f
	rm polar.o
#
$(LIB)/energy.a(printe.o)  : $(SRC)/energy/printe.src
	$(FLX) $(SRC)/energy/printe.src
	$(FC2) printe.f
	ar rucv $(LIB)/energy.a printe.o
	rm printe.f
	rm printe.o
#
$(LIB)/energy.a(rgy.o)  : $(SRC)/energy/rgy.src
	$(FLX) $(SRC)/energy/rgy.src
	$(FC2) rgy.f
	ar rucv $(LIB)/energy.a rgy.o
	rm rgy.f
	rm rgy.o
#
#
# energy dependency file
#
$(LIB)/energy.a(anal.o) : coord.fcm
$(LIB)/energy.a(anal.o) : dimens.fcm
$(LIB)/energy.a(anal.o) : econt.fcm
$(LIB)/energy.a(anal.o) : exfunc.fcm
$(LIB)/energy.a(anal.o) : fast.fcm
$(LIB)/energy.a(anal.o) : impnon.fcm
$(LIB)/energy.a(anal.o) : machdep.fcm
$(LIB)/energy.a(anal.o) : psf.fcm
$(LIB)/energy.a(anal.o) : stack.fcm
$(LIB)/energy.a(anal.o) : stream.fcm
#
#
$(LIB)/energy.a(cenerf.o) : block.fcm
$(LIB)/energy.a(cenerf.o) : consta.fcm
$(LIB)/energy.a(cenerf.o) : coord.fcm
$(LIB)/energy.a(cenerf.o) : dimens.fcm
$(LIB)/energy.a(cenerf.o) : exfunc.fcm
$(LIB)/energy.a(cenerf.o) : heap.fcm
$(LIB)/energy.a(cenerf.o) : impnon.fcm
$(LIB)/energy.a(cenerf.o) : number.fcm
$(LIB)/energy.a(cenerf.o) : stream.fcm
#
#
$(LIB)/energy.a(dmcons.o) : comand.fcm
$(LIB)/energy.a(dmcons.o) : contrl.fcm
$(LIB)/energy.a(dmcons.o) : coord.fcm
$(LIB)/energy.a(dmcons.o) : dimens.fcm
$(LIB)/energy.a(dmcons.o) : dmcons.fcm
$(LIB)/energy.a(dmcons.o) : exfunc.fcm
$(LIB)/energy.a(dmcons.o) : heap.fcm
$(LIB)/energy.a(dmcons.o) : impnon.fcm
$(LIB)/energy.a(dmcons.o) : number.fcm
$(LIB)/energy.a(dmcons.o) : parallel.fcm
$(LIB)/energy.a(dmcons.o) : psf.fcm
$(LIB)/energy.a(dmcons.o) : stack.fcm
$(LIB)/energy.a(dmcons.o) : stream.fcm
#
#
$(LIB)/energy.a(ecnstr.o) : bases.fcm
$(LIB)/energy.a(ecnstr.o) : consta.fcm
$(LIB)/energy.a(ecnstr.o) : dimb.fcm
$(LIB)/energy.a(ecnstr.o) : dimens.fcm
$(LIB)/energy.a(ecnstr.o) : exfunc.fcm
$(LIB)/energy.a(ecnstr.o) : galgor.fcm
$(LIB)/energy.a(ecnstr.o) : heap.fcm
$(LIB)/energy.a(ecnstr.o) : impnon.fcm
$(LIB)/energy.a(ecnstr.o) : intcr.fcm
$(LIB)/energy.a(ecnstr.o) : number.fcm
$(LIB)/energy.a(ecnstr.o) : parallel.fcm
$(LIB)/energy.a(ecnstr.o) : stack.fcm
$(LIB)/energy.a(ecnstr.o) : stream.fcm
#
#
$(LIB)/energy.a(ecntrl.o) : cff.fcm
$(LIB)/energy.a(ecntrl.o) : dimens.fcm
$(LIB)/energy.a(ecntrl.o) : econt.fcm
$(LIB)/energy.a(ecntrl.o) : exfunc.fcm
$(LIB)/energy.a(ecntrl.o) : fast.fcm
$(LIB)/energy.a(ecntrl.o) : ffield.fcm
$(LIB)/energy.a(ecntrl.o) : fourd.fcm
$(LIB)/energy.a(ecntrl.o) : heap.fcm
$(LIB)/energy.a(ecntrl.o) : impnon.fcm
$(LIB)/energy.a(ecntrl.o) : machdep.fcm
$(LIB)/energy.a(ecntrl.o) : mmff.fcm
$(LIB)/energy.a(ecntrl.o) : param.fcm
$(LIB)/energy.a(ecntrl.o) : psf.fcm
$(LIB)/energy.a(ecntrl.o) : stream.fcm
$(LIB)/energy.a(ecntrl.o) : vangle_mm.fcm
$(LIB)/energy.a(ecntrl.o) : vphi.fcm
#
#
$(LIB)/energy.a(ediff.o) : bases.fcm
$(LIB)/energy.a(ediff.o) : block.fcm
$(LIB)/energy.a(ediff.o) : cnst.fcm
$(LIB)/energy.a(ediff.o) : code.fcm
$(LIB)/energy.a(ediff.o) : consta.fcm
$(LIB)/energy.a(ediff.o) : coord.fcm
$(LIB)/energy.a(ediff.o) : coordc.fcm
$(LIB)/energy.a(ediff.o) : deriv.fcm
$(LIB)/energy.a(ediff.o) : dimens.fcm
$(LIB)/energy.a(ediff.o) : econt.fcm
$(LIB)/energy.a(ediff.o) : energy.fcm
$(LIB)/energy.a(ediff.o) : exfunc.fcm
$(LIB)/energy.a(ediff.o) : fast.fcm
$(LIB)/energy.a(ediff.o) : ffield.fcm
$(LIB)/energy.a(ediff.o) : hbond.fcm
$(LIB)/energy.a(ediff.o) : heap.fcm
$(LIB)/energy.a(ediff.o) : image.fcm
$(LIB)/energy.a(ediff.o) : impnon.fcm
$(LIB)/energy.a(ediff.o) : inbnd.fcm
$(LIB)/energy.a(ediff.o) : lonepr.fcm
$(LIB)/energy.a(ediff.o) : mmff.fcm
$(LIB)/energy.a(ediff.o) : number.fcm
$(LIB)/energy.a(ediff.o) : param.fcm
$(LIB)/energy.a(ediff.o) : pbound.fcm
$(LIB)/energy.a(ediff.o) : psf.fcm
$(LIB)/energy.a(ediff.o) : stack.fcm
$(LIB)/energy.a(ediff.o) : stream.fcm
#
#
$(LIB)/energy.a(efour.o) : block.fcm
$(LIB)/energy.a(efour.o) : consta.fcm
$(LIB)/energy.a(efour.o) : dimens.fcm
$(LIB)/energy.a(efour.o) : energy.fcm
$(LIB)/energy.a(efour.o) : exfunc.fcm
$(LIB)/energy.a(efour.o) : fourd.fcm
$(LIB)/energy.a(efour.o) : heap.fcm
$(LIB)/energy.a(efour.o) : impnon.fcm
$(LIB)/energy.a(efour.o) : number.fcm
$(LIB)/energy.a(efour.o) : stream.fcm
#
#
$(LIB)/energy.a(ehbond.o) : code.fcm
$(LIB)/energy.a(ehbond.o) : consta.fcm
$(LIB)/energy.a(ehbond.o) : dimb.fcm
$(LIB)/energy.a(ehbond.o) : dimens.fcm
$(LIB)/energy.a(ehbond.o) : hbond.fcm
$(LIB)/energy.a(ehbond.o) : heap.fcm
$(LIB)/energy.a(ehbond.o) : impnon.fcm
$(LIB)/energy.a(ehbond.o) : param.fcm
$(LIB)/energy.a(ehbond.o) : psf.fcm
$(LIB)/energy.a(ehbond.o) : stream.fcm
#
#
$(LIB)/energy.a(eintern.o) : block.fcm
$(LIB)/energy.a(eintern.o) : consta.fcm
$(LIB)/energy.a(eintern.o) : dimb.fcm
$(LIB)/energy.a(eintern.o) : dimens.fcm
$(LIB)/energy.a(eintern.o) : econt.fcm
$(LIB)/energy.a(eintern.o) : exfunc.fcm
$(LIB)/energy.a(eintern.o) : fourd.fcm
$(LIB)/energy.a(eintern.o) : galgor.fcm
$(LIB)/energy.a(eintern.o) : heap.fcm
$(LIB)/energy.a(eintern.o) : impnon.fcm
$(LIB)/energy.a(eintern.o) : lambda.fcm
$(LIB)/energy.a(eintern.o) : mbond.fcm
$(LIB)/energy.a(eintern.o) : number.fcm
$(LIB)/energy.a(eintern.o) : parallel.fcm
$(LIB)/energy.a(eintern.o) : stream.fcm
#
#
$(LIB)/energy.a(enefscal.o) : block.fcm
$(LIB)/energy.a(enefscal.o) : code.fcm
$(LIB)/energy.a(enefscal.o) : consta.fcm
$(LIB)/energy.a(enefscal.o) : coord.fcm
$(LIB)/energy.a(enefscal.o) : deriv.fcm
$(LIB)/energy.a(enefscal.o) : dimens.fcm
$(LIB)/energy.a(enefscal.o) : exfunc.fcm
$(LIB)/energy.a(enefscal.o) : fast.fcm
$(LIB)/energy.a(enefscal.o) : fourd.fcm
$(LIB)/energy.a(enefscal.o) : galgor.fcm
$(LIB)/energy.a(enefscal.o) : heap.fcm
$(LIB)/energy.a(enefscal.o) : impnon.fcm
$(LIB)/energy.a(enefscal.o) : inbnd.fcm
$(LIB)/energy.a(enefscal.o) : lambda.fcm
$(LIB)/energy.a(enefscal.o) : mbond.fcm
$(LIB)/energy.a(enefscal.o) : number.fcm
$(LIB)/energy.a(enefscal.o) : parallel.fcm
$(LIB)/energy.a(enefscal.o) : param.fcm
$(LIB)/energy.a(enefscal.o) : psf.fcm
$(LIB)/energy.a(enefscal.o) : stream.fcm
#
#
$(LIB)/energy.a(enefst2.o) : consta.fcm
$(LIB)/energy.a(enefst2.o) : dimens.fcm
$(LIB)/energy.a(enefst2.o) : impnon.fcm
$(LIB)/energy.a(enefst2.o) : number.fcm
$(LIB)/energy.a(enefst2.o) : stream.fcm
$(LIB)/energy.a(enefst2.o) : vphi.fcm
#
#
$(LIB)/energy.a(enefst2q.o) : consta.fcm
$(LIB)/energy.a(enefst2q.o) : dimens.fcm
$(LIB)/energy.a(enefst2q.o) : impnon.fcm
$(LIB)/energy.a(enefst2q.o) : number.fcm
$(LIB)/energy.a(enefst2q.o) : stream.fcm
#
#
$(LIB)/energy.a(enefvect.o) : block.fcm
$(LIB)/energy.a(enefvect.o) : code.fcm
$(LIB)/energy.a(enefvect.o) : consta.fcm
$(LIB)/energy.a(enefvect.o) : coord.fcm
$(LIB)/energy.a(enefvect.o) : deriv.fcm
$(LIB)/energy.a(enefvect.o) : dimens.fcm
$(LIB)/energy.a(enefvect.o) : exfunc.fcm
$(LIB)/energy.a(enefvect.o) : heap.fcm
$(LIB)/energy.a(enefvect.o) : impnon.fcm
$(LIB)/energy.a(enefvect.o) : number.fcm
$(LIB)/energy.a(enefvect.o) : parallel.fcm
$(LIB)/energy.a(enefvect.o) : param.fcm
$(LIB)/energy.a(enefvect.o) : psf.fcm
$(LIB)/energy.a(enefvect.o) : stream.fcm
#
#
$(LIB)/energy.a(enefvp.o) : block.fcm
$(LIB)/energy.a(enefvp.o) : dimens.fcm
$(LIB)/energy.a(enefvp.o) : exfunc.fcm
$(LIB)/energy.a(enefvp.o) : heap.fcm
$(LIB)/energy.a(enefvp.o) : impnon.fcm
$(LIB)/energy.a(enefvp.o) : machdep.fcm
$(LIB)/energy.a(enefvp.o) : number.fcm
#
#
$(LIB)/energy.a(energy.o) : block.fcm
$(LIB)/energy.a(energy.o) : cnst.fcm
$(LIB)/energy.a(energy.o) : code.fcm
$(LIB)/energy.a(energy.o) : dimens.fcm
$(LIB)/energy.a(energy.o) : dmcons.fcm
$(LIB)/energy.a(energy.o) : econt.fcm
$(LIB)/energy.a(energy.o) : eef1.fcm
$(LIB)/energy.a(energy.o) : energy.fcm
$(LIB)/energy.a(energy.o) : euler.fcm
$(LIB)/energy.a(energy.o) : ewald.fcm
$(LIB)/energy.a(energy.o) : exelec.fcm
$(LIB)/energy.a(energy.o) : exfunc.fcm
$(LIB)/energy.a(energy.o) : fast.fcm
$(LIB)/energy.a(energy.o) : fbias.fcm
$(LIB)/energy.a(energy.o) : ffield.fcm
$(LIB)/energy.a(energy.o) : fourd.fcm
$(LIB)/energy.a(energy.o) : genborn.fcm
$(LIB)/energy.a(energy.o) : grape.fcm
$(LIB)/energy.a(energy.o) : hbond.fcm
$(LIB)/energy.a(energy.o) : heap.fcm
$(LIB)/energy.a(energy.o) : image.fcm
$(LIB)/energy.a(energy.o) : impnon.fcm
$(LIB)/energy.a(energy.o) : inbnd.fcm
$(LIB)/energy.a(energy.o) : lambda.fcm
$(LIB)/energy.a(energy.o) : lonepr.fcm
$(LIB)/energy.a(energy.o) : machdep.fcm
$(LIB)/energy.a(energy.o) : mbmts.fcm
$(LIB)/energy.a(energy.o) : mbmts1.fcm
$(LIB)/energy.a(energy.o) : mltcanon.fcm
$(LIB)/energy.a(energy.o) : mmff.fcm
$(LIB)/energy.a(energy.o) : mmfp.fcm
$(LIB)/energy.a(energy.o) : noe.fcm
$(LIB)/energy.a(energy.o) : number.fcm
$(LIB)/energy.a(energy.o) : parallel.fcm
$(LIB)/energy.a(energy.o) : param.fcm
$(LIB)/energy.a(energy.o) : path.fcm
$(LIB)/energy.a(energy.o) : pathint.fcm
$(LIB)/energy.a(energy.o) : pbeq.fcm
$(LIB)/energy.a(energy.o) : pbound.fcm
$(LIB)/energy.a(energy.o) : pert.fcm
$(LIB)/energy.a(energy.o) : polar.fcm
$(LIB)/energy.a(energy.o) : psf.fcm
$(LIB)/energy.a(energy.o) : quantm.fcm
$(LIB)/energy.a(energy.o) : resdist.fcm
$(LIB)/energy.a(energy.o) : rgy.fcm
$(LIB)/energy.a(energy.o) : rxncom.fcm
$(LIB)/energy.a(energy.o) : sbound.fcm
$(LIB)/energy.a(energy.o) : shapes.fcm
$(LIB)/energy.a(energy.o) : ssbp.fcm
$(LIB)/energy.a(energy.o) : stack.fcm
$(LIB)/energy.a(energy.o) : stream.fcm
$(LIB)/energy.a(energy.o) : surface.fcm
$(LIB)/energy.a(energy.o) : tbmts.fcm
$(LIB)/energy.a(energy.o) : tbmtsp.fcm
$(LIB)/energy.a(energy.o) : tbmtsp1.fcm
$(LIB)/energy.a(energy.o) : timer.fcm
$(LIB)/energy.a(energy.o) : tsms.fcm
$(LIB)/energy.a(energy.o) : umb.fcm
$(LIB)/energy.a(energy.o) : vangle_mm.fcm
#
#
$(LIB)/energy.a(enst2.o) : consta.fcm
$(LIB)/energy.a(enst2.o) : dimens.fcm
$(LIB)/energy.a(enst2.o) : impnon.fcm
$(LIB)/energy.a(enst2.o) : number.fcm
$(LIB)/energy.a(enst2.o) : psf.fcm
$(LIB)/energy.a(enst2.o) : shake.fcm
$(LIB)/energy.a(enst2.o) : stream.fcm
$(LIB)/energy.a(enst2.o) : tsms.fcm
#
#
$(LIB)/energy.a(epath.o) : consta.fcm
$(LIB)/energy.a(epath.o) : coord.fcm
$(LIB)/energy.a(epath.o) : dimens.fcm
$(LIB)/energy.a(epath.o) : exfunc.fcm
$(LIB)/energy.a(epath.o) : heap.fcm
$(LIB)/energy.a(epath.o) : impnon.fcm
$(LIB)/energy.a(epath.o) : number.fcm
$(LIB)/energy.a(epath.o) : path.fcm
$(LIB)/energy.a(epath.o) : psf.fcm
$(LIB)/energy.a(epath.o) : replica.fcm
$(LIB)/energy.a(epath.o) : stack.fcm
$(LIB)/energy.a(epath.o) : stream.fcm
#
#
$(LIB)/energy.a(epull.o) : consta.fcm
$(LIB)/energy.a(epull.o) : coord.fcm
$(LIB)/energy.a(epull.o) : dimens.fcm
$(LIB)/energy.a(epull.o) : exfunc.fcm
$(LIB)/energy.a(epull.o) : heap.fcm
$(LIB)/energy.a(epull.o) : impnon.fcm
$(LIB)/energy.a(epull.o) : number.fcm
$(LIB)/energy.a(epull.o) : psf.fcm
$(LIB)/energy.a(epull.o) : pull.fcm
$(LIB)/energy.a(epull.o) : stack.fcm
$(LIB)/energy.a(epull.o) : stream.fcm
#
#
$(LIB)/energy.a(eutil.o) : bases.fcm
$(LIB)/energy.a(eutil.o) : code.fcm
$(LIB)/energy.a(eutil.o) : coord.fcm
$(LIB)/energy.a(eutil.o) : coordc.fcm
$(LIB)/energy.a(eutil.o) : deriv.fcm
$(LIB)/energy.a(eutil.o) : dimens.fcm
$(LIB)/energy.a(eutil.o) : econt.fcm
$(LIB)/energy.a(eutil.o) : energy.fcm
$(LIB)/energy.a(eutil.o) : epert.fcm
$(LIB)/energy.a(eutil.o) : exfunc.fcm
$(LIB)/energy.a(eutil.o) : image.fcm
$(LIB)/energy.a(eutil.o) : impnon.fcm
$(LIB)/energy.a(eutil.o) : mbmts.fcm
$(LIB)/energy.a(eutil.o) : number.fcm
$(LIB)/energy.a(eutil.o) : pert.fcm
$(LIB)/energy.a(eutil.o) : psf.fcm
$(LIB)/energy.a(eutil.o) : quantm.fcm
$(LIB)/energy.a(eutil.o) : shake.fcm
$(LIB)/energy.a(eutil.o) : stack.fcm
$(LIB)/energy.a(eutil.o) : stream.fcm
#
#
$(LIB)/energy.a(genborn.o) : cff.fcm
$(LIB)/energy.a(genborn.o) : consta.fcm
$(LIB)/energy.a(genborn.o) : coord.fcm
$(LIB)/energy.a(genborn.o) : dimens.fcm
$(LIB)/energy.a(genborn.o) : exfunc.fcm
$(LIB)/energy.a(genborn.o) : ffield.fcm
$(LIB)/energy.a(genborn.o) : genborn.fcm
$(LIB)/energy.a(genborn.o) : heap.fcm
$(LIB)/energy.a(genborn.o) : impnon.fcm
$(LIB)/energy.a(genborn.o) : inbnd.fcm
$(LIB)/energy.a(genborn.o) : mmff.fcm
$(LIB)/energy.a(genborn.o) : number.fcm
$(LIB)/energy.a(genborn.o) : param.fcm
$(LIB)/energy.a(genborn.o) : psf.fcm
$(LIB)/energy.a(genborn.o) : stream.fcm
#
#
$(LIB)/energy.a(inertia.o) : dimens.fcm
$(LIB)/energy.a(inertia.o) : number.fcm
#
#
$(LIB)/energy.a(intere.o) : bases.fcm
$(LIB)/energy.a(intere.o) : cnst.fcm
$(LIB)/energy.a(intere.o) : code.fcm
$(LIB)/energy.a(intere.o) : coord.fcm
$(LIB)/energy.a(intere.o) : coordc.fcm
$(LIB)/energy.a(intere.o) : deriv.fcm
$(LIB)/energy.a(intere.o) : dimens.fcm
$(LIB)/energy.a(intere.o) : econt.fcm
$(LIB)/energy.a(intere.o) : eef1.fcm
$(LIB)/energy.a(intere.o) : energy.fcm
$(LIB)/energy.a(intere.o) : exfunc.fcm
$(LIB)/energy.a(intere.o) : ffield.fcm
$(LIB)/energy.a(intere.o) : hbond.fcm
$(LIB)/energy.a(intere.o) : heap.fcm
$(LIB)/energy.a(intere.o) : image.fcm
$(LIB)/energy.a(intere.o) : impnon.fcm
$(LIB)/energy.a(intere.o) : inbnd.fcm
$(LIB)/energy.a(intere.o) : mmff.fcm
$(LIB)/energy.a(intere.o) : number.fcm
$(LIB)/energy.a(intere.o) : parallel.fcm
$(LIB)/energy.a(intere.o) : param.fcm
$(LIB)/energy.a(intere.o) : pbound.fcm
$(LIB)/energy.a(intere.o) : psf.fcm
$(LIB)/energy.a(intere.o) : stack.fcm
$(LIB)/energy.a(intere.o) : stream.fcm
#
#
$(LIB)/energy.a(pathint.o) : coord.fcm
$(LIB)/energy.a(pathint.o) : dimens.fcm
$(LIB)/energy.a(pathint.o) : energy.fcm
$(LIB)/energy.a(pathint.o) : exfunc.fcm
$(LIB)/energy.a(pathint.o) : heap.fcm
$(LIB)/energy.a(pathint.o) : impnon.fcm
$(LIB)/energy.a(pathint.o) : number.fcm
$(LIB)/energy.a(pathint.o) : pathint.fcm
$(LIB)/energy.a(pathint.o) : psf.fcm
#
#
$(LIB)/energy.a(polar.o) : comand.fcm
$(LIB)/energy.a(polar.o) : coord.fcm
$(LIB)/energy.a(polar.o) : dimens.fcm
$(LIB)/energy.a(polar.o) : excl.fcm
$(LIB)/energy.a(polar.o) : exfunc.fcm
$(LIB)/energy.a(polar.o) : impnon.fcm
$(LIB)/energy.a(polar.o) : number.fcm
$(LIB)/energy.a(polar.o) : param.fcm
$(LIB)/energy.a(polar.o) : polar.fcm
$(LIB)/energy.a(polar.o) : psf.fcm
$(LIB)/energy.a(polar.o) : rtf.fcm
$(LIB)/energy.a(polar.o) : stream.fcm
#
#
$(LIB)/energy.a(printe.o) : deriv.fcm
$(LIB)/energy.a(printe.o) : dimens.fcm
$(LIB)/energy.a(printe.o) : energy.fcm
$(LIB)/energy.a(printe.o) : ffield.fcm
$(LIB)/energy.a(printe.o) : fourd.fcm
$(LIB)/energy.a(printe.o) : galgor.fcm
$(LIB)/energy.a(printe.o) : impnon.fcm
$(LIB)/energy.a(printe.o) : mbond.fcm
$(LIB)/energy.a(printe.o) : number.fcm
$(LIB)/energy.a(printe.o) : pathint.fcm
$(LIB)/energy.a(printe.o) : psf.fcm
$(LIB)/energy.a(printe.o) : quanta.fcm
$(LIB)/energy.a(printe.o) : stream.fcm
#
#
$(LIB)/energy.a(rgy.o) : comand.fcm
$(LIB)/energy.a(rgy.o) : contrl.fcm
$(LIB)/energy.a(rgy.o) : coord.fcm
$(LIB)/energy.a(rgy.o) : dimens.fcm
$(LIB)/energy.a(rgy.o) : exfunc.fcm
$(LIB)/energy.a(rgy.o) : heap.fcm
$(LIB)/energy.a(rgy.o) : impnon.fcm
$(LIB)/energy.a(rgy.o) : number.fcm
$(LIB)/energy.a(rgy.o) : parallel.fcm
$(LIB)/energy.a(rgy.o) : psf.fcm
$(LIB)/energy.a(rgy.o) : rgy.fcm
$(LIB)/energy.a(rgy.o) : stack.fcm
$(LIB)/energy.a(rgy.o) : stream.fcm
#
