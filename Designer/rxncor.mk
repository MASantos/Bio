# rxncor makefile
# rxncor library rules
OBJS_rxncor= \
	$(LIB)/rxncor.a(adiab.o) \
	$(LIB)/rxncor.a(lupopt.o) \
	$(LIB)/rxncor.a(path.o) \
	$(LIB)/rxncor.a(rxndef.o) \
	$(LIB)/rxncor.a(rxnene.o) \
	$(LIB)/rxncor.a(travel.o) \
	$(LIB)/rxncor.a(travel2.o)
#
$(LIB)/rxncor.a : $(OBJS_rxncor)
	$(RANLIB) $(LIB)/rxncor.a
	@echo rxncor COMPLETED
#
# rxncor source file rules
$(LIB)/rxncor.a(adiab.o)  : $(SRC)/rxncor/adiab.src
	$(FLX) $(SRC)/rxncor/adiab.src
	$(FC2) adiab.f
	ar rucv $(LIB)/rxncor.a adiab.o
	rm adiab.f
	rm adiab.o
#
$(LIB)/rxncor.a(lupopt.o)  : $(SRC)/rxncor/lupopt.src
	$(FLX) $(SRC)/rxncor/lupopt.src
	$(FC2) lupopt.f
	ar rucv $(LIB)/rxncor.a lupopt.o
	rm lupopt.f
	rm lupopt.o
#
$(LIB)/rxncor.a(path.o)  : $(SRC)/rxncor/path.src
	$(FLX) $(SRC)/rxncor/path.src
	$(FC2) path.f
	ar rucv $(LIB)/rxncor.a path.o
	rm path.f
	rm path.o
#
$(LIB)/rxncor.a(rxndef.o)  : $(SRC)/rxncor/rxndef.src
	$(FLX) $(SRC)/rxncor/rxndef.src
	$(FC2) rxndef.f
	ar rucv $(LIB)/rxncor.a rxndef.o
	rm rxndef.f
	rm rxndef.o
#
$(LIB)/rxncor.a(rxnene.o)  : $(SRC)/rxncor/rxnene.src
	$(FLX) $(SRC)/rxncor/rxnene.src
	$(FC2) rxnene.f
	ar rucv $(LIB)/rxncor.a rxnene.o
	rm rxnene.f
	rm rxnene.o
#
$(LIB)/rxncor.a(travel.o)  : $(SRC)/rxncor/travel.src
	$(FLX) $(SRC)/rxncor/travel.src
	$(FC0) travel.f
	ar rucv $(LIB)/rxncor.a travel.o
	rm travel.f
	rm travel.o
#
$(LIB)/rxncor.a(travel2.o)  : $(SRC)/rxncor/travel2.src
	$(FLX) $(SRC)/rxncor/travel2.src
	$(FC0) travel2.f
	ar rucv $(LIB)/rxncor.a travel2.o
	rm travel2.f
	rm travel2.o
