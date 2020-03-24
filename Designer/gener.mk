# gener makefile
# gener library rules
OBJS_gener= \
	$(LIB)/gener.a(genpsf.o) \
	$(LIB)/gener.a(hbonds.o) \
	$(LIB)/gener.a(makphi.o) \
	$(LIB)/gener.a(modpsf.o) \
	$(LIB)/gener.a(psfsum.o) \
	$(LIB)/gener.a(replica.o) \
	$(LIB)/gener.a(update.o)
#
$(LIB)/gener.a : $(OBJS_gener)
	$(RANLIB) $(LIB)/gener.a
	@echo gener COMPLETED
#
# gener source file rules
$(LIB)/gener.a(genpsf.o)  : $(SRC)/gener/genpsf.src
	$(FLX) $(SRC)/gener/genpsf.src
	$(FC2) genpsf.f
	ar rucv $(LIB)/gener.a genpsf.o
	rm genpsf.f
	rm genpsf.o
#
$(LIB)/gener.a(hbonds.o)  : $(SRC)/gener/hbonds.src
	$(FLX) $(SRC)/gener/hbonds.src
	$(FC2) hbonds.f
	ar rucv $(LIB)/gener.a hbonds.o
	rm hbonds.f
	rm hbonds.o
#
$(LIB)/gener.a(makphi.o)  : $(SRC)/gener/makphi.src
	$(FLX) $(SRC)/gener/makphi.src
	$(FC2) makphi.f
	ar rucv $(LIB)/gener.a makphi.o
	rm makphi.f
	rm makphi.o
#
$(LIB)/gener.a(modpsf.o)  : $(SRC)/gener/modpsf.src
	$(FLX) $(SRC)/gener/modpsf.src
	$(FC2) modpsf.f
	ar rucv $(LIB)/gener.a modpsf.o
	rm modpsf.f
	rm modpsf.o
#
$(LIB)/gener.a(psfsum.o)  : $(SRC)/gener/psfsum.src
	$(FLX) $(SRC)/gener/psfsum.src
	$(FC2) psfsum.f
	ar rucv $(LIB)/gener.a psfsum.o
	rm psfsum.f
	rm psfsum.o
#
$(LIB)/gener.a(replica.o)  : $(SRC)/gener/replica.src
	$(FLX) $(SRC)/gener/replica.src
	$(FC2) replica.f
	ar rucv $(LIB)/gener.a replica.o
	rm replica.f
	rm replica.o
#
$(LIB)/gener.a(update.o)  : $(SRC)/gener/update.src
	$(FLX) $(SRC)/gener/update.src
	$(FC2) update.f
	ar rucv $(LIB)/gener.a update.o
	rm update.f
	rm update.o
