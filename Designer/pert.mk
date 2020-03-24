# pert makefile
# pert library rules
OBJS_pert= \
	$(LIB)/pert.a(block.o) \
	$(LIB)/pert.a(epert.o) \
	$(LIB)/pert.a(icfcnf.o) \
	$(LIB)/pert.a(icfix.o) \
	$(LIB)/pert.a(icpert.o) \
	$(LIB)/pert.a(pert.o) \
	$(LIB)/pert.a(puic.o) \
	$(LIB)/pert.a(tsme.o) \
	$(LIB)/pert.a(tsmp.o) \
	$(LIB)/pert.a(tsms.o) \
	$(LIB)/pert.a(wham.o)
#
$(LIB)/pert.a : $(OBJS_pert)
	$(RANLIB) $(LIB)/pert.a
	@echo pert COMPLETED
#
# pert source file rules
$(LIB)/pert.a(block.o)  : $(SRC)/pert/block.src
	$(FLX) $(SRC)/pert/block.src
	$(FC2) block.f
	ar rucv $(LIB)/pert.a block.o
	rm block.f
	rm block.o
#
$(LIB)/pert.a(epert.o)  : $(SRC)/pert/epert.src
	$(FLX) $(SRC)/pert/epert.src
	$(FC2) epert.f
	ar rucv $(LIB)/pert.a epert.o
	rm epert.f
	rm epert.o
#
$(LIB)/pert.a(icfcnf.o)  : $(SRC)/pert/icfcnf.src
	$(FLX) $(SRC)/pert/icfcnf.src
	$(FC2) icfcnf.f
	ar rucv $(LIB)/pert.a icfcnf.o
	rm icfcnf.f
	rm icfcnf.o
#
$(LIB)/pert.a(icfix.o)  : $(SRC)/pert/icfix.src
	$(FLX) $(SRC)/pert/icfix.src
	$(FC2) icfix.f
	ar rucv $(LIB)/pert.a icfix.o
	rm icfix.f
	rm icfix.o
#
$(LIB)/pert.a(icpert.o)  : $(SRC)/pert/icpert.src
	$(FLX) $(SRC)/pert/icpert.src
	$(FC2) icpert.f
	ar rucv $(LIB)/pert.a icpert.o
	rm icpert.f
	rm icpert.o
#
$(LIB)/pert.a(pert.o)  : $(SRC)/pert/pert.src
	$(FLX) $(SRC)/pert/pert.src
	$(FC2) pert.f
	ar rucv $(LIB)/pert.a pert.o
	rm pert.f
	rm pert.o
#
$(LIB)/pert.a(puic.o)  : $(SRC)/pert/puic.src
	$(FLX) $(SRC)/pert/puic.src
	$(FC2) puic.f
	ar rucv $(LIB)/pert.a puic.o
	rm puic.f
	rm puic.o
#
$(LIB)/pert.a(tsme.o)  : $(SRC)/pert/tsme.src
	$(FLX) $(SRC)/pert/tsme.src
	$(FC2) tsme.f
	ar rucv $(LIB)/pert.a tsme.o
	rm tsme.f
	rm tsme.o
#
$(LIB)/pert.a(tsmp.o)  : $(SRC)/pert/tsmp.src
	$(FLX) $(SRC)/pert/tsmp.src
	$(FC2) tsmp.f
	ar rucv $(LIB)/pert.a tsmp.o
	rm tsmp.f
	rm tsmp.o
#
$(LIB)/pert.a(tsms.o)  : $(SRC)/pert/tsms.src
	$(FLX) $(SRC)/pert/tsms.src
	$(FC2) tsms.f
	ar rucv $(LIB)/pert.a tsms.o
	rm tsms.f
	rm tsms.o
#
$(LIB)/pert.a(wham.o)  : $(SRC)/pert/wham.src
	$(FLX) $(SRC)/pert/wham.src
	$(FC2) wham.f
	ar rucv $(LIB)/pert.a wham.o
	rm wham.f
	rm wham.o
