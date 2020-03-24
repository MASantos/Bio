# minmiz makefile
# minmiz library rules
OBJS_minmiz= \
	$(LIB)/minmiz.a(abner.o) \
	$(LIB)/minmiz.a(conjug.o) \
	$(LIB)/minmiz.a(egrad1.o) \
	$(LIB)/minmiz.a(minmiz.o) \
	$(LIB)/minmiz.a(nraph.o) \
	$(LIB)/minmiz.a(powell.o) \
	$(LIB)/minmiz.a(steepd.o) \
	$(LIB)/minmiz.a(tndriv.o) \
	$(LIB)/minmiz.a(tnpack.o)
#
$(LIB)/minmiz.a : $(OBJS_minmiz)
	$(RANLIB) $(LIB)/minmiz.a
	@echo minmiz COMPLETED
#
# minmiz source file rules
$(LIB)/minmiz.a(abner.o)  : $(SRC)/minmiz/abner.src
	$(FLX) $(SRC)/minmiz/abner.src
	$(FC2) abner.f
	ar rucv $(LIB)/minmiz.a abner.o
	rm abner.f
	rm abner.o
#
$(LIB)/minmiz.a(conjug.o)  : $(SRC)/minmiz/conjug.src
	$(FLX) $(SRC)/minmiz/conjug.src
	$(FC2) conjug.f
	ar rucv $(LIB)/minmiz.a conjug.o
	rm conjug.f
	rm conjug.o
#
$(LIB)/minmiz.a(egrad1.o)  : $(SRC)/minmiz/egrad1.src
	$(FLX) $(SRC)/minmiz/egrad1.src
	$(FC2) egrad1.f
	ar rucv $(LIB)/minmiz.a egrad1.o
	rm egrad1.f
	rm egrad1.o
#
$(LIB)/minmiz.a(minmiz.o)  : $(SRC)/minmiz/minmiz.src
	$(FLX) $(SRC)/minmiz/minmiz.src
	$(FC2) minmiz.f
	ar rucv $(LIB)/minmiz.a minmiz.o
	rm minmiz.f
	rm minmiz.o
#
$(LIB)/minmiz.a(nraph.o)  : $(SRC)/minmiz/nraph.src
	$(FLX) $(SRC)/minmiz/nraph.src
	$(FC2) nraph.f
	ar rucv $(LIB)/minmiz.a nraph.o
	rm nraph.f
	rm nraph.o
#
$(LIB)/minmiz.a(powell.o)  : $(SRC)/minmiz/powell.src
	$(FLX) $(SRC)/minmiz/powell.src
	$(FC2) powell.f
	ar rucv $(LIB)/minmiz.a powell.o
	rm powell.f
	rm powell.o
#
$(LIB)/minmiz.a(steepd.o)  : $(SRC)/minmiz/steepd.src
	$(FLX) $(SRC)/minmiz/steepd.src
	$(FC2) steepd.f
	ar rucv $(LIB)/minmiz.a steepd.o
	rm steepd.f
	rm steepd.o
#
$(LIB)/minmiz.a(tndriv.o)  : $(SRC)/minmiz/tndriv.src
	$(FLX) $(SRC)/minmiz/tndriv.src
	$(FC2) tndriv.f
	ar rucv $(LIB)/minmiz.a tndriv.o
	rm tndriv.f
	rm tndriv.o
#
$(LIB)/minmiz.a(tnpack.o)  : $(SRC)/minmiz/tnpack.src
	$(FLX) $(SRC)/minmiz/tnpack.src
	$(FC2) tnpack.f
	ar rucv $(LIB)/minmiz.a tnpack.o
	rm tnpack.f
	rm tnpack.o
