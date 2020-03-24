# mc makefile
# mc library rules
OBJS_mc= \
	$(LIB)/mc.a(armupt.o) \
	$(LIB)/mc.a(mc.o) \
	$(LIB)/mc.a(mcener.o) \
	$(LIB)/mc.a(mcimge.o) \
	$(LIB)/mc.a(mcio.o) \
	$(LIB)/mc.a(mcuser.o) \
	$(LIB)/mc.a(movead.o) \
	$(LIB)/mc.a(moveio.o) \
	$(LIB)/mc.a(mvcrot.o) \
	$(LIB)/mc.a(mvdihe.o) \
	$(LIB)/mc.a(mvrtrn.o) \
	$(LIB)/mc.a(numrec.o)
#
$(LIB)/mc.a : $(OBJS_mc)
	$(RANLIB) $(LIB)/mc.a
	@echo mc COMPLETED
#
# mc source file rules
$(LIB)/mc.a(armupt.o)  : $(SRC)/mc/armupt.src
	$(FLX) $(SRC)/mc/armupt.src
	$(FC2) armupt.f
	ar rucv $(LIB)/mc.a armupt.o
	rm armupt.f
	rm armupt.o
#
$(LIB)/mc.a(mc.o)  : $(SRC)/mc/mc.src
	$(FLX) $(SRC)/mc/mc.src
	$(FC2) mc.f
	ar rucv $(LIB)/mc.a mc.o
	rm mc.f
	rm mc.o
#
$(LIB)/mc.a(mcener.o)  : $(SRC)/mc/mcener.src
	$(FLX) $(SRC)/mc/mcener.src
	$(FC2) mcener.f
	ar rucv $(LIB)/mc.a mcener.o
	rm mcener.f
	rm mcener.o
#
$(LIB)/mc.a(mcimge.o)  : $(SRC)/mc/mcimge.src
	$(FLX) $(SRC)/mc/mcimge.src
	$(FC2) mcimge.f
	ar rucv $(LIB)/mc.a mcimge.o
	rm mcimge.f
	rm mcimge.o
#
$(LIB)/mc.a(mcio.o)  : $(SRC)/mc/mcio.src
	$(FLX) $(SRC)/mc/mcio.src
	$(FC2) mcio.f
	ar rucv $(LIB)/mc.a mcio.o
	rm mcio.f
	rm mcio.o
#
$(LIB)/mc.a(mcuser.o)  : $(SRC)/mc/mcuser.src
	$(FLX) $(SRC)/mc/mcuser.src
	$(FC2) mcuser.f
	ar rucv $(LIB)/mc.a mcuser.o
	rm mcuser.f
	rm mcuser.o
#
$(LIB)/mc.a(movead.o)  : $(SRC)/mc/movead.src
	$(FLX) $(SRC)/mc/movead.src
	$(FC2) movead.f
	ar rucv $(LIB)/mc.a movead.o
	rm movead.f
	rm movead.o
#
$(LIB)/mc.a(moveio.o)  : $(SRC)/mc/moveio.src
	$(FLX) $(SRC)/mc/moveio.src
	$(FC2) moveio.f
	ar rucv $(LIB)/mc.a moveio.o
	rm moveio.f
	rm moveio.o
#
$(LIB)/mc.a(mvcrot.o)  : $(SRC)/mc/mvcrot.src
	$(FLX) $(SRC)/mc/mvcrot.src
	$(FC2) mvcrot.f
	ar rucv $(LIB)/mc.a mvcrot.o
	rm mvcrot.f
	rm mvcrot.o
#
$(LIB)/mc.a(mvdihe.o)  : $(SRC)/mc/mvdihe.src
	$(FLX) $(SRC)/mc/mvdihe.src
	$(FC2) mvdihe.f
	ar rucv $(LIB)/mc.a mvdihe.o
	rm mvdihe.f
	rm mvdihe.o
