# correl makefile
# correl library rules
OBJS_correl= \
	$(LIB)/correl.a(anacor.o) \
	$(LIB)/correl.a(clustr.o) \
	$(LIB)/correl.a(cordyn.o) \
	$(LIB)/correl.a(corfun.o) \
	$(LIB)/correl.a(correl.o) \
	$(LIB)/correl.a(corrio.o) \
	$(LIB)/correl.a(mancor.o) \
	$(LIB)/correl.a(mantim.o) \
	$(LIB)/correl.a(solana.o)
#
$(LIB)/correl.a : $(OBJS_correl)
	$(RANLIB) $(LIB)/correl.a
	@echo correl COMPLETED
#
# correl source file rules
$(LIB)/correl.a(anacor.o)  : $(SRC)/correl/anacor.src
	$(FLX) $(SRC)/correl/anacor.src
	$(FC2) anacor.f
	ar rucv $(LIB)/correl.a anacor.o
	rm anacor.f
	rm anacor.o
#
$(LIB)/correl.a(clustr.o)  : $(SRC)/correl/clustr.src
	$(FLX) $(SRC)/correl/clustr.src
	$(FC2) clustr.f
	ar rucv $(LIB)/correl.a clustr.o
	rm clustr.f
	rm clustr.o
#
$(LIB)/correl.a(cordyn.o)  : $(SRC)/correl/cordyn.src
	$(FLX) $(SRC)/correl/cordyn.src
	$(FC2) cordyn.f
	ar rucv $(LIB)/correl.a cordyn.o
	rm cordyn.f
	rm cordyn.o
#
$(LIB)/correl.a(corfun.o)  : $(SRC)/correl/corfun.src
	$(FLX) $(SRC)/correl/corfun.src
	$(FC2) corfun.f
	ar rucv $(LIB)/correl.a corfun.o
	rm corfun.f
	rm corfun.o
#
$(LIB)/correl.a(correl.o)  : $(SRC)/correl/correl.src
	$(FLX) $(SRC)/correl/correl.src
	$(FC2) correl.f
	ar rucv $(LIB)/correl.a correl.o
	rm correl.f
	rm correl.o
#
$(LIB)/correl.a(corrio.o)  : $(SRC)/correl/corrio.src
	$(FLX) $(SRC)/correl/corrio.src
	$(FC2) corrio.f
	ar rucv $(LIB)/correl.a corrio.o
	rm corrio.f
	rm corrio.o
#
$(LIB)/correl.a(mancor.o)  : $(SRC)/correl/mancor.src
	$(FLX) $(SRC)/correl/mancor.src
	$(FC2) mancor.f
	ar rucv $(LIB)/correl.a mancor.o
	rm mancor.f
	rm mancor.o
#
$(LIB)/correl.a(mantim.o)  : $(SRC)/correl/mantim.src
	$(FLX) $(SRC)/correl/mantim.src
	$(FC2) mantim.f
	ar rucv $(LIB)/correl.a mantim.o
	rm mantim.f
	rm mantim.o
#
$(LIB)/correl.a(solana.o)  : $(SRC)/correl/solana.src
	$(FLX) $(SRC)/correl/solana.src
	$(FC1) solana.f
	ar rucv $(LIB)/correl.a solana.o
	rm solana.f
	rm solana.o
