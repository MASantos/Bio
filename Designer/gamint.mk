# gamint makefile
# gamint library rules
OBJS_gamint= \
	$(LIB)/gamint.a(blur.o) \
	$(LIB)/gamint.a(gamini.o)
#
$(LIB)/gamint.a : $(OBJS_gamint)
	$(RANLIB) $(LIB)/gamint.a
	@echo gamint COMPLETED
#
# gamint source file rules
$(LIB)/gamint.a(blur.o)  : $(SRC)/gamint/blur.src
	$(FLX) $(SRC)/gamint/blur.src
	$(FC2) blur.f
	ar rucv $(LIB)/gamint.a blur.o
	rm blur.f
	rm blur.o
#
$(LIB)/gamint.a(gamini.o)  : $(SRC)/gamint/gamini.src
	$(FLX) $(SRC)/gamint/gamini.src
	$(FC2) gamini.f
	ar rucv $(LIB)/gamint.a gamini.o
	rm gamini.f
	rm gamini.o
#
#
# gamint dependency file
#
#
#
$(LIB)/gamint.a(gamini.o) : code.fcm
$(LIB)/gamint.a(gamini.o) : consta.fcm
$(LIB)/gamint.a(gamini.o) : coord.fcm
$(LIB)/gamint.a(gamini.o) : dimens.fcm
$(LIB)/gamint.a(gamini.o) : energy.fcm
$(LIB)/gamint.a(gamini.o) : exfunc.fcm
$(LIB)/gamint.a(gamini.o) : gamess.fcm
$(LIB)/gamint.a(gamini.o) : impnon.fcm
$(LIB)/gamint.a(gamini.o) : number.fcm
$(LIB)/gamint.a(gamini.o) : parallel.fcm
$(LIB)/gamint.a(gamini.o) : param.fcm
$(LIB)/gamint.a(gamini.o) : psf.fcm
$(LIB)/gamint.a(gamini.o) : rtf.fcm
$(LIB)/gamint.a(gamini.o) : stack.fcm
$(LIB)/gamint.a(gamini.o) : stream.fcm
#
