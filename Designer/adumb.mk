# adumb makefile
# adumb library rules
OBJS_adumb= \
	$(LIB)/adumb.a(cmds.o) \
	$(LIB)/adumb.a(eadumb.o) \
	$(LIB)/adumb.a(eval.o) \
	$(LIB)/adumb.a(svdcmp.o) \
	$(LIB)/adumb.a(umb.o)
#
$(LIB)/adumb.a : $(OBJS_adumb)
	$(RANLIB) $(LIB)/adumb.a
	@echo adumb COMPLETED
#
# adumb source file rules
$(LIB)/adumb.a(cmds.o)  : $(SRC)/adumb/cmds.src
	$(FLX) $(SRC)/adumb/cmds.src
	$(FC2) cmds.f
	ar rucv $(LIB)/adumb.a cmds.o
	rm cmds.f
	rm cmds.o
#
$(LIB)/adumb.a(eadumb.o)  : $(SRC)/adumb/eadumb.src
	$(FLX) $(SRC)/adumb/eadumb.src
	$(FC2) eadumb.f
	ar rucv $(LIB)/adumb.a eadumb.o
	rm eadumb.f
	rm eadumb.o
#
$(LIB)/adumb.a(eval.o)  : $(SRC)/adumb/eval.src
	$(FLX) $(SRC)/adumb/eval.src
	$(FC2) eval.f
	ar rucv $(LIB)/adumb.a eval.o
	rm eval.f
	rm eval.o
#
$(LIB)/adumb.a(svdcmp.o)  : $(SRC)/adumb/svdcmp.src
	$(FLX) $(SRC)/adumb/svdcmp.src
	$(FC2) svdcmp.f
	ar rucv $(LIB)/adumb.a svdcmp.o
	rm svdcmp.f
	rm svdcmp.o
#
$(LIB)/adumb.a(umb.o)  : $(SRC)/adumb/umb.src
	$(FLX) $(SRC)/adumb/umb.src
	$(FC2) umb.f
	ar rucv $(LIB)/adumb.a umb.o
	rm umb.f
	rm umb.o
#
#
# adumb dependency file
#
$(LIB)/adumb.a(cmds.o) : bases.fcm
$(LIB)/adumb.a(cmds.o) : cnst.fcm
$(LIB)/adumb.a(cmds.o) : code.fcm
$(LIB)/adumb.a(cmds.o) : consta.fcm
$(LIB)/adumb.a(cmds.o) : coord.fcm
$(LIB)/adumb.a(cmds.o) : coordc.fcm
$(LIB)/adumb.a(cmds.o) : dimens.fcm
$(LIB)/adumb.a(cmds.o) : exfunc.fcm
$(LIB)/adumb.a(cmds.o) : heap.fcm
$(LIB)/adumb.a(cmds.o) : impnon.fcm
$(LIB)/adumb.a(cmds.o) : noe.fcm
$(LIB)/adumb.a(cmds.o) : number.fcm
$(LIB)/adumb.a(cmds.o) : psf.fcm
$(LIB)/adumb.a(cmds.o) : replica.fcm
$(LIB)/adumb.a(cmds.o) : stack.fcm
$(LIB)/adumb.a(cmds.o) : stream.fcm
$(LIB)/adumb.a(cmds.o) : umb.fcm
#
#
$(LIB)/adumb.a(eadumb.o) : block.fcm
$(LIB)/adumb.a(eadumb.o) : cnst.fcm
$(LIB)/adumb.a(eadumb.o) : consta.fcm
$(LIB)/adumb.a(eadumb.o) : dimens.fcm
$(LIB)/adumb.a(eadumb.o) : econt.fcm
$(LIB)/adumb.a(eadumb.o) : exfunc.fcm
$(LIB)/adumb.a(eadumb.o) : heap.fcm
$(LIB)/adumb.a(eadumb.o) : impnon.fcm
$(LIB)/adumb.a(eadumb.o) : number.fcm
$(LIB)/adumb.a(eadumb.o) : stream.fcm
$(LIB)/adumb.a(eadumb.o) : umb.fcm
#
#
$(LIB)/adumb.a(eval.o) : consta.fcm
$(LIB)/adumb.a(eval.o) : dimens.fcm
$(LIB)/adumb.a(eval.o) : exfunc.fcm
$(LIB)/adumb.a(eval.o) : impnon.fcm
$(LIB)/adumb.a(eval.o) : number.fcm
$(LIB)/adumb.a(eval.o) : stream.fcm
$(LIB)/adumb.a(eval.o) : umb.fcm
#
#
#
#
$(LIB)/adumb.a(umb.o) : consta.fcm
$(LIB)/adumb.a(umb.o) : dimens.fcm
$(LIB)/adumb.a(umb.o) : exfunc.fcm
$(LIB)/adumb.a(umb.o) : heap.fcm
$(LIB)/adumb.a(umb.o) : impnon.fcm
$(LIB)/adumb.a(umb.o) : number.fcm
$(LIB)/adumb.a(umb.o) : stack.fcm
$(LIB)/adumb.a(umb.o) : stream.fcm
$(LIB)/adumb.a(umb.o) : umb.fcm
#