#
#
# pert dependency file
#
$(LIB)/pert.a(block.o) : bases.fcm
$(LIB)/pert.a(block.o) : block.fcm
$(LIB)/pert.a(block.o) : comand.fcm
$(LIB)/pert.a(block.o) : consta.fcm
$(LIB)/pert.a(block.o) : coord.fcm
$(LIB)/pert.a(block.o) : coordc.fcm
$(LIB)/pert.a(block.o) : ctitla.fcm
$(LIB)/pert.a(block.o) : deriv.fcm
$(LIB)/pert.a(block.o) : dimens.fcm
$(LIB)/pert.a(block.o) : energy.fcm
$(LIB)/pert.a(block.o) : exfunc.fcm
$(LIB)/pert.a(block.o) : fast.fcm
$(LIB)/pert.a(block.o) : ffield.fcm
$(LIB)/pert.a(block.o) : hbond.fcm
$(LIB)/pert.a(block.o) : heap.fcm
$(LIB)/pert.a(block.o) : image.fcm
$(LIB)/pert.a(block.o) : impnon.fcm
$(LIB)/pert.a(block.o) : inbnd.fcm
$(LIB)/pert.a(block.o) : lambda.fcm
$(LIB)/pert.a(block.o) : mmff.fcm
$(LIB)/pert.a(block.o) : number.fcm
$(LIB)/pert.a(block.o) : param.fcm
$(LIB)/pert.a(block.o) : psf.fcm
$(LIB)/pert.a(block.o) : rwlamb.fcm
$(LIB)/pert.a(block.o) : stack.fcm
$(LIB)/pert.a(block.o) : stream.fcm
#
#
$(LIB)/pert.a(epert.o) : bases.fcm
$(LIB)/pert.a(epert.o) : cnst.fcm
$(LIB)/pert.a(epert.o) : code.fcm
$(LIB)/pert.a(epert.o) : dimens.fcm
$(LIB)/pert.a(epert.o) : econt.fcm
$(LIB)/pert.a(epert.o) : energy.fcm
$(LIB)/pert.a(epert.o) : epert.fcm
$(LIB)/pert.a(epert.o) : euler.fcm
$(LIB)/pert.a(epert.o) : ewald.fcm
$(LIB)/pert.a(epert.o) : exelec.fcm
$(LIB)/pert.a(epert.o) : exfunc.fcm
$(LIB)/pert.a(epert.o) : fast.fcm
$(LIB)/pert.a(epert.o) : ffield.fcm
$(LIB)/pert.a(epert.o) : fourd.fcm
$(LIB)/pert.a(epert.o) : hbond.fcm
$(LIB)/pert.a(epert.o) : heap.fcm
$(LIB)/pert.a(epert.o) : image.fcm
$(LIB)/pert.a(epert.o) : impnon.fcm
$(LIB)/pert.a(epert.o) : inbnd.fcm
$(LIB)/pert.a(epert.o) : machdep.fcm
$(LIB)/pert.a(epert.o) : mmff.fcm
$(LIB)/pert.a(epert.o) : mmfp.fcm
$(LIB)/pert.a(epert.o) : noe.fcm
$(LIB)/pert.a(epert.o) : number.fcm
$(LIB)/pert.a(epert.o) : parallel.fcm
$(LIB)/pert.a(epert.o) : param.fcm
$(LIB)/pert.a(epert.o) : path.fcm
$(LIB)/pert.a(epert.o) : pbound.fcm
$(LIB)/pert.a(epert.o) : pert.fcm
$(LIB)/pert.a(epert.o) : polar.fcm
$(LIB)/pert.a(epert.o) : psf.fcm
$(LIB)/pert.a(epert.o) : pshake.fcm
$(LIB)/pert.a(epert.o) : quantm.fcm
$(LIB)/pert.a(epert.o) : reawri.fcm
$(LIB)/pert.a(epert.o) : sbound.fcm
$(LIB)/pert.a(epert.o) : shake.fcm
$(LIB)/pert.a(epert.o) : shapes.fcm
$(LIB)/pert.a(epert.o) : ssbp.fcm
$(LIB)/pert.a(epert.o) : stack.fcm
$(LIB)/pert.a(epert.o) : stream.fcm
$(LIB)/pert.a(epert.o) : surface.fcm
$(LIB)/pert.a(epert.o) : tbmts.fcm
$(LIB)/pert.a(epert.o) : timer.fcm
$(LIB)/pert.a(epert.o) : tsms.fcm
#
#
$(LIB)/pert.a(icfcnf.o) : bases.fcm
$(LIB)/pert.a(icfcnf.o) : cnst.fcm
$(LIB)/pert.a(icfcnf.o) : code.fcm
$(LIB)/pert.a(icfcnf.o) : consta.fcm
$(LIB)/pert.a(icfcnf.o) : coord.fcm
$(LIB)/pert.a(icfcnf.o) : ctitla.fcm
$(LIB)/pert.a(icfcnf.o) : deriv.fcm
$(LIB)/pert.a(icfcnf.o) : dimens.fcm
$(LIB)/pert.a(icfcnf.o) : energy.fcm
$(LIB)/pert.a(icfcnf.o) : exfunc.fcm
$(LIB)/pert.a(icfcnf.o) : fast.fcm
$(LIB)/pert.a(icfcnf.o) : hbond.fcm
$(LIB)/pert.a(icfcnf.o) : heap.fcm
$(LIB)/pert.a(icfcnf.o) : icfix.fcm
$(LIB)/pert.a(icfcnf.o) : icpert.fcm
$(LIB)/pert.a(icfcnf.o) : image.fcm
$(LIB)/pert.a(icfcnf.o) : impnon.fcm
$(LIB)/pert.a(icfcnf.o) : inbnd.fcm
$(LIB)/pert.a(icfcnf.o) : number.fcm
$(LIB)/pert.a(icfcnf.o) : param.fcm
$(LIB)/pert.a(icfcnf.o) : psf.fcm
$(LIB)/pert.a(icfcnf.o) : stack.fcm
$(LIB)/pert.a(icfcnf.o) : stream.fcm
#
#
$(LIB)/pert.a(icfix.o) : comand.fcm
$(LIB)/pert.a(icfix.o) : consta.fcm
$(LIB)/pert.a(icfix.o) : coord.fcm
$(LIB)/pert.a(icfix.o) : dimens.fcm
$(LIB)/pert.a(icfix.o) : exfunc.fcm
$(LIB)/pert.a(icfix.o) : icfix.fcm
$(LIB)/pert.a(icfix.o) : impnon.fcm
$(LIB)/pert.a(icfix.o) : number.fcm
$(LIB)/pert.a(icfix.o) : psf.fcm
$(LIB)/pert.a(icfix.o) : shake.fcm
$(LIB)/pert.a(icfix.o) : stream.fcm
#
#
$(LIB)/pert.a(icpert.o) : bases.fcm
$(LIB)/pert.a(icpert.o) : cnst.fcm
$(LIB)/pert.a(icpert.o) : code.fcm
$(LIB)/pert.a(icpert.o) : comand.fcm
$(LIB)/pert.a(icpert.o) : consta.fcm
$(LIB)/pert.a(icpert.o) : dimens.fcm
$(LIB)/pert.a(icpert.o) : energy.fcm
$(LIB)/pert.a(icpert.o) : exfunc.fcm
$(LIB)/pert.a(icpert.o) : fast.fcm
$(LIB)/pert.a(icpert.o) : hbond.fcm
$(LIB)/pert.a(icpert.o) : heap.fcm
$(LIB)/pert.a(icpert.o) : icpert.fcm
$(LIB)/pert.a(icpert.o) : image.fcm
$(LIB)/pert.a(icpert.o) : impnon.fcm
$(LIB)/pert.a(icpert.o) : inbnd.fcm
$(LIB)/pert.a(icpert.o) : number.fcm
$(LIB)/pert.a(icpert.o) : param.fcm
$(LIB)/pert.a(icpert.o) : psf.fcm
$(LIB)/pert.a(icpert.o) : selcta.fcm
$(LIB)/pert.a(icpert.o) : stack.fcm
$(LIB)/pert.a(icpert.o) : stream.fcm
#
#
$(LIB)/pert.a(pert.o) : bases.fcm
$(LIB)/pert.a(pert.o) : cnst.fcm
$(LIB)/pert.a(pert.o) : code.fcm
$(LIB)/pert.a(pert.o) : comand.fcm
$(LIB)/pert.a(pert.o) : consta.fcm
$(LIB)/pert.a(pert.o) : contrl.fcm
$(LIB)/pert.a(pert.o) : coord.fcm
$(LIB)/pert.a(pert.o) : ctitla.fcm
$(LIB)/pert.a(pert.o) : dimens.fcm
$(LIB)/pert.a(pert.o) : econt.fcm
$(LIB)/pert.a(pert.o) : energy.fcm
$(LIB)/pert.a(pert.o) : epert.fcm
$(LIB)/pert.a(pert.o) : exfunc.fcm
$(LIB)/pert.a(pert.o) : fast.fcm
$(LIB)/pert.a(pert.o) : heap.fcm
$(LIB)/pert.a(pert.o) : image.fcm
$(LIB)/pert.a(pert.o) : impnon.fcm
$(LIB)/pert.a(pert.o) : inbnd.fcm
$(LIB)/pert.a(pert.o) : mmff.fcm
$(LIB)/pert.a(pert.o) : noe.fcm
$(LIB)/pert.a(pert.o) : number.fcm
$(LIB)/pert.a(pert.o) : param.fcm
$(LIB)/pert.a(pert.o) : pert.fcm
$(LIB)/pert.a(pert.o) : psf.fcm
$(LIB)/pert.a(pert.o) : reawri.fcm
$(LIB)/pert.a(pert.o) : shake.fcm
$(LIB)/pert.a(pert.o) : stream.fcm
#
#
$(LIB)/pert.a(puic.o) : bases.fcm
$(LIB)/pert.a(puic.o) : comand.fcm
$(LIB)/pert.a(puic.o) : consta.fcm
$(LIB)/pert.a(puic.o) : coord.fcm
$(LIB)/pert.a(puic.o) : coordc.fcm
$(LIB)/pert.a(puic.o) : ctitla.fcm
$(LIB)/pert.a(puic.o) : deriv.fcm
$(LIB)/pert.a(puic.o) : dimens.fcm
$(LIB)/pert.a(puic.o) : energy.fcm
$(LIB)/pert.a(puic.o) : exfunc.fcm
$(LIB)/pert.a(puic.o) : heap.fcm
$(LIB)/pert.a(puic.o) : icfix.fcm
$(LIB)/pert.a(puic.o) : icpert.fcm
$(LIB)/pert.a(puic.o) : impnon.fcm
$(LIB)/pert.a(puic.o) : intcr.fcm
$(LIB)/pert.a(puic.o) : number.fcm
$(LIB)/pert.a(puic.o) : psf.fcm
$(LIB)/pert.a(puic.o) : stack.fcm
$(LIB)/pert.a(puic.o) : stream.fcm
#
#
$(LIB)/pert.a(tsme.o) : bases.fcm
$(LIB)/pert.a(tsme.o) : code.fcm
$(LIB)/pert.a(tsme.o) : consta.fcm
$(LIB)/pert.a(tsme.o) : dimens.fcm
$(LIB)/pert.a(tsme.o) : energy.fcm
$(LIB)/pert.a(tsme.o) : ewald.fcm
$(LIB)/pert.a(tsme.o) : exfunc.fcm
$(LIB)/pert.a(tsme.o) : fast.fcm
$(LIB)/pert.a(tsme.o) : hbond.fcm
$(LIB)/pert.a(tsme.o) : heap.fcm
$(LIB)/pert.a(tsme.o) : image.fcm
$(LIB)/pert.a(tsme.o) : impnon.fcm
$(LIB)/pert.a(tsme.o) : inbnd.fcm
$(LIB)/pert.a(tsme.o) : number.fcm
$(LIB)/pert.a(tsme.o) : param.fcm
$(LIB)/pert.a(tsme.o) : psf.fcm
$(LIB)/pert.a(tsme.o) : stack.fcm
$(LIB)/pert.a(tsme.o) : stream.fcm
$(LIB)/pert.a(tsme.o) : timer.fcm
$(LIB)/pert.a(tsme.o) : tsmh.fcm
$(LIB)/pert.a(tsme.o) : tsms.fcm
#
#
$(LIB)/pert.a(tsmp.o) : comand.fcm
$(LIB)/pert.a(tsmp.o) : consta.fcm
$(LIB)/pert.a(tsmp.o) : ctitla.fcm
$(LIB)/pert.a(tsmp.o) : dimens.fcm
$(LIB)/pert.a(tsmp.o) : exfunc.fcm
$(LIB)/pert.a(tsmp.o) : impnon.fcm
$(LIB)/pert.a(tsmp.o) : number.fcm
$(LIB)/pert.a(tsmp.o) : stack.fcm
$(LIB)/pert.a(tsmp.o) : stream.fcm
$(LIB)/pert.a(tsmp.o) : timer.fcm
#
#
$(LIB)/pert.a(tsms.o) : bases.fcm
$(LIB)/pert.a(tsms.o) : cnst.fcm
$(LIB)/pert.a(tsms.o) : code.fcm
$(LIB)/pert.a(tsms.o) : comand.fcm
$(LIB)/pert.a(tsms.o) : consta.fcm
$(LIB)/pert.a(tsms.o) : coord.fcm
$(LIB)/pert.a(tsms.o) : ctitla.fcm
$(LIB)/pert.a(tsms.o) : dimens.fcm
$(LIB)/pert.a(tsms.o) : energy.fcm
$(LIB)/pert.a(tsms.o) : ewald.fcm
$(LIB)/pert.a(tsms.o) : exfunc.fcm
$(LIB)/pert.a(tsms.o) : heap.fcm
$(LIB)/pert.a(tsms.o) : icfix.fcm
$(LIB)/pert.a(tsms.o) : icpert.fcm
$(LIB)/pert.a(tsms.o) : image.fcm
$(LIB)/pert.a(tsms.o) : impnon.fcm
$(LIB)/pert.a(tsms.o) : inbnd.fcm
$(LIB)/pert.a(tsms.o) : number.fcm
$(LIB)/pert.a(tsms.o) : param.fcm
$(LIB)/pert.a(tsms.o) : psf.fcm
$(LIB)/pert.a(tsms.o) : shake.fcm
$(LIB)/pert.a(tsms.o) : stack.fcm
$(LIB)/pert.a(tsms.o) : stream.fcm
$(LIB)/pert.a(tsms.o) : string.fcm
$(LIB)/pert.a(tsms.o) : timer.fcm
$(LIB)/pert.a(tsms.o) : tsmh.fcm
$(LIB)/pert.a(tsms.o) : tsms.fcm
#
#
$(LIB)/pert.a(wham.o) : comand.fcm
$(LIB)/pert.a(wham.o) : consta.fcm
$(LIB)/pert.a(wham.o) : ctitla.fcm
$(LIB)/pert.a(wham.o) : dimens.fcm
$(LIB)/pert.a(wham.o) : exfunc.fcm
$(LIB)/pert.a(wham.o) : heap.fcm
$(LIB)/pert.a(wham.o) : impnon.fcm
$(LIB)/pert.a(wham.o) : number.fcm
$(LIB)/pert.a(wham.o) : stream.fcm
#
