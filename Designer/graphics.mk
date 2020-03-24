# graphics makefile
# graphics library rules
OBJS_graphics= \
	$(LIB)/graphics.a(apodraw.o) \
	$(LIB)/graphics.a(apograph.o) \
	$(LIB)/graphics.a(drawit.o) \
	$(LIB)/graphics.a(graphx.o) \
	$(LIB)/graphics.a(grutil.o) \
	$(LIB)/graphics.a(povdfn.o) \
	$(LIB)/graphics.a(psdraw.o)
#
$(LIB)/graphics.a : $(OBJS_graphics)
	$(RANLIB) $(LIB)/graphics.a
	@echo graphics COMPLETED
#
# graphics source file rules
$(LIB)/graphics.a(apodraw.o)  : $(SRC)/graphics/apodraw.src
	$(FLX) $(SRC)/graphics/apodraw.src
	$(FC2) apodraw.f
	ar rucv $(LIB)/graphics.a apodraw.o
	rm apodraw.f
	rm apodraw.o
#
$(LIB)/graphics.a(apograph.o)  : $(SRC)/graphics/apograph.src
	$(FLX) $(SRC)/graphics/apograph.src
	$(FC2) apograph.f
	ar rucv $(LIB)/graphics.a apograph.o
	rm apograph.f
	rm apograph.o
#
$(LIB)/graphics.a(drawit.o)  : $(SRC)/graphics/drawit.src
	$(FLX) $(SRC)/graphics/drawit.src
	$(FC2) drawit.f
	ar rucv $(LIB)/graphics.a drawit.o
	rm drawit.f
	rm drawit.o
#
$(LIB)/graphics.a(graphx.o)  : $(SRC)/graphics/graphx.src
	$(FLX) $(SRC)/graphics/graphx.src
	$(FC2) graphx.f
	ar rucv $(LIB)/graphics.a graphx.o
	rm graphx.f
	rm graphx.o
#
$(LIB)/graphics.a(grutil.o)  : $(SRC)/graphics/grutil.src
	$(FLX) $(SRC)/graphics/grutil.src
	$(FC2) grutil.f
	ar rucv $(LIB)/graphics.a grutil.o
	rm grutil.f
	rm grutil.o
#
$(LIB)/graphics.a(povdfn.o)  : $(SRC)/graphics/povdfn.src
	$(FLX) $(SRC)/graphics/povdfn.src
	$(FC2) povdfn.f
	ar rucv $(LIB)/graphics.a povdfn.o
	rm povdfn.f
	rm povdfn.o
#
$(LIB)/graphics.a(psdraw.o)  : $(SRC)/graphics/psdraw.src
	$(FLX) $(SRC)/graphics/psdraw.src
	$(FC2) psdraw.f
	ar rucv $(LIB)/graphics.a psdraw.o
	rm psdraw.f
	rm psdraw.o
#
#
# graphics dependency file
#
$(LIB)/graphics.a(apodraw.o) : dimens.fcm
$(LIB)/graphics.a(apodraw.o) : graph.fcm
$(LIB)/graphics.a(apodraw.o) : hbond.fcm
$(LIB)/graphics.a(apodraw.o) : impnon.fcm
$(LIB)/graphics.a(apodraw.o) : stream.fcm
$(LIB)/graphics.a(apodraw.o) : xdraw.fcm
#
#
$(LIB)/graphics.a(apograph.o) : dimens.fcm
$(LIB)/graphics.a(apograph.o) : graph.fcm
$(LIB)/graphics.a(apograph.o) : impnon.fcm
$(LIB)/graphics.a(apograph.o) : stream.fcm
$(LIB)/graphics.a(apograph.o) : xdraw.fcm
#
#
$(LIB)/graphics.a(drawit.o) : comand.fcm
$(LIB)/graphics.a(drawit.o) : dimens.fcm
$(LIB)/graphics.a(drawit.o) : exfunc.fcm
$(LIB)/graphics.a(drawit.o) : graph.fcm
$(LIB)/graphics.a(drawit.o) : heap.fcm
$(LIB)/graphics.a(drawit.o) : impnon.fcm
$(LIB)/graphics.a(drawit.o) : psf.fcm
$(LIB)/graphics.a(drawit.o) : stack.fcm
$(LIB)/graphics.a(drawit.o) : stream.fcm
#
#
$(LIB)/graphics.a(graphx.o) : comand.fcm
$(LIB)/graphics.a(graphx.o) : consta.fcm
$(LIB)/graphics.a(graphx.o) : coord.fcm
$(LIB)/graphics.a(graphx.o) : coordc.fcm
$(LIB)/graphics.a(graphx.o) : ctitla.fcm
$(LIB)/graphics.a(graphx.o) : dimens.fcm
$(LIB)/graphics.a(graphx.o) : exfunc.fcm
$(LIB)/graphics.a(graphx.o) : graph.fcm
$(LIB)/graphics.a(graphx.o) : hbond.fcm
$(LIB)/graphics.a(graphx.o) : heap.fcm
$(LIB)/graphics.a(graphx.o) : impnon.fcm
$(LIB)/graphics.a(graphx.o) : param.fcm
$(LIB)/graphics.a(graphx.o) : psf.fcm
$(LIB)/graphics.a(graphx.o) : stream.fcm
$(LIB)/graphics.a(graphx.o) : xdraw.fcm
#
#
$(LIB)/graphics.a(grutil.o) : dimens.fcm
$(LIB)/graphics.a(grutil.o) : graph.fcm
$(LIB)/graphics.a(grutil.o) : impnon.fcm
$(LIB)/graphics.a(grutil.o) : stream.fcm
#
#
$(LIB)/graphics.a(povdfn.o) : corman.fcm
$(LIB)/graphics.a(povdfn.o) : dimens.fcm
$(LIB)/graphics.a(povdfn.o) : exfunc.fcm
$(LIB)/graphics.a(povdfn.o) : graph.fcm
$(LIB)/graphics.a(povdfn.o) : hbond.fcm
$(LIB)/graphics.a(povdfn.o) : image.fcm
$(LIB)/graphics.a(povdfn.o) : impnon.fcm
$(LIB)/graphics.a(povdfn.o) : number.fcm
$(LIB)/graphics.a(povdfn.o) : stream.fcm
#
#
$(LIB)/graphics.a(psdraw.o) : dimens.fcm
$(LIB)/graphics.a(psdraw.o) : exfunc.fcm
$(LIB)/graphics.a(psdraw.o) : graph.fcm
$(LIB)/graphics.a(psdraw.o) : hbond.fcm
$(LIB)/graphics.a(psdraw.o) : impnon.fcm
$(LIB)/graphics.a(psdraw.o) : stream.fcm
#
