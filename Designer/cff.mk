# cff makefile
# cff library rules
OBJS_cff= \
	$(LIB)/cff.a(codes_cff.o) \
	$(LIB)/cff.a(efscalar_cff.o) \
	$(LIB)/cff.a(enbfast_cff.o) \
	$(LIB)/cff.a(enbonda_cff.o) \
	$(LIB)/cff.a(escalar_cff.o) \
	$(LIB)/cff.a(ewald_cff.o) \
	$(LIB)/cff.a(parrdr_cff.o)
#
$(LIB)/cff.a : $(OBJS_cff)
	$(RANLIB) $(LIB)/cff.a
	@echo cff COMPLETED
#
# cff source file rules
$(LIB)/cff.a(codes_cff.o)  : $(SRC)/cff/codes_cff.src
	$(FLX) $(SRC)/cff/codes_cff.src
	$(FC2) codes_cff.f
	ar rucv $(LIB)/cff.a codes_cff.o
	rm codes_cff.f
	rm codes_cff.o
#
$(LIB)/cff.a(efscalar_cff.o)  : $(SRC)/cff/efscalar_cff.src
	$(FLX) $(SRC)/cff/efscalar_cff.src
	$(FC2) efscalar_cff.f
	ar rucv $(LIB)/cff.a efscalar_cff.o
	rm efscalar_cff.f
	rm efscalar_cff.o
#
$(LIB)/cff.a(enbfast_cff.o)  : $(SRC)/cff/enbfast_cff.src
	$(FLX) $(SRC)/cff/enbfast_cff.src
	$(FC2) enbfast_cff.f
	ar rucv $(LIB)/cff.a enbfast_cff.o
	rm enbfast_cff.f
	rm enbfast_cff.o
#
$(LIB)/cff.a(enbonda_cff.o)  : $(SRC)/cff/enbonda_cff.src
	$(FLX) $(SRC)/cff/enbonda_cff.src
	$(FC2) enbonda_cff.f
	ar rucv $(LIB)/cff.a enbonda_cff.o
	rm enbonda_cff.f
	rm enbonda_cff.o
#
$(LIB)/cff.a(escalar_cff.o)  : $(SRC)/cff/escalar_cff.src
	$(FLX) $(SRC)/cff/escalar_cff.src
	$(FC2) escalar_cff.f
	ar rucv $(LIB)/cff.a escalar_cff.o
	rm escalar_cff.f
	rm escalar_cff.o
#
$(LIB)/cff.a(ewald_cff.o)  : $(SRC)/cff/ewald_cff.src
	$(FLX) $(SRC)/cff/ewald_cff.src
	$(FC2) ewald_cff.f
	ar rucv $(LIB)/cff.a ewald_cff.o
	rm ewald_cff.f
	rm ewald_cff.o
#
$(LIB)/cff.a(parrdr_cff.o)  : $(SRC)/cff/parrdr_cff.src
	$(FLX) $(SRC)/cff/parrdr_cff.src
	$(FC2) parrdr_cff.f
	ar rucv $(LIB)/cff.a parrdr_cff.o
	rm parrdr_cff.f
	rm parrdr_cff.o
