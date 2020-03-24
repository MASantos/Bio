# misc makefile
# misc library rules
OBJS_misc= \
	$(LIB)/misc.a(aspener.o) \
	$(LIB)/misc.a(drawsp.o) \
	$(LIB)/misc.a(eef1.o) \
	$(LIB)/misc.a(genetic.o) \
	$(LIB)/misc.a(genetic2.o) \
	$(LIB)/misc.a(hbuild.o) \
	$(LIB)/misc.a(lattice.o) \
	$(LIB)/misc.a(mmfp.o) \
	$(LIB)/misc.a(multicanon.o) \
	$(LIB)/misc.a(nmr.o) \
	$(LIB)/misc.a(noe.o) \
	$(LIB)/misc.a(pbeq.o) \
	$(LIB)/misc.a(primsh.o) \
	$(LIB)/misc.a(quicka.o) \
	$(LIB)/misc.a(resdist.o) \
	$(LIB)/misc.a(sbound.o) \
	$(LIB)/misc.a(ssbp.o) \
	$(LIB)/misc.a(surfac.o) \
	$(LIB)/misc.a(testch.o) \
	$(LIB)/misc.a(xray.o) \
	$(LIB)/misc.a(zmat.o)
#
$(LIB)/misc.a : $(OBJS_misc)
	$(RANLIB) $(LIB)/misc.a
	@echo misc COMPLETED
#
# misc source file rules
$(LIB)/misc.a(aspener.o)  : $(SRC)/misc/aspener.src
	$(FLX) $(SRC)/misc/aspener.src
	$(FC2) aspener.f
	ar rucv $(LIB)/misc.a aspener.o
	rm aspener.f
	rm aspener.o
#
$(LIB)/misc.a(drawsp.o)  : $(SRC)/misc/drawsp.src
	$(FLX) $(SRC)/misc/drawsp.src
	$(FC2) drawsp.f
	ar rucv $(LIB)/misc.a drawsp.o
	rm drawsp.f
	rm drawsp.o
#
$(LIB)/misc.a(eef1.o)  : $(SRC)/misc/eef1.src
	$(FLX) $(SRC)/misc/eef1.src
	$(FC2) eef1.f
	ar rucv $(LIB)/misc.a eef1.o
	rm eef1.f
	rm eef1.o
#
$(LIB)/misc.a(genetic.o)  : $(SRC)/misc/genetic.src
	$(FLX) $(SRC)/misc/genetic.src
	$(FC2) genetic.f
	ar rucv $(LIB)/misc.a genetic.o
	rm genetic.f
	rm genetic.o
#
$(LIB)/misc.a(genetic2.o)  : $(SRC)/misc/genetic2.src
	$(FLX) $(SRC)/misc/genetic2.src
	$(FC2) genetic2.f
	ar rucv $(LIB)/misc.a genetic2.o
	rm genetic2.f
	rm genetic2.o
#
$(LIB)/misc.a(hbuild.o)  : $(SRC)/misc/hbuild.src
	$(FLX) $(SRC)/misc/hbuild.src
	$(FC2) hbuild.f
	ar rucv $(LIB)/misc.a hbuild.o
	rm hbuild.f
	rm hbuild.o
#
$(LIB)/misc.a(lattice.o)  : $(SRC)/misc/lattice.src
	$(FLX) $(SRC)/misc/lattice.src
	$(FC2) lattice.f
	ar rucv $(LIB)/misc.a lattice.o
	rm lattice.f
	rm lattice.o
#
$(LIB)/misc.a(mmfp.o)  : $(SRC)/misc/mmfp.src
	$(FLX) $(SRC)/misc/mmfp.src
	$(FC2) mmfp.f
	ar rucv $(LIB)/misc.a mmfp.o
	rm mmfp.f
	rm mmfp.o
#
$(LIB)/misc.a(multicanon.o)  : $(SRC)/misc/multicanon.src
	$(FLX) $(SRC)/misc/multicanon.src
	$(FC2) multicanon.f
	ar rucv $(LIB)/misc.a multicanon.o
	rm multicanon.f
	rm multicanon.o
#
$(LIB)/misc.a(nmr.o)  : $(SRC)/misc/nmr.src
	$(FLX) $(SRC)/misc/nmr.src
	$(FC2) nmr.f
	ar rucv $(LIB)/misc.a nmr.o
	rm nmr.f
	rm nmr.o
