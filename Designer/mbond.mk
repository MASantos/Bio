# mbond makefile
# mbond library rules
OBJS_mbond= \
	$(LIB)/mbond.a(iposdd.o) \
	$(LIB)/mbond.a(mbback.o) \
	$(LIB)/mbond.a(mbdiag.o) \
	$(LIB)/mbond.a(mbdyn.o) \
	$(LIB)/mbond.a(mbmodes.o) \
	$(LIB)/mbond.a(mbmts.o) \
	$(LIB)/mbond.a(mbond.o) \
	$(LIB)/mbond.a(mbsec.o) \
	$(LIB)/mbond.a(mbsub.o) \
	$(LIB)/mbond.a(mbutil.o) \
	$(LIB)/mbond.a(mbspp.o) \
	$(LIB)/mbond.a(modio.o) \
	$(LIB)/mbond.a(modtrans.o)
#
$(LIB)/mbond.a : $(OBJS_mbond)
	$(RANLIB) $(LIB)/mbond.a
	@echo mbond COMPLETED
#
# mbond source file rules
$(LIB)/mbond.a(iposdd.o): $(SRC)/mbond/iposdd.src
	$(FLX) $(SRC)/mbond/iposdd.src
	mv iposdd.f iposdd.F
	$(FC2) iposdd.F
	ar rucv $(LIB)/mbond.a iposdd.o
	rm iposdd.o
	rm iposdd.F
#
$(LIB)/mbond.a(mbback.o): $(SRC)/mbond/mbback.src
	$(FLX) $(SRC)/mbond/mbback.src
	mv mbback.f mbback.F
	$(FC2) mbback.F
	ar rucv $(LIB)/mbond.a mbback.o
	rm mbback.o
	rm mbback.F
#
$(LIB)/mbond.a(mbdiag.o): $(SRC)/mbond/mbdiag.src
	$(FLX) $(SRC)/mbond/mbdiag.src
	mv mbdiag.f mbdiag.F
	$(FC2) mbdiag.F
	ar rucv $(LIB)/mbond.a mbdiag.o
	rm mbdiag.o
	rm mbdiag.F
#
$(LIB)/mbond.a(mbdyn.o): $(SRC)/mbond/mbdyn.src
	$(FLX) $(SRC)/mbond/mbdyn.src
	mv mbdyn.f mbdyn.F
	$(FC2) mbdyn.F
	ar rucv $(LIB)/mbond.a mbdyn.o
	rm mbdyn.o
	rm mbdyn.F
#
$(LIB)/mbond.a(mbmodes.o): $(SRC)/mbond/mbmodes.src
	$(FLX) $(SRC)/mbond/mbmodes.src
	mv mbmodes.f mbmodes.F
	$(FC2) mbmodes.F
	ar rucv $(LIB)/mbond.a mbmodes.o
	rm mbmodes.o
	rm mbmodes.F
#
$(LIB)/mbond.a(mbmts.o): $(SRC)/mbond/mbmts.src
	$(FLX) $(SRC)/mbond/mbmts.src
	mv mbmts.f mbmts.F
	$(FC2) mbmts.F
	ar rucv $(LIB)/mbond.a mbmts.o
	rm mbmts.o
	rm mbmts.F
#
$(LIB)/mbond.a(mbond.o): $(SRC)/mbond/mbond.src
	$(FLX) $(SRC)/mbond/mbond.src
	mv mbond.f mbond.F
	$(FC2) mbond.F
	ar rucv $(LIB)/mbond.a mbond.o
	rm mbond.o
	rm mbond.F
#
$(LIB)/mbond.a(mbsec.o): $(SRC)/mbond/mbsec.src
	$(FLX) $(SRC)/mbond/mbsec.src
	mv mbsec.f mbsec.F
	$(FC2) mbsec.F
	ar rucv $(LIB)/mbond.a mbsec.o
	rm mbsec.o
	rm mbsec.F
#
$(LIB)/mbond.a(mbsub.o): $(SRC)/mbond/mbsub.src
	$(FLX) $(SRC)/mbond/mbsub.src
	mv mbsub.f mbsub.F
	$(FC2) mbsub.F
	ar rucv $(LIB)/mbond.a mbsub.o
	rm mbsub.o
	rm mbsub.F
