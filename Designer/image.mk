# image makefile
# image library rules
OBJS_image= \
	$(LIB)/image.a(cnbndm.o) \
	$(LIB)/image.a(crystal.o) \
	$(LIB)/image.a(eimage.o) \
	$(LIB)/image.a(images.o) \
	$(LIB)/image.a(imagio.o) \
	$(LIB)/image.a(imnbf2p.o) \
	$(LIB)/image.a(imnbfp.o) \
	$(LIB)/image.a(nbndgcm.o) \
	$(LIB)/image.a(nbondm.o) \
	$(LIB)/image.a(pbound.o) \
	$(LIB)/image.a(upimag.o) \
	$(LIB)/image.a(xtlfrq.o)
#
$(LIB)/image.a : $(OBJS_image)
	$(RANLIB) $(LIB)/image.a
	@echo image COMPLETED
#
# image source file rules
$(LIB)/image.a(cnbndm.o)  : $(SRC)/image/cnbndm.src
	$(FLX) $(SRC)/image/cnbndm.src
	$(FC2) cnbndm.f
	ar rucv $(LIB)/image.a cnbndm.o
	rm cnbndm.f
	rm cnbndm.o
#
$(LIB)/image.a(crystal.o)  : $(SRC)/image/crystal.src
	$(FLX) $(SRC)/image/crystal.src
	$(FC2) crystal.f
	ar rucv $(LIB)/image.a crystal.o
	rm crystal.f
	rm crystal.o
#
$(LIB)/image.a(eimage.o)  : $(SRC)/image/eimage.src
	$(FLX) $(SRC)/image/eimage.src
	$(FC2) eimage.f
	ar rucv $(LIB)/image.a eimage.o
	rm eimage.f
	rm eimage.o
#
$(LIB)/image.a(images.o)  : $(SRC)/image/images.src
	$(FLX) $(SRC)/image/images.src
	$(FC2) images.f
	ar rucv $(LIB)/image.a images.o
	rm images.f
	rm images.o
#
$(LIB)/image.a(imagio.o)  : $(SRC)/image/imagio.src
	$(FLX) $(SRC)/image/imagio.src
	$(FC2) imagio.f
	ar rucv $(LIB)/image.a imagio.o
	rm imagio.f
	rm imagio.o
#
$(LIB)/image.a(imnbf2p.o)  : $(SRC)/image/imnbf2p.src
	$(FLX) $(SRC)/image/imnbf2p.src
	$(FC2) imnbf2p.f
	ar rucv $(LIB)/image.a imnbf2p.o
	rm imnbf2p.f
	rm imnbf2p.o
#
$(LIB)/image.a(imnbfp.o)  : $(SRC)/image/imnbfp.src
	$(FLX) $(SRC)/image/imnbfp.src
	$(FC2) imnbfp.f
	ar rucv $(LIB)/image.a imnbfp.o
	rm imnbfp.f
	rm imnbfp.o
#
$(LIB)/image.a(nbndgcm.o)  : $(SRC)/image/nbndgcm.src
	$(FLX) $(SRC)/image/nbndgcm.src
	$(FC2) nbndgcm.f
	ar rucv $(LIB)/image.a nbndgcm.o
	rm nbndgcm.f
	rm nbndgcm.o
#
$(LIB)/image.a(nbondm.o)  : $(SRC)/image/nbondm.src
	$(FLX) $(SRC)/image/nbondm.src
	$(FC0) nbondm.f
	ar rucv $(LIB)/image.a nbondm.o
	rm nbondm.f
	rm nbondm.o
#
$(LIB)/image.a(pbound.o)  : $(SRC)/image/pbound.src
	$(FLX) $(SRC)/image/pbound.src
	$(FC2) pbound.f
	ar rucv $(LIB)/image.a pbound.o
	rm pbound.f
	rm pbound.o
#
$(LIB)/image.a(upimag.o)  : $(SRC)/image/upimag.src
	$(FLX) $(SRC)/image/upimag.src
	$(FC2) upimag.f
	ar rucv $(LIB)/image.a upimag.o
	rm upimag.f
	rm upimag.o
#
$(LIB)/image.a(xtlfrq.o)  : $(SRC)/image/xtlfrq.src
	$(FLX) $(SRC)/image/xtlfrq.src
	$(FC2) xtlfrq.f
	ar rucv $(LIB)/image.a xtlfrq.o
	rm xtlfrq.f
	rm xtlfrq.o
