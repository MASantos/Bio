# manip makefile
# manip library rules
OBJS_manip= \
	$(LIB)/manip.a(corman.o) \
	$(LIB)/manip.a(corman2.o) \
	$(LIB)/manip.a(corman3.o) \
	$(LIB)/manip.a(cshake.o) \
	$(LIB)/manip.a(cstran.o) \
	$(LIB)/manip.a(dynanal.o) \
	$(LIB)/manip.a(hbanal.o) \
	$(LIB)/manip.a(helix.o) \
	$(LIB)/manip.a(intcor.o) \
	$(LIB)/manip.a(intcor2.o) \
	$(LIB)/manip.a(pucker.o) \
	$(LIB)/manip.a(rgyr.o) \
	$(LIB)/manip.a(rmsdyn.o) \
	$(LIB)/manip.a(rotlsq.o) \
	$(LIB)/manip.a(scalar.o) \
	$(LIB)/manip.a(shake.o) \
	$(LIB)/manip.a(wrgaus.o)
#
$(LIB)/manip.a : $(OBJS_manip)
	$(RANLIB) $(LIB)/manip.a
	@echo manip COMPLETED
#
# manip source file rules
$(LIB)/manip.a(corman.o)  : $(SRC)/manip/corman.src
	$(FLX) $(SRC)/manip/corman.src
	$(FC0) corman.f
	ar rucv $(LIB)/manip.a corman.o
	rm corman.f
	rm corman.o
#
$(LIB)/manip.a(corman2.o)  : $(SRC)/manip/corman2.src
	$(FLX) $(SRC)/manip/corman2.src
	$(FC2) corman2.f
	ar rucv $(LIB)/manip.a corman2.o
	rm corman2.f
	rm corman2.o
#
$(LIB)/manip.a(corman3.o)  : $(SRC)/manip/corman3.src
	$(FLX) $(SRC)/manip/corman3.src
	$(FC2) corman3.f
	ar rucv $(LIB)/manip.a corman3.o
	rm corman3.f
	rm corman3.o
#
$(LIB)/manip.a(cshake.o)  : $(SRC)/manip/cshake.src
	$(FLX) $(SRC)/manip/cshake.src
	$(FC2) cshake.f
	ar rucv $(LIB)/manip.a cshake.o
	rm cshake.f
	rm cshake.o
#
$(LIB)/manip.a(cstran.o)  : $(SRC)/manip/cstran.src
	$(FLX) $(SRC)/manip/cstran.src
	$(FC2) cstran.f
	ar rucv $(LIB)/manip.a cstran.o
	rm cstran.f
	rm cstran.o
#
$(LIB)/manip.a(dynanal.o)  : $(SRC)/manip/dynanal.src
	$(FLX) $(SRC)/manip/dynanal.src
	$(FC2) dynanal.f
	ar rucv $(LIB)/manip.a dynanal.o
	rm dynanal.f
	rm dynanal.o
#
$(LIB)/manip.a(hbanal.o)  : $(SRC)/manip/hbanal.src
	$(FLX) $(SRC)/manip/hbanal.src
	$(FC2) hbanal.f
	ar rucv $(LIB)/manip.a hbanal.o
	rm hbanal.f
	rm hbanal.o
#
$(LIB)/manip.a(helix.o)  : $(SRC)/manip/helix.src
	$(FLX) $(SRC)/manip/helix.src
	$(FC2) helix.f
	ar rucv $(LIB)/manip.a helix.o
	rm helix.f
	rm helix.o
#
$(LIB)/manip.a(intcor.o)  : $(SRC)/manip/intcor.src
	$(FLX) $(SRC)/manip/intcor.src
	$(FC2) intcor.f
	ar rucv $(LIB)/manip.a intcor.o
	rm intcor.f
	rm intcor.o
#
$(LIB)/manip.a(intcor2.o)  : $(SRC)/manip/intcor2.src
	$(FLX) $(SRC)/manip/intcor2.src
	$(FC2) intcor2.f
	ar rucv $(LIB)/manip.a intcor2.o
	rm intcor2.f
	rm intcor2.o
