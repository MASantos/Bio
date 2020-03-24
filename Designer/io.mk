# io makefile
# io library rules
OBJS_io= \
	$(LIB)/io.a(coorio.o) \
	$(LIB)/io.a(mainio.o) \
	$(LIB)/io.a(parmio.o) \
	$(LIB)/io.a(psfres.o) \
	$(LIB)/io.a(rtfio.o) \
	$(LIB)/io.a(trajio.o) \
	$(LIB)/io.a(univio.o)
#
$(LIB)/io.a : $(OBJS_io)
	$(RANLIB) $(LIB)/io.a
	@echo io COMPLETED
#
# io source file rules
$(LIB)/io.a(coorio.o)  : $(SRC)/io/coorio.src
	$(FLX) $(SRC)/io/coorio.src
	$(FC2) coorio.f
	ar rucv $(LIB)/io.a coorio.o
	rm coorio.f
	rm coorio.o
#
$(LIB)/io.a(mainio.o)  : $(SRC)/io/mainio.src
	$(FLX) $(SRC)/io/mainio.src
	$(FC2) mainio.f
	ar rucv $(LIB)/io.a mainio.o
	rm mainio.f
	rm mainio.o
#
$(LIB)/io.a(parmio.o)  : $(SRC)/io/parmio.src
	$(FLX) $(SRC)/io/parmio.src
	$(FC2) parmio.f
	ar rucv $(LIB)/io.a parmio.o
	rm parmio.f
	rm parmio.o
#
$(LIB)/io.a(psfres.o)  : $(SRC)/io/psfres.src
	$(FLX) $(SRC)/io/psfres.src
	$(FC2) psfres.f
	ar rucv $(LIB)/io.a psfres.o
	rm psfres.f
	rm psfres.o
#
$(LIB)/io.a(rtfio.o)  : $(SRC)/io/rtfio.src
	$(FLX) $(SRC)/io/rtfio.src
	$(FC2) rtfio.f
	ar rucv $(LIB)/io.a rtfio.o
	rm rtfio.f
	rm rtfio.o
#
$(LIB)/io.a(trajio.o)  : $(SRC)/io/trajio.src
	$(FLX) $(SRC)/io/trajio.src
	$(FC2) trajio.f
	ar rucv $(LIB)/io.a trajio.o
	rm trajio.f
	rm trajio.o
#
$(LIB)/io.a(univio.o)  : $(SRC)/io/univio.src
	$(FLX) $(SRC)/io/univio.src
	$(FC2) univio.f
	ar rucv $(LIB)/io.a univio.o
	rm univio.f
	rm univio.o
