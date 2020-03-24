# util makefile
# util library rules
OBJS_util= \
	$(LIB)/util.a(array.o) \
	$(LIB)/util.a(calc.o) \
	$(LIB)/util.a(chutil.o) \
	$(LIB)/util.a(cmdpar.o) \
	$(LIB)/util.a(datstr.o) \
	$(LIB)/util.a(diagq.o) \
	$(LIB)/util.a(imsl.o) \
	$(LIB)/util.a(matrix.o) \
	$(LIB)/util.a(parse.o) \
	$(LIB)/util.a(pointer.o) \
	$(LIB)/util.a(random.o) \
	$(LIB)/util.a(selcta.o) \
	$(LIB)/util.a(sort.o) \
	$(LIB)/util.a(string.o) \
	$(LIB)/util.a(time.o) \
	$(LIB)/util.a(title.o) \
	$(LIB)/util.a(util.o) \
	$(LIB)/util.a(vector.o)
#
$(LIB)/util.a : $(OBJS_util)
	$(RANLIB) $(LIB)/util.a
	@echo util COMPLETED
#
# util source file rules
$(LIB)/util.a(array.o)  : $(SRC)/util/array.src
	$(FLX) $(SRC)/util/array.src
	$(FC2) array.f
	ar rucv $(LIB)/util.a array.o
	rm array.f
	rm array.o
#
$(LIB)/util.a(calc.o)  : $(SRC)/util/calc.src
	$(FLX) $(SRC)/util/calc.src
	$(FC2) calc.f
	ar rucv $(LIB)/util.a calc.o
	rm calc.f
	rm calc.o
#
$(LIB)/util.a(chutil.o)  : $(SRC)/util/chutil.src
	$(FLX) $(SRC)/util/chutil.src
	$(FC2) chutil.f
	ar rucv $(LIB)/util.a chutil.o
	rm chutil.f
	rm chutil.o
#
$(LIB)/util.a(cmdpar.o)  : $(SRC)/util/cmdpar.src
	$(FLX) $(SRC)/util/cmdpar.src
	$(FC2) cmdpar.f
	ar rucv $(LIB)/util.a cmdpar.o
	rm cmdpar.f
	rm cmdpar.o
#
$(LIB)/util.a(datstr.o)  : $(SRC)/util/datstr.src
	$(FLX) $(SRC)/util/datstr.src
	$(FC2) datstr.f
	ar rucv $(LIB)/util.a datstr.o
	rm datstr.f
	rm datstr.o
#
$(LIB)/util.a(diagq.o)  : $(SRC)/util/diagq.src
	$(FLX) $(SRC)/util/diagq.src
	$(FC2) diagq.f
	ar rucv $(LIB)/util.a diagq.o
	rm diagq.f
	rm diagq.o
#
$(LIB)/util.a(imsl.o)  : $(SRC)/util/imsl.src
	$(FLX) $(SRC)/util/imsl.src
	$(FC2) imsl.f
	ar rucv $(LIB)/util.a imsl.o
	rm imsl.f
	rm imsl.o
#
$(LIB)/util.a(matrix.o)  : $(SRC)/util/matrix.src
	$(FLX) $(SRC)/util/matrix.src
	$(FC1) matrix.f
	ar rucv $(LIB)/util.a matrix.o
	rm matrix.f
	rm matrix.o
#
$(LIB)/util.a(parse.o)  : $(SRC)/util/parse.src
	$(FLX) $(SRC)/util/parse.src
	$(FC2) parse.f
	ar rucv $(LIB)/util.a parse.o
	rm parse.f
	rm parse.o
#
$(LIB)/util.a(pointer.o)  : $(SRC)/util/pointer.src
	$(FLX) $(SRC)/util/pointer.src
	$(FC2) pointer.f
	ar rucv $(LIB)/util.a pointer.o
	rm pointer.f
	rm pointer.o
#
$(LIB)/util.a(random.o)  : $(SRC)/util/random.src
	$(FLX) $(SRC)/util/random.src
	$(FC2) random.f
	ar rucv $(LIB)/util.a random.o
	rm random.f
	rm random.o
#
$(LIB)/util.a(selcta.o)  : $(SRC)/util/selcta.src
	$(FLX) $(SRC)/util/selcta.src
	$(FC2) selcta.f
	ar rucv $(LIB)/util.a selcta.o
	rm selcta.f
	rm selcta.o