#
#
# minmiz dependency file
#
$(LIB)/minmiz.a(abner.o) : contrl.fcm
$(LIB)/minmiz.a(abner.o) : coord.fcm
$(LIB)/minmiz.a(abner.o) : dimens.fcm
$(LIB)/minmiz.a(abner.o) : energy.fcm
$(LIB)/minmiz.a(abner.o) : exfunc.fcm
$(LIB)/minmiz.a(abner.o) : fourd.fcm
$(LIB)/minmiz.a(abner.o) : heap.fcm
$(LIB)/minmiz.a(abner.o) : image.fcm
$(LIB)/minmiz.a(abner.o) : impnon.fcm
$(LIB)/minmiz.a(abner.o) : number.fcm
$(LIB)/minmiz.a(abner.o) : psf.fcm
$(LIB)/minmiz.a(abner.o) : stack.fcm
$(LIB)/minmiz.a(abner.o) : stream.fcm
$(LIB)/minmiz.a(abner.o) : timer.fcm
$(LIB)/minmiz.a(abner.o) : tsms.fcm
#
#
$(LIB)/minmiz.a(conjug.o) : bases.fcm
$(LIB)/minmiz.a(conjug.o) : contrl.fcm
$(LIB)/minmiz.a(conjug.o) : coord.fcm
$(LIB)/minmiz.a(conjug.o) : dimens.fcm
$(LIB)/minmiz.a(conjug.o) : energy.fcm
$(LIB)/minmiz.a(conjug.o) : exfunc.fcm
$(LIB)/minmiz.a(conjug.o) : fourd.fcm
$(LIB)/minmiz.a(conjug.o) : heap.fcm
$(LIB)/minmiz.a(conjug.o) : image.fcm
$(LIB)/minmiz.a(conjug.o) : impnon.fcm
$(LIB)/minmiz.a(conjug.o) : number.fcm
$(LIB)/minmiz.a(conjug.o) : psf.fcm
$(LIB)/minmiz.a(conjug.o) : shake.fcm
$(LIB)/minmiz.a(conjug.o) : stack.fcm
$(LIB)/minmiz.a(conjug.o) : stream.fcm
$(LIB)/minmiz.a(conjug.o) : timer.fcm
$(LIB)/minmiz.a(conjug.o) : tsmh.fcm
$(LIB)/minmiz.a(conjug.o) : tsms.fcm
#
#
$(LIB)/minmiz.a(egrad1.o) : bases.fcm
$(LIB)/minmiz.a(egrad1.o) : contrl.fcm
$(LIB)/minmiz.a(egrad1.o) : coord.fcm
$(LIB)/minmiz.a(egrad1.o) : coordc.fcm
$(LIB)/minmiz.a(egrad1.o) : deriv.fcm
$(LIB)/minmiz.a(egrad1.o) : dimens.fcm
$(LIB)/minmiz.a(egrad1.o) : energy.fcm
$(LIB)/minmiz.a(egrad1.o) : euler.fcm
$(LIB)/minmiz.a(egrad1.o) : exfunc.fcm
$(LIB)/minmiz.a(egrad1.o) : fourd.fcm
$(LIB)/minmiz.a(egrad1.o) : heap.fcm
$(LIB)/minmiz.a(egrad1.o) : icfix.fcm
$(LIB)/minmiz.a(egrad1.o) : image.fcm
$(LIB)/minmiz.a(egrad1.o) : impnon.fcm
$(LIB)/minmiz.a(egrad1.o) : lupcom.fcm
$(LIB)/minmiz.a(egrad1.o) : number.fcm
$(LIB)/minmiz.a(egrad1.o) : psf.fcm
$(LIB)/minmiz.a(egrad1.o) : shake.fcm
$(LIB)/minmiz.a(egrad1.o) : stack.fcm
$(LIB)/minmiz.a(egrad1.o) : stream.fcm
$(LIB)/minmiz.a(egrad1.o) : tsmh.fcm
$(LIB)/minmiz.a(egrad1.o) : tsms.fcm
#
#
$(LIB)/minmiz.a(minmiz.o) : bases.fcm
$(LIB)/minmiz.a(minmiz.o) : contrl.fcm
$(LIB)/minmiz.a(minmiz.o) : coord.fcm
$(LIB)/minmiz.a(minmiz.o) : ctitla.fcm
$(LIB)/minmiz.a(minmiz.o) : dimens.fcm
$(LIB)/minmiz.a(minmiz.o) : euler.fcm
$(LIB)/minmiz.a(minmiz.o) : exfunc.fcm
$(LIB)/minmiz.a(minmiz.o) : hbond.fcm
$(LIB)/minmiz.a(minmiz.o) : image.fcm
$(LIB)/minmiz.a(minmiz.o) : impnon.fcm
$(LIB)/minmiz.a(minmiz.o) : pert.fcm
$(LIB)/minmiz.a(minmiz.o) : psf.fcm
$(LIB)/minmiz.a(minmiz.o) : reawri.fcm
$(LIB)/minmiz.a(minmiz.o) : stream.fcm
#
#
$(LIB)/minmiz.a(nraph.o) : bases.fcm
$(LIB)/minmiz.a(nraph.o) : cnst.fcm
$(LIB)/minmiz.a(nraph.o) : consta.fcm
$(LIB)/minmiz.a(nraph.o) : contrl.fcm
$(LIB)/minmiz.a(nraph.o) : coord.fcm
$(LIB)/minmiz.a(nraph.o) : deriv.fcm
$(LIB)/minmiz.a(nraph.o) : dimens.fcm
$(LIB)/minmiz.a(nraph.o) : energy.fcm
$(LIB)/minmiz.a(nraph.o) : exfunc.fcm
$(LIB)/minmiz.a(nraph.o) : hbond.fcm
$(LIB)/minmiz.a(nraph.o) : heap.fcm
$(LIB)/minmiz.a(nraph.o) : image.fcm
$(LIB)/minmiz.a(nraph.o) : impnon.fcm
$(LIB)/minmiz.a(nraph.o) : inbnd.fcm
$(LIB)/minmiz.a(nraph.o) : number.fcm
$(LIB)/minmiz.a(nraph.o) : psf.fcm
$(LIB)/minmiz.a(nraph.o) : shake.fcm
$(LIB)/minmiz.a(nraph.o) : stream.fcm
$(LIB)/minmiz.a(nraph.o) : timer.fcm
$(LIB)/minmiz.a(nraph.o) : tsms.fcm
#
#
$(LIB)/minmiz.a(powell.o) : bases.fcm
$(LIB)/minmiz.a(powell.o) : contrl.fcm
$(LIB)/minmiz.a(powell.o) : dimens.fcm
$(LIB)/minmiz.a(powell.o) : energy.fcm
$(LIB)/minmiz.a(powell.o) : exfunc.fcm
$(LIB)/minmiz.a(powell.o) : fourd.fcm
$(LIB)/minmiz.a(powell.o) : heap.fcm
$(LIB)/minmiz.a(powell.o) : image.fcm
$(LIB)/minmiz.a(powell.o) : impnon.fcm
$(LIB)/minmiz.a(powell.o) : number.fcm
$(LIB)/minmiz.a(powell.o) : psf.fcm
$(LIB)/minmiz.a(powell.o) : stack.fcm
$(LIB)/minmiz.a(powell.o) : stream.fcm
$(LIB)/minmiz.a(powell.o) : timer.fcm
$(LIB)/minmiz.a(powell.o) : tsms.fcm
#
#
$(LIB)/minmiz.a(steepd.o) : contrl.fcm
$(LIB)/minmiz.a(steepd.o) : coord.fcm
$(LIB)/minmiz.a(steepd.o) : dimens.fcm
$(LIB)/minmiz.a(steepd.o) : energy.fcm
$(LIB)/minmiz.a(steepd.o) : exfunc.fcm
$(LIB)/minmiz.a(steepd.o) : fourd.fcm
$(LIB)/minmiz.a(steepd.o) : heap.fcm
$(LIB)/minmiz.a(steepd.o) : image.fcm
$(LIB)/minmiz.a(steepd.o) : impnon.fcm
$(LIB)/minmiz.a(steepd.o) : number.fcm
$(LIB)/minmiz.a(steepd.o) : psf.fcm
$(LIB)/minmiz.a(steepd.o) : stream.fcm
$(LIB)/minmiz.a(steepd.o) : timer.fcm
$(LIB)/minmiz.a(steepd.o) : tsmh.fcm
$(LIB)/minmiz.a(steepd.o) : tsms.fcm
#
#
$(LIB)/minmiz.a(tndriv.o) : contrl.fcm
$(LIB)/minmiz.a(tndriv.o) : coord.fcm
$(LIB)/minmiz.a(tndriv.o) : dimens.fcm
$(LIB)/minmiz.a(tndriv.o) : energy.fcm
$(LIB)/minmiz.a(tndriv.o) : euler.fcm
$(LIB)/minmiz.a(tndriv.o) : exfunc.fcm
$(LIB)/minmiz.a(tndriv.o) : heap.fcm
$(LIB)/minmiz.a(tndriv.o) : impnon.fcm
$(LIB)/minmiz.a(tndriv.o) : number.fcm
$(LIB)/minmiz.a(tndriv.o) : psf.fcm
$(LIB)/minmiz.a(tndriv.o) : stack.fcm
$(LIB)/minmiz.a(tndriv.o) : stream.fcm
$(LIB)/minmiz.a(tndriv.o) : tsmh.fcm
$(LIB)/minmiz.a(tndriv.o) : tsms.fcm
#
#
$(LIB)/minmiz.a(tnpack.o) : contrl.fcm
$(LIB)/minmiz.a(tnpack.o) : dimens.fcm
$(LIB)/minmiz.a(tnpack.o) : euler.fcm
$(LIB)/minmiz.a(tnpack.o) : exfunc.fcm
$(LIB)/minmiz.a(tnpack.o) : heap.fcm
$(LIB)/minmiz.a(tnpack.o) : impnon.fcm
$(LIB)/minmiz.a(tnpack.o) : inbnd.fcm
$(LIB)/minmiz.a(tnpack.o) : number.fcm
$(LIB)/minmiz.a(tnpack.o) : stream.fcm
#