#
#
# io dependency file
#
$(LIB)/io.a(coorio.o) : dimens.fcm
$(LIB)/io.a(coorio.o) : exfunc.fcm
$(LIB)/io.a(coorio.o) : fourd.fcm
$(LIB)/io.a(coorio.o) : image.fcm
$(LIB)/io.a(coorio.o) : impnon.fcm
$(LIB)/io.a(coorio.o) : number.fcm
$(LIB)/io.a(coorio.o) : stack.fcm
$(LIB)/io.a(coorio.o) : stream.fcm
#
#
$(LIB)/io.a(mainio.o) : bases.fcm
$(LIB)/io.a(mainio.o) : cnst.fcm
$(LIB)/io.a(mainio.o) : code.fcm
$(LIB)/io.a(mainio.o) : comand.fcm
$(LIB)/io.a(mainio.o) : contrl.fcm
$(LIB)/io.a(mainio.o) : coord.fcm
$(LIB)/io.a(mainio.o) : coordc.fcm
$(LIB)/io.a(mainio.o) : cstack.fcm
$(LIB)/io.a(mainio.o) : ctitla.fcm
$(LIB)/io.a(mainio.o) : dimens.fcm
$(LIB)/io.a(mainio.o) : energy.fcm
$(LIB)/io.a(mainio.o) : exfunc.fcm
$(LIB)/io.a(mainio.o) : hbond.fcm
$(LIB)/io.a(mainio.o) : heap.fcm
$(LIB)/io.a(mainio.o) : image.fcm
$(LIB)/io.a(mainio.o) : impnon.fcm
$(LIB)/io.a(mainio.o) : inbnd.fcm
$(LIB)/io.a(mainio.o) : intcr.fcm
$(LIB)/io.a(mainio.o) : io.fcm
$(LIB)/io.a(mainio.o) : number.fcm
$(LIB)/io.a(mainio.o) : param.fcm
$(LIB)/io.a(mainio.o) : pert.fcm
$(LIB)/io.a(mainio.o) : psf.fcm
$(LIB)/io.a(mainio.o) : rtf.fcm
$(LIB)/io.a(mainio.o) : stack.fcm
$(LIB)/io.a(mainio.o) : stream.fcm
#
#
$(LIB)/io.a(parmio.o) : comand.fcm
$(LIB)/io.a(parmio.o) : consta.fcm
$(LIB)/io.a(parmio.o) : deflts.fcm
$(LIB)/io.a(parmio.o) : dimens.fcm
$(LIB)/io.a(parmio.o) : energy.fcm
$(LIB)/io.a(parmio.o) : exfunc.fcm
$(LIB)/io.a(parmio.o) : ffield.fcm
$(LIB)/io.a(parmio.o) : impnon.fcm
$(LIB)/io.a(parmio.o) : inbnd.fcm
$(LIB)/io.a(parmio.o) : mmff.fcm
$(LIB)/io.a(parmio.o) : number.fcm
$(LIB)/io.a(parmio.o) : param.fcm
$(LIB)/io.a(parmio.o) : stack.fcm
$(LIB)/io.a(parmio.o) : stream.fcm
#
#
$(LIB)/io.a(psfres.o) : cff.fcm
$(LIB)/io.a(psfres.o) : comand.fcm
$(LIB)/io.a(psfres.o) : dimens.fcm
$(LIB)/io.a(psfres.o) : exfunc.fcm
$(LIB)/io.a(psfres.o) : ffield.fcm
$(LIB)/io.a(psfres.o) : impnon.fcm
$(LIB)/io.a(psfres.o) : lonepr.fcm
$(LIB)/io.a(psfres.o) : mmff.fcm
$(LIB)/io.a(psfres.o) : param.fcm
$(LIB)/io.a(psfres.o) : psf.fcm
$(LIB)/io.a(psfres.o) : stream.fcm
#
#
$(LIB)/io.a(rtfio.o) : actclus.fcm
$(LIB)/io.a(rtfio.o) : comand.fcm
$(LIB)/io.a(rtfio.o) : dimens.fcm
$(LIB)/io.a(rtfio.o) : exfunc.fcm
$(LIB)/io.a(rtfio.o) : ffield.fcm
$(LIB)/io.a(rtfio.o) : impnon.fcm
$(LIB)/io.a(rtfio.o) : mmff.fcm
$(LIB)/io.a(rtfio.o) : rtf.fcm
$(LIB)/io.a(rtfio.o) : stream.fcm
$(LIB)/io.a(rtfio.o) : string.fcm
#
#
$(LIB)/io.a(trajio.o) : bases.fcm
$(LIB)/io.a(trajio.o) : comand.fcm
$(LIB)/io.a(trajio.o) : ctitla.fcm
$(LIB)/io.a(trajio.o) : dimens.fcm
$(LIB)/io.a(trajio.o) : exfunc.fcm
$(LIB)/io.a(trajio.o) : heap.fcm
$(LIB)/io.a(trajio.o) : image.fcm
$(LIB)/io.a(trajio.o) : impnon.fcm
$(LIB)/io.a(trajio.o) : psf.fcm
$(LIB)/io.a(trajio.o) : stream.fcm
$(LIB)/io.a(trajio.o) : traj.fcm
#
#
$(LIB)/io.a(univio.o) : comand.fcm
$(LIB)/io.a(univio.o) : ctitla.fcm
$(LIB)/io.a(univio.o) : dimens.fcm
$(LIB)/io.a(univio.o) : exfunc.fcm
$(LIB)/io.a(univio.o) : impnon.fcm
$(LIB)/io.a(univio.o) : stream.fcm
$(LIB)/io.a(univio.o) : univ.fcm
#
