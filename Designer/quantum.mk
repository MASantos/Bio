# quantum makefile
# quantum library rules
OBJS_quantum= \
	$(LIB)/quantum.a(addlnat.o) \
	$(LIB)/quantum.a(qmdata.o) \
	$(LIB)/quantum.a(qmene.o) \
	$(LIB)/quantum.a(qmjunc.o) \
	$(LIB)/quantum.a(qmnbnd.o) \
	$(LIB)/quantum.a(qmpac.o) \
	$(LIB)/quantum.a(qmset.o)
#
$(LIB)/quantum.a : $(OBJS_quantum)
	$(RANLIB) $(LIB)/quantum.a
	@echo quantum COMPLETED
#
# quantum source file rules
$(LIB)/quantum.a(addlnat.o)  : $(SRC)/quantum/addlnat.src
	$(FLX) $(SRC)/quantum/addlnat.src
	$(FC0) addlnat.f
	ar rucv $(LIB)/quantum.a addlnat.o
	rm addlnat.f
	rm addlnat.o
#
$(LIB)/quantum.a(qmdata.o)  : $(SRC)/quantum/qmdata.src
	$(FLX) $(SRC)/quantum/qmdata.src
	$(FC0) qmdata.f
	ar rucv $(LIB)/quantum.a qmdata.o
	rm qmdata.f
	rm qmdata.o
#
$(LIB)/quantum.a(qmene.o)  : $(SRC)/quantum/qmene.src
	$(FLX) $(SRC)/quantum/qmene.src
	$(FC0) qmene.f
	ar rucv $(LIB)/quantum.a qmene.o
	rm qmene.f
	rm qmene.o
#
$(LIB)/quantum.a(qmjunc.o)  : $(SRC)/quantum/qmjunc.src
	$(FLX) $(SRC)/quantum/qmjunc.src
	$(FC0) qmjunc.f
	ar rucv $(LIB)/quantum.a qmjunc.o
	rm qmjunc.f
	rm qmjunc.o
#
$(LIB)/quantum.a(qmnbnd.o)  : $(SRC)/quantum/qmnbnd.src
	$(FLX) $(SRC)/quantum/qmnbnd.src
	$(FC0) qmnbnd.f
	ar rucv $(LIB)/quantum.a qmnbnd.o
	rm qmnbnd.f
	rm qmnbnd.o
#
$(LIB)/quantum.a(qmpac.o)  : $(SRC)/quantum/qmpac.src
	$(FLX) $(SRC)/quantum/qmpac.src
	$(FC0) qmpac.f
	ar rucv $(LIB)/quantum.a qmpac.o
	rm qmpac.f
	rm qmpac.o
#
$(LIB)/quantum.a(qmset.o)  : $(SRC)/quantum/qmset.src
	$(FLX) $(SRC)/quantum/qmset.src
	$(FC0) qmset.f
	ar rucv $(LIB)/quantum.a qmset.o
	rm qmset.f
	rm qmset.o
