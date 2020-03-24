# dimb makefile
# dimb library rules
OBJS_dimb= \
	$(LIB)/dimb.a(compact.o) \
	$(LIB)/dimb.a(dimbcray.o) \
	$(LIB)/dimb.a(dimbsub.o) \
	$(LIB)/dimb.a(dimbutil.o) \
	$(LIB)/dimb.a(eispack.o) \
	$(LIB)/dimb.a(enecmp.o) \
	$(LIB)/dimb.a(nblist.o) \
	$(LIB)/dimb.a(nmdimb.o)
#
$(LIB)/dimb.a : $(OBJS_dimb)
	$(RANLIB) $(LIB)/dimb.a
	@echo dimb COMPLETED
#
# dimb source file rules
$(LIB)/dimb.a(compact.o)  : $(SRC)/dimb/compact.src
	$(FLX) $(SRC)/dimb/compact.src
	$(FC2) compact.f
	ar rucv $(LIB)/dimb.a compact.o
	rm compact.f
	rm compact.o
#
$(LIB)/dimb.a(dimbcray.o)  : $(SRC)/dimb/dimbcray.src
	$(FLX) $(SRC)/dimb/dimbcray.src
	$(FC2) dimbcray.f
	ar rucv $(LIB)/dimb.a dimbcray.o
	rm dimbcray.f
	rm dimbcray.o
#
$(LIB)/dimb.a(dimbsub.o)  : $(SRC)/dimb/dimbsub.src
	$(FLX) $(SRC)/dimb/dimbsub.src
	$(FC2) dimbsub.f
	ar rucv $(LIB)/dimb.a dimbsub.o
	rm dimbsub.f
	rm dimbsub.o
#
$(LIB)/dimb.a(dimbutil.o)  : $(SRC)/dimb/dimbutil.src
	$(FLX) $(SRC)/dimb/dimbutil.src
	$(FC2) dimbutil.f
	ar rucv $(LIB)/dimb.a dimbutil.o
	rm dimbutil.f
	rm dimbutil.o
#
$(LIB)/dimb.a(eispack.o)  : $(SRC)/dimb/eispack.src
	$(FLX) $(SRC)/dimb/eispack.src
	$(FC2) eispack.f
	ar rucv $(LIB)/dimb.a eispack.o
	rm eispack.f
	rm eispack.o
#
$(LIB)/dimb.a(enecmp.o)  : $(SRC)/dimb/enecmp.src
	$(FLX) $(SRC)/dimb/enecmp.src
	$(FC2) enecmp.f
	ar rucv $(LIB)/dimb.a enecmp.o
	rm enecmp.f
	rm enecmp.o
#
$(LIB)/dimb.a(nblist.o)  : $(SRC)/dimb/nblist.src
	$(FLX) $(SRC)/dimb/nblist.src
	$(FC2) nblist.f
	ar rucv $(LIB)/dimb.a nblist.o
	rm nblist.f
	rm nblist.o
#
$(LIB)/dimb.a(nmdimb.o)  : $(SRC)/dimb/nmdimb.src
	$(FLX) $(SRC)/dimb/nmdimb.src
	$(FC2) nmdimb.f
	ar rucv $(LIB)/dimb.a nmdimb.o
	rm nmdimb.f
	rm nmdimb.o
#
#
# dimb dependency file
#
$(LIB)/dimb.a(compact.o) : dimb.fcm
$(LIB)/dimb.a(compact.o) : impnon.fcm
$(LIB)/dimb.a(compact.o) : stream.fcm
#
#
$(LIB)/dimb.a(dimbcray.o) : impnon.fcm
$(LIB)/dimb.a(dimbcray.o) : stream.fcm
#
#
$(LIB)/dimb.a(dimbsub.o) : consta.fcm
$(LIB)/dimb.a(dimbsub.o) : ctitla.fcm
$(LIB)/dimb.a(dimbsub.o) : deriv.fcm
$(LIB)/dimb.a(dimbsub.o) : dimb.fcm
$(LIB)/dimb.a(dimbsub.o) : dimens.fcm
$(LIB)/dimb.a(dimbsub.o) : energy.fcm
$(LIB)/dimb.a(dimbsub.o) : impnon.fcm
$(LIB)/dimb.a(dimbsub.o) : number.fcm
$(LIB)/dimb.a(dimbsub.o) : stream.fcm
$(LIB)/dimb.a(dimbsub.o) : timer.fcm
#
#
$(LIB)/dimb.a(dimbutil.o) : dimb.fcm
$(LIB)/dimb.a(dimbutil.o) : exfunc.fcm
$(LIB)/dimb.a(dimbutil.o) : impnon.fcm
$(LIB)/dimb.a(dimbutil.o) : number.fcm
$(LIB)/dimb.a(dimbutil.o) : parallel.fcm
$(LIB)/dimb.a(dimbutil.o) : stream.fcm
#
#
$(LIB)/dimb.a(eispack.o) : impnon.fcm
#
#
$(LIB)/dimb.a(enecmp.o) : dimb.fcm
$(LIB)/dimb.a(enecmp.o) : impnon.fcm
$(LIB)/dimb.a(enecmp.o) : number.fcm
#
#
$(LIB)/dimb.a(nblist.o) : dimens.fcm
$(LIB)/dimb.a(nblist.o) : impnon.fcm
#
#
$(LIB)/dimb.a(nmdimb.o) : consta.fcm
$(LIB)/dimb.a(nmdimb.o) : ctitla.fcm
$(LIB)/dimb.a(nmdimb.o) : deriv.fcm
$(LIB)/dimb.a(nmdimb.o) : dimb.fcm
$(LIB)/dimb.a(nmdimb.o) : dimens.fcm
$(LIB)/dimb.a(nmdimb.o) : energy.fcm
$(LIB)/dimb.a(nmdimb.o) : exfunc.fcm
$(LIB)/dimb.a(nmdimb.o) : fast.fcm
$(LIB)/dimb.a(nmdimb.o) : heap.fcm
$(LIB)/dimb.a(nmdimb.o) : impnon.fcm
$(LIB)/dimb.a(nmdimb.o) : number.fcm
$(LIB)/dimb.a(nmdimb.o) : stack.fcm
$(LIB)/dimb.a(nmdimb.o) : stream.fcm
#