#
$(LIB)/mbond.a(mbutil.o): $(SRC)/mbond/mbutil.src
	$(FLX) $(SRC)/mbond/mbutil.src
	mv mbutil.f mbutil.F
	$(FC2) mbutil.F
	ar rucv $(LIB)/mbond.a mbutil.o
	rm mbutil.o
	rm mbutil.F
#
$(LIB)/mbond.a(mbspp.o): $(SRC)/mbond/mbspp.src
	$(FLX) $(SRC)/mbond/mbspp.src
	mv mbspp.f mbspp.F
	$(FC2) mbspp.F
	ar rucv $(LIB)/mbond.a mbspp.o
	rm mbspp.o
	rm mbspp.F
#
$(LIB)/mbond.a(modio.o): $(SRC)/mbond/modio.src
	$(FLX) $(SRC)/mbond/modio.src
	mv modio.f modio.F
	$(FC2) modio.F
	ar rucv $(LIB)/mbond.a modio.o
	rm modio.o
	rm modio.F
#
$(LIB)/mbond.a(modtrans.o): $(SRC)/mbond/modtrans.src
	$(FLX) $(SRC)/mbond/modtrans.src
	mv modtrans.f modtrans.F
	$(FC2) modtrans.F
	ar rucv $(LIB)/mbond.a modtrans.o
	rm modtrans.o
	rm modtrans.F