#
#
# quantum dependency file
#
$(LIB)/quantum.a(addlnat.o) : cadpac.fcm
$(LIB)/quantum.a(addlnat.o) : comand.fcm
$(LIB)/quantum.a(addlnat.o) : coord.fcm
$(LIB)/quantum.a(addlnat.o) : coordc.fcm
$(LIB)/quantum.a(addlnat.o) : dimens.fcm
$(LIB)/quantum.a(addlnat.o) : exfunc.fcm
$(LIB)/quantum.a(addlnat.o) : gamess.fcm
$(LIB)/quantum.a(addlnat.o) : impnon.fcm
$(LIB)/quantum.a(addlnat.o) : mmff.fcm
$(LIB)/quantum.a(addlnat.o) : number.fcm
$(LIB)/quantum.a(addlnat.o) : param.fcm
$(LIB)/quantum.a(addlnat.o) : psf.fcm
$(LIB)/quantum.a(addlnat.o) : rtf.fcm
$(LIB)/quantum.a(addlnat.o) : stack.fcm
$(LIB)/quantum.a(addlnat.o) : stream.fcm
#
#
$(LIB)/quantum.a(qmdata.o) : am1parm.fcm
$(LIB)/quantum.a(qmdata.o) : impnon.fcm
$(LIB)/quantum.a(qmdata.o) : stream.fcm
#
#
$(LIB)/quantum.a(qmene.o) : am1parm.fcm
$(LIB)/quantum.a(qmene.o) : consta.fcm
$(LIB)/quantum.a(qmene.o) : coord.fcm
$(LIB)/quantum.a(qmene.o) : deriv.fcm
$(LIB)/quantum.a(qmene.o) : dimens.fcm
$(LIB)/quantum.a(qmene.o) : exfunc.fcm
$(LIB)/quantum.a(qmene.o) : heap.fcm
$(LIB)/quantum.a(qmene.o) : impnon.fcm
$(LIB)/quantum.a(qmene.o) : inbnd.fcm
$(LIB)/quantum.a(qmene.o) : nbndqm.fcm
$(LIB)/quantum.a(qmene.o) : number.fcm
$(LIB)/quantum.a(qmene.o) : param.fcm
$(LIB)/quantum.a(qmene.o) : psf.fcm
$(LIB)/quantum.a(qmene.o) : qmlink.fcm
$(LIB)/quantum.a(qmene.o) : quantm.fcm
$(LIB)/quantum.a(qmene.o) : scfblk.fcm
$(LIB)/quantum.a(qmene.o) : sizes.fcm
$(LIB)/quantum.a(qmene.o) : stack.fcm
#
#
$(LIB)/quantum.a(qmjunc.o) : dimens.fcm
$(LIB)/quantum.a(qmjunc.o) : exfunc.fcm
$(LIB)/quantum.a(qmjunc.o) : heap.fcm
$(LIB)/quantum.a(qmjunc.o) : impnon.fcm
$(LIB)/quantum.a(qmjunc.o) : number.fcm
$(LIB)/quantum.a(qmjunc.o) : psf.fcm
$(LIB)/quantum.a(qmjunc.o) : qmlink.fcm
$(LIB)/quantum.a(qmjunc.o) : quantm.fcm
$(LIB)/quantum.a(qmjunc.o) : scfblk.fcm
$(LIB)/quantum.a(qmjunc.o) : sizes.fcm
$(LIB)/quantum.a(qmjunc.o) : stream.fcm
#
#
$(LIB)/quantum.a(qmnbnd.o) : bases.fcm
$(LIB)/quantum.a(qmnbnd.o) : coord.fcm
$(LIB)/quantum.a(qmnbnd.o) : dimens.fcm
$(LIB)/quantum.a(qmnbnd.o) : exfunc.fcm
$(LIB)/quantum.a(qmnbnd.o) : heap.fcm
$(LIB)/quantum.a(qmnbnd.o) : impnon.fcm
$(LIB)/quantum.a(qmnbnd.o) : inbnd.fcm
$(LIB)/quantum.a(qmnbnd.o) : nbndqm.fcm
$(LIB)/quantum.a(qmnbnd.o) : number.fcm
$(LIB)/quantum.a(qmnbnd.o) : psf.fcm
$(LIB)/quantum.a(qmnbnd.o) : qmlink.fcm
$(LIB)/quantum.a(qmnbnd.o) : quantm.fcm
$(LIB)/quantum.a(qmnbnd.o) : sizes.fcm
$(LIB)/quantum.a(qmnbnd.o) : stack.fcm
$(LIB)/quantum.a(qmnbnd.o) : stream.fcm
#
#
$(LIB)/quantum.a(qmpac.o) : consta.fcm
$(LIB)/quantum.a(qmpac.o) : dimens.fcm
$(LIB)/quantum.a(qmpac.o) : impnon.fcm
$(LIB)/quantum.a(qmpac.o) : number.fcm
$(LIB)/quantum.a(qmpac.o) : quantm.fcm
$(LIB)/quantum.a(qmpac.o) : sizes.fcm
#
#
$(LIB)/quantum.a(qmset.o) : am1parm.fcm
$(LIB)/quantum.a(qmset.o) : bases.fcm
$(LIB)/quantum.a(qmset.o) : code.fcm
$(LIB)/quantum.a(qmset.o) : consta.fcm
$(LIB)/quantum.a(qmset.o) : coord.fcm
$(LIB)/quantum.a(qmset.o) : dimens.fcm
$(LIB)/quantum.a(qmset.o) : exfunc.fcm
$(LIB)/quantum.a(qmset.o) : gamess.fcm
$(LIB)/quantum.a(qmset.o) : heap.fcm
$(LIB)/quantum.a(qmset.o) : impnon.fcm
$(LIB)/quantum.a(qmset.o) : inbnd.fcm
$(LIB)/quantum.a(qmset.o) : number.fcm
$(LIB)/quantum.a(qmset.o) : param.fcm
$(LIB)/quantum.a(qmset.o) : psf.fcm
$(LIB)/quantum.a(qmset.o) : qmlink.fcm
$(LIB)/quantum.a(qmset.o) : quantm.fcm
$(LIB)/quantum.a(qmset.o) : rtf.fcm
$(LIB)/quantum.a(qmset.o) : scfblk.fcm
$(LIB)/quantum.a(qmset.o) : sizes.fcm
$(LIB)/quantum.a(qmset.o) : stack.fcm
$(LIB)/quantum.a(qmset.o) : stream.fcm
#
