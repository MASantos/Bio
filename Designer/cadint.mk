# cadint makefile
# cadint library rules
OBJS_cadint= \
	$(LIB)/cadint.a(cadini.o)
#
$(LIB)/cadint.a : $(OBJS_cadint)
	$(RANLIB) $(LIB)/cadint.a
	@echo cadint COMPLETED
#
# cadint source file rules
$(LIB)/cadint.a(cadini.o)  : $(SRC)/cadint/cadini.src
	$(FLX) $(SRC)/cadint/cadini.src
	$(FC2) cadini.f
	ar rucv $(LIB)/cadint.a cadini.o
	rm cadini.f
	rm cadini.o
#
#
# cadint dependency file
#
$(LIB)/cadint.a(cadini.o) : cadpac.fcm
$(LIB)/cadint.a(cadini.o) : code.fcm
$(LIB)/cadint.a(cadini.o) : consta.fcm
$(LIB)/cadint.a(cadini.o) : coord.fcm
$(LIB)/cadint.a(cadini.o) : dimens.fcm
$(LIB)/cadint.a(cadini.o) : energy.fcm
$(LIB)/cadint.a(cadini.o) : exfunc.fcm
$(LIB)/cadint.a(cadini.o) : gamess.fcm
$(LIB)/cadint.a(cadini.o) : impnon.fcm
$(LIB)/cadint.a(cadini.o) : number.fcm
$(LIB)/cadint.a(cadini.o) : param.fcm
$(LIB)/cadint.a(cadini.o) : psf.fcm
$(LIB)/cadint.a(cadini.o) : rtf.fcm
$(LIB)/cadint.a(cadini.o) : stack.fcm
$(LIB)/cadint.a(cadini.o) : stream.fcm
#
