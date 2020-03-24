# solvation makefile
# solvation library rules
OBJS_solvation= \
	$(LIB)/solvation.a(coorman.o) \
	$(LIB)/solvation.a(cycles.o) \
	$(LIB)/solvation.a(deriv.o) \
	$(LIB)/solvation.a(fft.o) \
	$(LIB)/solvation.a(rism.o) \
	$(LIB)/solvation.a(rismio.o) \
	$(LIB)/solvation.a(soluu.o) \
	$(LIB)/solvation.a(soluv.o) \
	$(LIB)/solvation.a(solvation.o) \
	$(LIB)/solvation.a(solvv.o) \
	$(LIB)/solvation.a(state.o)
#
$(LIB)/solvation.a : $(OBJS_solvation)
	$(RANLIB) $(LIB)/solvation.a
	@echo solvation COMPLETED
#
# solvation source file rules
$(LIB)/solvation.a(coorman.o)  : $(SRC)/solvation/coorman.src
	$(FLX) $(SRC)/solvation/coorman.src
	$(FC2) coorman.f
	ar rucv $(LIB)/solvation.a coorman.o
	rm coorman.f
	rm coorman.o
#
$(LIB)/solvation.a(cycles.o)  : $(SRC)/solvation/cycles.src
	$(FLX) $(SRC)/solvation/cycles.src
	$(FC2) cycles.f
	ar rucv $(LIB)/solvation.a cycles.o
	rm cycles.f
	rm cycles.o
#
$(LIB)/solvation.a(deriv.o)  : $(SRC)/solvation/deriv.src
	$(FLX) $(SRC)/solvation/deriv.src
	$(FC2) deriv.f
	ar rucv $(LIB)/solvation.a deriv.o
	rm deriv.f
	rm deriv.o
#
$(LIB)/solvation.a(fft.o)  : $(SRC)/solvation/fft.src
	$(FLX) $(SRC)/solvation/fft.src
	$(FC2) fft.f
	ar rucv $(LIB)/solvation.a fft.o
	rm fft.f
	rm fft.o
#
$(LIB)/solvation.a(rism.o)  : $(SRC)/solvation/rism.src
	$(FLX) $(SRC)/solvation/rism.src
	$(FC2) rism.f
	ar rucv $(LIB)/solvation.a rism.o
	rm rism.f
	rm rism.o
#
$(LIB)/solvation.a(rismio.o)  : $(SRC)/solvation/rismio.src
	$(FLX) $(SRC)/solvation/rismio.src
	$(FC2) rismio.f
	ar rucv $(LIB)/solvation.a rismio.o
	rm rismio.f
	rm rismio.o
#
$(LIB)/solvation.a(soluu.o)  : $(SRC)/solvation/soluu.src
	$(FLX) $(SRC)/solvation/soluu.src
	$(FC2) soluu.f
	ar rucv $(LIB)/solvation.a soluu.o
	rm soluu.f
	rm soluu.o
#
$(LIB)/solvation.a(soluv.o)  : $(SRC)/solvation/soluv.src
	$(FLX) $(SRC)/solvation/soluv.src
	$(FC2) soluv.f
	ar rucv $(LIB)/solvation.a soluv.o
	rm soluv.f
	rm soluv.o
#
$(LIB)/solvation.a(solvation.o)  : $(SRC)/solvation/solvation.src
	$(FLX) $(SRC)/solvation/solvation.src
	$(FC2) solvation.f
	ar rucv $(LIB)/solvation.a solvation.o
	rm solvation.f
	rm solvation.o
#
$(LIB)/solvation.a(solvv.o)  : $(SRC)/solvation/solvv.src
	$(FLX) $(SRC)/solvation/solvv.src
	$(FC2) solvv.f
	ar rucv $(LIB)/solvation.a solvv.o
	rm solvv.f
	rm solvv.o
#
$(LIB)/solvation.a(state.o)  : $(SRC)/solvation/state.src
	$(FLX) $(SRC)/solvation/state.src
	$(FC2) state.f
	ar rucv $(LIB)/solvation.a state.o
	rm state.f
	rm state.o