#
$(LIB)/manip.a(pucker.o)  : $(SRC)/manip/pucker.src
	$(FLX) $(SRC)/manip/pucker.src
	$(FC2) pucker.f
	ar rucv $(LIB)/manip.a pucker.o
	rm pucker.f
	rm pucker.o
#
$(LIB)/manip.a(rgyr.o)  : $(SRC)/manip/rgyr.src
	$(FLX) $(SRC)/manip/rgyr.src
	$(FC2) rgyr.f
	ar rucv $(LIB)/manip.a rgyr.o
	rm rgyr.f
	rm rgyr.o
#
$(LIB)/manip.a(rmsdyn.o)  : $(SRC)/manip/rmsdyn.src
	$(FLX) $(SRC)/manip/rmsdyn.src
	$(FC2) rmsdyn.f
	ar rucv $(LIB)/manip.a rmsdyn.o
	rm rmsdyn.f
	rm rmsdyn.o
#
$(LIB)/manip.a(rotlsq.o)  : $(SRC)/manip/rotlsq.src
	$(FLX) $(SRC)/manip/rotlsq.src
	$(FC2) rotlsq.f
	ar rucv $(LIB)/manip.a rotlsq.o
	rm rotlsq.f
	rm rotlsq.o
#
$(LIB)/manip.a(scalar.o)  : $(SRC)/manip/scalar.src
	$(FLX) $(SRC)/manip/scalar.src
	$(FC2) scalar.f
	ar rucv $(LIB)/manip.a scalar.o
	rm scalar.f
	rm scalar.o
#
$(LIB)/manip.a(shake.o)  : $(SRC)/manip/shake.src
	$(FLX) $(SRC)/manip/shake.src
	$(FC2) shake.f
	ar rucv $(LIB)/manip.a shake.o
	rm shake.f
	rm shake.o
#
$(LIB)/manip.a(wrgaus.o)  : $(SRC)/manip/wrgaus.src
	$(FLX) $(SRC)/manip/wrgaus.src
	$(FC2) wrgaus.f
	ar rucv $(LIB)/manip.a wrgaus.o
	rm wrgaus.f
	rm wrgaus.o