#
$(LIB)/misc.a(noe.o)  : $(SRC)/misc/noe.src
	$(FLX) $(SRC)/misc/noe.src
	$(FC2) noe.f
	ar rucv $(LIB)/misc.a noe.o
	rm noe.f
	rm noe.o
#
$(LIB)/misc.a(pbeq.o)  : $(SRC)/misc/pbeq.src
	$(FLX) $(SRC)/misc/pbeq.src
	$(FC2) pbeq.f
	ar rucv $(LIB)/misc.a pbeq.o
	rm pbeq.f
	rm pbeq.o
#
$(LIB)/misc.a(primsh.o)  : $(SRC)/misc/primsh.src
	$(FLX) $(SRC)/misc/primsh.src
	$(FC2) primsh.f
	ar rucv $(LIB)/misc.a primsh.o
	rm primsh.f
	rm primsh.o
#
$(LIB)/misc.a(quicka.o)  : $(SRC)/misc/quicka.src
	$(FLX) $(SRC)/misc/quicka.src
	$(FC2) quicka.f
	ar rucv $(LIB)/misc.a quicka.o
	rm quicka.f
	rm quicka.o
#
$(LIB)/misc.a(resdist.o)  : $(SRC)/misc/resdist.src
	$(FLX) $(SRC)/misc/resdist.src
	$(FC2) resdist.f
	ar rucv $(LIB)/misc.a resdist.o
	rm resdist.f
	rm resdist.o
#
$(LIB)/misc.a(sbound.o)  : $(SRC)/misc/sbound.src
	$(FLX) $(SRC)/misc/sbound.src
	$(FC2) sbound.f
	ar rucv $(LIB)/misc.a sbound.o
	rm sbound.f
	rm sbound.o
#
$(LIB)/misc.a(ssbp.o)  : $(SRC)/misc/ssbp.src
	$(FLX) $(SRC)/misc/ssbp.src
	$(FC2) ssbp.f
	ar rucv $(LIB)/misc.a ssbp.o
	rm ssbp.f
	rm ssbp.o
#
$(LIB)/misc.a(surfac.o)  : $(SRC)/misc/surfac.src
	$(FLX) $(SRC)/misc/surfac.src
	$(FC2) surfac.f
	ar rucv $(LIB)/misc.a surfac.o
	rm surfac.f
	rm surfac.o
#
$(LIB)/misc.a(testch.o)  : $(SRC)/misc/testch.src
	$(FLX) $(SRC)/misc/testch.src
	$(FC2) testch.f
	ar rucv $(LIB)/misc.a testch.o
	rm testch.f
	rm testch.o
#
$(LIB)/misc.a(xray.o)  : $(SRC)/misc/xray.src
	$(FLX) $(SRC)/misc/xray.src
	$(FC2) xray.f
	ar rucv $(LIB)/misc.a xray.o
	rm xray.f
	rm xray.o
#
$(LIB)/misc.a(zmat.o)  : $(SRC)/misc/zmat.src
	$(FLX) $(SRC)/misc/zmat.src
	$(FC2) zmat.f
	ar rucv $(LIB)/misc.a zmat.o
	rm zmat.f
	rm zmat.o