#
$(LIB)/util.a(sort.o)  : $(SRC)/util/sort.src
	$(FLX) $(SRC)/util/sort.src
	$(FC2) sort.f
	ar rucv $(LIB)/util.a sort.o
	rm sort.f
	rm sort.o
#
$(LIB)/util.a(string.o)  : $(SRC)/util/string.src
	$(FLX) $(SRC)/util/string.src
	$(FC2) string.f
	ar rucv $(LIB)/util.a string.o
	rm string.f
	rm string.o
#
$(LIB)/util.a(time.o)  : $(SRC)/util/time.src
	$(FLX) $(SRC)/util/time.src
	$(FC2) time.f
	ar rucv $(LIB)/util.a time.o
	rm time.f
	rm time.o
#
$(LIB)/util.a(title.o)  : $(SRC)/util/title.src
	$(FLX) $(SRC)/util/title.src
	$(FC2) title.f
	ar rucv $(LIB)/util.a title.o
	rm title.f
	rm title.o
#
$(LIB)/util.a(util.o)  : $(SRC)/util/util.src
	$(FLX) $(SRC)/util/util.src
	$(FC2) util.f
	ar rucv $(LIB)/util.a util.o
	rm util.f
	rm util.o
#
$(LIB)/util.a(vector.o)  : $(SRC)/util/vector.src
	$(FLX) $(SRC)/util/vector.src
	$(FC2) vector.f
	ar rucv $(LIB)/util.a vector.o
	rm vector.f
	rm vector.o
