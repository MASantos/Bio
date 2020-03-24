# vibran makefile
# vibran library rules
OBJS_vibran= \
	$(LIB)/vibran.a(quasi.o) \
	$(LIB)/vibran.a(raise.o) \
	$(LIB)/vibran.a(rbquas.o) \
	$(LIB)/vibran.a(redbas.o) \
	$(LIB)/vibran.a(thermo.o) \
	$(LIB)/vibran.a(vibcom.o) \
	$(LIB)/vibran.a(vibio.o) \
	$(LIB)/vibran.a(vibran.o) \
	$(LIB)/vibran.a(vibsub.o) \
	$(LIB)/vibran.a(vibutil.o)
#
$(LIB)/vibran.a : $(OBJS_vibran)
	$(RANLIB) $(LIB)/vibran.a
	@echo vibran COMPLETED
#
# vibran source file rules
$(LIB)/vibran.a(quasi.o)  : $(SRC)/vibran/quasi.src
	$(FLX) $(SRC)/vibran/quasi.src
	$(FC2) quasi.f
	ar rucv $(LIB)/vibran.a quasi.o
	rm quasi.f
	rm quasi.o
#
$(LIB)/vibran.a(raise.o)  : $(SRC)/vibran/raise.src
	$(FLX) $(SRC)/vibran/raise.src
	$(FC2) raise.f
	ar rucv $(LIB)/vibran.a raise.o
	rm raise.f
	rm raise.o
#
$(LIB)/vibran.a(rbquas.o)  : $(SRC)/vibran/rbquas.src
	$(FLX) $(SRC)/vibran/rbquas.src
	$(FC2) rbquas.f
	ar rucv $(LIB)/vibran.a rbquas.o
	rm rbquas.f
	rm rbquas.o
#
$(LIB)/vibran.a(redbas.o)  : $(SRC)/vibran/redbas.src
	$(FLX) $(SRC)/vibran/redbas.src
	$(FC2) redbas.f
	ar rucv $(LIB)/vibran.a redbas.o
	rm redbas.f
	rm redbas.o
#
$(LIB)/vibran.a(thermo.o)  : $(SRC)/vibran/thermo.src
	$(FLX) $(SRC)/vibran/thermo.src
	$(FC2) thermo.f
	ar rucv $(LIB)/vibran.a thermo.o
	rm thermo.f
	rm thermo.o
#
$(LIB)/vibran.a(vibcom.o)  : $(SRC)/vibran/vibcom.src
	$(FLX) $(SRC)/vibran/vibcom.src
	$(FC2) vibcom.f
	ar rucv $(LIB)/vibran.a vibcom.o
	rm vibcom.f
	rm vibcom.o
#
$(LIB)/vibran.a(vibio.o)  : $(SRC)/vibran/vibio.src
	$(FLX) $(SRC)/vibran/vibio.src
	$(FC2) vibio.f
	ar rucv $(LIB)/vibran.a vibio.o
	rm vibio.f
	rm vibio.o
#
$(LIB)/vibran.a(vibran.o)  : $(SRC)/vibran/vibran.src
	$(FLX) $(SRC)/vibran/vibran.src
	$(FC2) vibran.f
	ar rucv $(LIB)/vibran.a vibran.o
	rm vibran.f
	rm vibran.o
#
$(LIB)/vibran.a(vibsub.o)  : $(SRC)/vibran/vibsub.src
	$(FLX) $(SRC)/vibran/vibsub.src
	$(FC2) vibsub.f
	ar rucv $(LIB)/vibran.a vibsub.o
	rm vibsub.f
	rm vibsub.o
#
$(LIB)/vibran.a(vibutil.o)  : $(SRC)/vibran/vibutil.src
	$(FLX) $(SRC)/vibran/vibutil.src
	$(FC2) vibutil.f
	ar rucv $(LIB)/vibran.a vibutil.o
	rm vibutil.f
	rm vibutil.o
