# mmff makefile
# mmff library rules
OBJS_mmff= \
	$(LIB)/mmff.a(assignpar.o) \
	$(LIB)/mmff.a(datastruc.o) \
	$(LIB)/mmff.a(efast_mm.o) \
	$(LIB)/mmff.a(enbfast_mm.o) \
	$(LIB)/mmff.a(enbscalar_mm.o) \
	$(LIB)/mmff.a(escalar_mm.o) \
	$(LIB)/mmff.a(merckio.o) \
	$(LIB)/mmff.a(misc_mm.o) \
	$(LIB)/mmff.a(mmff.o) \
	$(LIB)/mmff.a(mmfftype.o) \
	$(LIB)/mmff.a(parse_mm.o) \
	$(LIB)/mmff.a(readpar.o)
#
$(LIB)/mmff.a : $(OBJS_mmff)
	$(RANLIB) $(LIB)/mmff.a
	@echo mmff COMPLETED
#
# mmff source file rules
$(LIB)/mmff.a(assignpar.o)  : $(SRC)/mmff/assignpar.src
	$(FLX) $(SRC)/mmff/assignpar.src
	$(FC2) assignpar.f
	ar rucv $(LIB)/mmff.a assignpar.o
	rm assignpar.f
	rm assignpar.o
#
$(LIB)/mmff.a(datastruc.o)  : $(SRC)/mmff/datastruc.src
	$(FLX) $(SRC)/mmff/datastruc.src
	$(FC2) datastruc.f
	ar rucv $(LIB)/mmff.a datastruc.o
	rm datastruc.f
	rm datastruc.o
#
$(LIB)/mmff.a(efast_mm.o)  : $(SRC)/mmff/efast_mm.src
	$(FLX) $(SRC)/mmff/efast_mm.src
	$(FC2) efast_mm.f
	ar rucv $(LIB)/mmff.a efast_mm.o
	rm efast_mm.f
	rm efast_mm.o
#
$(LIB)/mmff.a(enbfast_mm.o)  : $(SRC)/mmff/enbfast_mm.src
	$(FLX) $(SRC)/mmff/enbfast_mm.src
	$(FC2) enbfast_mm.f
	ar rucv $(LIB)/mmff.a enbfast_mm.o
	rm enbfast_mm.f
	rm enbfast_mm.o
#
$(LIB)/mmff.a(enbscalar_mm.o)  : $(SRC)/mmff/enbscalar_mm.src
	$(FLX) $(SRC)/mmff/enbscalar_mm.src
	$(FC2) enbscalar_mm.f
	ar rucv $(LIB)/mmff.a enbscalar_mm.o
	rm enbscalar_mm.f
	rm enbscalar_mm.o
#
$(LIB)/mmff.a(escalar_mm.o)  : $(SRC)/mmff/escalar_mm.src
	$(FLX) $(SRC)/mmff/escalar_mm.src
	$(FC2) escalar_mm.f
	ar rucv $(LIB)/mmff.a escalar_mm.o
	rm escalar_mm.f
	rm escalar_mm.o
#
$(LIB)/mmff.a(merckio.o)  : $(SRC)/mmff/merckio.src
	$(FLX) $(SRC)/mmff/merckio.src
	$(FC2) merckio.f
	ar rucv $(LIB)/mmff.a merckio.o
	rm merckio.f
	rm merckio.o
#
$(LIB)/mmff.a(misc_mm.o)  : $(SRC)/mmff/misc_mm.src
	$(FLX) $(SRC)/mmff/misc_mm.src
	$(FC2) misc_mm.f
	ar rucv $(LIB)/mmff.a misc_mm.o
	rm misc_mm.f
	rm misc_mm.o
#
$(LIB)/mmff.a(mmff.o)  : $(SRC)/mmff/mmff.src
	$(FLX) $(SRC)/mmff/mmff.src
	$(FC2) mmff.f
	ar rucv $(LIB)/mmff.a mmff.o
	rm mmff.f
	rm mmff.o
#
$(LIB)/mmff.a(mmfftype.o)  : $(SRC)/mmff/mmfftype.src
	$(FLX) $(SRC)/mmff/mmfftype.src
	$(FC2) mmfftype.f
	ar rucv $(LIB)/mmff.a mmfftype.o
	rm mmfftype.f
	rm mmfftype.o
#
$(LIB)/mmff.a(parse_mm.o)  : $(SRC)/mmff/parse_mm.src
	$(FLX) $(SRC)/mmff/parse_mm.src
	$(FC2) parse_mm.f
	ar rucv $(LIB)/mmff.a parse_mm.o
	rm parse_mm.f
	rm parse_mm.o
#
$(LIB)/mmff.a(readpar.o)  : $(SRC)/mmff/readpar.src
	$(FLX) $(SRC)/mmff/readpar.src
	$(FC2) readpar.f
	ar rucv $(LIB)/mmff.a readpar.o
	rm readpar.f
	rm readpar.o
