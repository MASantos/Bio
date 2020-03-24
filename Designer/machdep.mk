# machdep makefile
# machdep library rules
OBJS_machdep= \
	$(LIB)/machdep.a(cstuff.o) \
	$(LIB)/machdep.a(machio.o) \
	$(LIB)/machdep.a(machutil.o) \
	$(LIB)/machdep.a(paral1.o) \
	$(LIB)/machdep.a(paral2.o) \
	$(LIB)/machdep.a(paral3.o) \
	$(LIB)/machdep.a(parset.o) \
	$(LIB)/machdep.a(quanta.o) \
	$(LIB)/machdep.a(socket.o) \
	$(LIB)/machdep.a(space.o) \
	$(LIB)/machdep.a(startup.o) \
	$(LIB)/machdep.a(xdisp.o)
#
$(LIB)/machdep.a : $(OBJS_machdep)
	$(RANLIB) $(LIB)/machdep.a
	@echo machdep COMPLETED
#
# machdep source file rules
$(LIB)/machdep.a(cstuff.o)  : $(SRC)/machdep/cstuff.c
	$(CC) -c $(SRC)/machdep/cstuff.c
	ar rucv $(LIB)/machdep.a cstuff.o
	rm cstuff.o
#
$(LIB)/machdep.a(machio.o)  : $(SRC)/machdep/machio.src
	$(FLX) $(SRC)/machdep/machio.src
	$(FC2) machio.f
	ar rucv $(LIB)/machdep.a machio.o
	rm machio.f
	rm machio.o
#
$(LIB)/machdep.a(machutil.o)  : $(SRC)/machdep/machutil.src
	$(FLX) $(SRC)/machdep/machutil.src
	$(FC2) machutil.f
	ar rucv $(LIB)/machdep.a machutil.o
	rm machutil.f
	rm machutil.o
#
$(LIB)/machdep.a(paral1.o)  : $(SRC)/machdep/paral1.src
	$(FLX) $(SRC)/machdep/paral1.src
	$(FC2) paral1.f
	ar rucv $(LIB)/machdep.a paral1.o
	rm paral1.f
	rm paral1.o
#
$(LIB)/machdep.a(paral2.o)  : $(SRC)/machdep/paral2.src
	$(FLX) $(SRC)/machdep/paral2.src
	$(FC2) paral2.f
	ar rucv $(LIB)/machdep.a paral2.o
	rm paral2.f
	rm paral2.o
#
$(LIB)/machdep.a(paral3.o)  : $(SRC)/machdep/paral3.src
	$(FLX) $(SRC)/machdep/paral3.src
	$(FC2) paral3.f
	ar rucv $(LIB)/machdep.a paral3.o
	rm paral3.f
	rm paral3.o
#
$(LIB)/machdep.a(parset.o)  : $(SRC)/machdep/parset.src
	$(FLX) $(SRC)/machdep/parset.src
	$(FC2) parset.f
	ar rucv $(LIB)/machdep.a parset.o
	rm parset.f
	rm parset.o
#
$(LIB)/machdep.a(quanta.o)  : $(SRC)/machdep/quanta.src
	$(FLX) $(SRC)/machdep/quanta.src
	$(FC2) quanta.f
	ar rucv $(LIB)/machdep.a quanta.o
	rm quanta.f
	rm quanta.o
#
$(LIB)/machdep.a(socket.o)  : $(SRC)/machdep/socket.c
	$(CC) -c $(SRC)/machdep/socket.c
	ar rucv $(LIB)/machdep.a socket.o
	rm socket.o
#
$(LIB)/machdep.a(space.o)  : $(SRC)/machdep/space.src
	$(FLX) $(SRC)/machdep/space.src
	$(FC2) space.f
	ar rucv $(LIB)/machdep.a space.o
	rm space.f
	rm space.o
#
$(LIB)/machdep.a(startup.o)  : $(SRC)/machdep/startup.src
	$(FLX) $(SRC)/machdep/startup.src
	$(FC2) startup.f
	ar rucv $(LIB)/machdep.a startup.o
	rm startup.f
	rm startup.o
#
$(LIB)/machdep.a(xdisp.o)  : $(SRC)/machdep/xdisp.c
	$(CC) -c $(SRC)/machdep/xdisp.c
	ar rucv $(LIB)/machdep.a xdisp.o
	rm xdisp.o