#
#
# correl dependency file
#
$(LIB)/correl.a(anacor.o) : bases.fcm
$(LIB)/correl.a(anacor.o) : code.fcm
$(LIB)/correl.a(anacor.o) : consta.fcm
$(LIB)/correl.a(anacor.o) : coord.fcm
$(LIB)/correl.a(anacor.o) : ctitla.fcm
$(LIB)/correl.a(anacor.o) : deriv.fcm
$(LIB)/correl.a(anacor.o) : dimens.fcm
$(LIB)/correl.a(anacor.o) : energy.fcm
$(LIB)/correl.a(anacor.o) : exfunc.fcm
$(LIB)/correl.a(anacor.o) : fourd.fcm
$(LIB)/correl.a(anacor.o) : hbond.fcm
$(LIB)/correl.a(anacor.o) : heap.fcm
$(LIB)/correl.a(anacor.o) : image.fcm
$(LIB)/correl.a(anacor.o) : impnon.fcm
$(LIB)/correl.a(anacor.o) : number.fcm
$(LIB)/correl.a(anacor.o) : param.fcm
$(LIB)/correl.a(anacor.o) : psf.fcm
$(LIB)/correl.a(anacor.o) : stack.fcm
$(LIB)/correl.a(anacor.o) : stream.fcm
#
#
$(LIB)/correl.a(clustr.o) : comand.fcm
$(LIB)/correl.a(clustr.o) : cstack.fcm
$(LIB)/correl.a(clustr.o) : dimens.fcm
$(LIB)/correl.a(clustr.o) : exfunc.fcm
$(LIB)/correl.a(clustr.o) : heap.fcm
$(LIB)/correl.a(clustr.o) : impnon.fcm
$(LIB)/correl.a(clustr.o) : number.fcm
$(LIB)/correl.a(clustr.o) : stack.fcm
$(LIB)/correl.a(clustr.o) : stream.fcm
#
#
$(LIB)/correl.a(cordyn.o) : impnon.fcm
$(LIB)/correl.a(cordyn.o) : number.fcm
#
#
$(LIB)/correl.a(corfun.o) : consta.fcm
$(LIB)/correl.a(corfun.o) : impnon.fcm
$(LIB)/correl.a(corfun.o) : number.fcm
#
#
$(LIB)/correl.a(correl.o) : comand.fcm
$(LIB)/correl.a(correl.o) : consta.fcm
$(LIB)/correl.a(correl.o) : coord.fcm
$(LIB)/correl.a(correl.o) : coordc.fcm
$(LIB)/correl.a(correl.o) : cstack.fcm
$(LIB)/correl.a(correl.o) : ctitla.fcm
$(LIB)/correl.a(correl.o) : dimens.fcm
$(LIB)/correl.a(correl.o) : exfunc.fcm
$(LIB)/correl.a(correl.o) : heap.fcm
$(LIB)/correl.a(correl.o) : impnon.fcm
$(LIB)/correl.a(correl.o) : number.fcm
$(LIB)/correl.a(correl.o) : param.fcm
$(LIB)/correl.a(correl.o) : psf.fcm
$(LIB)/correl.a(correl.o) : stack.fcm
$(LIB)/correl.a(correl.o) : stream.fcm
#
#
$(LIB)/correl.a(corrio.o) : comand.fcm
$(LIB)/correl.a(corrio.o) : consta.fcm
$(LIB)/correl.a(corrio.o) : ctitla.fcm
$(LIB)/correl.a(corrio.o) : dimens.fcm
$(LIB)/correl.a(corrio.o) : exfunc.fcm
$(LIB)/correl.a(corrio.o) : impnon.fcm
$(LIB)/correl.a(corrio.o) : number.fcm
$(LIB)/correl.a(corrio.o) : stream.fcm
#
#
$(LIB)/correl.a(mancor.o) : consta.fcm
$(LIB)/correl.a(mancor.o) : impnon.fcm
#
#
$(LIB)/correl.a(mantim.o) : comand.fcm
$(LIB)/correl.a(mantim.o) : consta.fcm
$(LIB)/correl.a(mantim.o) : dimens.fcm
$(LIB)/correl.a(mantim.o) : exfunc.fcm
$(LIB)/correl.a(mantim.o) : heap.fcm
$(LIB)/correl.a(mantim.o) : impnon.fcm
$(LIB)/correl.a(mantim.o) : number.fcm
$(LIB)/correl.a(mantim.o) : stack.fcm
$(LIB)/correl.a(mantim.o) : stream.fcm
#
#
$(LIB)/correl.a(solana.o) : comand.fcm
$(LIB)/correl.a(solana.o) : consta.fcm
$(LIB)/correl.a(solana.o) : coord.fcm
$(LIB)/correl.a(solana.o) : ctitla.fcm
$(LIB)/correl.a(solana.o) : dimens.fcm
$(LIB)/correl.a(solana.o) : exfunc.fcm
$(LIB)/correl.a(solana.o) : heap.fcm
$(LIB)/correl.a(solana.o) : image.fcm
$(LIB)/correl.a(solana.o) : impnon.fcm
$(LIB)/correl.a(solana.o) : number.fcm
$(LIB)/correl.a(solana.o) : param.fcm
$(LIB)/correl.a(solana.o) : psf.fcm
$(LIB)/correl.a(solana.o) : stream.fcm
#