#
#
# solvation dependency file
#
$(LIB)/solvation.a(coorman.o) : comand.fcm
$(LIB)/solvation.a(coorman.o) : dimens.fcm
$(LIB)/solvation.a(coorman.o) : distri.fcm
$(LIB)/solvation.a(coorman.o) : exfunc.fcm
$(LIB)/solvation.a(coorman.o) : fft.fcm
$(LIB)/solvation.a(coorman.o) : impnon.fcm
$(LIB)/solvation.a(coorman.o) : number.fcm
$(LIB)/solvation.a(coorman.o) : rism.fcm
$(LIB)/solvation.a(coorman.o) : stream.fcm
$(LIB)/solvation.a(coorman.o) : struc.fcm
#
#
$(LIB)/solvation.a(cycles.o) : control.fcm
$(LIB)/solvation.a(cycles.o) : dimens.fcm
$(LIB)/solvation.a(cycles.o) : distri.fcm
$(LIB)/solvation.a(cycles.o) : exfunc.fcm
$(LIB)/solvation.a(cycles.o) : fft.fcm
$(LIB)/solvation.a(cycles.o) : heap.fcm
$(LIB)/solvation.a(cycles.o) : impnon.fcm
$(LIB)/solvation.a(cycles.o) : number.fcm
$(LIB)/solvation.a(cycles.o) : rism.fcm
$(LIB)/solvation.a(cycles.o) : stream.fcm
$(LIB)/solvation.a(cycles.o) : struc.fcm
#
#
$(LIB)/solvation.a(deriv.o) : control.fcm
$(LIB)/solvation.a(deriv.o) : dimens.fcm
$(LIB)/solvation.a(deriv.o) : distri.fcm
$(LIB)/solvation.a(deriv.o) : exfunc.fcm
$(LIB)/solvation.a(deriv.o) : fft.fcm
$(LIB)/solvation.a(deriv.o) : heap.fcm
$(LIB)/solvation.a(deriv.o) : impnon.fcm
$(LIB)/solvation.a(deriv.o) : number.fcm
$(LIB)/solvation.a(deriv.o) : rism.fcm
$(LIB)/solvation.a(deriv.o) : stream.fcm
$(LIB)/solvation.a(deriv.o) : struc.fcm
#
#
$(LIB)/solvation.a(fft.o) : consta.fcm
$(LIB)/solvation.a(fft.o) : exfunc.fcm
$(LIB)/solvation.a(fft.o) : fft.fcm
$(LIB)/solvation.a(fft.o) : impnon.fcm
$(LIB)/solvation.a(fft.o) : number.fcm
$(LIB)/solvation.a(fft.o) : rism.fcm
$(LIB)/solvation.a(fft.o) : stream.fcm
#
#
$(LIB)/solvation.a(rism.o) : cmdpar.fcm
$(LIB)/solvation.a(rism.o) : comand.fcm
$(LIB)/solvation.a(rism.o) : control.fcm
$(LIB)/solvation.a(rism.o) : dimens.fcm
$(LIB)/solvation.a(rism.o) : distri.fcm
$(LIB)/solvation.a(rism.o) : exfunc.fcm
$(LIB)/solvation.a(rism.o) : fft.fcm
$(LIB)/solvation.a(rism.o) : heap.fcm
$(LIB)/solvation.a(rism.o) : impnon.fcm
$(LIB)/solvation.a(rism.o) : rism.fcm
$(LIB)/solvation.a(rism.o) : stream.fcm
$(LIB)/solvation.a(rism.o) : struc.fcm
#
#
$(LIB)/solvation.a(rismio.o) : comand.fcm
$(LIB)/solvation.a(rismio.o) : control.fcm
$(LIB)/solvation.a(rismio.o) : ctitla.fcm
$(LIB)/solvation.a(rismio.o) : dimens.fcm
$(LIB)/solvation.a(rismio.o) : distri.fcm
$(LIB)/solvation.a(rismio.o) : exfunc.fcm
$(LIB)/solvation.a(rismio.o) : fft.fcm
$(LIB)/solvation.a(rismio.o) : heap.fcm
$(LIB)/solvation.a(rismio.o) : impnon.fcm
$(LIB)/solvation.a(rismio.o) : number.fcm
$(LIB)/solvation.a(rismio.o) : rism.fcm
$(LIB)/solvation.a(rismio.o) : stream.fcm
$(LIB)/solvation.a(rismio.o) : struc.fcm
#
#
$(LIB)/solvation.a(soluu.o) : fft.fcm
$(LIB)/solvation.a(soluu.o) : impnon.fcm
$(LIB)/solvation.a(soluu.o) : number.fcm
$(LIB)/solvation.a(soluu.o) : rism.fcm
$(LIB)/solvation.a(soluu.o) : stream.fcm
#
#
$(LIB)/solvation.a(soluv.o) : fft.fcm
$(LIB)/solvation.a(soluv.o) : impnon.fcm
$(LIB)/solvation.a(soluv.o) : number.fcm
$(LIB)/solvation.a(soluv.o) : rism.fcm
$(LIB)/solvation.a(soluv.o) : stream.fcm
#
#
$(LIB)/solvation.a(solvation.o) : control.fcm
$(LIB)/solvation.a(solvation.o) : dimens.fcm
$(LIB)/solvation.a(solvation.o) : distri.fcm
$(LIB)/solvation.a(solvation.o) : exfunc.fcm
$(LIB)/solvation.a(solvation.o) : fft.fcm
$(LIB)/solvation.a(solvation.o) : heap.fcm
$(LIB)/solvation.a(solvation.o) : impnon.fcm
$(LIB)/solvation.a(solvation.o) : number.fcm
$(LIB)/solvation.a(solvation.o) : rism.fcm
$(LIB)/solvation.a(solvation.o) : stream.fcm
$(LIB)/solvation.a(solvation.o) : struc.fcm
#
#
$(LIB)/solvation.a(solvv.o) : consta.fcm
$(LIB)/solvation.a(solvv.o) : fft.fcm
$(LIB)/solvation.a(solvv.o) : impnon.fcm
$(LIB)/solvation.a(solvv.o) : number.fcm
$(LIB)/solvation.a(solvv.o) : rism.fcm
$(LIB)/solvation.a(solvv.o) : stream.fcm
#
#
$(LIB)/solvation.a(state.o) : consta.fcm
$(LIB)/solvation.a(state.o) : control.fcm
$(LIB)/solvation.a(state.o) : dimens.fcm
$(LIB)/solvation.a(state.o) : distri.fcm
$(LIB)/solvation.a(state.o) : exfunc.fcm
$(LIB)/solvation.a(state.o) : fft.fcm
$(LIB)/solvation.a(state.o) : heap.fcm
$(LIB)/solvation.a(state.o) : impnon.fcm
$(LIB)/solvation.a(state.o) : number.fcm
$(LIB)/solvation.a(state.o) : rism.fcm
$(LIB)/solvation.a(state.o) : stream.fcm
$(LIB)/solvation.a(state.o) : struc.fcm
#