#
$(LIB)/mc.a(mvrtrn.o)  : $(SRC)/mc/mvrtrn.src
	$(FLX) $(SRC)/mc/mvrtrn.src
	$(FC2) mvrtrn.f
	ar rucv $(LIB)/mc.a mvrtrn.o
	rm mvrtrn.f
	rm mvrtrn.o
#
$(LIB)/mc.a(numrec.o)  : $(SRC)/mc/numrec.src
	$(FLX) $(SRC)/mc/numrec.src
	$(FC2) numrec.f
	ar rucv $(LIB)/mc.a numrec.o
	rm numrec.f
	rm numrec.o
#
#
# mc dependency file
#
$(LIB)/mc.a(armupt.o) : impnon.fcm
$(LIB)/mc.a(armupt.o) : number.fcm
#
#
$(LIB)/mc.a(mc.o) : bases.fcm
$(LIB)/mc.a(mc.o) : block.fcm
$(LIB)/mc.a(mc.o) : consta.fcm
$(LIB)/mc.a(mc.o) : coord.fcm
$(LIB)/mc.a(mc.o) : ctitla.fcm
$(LIB)/mc.a(mc.o) : deriv.fcm
$(LIB)/mc.a(mc.o) : dimens.fcm
$(LIB)/mc.a(mc.o) : energy.fcm
$(LIB)/mc.a(mc.o) : ewald.fcm
$(LIB)/mc.a(mc.o) : exfunc.fcm
$(LIB)/mc.a(mc.o) : fast.fcm
$(LIB)/mc.a(mc.o) : heap.fcm
$(LIB)/mc.a(mc.o) : image.fcm
$(LIB)/mc.a(mc.o) : impnon.fcm
$(LIB)/mc.a(mc.o) : inbnd.fcm
$(LIB)/mc.a(mc.o) : mc.fcm
$(LIB)/mc.a(mc.o) : number.fcm
$(LIB)/mc.a(mc.o) : psf.fcm
$(LIB)/mc.a(mc.o) : stack.fcm
$(LIB)/mc.a(mc.o) : stream.fcm
#
#
$(LIB)/mc.a(mcener.o) : bases.fcm
$(LIB)/mc.a(mcener.o) : code.fcm
$(LIB)/mc.a(mcener.o) : deriv.fcm
$(LIB)/mc.a(mcener.o) : dimens.fcm
$(LIB)/mc.a(mcener.o) : econt.fcm
$(LIB)/mc.a(mcener.o) : eef1.fcm
$(LIB)/mc.a(mcener.o) : energy.fcm
$(LIB)/mc.a(mcener.o) : exfunc.fcm
$(LIB)/mc.a(mcener.o) : fast.fcm
$(LIB)/mc.a(mcener.o) : heap.fcm
$(LIB)/mc.a(mcener.o) : image.fcm
$(LIB)/mc.a(mcener.o) : impnon.fcm
$(LIB)/mc.a(mcener.o) : inbnd.fcm
$(LIB)/mc.a(mcener.o) : mc.fcm
$(LIB)/mc.a(mcener.o) : number.fcm
$(LIB)/mc.a(mcener.o) : param.fcm
$(LIB)/mc.a(mcener.o) : psf.fcm
$(LIB)/mc.a(mcener.o) : stack.fcm
$(LIB)/mc.a(mcener.o) : stream.fcm
#
#
$(LIB)/mc.a(mcimge.o) : deriv.fcm
$(LIB)/mc.a(mcimge.o) : dimens.fcm
$(LIB)/mc.a(mcimge.o) : econt.fcm
$(LIB)/mc.a(mcimge.o) : energy.fcm
$(LIB)/mc.a(mcimge.o) : exfunc.fcm
$(LIB)/mc.a(mcimge.o) : fast.fcm
$(LIB)/mc.a(mcimge.o) : heap.fcm
$(LIB)/mc.a(mcimge.o) : impnon.fcm
$(LIB)/mc.a(mcimge.o) : param.fcm
$(LIB)/mc.a(mcimge.o) : psf.fcm
$(LIB)/mc.a(mcimge.o) : stack.fcm
#
#
$(LIB)/mc.a(mcio.o) : consta.fcm
$(LIB)/mc.a(mcio.o) : ctitla.fcm
$(LIB)/mc.a(mcio.o) : dimens.fcm
$(LIB)/mc.a(mcio.o) : exfunc.fcm
$(LIB)/mc.a(mcio.o) : heap.fcm
$(LIB)/mc.a(mcio.o) : image.fcm
$(LIB)/mc.a(mcio.o) : impnon.fcm
$(LIB)/mc.a(mcio.o) : psf.fcm
$(LIB)/mc.a(mcio.o) : stream.fcm
$(LIB)/mc.a(mcio.o) : version.fcm
#
#
$(LIB)/mc.a(mcuser.o) : impnon.fcm
#
#
$(LIB)/mc.a(movead.o) : coord.fcm
$(LIB)/mc.a(movead.o) : dimens.fcm
$(LIB)/mc.a(movead.o) : exfunc.fcm
$(LIB)/mc.a(movead.o) : heap.fcm
$(LIB)/mc.a(movead.o) : impnon.fcm
$(LIB)/mc.a(movead.o) : mc.fcm
$(LIB)/mc.a(movead.o) : number.fcm
$(LIB)/mc.a(movead.o) : psf.fcm
$(LIB)/mc.a(movead.o) : stream.fcm
#
#
$(LIB)/mc.a(moveio.o) : ctitla.fcm
$(LIB)/mc.a(moveio.o) : exfunc.fcm
$(LIB)/mc.a(moveio.o) : heap.fcm
$(LIB)/mc.a(moveio.o) : impnon.fcm
$(LIB)/mc.a(moveio.o) : mc.fcm
$(LIB)/mc.a(moveio.o) : stream.fcm
#
#
$(LIB)/mc.a(mvcrot.o) : consta.fcm
$(LIB)/mc.a(mvcrot.o) : dimens.fcm
$(LIB)/mc.a(mvcrot.o) : exfunc.fcm
$(LIB)/mc.a(mvcrot.o) : heap.fcm
$(LIB)/mc.a(mvcrot.o) : impnon.fcm
$(LIB)/mc.a(mvcrot.o) : number.fcm
$(LIB)/mc.a(mvcrot.o) : psf.fcm
$(LIB)/mc.a(mvcrot.o) : selcta.fcm
$(LIB)/mc.a(mvcrot.o) : stack.fcm
$(LIB)/mc.a(mvcrot.o) : stream.fcm
#
#
$(LIB)/mc.a(mvdihe.o) : dimens.fcm
$(LIB)/mc.a(mvdihe.o) : exfunc.fcm
$(LIB)/mc.a(mvdihe.o) : heap.fcm
$(LIB)/mc.a(mvdihe.o) : impnon.fcm
$(LIB)/mc.a(mvdihe.o) : psf.fcm
$(LIB)/mc.a(mvdihe.o) : selcta.fcm
$(LIB)/mc.a(mvdihe.o) : stack.fcm
#
#
$(LIB)/mc.a(mvrtrn.o) : consta.fcm
$(LIB)/mc.a(mvrtrn.o) : dimens.fcm
$(LIB)/mc.a(mvrtrn.o) : exfunc.fcm
$(LIB)/mc.a(mvrtrn.o) : heap.fcm
$(LIB)/mc.a(mvrtrn.o) : impnon.fcm
$(LIB)/mc.a(mvrtrn.o) : number.fcm
$(LIB)/mc.a(mvrtrn.o) : psf.fcm
$(LIB)/mc.a(mvrtrn.o) : selcta.fcm
$(LIB)/mc.a(mvrtrn.o) : stack.fcm
#
#
$(LIB)/mc.a(numrec.o) : impnon.fcm
#