#
#
# manip dependency file
#
$(LIB)/manip.a(corman.o) : comand.fcm
$(LIB)/manip.a(corman.o) : consta.fcm
$(LIB)/manip.a(corman.o) : coord.fcm
$(LIB)/manip.a(corman.o) : coordc.fcm
$(LIB)/manip.a(corman.o) : corman.fcm
$(LIB)/manip.a(corman.o) : ctitla.fcm
$(LIB)/manip.a(corman.o) : deriv.fcm
$(LIB)/manip.a(corman.o) : dimens.fcm
$(LIB)/manip.a(corman.o) : exfunc.fcm
$(LIB)/manip.a(corman.o) : graph.fcm
$(LIB)/manip.a(corman.o) : heap.fcm
$(LIB)/manip.a(corman.o) : image.fcm
$(LIB)/manip.a(corman.o) : impnon.fcm
$(LIB)/manip.a(corman.o) : number.fcm
$(LIB)/manip.a(corman.o) : psf.fcm
$(LIB)/manip.a(corman.o) : scalar.fcm
$(LIB)/manip.a(corman.o) : shake.fcm
$(LIB)/manip.a(corman.o) : stack.fcm
$(LIB)/manip.a(corman.o) : stream.fcm
#
#
$(LIB)/manip.a(corman2.o) : comand.fcm
$(LIB)/manip.a(corman2.o) : consta.fcm
$(LIB)/manip.a(corman2.o) : coord.fcm
$(LIB)/manip.a(corman2.o) : coordc.fcm
$(LIB)/manip.a(corman2.o) : corman.fcm
$(LIB)/manip.a(corman2.o) : ctitla.fcm
$(LIB)/manip.a(corman2.o) : dimens.fcm
$(LIB)/manip.a(corman2.o) : exfunc.fcm
$(LIB)/manip.a(corman2.o) : heap.fcm
$(LIB)/manip.a(corman2.o) : impnon.fcm
$(LIB)/manip.a(corman2.o) : number.fcm
$(LIB)/manip.a(corman2.o) : polymer.fcm
$(LIB)/manip.a(corman2.o) : psf.fcm
$(LIB)/manip.a(corman2.o) : scalar.fcm
$(LIB)/manip.a(corman2.o) : stack.fcm
$(LIB)/manip.a(corman2.o) : stream.fcm
#
#
$(LIB)/manip.a(corman3.o) : bases.fcm
$(LIB)/manip.a(corman3.o) : consta.fcm
$(LIB)/manip.a(corman3.o) : dimens.fcm
$(LIB)/manip.a(corman3.o) : exfunc.fcm
$(LIB)/manip.a(corman3.o) : heap.fcm
$(LIB)/manip.a(corman3.o) : impnon.fcm
$(LIB)/manip.a(corman3.o) : inbnd.fcm
$(LIB)/manip.a(corman3.o) : number.fcm
$(LIB)/manip.a(corman3.o) : param.fcm
$(LIB)/manip.a(corman3.o) : psf.fcm
$(LIB)/manip.a(corman3.o) : stream.fcm
#
#
$(LIB)/manip.a(cshake.o) : cray.fcm
$(LIB)/manip.a(cshake.o) : dimens.fcm
$(LIB)/manip.a(cshake.o) : exfunc.fcm
$(LIB)/manip.a(cshake.o) : heap.fcm
$(LIB)/manip.a(cshake.o) : impnon.fcm
$(LIB)/manip.a(cshake.o) : machdep.fcm
$(LIB)/manip.a(cshake.o) : number.fcm
$(LIB)/manip.a(cshake.o) : psf.fcm
$(LIB)/manip.a(cshake.o) : shake.fcm
$(LIB)/manip.a(cshake.o) : stack.fcm
$(LIB)/manip.a(cshake.o) : stream.fcm
#
#
$(LIB)/manip.a(cstran.o) : bases.fcm
$(LIB)/manip.a(cstran.o) : cff.fcm
$(LIB)/manip.a(cstran.o) : cnst.fcm
$(LIB)/manip.a(cstran.o) : code.fcm
$(LIB)/manip.a(cstran.o) : consta.fcm
$(LIB)/manip.a(cstran.o) : coord.fcm
$(LIB)/manip.a(cstran.o) : coordc.fcm
$(LIB)/manip.a(cstran.o) : dimens.fcm
$(LIB)/manip.a(cstran.o) : exfunc.fcm
$(LIB)/manip.a(cstran.o) : ffield.fcm
$(LIB)/manip.a(cstran.o) : fourd.fcm
$(LIB)/manip.a(cstran.o) : heap.fcm
$(LIB)/manip.a(cstran.o) : impnon.fcm
$(LIB)/manip.a(cstran.o) : mmff.fcm
$(LIB)/manip.a(cstran.o) : number.fcm
$(LIB)/manip.a(cstran.o) : psf.fcm
$(LIB)/manip.a(cstran.o) : stack.fcm
$(LIB)/manip.a(cstran.o) : stream.fcm
#
#
$(LIB)/manip.a(dynanal.o) : ctitla.fcm
$(LIB)/manip.a(dynanal.o) : dimens.fcm
$(LIB)/manip.a(dynanal.o) : exfunc.fcm
$(LIB)/manip.a(dynanal.o) : image.fcm
$(LIB)/manip.a(dynanal.o) : impnon.fcm
$(LIB)/manip.a(dynanal.o) : number.fcm
$(LIB)/manip.a(dynanal.o) : stack.fcm
$(LIB)/manip.a(dynanal.o) : stream.fcm
#
#
$(LIB)/manip.a(hbanal.o) : bases.fcm
$(LIB)/manip.a(hbanal.o) : consta.fcm
$(LIB)/manip.a(hbanal.o) : coord.fcm
$(LIB)/manip.a(hbanal.o) : ctitla.fcm
$(LIB)/manip.a(hbanal.o) : dimens.fcm
$(LIB)/manip.a(hbanal.o) : exfunc.fcm
$(LIB)/manip.a(hbanal.o) : heap.fcm
$(LIB)/manip.a(hbanal.o) : impnon.fcm
$(LIB)/manip.a(hbanal.o) : inbnd.fcm
$(LIB)/manip.a(hbanal.o) : number.fcm
$(LIB)/manip.a(hbanal.o) : psf.fcm
$(LIB)/manip.a(hbanal.o) : stream.fcm
#
#
$(LIB)/manip.a(helix.o) : consta.fcm
$(LIB)/manip.a(helix.o) : coord.fcm
$(LIB)/manip.a(helix.o) : corman.fcm
$(LIB)/manip.a(helix.o) : dimens.fcm
$(LIB)/manip.a(helix.o) : exfunc.fcm
$(LIB)/manip.a(helix.o) : impnon.fcm
$(LIB)/manip.a(helix.o) : number.fcm
$(LIB)/manip.a(helix.o) : psf.fcm
$(LIB)/manip.a(helix.o) : stack.fcm
$(LIB)/manip.a(helix.o) : stream.fcm
#
#
$(LIB)/manip.a(intcor.o) : bases.fcm
$(LIB)/manip.a(intcor.o) : comand.fcm
$(LIB)/manip.a(intcor.o) : consta.fcm
$(LIB)/manip.a(intcor.o) : coord.fcm
$(LIB)/manip.a(intcor.o) : coordc.fcm
$(LIB)/manip.a(intcor.o) : ctitla.fcm
$(LIB)/manip.a(intcor.o) : dimens.fcm
$(LIB)/manip.a(intcor.o) : exfunc.fcm
$(LIB)/manip.a(intcor.o) : heap.fcm
$(LIB)/manip.a(intcor.o) : impnon.fcm
$(LIB)/manip.a(intcor.o) : intcr.fcm
$(LIB)/manip.a(intcor.o) : number.fcm
$(LIB)/manip.a(intcor.o) : param.fcm
$(LIB)/manip.a(intcor.o) : psf.fcm
$(LIB)/manip.a(intcor.o) : stack.fcm
$(LIB)/manip.a(intcor.o) : stream.fcm
#
#
$(LIB)/manip.a(intcor2.o) : bases.fcm
$(LIB)/manip.a(intcor2.o) : cff.fcm
$(LIB)/manip.a(intcor2.o) : comand.fcm
$(LIB)/manip.a(intcor2.o) : consta.fcm
$(LIB)/manip.a(intcor2.o) : dimens.fcm
$(LIB)/manip.a(intcor2.o) : exfunc.fcm
$(LIB)/manip.a(intcor2.o) : ffield.fcm
$(LIB)/manip.a(intcor2.o) : heap.fcm
$(LIB)/manip.a(intcor2.o) : impnon.fcm
$(LIB)/manip.a(intcor2.o) : intcr.fcm
$(LIB)/manip.a(intcor2.o) : mmff.fcm
$(LIB)/manip.a(intcor2.o) : number.fcm
$(LIB)/manip.a(intcor2.o) : psf.fcm
$(LIB)/manip.a(intcor2.o) : stream.fcm
#
#
$(LIB)/manip.a(pucker.o) : consta.fcm
$(LIB)/manip.a(pucker.o) : dimens.fcm
$(LIB)/manip.a(pucker.o) : exfunc.fcm
$(LIB)/manip.a(pucker.o) : impnon.fcm
$(LIB)/manip.a(pucker.o) : number.fcm
$(LIB)/manip.a(pucker.o) : psf.fcm
$(LIB)/manip.a(pucker.o) : stream.fcm
#
#
$(LIB)/manip.a(rgyr.o) : corman.fcm
$(LIB)/manip.a(rgyr.o) : impnon.fcm
$(LIB)/manip.a(rgyr.o) : number.fcm
$(LIB)/manip.a(rgyr.o) : stream.fcm
#
#
$(LIB)/manip.a(rmsdyn.o) : comand.fcm
$(LIB)/manip.a(rmsdyn.o) : ctitla.fcm
$(LIB)/manip.a(rmsdyn.o) : dimens.fcm
$(LIB)/manip.a(rmsdyn.o) : exfunc.fcm
$(LIB)/manip.a(rmsdyn.o) : impnon.fcm
$(LIB)/manip.a(rmsdyn.o) : number.fcm
$(LIB)/manip.a(rmsdyn.o) : stack.fcm
$(LIB)/manip.a(rmsdyn.o) : stream.fcm
#
#
$(LIB)/manip.a(rotlsq.o) : consta.fcm
$(LIB)/manip.a(rotlsq.o) : corman.fcm
$(LIB)/manip.a(rotlsq.o) : exfunc.fcm
$(LIB)/manip.a(rotlsq.o) : impnon.fcm
$(LIB)/manip.a(rotlsq.o) : number.fcm
$(LIB)/manip.a(rotlsq.o) : stack.fcm
$(LIB)/manip.a(rotlsq.o) : stream.fcm
#
#
$(LIB)/manip.a(scalar.o) : bases.fcm
$(LIB)/manip.a(scalar.o) : cnst.fcm
$(LIB)/manip.a(scalar.o) : code.fcm
$(LIB)/manip.a(scalar.o) : comand.fcm
$(LIB)/manip.a(scalar.o) : coord.fcm
$(LIB)/manip.a(scalar.o) : coordc.fcm
$(LIB)/manip.a(scalar.o) : deriv.fcm
$(LIB)/manip.a(scalar.o) : dimens.fcm
$(LIB)/manip.a(scalar.o) : econt.fcm
$(LIB)/manip.a(scalar.o) : exfunc.fcm
$(LIB)/manip.a(scalar.o) : fourd.fcm
$(LIB)/manip.a(scalar.o) : genborn.fcm
$(LIB)/manip.a(scalar.o) : hbond.fcm
$(LIB)/manip.a(scalar.o) : heap.fcm
$(LIB)/manip.a(scalar.o) : impnon.fcm
$(LIB)/manip.a(scalar.o) : number.fcm
$(LIB)/manip.a(scalar.o) : param.fcm
$(LIB)/manip.a(scalar.o) : pert.fcm
$(LIB)/manip.a(scalar.o) : psf.fcm
$(LIB)/manip.a(scalar.o) : scalar.fcm
$(LIB)/manip.a(scalar.o) : stack.fcm
$(LIB)/manip.a(scalar.o) : stream.fcm
$(LIB)/manip.a(scalar.o) : surface.fcm
#
#
$(LIB)/manip.a(shake.o) : bases.fcm
$(LIB)/manip.a(shake.o) : code.fcm
$(LIB)/manip.a(shake.o) : coord.fcm
$(LIB)/manip.a(shake.o) : coordc.fcm
$(LIB)/manip.a(shake.o) : dimens.fcm
$(LIB)/manip.a(shake.o) : exfunc.fcm
$(LIB)/manip.a(shake.o) : heap.fcm
$(LIB)/manip.a(shake.o) : icfix.fcm
$(LIB)/manip.a(shake.o) : impnon.fcm
$(LIB)/manip.a(shake.o) : lonepr.fcm
$(LIB)/manip.a(shake.o) : number.fcm
$(LIB)/manip.a(shake.o) : parallel.fcm
$(LIB)/manip.a(shake.o) : param.fcm
$(LIB)/manip.a(shake.o) : pert.fcm
$(LIB)/manip.a(shake.o) : psf.fcm
$(LIB)/manip.a(shake.o) : pshake.fcm
$(LIB)/manip.a(shake.o) : shake.fcm
$(LIB)/manip.a(shake.o) : shapes.fcm
$(LIB)/manip.a(shake.o) : stack.fcm
$(LIB)/manip.a(shake.o) : stream.fcm
$(LIB)/manip.a(shake.o) : tsmh.fcm
$(LIB)/manip.a(shake.o) : tsms.fcm
#
#
$(LIB)/manip.a(wrgaus.o) : consta.fcm
$(LIB)/manip.a(wrgaus.o) : dimens.fcm
$(LIB)/manip.a(wrgaus.o) : impnon.fcm
$(LIB)/manip.a(wrgaus.o) : number.fcm
$(LIB)/manip.a(wrgaus.o) : param.fcm
$(LIB)/manip.a(wrgaus.o) : psf.fcm
$(LIB)/manip.a(wrgaus.o) : stream.fcm
#
