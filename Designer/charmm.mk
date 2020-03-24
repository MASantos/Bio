# charmm makefile
# charmm library rules
OBJS_charmm= \
	$(LIB)/charmm_main.o \
	$(LIB)/help.o \
	$(LIB)/iniall.o \
	$(LIB)/miscom.o \
	$(LIB)/usersb.o
#
$(LIB)/stamp : $(OBJS_charmm)
	touch $(LIB)/stamp
	@echo charmm COMPLETED
#
# charmm source file rules
$(LIB)/charmm_main.o : $(SRC)/charmm/charmm_main.src
	$(FLX) $(SRC)/charmm/charmm_main.src
	$(FC2) charmm_main.f
	mv charmm_main.o $(LIB)
	rm charmm_main.f
#
$(LIB)/help.o : $(SRC)/charmm/help.src
	$(FLX) $(SRC)/charmm/help.src
	$(FC2) help.f
	mv help.o $(LIB)
	rm help.f
#
$(LIB)/iniall.o : $(SRC)/charmm/iniall.src
	$(FLX) $(SRC)/charmm/iniall.src
	mv iniall.f iniall.F
	$(FC2) iniall.F
	mv iniall.o $(LIB)
	rm iniall.F
#
$(LIB)/miscom.o : $(SRC)/charmm/miscom.src
	$(FLX) $(SRC)/charmm/miscom.src
	$(FC2) miscom.f
	mv miscom.o $(LIB)
	rm miscom.f
#
$(LIB)/usersb.o : $(SRC)/charmm/usersb.src
	$(FLX) $(SRC)/charmm/usersb.src
	$(FC2) usersb.f
	mv usersb.o $(LIB)
	rm usersb.f