#
#
# mmff dependency file
#
$(LIB)/mmff.a(assignpar.o) : code.fcm
$(LIB)/mmff.a(assignpar.o) : consta.fcm
$(LIB)/mmff.a(assignpar.o) : dimens.fcm
$(LIB)/mmff.a(assignpar.o) : exfunc.fcm
$(LIB)/mmff.a(assignpar.o) : impnon.fcm
$(LIB)/mmff.a(assignpar.o) : mmff.fcm
$(LIB)/mmff.a(assignpar.o) : param.fcm
$(LIB)/mmff.a(assignpar.o) : psf.fcm
$(LIB)/mmff.a(assignpar.o) : rtf.fcm
$(LIB)/mmff.a(assignpar.o) : stream.fcm
$(LIB)/mmff.a(assignpar.o) : string.fcm
#
#
$(LIB)/mmff.a(datastruc.o) : consta.fcm
$(LIB)/mmff.a(datastruc.o) : dimens.fcm
$(LIB)/mmff.a(datastruc.o) : exfunc.fcm
$(LIB)/mmff.a(datastruc.o) : impnon.fcm
$(LIB)/mmff.a(datastruc.o) : mmff.fcm
$(LIB)/mmff.a(datastruc.o) : psf.fcm
$(LIB)/mmff.a(datastruc.o) : stack.fcm
$(LIB)/mmff.a(datastruc.o) : stream.fcm
$(LIB)/mmff.a(datastruc.o) : string.fcm
#
#
$(LIB)/mmff.a(efast_mm.o) : block.fcm
$(LIB)/mmff.a(efast_mm.o) : code.fcm
$(LIB)/mmff.a(efast_mm.o) : consta.fcm
$(LIB)/mmff.a(efast_mm.o) : dimens.fcm
$(LIB)/mmff.a(efast_mm.o) : exfunc.fcm
$(LIB)/mmff.a(efast_mm.o) : heap.fcm
$(LIB)/mmff.a(efast_mm.o) : impnon.fcm
$(LIB)/mmff.a(efast_mm.o) : machdep.fcm
$(LIB)/mmff.a(efast_mm.o) : mmff.fcm
$(LIB)/mmff.a(efast_mm.o) : number.fcm
$(LIB)/mmff.a(efast_mm.o) : param.fcm
$(LIB)/mmff.a(efast_mm.o) : psf.fcm
$(LIB)/mmff.a(efast_mm.o) : stream.fcm
$(LIB)/mmff.a(efast_mm.o) : string.fcm
$(LIB)/mmff.a(efast_mm.o) : vangle_mm.fcm
$(LIB)/mmff.a(efast_mm.o) : vphi.fcm
#
#
$(LIB)/mmff.a(enbfast_mm.o) : block.fcm
$(LIB)/mmff.a(enbfast_mm.o) : consta.fcm
$(LIB)/mmff.a(enbfast_mm.o) : dimens.fcm
$(LIB)/mmff.a(enbfast_mm.o) : ewald.fcm
$(LIB)/mmff.a(enbfast_mm.o) : exfunc.fcm
$(LIB)/mmff.a(enbfast_mm.o) : fast.fcm
$(LIB)/mmff.a(enbfast_mm.o) : heap.fcm
$(LIB)/mmff.a(enbfast_mm.o) : impnon.fcm
$(LIB)/mmff.a(enbfast_mm.o) : inbnd.fcm
$(LIB)/mmff.a(enbfast_mm.o) : machdep.fcm
$(LIB)/mmff.a(enbfast_mm.o) : number.fcm
$(LIB)/mmff.a(enbfast_mm.o) : param.fcm
$(LIB)/mmff.a(enbfast_mm.o) : stream.fcm
#
#
$(LIB)/mmff.a(enbscalar_mm.o) : block.fcm
$(LIB)/mmff.a(enbscalar_mm.o) : consta.fcm
$(LIB)/mmff.a(enbscalar_mm.o) : dimens.fcm
$(LIB)/mmff.a(enbscalar_mm.o) : ewald.fcm
$(LIB)/mmff.a(enbscalar_mm.o) : exfunc.fcm
$(LIB)/mmff.a(enbscalar_mm.o) : heap.fcm
$(LIB)/mmff.a(enbscalar_mm.o) : impnon.fcm
$(LIB)/mmff.a(enbscalar_mm.o) : number.fcm
$(LIB)/mmff.a(enbscalar_mm.o) : stream.fcm
#
#
$(LIB)/mmff.a(escalar_mm.o) : block.fcm
$(LIB)/mmff.a(escalar_mm.o) : consta.fcm
$(LIB)/mmff.a(escalar_mm.o) : dimens.fcm
$(LIB)/mmff.a(escalar_mm.o) : exfunc.fcm
$(LIB)/mmff.a(escalar_mm.o) : heap.fcm
$(LIB)/mmff.a(escalar_mm.o) : impnon.fcm
$(LIB)/mmff.a(escalar_mm.o) : mmff.fcm
$(LIB)/mmff.a(escalar_mm.o) : number.fcm
$(LIB)/mmff.a(escalar_mm.o) : parallel.fcm
$(LIB)/mmff.a(escalar_mm.o) : psf.fcm
$(LIB)/mmff.a(escalar_mm.o) : stream.fcm
$(LIB)/mmff.a(escalar_mm.o) : string.fcm
#
#
$(LIB)/mmff.a(merckio.o) : ctitla.fcm
$(LIB)/mmff.a(merckio.o) : dimens.fcm
$(LIB)/mmff.a(merckio.o) : energy.fcm
$(LIB)/mmff.a(merckio.o) : impnon.fcm
$(LIB)/mmff.a(merckio.o) : stream.fcm
$(LIB)/mmff.a(merckio.o) : string.fcm
#
#
$(LIB)/mmff.a(misc_mm.o) : dimens.fcm
$(LIB)/mmff.a(misc_mm.o) : exfunc.fcm
$(LIB)/mmff.a(misc_mm.o) : impnon.fcm
$(LIB)/mmff.a(misc_mm.o) : mmff.fcm
$(LIB)/mmff.a(misc_mm.o) : psf.fcm
$(LIB)/mmff.a(misc_mm.o) : string.fcm
#
#
$(LIB)/mmff.a(mmff.o) : code.fcm
$(LIB)/mmff.a(mmff.o) : comand.fcm
$(LIB)/mmff.a(mmff.o) : consta.fcm
$(LIB)/mmff.a(mmff.o) : coord.fcm
$(LIB)/mmff.a(mmff.o) : ctitla.fcm
$(LIB)/mmff.a(mmff.o) : dimens.fcm
$(LIB)/mmff.a(mmff.o) : exfunc.fcm
$(LIB)/mmff.a(mmff.o) : ffield.fcm
$(LIB)/mmff.a(mmff.o) : impnon.fcm
$(LIB)/mmff.a(mmff.o) : inbnd.fcm
$(LIB)/mmff.a(mmff.o) : io.fcm
$(LIB)/mmff.a(mmff.o) : mmff.fcm
$(LIB)/mmff.a(mmff.o) : number.fcm
$(LIB)/mmff.a(mmff.o) : param.fcm
$(LIB)/mmff.a(mmff.o) : psf.fcm
$(LIB)/mmff.a(mmff.o) : rtf.fcm
$(LIB)/mmff.a(mmff.o) : stack.fcm
$(LIB)/mmff.a(mmff.o) : stream.fcm
$(LIB)/mmff.a(mmff.o) : string.fcm
#
#
$(LIB)/mmff.a(mmfftype.o) : coord.fcm
$(LIB)/mmff.a(mmfftype.o) : dimens.fcm
$(LIB)/mmff.a(mmfftype.o) : exfunc.fcm
$(LIB)/mmff.a(mmfftype.o) : impnon.fcm
$(LIB)/mmff.a(mmfftype.o) : mmff.fcm
$(LIB)/mmff.a(mmfftype.o) : psf.fcm
$(LIB)/mmff.a(mmfftype.o) : stream.fcm
$(LIB)/mmff.a(mmfftype.o) : string.fcm
#
#
$(LIB)/mmff.a(parse_mm.o) : dimens.fcm
$(LIB)/mmff.a(parse_mm.o) : exfunc.fcm
$(LIB)/mmff.a(parse_mm.o) : impnon.fcm
$(LIB)/mmff.a(parse_mm.o) : mmff.fcm
$(LIB)/mmff.a(parse_mm.o) : psf.fcm
$(LIB)/mmff.a(parse_mm.o) : stream.fcm
#
#
$(LIB)/mmff.a(readpar.o) : consta.fcm
$(LIB)/mmff.a(readpar.o) : cstack.fcm
$(LIB)/mmff.a(readpar.o) : dimens.fcm
$(LIB)/mmff.a(readpar.o) : exfunc.fcm
$(LIB)/mmff.a(readpar.o) : ffield.fcm
$(LIB)/mmff.a(readpar.o) : impnon.fcm
$(LIB)/mmff.a(readpar.o) : inbnd.fcm
$(LIB)/mmff.a(readpar.o) : mmff.fcm
$(LIB)/mmff.a(readpar.o) : number.fcm
$(LIB)/mmff.a(readpar.o) : param.fcm
$(LIB)/mmff.a(readpar.o) : rtf.fcm
$(LIB)/mmff.a(readpar.o) : stack.fcm
$(LIB)/mmff.a(readpar.o) : stream.fcm
$(LIB)/mmff.a(readpar.o) : string.fcm
#