#
#
#
# mbond dependency file
#
$(LIB)/mbond.a(iposdd.o) : dimens.fcm
$(LIB)/mbond.a(iposdd.o) : heap.fcm
$(LIB)/mbond.a(iposdd.o) : impnon.fcm
$(LIB)/mbond.a(iposdd.o) : mbond.fcm
$(LIB)/mbond.a(iposdd.o) : mbpar.fcm
#
#
$(LIB)/mbond.a(mbback.o) : bases.fcm
$(LIB)/mbond.a(mbback.o) : consta.fcm
$(LIB)/mbond.a(mbback.o) : contrl.fcm
$(LIB)/mbond.a(mbback.o) : coord.fcm
$(LIB)/mbond.a(mbback.o) : ctitla.fcm
$(LIB)/mbond.a(mbback.o) : cveloci.fcm
$(LIB)/mbond.a(mbback.o) : deriv.fcm
$(LIB)/mbond.a(mbback.o) : dimens.fcm
$(LIB)/mbond.a(mbback.o) : energy.fcm
$(LIB)/mbond.a(mbback.o) : heap.fcm
$(LIB)/mbond.a(mbback.o) : impnon.fcm
$(LIB)/mbond.a(mbback.o) : mbmts.fcm
$(LIB)/mbond.a(mbback.o) : mbond.fcm
$(LIB)/mbond.a(mbback.o) : mbpar.fcm
$(LIB)/mbond.a(mbback.o) : number.fcm
$(LIB)/mbond.a(mbback.o) : psf.fcm
$(LIB)/mbond.a(mbback.o) : reawri.fcm
$(LIB)/mbond.a(mbback.o) : stack.fcm
$(LIB)/mbond.a(mbback.o) : stream.fcm
$(LIB)/mbond.a(mbback.o) : tbmts.fcm
$(LIB)/mbond.a(mbback.o) : tsmh.fcm
#
#
$(LIB)/mbond.a(mbdiag.o) : bases.fcm
$(LIB)/mbond.a(mbdiag.o) : cnst.fcm
$(LIB)/mbond.a(mbdiag.o) : code.fcm
$(LIB)/mbond.a(mbdiag.o) : consta.fcm
$(LIB)/mbond.a(mbdiag.o) : coord.fcm
$(LIB)/mbond.a(mbdiag.o) : deriv.fcm
$(LIB)/mbond.a(mbdiag.o) : dimens.fcm
$(LIB)/mbond.a(mbdiag.o) : econt.fcm
$(LIB)/mbond.a(mbdiag.o) : energy.fcm
$(LIB)/mbond.a(mbdiag.o) : euler.fcm
$(LIB)/mbond.a(mbdiag.o) : exelec.fcm
$(LIB)/mbond.a(mbdiag.o) : exfunc.fcm
$(LIB)/mbond.a(mbdiag.o) : hbond.fcm
$(LIB)/mbond.a(mbdiag.o) : heap.fcm
$(LIB)/mbond.a(mbdiag.o) : image.fcm
$(LIB)/mbond.a(mbdiag.o) : impnon.fcm
$(LIB)/mbond.a(mbdiag.o) : inbnd.fcm
$(LIB)/mbond.a(mbdiag.o) : mbond.fcm
$(LIB)/mbond.a(mbdiag.o) : mbpar.fcm
$(LIB)/mbond.a(mbdiag.o) : mbspp.fcm
$(LIB)/mbond.a(mbdiag.o) : noe.fcm
$(LIB)/mbond.a(mbdiag.o) : param.fcm
$(LIB)/mbond.a(mbdiag.o) : psf.fcm
$(LIB)/mbond.a(mbdiag.o) : sbound.fcm
$(LIB)/mbond.a(mbdiag.o) : stack.fcm
$(LIB)/mbond.a(mbdiag.o) : stream.fcm
$(LIB)/mbond.a(mbdiag.o) : surface.fcm
#
#
$(LIB)/mbond.a(mbdyn.o) : cnst.fcm
$(LIB)/mbond.a(mbdyn.o) : consta.fcm
$(LIB)/mbond.a(mbdyn.o) : cveloci.fcm
$(LIB)/mbond.a(mbdyn.o) : dimens.fcm
$(LIB)/mbond.a(mbdyn.o) : energy.fcm
$(LIB)/mbond.a(mbdyn.o) : exfunc.fcm
$(LIB)/mbond.a(mbdyn.o) : heap.fcm
$(LIB)/mbond.a(mbdyn.o) : impnon.fcm
$(LIB)/mbond.a(mbdyn.o) : mbmts.fcm
$(LIB)/mbond.a(mbdyn.o) : mbond.fcm
$(LIB)/mbond.a(mbdyn.o) : mbpar.fcm
$(LIB)/mbond.a(mbdyn.o) : number.fcm
$(LIB)/mbond.a(mbdyn.o) : psf.fcm
$(LIB)/mbond.a(mbdyn.o) : reawri.fcm
$(LIB)/mbond.a(mbdyn.o) : stream.fcm
$(LIB)/mbond.a(mbdyn.o) : tbmts.fcm
$(LIB)/mbond.a(mbdyn.o) : timer.fcm
#
#
$(LIB)/mbond.a(mbmodes.o) : consta.fcm
$(LIB)/mbond.a(mbmodes.o) : coord.fcm
$(LIB)/mbond.a(mbmodes.o) : coordc.fcm
$(LIB)/mbond.a(mbmodes.o) : ctitla.fcm
$(LIB)/mbond.a(mbmodes.o) : dimens.fcm
$(LIB)/mbond.a(mbmodes.o) : exfunc.fcm
$(LIB)/mbond.a(mbmodes.o) : heap.fcm
$(LIB)/mbond.a(mbmodes.o) : impnon.fcm
$(LIB)/mbond.a(mbmodes.o) : mbond.fcm
$(LIB)/mbond.a(mbmodes.o) : mbpar.fcm
$(LIB)/mbond.a(mbmodes.o) : mbspp.fcm
$(LIB)/mbond.a(mbmodes.o) : number.fcm
$(LIB)/mbond.a(mbmodes.o) : psf.fcm
$(LIB)/mbond.a(mbmodes.o) : stack.fcm
$(LIB)/mbond.a(mbmodes.o) : stream.fcm
#
#
$(LIB)/mbond.a(mbmts.o) : bases.fcm
$(LIB)/mbond.a(mbmts.o) : consta.fcm
$(LIB)/mbond.a(mbmts.o) : coord.fcm
$(LIB)/mbond.a(mbmts.o) : dimens.fcm
$(LIB)/mbond.a(mbmts.o) : exfunc.fcm
$(LIB)/mbond.a(mbmts.o) : heap.fcm
$(LIB)/mbond.a(mbmts.o) : impnon.fcm
$(LIB)/mbond.a(mbmts.o) : inbnd.fcm
$(LIB)/mbond.a(mbmts.o) : mbmts.fcm
$(LIB)/mbond.a(mbmts.o) : mbond.fcm
$(LIB)/mbond.a(mbmts.o) : mbpar.fcm
$(LIB)/mbond.a(mbmts.o) : number.fcm
$(LIB)/mbond.a(mbmts.o) : psf.fcm
$(LIB)/mbond.a(mbmts.o) : stream.fcm
$(LIB)/mbond.a(mbmts.o) : tbmtsp.fcm
#
#
$(LIB)/mbond.a(mbond.o) : comand.fcm
$(LIB)/mbond.a(mbond.o) : dimens.fcm
$(LIB)/mbond.a(mbond.o) : exfunc.fcm
$(LIB)/mbond.a(mbond.o) : heap.fcm
$(LIB)/mbond.a(mbond.o) : impnon.fcm
$(LIB)/mbond.a(mbond.o) : inbnd.fcm
$(LIB)/mbond.a(mbond.o) : mbond.fcm
$(LIB)/mbond.a(mbond.o) : mbpar.fcm
$(LIB)/mbond.a(mbond.o) : mbspp.fcm
$(LIB)/mbond.a(mbond.o) : number.fcm
$(LIB)/mbond.a(mbond.o) : psf.fcm
$(LIB)/mbond.a(mbond.o) : stream.fcm
#
#
$(LIB)/mbond.a(mbsec.o) : impnon.fcm
$(LIB)/mbond.a(mbsec.o) : mbpar.fcm
#
#
$(LIB)/mbond.a(mbsub.o) : dimens.fcm
$(LIB)/mbond.a(mbsub.o) : exfunc.fcm
$(LIB)/mbond.a(mbsub.o) : heap.fcm
$(LIB)/mbond.a(mbsub.o) : impnon.fcm
$(LIB)/mbond.a(mbsub.o) : mbpar.fcm
$(LIB)/mbond.a(mbsub.o) : number.fcm
$(LIB)/mbond.a(mbsub.o) : psf.fcm
$(LIB)/mbond.a(mbsub.o) : stream.fcm
#
#
$(LIB)/mbond.a(mbutil.o) : code.fcm
$(LIB)/mbond.a(mbutil.o) : coord.fcm
$(LIB)/mbond.a(mbutil.o) : dimens.fcm
$(LIB)/mbond.a(mbutil.o) : heap.fcm
$(LIB)/mbond.a(mbutil.o) : impnon.fcm
$(LIB)/mbond.a(mbutil.o) : mbmts.fcm
$(LIB)/mbond.a(mbutil.o) : mbond.fcm
$(LIB)/mbond.a(mbutil.o) : mbpar.fcm
$(LIB)/mbond.a(mbutil.o) : number.fcm
$(LIB)/mbond.a(mbutil.o) : stream.fcm
#
#
$(LIB)/mbond.a(modio.o) : comand.fcm
$(LIB)/mbond.a(modio.o) : ctitla.fcm
$(LIB)/mbond.a(modio.o) : dimens.fcm
$(LIB)/mbond.a(modio.o) : exfunc.fcm
$(LIB)/mbond.a(modio.o) : impnon.fcm
$(LIB)/mbond.a(modio.o) : mbond.fcm
$(LIB)/mbond.a(modio.o) : mbpar.fcm
$(LIB)/mbond.a(modio.o) : number.fcm
$(LIB)/mbond.a(modio.o) : stream.fcm
#
# Dont know why, but in Helix I just found this in lower case
# thus the wont be found and compilation fails
#$(LIB)/mbond.a(modtrans.o) : HANDS2.INC
#$(LIB)/mbond.a(modtrans.o) : HEAPMB.INC
#$(LIB)/mbond.a(modtrans.o) : IFIRST.INC
#$(LIB)/mbond.a(modtrans.o) : INTGRL.INC
#$(LIB)/mbond.a(modtrans.o) : SPECIF.INC
$(LIB)/mbond.a(modtrans.o) : hands2.inc
$(LIB)/mbond.a(modtrans.o) : heapmb.inc
$(LIB)/mbond.a(modtrans.o) : ifirst.inc
$(LIB)/mbond.a(modtrans.o) : intgrl.inc
$(LIB)/mbond.a(modtrans.o) : specif.inc
$(LIB)/mbond.a(modtrans.o) : heap.fcm
$(LIB)/mbond.a(modtrans.o) : impnon.fcm
$(LIB)/mbond.a(modtrans.o) : mbond.fcm
$(LIB)/mbond.a(modtrans.o) : mbpar.fcm
#$(LIB)/mbond.a(modtrans.o) : PARAM.FOR
$(LIB)/mbond.a(modtrans.o) : param.for
#