#
#
# gener dependency file
#
$(LIB)/gener.a(genpsf.o) : bases.fcm
$(LIB)/gener.a(genpsf.o) : cff.fcm
$(LIB)/gener.a(genpsf.o) : cnst.fcm
$(LIB)/gener.a(genpsf.o) : code.fcm
$(LIB)/gener.a(genpsf.o) : consta.fcm
$(LIB)/gener.a(genpsf.o) : coord.fcm
$(LIB)/gener.a(genpsf.o) : coordc.fcm
$(LIB)/gener.a(genpsf.o) : dimens.fcm
$(LIB)/gener.a(genpsf.o) : exfunc.fcm
$(LIB)/gener.a(genpsf.o) : ffield.fcm
$(LIB)/gener.a(genpsf.o) : heap.fcm
$(LIB)/gener.a(genpsf.o) : impnon.fcm
$(LIB)/gener.a(genpsf.o) : intcr.fcm
$(LIB)/gener.a(genpsf.o) : io.fcm
$(LIB)/gener.a(genpsf.o) : mmff.fcm
$(LIB)/gener.a(genpsf.o) : number.fcm
$(LIB)/gener.a(genpsf.o) : param.fcm
$(LIB)/gener.a(genpsf.o) : psf.fcm
$(LIB)/gener.a(genpsf.o) : rtf.fcm
$(LIB)/gener.a(genpsf.o) : stack.fcm
$(LIB)/gener.a(genpsf.o) : stream.fcm
#
#
$(LIB)/gener.a(hbonds.o) : comand.fcm
$(LIB)/gener.a(hbonds.o) : coord.fcm
$(LIB)/gener.a(hbonds.o) : deflts.fcm
$(LIB)/gener.a(hbonds.o) : dimens.fcm
$(LIB)/gener.a(hbonds.o) : exfunc.fcm
$(LIB)/gener.a(hbonds.o) : hbond.fcm
$(LIB)/gener.a(hbonds.o) : impnon.fcm
$(LIB)/gener.a(hbonds.o) : param.fcm
$(LIB)/gener.a(hbonds.o) : psf.fcm
$(LIB)/gener.a(hbonds.o) : stack.fcm
$(LIB)/gener.a(hbonds.o) : stream.fcm
#
#
$(LIB)/gener.a(makphi.o) : code.fcm
$(LIB)/gener.a(makphi.o) : consta.fcm
$(LIB)/gener.a(makphi.o) : dimens.fcm
$(LIB)/gener.a(makphi.o) : exfunc.fcm
$(LIB)/gener.a(makphi.o) : heap.fcm
$(LIB)/gener.a(makphi.o) : impnon.fcm
$(LIB)/gener.a(makphi.o) : number.fcm
$(LIB)/gener.a(makphi.o) : param.fcm
$(LIB)/gener.a(makphi.o) : psf.fcm
$(LIB)/gener.a(makphi.o) : stack.fcm
$(LIB)/gener.a(makphi.o) : stream.fcm
$(LIB)/gener.a(makphi.o) : vphi.fcm
#
#
$(LIB)/gener.a(modpsf.o) : bases.fcm
$(LIB)/gener.a(modpsf.o) : cnst.fcm
$(LIB)/gener.a(modpsf.o) : consta.fcm
$(LIB)/gener.a(modpsf.o) : coord.fcm
$(LIB)/gener.a(modpsf.o) : coordc.fcm
$(LIB)/gener.a(modpsf.o) : cstack.fcm
$(LIB)/gener.a(modpsf.o) : dimens.fcm
$(LIB)/gener.a(modpsf.o) : exfunc.fcm
$(LIB)/gener.a(modpsf.o) : ffield.fcm
$(LIB)/gener.a(modpsf.o) : hbond.fcm
$(LIB)/gener.a(modpsf.o) : heap.fcm
$(LIB)/gener.a(modpsf.o) : impnon.fcm
$(LIB)/gener.a(modpsf.o) : intcr.fcm
$(LIB)/gener.a(modpsf.o) : lonepr.fcm
$(LIB)/gener.a(modpsf.o) : mmff.fcm
$(LIB)/gener.a(modpsf.o) : noe.fcm
$(LIB)/gener.a(modpsf.o) : number.fcm
$(LIB)/gener.a(modpsf.o) : psf.fcm
$(LIB)/gener.a(modpsf.o) : replica.fcm
$(LIB)/gener.a(modpsf.o) : rtf.fcm
$(LIB)/gener.a(modpsf.o) : stack.fcm
$(LIB)/gener.a(modpsf.o) : stream.fcm
#
#
$(LIB)/gener.a(psfsum.o) : bases.fcm
$(LIB)/gener.a(psfsum.o) : code.fcm
$(LIB)/gener.a(psfsum.o) : dimens.fcm
$(LIB)/gener.a(psfsum.o) : impnon.fcm
$(LIB)/gener.a(psfsum.o) : number.fcm
$(LIB)/gener.a(psfsum.o) : psf.fcm
$(LIB)/gener.a(psfsum.o) : stream.fcm
#
#
$(LIB)/gener.a(replica.o) : bases.fcm
$(LIB)/gener.a(replica.o) : cnst.fcm
$(LIB)/gener.a(replica.o) : code.fcm
$(LIB)/gener.a(replica.o) : comand.fcm
$(LIB)/gener.a(replica.o) : coord.fcm
$(LIB)/gener.a(replica.o) : coordc.fcm
$(LIB)/gener.a(replica.o) : deriv.fcm
$(LIB)/gener.a(replica.o) : dimens.fcm
$(LIB)/gener.a(replica.o) : econt.fcm
$(LIB)/gener.a(replica.o) : exfunc.fcm
$(LIB)/gener.a(replica.o) : heap.fcm
$(LIB)/gener.a(replica.o) : impnon.fcm
$(LIB)/gener.a(replica.o) : intcr.fcm
$(LIB)/gener.a(replica.o) : lonepr.fcm
$(LIB)/gener.a(replica.o) : number.fcm
$(LIB)/gener.a(replica.o) : param.fcm
$(LIB)/gener.a(replica.o) : pert.fcm
$(LIB)/gener.a(replica.o) : psf.fcm
$(LIB)/gener.a(replica.o) : replica.fcm
$(LIB)/gener.a(replica.o) : stream.fcm
#
#
$(LIB)/gener.a(update.o) : bases.fcm
$(LIB)/gener.a(update.o) : cff.fcm
$(LIB)/gener.a(update.o) : code.fcm
$(LIB)/gener.a(update.o) : contrl.fcm
$(LIB)/gener.a(update.o) : dimens.fcm
$(LIB)/gener.a(update.o) : energy.fcm
$(LIB)/gener.a(update.o) : excl.fcm
$(LIB)/gener.a(update.o) : exfunc.fcm
$(LIB)/gener.a(update.o) : fast.fcm
$(LIB)/gener.a(update.o) : ffield.fcm
$(LIB)/gener.a(update.o) : fourd.fcm
$(LIB)/gener.a(update.o) : gamess.fcm
$(LIB)/gener.a(update.o) : hbond.fcm
$(LIB)/gener.a(update.o) : heap.fcm
$(LIB)/gener.a(update.o) : icfix.fcm
$(LIB)/gener.a(update.o) : image.fcm
$(LIB)/gener.a(update.o) : impnon.fcm
$(LIB)/gener.a(update.o) : inbnd.fcm
$(LIB)/gener.a(update.o) : lonepr.fcm
$(LIB)/gener.a(update.o) : mbond.fcm
$(LIB)/gener.a(update.o) : mmff.fcm
$(LIB)/gener.a(update.o) : parallel.fcm
$(LIB)/gener.a(update.o) : param.fcm
$(LIB)/gener.a(update.o) : pert.fcm
$(LIB)/gener.a(update.o) : psf.fcm
$(LIB)/gener.a(update.o) : shake.fcm
$(LIB)/gener.a(update.o) : shapes.fcm
$(LIB)/gener.a(update.o) : stream.fcm
$(LIB)/gener.a(update.o) : tsms.fcm
#