#
#
# vibran dependency file
#
$(LIB)/vibran.a(quasi.o) : consta.fcm
$(LIB)/vibran.a(quasi.o) : ctitla.fcm
$(LIB)/vibran.a(quasi.o) : exfunc.fcm
$(LIB)/vibran.a(quasi.o) : impnon.fcm
$(LIB)/vibran.a(quasi.o) : stack.fcm
$(LIB)/vibran.a(quasi.o) : stream.fcm
#
#
$(LIB)/vibran.a(raise.o) : impnon.fcm
$(LIB)/vibran.a(raise.o) : number.fcm
#
#
$(LIB)/vibran.a(rbquas.o) : consta.fcm
$(LIB)/vibran.a(rbquas.o) : ctitla.fcm
$(LIB)/vibran.a(rbquas.o) : exfunc.fcm
$(LIB)/vibran.a(rbquas.o) : impnon.fcm
$(LIB)/vibran.a(rbquas.o) : stack.fcm
$(LIB)/vibran.a(rbquas.o) : stream.fcm
$(LIB)/vibran.a(rbquas.o) : timer.fcm
#
#
$(LIB)/vibran.a(redbas.o) : consta.fcm
$(LIB)/vibran.a(redbas.o) : coord.fcm
$(LIB)/vibran.a(redbas.o) : ctitla.fcm
$(LIB)/vibran.a(redbas.o) : deriv.fcm
$(LIB)/vibran.a(redbas.o) : dimb.fcm
$(LIB)/vibran.a(redbas.o) : dimens.fcm
$(LIB)/vibran.a(redbas.o) : energy.fcm
$(LIB)/vibran.a(redbas.o) : exfunc.fcm
$(LIB)/vibran.a(redbas.o) : heap.fcm
$(LIB)/vibran.a(redbas.o) : impnon.fcm
$(LIB)/vibran.a(redbas.o) : number.fcm
$(LIB)/vibran.a(redbas.o) : psf.fcm
$(LIB)/vibran.a(redbas.o) : stream.fcm
$(LIB)/vibran.a(redbas.o) : timer.fcm
#
#
$(LIB)/vibran.a(thermo.o) : consta.fcm
$(LIB)/vibran.a(thermo.o) : energy.fcm
$(LIB)/vibran.a(thermo.o) : impnon.fcm
$(LIB)/vibran.a(thermo.o) : stream.fcm
#
#
$(LIB)/vibran.a(vibcom.o) : consta.fcm
$(LIB)/vibran.a(vibcom.o) : deriv.fcm
$(LIB)/vibran.a(vibcom.o) : dimens.fcm
$(LIB)/vibran.a(vibcom.o) : energy.fcm
$(LIB)/vibran.a(vibcom.o) : impnon.fcm
$(LIB)/vibran.a(vibcom.o) : number.fcm
$(LIB)/vibran.a(vibcom.o) : stream.fcm
#
#
$(LIB)/vibran.a(vibio.o) : bases.fcm
$(LIB)/vibran.a(vibio.o) : consta.fcm
$(LIB)/vibran.a(vibio.o) : ctitla.fcm
$(LIB)/vibran.a(vibio.o) : deriv.fcm
$(LIB)/vibran.a(vibio.o) : dimb.fcm
$(LIB)/vibran.a(vibio.o) : dimens.fcm
$(LIB)/vibran.a(vibio.o) : energy.fcm
$(LIB)/vibran.a(vibio.o) : exfunc.fcm
$(LIB)/vibran.a(vibio.o) : heap.fcm
$(LIB)/vibran.a(vibio.o) : impnon.fcm
$(LIB)/vibran.a(vibio.o) : intcr.fcm
$(LIB)/vibran.a(vibio.o) : number.fcm
$(LIB)/vibran.a(vibio.o) : stream.fcm
#
#
$(LIB)/vibran.a(vibran.o) : bases.fcm
$(LIB)/vibran.a(vibran.o) : comand.fcm
$(LIB)/vibran.a(vibran.o) : coord.fcm
$(LIB)/vibran.a(vibran.o) : coordc.fcm
$(LIB)/vibran.a(vibran.o) : ctitla.fcm
$(LIB)/vibran.a(vibran.o) : deriv.fcm
$(LIB)/vibran.a(vibran.o) : dimb.fcm
$(LIB)/vibran.a(vibran.o) : dimens.fcm
$(LIB)/vibran.a(vibran.o) : exfunc.fcm
$(LIB)/vibran.a(vibran.o) : hbond.fcm
$(LIB)/vibran.a(vibran.o) : heap.fcm
$(LIB)/vibran.a(vibran.o) : image.fcm
$(LIB)/vibran.a(vibran.o) : impnon.fcm
$(LIB)/vibran.a(vibran.o) : inbnd.fcm
$(LIB)/vibran.a(vibran.o) : intcr.fcm
$(LIB)/vibran.a(vibran.o) : number.fcm
$(LIB)/vibran.a(vibran.o) : param.fcm
$(LIB)/vibran.a(vibran.o) : psf.fcm
$(LIB)/vibran.a(vibran.o) : stack.fcm
$(LIB)/vibran.a(vibran.o) : stream.fcm
#
#
$(LIB)/vibran.a(vibsub.o) : code.fcm
$(LIB)/vibran.a(vibsub.o) : consta.fcm
$(LIB)/vibran.a(vibsub.o) : deriv.fcm
$(LIB)/vibran.a(vibsub.o) : dimens.fcm
$(LIB)/vibran.a(vibsub.o) : energy.fcm
$(LIB)/vibran.a(vibsub.o) : exfunc.fcm
$(LIB)/vibran.a(vibsub.o) : heap.fcm
$(LIB)/vibran.a(vibsub.o) : impnon.fcm
$(LIB)/vibran.a(vibsub.o) : mbond.fcm
$(LIB)/vibran.a(vibsub.o) : number.fcm
$(LIB)/vibran.a(vibsub.o) : param.fcm
$(LIB)/vibran.a(vibsub.o) : psf.fcm
$(LIB)/vibran.a(vibsub.o) : stack.fcm
$(LIB)/vibran.a(vibsub.o) : stream.fcm
#
#
$(LIB)/vibran.a(vibutil.o) : comand.fcm
$(LIB)/vibran.a(vibutil.o) : consta.fcm
$(LIB)/vibran.a(vibutil.o) : deriv.fcm
$(LIB)/vibran.a(vibutil.o) : dimens.fcm
$(LIB)/vibran.a(vibutil.o) : exfunc.fcm
$(LIB)/vibran.a(vibutil.o) : heap.fcm
$(LIB)/vibran.a(vibutil.o) : impnon.fcm
$(LIB)/vibran.a(vibutil.o) : psf.fcm
$(LIB)/vibran.a(vibutil.o) : shake.fcm
$(LIB)/vibran.a(vibutil.o) : stack.fcm
$(LIB)/vibran.a(vibutil.o) : stream.fcm
#