#
#
# util dependency file
#
$(LIB)/util.a(array.o) : impnon.fcm
#
#
$(LIB)/util.a(calc.o) : impnon.fcm
$(LIB)/util.a(calc.o) : stream.fcm
#
#
$(LIB)/util.a(chutil.o) : coord.fcm
$(LIB)/util.a(chutil.o) : dimens.fcm
$(LIB)/util.a(chutil.o) : impnon.fcm
$(LIB)/util.a(chutil.o) : number.fcm
$(LIB)/util.a(chutil.o) : psf.fcm
$(LIB)/util.a(chutil.o) : stream.fcm
#
#
$(LIB)/util.a(cmdpar.o) : cmdpar.fcm
$(LIB)/util.a(cmdpar.o) : dimens.fcm
$(LIB)/util.a(cmdpar.o) : exfunc.fcm
$(LIB)/util.a(cmdpar.o) : impnon.fcm
$(LIB)/util.a(cmdpar.o) : number.fcm
$(LIB)/util.a(cmdpar.o) : stream.fcm
$(LIB)/util.a(cmdpar.o) : string.fcm
#
#
$(LIB)/util.a(datstr.o) : ctitla.fcm
$(LIB)/util.a(datstr.o) : exfunc.fcm
$(LIB)/util.a(datstr.o) : heap.fcm
$(LIB)/util.a(datstr.o) : impnon.fcm
$(LIB)/util.a(datstr.o) : stack.fcm
$(LIB)/util.a(datstr.o) : stream.fcm
#
#
$(LIB)/util.a(diagq.o) : impnon.fcm
$(LIB)/util.a(diagq.o) : number.fcm
$(LIB)/util.a(diagq.o) : stream.fcm
#
#
$(LIB)/util.a(imsl.o) : impnon.fcm
$(LIB)/util.a(imsl.o) : number.fcm
$(LIB)/util.a(imsl.o) : stream.fcm
#
#
$(LIB)/util.a(matrix.o) : exfunc.fcm
$(LIB)/util.a(matrix.o) : impnon.fcm
$(LIB)/util.a(matrix.o) : number.fcm
$(LIB)/util.a(matrix.o) : stack.fcm
$(LIB)/util.a(matrix.o) : stream.fcm
#
#
$(LIB)/util.a(parse.o) : cmdpar.fcm
$(LIB)/util.a(parse.o) : dimens.fcm
$(LIB)/util.a(parse.o) : energy.fcm
$(LIB)/util.a(parse.o) : exfunc.fcm
$(LIB)/util.a(parse.o) : impnon.fcm
$(LIB)/util.a(parse.o) : mscpar.fcm
$(LIB)/util.a(parse.o) : stream.fcm
$(LIB)/util.a(parse.o) : string.fcm
#
#
$(LIB)/util.a(pointer.o) : exfunc.fcm
$(LIB)/util.a(pointer.o) : heap.fcm
$(LIB)/util.a(pointer.o) : impnon.fcm
$(LIB)/util.a(pointer.o) : machdep.fcm
$(LIB)/util.a(pointer.o) : stack.fcm
#
#
$(LIB)/util.a(random.o) : comand.fcm
$(LIB)/util.a(random.o) : consta.fcm
$(LIB)/util.a(random.o) : dimens.fcm
$(LIB)/util.a(random.o) : exfunc.fcm
$(LIB)/util.a(random.o) : impnon.fcm
$(LIB)/util.a(random.o) : number.fcm
$(LIB)/util.a(random.o) : rndnum.fcm
$(LIB)/util.a(random.o) : stream.fcm
#
#
$(LIB)/util.a(selcta.o) : bases.fcm
$(LIB)/util.a(selcta.o) : cnst.fcm
$(LIB)/util.a(selcta.o) : coord.fcm
$(LIB)/util.a(selcta.o) : coordc.fcm
$(LIB)/util.a(selcta.o) : deriv.fcm
$(LIB)/util.a(selcta.o) : dimens.fcm
$(LIB)/util.a(selcta.o) : econt.fcm
$(LIB)/util.a(selcta.o) : exfunc.fcm
$(LIB)/util.a(selcta.o) : fourd.fcm
$(LIB)/util.a(selcta.o) : genborn.fcm
$(LIB)/util.a(selcta.o) : heap.fcm
$(LIB)/util.a(selcta.o) : impnon.fcm
$(LIB)/util.a(selcta.o) : number.fcm
$(LIB)/util.a(selcta.o) : param.fcm
$(LIB)/util.a(selcta.o) : pbound.fcm
$(LIB)/util.a(selcta.o) : pert.fcm
$(LIB)/util.a(selcta.o) : psf.fcm
$(LIB)/util.a(selcta.o) : scalar.fcm
$(LIB)/util.a(selcta.o) : selcta.fcm
$(LIB)/util.a(selcta.o) : stack.fcm
$(LIB)/util.a(selcta.o) : stream.fcm
$(LIB)/util.a(selcta.o) : string.fcm
$(LIB)/util.a(selcta.o) : surface.fcm
#
#
$(LIB)/util.a(sort.o) : exfunc.fcm
$(LIB)/util.a(sort.o) : impnon.fcm
$(LIB)/util.a(sort.o) : stack.fcm
#
#
$(LIB)/util.a(string.o) : consta.fcm
$(LIB)/util.a(string.o) : dimens.fcm
$(LIB)/util.a(string.o) : exfunc.fcm
$(LIB)/util.a(string.o) : impnon.fcm
$(LIB)/util.a(string.o) : number.fcm
$(LIB)/util.a(string.o) : stack.fcm
$(LIB)/util.a(string.o) : stream.fcm
$(LIB)/util.a(string.o) : string.fcm
#
#
$(LIB)/util.a(time.o) : impnon.fcm
$(LIB)/util.a(time.o) : stream.fcm
#
#
$(LIB)/util.a(title.o) : ctitla.fcm
$(LIB)/util.a(title.o) : dimens.fcm
$(LIB)/util.a(title.o) : exfunc.fcm
$(LIB)/util.a(title.o) : fast.fcm
$(LIB)/util.a(title.o) : impnon.fcm
$(LIB)/util.a(title.o) : iochan.fcm
$(LIB)/util.a(title.o) : quanta.fcm
$(LIB)/util.a(title.o) : stream.fcm
$(LIB)/util.a(title.o) : timer.fcm
#
#
$(LIB)/util.a(util.o) : cstack.fcm
$(LIB)/util.a(util.o) : dimens.fcm
$(LIB)/util.a(util.o) : exfunc.fcm
$(LIB)/util.a(util.o) : heap.fcm
$(LIB)/util.a(util.o) : heappr.fcm
$(LIB)/util.a(util.o) : impnon.fcm
$(LIB)/util.a(util.o) : number.fcm
$(LIB)/util.a(util.o) : quanta.fcm
$(LIB)/util.a(util.o) : stack.fcm
$(LIB)/util.a(util.o) : stream.fcm
$(LIB)/util.a(util.o) : timer.fcm
#
#
$(LIB)/util.a(vector.o) : impnon.fcm
$(LIB)/util.a(vector.o) : stream.fcm
#