#
#
# cff dependency file
#
$(LIB)/cff.a(codes_cff.o) : cff.fcm
$(LIB)/cff.a(codes_cff.o) : code.fcm
$(LIB)/cff.a(codes_cff.o) : coord.fcm
$(LIB)/cff.a(codes_cff.o) : deriv.fcm
$(LIB)/cff.a(codes_cff.o) : dimens.fcm
$(LIB)/cff.a(codes_cff.o) : exfunc.fcm
$(LIB)/cff.a(codes_cff.o) : impnon.fcm
$(LIB)/cff.a(codes_cff.o) : mmff.fcm
$(LIB)/cff.a(codes_cff.o) : number.fcm
$(LIB)/cff.a(codes_cff.o) : param.fcm
$(LIB)/cff.a(codes_cff.o) : psf.fcm
#
#
$(LIB)/cff.a(efscalar_cff.o) : cff.fcm
$(LIB)/cff.a(efscalar_cff.o) : code.fcm
$(LIB)/cff.a(efscalar_cff.o) : consta.fcm
$(LIB)/cff.a(efscalar_cff.o) : coord.fcm
$(LIB)/cff.a(efscalar_cff.o) : deriv.fcm
$(LIB)/cff.a(efscalar_cff.o) : dimens.fcm
$(LIB)/cff.a(efscalar_cff.o) : energy.fcm
$(LIB)/cff.a(efscalar_cff.o) : fast.fcm
$(LIB)/cff.a(efscalar_cff.o) : number.fcm
$(LIB)/cff.a(efscalar_cff.o) : param.fcm
$(LIB)/cff.a(efscalar_cff.o) : psf.fcm
#
#
$(LIB)/cff.a(enbfast_cff.o) : block.fcm
$(LIB)/cff.a(enbfast_cff.o) : consta.fcm
$(LIB)/cff.a(enbfast_cff.o) : coord.fcm
$(LIB)/cff.a(enbfast_cff.o) : deriv.fcm
$(LIB)/cff.a(enbfast_cff.o) : dimens.fcm
$(LIB)/cff.a(enbfast_cff.o) : exfunc.fcm
$(LIB)/cff.a(enbfast_cff.o) : galgor.fcm
$(LIB)/cff.a(enbfast_cff.o) : heap.fcm
$(LIB)/cff.a(enbfast_cff.o) : impnon.fcm
$(LIB)/cff.a(enbfast_cff.o) : inbnd.fcm
$(LIB)/cff.a(enbfast_cff.o) : lambda.fcm
$(LIB)/cff.a(enbfast_cff.o) : number.fcm
$(LIB)/cff.a(enbfast_cff.o) : param.fcm
$(LIB)/cff.a(enbfast_cff.o) : pbound.fcm
$(LIB)/cff.a(enbfast_cff.o) : tbmts.fcm
#
#
$(LIB)/cff.a(enbonda_cff.o) : block.fcm
$(LIB)/cff.a(enbonda_cff.o) : cff.fcm
$(LIB)/cff.a(enbonda_cff.o) : consta.fcm
$(LIB)/cff.a(enbonda_cff.o) : dimb.fcm
$(LIB)/cff.a(enbonda_cff.o) : dimens.fcm
$(LIB)/cff.a(enbonda_cff.o) : econt.fcm
$(LIB)/cff.a(enbonda_cff.o) : euler.fcm
$(LIB)/cff.a(enbonda_cff.o) : ewald.fcm
$(LIB)/cff.a(enbonda_cff.o) : exfunc.fcm
$(LIB)/cff.a(enbonda_cff.o) : fourd.fcm
$(LIB)/cff.a(enbonda_cff.o) : heap.fcm
$(LIB)/cff.a(enbonda_cff.o) : impnon.fcm
$(LIB)/cff.a(enbonda_cff.o) : lambda.fcm
$(LIB)/cff.a(enbonda_cff.o) : number.fcm
$(LIB)/cff.a(enbonda_cff.o) : pbound.fcm
$(LIB)/cff.a(enbonda_cff.o) : stream.fcm
#
#
$(LIB)/cff.a(escalar_cff.o) : cff.fcm
$(LIB)/cff.a(escalar_cff.o) : consta.fcm
$(LIB)/cff.a(escalar_cff.o) : dimens.fcm
$(LIB)/cff.a(escalar_cff.o) : energy.fcm
$(LIB)/cff.a(escalar_cff.o) : impnon.fcm
$(LIB)/cff.a(escalar_cff.o) : number.fcm
$(LIB)/cff.a(escalar_cff.o) : param.fcm
#
#
$(LIB)/cff.a(ewald_cff.o) : consta.fcm
$(LIB)/cff.a(ewald_cff.o) : dimens.fcm
$(LIB)/cff.a(ewald_cff.o) : ewald.fcm
$(LIB)/cff.a(ewald_cff.o) : heap.fcm
$(LIB)/cff.a(ewald_cff.o) : impnon.fcm
$(LIB)/cff.a(ewald_cff.o) : inbnd.fcm
$(LIB)/cff.a(ewald_cff.o) : number.fcm
$(LIB)/cff.a(ewald_cff.o) : param.fcm
#
#
$(LIB)/cff.a(parrdr_cff.o) : cff.fcm
$(LIB)/cff.a(parrdr_cff.o) : consta.fcm
$(LIB)/cff.a(parrdr_cff.o) : dimens.fcm
$(LIB)/cff.a(parrdr_cff.o) : energy.fcm
$(LIB)/cff.a(parrdr_cff.o) : exfunc.fcm
$(LIB)/cff.a(parrdr_cff.o) : impnon.fcm
$(LIB)/cff.a(parrdr_cff.o) : number.fcm
$(LIB)/cff.a(parrdr_cff.o) : param.fcm
$(LIB)/cff.a(parrdr_cff.o) : psf.fcm
$(LIB)/cff.a(parrdr_cff.o) : rtf.fcm
$(LIB)/cff.a(parrdr_cff.o) : stream.fcm
#
