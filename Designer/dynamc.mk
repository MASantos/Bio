# dynamc makefile
# dynamc library rules
OBJS_dynamc= \
	$(LIB)/dynamc.a(cveloci.o) \
	$(LIB)/dynamc.a(dcntrl.o) \
	$(LIB)/dynamc.a(dynamc.o) \
	$(LIB)/dynamc.a(dynamc4.o) \
	$(LIB)/dynamc.a(dynamcv.o) \
	$(LIB)/dynamc.a(dynamln.o) \
	$(LIB)/dynamc.a(dynamvv.o) \
	$(LIB)/dynamc.a(dynio.o) \
	$(LIB)/dynamc.a(dynlng.o) \
	$(LIB)/dynamc.a(dynlngv.o) \
	$(LIB)/dynamc.a(dynsub.o) \
	$(LIB)/dynamc.a(dynutil.o) \
	$(LIB)/dynamc.a(lonepair.o) \
	$(LIB)/dynamc.a(meanf.o) \
	$(LIB)/dynamc.a(mts.o) \
	$(LIB)/dynamc.a(nose.o) \
	$(LIB)/dynamc.a(prssre.o) \
	$(LIB)/dynamc.a(trnphi.o)
#
$(LIB)/dynamc.a : $(OBJS_dynamc)
	$(RANLIB) $(LIB)/dynamc.a
	@echo dynamc COMPLETED
#
# dynamc source file rules
$(LIB)/dynamc.a(cveloci.o)  : $(SRC)/dynamc/cveloci.src
	$(FLX) $(SRC)/dynamc/cveloci.src
	$(FC2) cveloci.f
	ar rucv $(LIB)/dynamc.a cveloci.o
	rm cveloci.f
	rm cveloci.o
#
$(LIB)/dynamc.a(dcntrl.o)  : $(SRC)/dynamc/dcntrl.src
	$(FLX) $(SRC)/dynamc/dcntrl.src
	$(FC2) dcntrl.f
	ar rucv $(LIB)/dynamc.a dcntrl.o
	rm dcntrl.f
	rm dcntrl.o
#
$(LIB)/dynamc.a(dynamc.o)  : $(SRC)/dynamc/dynamc.src
	$(FLX) $(SRC)/dynamc/dynamc.src
	$(FC2) dynamc.f
	ar rucv $(LIB)/dynamc.a dynamc.o
	rm dynamc.f
	rm dynamc.o
#
$(LIB)/dynamc.a(dynamc4.o)  : $(SRC)/dynamc/dynamc4.src
	$(FLX) $(SRC)/dynamc/dynamc4.src
	$(FC2) dynamc4.f
	ar rucv $(LIB)/dynamc.a dynamc4.o
	rm dynamc4.f
	rm dynamc4.o
#
$(LIB)/dynamc.a(dynamcv.o)  : $(SRC)/dynamc/dynamcv.src
	$(FLX) $(SRC)/dynamc/dynamcv.src
	$(FC2) dynamcv.f
	ar rucv $(LIB)/dynamc.a dynamcv.o
	rm dynamcv.f
	rm dynamcv.o
#
$(LIB)/dynamc.a(dynamln.o)  : $(SRC)/dynamc/dynamln.src
	$(FLX) $(SRC)/dynamc/dynamln.src
	$(FC2) dynamln.f
	ar rucv $(LIB)/dynamc.a dynamln.o
	rm dynamln.f
	rm dynamln.o
#
$(LIB)/dynamc.a(dynamvv.o)  : $(SRC)/dynamc/dynamvv.src
	$(FLX) $(SRC)/dynamc/dynamvv.src
	$(FC2) dynamvv.f
	ar rucv $(LIB)/dynamc.a dynamvv.o
	rm dynamvv.f
	rm dynamvv.o
