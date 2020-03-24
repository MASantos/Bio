# molvib makefile
# molvib library rules
OBJS_molvib= \
	$(LIB)/molvib.a(gfdiag.o) \
	$(LIB)/molvib.a(gmat.o) \
	$(LIB)/molvib.a(molinp.o) \
	$(LIB)/molvib.a(molvco.o) \
	$(LIB)/molvib.a(molvib.o) \
	$(LIB)/molvib.a(molvio.o) \
	$(LIB)/molvib.a(molvsb.o) \
	$(LIB)/molvib.a(molvut.o)
#
$(LIB)/molvib.a : $(OBJS_molvib)
	$(RANLIB) $(LIB)/molvib.a
	@echo molvib COMPLETED
#
# molvib source file rules
$(LIB)/molvib.a(gfdiag.o)  : $(SRC)/molvib/gfdiag.src
	$(FLX) $(SRC)/molvib/gfdiag.src
	$(FC2) gfdiag.f
	ar rucv $(LIB)/molvib.a gfdiag.o
	rm gfdiag.f
	rm gfdiag.o
#
$(LIB)/molvib.a(gmat.o)  : $(SRC)/molvib/gmat.src
	$(FLX) $(SRC)/molvib/gmat.src
	$(FC2) gmat.f
	ar rucv $(LIB)/molvib.a gmat.o
	rm gmat.f
	rm gmat.o
#
$(LIB)/molvib.a(molinp.o)  : $(SRC)/molvib/molinp.src
	$(FLX) $(SRC)/molvib/molinp.src
	$(FC2) molinp.f
	ar rucv $(LIB)/molvib.a molinp.o
	rm molinp.f
	rm molinp.o
#
$(LIB)/molvib.a(molvco.o)  : $(SRC)/molvib/molvco.src
	$(FLX) $(SRC)/molvib/molvco.src
	$(FC2) molvco.f
	ar rucv $(LIB)/molvib.a molvco.o
	rm molvco.f
	rm molvco.o
#
$(LIB)/molvib.a(molvib.o)  : $(SRC)/molvib/molvib.src
	$(FLX) $(SRC)/molvib/molvib.src
	$(FC2) molvib.f
	ar rucv $(LIB)/molvib.a molvib.o
	rm molvib.f
	rm molvib.o
#
$(LIB)/molvib.a(molvio.o)  : $(SRC)/molvib/molvio.src
	$(FLX) $(SRC)/molvib/molvio.src
	$(FC2) molvio.f
	ar rucv $(LIB)/molvib.a molvio.o
	rm molvio.f
	rm molvio.o
#
$(LIB)/molvib.a(molvsb.o)  : $(SRC)/molvib/molvsb.src
	$(FLX) $(SRC)/molvib/molvsb.src
	$(FC2) molvsb.f
	ar rucv $(LIB)/molvib.a molvsb.o
	rm molvsb.f
	rm molvsb.o
#
$(LIB)/molvib.a(molvut.o)  : $(SRC)/molvib/molvut.src
	$(FLX) $(SRC)/molvib/molvut.src
	$(FC2) molvut.f
	ar rucv $(LIB)/molvib.a molvut.o
	rm molvut.f
	rm molvut.o
#
#
# molvib dependency file
#
$(LIB)/molvib.a(gfdiag.o) : impnon.fcm
#
#
$(LIB)/molvib.a(gmat.o) : impnon.fcm
#
#
$(LIB)/molvib.a(molinp.o) : impnon.fcm
#
#
$(LIB)/molvib.a(molvco.o) : bases.fcm
$(LIB)/molvib.a(molvco.o) : comand.fcm
$(LIB)/molvib.a(molvco.o) : coord.fcm
$(LIB)/molvib.a(molvco.o) : cstack.fcm
$(LIB)/molvib.a(molvco.o) : deriv.fcm
$(LIB)/molvib.a(molvco.o) : dimens.fcm
$(LIB)/molvib.a(molvco.o) : energy.fcm
$(LIB)/molvib.a(molvco.o) : exfunc.fcm
$(LIB)/molvib.a(molvco.o) : heap.fcm
$(LIB)/molvib.a(molvco.o) : image.fcm
$(LIB)/molvib.a(molvco.o) : impnon.fcm
$(LIB)/molvib.a(molvco.o) : psf.fcm
$(LIB)/molvib.a(molvco.o) : stream.fcm
#
#
$(LIB)/molvib.a(molvib.o) : impnon.fcm
#
#
$(LIB)/molvib.a(molvio.o) : impnon.fcm
$(LIB)/molvib.a(molvio.o) : stream.fcm
#
#
$(LIB)/molvib.a(molvsb.o) : impnon.fcm
#
#
$(LIB)/molvib.a(molvut.o) : impnon.fcm
#