#
#
# image dependency file
#
$(LIB)/image.a(cnbndm.o) : consta.fcm
$(LIB)/image.a(cnbndm.o) : dimens.fcm
$(LIB)/image.a(cnbndm.o) : impnon.fcm
$(LIB)/image.a(cnbndm.o) : number.fcm
$(LIB)/image.a(cnbndm.o) : psf.fcm
$(LIB)/image.a(cnbndm.o) : stream.fcm
$(LIB)/image.a(cnbndm.o) : timer.fcm
#
#
$(LIB)/image.a(crystal.o) : bases.fcm
$(LIB)/image.a(crystal.o) : comand.fcm
$(LIB)/image.a(crystal.o) : consta.fcm
$(LIB)/image.a(crystal.o) : coord.fcm
$(LIB)/image.a(crystal.o) : ctitla.fcm
$(LIB)/image.a(crystal.o) : dimens.fcm
$(LIB)/image.a(crystal.o) : energy.fcm
$(LIB)/image.a(crystal.o) : exfunc.fcm
$(LIB)/image.a(crystal.o) : heap.fcm
$(LIB)/image.a(crystal.o) : image.fcm
$(LIB)/image.a(crystal.o) : impnon.fcm
$(LIB)/image.a(crystal.o) : number.fcm
$(LIB)/image.a(crystal.o) : psf.fcm
$(LIB)/image.a(crystal.o) : stack.fcm
$(LIB)/image.a(crystal.o) : stream.fcm
#
#
$(LIB)/image.a(eimage.o) : code.fcm
$(LIB)/image.a(eimage.o) : consta.fcm
$(LIB)/image.a(eimage.o) : dimens.fcm
$(LIB)/image.a(eimage.o) : energy.fcm
$(LIB)/image.a(eimage.o) : ewald.fcm
$(LIB)/image.a(eimage.o) : exfunc.fcm
$(LIB)/image.a(eimage.o) : ffield.fcm
$(LIB)/image.a(eimage.o) : hbond.fcm
$(LIB)/image.a(eimage.o) : heap.fcm
$(LIB)/image.a(eimage.o) : image.fcm
$(LIB)/image.a(eimage.o) : impnon.fcm
$(LIB)/image.a(eimage.o) : inbnd.fcm
$(LIB)/image.a(eimage.o) : mmff.fcm
$(LIB)/image.a(eimage.o) : number.fcm
$(LIB)/image.a(eimage.o) : parallel.fcm
$(LIB)/image.a(eimage.o) : param.fcm
$(LIB)/image.a(eimage.o) : psf.fcm
$(LIB)/image.a(eimage.o) : stream.fcm
$(LIB)/image.a(eimage.o) : tbmts.fcm
$(LIB)/image.a(eimage.o) : tbmtsp.fcm
$(LIB)/image.a(eimage.o) : timer.fcm
#
#
$(LIB)/image.a(images.o) : bases.fcm
$(LIB)/image.a(images.o) : consta.fcm
$(LIB)/image.a(images.o) : coord.fcm
$(LIB)/image.a(images.o) : dimens.fcm
$(LIB)/image.a(images.o) : exfunc.fcm
$(LIB)/image.a(images.o) : heap.fcm
$(LIB)/image.a(images.o) : image.fcm
$(LIB)/image.a(images.o) : impnon.fcm
$(LIB)/image.a(images.o) : intcr.fcm
$(LIB)/image.a(images.o) : psf.fcm
$(LIB)/image.a(images.o) : rtf.fcm
$(LIB)/image.a(images.o) : stream.fcm
$(LIB)/image.a(images.o) : tsms.fcm
#
#
$(LIB)/image.a(imagio.o) : ctitla.fcm
$(LIB)/image.a(imagio.o) : dimens.fcm
$(LIB)/image.a(imagio.o) : exfunc.fcm
$(LIB)/image.a(imagio.o) : heap.fcm
$(LIB)/image.a(imagio.o) : image.fcm
$(LIB)/image.a(imagio.o) : impnon.fcm
$(LIB)/image.a(imagio.o) : number.fcm
$(LIB)/image.a(imagio.o) : psf.fcm
$(LIB)/image.a(imagio.o) : stream.fcm
#
#
$(LIB)/image.a(imnbf2p.o) : dimens.fcm
$(LIB)/image.a(imnbf2p.o) : impnon.fcm
$(LIB)/image.a(imnbf2p.o) : number.fcm
$(LIB)/image.a(imnbf2p.o) : psf.fcm
$(LIB)/image.a(imnbf2p.o) : stream.fcm
$(LIB)/image.a(imnbf2p.o) : timer.fcm
#
#
$(LIB)/image.a(imnbfp.o) : dimens.fcm
$(LIB)/image.a(imnbfp.o) : exfunc.fcm
$(LIB)/image.a(imnbfp.o) : heap.fcm
$(LIB)/image.a(imnbfp.o) : image.fcm
$(LIB)/image.a(imnbfp.o) : impnon.fcm
$(LIB)/image.a(imnbfp.o) : inbnd.fcm
$(LIB)/image.a(imnbfp.o) : machdep.fcm
$(LIB)/image.a(imnbfp.o) : number.fcm
$(LIB)/image.a(imnbfp.o) : psf.fcm
$(LIB)/image.a(imnbfp.o) : stream.fcm
$(LIB)/image.a(imnbfp.o) : timer.fcm
$(LIB)/image.a(imnbfp.o) : tsmh.fcm
$(LIB)/image.a(imnbfp.o) : tsms.fcm
#
#
$(LIB)/image.a(nbndgcm.o) : consta.fcm
$(LIB)/image.a(nbndgcm.o) : dimens.fcm
$(LIB)/image.a(nbndgcm.o) : exfunc.fcm
$(LIB)/image.a(nbndgcm.o) : heap.fcm
$(LIB)/image.a(nbndgcm.o) : impnon.fcm
$(LIB)/image.a(nbndgcm.o) : number.fcm
$(LIB)/image.a(nbndgcm.o) : parallel.fcm
$(LIB)/image.a(nbndgcm.o) : psf.fcm
$(LIB)/image.a(nbndgcm.o) : replica.fcm
$(LIB)/image.a(nbndgcm.o) : stream.fcm
$(LIB)/image.a(nbndgcm.o) : timer.fcm
#
#
$(LIB)/image.a(nbondm.o) : dimens.fcm
$(LIB)/image.a(nbondm.o) : excl.fcm
$(LIB)/image.a(nbondm.o) : exfunc.fcm
$(LIB)/image.a(nbondm.o) : impnon.fcm
$(LIB)/image.a(nbondm.o) : number.fcm
$(LIB)/image.a(nbondm.o) : parallel.fcm
$(LIB)/image.a(nbondm.o) : pert.fcm
$(LIB)/image.a(nbondm.o) : psf.fcm
$(LIB)/image.a(nbondm.o) : replica.fcm
$(LIB)/image.a(nbondm.o) : stream.fcm
$(LIB)/image.a(nbondm.o) : tbmts.fcm
$(LIB)/image.a(nbondm.o) : timer.fcm
#
#
$(LIB)/image.a(pbound.o) : exfunc.fcm
$(LIB)/image.a(pbound.o) : impnon.fcm
$(LIB)/image.a(pbound.o) : number.fcm
$(LIB)/image.a(pbound.o) : pbound.fcm
$(LIB)/image.a(pbound.o) : stream.fcm
#
#
$(LIB)/image.a(upimag.o) : bases.fcm
$(LIB)/image.a(upimag.o) : block.fcm
$(LIB)/image.a(upimag.o) : dimens.fcm
$(LIB)/image.a(upimag.o) : eef1.fcm
$(LIB)/image.a(upimag.o) : ewald.fcm
$(LIB)/image.a(upimag.o) : exfunc.fcm
$(LIB)/image.a(upimag.o) : fast.fcm
$(LIB)/image.a(upimag.o) : hbond.fcm
$(LIB)/image.a(upimag.o) : heap.fcm
$(LIB)/image.a(upimag.o) : image.fcm
$(LIB)/image.a(upimag.o) : impnon.fcm
$(LIB)/image.a(upimag.o) : inbnd.fcm
$(LIB)/image.a(upimag.o) : intcr.fcm
$(LIB)/image.a(upimag.o) : machdep.fcm
$(LIB)/image.a(upimag.o) : number.fcm
$(LIB)/image.a(upimag.o) : parallel.fcm
$(LIB)/image.a(upimag.o) : param.fcm
$(LIB)/image.a(upimag.o) : pbound.fcm
$(LIB)/image.a(upimag.o) : pert.fcm
$(LIB)/image.a(upimag.o) : psf.fcm
$(LIB)/image.a(upimag.o) : stack.fcm
$(LIB)/image.a(upimag.o) : stream.fcm
$(LIB)/image.a(upimag.o) : tbmts.fcm
$(LIB)/image.a(upimag.o) : timer.fcm
#
#
$(LIB)/image.a(xtlfrq.o) : bases.fcm
$(LIB)/image.a(xtlfrq.o) : consta.fcm
$(LIB)/image.a(xtlfrq.o) : coord.fcm
$(LIB)/image.a(xtlfrq.o) : ctitla.fcm
$(LIB)/image.a(xtlfrq.o) : deriv.fcm
$(LIB)/image.a(xtlfrq.o) : dimens.fcm
$(LIB)/image.a(xtlfrq.o) : econt.fcm
$(LIB)/image.a(xtlfrq.o) : energy.fcm
$(LIB)/image.a(xtlfrq.o) : exelec.fcm
$(LIB)/image.a(xtlfrq.o) : exfunc.fcm
$(LIB)/image.a(xtlfrq.o) : hbond.fcm
$(LIB)/image.a(xtlfrq.o) : heap.fcm
$(LIB)/image.a(xtlfrq.o) : image.fcm
$(LIB)/image.a(xtlfrq.o) : impnon.fcm
$(LIB)/image.a(xtlfrq.o) : inbnd.fcm
$(LIB)/image.a(xtlfrq.o) : number.fcm
$(LIB)/image.a(xtlfrq.o) : param.fcm
$(LIB)/image.a(xtlfrq.o) : psf.fcm
$(LIB)/image.a(xtlfrq.o) : rtf.fcm
$(LIB)/image.a(xtlfrq.o) : stack.fcm
$(LIB)/image.a(xtlfrq.o) : stream.fcm
#