#
#
# machdep dependency file
#
#
$(LIB)/machdep.a(machio.o) : comand.fcm
$(LIB)/machdep.a(machio.o) : dimens.fcm
$(LIB)/machdep.a(machio.o) : exfunc.fcm
$(LIB)/machdep.a(machio.o) : impnon.fcm
$(LIB)/machdep.a(machio.o) : iochan.fcm
$(LIB)/machdep.a(machio.o) : machdep.fcm
$(LIB)/machdep.a(machio.o) : stream.fcm
#
#
$(LIB)/machdep.a(machutil.o) : dimens.fcm
$(LIB)/machdep.a(machutil.o) : ewald.fcm
$(LIB)/machdep.a(machutil.o) : exfunc.fcm
$(LIB)/machdep.a(machutil.o) : impnon.fcm
$(LIB)/machdep.a(machutil.o) : machdep.fcm
$(LIB)/machdep.a(machutil.o) : number.fcm
$(LIB)/machdep.a(machutil.o) : parallel.fcm
$(LIB)/machdep.a(machutil.o) : stream.fcm
#
#
$(LIB)/machdep.a(paral1.o) : dimens.fcm
$(LIB)/machdep.a(paral1.o) : exfunc.fcm
$(LIB)/machdep.a(paral1.o) : heap.fcm
$(LIB)/machdep.a(paral1.o) : impnon.fcm
$(LIB)/machdep.a(paral1.o) : lobos.fcm
$(LIB)/machdep.a(paral1.o) : number.fcm
$(LIB)/machdep.a(paral1.o) : parallel.fcm
$(LIB)/machdep.a(paral1.o) : psf.fcm
$(LIB)/machdep.a(paral1.o) : stack.fcm
$(LIB)/machdep.a(paral1.o) : stream.fcm
$(LIB)/machdep.a(paral1.o) : timer.fcm
#
#
$(LIB)/machdep.a(paral2.o) : dimens.fcm
$(LIB)/machdep.a(paral2.o) : exfunc.fcm
$(LIB)/machdep.a(paral2.o) : impnon.fcm
$(LIB)/machdep.a(paral2.o) : lobos.fcm
$(LIB)/machdep.a(paral2.o) : number.fcm
$(LIB)/machdep.a(paral2.o) : parallel.fcm
$(LIB)/machdep.a(paral2.o) : stack.fcm
$(LIB)/machdep.a(paral2.o) : stream.fcm
#
#
$(LIB)/machdep.a(paral3.o) : cm5.fcm
$(LIB)/machdep.a(paral3.o) : dimens.fcm
$(LIB)/machdep.a(paral3.o) : exfunc.fcm
$(LIB)/machdep.a(paral3.o) : impnon.fcm
$(LIB)/machdep.a(paral3.o) : lobos.fcm
$(LIB)/machdep.a(paral3.o) : number.fcm
$(LIB)/machdep.a(paral3.o) : parallel.fcm
$(LIB)/machdep.a(paral3.o) : stream.fcm
$(LIB)/machdep.a(paral3.o) : timer.fcm
#
#
$(LIB)/machdep.a(parset.o) : impnon.fcm
$(LIB)/machdep.a(parset.o) : parallel.fcm
$(LIB)/machdep.a(parset.o) : stream.fcm
#
#
$(LIB)/machdep.a(quanta.o) : cnst.fcm
$(LIB)/machdep.a(quanta.o) : code.fcm
$(LIB)/machdep.a(quanta.o) : coord.fcm
$(LIB)/machdep.a(quanta.o) : dimens.fcm
$(LIB)/machdep.a(quanta.o) : energy.fcm
$(LIB)/machdep.a(quanta.o) : exfunc.fcm
$(LIB)/machdep.a(quanta.o) : image.fcm
$(LIB)/machdep.a(quanta.o) : impnon.fcm
$(LIB)/machdep.a(quanta.o) : polymer.fcm
$(LIB)/machdep.a(quanta.o) : psf.fcm
$(LIB)/machdep.a(quanta.o) : qcommon.fcm
$(LIB)/machdep.a(quanta.o) : quanta.fcm
$(LIB)/machdep.a(quanta.o) : rtf.fcm
$(LIB)/machdep.a(quanta.o) : stack.fcm
$(LIB)/machdep.a(quanta.o) : stream.fcm
#
#
#
$(LIB)/machdep.a(space.o) : exfunc.fcm
$(LIB)/machdep.a(space.o) : heap.fcm
$(LIB)/machdep.a(space.o) : heappr.fcm
$(LIB)/machdep.a(space.o) : impnon.fcm
$(LIB)/machdep.a(space.o) : stream.fcm
#
#
$(LIB)/machdep.a(startup.o) : cmdpar.fcm
$(LIB)/machdep.a(startup.o) : dimens.fcm
$(LIB)/machdep.a(startup.o) : exfunc.fcm
$(LIB)/machdep.a(startup.o) : heap.fcm
$(LIB)/machdep.a(startup.o) : impnon.fcm
$(LIB)/machdep.a(startup.o) : machdep.fcm
$(LIB)/machdep.a(startup.o) : number.fcm
$(LIB)/machdep.a(startup.o) : quanta.fcm
$(LIB)/machdep.a(startup.o) : stack.fcm
$(LIB)/machdep.a(startup.o) : stream.fcm
#
#