#
$(LIB)/dynamc.a(dynio.o)  : $(SRC)/dynamc/dynio.src
	$(FLX) $(SRC)/dynamc/dynio.src
	$(FC2) dynio.f
	ar rucv $(LIB)/dynamc.a dynio.o
	rm dynio.f
	rm dynio.o
#
$(LIB)/dynamc.a(dynlng.o)  : $(SRC)/dynamc/dynlng.src
	$(FLX) $(SRC)/dynamc/dynlng.src
	$(FC2) dynlng.f
	ar rucv $(LIB)/dynamc.a dynlng.o
	rm dynlng.f
	rm dynlng.o
#
$(LIB)/dynamc.a(dynlngv.o)  : $(SRC)/dynamc/dynlngv.src
	$(FLX) $(SRC)/dynamc/dynlngv.src
	$(FC2) dynlngv.f
	ar rucv $(LIB)/dynamc.a dynlngv.o
	rm dynlngv.f
	rm dynlngv.o
#
$(LIB)/dynamc.a(dynsub.o)  : $(SRC)/dynamc/dynsub.src
	$(FLX) $(SRC)/dynamc/dynsub.src
	$(FC2) dynsub.f
	ar rucv $(LIB)/dynamc.a dynsub.o
	rm dynsub.f
	rm dynsub.o
#
$(LIB)/dynamc.a(dynutil.o)  : $(SRC)/dynamc/dynutil.src
	$(FLX) $(SRC)/dynamc/dynutil.src
	$(FC2) dynutil.f
	ar rucv $(LIB)/dynamc.a dynutil.o
	rm dynutil.f
	rm dynutil.o
#
$(LIB)/dynamc.a(lonepair.o)  : $(SRC)/dynamc/lonepair.src
	$(FLX) $(SRC)/dynamc/lonepair.src
	$(FC2) lonepair.f
	ar rucv $(LIB)/dynamc.a lonepair.o
	rm lonepair.f
	rm lonepair.o
#
$(LIB)/dynamc.a(meanf.o)  : $(SRC)/dynamc/meanf.src
	$(FLX) $(SRC)/dynamc/meanf.src
	$(FC2) meanf.f
	ar rucv $(LIB)/dynamc.a meanf.o
	rm meanf.f
	rm meanf.o
#
$(LIB)/dynamc.a(mts.o)  : $(SRC)/dynamc/mts.src
	$(FLX) $(SRC)/dynamc/mts.src
	$(FC2) mts.f
	ar rucv $(LIB)/dynamc.a mts.o
	rm mts.f
	rm mts.o
#
$(LIB)/dynamc.a(nose.o)  : $(SRC)/dynamc/nose.src
	$(FLX) $(SRC)/dynamc/nose.src
	$(FC2) nose.f
	ar rucv $(LIB)/dynamc.a nose.o
	rm nose.f
	rm nose.o
#
$(LIB)/dynamc.a(prssre.o)  : $(SRC)/dynamc/prssre.src
	$(FLX) $(SRC)/dynamc/prssre.src
	$(FC2) prssre.f
	ar rucv $(LIB)/dynamc.a prssre.o
	rm prssre.f
	rm prssre.o
#
$(LIB)/dynamc.a(trnphi.o)  : $(SRC)/dynamc/trnphi.src
	$(FLX) $(SRC)/dynamc/trnphi.src
	$(FC2) trnphi.f
	ar rucv $(LIB)/dynamc.a trnphi.o
	rm trnphi.f
	rm trnphi.o