#
#
# misc dependency file
#
$(LIB)/misc.a(aspener.o) : consta.fcm
$(LIB)/misc.a(aspener.o) : coord.fcm
$(LIB)/misc.a(aspener.o) : ctitla.fcm
$(LIB)/misc.a(aspener.o) : deriv.fcm
$(LIB)/misc.a(aspener.o) : dimens.fcm
$(LIB)/misc.a(aspener.o) : exfunc.fcm
$(LIB)/misc.a(aspener.o) : impnon.fcm
$(LIB)/misc.a(aspener.o) : number.fcm
$(LIB)/misc.a(aspener.o) : parallel.fcm
$(LIB)/misc.a(aspener.o) : psf.fcm
$(LIB)/misc.a(aspener.o) : stack.fcm
$(LIB)/misc.a(aspener.o) : stream.fcm
$(LIB)/misc.a(aspener.o) : surface.fcm
#
#
$(LIB)/misc.a(drawsp.o) : code.fcm
$(LIB)/misc.a(drawsp.o) : dimens.fcm
$(LIB)/misc.a(drawsp.o) : exfunc.fcm
$(LIB)/misc.a(drawsp.o) : hbond.fcm
$(LIB)/misc.a(drawsp.o) : impnon.fcm
$(LIB)/misc.a(drawsp.o) : number.fcm
$(LIB)/misc.a(drawsp.o) : param.fcm
$(LIB)/misc.a(drawsp.o) : psf.fcm
$(LIB)/misc.a(drawsp.o) : stream.fcm
#
#
$(LIB)/misc.a(eef1.o) : bases.fcm
$(LIB)/misc.a(eef1.o) : comand.fcm
$(LIB)/misc.a(eef1.o) : consta.fcm
$(LIB)/misc.a(eef1.o) : coord.fcm
$(LIB)/misc.a(eef1.o) : deriv.fcm
$(LIB)/misc.a(eef1.o) : dimens.fcm
$(LIB)/misc.a(eef1.o) : econt.fcm
$(LIB)/misc.a(eef1.o) : eef1.fcm
$(LIB)/misc.a(eef1.o) : exfunc.fcm
$(LIB)/misc.a(eef1.o) : heap.fcm
$(LIB)/misc.a(eef1.o) : image.fcm
$(LIB)/misc.a(eef1.o) : impnon.fcm
$(LIB)/misc.a(eef1.o) : inbnd.fcm
$(LIB)/misc.a(eef1.o) : number.fcm
$(LIB)/misc.a(eef1.o) : param.fcm
$(LIB)/misc.a(eef1.o) : psf.fcm
$(LIB)/misc.a(eef1.o) : stream.fcm
$(LIB)/misc.a(eef1.o) : timer.fcm
#
#
$(LIB)/misc.a(genetic.o) : bases.fcm
$(LIB)/misc.a(genetic.o) : block.fcm
$(LIB)/misc.a(genetic.o) : cnst.fcm
$(LIB)/misc.a(genetic.o) : code.fcm
$(LIB)/misc.a(genetic.o) : comand.fcm
$(LIB)/misc.a(genetic.o) : consta.fcm
$(LIB)/misc.a(genetic.o) : coord.fcm
$(LIB)/misc.a(genetic.o) : coordc.fcm
$(LIB)/misc.a(genetic.o) : deriv.fcm
$(LIB)/misc.a(genetic.o) : dimens.fcm
$(LIB)/misc.a(genetic.o) : econt.fcm
$(LIB)/misc.a(genetic.o) : energy.fcm
$(LIB)/misc.a(genetic.o) : exfunc.fcm
$(LIB)/misc.a(genetic.o) : fast.fcm
$(LIB)/misc.a(genetic.o) : galgor.fcm
$(LIB)/misc.a(genetic.o) : heap.fcm
$(LIB)/misc.a(genetic.o) : impnon.fcm
$(LIB)/misc.a(genetic.o) : inbnd.fcm
$(LIB)/misc.a(genetic.o) : intcr.fcm
$(LIB)/misc.a(genetic.o) : noe.fcm
$(LIB)/misc.a(genetic.o) : number.fcm
$(LIB)/misc.a(genetic.o) : param.fcm
$(LIB)/misc.a(genetic.o) : psf.fcm
$(LIB)/misc.a(genetic.o) : reawri.fcm
$(LIB)/misc.a(genetic.o) : replica.fcm
$(LIB)/misc.a(genetic.o) : stack.fcm
$(LIB)/misc.a(genetic.o) : stream.fcm
#
#
$(LIB)/misc.a(genetic2.o) : deriv.fcm
$(LIB)/misc.a(genetic2.o) : dimens.fcm
$(LIB)/misc.a(genetic2.o) : energy.fcm
$(LIB)/misc.a(genetic2.o) : exfunc.fcm
$(LIB)/misc.a(genetic2.o) : impnon.fcm
$(LIB)/misc.a(genetic2.o) : number.fcm
$(LIB)/misc.a(genetic2.o) : reawri.fcm
$(LIB)/misc.a(genetic2.o) : stack.fcm
$(LIB)/misc.a(genetic2.o) : stream.fcm
#
#
$(LIB)/misc.a(hbuild.o) : bases.fcm
$(LIB)/misc.a(hbuild.o) : code.fcm
$(LIB)/misc.a(hbuild.o) : consta.fcm
$(LIB)/misc.a(hbuild.o) : coord.fcm
$(LIB)/misc.a(hbuild.o) : deriv.fcm
$(LIB)/misc.a(hbuild.o) : dimens.fcm
$(LIB)/misc.a(hbuild.o) : ewald.fcm
$(LIB)/misc.a(hbuild.o) : exfunc.fcm
$(LIB)/misc.a(hbuild.o) : ffield.fcm
$(LIB)/misc.a(hbuild.o) : hbond.fcm
$(LIB)/misc.a(hbuild.o) : heap.fcm
$(LIB)/misc.a(hbuild.o) : impnon.fcm
$(LIB)/misc.a(hbuild.o) : inbnd.fcm
$(LIB)/misc.a(hbuild.o) : mmff.fcm
$(LIB)/misc.a(hbuild.o) : number.fcm
$(LIB)/misc.a(hbuild.o) : param.fcm
$(LIB)/misc.a(hbuild.o) : psf.fcm
$(LIB)/misc.a(hbuild.o) : stack.fcm
$(LIB)/misc.a(hbuild.o) : stream.fcm
#
#
$(LIB)/misc.a(lattice.o) : comand.fcm
$(LIB)/misc.a(lattice.o) : coord.fcm
$(LIB)/misc.a(lattice.o) : dimens.fcm
$(LIB)/misc.a(lattice.o) : exfunc.fcm
$(LIB)/misc.a(lattice.o) : impnon.fcm
$(LIB)/misc.a(lattice.o) : number.fcm
$(LIB)/misc.a(lattice.o) : psf.fcm
$(LIB)/misc.a(lattice.o) : stream.fcm
#
#
$(LIB)/misc.a(mmfp.o) : comand.fcm
$(LIB)/misc.a(mmfp.o) : coord.fcm
$(LIB)/misc.a(mmfp.o) : dimens.fcm
$(LIB)/misc.a(mmfp.o) : exfunc.fcm
$(LIB)/misc.a(mmfp.o) : heap.fcm
$(LIB)/misc.a(mmfp.o) : impnon.fcm
$(LIB)/misc.a(mmfp.o) : mmfp.fcm
$(LIB)/misc.a(mmfp.o) : number.fcm
$(LIB)/misc.a(mmfp.o) : psf.fcm
$(LIB)/misc.a(mmfp.o) : ssbp.fcm
$(LIB)/misc.a(mmfp.o) : stack.fcm
$(LIB)/misc.a(mmfp.o) : stream.fcm
#
#
$(LIB)/misc.a(multicanon.o) : exfunc.fcm
$(LIB)/misc.a(multicanon.o) : impnon.fcm
$(LIB)/misc.a(multicanon.o) : mltcanon.fcm
$(LIB)/misc.a(multicanon.o) : number.fcm
$(LIB)/misc.a(multicanon.o) : stream.fcm
#
#
$(LIB)/misc.a(nmr.o) : comand.fcm
$(LIB)/misc.a(nmr.o) : consta.fcm
$(LIB)/misc.a(nmr.o) : coord.fcm
$(LIB)/misc.a(nmr.o) : coordc.fcm
$(LIB)/misc.a(nmr.o) : cstack.fcm
$(LIB)/misc.a(nmr.o) : ctitla.fcm
$(LIB)/misc.a(nmr.o) : dimens.fcm
$(LIB)/misc.a(nmr.o) : exfunc.fcm
$(LIB)/misc.a(nmr.o) : heap.fcm
$(LIB)/misc.a(nmr.o) : impnon.fcm
$(LIB)/misc.a(nmr.o) : number.fcm
$(LIB)/misc.a(nmr.o) : psf.fcm
$(LIB)/misc.a(nmr.o) : stack.fcm
$(LIB)/misc.a(nmr.o) : stream.fcm
#
#
$(LIB)/misc.a(noe.o) : comand.fcm
$(LIB)/misc.a(noe.o) : consta.fcm
$(LIB)/misc.a(noe.o) : coord.fcm
$(LIB)/misc.a(noe.o) : ctitla.fcm
$(LIB)/misc.a(noe.o) : dimb.fcm
$(LIB)/misc.a(noe.o) : dimens.fcm
$(LIB)/misc.a(noe.o) : exfunc.fcm
$(LIB)/misc.a(noe.o) : fourd.fcm
$(LIB)/misc.a(noe.o) : galgor.fcm
$(LIB)/misc.a(noe.o) : heap.fcm
$(LIB)/misc.a(noe.o) : impnon.fcm
$(LIB)/misc.a(noe.o) : noe.fcm
$(LIB)/misc.a(noe.o) : number.fcm
$(LIB)/misc.a(noe.o) : psf.fcm
$(LIB)/misc.a(noe.o) : reawri.fcm
$(LIB)/misc.a(noe.o) : stack.fcm
$(LIB)/misc.a(noe.o) : stream.fcm
$(LIB)/misc.a(noe.o) : version.fcm
#
#
$(LIB)/misc.a(pbeq.o) : comand.fcm
$(LIB)/misc.a(pbeq.o) : consta.fcm
$(LIB)/misc.a(pbeq.o) : coord.fcm
$(LIB)/misc.a(pbeq.o) : ctitla.fcm
$(LIB)/misc.a(pbeq.o) : deriv.fcm
$(LIB)/misc.a(pbeq.o) : dimens.fcm
$(LIB)/misc.a(pbeq.o) : exfunc.fcm
$(LIB)/misc.a(pbeq.o) : heap.fcm
$(LIB)/misc.a(pbeq.o) : impnon.fcm
$(LIB)/misc.a(pbeq.o) : number.fcm
$(LIB)/misc.a(pbeq.o) : pbeq.fcm
$(LIB)/misc.a(pbeq.o) : psf.fcm
$(LIB)/misc.a(pbeq.o) : stack.fcm
$(LIB)/misc.a(pbeq.o) : stream.fcm
$(LIB)/misc.a(pbeq.o) : timer.fcm
#
#
$(LIB)/misc.a(primsh.o) : comand.fcm
$(LIB)/misc.a(primsh.o) : coord.fcm
$(LIB)/misc.a(primsh.o) : dimens.fcm
$(LIB)/misc.a(primsh.o) : exfunc.fcm
$(LIB)/misc.a(primsh.o) : heap.fcm
$(LIB)/misc.a(primsh.o) : impnon.fcm
$(LIB)/misc.a(primsh.o) : mmfp.fcm
$(LIB)/misc.a(primsh.o) : number.fcm
$(LIB)/misc.a(primsh.o) : psf.fcm
$(LIB)/misc.a(primsh.o) : stream.fcm
#
#
$(LIB)/misc.a(quicka.o) : comand.fcm
$(LIB)/misc.a(quicka.o) : consta.fcm
$(LIB)/misc.a(quicka.o) : coord.fcm
$(LIB)/misc.a(quicka.o) : dimens.fcm
$(LIB)/misc.a(quicka.o) : exfunc.fcm
$(LIB)/misc.a(quicka.o) : impnon.fcm
$(LIB)/misc.a(quicka.o) : number.fcm
$(LIB)/misc.a(quicka.o) : psf.fcm
$(LIB)/misc.a(quicka.o) : stream.fcm
#
#
$(LIB)/misc.a(resdist.o) : comand.fcm
$(LIB)/misc.a(resdist.o) : coord.fcm
$(LIB)/misc.a(resdist.o) : dimens.fcm
$(LIB)/misc.a(resdist.o) : exfunc.fcm
$(LIB)/misc.a(resdist.o) : heap.fcm
$(LIB)/misc.a(resdist.o) : impnon.fcm
$(LIB)/misc.a(resdist.o) : number.fcm
$(LIB)/misc.a(resdist.o) : parallel.fcm
$(LIB)/misc.a(resdist.o) : psf.fcm
$(LIB)/misc.a(resdist.o) : reawri.fcm
$(LIB)/misc.a(resdist.o) : resdist.fcm
$(LIB)/misc.a(resdist.o) : stream.fcm
#
#
$(LIB)/misc.a(sbound.o) : comand.fcm
$(LIB)/misc.a(sbound.o) : coord.fcm
$(LIB)/misc.a(sbound.o) : ctitla.fcm
$(LIB)/misc.a(sbound.o) : dimb.fcm
$(LIB)/misc.a(sbound.o) : dimens.fcm
$(LIB)/misc.a(sbound.o) : exfunc.fcm
$(LIB)/misc.a(sbound.o) : heap.fcm
$(LIB)/misc.a(sbound.o) : impnon.fcm
$(LIB)/misc.a(sbound.o) : number.fcm
$(LIB)/misc.a(sbound.o) : psf.fcm
$(LIB)/misc.a(sbound.o) : sbound.fcm
$(LIB)/misc.a(sbound.o) : stack.fcm
$(LIB)/misc.a(sbound.o) : stream.fcm
#
#
$(LIB)/misc.a(ssbp.o) : comand.fcm
$(LIB)/misc.a(ssbp.o) : consta.fcm
$(LIB)/misc.a(ssbp.o) : coord.fcm
$(LIB)/misc.a(ssbp.o) : dimens.fcm
$(LIB)/misc.a(ssbp.o) : exfunc.fcm
$(LIB)/misc.a(ssbp.o) : heap.fcm
$(LIB)/misc.a(ssbp.o) : impnon.fcm
$(LIB)/misc.a(ssbp.o) : mmfp.fcm
$(LIB)/misc.a(ssbp.o) : number.fcm
$(LIB)/misc.a(ssbp.o) : psf.fcm
$(LIB)/misc.a(ssbp.o) : ssbp.fcm
$(LIB)/misc.a(ssbp.o) : stream.fcm
#
#
$(LIB)/misc.a(surfac.o) : comand.fcm
$(LIB)/misc.a(surfac.o) : consta.fcm
$(LIB)/misc.a(surfac.o) : dimens.fcm
$(LIB)/misc.a(surfac.o) : exfunc.fcm
$(LIB)/misc.a(surfac.o) : heap.fcm
$(LIB)/misc.a(surfac.o) : impnon.fcm
$(LIB)/misc.a(surfac.o) : number.fcm
$(LIB)/misc.a(surfac.o) : param.fcm
$(LIB)/misc.a(surfac.o) : psf.fcm
$(LIB)/misc.a(surfac.o) : stack.fcm
$(LIB)/misc.a(surfac.o) : stream.fcm
#
#
$(LIB)/misc.a(testch.o) : bases.fcm
$(LIB)/misc.a(testch.o) : cnst.fcm
$(LIB)/misc.a(testch.o) : code.fcm
$(LIB)/misc.a(testch.o) : comand.fcm
$(LIB)/misc.a(testch.o) : coord.fcm
$(LIB)/misc.a(testch.o) : coordc.fcm
$(LIB)/misc.a(testch.o) : deriv.fcm
$(LIB)/misc.a(testch.o) : dimens.fcm
$(LIB)/misc.a(testch.o) : energy.fcm
$(LIB)/misc.a(testch.o) : exfunc.fcm
$(LIB)/misc.a(testch.o) : ffield.fcm
$(LIB)/misc.a(testch.o) : fourd.fcm
$(LIB)/misc.a(testch.o) : heap.fcm
$(LIB)/misc.a(testch.o) : image.fcm
$(LIB)/misc.a(testch.o) : impnon.fcm
$(LIB)/misc.a(testch.o) : mmff.fcm
$(LIB)/misc.a(testch.o) : number.fcm
$(LIB)/misc.a(testch.o) : parallel.fcm
$(LIB)/misc.a(testch.o) : param.fcm
$(LIB)/misc.a(testch.o) : psf.fcm
$(LIB)/misc.a(testch.o) : stack.fcm
$(LIB)/misc.a(testch.o) : stream.fcm
$(LIB)/misc.a(testch.o) : timer.fcm
$(LIB)/misc.a(testch.o) : vphi.fcm
#
#
$(LIB)/misc.a(xray.o) : coord.fcm
$(LIB)/misc.a(xray.o) : ctitla.fcm
$(LIB)/misc.a(xray.o) : dimens.fcm
$(LIB)/misc.a(xray.o) : exfunc.fcm
$(LIB)/misc.a(xray.o) : impnon.fcm
$(LIB)/misc.a(xray.o) : param.fcm
$(LIB)/misc.a(xray.o) : psf.fcm
$(LIB)/misc.a(xray.o) : stack.fcm
$(LIB)/misc.a(xray.o) : stream.fcm
#
#
$(LIB)/misc.a(zmat.o) : comand.fcm
$(LIB)/misc.a(zmat.o) : consta.fcm
$(LIB)/misc.a(zmat.o) : coord.fcm
$(LIB)/misc.a(zmat.o) : dimens.fcm
$(LIB)/misc.a(zmat.o) : exfunc.fcm
$(LIB)/misc.a(zmat.o) : heap.fcm
$(LIB)/misc.a(zmat.o) : impnon.fcm
$(LIB)/misc.a(zmat.o) : number.fcm
$(LIB)/misc.a(zmat.o) : psf.fcm
$(LIB)/misc.a(zmat.o) : stack.fcm
$(LIB)/misc.a(zmat.o) : stream.fcm
#
