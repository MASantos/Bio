# shapes makefile
# shapes library rules
OBJS_shapes= \
	$(LIB)/shapes.a(eshape.o) \
	$(LIB)/shapes.a(mdlio.o) \
	$(LIB)/shapes.a(shapedyn.o) \
	$(LIB)/shapes.a(shapes.o)
#
$(LIB)/shapes.a : $(OBJS_shapes)
	$(RANLIB) $(LIB)/shapes.a
	@echo shapes COMPLETED
#
# shapes source file rules
$(LIB)/shapes.a(eshape.o)  : $(SRC)/shapes/eshape.src
	$(FLX) $(SRC)/shapes/eshape.src
	$(FC2) eshape.f
	ar rucv $(LIB)/shapes.a eshape.o
	rm eshape.f
	rm eshape.o
#
$(LIB)/shapes.a(mdlio.o)  : $(SRC)/shapes/mdlio.src
	$(FLX) $(SRC)/shapes/mdlio.src
	$(FC2) mdlio.f
	ar rucv $(LIB)/shapes.a mdlio.o
	rm mdlio.f
	rm mdlio.o
#
$(LIB)/shapes.a(shapedyn.o)  : $(SRC)/shapes/shapedyn.src
	$(FLX) $(SRC)/shapes/shapedyn.src
	$(FC2) shapedyn.f
	ar rucv $(LIB)/shapes.a shapedyn.o
	rm shapedyn.f
	rm shapedyn.o
#
$(LIB)/shapes.a(shapes.o)  : $(SRC)/shapes/shapes.src
	$(FLX) $(SRC)/shapes/shapes.src
	$(FC2) shapes.f
	ar rucv $(LIB)/shapes.a shapes.o
	rm shapes.f
	rm shapes.o
#
#
# shapes dependency file
#
$(LIB)/shapes.a(eshape.o) : dimens.fcm
$(LIB)/shapes.a(eshape.o) : exfunc.fcm
$(LIB)/shapes.a(eshape.o) : heap.fcm
$(LIB)/shapes.a(eshape.o) : impnon.fcm
$(LIB)/shapes.a(eshape.o) : number.fcm
$(LIB)/shapes.a(eshape.o) : psf.fcm
$(LIB)/shapes.a(eshape.o) : shapes.fcm
$(LIB)/shapes.a(eshape.o) : stack.fcm
$(LIB)/shapes.a(eshape.o) : stream.fcm
#
#
$(LIB)/shapes.a(mdlio.o) : coord.fcm
$(LIB)/shapes.a(mdlio.o) : ctitla.fcm
$(LIB)/shapes.a(mdlio.o) : dimens.fcm
$(LIB)/shapes.a(mdlio.o) : exfunc.fcm
$(LIB)/shapes.a(mdlio.o) : impnon.fcm
$(LIB)/shapes.a(mdlio.o) : mmff.fcm
$(LIB)/shapes.a(mdlio.o) : number.fcm
$(LIB)/shapes.a(mdlio.o) : psf.fcm
$(LIB)/shapes.a(mdlio.o) : rtf.fcm
$(LIB)/shapes.a(mdlio.o) : stream.fcm
#
#
$(LIB)/shapes.a(shapedyn.o) : consta.fcm
$(LIB)/shapes.a(shapedyn.o) : exfunc.fcm
$(LIB)/shapes.a(shapedyn.o) : impnon.fcm
$(LIB)/shapes.a(shapedyn.o) : number.fcm
$(LIB)/shapes.a(shapedyn.o) : parallel.fcm
$(LIB)/shapes.a(shapedyn.o) : stream.fcm
#
#
$(LIB)/shapes.a(shapes.o) : coord.fcm
$(LIB)/shapes.a(shapes.o) : coordc.fcm
$(LIB)/shapes.a(shapes.o) : corman.fcm
$(LIB)/shapes.a(shapes.o) : ctitla.fcm
$(LIB)/shapes.a(shapes.o) : dimens.fcm
$(LIB)/shapes.a(shapes.o) : exfunc.fcm
$(LIB)/shapes.a(shapes.o) : heap.fcm
$(LIB)/shapes.a(shapes.o) : impnon.fcm
$(LIB)/shapes.a(shapes.o) : number.fcm
$(LIB)/shapes.a(shapes.o) : psf.fcm
$(LIB)/shapes.a(shapes.o) : shapes.fcm
$(LIB)/shapes.a(shapes.o) : stack.fcm
$(LIB)/shapes.a(shapes.o) : stream.fcm
#