#
#
# dynamc dependency file
#
$(LIB)/dynamc.a(cveloci.o) : coord.fcm
$(LIB)/dynamc.a(cveloci.o) : cveloci.fcm
$(LIB)/dynamc.a(cveloci.o) : dimens.fcm
$(LIB)/dynamc.a(cveloci.o) : exfunc.fcm
$(LIB)/dynamc.a(cveloci.o) : impnon.fcm
$(LIB)/dynamc.a(cveloci.o) : number.fcm
$(LIB)/dynamc.a(cveloci.o) : psf.fcm
$(LIB)/dynamc.a(cveloci.o) : stream.fcm
#
#
$(LIB)/dynamc.a(dcntrl.o) : bases.fcm
$(LIB)/dynamc.a(dcntrl.o) : block.fcm
$(LIB)/dynamc.a(dcntrl.o) : cnst.fcm
$(LIB)/dynamc.a(dcntrl.o) : code.fcm
$(LIB)/dynamc.a(dcntrl.o) : consta.fcm
$(LIB)/dynamc.a(dcntrl.o) : contrl.fcm
$(LIB)/dynamc.a(dcntrl.o) : coord.fcm
$(LIB)/dynamc.a(dcntrl.o) : coordc.fcm
$(LIB)/dynamc.a(dcntrl.o) : ctitla.fcm
$(LIB)/dynamc.a(dcntrl.o) : cveloci.fcm
$(LIB)/dynamc.a(dcntrl.o) : deriv.fcm
$(LIB)/dynamc.a(dcntrl.o) : dimens.fcm
$(LIB)/dynamc.a(dcntrl.o) : energy.fcm
$(LIB)/dynamc.a(dcntrl.o) : euler.fcm
$(LIB)/dynamc.a(dcntrl.o) : exfunc.fcm
$(LIB)/dynamc.a(dcntrl.o) : fbias.fcm
$(LIB)/dynamc.a(dcntrl.o) : fourd.fcm
$(LIB)/dynamc.a(dcntrl.o) : hbond.fcm
$(LIB)/dynamc.a(dcntrl.o) : heap.fcm
$(LIB)/dynamc.a(dcntrl.o) : icfix.fcm
$(LIB)/dynamc.a(dcntrl.o) : icpert.fcm
$(LIB)/dynamc.a(dcntrl.o) : image.fcm
$(LIB)/dynamc.a(dcntrl.o) : impnon.fcm
$(LIB)/dynamc.a(dcntrl.o) : inbnd.fcm
$(LIB)/dynamc.a(dcntrl.o) : lambda.fcm
$(LIB)/dynamc.a(dcntrl.o) : lonepr.fcm
$(LIB)/dynamc.a(dcntrl.o) : machdep.fcm
$(LIB)/dynamc.a(dcntrl.o) : mbmts.fcm
$(LIB)/dynamc.a(dcntrl.o) : mbond.fcm
$(LIB)/dynamc.a(dcntrl.o) : mmfp.fcm
$(LIB)/dynamc.a(dcntrl.o) : nose.fcm
$(LIB)/dynamc.a(dcntrl.o) : number.fcm
$(LIB)/dynamc.a(dcntrl.o) : parallel.fcm
$(LIB)/dynamc.a(dcntrl.o) : param.fcm
$(LIB)/dynamc.a(dcntrl.o) : pert.fcm
$(LIB)/dynamc.a(dcntrl.o) : pme.fcm
$(LIB)/dynamc.a(dcntrl.o) : psf.fcm
$(LIB)/dynamc.a(dcntrl.o) : reawri.fcm
$(LIB)/dynamc.a(dcntrl.o) : rwlamb.fcm
$(LIB)/dynamc.a(dcntrl.o) : sbound.fcm
$(LIB)/dynamc.a(dcntrl.o) : shake.fcm
$(LIB)/dynamc.a(dcntrl.o) : shapes.fcm
$(LIB)/dynamc.a(dcntrl.o) : stack.fcm
$(LIB)/dynamc.a(dcntrl.o) : stream.fcm
$(LIB)/dynamc.a(dcntrl.o) : tbmts.fcm
$(LIB)/dynamc.a(dcntrl.o) : timer.fcm
$(LIB)/dynamc.a(dcntrl.o) : tsmh.fcm
$(LIB)/dynamc.a(dcntrl.o) : tsms.fcm
#
#
$(LIB)/dynamc.a(dynamc.o) : consta.fcm
$(LIB)/dynamc.a(dynamc.o) : contrl.fcm
$(LIB)/dynamc.a(dynamc.o) : coord.fcm
$(LIB)/dynamc.a(dynamc.o) : coordc.fcm
$(LIB)/dynamc.a(dynamc.o) : ctitla.fcm
$(LIB)/dynamc.a(dynamc.o) : cveloci.fcm
$(LIB)/dynamc.a(dynamc.o) : deriv.fcm
$(LIB)/dynamc.a(dynamc.o) : dimens.fcm
$(LIB)/dynamc.a(dynamc.o) : dmcons.fcm
$(LIB)/dynamc.a(dynamc.o) : energy.fcm
$(LIB)/dynamc.a(dynamc.o) : exfunc.fcm
$(LIB)/dynamc.a(dynamc.o) : fbias.fcm
$(LIB)/dynamc.a(dynamc.o) : heap.fcm
$(LIB)/dynamc.a(dynamc.o) : icfix.fcm
$(LIB)/dynamc.a(dynamc.o) : icpert.fcm
$(LIB)/dynamc.a(dynamc.o) : image.fcm
$(LIB)/dynamc.a(dynamc.o) : impnon.fcm
$(LIB)/dynamc.a(dynamc.o) : inbnd.fcm
$(LIB)/dynamc.a(dynamc.o) : number.fcm
$(LIB)/dynamc.a(dynamc.o) : parallel.fcm
$(LIB)/dynamc.a(dynamc.o) : pert.fcm
$(LIB)/dynamc.a(dynamc.o) : pshake.fcm
$(LIB)/dynamc.a(dynamc.o) : pull.fcm
$(LIB)/dynamc.a(dynamc.o) : reawri.fcm
$(LIB)/dynamc.a(dynamc.o) : rgy.fcm
$(LIB)/dynamc.a(dynamc.o) : rwlamb.fcm
$(LIB)/dynamc.a(dynamc.o) : shake.fcm
$(LIB)/dynamc.a(dynamc.o) : stream.fcm
$(LIB)/dynamc.a(dynamc.o) : timer.fcm
$(LIB)/dynamc.a(dynamc.o) : tsms.fcm
$(LIB)/dynamc.a(dynamc.o) : umb.fcm
#
#
$(LIB)/dynamc.a(dynamc4.o) : consta.fcm
$(LIB)/dynamc.a(dynamc4.o) : contrl.fcm
$(LIB)/dynamc.a(dynamc4.o) : coord.fcm
$(LIB)/dynamc.a(dynamc4.o) : coordc.fcm
$(LIB)/dynamc.a(dynamc4.o) : ctitla.fcm
$(LIB)/dynamc.a(dynamc4.o) : deriv.fcm
$(LIB)/dynamc.a(dynamc4.o) : dimens.fcm
$(LIB)/dynamc.a(dynamc4.o) : energy.fcm
$(LIB)/dynamc.a(dynamc4.o) : exfunc.fcm
$(LIB)/dynamc.a(dynamc4.o) : fourd.fcm
$(LIB)/dynamc.a(dynamc4.o) : image.fcm
$(LIB)/dynamc.a(dynamc4.o) : impnon.fcm
$(LIB)/dynamc.a(dynamc4.o) : number.fcm
$(LIB)/dynamc.a(dynamc4.o) : parallel.fcm
$(LIB)/dynamc.a(dynamc4.o) : reawri.fcm
$(LIB)/dynamc.a(dynamc4.o) : shake.fcm
$(LIB)/dynamc.a(dynamc4.o) : stream.fcm
$(LIB)/dynamc.a(dynamc4.o) : tsms.fcm
$(LIB)/dynamc.a(dynamc4.o) : umb.fcm
#
#
$(LIB)/dynamc.a(dynamcv.o) : cnst.fcm
$(LIB)/dynamc.a(dynamcv.o) : consta.fcm
$(LIB)/dynamc.a(dynamcv.o) : contrl.fcm
$(LIB)/dynamc.a(dynamcv.o) : coord.fcm
$(LIB)/dynamc.a(dynamcv.o) : ctitla.fcm
$(LIB)/dynamc.a(dynamcv.o) : deriv.fcm
$(LIB)/dynamc.a(dynamcv.o) : dimens.fcm
$(LIB)/dynamc.a(dynamcv.o) : dmcons.fcm
$(LIB)/dynamc.a(dynamcv.o) : energy.fcm
$(LIB)/dynamc.a(dynamcv.o) : exfunc.fcm
$(LIB)/dynamc.a(dynamcv.o) : heap.fcm
$(LIB)/dynamc.a(dynamcv.o) : icfix.fcm
$(LIB)/dynamc.a(dynamcv.o) : icpert.fcm
$(LIB)/dynamc.a(dynamcv.o) : impnon.fcm
$(LIB)/dynamc.a(dynamcv.o) : nose.fcm
$(LIB)/dynamc.a(dynamcv.o) : number.fcm
$(LIB)/dynamc.a(dynamcv.o) : pert.fcm
$(LIB)/dynamc.a(dynamcv.o) : pshake.fcm
$(LIB)/dynamc.a(dynamcv.o) : reawri.fcm
$(LIB)/dynamc.a(dynamcv.o) : rgy.fcm
$(LIB)/dynamc.a(dynamcv.o) : rwlamb.fcm
$(LIB)/dynamc.a(dynamcv.o) : shake.fcm
$(LIB)/dynamc.a(dynamcv.o) : stream.fcm
$(LIB)/dynamc.a(dynamcv.o) : tsms.fcm
$(LIB)/dynamc.a(dynamcv.o) : umb.fcm
#
#
$(LIB)/dynamc.a(dynamln.o) : cnst.fcm
$(LIB)/dynamc.a(dynamln.o) : consta.fcm
$(LIB)/dynamc.a(dynamln.o) : contrl.fcm
$(LIB)/dynamc.a(dynamln.o) : coord.fcm
$(LIB)/dynamc.a(dynamln.o) : ctitla.fcm
$(LIB)/dynamc.a(dynamln.o) : deriv.fcm
$(LIB)/dynamc.a(dynamln.o) : dimens.fcm
$(LIB)/dynamc.a(dynamln.o) : dmcons.fcm
$(LIB)/dynamc.a(dynamln.o) : energy.fcm
$(LIB)/dynamc.a(dynamln.o) : exfunc.fcm
$(LIB)/dynamc.a(dynamln.o) : heap.fcm
$(LIB)/dynamc.a(dynamln.o) : icfix.fcm
$(LIB)/dynamc.a(dynamln.o) : icpert.fcm
$(LIB)/dynamc.a(dynamln.o) : impnon.fcm
$(LIB)/dynamc.a(dynamln.o) : nose.fcm
$(LIB)/dynamc.a(dynamln.o) : number.fcm
$(LIB)/dynamc.a(dynamln.o) : reawri.fcm
$(LIB)/dynamc.a(dynamln.o) : rgy.fcm
$(LIB)/dynamc.a(dynamln.o) : rwlamb.fcm
$(LIB)/dynamc.a(dynamln.o) : shake.fcm
$(LIB)/dynamc.a(dynamln.o) : stream.fcm
$(LIB)/dynamc.a(dynamln.o) : tbmts.fcm
#
#
$(LIB)/dynamc.a(dynamvv.o) : cnst.fcm
$(LIB)/dynamc.a(dynamvv.o) : consta.fcm
$(LIB)/dynamc.a(dynamvv.o) : contrl.fcm
$(LIB)/dynamc.a(dynamvv.o) : coord.fcm
$(LIB)/dynamc.a(dynamvv.o) : ctitla.fcm
$(LIB)/dynamc.a(dynamvv.o) : deriv.fcm
$(LIB)/dynamc.a(dynamvv.o) : dimens.fcm
$(LIB)/dynamc.a(dynamvv.o) : dmcons.fcm
$(LIB)/dynamc.a(dynamvv.o) : energy.fcm
$(LIB)/dynamc.a(dynamvv.o) : exfunc.fcm
$(LIB)/dynamc.a(dynamvv.o) : heap.fcm
$(LIB)/dynamc.a(dynamvv.o) : icfix.fcm
$(LIB)/dynamc.a(dynamvv.o) : icpert.fcm
$(LIB)/dynamc.a(dynamvv.o) : impnon.fcm
$(LIB)/dynamc.a(dynamvv.o) : nose.fcm
$(LIB)/dynamc.a(dynamvv.o) : number.fcm
$(LIB)/dynamc.a(dynamvv.o) : parallel.fcm
$(LIB)/dynamc.a(dynamvv.o) : reawri.fcm
$(LIB)/dynamc.a(dynamvv.o) : rgy.fcm
$(LIB)/dynamc.a(dynamvv.o) : rwlamb.fcm
$(LIB)/dynamc.a(dynamvv.o) : shake.fcm
$(LIB)/dynamc.a(dynamvv.o) : stream.fcm
$(LIB)/dynamc.a(dynamvv.o) : tbmts.fcm
$(LIB)/dynamc.a(dynamvv.o) : umb.fcm
#
#
$(LIB)/dynamc.a(dynio.o) : comand.fcm
$(LIB)/dynamc.a(dynio.o) : consta.fcm
$(LIB)/dynamc.a(dynio.o) : coord.fcm
$(LIB)/dynamc.a(dynio.o) : ctitla.fcm
$(LIB)/dynamc.a(dynio.o) : dimens.fcm
$(LIB)/dynamc.a(dynio.o) : energy.fcm
$(LIB)/dynamc.a(dynio.o) : exfunc.fcm
$(LIB)/dynamc.a(dynio.o) : fourd.fcm
$(LIB)/dynamc.a(dynio.o) : image.fcm
$(LIB)/dynamc.a(dynio.o) : impnon.fcm
$(LIB)/dynamc.a(dynio.o) : nose.fcm
$(LIB)/dynamc.a(dynio.o) : number.fcm
$(LIB)/dynamc.a(dynio.o) : psf.fcm
$(LIB)/dynamc.a(dynio.o) : reawri.fcm
$(LIB)/dynamc.a(dynio.o) : stack.fcm
$(LIB)/dynamc.a(dynio.o) : stream.fcm
$(LIB)/dynamc.a(dynio.o) : version.fcm
#
#
$(LIB)/dynamc.a(dynlng.o) : cnst.fcm
$(LIB)/dynamc.a(dynlng.o) : consta.fcm
$(LIB)/dynamc.a(dynlng.o) : deriv.fcm
$(LIB)/dynamc.a(dynlng.o) : dimens.fcm
$(LIB)/dynamc.a(dynlng.o) : energy.fcm
$(LIB)/dynamc.a(dynlng.o) : euler.fcm
$(LIB)/dynamc.a(dynlng.o) : exfunc.fcm
$(LIB)/dynamc.a(dynlng.o) : fourd.fcm
$(LIB)/dynamc.a(dynlng.o) : impnon.fcm
$(LIB)/dynamc.a(dynlng.o) : number.fcm
$(LIB)/dynamc.a(dynlng.o) : parallel.fcm
$(LIB)/dynamc.a(dynlng.o) : psf.fcm
$(LIB)/dynamc.a(dynlng.o) : stack.fcm
$(LIB)/dynamc.a(dynlng.o) : stream.fcm
#
#
$(LIB)/dynamc.a(dynlngv.o) : cnst.fcm
$(LIB)/dynamc.a(dynlngv.o) : consta.fcm
$(LIB)/dynamc.a(dynlngv.o) : dimens.fcm
$(LIB)/dynamc.a(dynlngv.o) : exfunc.fcm
$(LIB)/dynamc.a(dynlngv.o) : impnon.fcm
$(LIB)/dynamc.a(dynlngv.o) : number.fcm
$(LIB)/dynamc.a(dynlngv.o) : psf.fcm
$(LIB)/dynamc.a(dynlngv.o) : stack.fcm
$(LIB)/dynamc.a(dynlngv.o) : stream.fcm
#
#
$(LIB)/dynamc.a(dynsub.o) : bases.fcm
$(LIB)/dynamc.a(dynsub.o) : coord.fcm
$(LIB)/dynamc.a(dynsub.o) : coordc.fcm
$(LIB)/dynamc.a(dynsub.o) : dimens.fcm
$(LIB)/dynamc.a(dynsub.o) : exfunc.fcm
$(LIB)/dynamc.a(dynsub.o) : heap.fcm
$(LIB)/dynamc.a(dynsub.o) : image.fcm
$(LIB)/dynamc.a(dynsub.o) : impnon.fcm
$(LIB)/dynamc.a(dynsub.o) : number.fcm
$(LIB)/dynamc.a(dynsub.o) : psf.fcm
$(LIB)/dynamc.a(dynsub.o) : stack.fcm
$(LIB)/dynamc.a(dynsub.o) : stream.fcm
#
#
$(LIB)/dynamc.a(dynutil.o) : consta.fcm
$(LIB)/dynamc.a(dynutil.o) : dimens.fcm
$(LIB)/dynamc.a(dynutil.o) : exfunc.fcm
$(LIB)/dynamc.a(dynutil.o) : impnon.fcm
$(LIB)/dynamc.a(dynutil.o) : number.fcm
$(LIB)/dynamc.a(dynutil.o) : parallel.fcm
$(LIB)/dynamc.a(dynutil.o) : stream.fcm
$(LIB)/dynamc.a(dynutil.o) : tsms.fcm
#
#
$(LIB)/dynamc.a(lonepair.o) : coord.fcm
$(LIB)/dynamc.a(lonepair.o) : dimens.fcm
$(LIB)/dynamc.a(lonepair.o) : exfunc.fcm
$(LIB)/dynamc.a(lonepair.o) : impnon.fcm
$(LIB)/dynamc.a(lonepair.o) : lonepr.fcm
$(LIB)/dynamc.a(lonepair.o) : number.fcm
$(LIB)/dynamc.a(lonepair.o) : psf.fcm
$(LIB)/dynamc.a(lonepair.o) : shake.fcm
$(LIB)/dynamc.a(lonepair.o) : stack.fcm
$(LIB)/dynamc.a(lonepair.o) : stream.fcm
#
#
$(LIB)/dynamc.a(meanf.o) : consta.fcm
$(LIB)/dynamc.a(meanf.o) : dimens.fcm
$(LIB)/dynamc.a(meanf.o) : fbias.fcm
$(LIB)/dynamc.a(meanf.o) : impnon.fcm
$(LIB)/dynamc.a(meanf.o) : number.fcm
$(LIB)/dynamc.a(meanf.o) : psf.fcm
$(LIB)/dynamc.a(meanf.o) : stream.fcm
#
#
$(LIB)/dynamc.a(mts.o) : bases.fcm
$(LIB)/dynamc.a(mts.o) : cnst.fcm
$(LIB)/dynamc.a(mts.o) : code.fcm
$(LIB)/dynamc.a(mts.o) : contrl.fcm
$(LIB)/dynamc.a(mts.o) : coord.fcm
$(LIB)/dynamc.a(mts.o) : dimens.fcm
$(LIB)/dynamc.a(mts.o) : energy.fcm
$(LIB)/dynamc.a(mts.o) : exfunc.fcm
$(LIB)/dynamc.a(mts.o) : heap.fcm
$(LIB)/dynamc.a(mts.o) : image.fcm
$(LIB)/dynamc.a(mts.o) : impnon.fcm
$(LIB)/dynamc.a(mts.o) : inbnd.fcm
$(LIB)/dynamc.a(mts.o) : number.fcm
$(LIB)/dynamc.a(mts.o) : parallel.fcm
$(LIB)/dynamc.a(mts.o) : param.fcm
$(LIB)/dynamc.a(mts.o) : psf.fcm
$(LIB)/dynamc.a(mts.o) : shake.fcm
$(LIB)/dynamc.a(mts.o) : stack.fcm
$(LIB)/dynamc.a(mts.o) : stream.fcm
$(LIB)/dynamc.a(mts.o) : tbmts.fcm
$(LIB)/dynamc.a(mts.o) : tbmtsp.fcm
$(LIB)/dynamc.a(mts.o) : tbmtsp1.fcm
#
#
$(LIB)/dynamc.a(nose.o) : dimens.fcm
$(LIB)/dynamc.a(nose.o) : exfunc.fcm
$(LIB)/dynamc.a(nose.o) : heap.fcm
$(LIB)/dynamc.a(nose.o) : impnon.fcm
$(LIB)/dynamc.a(nose.o) : nose.fcm
$(LIB)/dynamc.a(nose.o) : number.fcm
$(LIB)/dynamc.a(nose.o) : psf.fcm
$(LIB)/dynamc.a(nose.o) : stack.fcm
$(LIB)/dynamc.a(nose.o) : stream.fcm
#
#
$(LIB)/dynamc.a(prssre.o) : consta.fcm
$(LIB)/dynamc.a(prssre.o) : contrl.fcm
$(LIB)/dynamc.a(prssre.o) : deriv.fcm
$(LIB)/dynamc.a(prssre.o) : dimens.fcm
$(LIB)/dynamc.a(prssre.o) : energy.fcm
$(LIB)/dynamc.a(prssre.o) : exfunc.fcm
$(LIB)/dynamc.a(prssre.o) : heap.fcm
$(LIB)/dynamc.a(prssre.o) : image.fcm
$(LIB)/dynamc.a(prssre.o) : impnon.fcm
$(LIB)/dynamc.a(prssre.o) : mmfp.fcm
$(LIB)/dynamc.a(prssre.o) : number.fcm
$(LIB)/dynamc.a(prssre.o) : parallel.fcm
$(LIB)/dynamc.a(prssre.o) : psf.fcm
$(LIB)/dynamc.a(prssre.o) : reawri.fcm
$(LIB)/dynamc.a(prssre.o) : shake.fcm
$(LIB)/dynamc.a(prssre.o) : stack.fcm
$(LIB)/dynamc.a(prssre.o) : stream.fcm
#
#
$(LIB)/dynamc.a(trnphi.o) : code.fcm
$(LIB)/dynamc.a(trnphi.o) : comand.fcm
$(LIB)/dynamc.a(trnphi.o) : consta.fcm
$(LIB)/dynamc.a(trnphi.o) : coord.fcm
$(LIB)/dynamc.a(trnphi.o) : ctitla.fcm
$(LIB)/dynamc.a(trnphi.o) : dimens.fcm
$(LIB)/dynamc.a(trnphi.o) : exfunc.fcm
$(LIB)/dynamc.a(trnphi.o) : impnon.fcm
$(LIB)/dynamc.a(trnphi.o) : number.fcm
$(LIB)/dynamc.a(trnphi.o) : param.fcm
$(LIB)/dynamc.a(trnphi.o) : psf.fcm
$(LIB)/dynamc.a(trnphi.o) : stack.fcm
$(LIB)/dynamc.a(trnphi.o) : stream.fcm
#