#
#
# rxncor dependency file
#
$(LIB)/rxncor.a(adiab.o) : consta.fcm
$(LIB)/rxncor.a(adiab.o) : contrl.fcm
$(LIB)/rxncor.a(adiab.o) : coord.fcm
$(LIB)/rxncor.a(adiab.o) : deriv.fcm
$(LIB)/rxncor.a(adiab.o) : dimens.fcm
$(LIB)/rxncor.a(adiab.o) : energy.fcm
$(LIB)/rxncor.a(adiab.o) : exfunc.fcm
$(LIB)/rxncor.a(adiab.o) : heap.fcm
$(LIB)/rxncor.a(adiab.o) : impnon.fcm
$(LIB)/rxncor.a(adiab.o) : number.fcm
$(LIB)/rxncor.a(adiab.o) : stack.fcm
#
#
$(LIB)/rxncor.a(lupopt.o) : bases.fcm
$(LIB)/rxncor.a(lupopt.o) : comand.fcm
$(LIB)/rxncor.a(lupopt.o) : coord.fcm
$(LIB)/rxncor.a(lupopt.o) : coordc.fcm
$(LIB)/rxncor.a(lupopt.o) : ctitla.fcm
$(LIB)/rxncor.a(lupopt.o) : deriv.fcm
$(LIB)/rxncor.a(lupopt.o) : dimens.fcm
$(LIB)/rxncor.a(lupopt.o) : energy.fcm
$(LIB)/rxncor.a(lupopt.o) : exfunc.fcm
$(LIB)/rxncor.a(lupopt.o) : hbond.fcm
$(LIB)/rxncor.a(lupopt.o) : heap.fcm
$(LIB)/rxncor.a(lupopt.o) : image.fcm
$(LIB)/rxncor.a(lupopt.o) : impnon.fcm
$(LIB)/rxncor.a(lupopt.o) : inbnd.fcm
$(LIB)/rxncor.a(lupopt.o) : lupcom.fcm
$(LIB)/rxncor.a(lupopt.o) : number.fcm
$(LIB)/rxncor.a(lupopt.o) : psf.fcm
$(LIB)/rxncor.a(lupopt.o) : stack.fcm
$(LIB)/rxncor.a(lupopt.o) : stream.fcm
#
#
$(LIB)/rxncor.a(path.o) : bases.fcm
$(LIB)/rxncor.a(path.o) : deriv.fcm
$(LIB)/rxncor.a(path.o) : dimens.fcm
$(LIB)/rxncor.a(path.o) : energy.fcm
$(LIB)/rxncor.a(path.o) : exfunc.fcm
$(LIB)/rxncor.a(path.o) : heap.fcm
$(LIB)/rxncor.a(path.o) : impnon.fcm
$(LIB)/rxncor.a(path.o) : number.fcm
$(LIB)/rxncor.a(path.o) : psf.fcm
$(LIB)/rxncor.a(path.o) : stack.fcm
$(LIB)/rxncor.a(path.o) : stream.fcm
#
#
$(LIB)/rxncor.a(rxndef.o) : comand.fcm
$(LIB)/rxncor.a(rxndef.o) : consta.fcm
$(LIB)/rxncor.a(rxndef.o) : coord.fcm
$(LIB)/rxncor.a(rxndef.o) : dimens.fcm
$(LIB)/rxncor.a(rxndef.o) : exfunc.fcm
$(LIB)/rxncor.a(rxndef.o) : heap.fcm
$(LIB)/rxncor.a(rxndef.o) : impnon.fcm
$(LIB)/rxncor.a(rxndef.o) : number.fcm
$(LIB)/rxncor.a(rxndef.o) : psf.fcm
$(LIB)/rxncor.a(rxndef.o) : reawri.fcm
$(LIB)/rxncor.a(rxndef.o) : rxncom.fcm
$(LIB)/rxncor.a(rxndef.o) : stack.fcm
$(LIB)/rxncor.a(rxndef.o) : stream.fcm
#
#
$(LIB)/rxncor.a(rxnene.o) : consta.fcm
$(LIB)/rxncor.a(rxnene.o) : coord.fcm
$(LIB)/rxncor.a(rxnene.o) : deriv.fcm
$(LIB)/rxncor.a(rxnene.o) : dimens.fcm
$(LIB)/rxncor.a(rxnene.o) : exfunc.fcm
$(LIB)/rxncor.a(rxnene.o) : heap.fcm
$(LIB)/rxncor.a(rxnene.o) : impnon.fcm
$(LIB)/rxncor.a(rxnene.o) : number.fcm
$(LIB)/rxncor.a(rxnene.o) : rxncom.fcm
$(LIB)/rxncor.a(rxnene.o) : stream.fcm
#
#
$(LIB)/rxncor.a(travel.o) : comand.fcm
$(LIB)/rxncor.a(travel.o) : consta.fcm
$(LIB)/rxncor.a(travel.o) : contrl.fcm
$(LIB)/rxncor.a(travel.o) : coord.fcm
$(LIB)/rxncor.a(travel.o) : coordc.fcm
$(LIB)/rxncor.a(travel.o) : ctitla.fcm
$(LIB)/rxncor.a(travel.o) : deriv.fcm
$(LIB)/rxncor.a(travel.o) : dimens.fcm
$(LIB)/rxncor.a(travel.o) : energy.fcm
$(LIB)/rxncor.a(travel.o) : exfunc.fcm
$(LIB)/rxncor.a(travel.o) : heap.fcm
$(LIB)/rxncor.a(travel.o) : image.fcm
$(LIB)/rxncor.a(travel.o) : impnon.fcm
$(LIB)/rxncor.a(travel.o) : number.fcm
$(LIB)/rxncor.a(travel.o) : psf.fcm
$(LIB)/rxncor.a(travel.o) : stack.fcm
$(LIB)/rxncor.a(travel.o) : stream.fcm
$(LIB)/rxncor.a(travel.o) : travel.fcm
#
#
$(LIB)/rxncor.a(travel2.o) : bases.fcm
$(LIB)/rxncor.a(travel2.o) : consta.fcm
$(LIB)/rxncor.a(travel2.o) : contrl.fcm
$(LIB)/rxncor.a(travel2.o) : coord.fcm
$(LIB)/rxncor.a(travel2.o) : deriv.fcm
$(LIB)/rxncor.a(travel2.o) : dimens.fcm
$(LIB)/rxncor.a(travel2.o) : energy.fcm
$(LIB)/rxncor.a(travel2.o) : exfunc.fcm
$(LIB)/rxncor.a(travel2.o) : heap.fcm
$(LIB)/rxncor.a(travel2.o) : image.fcm
$(LIB)/rxncor.a(travel2.o) : impnon.fcm
$(LIB)/rxncor.a(travel2.o) : number.fcm
$(LIB)/rxncor.a(travel2.o) : psf.fcm
$(LIB)/rxncor.a(travel2.o) : stack.fcm
$(LIB)/rxncor.a(travel2.o) : stream.fcm
$(LIB)/rxncor.a(travel2.o) : travel.fcm
#