#
#
# charmm dependency file
#
$(LIB)/charmm_main.o : bases.fcm
$(LIB)/charmm_main.o : comand.fcm
$(LIB)/charmm_main.o : contrl.fcm
$(LIB)/charmm_main.o : coord.fcm
$(LIB)/charmm_main.o : coordc.fcm
$(LIB)/charmm_main.o : ctitla.fcm
$(LIB)/charmm_main.o : dimens.fcm
$(LIB)/charmm_main.o : exfunc.fcm
$(LIB)/charmm_main.o : galgor.fcm
$(LIB)/charmm_main.o : hbond.fcm
$(LIB)/charmm_main.o : heap.fcm
$(LIB)/charmm_main.o : image.fcm
$(LIB)/charmm_main.o : impnon.fcm
$(LIB)/charmm_main.o : inbnd.fcm
$(LIB)/charmm_main.o : intcr.fcm
$(LIB)/charmm_main.o : mbmts.fcm
$(LIB)/charmm_main.o : mscpar.fcm
$(LIB)/charmm_main.o : number.fcm
$(LIB)/charmm_main.o : param.fcm
$(LIB)/charmm_main.o : pert.fcm
$(LIB)/charmm_main.o : psf.fcm
$(LIB)/charmm_main.o : quanta.fcm
$(LIB)/charmm_main.o : stack.fcm
$(LIB)/charmm_main.o : stream.fcm
$(LIB)/charmm_main.o : tbmtsp1.fcm
$(LIB)/charmm_main.o : timer.fcm
#
#
$(LIB)/help.o : impnon.fcm
$(LIB)/help.o : stream.fcm
#
#
$(LIB)/iniall.o : PARAM.FOR
$(LIB)/iniall.o : bases.fcm
$(LIB)/iniall.o : block.fcm
$(LIB)/iniall.o : cadpac.fcm
$(LIB)/iniall.o : cff.fcm
$(LIB)/iniall.o : cmdpar.fcm
$(LIB)/iniall.o : cnst.fcm
$(LIB)/iniall.o : code.fcm
$(LIB)/iniall.o : consta.fcm
$(LIB)/iniall.o : contrl.fcm
$(LIB)/iniall.o : corman.fcm
$(LIB)/iniall.o : ctitla.fcm
$(LIB)/iniall.o : cveloci.fcm
$(LIB)/iniall.o : deflts.fcm
$(LIB)/iniall.o : dimb.fcm
$(LIB)/iniall.o : dimens.fcm
$(LIB)/iniall.o : distri.fcm
$(LIB)/iniall.o : dmcons.fcm
$(LIB)/iniall.o : etable.fcm
$(LIB)/iniall.o : euler.fcm
$(LIB)/iniall.o : ewald.fcm
$(LIB)/iniall.o : exelec.fcm
$(LIB)/iniall.o : exfunc.fcm
$(LIB)/iniall.o : fast.fcm
$(LIB)/iniall.o : fbias.fcm
$(LIB)/iniall.o : ffield.fcm
$(LIB)/iniall.o : fma.fcm
$(LIB)/iniall.o : fmacons.fcm
$(LIB)/iniall.o : fourd.fcm
$(LIB)/iniall.o : galgor.fcm
$(LIB)/iniall.o : gamess.fcm
$(LIB)/iniall.o : genborn.fcm
$(LIB)/iniall.o : grape.fcm
$(LIB)/iniall.o : graph.fcm
$(LIB)/iniall.o : hbond.fcm
$(LIB)/iniall.o : heap.fcm
$(LIB)/iniall.o : icpert.fcm
$(LIB)/iniall.o : image.fcm
$(LIB)/iniall.o : impnon.fcm
$(LIB)/iniall.o : inbnd.fcm
$(LIB)/iniall.o : intcr.fcm
$(LIB)/iniall.o : io.fcm
$(LIB)/iniall.o : lambda.fcm
$(LIB)/iniall.o : lonepr.fcm
$(LIB)/iniall.o : lupcom.fcm
$(LIB)/iniall.o : machdep.fcm
$(LIB)/iniall.o : mbmts.fcm
$(LIB)/iniall.o : mbmts1.fcm
$(LIB)/iniall.o : mbond.fcm
$(LIB)/iniall.o : mc.fcm
$(LIB)/iniall.o : mltcanon.fcm
$(LIB)/iniall.o : mmff.fcm
$(LIB)/iniall.o : noe.fcm
$(LIB)/iniall.o : nose.fcm
$(LIB)/iniall.o : number.fcm
$(LIB)/iniall.o : parallel.fcm
$(LIB)/iniall.o : param.fcm
$(LIB)/iniall.o : path.fcm
$(LIB)/iniall.o : pbeq.fcm
$(LIB)/iniall.o : pbound.fcm
$(LIB)/iniall.o : pert.fcm
$(LIB)/iniall.o : pme.fcm
$(LIB)/iniall.o : polar.fcm
$(LIB)/iniall.o : psf.fcm
$(LIB)/iniall.o : pull.fcm
$(LIB)/iniall.o : quantm.fcm
$(LIB)/iniall.o : reawri.fcm
$(LIB)/iniall.o : replica.fcm
$(LIB)/iniall.o : resdist.fcm
$(LIB)/iniall.o : rgy.fcm
$(LIB)/iniall.o : rism.fcm
$(LIB)/iniall.o : rndnum.fcm
$(LIB)/iniall.o : rtf.fcm
$(LIB)/iniall.o : rwlamb.fcm
$(LIB)/iniall.o : sbound.fcm
$(LIB)/iniall.o : scalar.fcm
$(LIB)/iniall.o : selcta.fcm
$(LIB)/iniall.o : shake.fcm
$(LIB)/iniall.o : shapes.fcm
$(LIB)/iniall.o : stack.fcm
$(LIB)/iniall.o : stream.fcm
$(LIB)/iniall.o : string.fcm
$(LIB)/iniall.o : struc.fcm
$(LIB)/iniall.o : surface.fcm
$(LIB)/iniall.o : tbmts.fcm
$(LIB)/iniall.o : timer.fcm
$(LIB)/iniall.o : travel.fcm
$(LIB)/iniall.o : umb.fcm
$(LIB)/iniall.o : vangle_mm.fcm
$(LIB)/iniall.o : version.fcm
$(LIB)/iniall.o : vphi.fcm
#
#
$(LIB)/miscom.o : cmdpar.fcm
$(LIB)/miscom.o : ctitla.fcm
$(LIB)/miscom.o : dimens.fcm
$(LIB)/miscom.o : energy.fcm
$(LIB)/miscom.o : exfunc.fcm
$(LIB)/miscom.o : fast.fcm
$(LIB)/miscom.o : ffield.fcm
$(LIB)/miscom.o : impnon.fcm
$(LIB)/miscom.o : inbnd.fcm
$(LIB)/miscom.o : lambda.fcm
$(LIB)/miscom.o : machdep.fcm
$(LIB)/miscom.o : mscpar.fcm
$(LIB)/miscom.o : number.fcm
$(LIB)/miscom.o : parallel.fcm
$(LIB)/miscom.o : psf.fcm
$(LIB)/miscom.o : rwlamb.fcm
$(LIB)/miscom.o : stream.fcm
$(LIB)/miscom.o : string.fcm
$(LIB)/miscom.o : timer.fcm
#
#
$(LIB)/usersb.o : impnon.fcm
#
