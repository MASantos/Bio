# moldyn makefile
# moldyn library rules
# MBONDFLG is defined in Makefile_machine
OBJS_moldyn= \
	$(LIB)/moldyn.a(add3.o) \
	$(LIB)/moldyn.a(addt.o) \
	$(LIB)/moldyn.a(adt.o) \
	$(LIB)/moldyn.a(amadji.o) \
	$(LIB)/moldyn.a(bckwrd.o) \
	$(LIB)/moldyn.a(bdotqp.o) \
	$(LIB)/moldyn.a(bh2.o) \
	$(LIB)/moldyn.a(bhgenr.o) \
	$(LIB)/moldyn.a(bhmult.o) \
	$(LIB)/moldyn.a(bkinit.o) \
	$(LIB)/moldyn.a(branch_out.o) \
	$(LIB)/moldyn.a(cbod.o) \
	$(LIB)/moldyn.a(cgadji.o) \
	$(LIB)/moldyn.a(cgadji2.o) \
	$(LIB)/moldyn.a(check_sng1.o) \
	$(LIB)/moldyn.a(check_sng2.o) \
	$(LIB)/moldyn.a(chkbon.o) \
	$(LIB)/moldyn.a(cjmpls.o) \
	$(LIB)/moldyn.a(clbck1.o) \
	$(LIB)/moldyn.a(clbck2.o) \
	$(LIB)/moldyn.a(clear.o) \
	$(LIB)/moldyn.a(clfor1.o) \
	$(LIB)/moldyn.a(clfor3.o) \
	$(LIB)/moldyn.a(clfr2a.o) \
	$(LIB)/moldyn.a(clfr2b.o) \
	$(LIB)/moldyn.a(cmpic1.o) \
	$(LIB)/moldyn.a(cmpic2.o) \
	$(LIB)/moldyn.a(cmpic3.o) \
	$(LIB)/moldyn.a(cmposn.o) \
	$(LIB)/moldyn.a(compin.o) \
	$(LIB)/moldyn.a(compiv.o) \
	$(LIB)/moldyn.a(cpamat.o) \
	$(LIB)/moldyn.a(crea.o) \
	$(LIB)/moldyn.a(cread0.o) \
	$(LIB)/moldyn.a(creb.o) \
	$(LIB)/moldyn.a(crec.o) \
	$(LIB)/moldyn.a(cree.o) \
	$(LIB)/moldyn.a(cremu0.o) \
	$(LIB)/moldyn.a(cret3.o) \
	$(LIB)/moldyn.a(ctinit1_CHARMM.o) \
	$(LIB)/moldyn.a(datex.o) \
	$(LIB)/moldyn.a(delta_v.o) \
	$(LIB)/moldyn.a(dgeco.o) \
	$(LIB)/moldyn.a(dgefa.o) \
	$(LIB)/moldyn.a(dgesl.o) \
	$(LIB)/moldyn.a(dlef.o) \
	$(LIB)/moldyn.a(dlespa.o) \
	$(LIB)/moldyn.a(dllt.o) \
	$(LIB)/moldyn.a(dloop.o) \
	$(LIB)/moldyn.a(dsico.o) \
	$(LIB)/moldyn.a(dsifa.o) \
	$(LIB)/moldyn.a(dsisl.o) \
	$(LIB)/moldyn.a(dsvdc.o) \
	$(LIB)/moldyn.a(dyns20.o) \
	$(LIB)/moldyn.a(eign1.o) \
	$(LIB)/moldyn.a(engmom.o) \
	$(LIB)/moldyn.a(engmom_ke.o) \
	$(LIB)/moldyn.a(errhdl.o) \
	$(LIB)/moldyn.a(eulerAngle.o) \
	$(LIB)/moldyn.a(eulseq.o) \
	$(LIB)/moldyn.a(extor_CHARMM.o) \
	$(LIB)/moldyn.a(factor_b.o) \
	$(LIB)/moldyn.a(fetch.o) \
	$(LIB)/moldyn.a(fix_orphan.o) \
	$(LIB)/moldyn.a(fortran90.o) \
	$(LIB)/moldyn.a(frwd1a.o) \
	$(LIB)/moldyn.a(frwd1b.o) \
	$(LIB)/moldyn.a(frwrd2.o) \
	$(LIB)/moldyn.a(getbh.o) \
	$(LIB)/moldyn.a(getvel.o) \
	$(LIB)/moldyn.a(house.o) \
	$(LIB)/moldyn.a(init_vcd.o) \
	$(LIB)/moldyn.a(initHeap.o) \
	$(LIB)/moldyn.a(irnd.o) \
	$(LIB)/moldyn.a(kabsch.o) \
	$(LIB)/moldyn.a(lforce.o) \
	$(LIB)/moldyn.a(lmadji.o) \
	$(LIB)/moldyn.a(lobint.o) \
	$(LIB)/moldyn.a(lobto.o) \
	$(LIB)/moldyn.a(mbdyna.o) \
	$(LIB)/moldyn.a(mbtopol.o) \
	$(LIB)/moldyn.a(mdloop_CHARMM.o) \
	$(LIB)/moldyn.a(memory.o) \
	$(LIB)/moldyn.a(mgen.o) \
	$(LIB)/moldyn.a(msmodf.o) \
	$(LIB)/moldyn.a(msmodr.o) \
	$(LIB)/moldyn.a(msub.o) \
	$(LIB)/moldyn.a(mtsratio.o) \
	$(LIB)/moldyn.a(multb.o) \
	$(LIB)/moldyn.a(multsym.o) \
	$(LIB)/moldyn.a(pagehd.o) \
	$(LIB)/moldyn.a(plotwr.o) \
	$(LIB)/moldyn.a(posrms.o) \
	$(LIB)/moldyn.a(prntbd.o) \
	$(LIB)/moldyn.a(prnten.o) \
	$(LIB)/moldyn.a(prntou.o) \
	$(LIB)/moldyn.a(prntsm.o) \
	$(LIB)/moldyn.a(psitx.o) \
	$(LIB)/moldyn.a(rcmatprd.o) \
	$(LIB)/moldyn.a(rcvcross.o) \
	$(LIB)/moldyn.a(rk4.o) \
	$(LIB)/moldyn.a(rkdumb.o) \
	$(LIB)/moldyn.a(rotdh.o) \
	$(LIB)/moldyn.a(rotdh1_CHARMM.o) \
	$(LIB)/moldyn.a(rotds.o) \
	$(LIB)/moldyn.a(rotran.o) \
	$(LIB)/moldyn.a(rottr.o) \
	$(LIB)/moldyn.a(rtadj.o) \
	$(LIB)/moldyn.a(rtcost.o) \
	$(LIB)/moldyn.a(rtcst2.o) \
	$(LIB)/moldyn.a(rtiter.o) \
	$(LIB)/moldyn.a(second.o) \
	$(LIB)/moldyn.a(sizes_amat.o) \
	$(LIB)/moldyn.a(skewv3.o) \
	$(LIB)/moldyn.a(start.o) \
	$(LIB)/moldyn.a(store.o) \
	$(LIB)/moldyn.a(svbksb.o) \
	$(LIB)/moldyn.a(torque.o) \
	$(LIB)/moldyn.a(vcdint.o) \
	$(LIB)/moldyn.a(vcross.o) \
	$(LIB)/moldyn.a(vel_verl.o) \
	$(LIB)/moldyn.a(velrms.o) \
	$(LIB)/moldyn.a(verlcd.o) \
	$(LIB)/moldyn.a(vmispa.o) \
	$(LIB)/moldyn.a(vvint.o) \
	$(LIB)/moldyn.a(write.o) \
	$(LIB)/moldyn.a(writelgcl.o) \
	$(LIB)/moldyn.a(writes.o) \
	$(LIB)/moldyn.a(writim.o) \
	$(LIB)/moldyn.a(writis.o) \
	$(LIB)/moldyn.a(ydot.o) \
	$(LIB)/moldyn.a(zero.o)
#
$(LIB)/moldyn.a : $(OBJS_moldyn)
	$(RANLIB) $(LIB)/moldyn.a
	@echo moldyn COMPLETED
#
# moldyn source file rules
#
$(LIB)/moldyn.a(add3.o): $(SRC)/moldyn/add3.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/add3.f > add3.F
	$(FC2) $(MBONDFLG) add3.F
	ar rucv $(LIB)/moldyn.a add3.o
	rm  add3.o
	rm  add3.F
#
$(LIB)/moldyn.a(addt.o): $(SRC)/moldyn/addt.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/addt.f > addt.F
	$(FC2) $(MBONDFLG) addt.F
	ar rucv $(LIB)/moldyn.a addt.o
	rm  addt.o
	rm  addt.F
#
$(LIB)/moldyn.a(adt.o): $(SRC)/moldyn/adt.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/adt.f > adt.F
	$(FC2) $(MBONDFLG) adt.F
	ar rucv $(LIB)/moldyn.a adt.o
	rm  adt.o
	rm  adt.F
#
$(LIB)/moldyn.a(amadji.o): $(SRC)/moldyn/amadji.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/amadji.f > amadji.F
	$(FC2) $(MBONDFLG) amadji.F
	ar rucv $(LIB)/moldyn.a amadji.o
	rm  amadji.o
	rm  amadji.F
#
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/bckwrd.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/bckwrd.f > bckwrd.F
	$(FC2) $(MBONDFLG) bckwrd.F
	ar rucv $(LIB)/moldyn.a bckwrd.o
	rm  bckwrd.o
	rm  bckwrd.F
#
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/bdotqp.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/bdotqp.f > bdotqp.F
	$(FC2) $(MBONDFLG) bdotqp.F
	ar rucv $(LIB)/moldyn.a bdotqp.o
	rm  bdotqp.o
	rm  bdotqp.F
#
$(LIB)/moldyn.a(bh2.o): $(SRC)/moldyn/bh2.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/bh2.f > bh2.F
	$(FC2) $(MBONDFLG) bh2.F
	ar rucv $(LIB)/moldyn.a bh2.o
	rm  bh2.o
	rm  bh2.F
#
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/bhgenr.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/bhgenr.f > bhgenr.F
	$(FC2) $(MBONDFLG) bhgenr.F
	ar rucv $(LIB)/moldyn.a bhgenr.o
	rm  bhgenr.o
	rm  bhgenr.F
#
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/bhmult.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/bhmult.f > bhmult.F
	$(FC2) $(MBONDFLG) bhmult.F
	ar rucv $(LIB)/moldyn.a bhmult.o
	rm  bhmult.o
	rm  bhmult.F
#
$(LIB)/moldyn.a(bkinit.o): $(SRC)/moldyn/bkinit.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/bkinit.f > bkinit.F
	$(FC2) $(MBONDFLG) bkinit.F
	ar rucv $(LIB)/moldyn.a bkinit.o
	rm  bkinit.o
	rm  bkinit.F
#
$(LIB)/moldyn.a(branch_out.o): $(SRC)/moldyn/branch_out.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/branch_out.f > branch_out.F
	$(FC2) $(MBONDFLG) branch_out.F
	ar rucv $(LIB)/moldyn.a branch_out.o
	rm  branch_out.o
	rm  branch_out.F
#
$(LIB)/moldyn.a(cbod.o): $(SRC)/moldyn/cbod.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cbod.f > cbod.F
	$(FC2) $(MBONDFLG) cbod.F
	ar rucv $(LIB)/moldyn.a cbod.o
	rm  cbod.o
	rm  cbod.F
#
$(LIB)/moldyn.a(cgadji.o): $(SRC)/moldyn/cgadji.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cgadji.f > cgadji.F
	$(FC2) $(MBONDFLG) cgadji.F
	ar rucv $(LIB)/moldyn.a cgadji.o
	rm  cgadji.o
	rm  cgadji.F
#
$(LIB)/moldyn.a(cgadji2.o): $(SRC)/moldyn/cgadji2.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cgadji2.f > cgadji2.F
	$(FC2) $(MBONDFLG) cgadji2.F
	ar rucv $(LIB)/moldyn.a cgadji2.o
	rm  cgadji2.o
	rm  cgadji2.F
#
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/check_sng1.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/check_sng1.f > check_sng1.F
	$(FC2) $(MBONDFLG) check_sng1.F
	ar rucv $(LIB)/moldyn.a check_sng1.o
	rm check_sng1.o
	rm check_sng1.F
#
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/check_sng2.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/check_sng2.f > check_sng2.F
	$(FC2) $(MBONDFLG) check_sng2.F
	ar rucv $(LIB)/moldyn.a check_sng2.o
	rm check_sng2.o
	rm check_sng2.F
#
$(LIB)/moldyn.a(chkbon.o): $(SRC)/moldyn/chkbon.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/chkbon.f > chkbon.F
	$(FC2) $(MBONDFLG) chkbon.F
	ar rucv $(LIB)/moldyn.a chkbon.o
	rm  chkbon.o
	rm  chkbon.F
#
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/cjmpls.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cjmpls.f > cjmpls.F
	$(FC2) $(MBONDFLG) cjmpls.F
	ar rucv $(LIB)/moldyn.a cjmpls.o
	rm  cjmpls.o
	rm  cjmpls.F
#
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/clbck1.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/clbck1.f > clbck1.F
	$(FC2) $(MBONDFLG) clbck1.F
	ar rucv $(LIB)/moldyn.a clbck1.o
	rm  clbck1.o
	rm  clbck1.F
#
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/clbck2.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/clbck2.f > clbck2.F
	$(FC2) $(MBONDFLG) clbck2.F
	ar rucv $(LIB)/moldyn.a clbck2.o
	rm  clbck2.o
	rm  clbck2.F
#
$(LIB)/moldyn.a(clear.o): $(SRC)/moldyn/clear.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/clear.f > clear.F
	$(FC2) $(MBONDFLG) clear.F
	ar rucv $(LIB)/moldyn.a clear.o
	rm  clear.o
	rm  clear.F
#
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/clfor1.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/clfor1.f > clfor1.F
	$(FC2) $(MBONDFLG) clfor1.F
	ar rucv $(LIB)/moldyn.a clfor1.o
	rm  clfor1.o
	rm  clfor1.F
#
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/clfor3.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/clfor3.f > clfor3.F
	$(FC2) $(MBONDFLG) clfor3.F
	ar rucv $(LIB)/moldyn.a clfor3.o
	rm  clfor3.o
	rm  clfor3.F
#
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/clfr2a.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/clfr2a.f > clfr2a.F
	$(FC2) $(MBONDFLG) clfr2a.F
	ar rucv $(LIB)/moldyn.a clfr2a.o
	rm  clfr2a.o
	rm  clfr2a.F
#
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/clfr2b.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/clfr2b.f > clfr2b.F
	$(FC2) $(MBONDFLG) clfr2b.F
	ar rucv $(LIB)/moldyn.a clfr2b.o
	rm  clfr2b.o
	rm  clfr2b.F
#
$(LIB)/moldyn.a(cmpic1.o): $(SRC)/moldyn/cmpic1.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cmpic1.f > cmpic1.F
	$(FC2) $(MBONDFLG) cmpic1.F
	ar rucv $(LIB)/moldyn.a cmpic1.o
	rm  cmpic1.o
	rm  cmpic1.F
#
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/cmpic2.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cmpic2.f > cmpic2.F
	$(FC2) $(MBONDFLG) cmpic2.F
	ar rucv $(LIB)/moldyn.a cmpic2.o
	rm  cmpic2.o
	rm  cmpic2.F
#
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/cmpic3.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cmpic3.f > cmpic3.F
	$(FC2) $(MBONDFLG) cmpic3.F
	ar rucv $(LIB)/moldyn.a cmpic3.o
	rm  cmpic3.o
	rm  cmpic3.F
#
$(LIB)/moldyn.a(cmposn.o): $(SRC)/moldyn/cmposn.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cmposn.f > cmposn.F
	$(FC2) $(MBONDFLG) cmposn.F
	ar rucv $(LIB)/moldyn.a cmposn.o
	rm  cmposn.o
	rm  cmposn.F
#
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/compin.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/compin.f > compin.F
	$(FC2) $(MBONDFLG) compin.F
	ar rucv $(LIB)/moldyn.a compin.o
	rm  compin.o
	rm  compin.F
#
$(LIB)/moldyn.a(compiv.o): $(SRC)/moldyn/compiv.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/compiv.f > compiv.F
	$(FC2) $(MBONDFLG) compiv.F
	ar rucv $(LIB)/moldyn.a compiv.o
	rm  compiv.o
	rm  compiv.F
#
$(LIB)/moldyn.a(cpamat.o): $(SRC)/moldyn/cpamat.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cpamat.f > cpamat.F
	$(FC2) $(MBONDFLG) cpamat.F
	ar rucv $(LIB)/moldyn.a cpamat.o
	rm  cpamat.o
	rm  cpamat.F
#
$(LIB)/moldyn.a(crea.o): $(SRC)/moldyn/crea.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/crea.f > crea.F
	$(FC2) $(MBONDFLG) crea.F
	ar rucv $(LIB)/moldyn.a crea.o
	rm  crea.o
	rm  crea.F
#
$(LIB)/moldyn.a(cread0.o): $(SRC)/moldyn/cread0.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cread0.f > cread0.F
	$(FC2) $(MBONDFLG) cread0.F
	ar rucv $(LIB)/moldyn.a cread0.o
	rm  cread0.o
	rm  cread0.F
#
$(LIB)/moldyn.a(creb.o): $(SRC)/moldyn/creb.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/creb.f > creb.F
	$(FC2) $(MBONDFLG) creb.F
	ar rucv $(LIB)/moldyn.a creb.o
	rm  creb.o
	rm  creb.F
#
$(LIB)/moldyn.a(crec.o): $(SRC)/moldyn/crec.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/crec.f > crec.F
	$(FC2) $(MBONDFLG) crec.F
	ar rucv $(LIB)/moldyn.a crec.o
	rm  crec.o
	rm  crec.F
#
$(LIB)/moldyn.a(cree.o): $(SRC)/moldyn/cree.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cree.f > cree.F
	$(FC2) $(MBONDFLG) cree.F
	ar rucv $(LIB)/moldyn.a cree.o
	rm  cree.o
	rm  cree.F
#
$(LIB)/moldyn.a(cremu0.o): $(SRC)/moldyn/cremu0.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cremu0.f > cremu0.F
	$(FC2) $(MBONDFLG) cremu0.F
	ar rucv $(LIB)/moldyn.a cremu0.o
	rm  cremu0.o
	rm  cremu0.F
#
$(LIB)/moldyn.a(cret3.o): $(SRC)/moldyn/cret3.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/cret3.f > cret3.F
	$(FC2) $(MBONDFLG) cret3.F
	ar rucv $(LIB)/moldyn.a cret3.o
	rm  cret3.o
	rm  cret3.F
#
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/ctinit1_CHARMM.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/ctinit1_CHARMM.f >ctinit1_CHARMM.F
	$(FC2) $(MBONDFLG) ctinit1_CHARMM.F
	ar rucv $(LIB)/moldyn.a ctinit1_CHARMM.o
	rm ctinit1_CHARMM.o
	rm ctinit1_CHARMM.F
#
$(LIB)/moldyn.a(datex.o): $(SRC)/moldyn/datex.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/datex.f > datex.F
	$(FC2) $(MBONDFLG) datex.F
	ar rucv $(LIB)/moldyn.a datex.o
	rm  datex.o
	rm  datex.F
#
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/delta_v.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/delta_v.f > delta_v.F
	$(FC2) $(MBONDFLG) delta_v.F
	ar rucv $(LIB)/moldyn.a delta_v.o
	rm delta_v.o
	rm delta_v.F
#
$(LIB)/moldyn.a(dgeco.o): $(SRC)/moldyn/dgeco.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dgeco.f > dgeco.F
	$(FC2) $(MBONDFLG) dgeco.F
	ar rucv $(LIB)/moldyn.a dgeco.o
	rm  dgeco.o
	rm  dgeco.F
#
$(LIB)/moldyn.a(dgefa.o): $(SRC)/moldyn/dgefa.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dgefa.f > dgefa.F
	$(FC2) $(MBONDFLG) dgefa.F
	ar rucv $(LIB)/moldyn.a dgefa.o
	rm  dgefa.o
	rm  dgefa.F
#
$(LIB)/moldyn.a(dgesl.o): $(SRC)/moldyn/dgesl.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dgesl.f > dgesl.F
	$(FC2) $(MBONDFLG) dgesl.F
	ar rucv $(LIB)/moldyn.a dgesl.o
	rm  dgesl.o
	rm  dgesl.F
#
$(LIB)/moldyn.a(dlef.o): $(SRC)/moldyn/dlef.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dlef.f > dlef.F
	$(FC2) $(MBONDFLG) dlef.F
	ar rucv $(LIB)/moldyn.a dlef.o
	rm  dlef.o
	rm  dlef.F
#
$(LIB)/moldyn.a(dlespa.o): $(SRC)/moldyn/dlespa.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dlespa.f > dlespa.F
	$(FC2) $(MBONDFLG) dlespa.F
	ar rucv $(LIB)/moldyn.a dlespa.o
	rm  dlespa.o
	rm  dlespa.F
#
$(LIB)/moldyn.a(dllt.o): $(SRC)/moldyn/dllt.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dllt.f > dllt.F
	$(FC2) $(MBONDFLG) dllt.F
	ar rucv $(LIB)/moldyn.a dllt.o
	rm  dllt.o
	rm  dllt.F
#
$(LIB)/moldyn.a(dloop.o): $(SRC)/moldyn/dloop.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dloop.f > dloop.F
	$(FC2) $(MBONDFLG) dloop.F
	ar rucv $(LIB)/moldyn.a dloop.o
	rm  dloop.o
	rm  dloop.F
#
$(LIB)/moldyn.a(dsico.o): $(SRC)/moldyn/dsico.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dsico.f > dsico.F
	$(FC2) $(MBONDFLG) dsico.F
	ar rucv $(LIB)/moldyn.a dsico.o
	rm  dsico.o
	rm  dsico.F
#
$(LIB)/moldyn.a(dsifa.o): $(SRC)/moldyn/dsifa.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dsifa.f > dsifa.F
	$(FC2) $(MBONDFLG) dsifa.F
	ar rucv $(LIB)/moldyn.a dsifa.o
	rm  dsifa.o
	rm  dsifa.F
#
$(LIB)/moldyn.a(dsisl.o): $(SRC)/moldyn/dsisl.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dsisl.f > dsisl.F
	$(FC2) $(MBONDFLG) dsisl.F
	ar rucv $(LIB)/moldyn.a dsisl.o
	rm  dsisl.o
	rm  dsisl.F
#
$(LIB)/moldyn.a(dsvdc.o): $(SRC)/moldyn/dsvdc.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dsvdc.f > dsvdc.F
	$(FC2) $(MBONDFLG) dsvdc.F
	ar rucv $(LIB)/moldyn.a dsvdc.o
	rm  dsvdc.o
	rm  dsvdc.F
#
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/dyns20.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/dyns20.f > dyns20.F
	$(FC2) $(MBONDFLG) dyns20.F
	ar rucv $(LIB)/moldyn.a dyns20.o
	rm  dyns20.o
	rm  dyns20.F
#
$(LIB)/moldyn.a(eign1.o): $(SRC)/moldyn/eign1.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/eign1.f > eign1.F
	$(FC2) $(MBONDFLG) eign1.F
	ar rucv $(LIB)/moldyn.a eign1.o
	rm  eign1.o
	rm  eign1.F
#
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/engmom.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/engmom.f > engmom.F
	$(FC2) $(MBONDFLG) engmom.F
	ar rucv $(LIB)/moldyn.a engmom.o
	rm  engmom.o
	rm  engmom.F
#
$(LIB)/moldyn.a(engmom_ke.o): $(SRC)/moldyn/engmom_ke.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/engmom_ke.f> engmom_ke.F
	$(FC2) $(MBONDFLG) engmom_ke.F
	ar rucv $(LIB)/moldyn.a engmom_ke.o
	rm engmom_ke.o
	rm engmom_ke.F
#
$(LIB)/moldyn.a(errhdl.o): $(SRC)/moldyn/errhdl.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/errhdl.f > errhdl.F
	$(FC2) $(MBONDFLG) errhdl.F
	ar rucv $(LIB)/moldyn.a errhdl.o
	rm  errhdl.o
	rm  errhdl.F
#
$(LIB)/moldyn.a(eulerAngle.o): $(SRC)/moldyn/eulerAngle.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/eulerAngle.f > eulerAngle.F
	$(FC2) $(MBONDFLG) eulerAngle.F
	ar rucv $(LIB)/moldyn.a eulerAngle.o
	rm  eulerAngle.o
	rm  eulerAngle.F
#
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/eulseq.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/eulseq.f > eulseq.F
	$(FC2) $(MBONDFLG) eulseq.F
	ar rucv $(LIB)/moldyn.a eulseq.o
	rm  eulseq.o
	rm  eulseq.F
#
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/extor_CHARMM.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/extor_CHARMM.f > extor_CHARMM.F
	$(FC2) $(MBONDFLG) extor_CHARMM.F
	ar rucv $(LIB)/moldyn.a extor_CHARMM.o
	rm extor_CHARMM.o
	rm extor_CHARMM.F
#
$(LIB)/moldyn.a(factor_b.o): $(SRC)/moldyn/factor_b.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/factor_b.f > factor_b.F
	$(FC2) $(MBONDFLG) factor_b.F
	ar rucv $(LIB)/moldyn.a factor_b.o
	rm factor_b.o
	rm factor_b.F
#
$(LIB)/moldyn.a(fetch.o): $(SRC)/moldyn/fetch.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/fetch.f > fetch.F
	$(FC2) $(MBONDFLG) fetch.F
	ar rucv $(LIB)/moldyn.a fetch.o
	rm  fetch.o
	rm  fetch.F
#
$(LIB)/moldyn.a(fix_orphan.o): $(SRC)/moldyn/fix_orphan.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/fix_orphan.f > fix_orphan.F
	$(FC2) $(MBONDFLG) fix_orphan.F
	ar rucv $(LIB)/moldyn.a fix_orphan.o
	rm fix_orphan.o
	rm fix_orphan.F
#
$(LIB)/moldyn.a(fortran90.o): $(SRC)/moldyn/fortran90.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/fortran90.f > fortran90.F
	$(FC2) $(MBONDFLG) fortran90.F
	ar rucv $(LIB)/moldyn.a fortran90.o
	rm fortran90.o
	rm fortran90.F
#
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/frwd1a.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/frwd1a.f > frwd1a.F
	$(FC2) $(MBONDFLG) frwd1a.F
	ar rucv $(LIB)/moldyn.a frwd1a.o
	rm  frwd1a.o
	rm  frwd1a.F
#
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/frwd1b.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/frwd1b.f > frwd1b.F
	$(FC2) $(MBONDFLG) frwd1b.F
	ar rucv $(LIB)/moldyn.a frwd1b.o
	rm  frwd1b.o
	rm  frwd1b.F
#
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/frwrd2.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/frwrd2.f > frwrd2.F
	$(FC2) $(MBONDFLG) frwrd2.F
	ar rucv $(LIB)/moldyn.a frwrd2.o
	rm  frwrd2.o
	rm  frwrd2.F
#
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/getbh.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/getbh.f > getbh.F
	$(FC2) $(MBONDFLG) getbh.F
	ar rucv $(LIB)/moldyn.a getbh.o
	rm  getbh.o
	rm  getbh.F
#
$(LIB)/moldyn.a(getvel.o): $(SRC)/moldyn/getvel.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/getvel.f > getvel.F
	$(FC2) $(MBONDFLG) getvel.F
	ar rucv $(LIB)/moldyn.a getvel.o
	rm  getvel.o
	rm  getvel.F
#
$(LIB)/moldyn.a(house.o): $(SRC)/moldyn/house.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/house.f > house.F
	$(FC2) $(MBONDFLG) house.F
	ar rucv $(LIB)/moldyn.a house.o
	rm  house.o
	rm  house.F
#
$(LIB)/moldyn.a(init_vcd.o): $(SRC)/moldyn/init_vcd.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/init_vcd.f > init_vcd.F
	$(FC2) $(MBONDFLG) init_vcd.F
	ar rucv $(LIB)/moldyn.a init_vcd.o
	rm init_vcd.o
	rm init_vcd.F
#
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/initHeap.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/initHeap.f > initHeap.F
	$(FC2) $(MBONDFLG) initHeap.F
	ar rucv $(LIB)/moldyn.a initHeap.o
	rm  initHeap.o
	rm  initHeap.F
#
$(LIB)/moldyn.a(irnd.o): $(SRC)/moldyn/irnd.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/irnd.f > irnd.F
	$(FC2) $(MBONDFLG) irnd.F
	ar rucv $(LIB)/moldyn.a irnd.o
	rm  irnd.o
	rm  irnd.F
#
$(LIB)/moldyn.a(kabsch.o): $(SRC)/moldyn/kabsch.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/kabsch.f > kabsch.F
	$(FC2) $(MBONDFLG) kabsch.F
	ar rucv $(LIB)/moldyn.a kabsch.o
	rm  kabsch.o
	rm  kabsch.F
#
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/lforce.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/lforce.f > lforce.F
	$(FC2) $(MBONDFLG) lforce.F
	ar rucv $(LIB)/moldyn.a lforce.o
	rm  lforce.o
	rm  lforce.F
#
$(LIB)/moldyn.a(lmadji.o): $(SRC)/moldyn/lmadji.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/lmadji.f > lmadji.F
	$(FC2) $(MBONDFLG) lmadji.F
	ar rucv $(LIB)/moldyn.a lmadji.o
	rm  lmadji.o
	rm  lmadji.F
#
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/lobint.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/lobint.f > lobint.F
	$(FC2) $(MBONDFLG) lobint.F
	ar rucv $(LIB)/moldyn.a lobint.o
	rm  lobint.o
	rm  lobint.F
#
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/lobto.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/lobto.f > lobto.F
	$(FC2) $(MBONDFLG) lobto.F
	ar rucv $(LIB)/moldyn.a lobto.o
	rm  lobto.o
	rm  lobto.F
#
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/mbdyna.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/mbdyna.f > mbdyna.F
	$(FC2) $(MBONDFLG) mbdyna.F
	ar rucv $(LIB)/moldyn.a mbdyna.o
	rm  mbdyna.o
	rm  mbdyna.F
#
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/mbtopol.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/mbtopol.f > mbtopol.F
	$(FC2) $(MBONDFLG) mbtopol.F
	ar rucv $(LIB)/moldyn.a mbtopol.o
	rm  mbtopol.o
	rm  mbtopol.F
#
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/mdloop_CHARMM.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/mdloop_CHARMM.f > mdloop_CHARMM.F
	$(FC2) $(MBONDFLG) mdloop_CHARMM.F
	ar rucv $(LIB)/moldyn.a mdloop_CHARMM.o
	rm mdloop_CHARMM.o
	rm mdloop_CHARMM.F
#
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/memory.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/memory.f > memory.F
	$(FC2) $(MBONDFLG) memory.F
	ar rucv $(LIB)/moldyn.a memory.o
	rm  memory.o
	rm  memory.F
#
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/mgen.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/mgen.f > mgen.F
	$(FC2) $(MBONDFLG) mgen.F
	ar rucv $(LIB)/moldyn.a mgen.o
	rm  mgen.o
	rm  mgen.F
#
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/msmodf.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/msmodf.f >msmodf.F
	$(FC2) $(MBONDFLG) msmodf.F
	ar rucv $(LIB)/moldyn.a msmodf.o
	rm  msmodf.o
	rm  msmodf.F
#
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/msmodr.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/msmodr.f > msmodr.F
	$(FC2) $(MBONDFLG) msmodr.F
	ar rucv $(LIB)/moldyn.a msmodr.o
	rm  msmodr.o
	rm  msmodr.F
#
$(LIB)/moldyn.a(msub.o): $(SRC)/moldyn/msub.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/msub.f >msub.F
	$(FC2) $(MBONDFLG) msub.F
	ar rucv $(LIB)/moldyn.a msub.o
	rm  msub.o
	rm  msub.F
#
$(LIB)/moldyn.a(mtsratio.o): $(SRC)/moldyn/mtsratio.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/mtsratio.f > mtsratio.F
	$(FC2) $(MBONDFLG) mtsratio.F
	ar rucv $(LIB)/moldyn.a mtsratio.o
	rm  mtsratio.o
	rm  mtsratio.F
#
$(LIB)/moldyn.a(multb.o): $(SRC)/moldyn/multb.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/multb.f > multb.F
	$(FC2) $(MBONDFLG) multb.F
	ar rucv $(LIB)/moldyn.a multb.o
	rm  multb.o
	rm  multb.F
#
$(LIB)/moldyn.a(multsym.o): $(SRC)/moldyn/multsym.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/multsym.f > multsym.F
	$(FC2) $(MBONDFLG) multsym.F
	ar rucv $(LIB)/moldyn.a multsym.o
	rm  multsym.o
	rm  multsym.F
#
$(LIB)/moldyn.a(pagehd.o): $(SRC)/moldyn/pagehd.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/pagehd.f > pagehd.F
	$(FC2) $(MBONDFLG) pagehd.F
	ar rucv $(LIB)/moldyn.a pagehd.o
	rm  pagehd.o
	rm  pagehd.F
#
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/plotwr.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/plotwr.f > plotwr.F
	$(FC2) $(MBONDFLG) plotwr.F
	ar rucv $(LIB)/moldyn.a plotwr.o
	rm  plotwr.o
	rm  plotwr.F
#
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/posrms.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/posrms.f > posrms.F
	$(FC2) $(MBONDFLG) posrms.F
	ar rucv $(LIB)/moldyn.a posrms.o
	rm  posrms.o
	rm  posrms.F
#
$(LIB)/moldyn.a(prntbd.o): $(SRC)/moldyn/prntbd.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/prntbd.f > prntbd.F
	$(FC2) $(MBONDFLG) prntbd.F
	ar rucv $(LIB)/moldyn.a prntbd.o
	rm  prntbd.o
	rm  prntbd.F
#
$(LIB)/moldyn.a(prnten.o): $(SRC)/moldyn/prnten.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/prnten.f > prnten.F
	$(FC2) $(MBONDFLG) prnten.F
	ar rucv $(LIB)/moldyn.a prnten.o
	rm  prnten.o
	rm  prnten.F
#
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/prntou.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/prntou.f > prntou.F
	$(FC2) $(MBONDFLG) prntou.F
	ar rucv $(LIB)/moldyn.a prntou.o
	rm  prntou.o
	rm  prntou.F
#
$(LIB)/moldyn.a(prntsm.o): $(SRC)/moldyn/prntsm.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/prntsm.f > prntsm.F
	$(FC2) $(MBONDFLG) prntsm.F
	ar rucv $(LIB)/moldyn.a prntsm.o
	rm  prntsm.o
	rm  prntsm.F
#
$(LIB)/moldyn.a(psitx.o): $(SRC)/moldyn/psitx.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/psitx.f > psitx.F
	$(FC2) $(MBONDFLG) psitx.F
	ar rucv $(LIB)/moldyn.a psitx.o
	rm  psitx.o
	rm  psitx.F
#
$(LIB)/moldyn.a(rcmatprd.o): $(SRC)/moldyn/rcmatprd.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rcmatprd.f > rcmatprd.F
	$(FC2) $(MBONDFLG) rcmatprd.F
	ar rucv $(LIB)/moldyn.a rcmatprd.o
	rm  rcmatprd.o
	rm  rcmatprd.F
#
$(LIB)/moldyn.a(rcvcross.o): $(SRC)/moldyn/rcvcross.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rcvcross.f > rcvcross.F
	$(FC2) $(MBONDFLG) rcvcross.F
	ar rucv $(LIB)/moldyn.a rcvcross.o
	rm  rcvcross.o
	rm  rcvcross.F
#
$(LIB)/moldyn.a(rk4.o): $(SRC)/moldyn/rk4.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rk4.f > rk4.F
	$(FC2) $(MBONDFLG) rk4.F
	ar rucv $(LIB)/moldyn.a rk4.o
	rm  rk4.o
	rm  rk4.F
#
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/rkdumb.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rkdumb.f > rkdumb.F
	$(FC2) $(MBONDFLG) rkdumb.F
	ar rucv $(LIB)/moldyn.a rkdumb.o
	rm  rkdumb.o
	rm  rkdumb.F
#
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/rotdh.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rotdh.f > rotdh.F
	$(FC2) $(MBONDFLG) rotdh.F
	ar rucv $(LIB)/moldyn.a rotdh.o
	rm  rotdh.o
	rm  rotdh.F
#
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/rotdh1_CHARMM.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rotdh1_CHARMM.f > rotdh1_CHARMM.F
	$(FC2) $(MBONDFLG) rotdh1_CHARMM.F
	ar rucv $(LIB)/moldyn.a rotdh1_CHARMM.o
	rm rotdh1_CHARMM.o
	rm rotdh1_CHARMM.F
#
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/rotds.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rotds.f > rotds.F
	$(FC2) $(MBONDFLG) rotds.F
	ar rucv $(LIB)/moldyn.a rotds.o
	rm  rotds.o
	rm  rotds.F
#
$(LIB)/moldyn.a(rotran.o): $(SRC)/moldyn/rotran.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rotran.f > rotran.F
	$(FC2) $(MBONDFLG) rotran.F
	ar rucv $(LIB)/moldyn.a rotran.o
	rm  rotran.o
	rm  rotran.F
#
$(LIB)/moldyn.a(rottr.o): $(SRC)/moldyn/rottr.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rottr.f > rottr.F
	$(FC2) $(MBONDFLG) rottr.F
	ar rucv $(LIB)/moldyn.a rottr.o
	rm  rottr.o
	rm  rottr.F
#
$(LIB)/moldyn.a(rtadj.o): $(SRC)/moldyn/rtadj.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rtadj.f > rtadj.F
	$(FC2) $(MBONDFLG) rtadj.F
	ar rucv $(LIB)/moldyn.a rtadj.o
	rm  rtadj.o
	rm  rtadj.F
#
$(LIB)/moldyn.a(rtcost.o): $(SRC)/moldyn/rtcost.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rtcost.f > rtcost.F
	$(FC2) $(MBONDFLG) rtcost.F
	ar rucv $(LIB)/moldyn.a rtcost.o
	rm  rtcost.o
	rm  rtcost.F
#
$(LIB)/moldyn.a(rtcst2.o): $(SRC)/moldyn/rtcst2.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rtcst2.f > rtcst2.F
	$(FC2) $(MBONDFLG) rtcst2.F
	ar rucv $(LIB)/moldyn.a rtcst2.o
	rm  rtcst2.o
	rm  rtcst2.F
#
$(LIB)/moldyn.a(rtiter.o): $(SRC)/moldyn/rtiter.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/rtiter.f > rtiter.F
	$(FC2) $(MBONDFLG) rtiter.F
	ar rucv $(LIB)/moldyn.a rtiter.o
	rm  rtiter.o
	rm  rtiter.F
#
$(LIB)/moldyn.a(second.o): $(SRC)/moldyn/second.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/second.f > second.F
	$(FC2) $(MBONDFLG) second.F
	ar rucv $(LIB)/moldyn.a second.o
	rm  second.o
	rm  second.F
#
$(LIB)/moldyn.a(sizes_amat.o): $(SRC)/moldyn/sizes_amat.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/sizes_amat.f > sizes_amat.F
	$(FC2) $(MBONDFLG) sizes_amat.F
	ar rucv $(LIB)/moldyn.a sizes_amat.o
	rm sizes_amat.o
	rm sizes_amat.F
#
$(LIB)/moldyn.a(skewv3.o): $(SRC)/moldyn/skewv3.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/skewv3.f > skewv3.F
	$(FC2) $(MBONDFLG) skewv3.F
	ar rucv $(LIB)/moldyn.a skewv3.o
	rm  skewv3.o
	rm  skewv3.F
#
$(LIB)/moldyn.a(start.o): $(SRC)/moldyn/start.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/start.f > start.F
	$(FC2) $(MBONDFLG) start.F
	ar rucv $(LIB)/moldyn.a start.o
	rm  start.o
	rm  start.F
#
$(LIB)/moldyn.a(store.o): $(SRC)/moldyn/store.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/store.f > store.F
	$(FC2) $(MBONDFLG) store.F
	ar rucv $(LIB)/moldyn.a store.o
	rm  store.o
	rm  store.F
#
$(LIB)/moldyn.a(svbksb.o): $(SRC)/moldyn/svbksb.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/svbksb.f > svbksb.F
	$(FC2) $(MBONDFLG) svbksb.F
	ar rucv $(LIB)/moldyn.a svbksb.o
	rm  svbksb.o
	rm  svbksb.F
#
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/torque.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/torque.f > torque.F
	$(FC2) $(MBONDFLG) torque.F
	ar rucv $(LIB)/moldyn.a torque.o
	rm  torque.o
	rm  torque.F
#
$(LIB)/moldyn.a(vcdint.o): $(SRC)/moldyn/vcdint.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/vcdint.f > vcdint.F
	$(FC2) $(MBONDFLG) vcdint.F
	ar rucv $(LIB)/moldyn.a vcdint.o
	rm  vcdint.o
	rm  vcdint.F
#
$(LIB)/moldyn.a(vcross.o): $(SRC)/moldyn/vcross.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/vcross.f > vcross.F
	$(FC2) $(MBONDFLG) vcross.F
	ar rucv $(LIB)/moldyn.a vcross.o
	rm  vcross.o
	rm  vcross.F
#
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/vel_verl.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/vel_verl.f >vel_verl.F
	$(FC2) $(MBONDFLG) vel_verl.F
	ar rucv $(LIB)/moldyn.a vel_verl.o
	rm vel_verl.o
	rm vel_verl.F
#
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/velrms.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/velrms.f > velrms.F
	$(FC2) $(MBONDFLG) velrms.F
	ar rucv $(LIB)/moldyn.a velrms.o
	rm  velrms.o
	rm  velrms.F
#
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/verlcd.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/verlcd.f > verlcd.F
	$(FC2) $(MBONDFLG) verlcd.F
	ar rucv $(LIB)/moldyn.a verlcd.o
	rm  verlcd.o
	rm  verlcd.F
#
$(LIB)/moldyn.a(vmispa.o): $(SRC)/moldyn/vmispa.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/vmispa.f > vmispa.F
	$(FC2) $(MBONDFLG) vmispa.F
	ar rucv $(LIB)/moldyn.a vmispa.o
	rm  vmispa.o
	rm  vmispa.F
#
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/vvint.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/vvint.f > vvint.F
	$(FC2) $(MBONDFLG) vvint.F
	ar rucv $(LIB)/moldyn.a vvint.o
	rm  vvint.o
	rm  vvint.F
#
$(LIB)/moldyn.a(write.o): $(SRC)/moldyn/write.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/write.f > write.F
	$(FC2) $(MBONDFLG) write.F
	ar rucv $(LIB)/moldyn.a write.o
	rm  write.o
	rm  write.F
#
$(LIB)/moldyn.a(writelgcl.o): $(SRC)/moldyn/writelgcl.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/writelgcl.f > writelgcl.F
	$(FC2) $(MBONDFLG) writelgcl.F
	ar rucv $(LIB)/moldyn.a writelgcl.o
	rm  writelgcl.o
	rm  writelgcl.F
#
$(LIB)/moldyn.a(writes.o): $(SRC)/moldyn/writes.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/writes.f > writes.F
	$(FC2) $(MBONDFLG) writes.F
	ar rucv $(LIB)/moldyn.a writes.o
	rm  writes.o
	rm  writes.F
#
$(LIB)/moldyn.a(writim.o): $(SRC)/moldyn/writim.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/writim.f > writim.F
	$(FC2) $(MBONDFLG) writim.F
	ar rucv $(LIB)/moldyn.a writim.o
	rm  writim.o
	rm  writim.F
#
$(LIB)/moldyn.a(writis.o): $(SRC)/moldyn/writis.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/writis.f > writis.F
	$(FC2) $(MBONDFLG) writis.F
	ar rucv $(LIB)/moldyn.a writis.o
	rm  writis.o
	rm  writis.F
#
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/ydot.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/ydot.f > ydot.F
	$(FC2) $(MBONDFLG) ydot.F
	ar rucv $(LIB)/moldyn.a ydot.o
	rm  ydot.o
	rm  ydot.F
#
$(LIB)/moldyn.a(zero.o): $(SRC)/moldyn/zero.f
	$(CPP) $(CPPFLAGS) $(SRC)/moldyn/zero.f > zero.F
	$(FC2) $(MBONDFLG) zero.F
	ar rucv $(LIB)/moldyn.a zero.o
	rm  zero.o
	rm  zero.F
#
# moldyn dependency file
#
# add3

# addt
$(LIB)/moldyn.a(addt.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(addt.o): $(SRC)/moldyn/VECTOR.INC

# adt
$(LIB)/moldyn.a(adt.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(adt.o): $(SRC)/moldyn/VECTOR.INC

# amadji
$(LIB)/moldyn.a(amadji.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(amadji.o): $(SRC)/moldyn/ERRHDL.INC

# bckwrd
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(bckwrd.o): $(SRC)/moldyn/VECTOR.INC

# bdotqp
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(bdotqp.o): $(SRC)/moldyn/LDEBUG.INC

# bh2
$(LIB)/moldyn.a(bh2.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(bh2.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(bh2.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(bh2.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(bh2.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(bh2.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(bh2.o): $(SRC)/moldyn/TAPENO.INC

# bhgenr
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/IFIRST.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(bhgenr.o): $(SRC)/moldyn/TAPENO.INC

# bhmult
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(bhmult.o): $(SRC)/moldyn/TAPENO.INC

# bkinit
$(LIB)/moldyn.a(bkinit.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(bkinit.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(bkinit.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(bkinit.o): $(SRC)/moldyn/OPTION.INC
$(LIB)/moldyn.a(bkinit.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(bkinit.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(bkinit.o): $(SRC)/moldyn/TAPENO.INC

# branch_out
$(LIB)/moldyn.a(branch_out.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(branch_out.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(branch_out.o): $(SRC)/moldyn/SPECIF.INC

# cbod

# cgadji

# cgadji2

# check_sng1
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(check_sng1.o): $(SRC)/moldyn/HEAPMB.INC

# check_sng2
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(check_sng2.o): $(SRC)/moldyn/MISCNO.INC

# chkbon
$(LIB)/moldyn.a(chkbon.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(chkbon.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(chkbon.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(chkbon.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(chkbon.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(chkbon.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(chkbon.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(chkbon.o): $(SRC)/moldyn/TAPENO.INC

# cjmpls
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(cjmpls.o): $(SRC)/moldyn/LDEBUG.INC

# clbck1
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/NOUTPT.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/NOUTPT.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(clbck1.o): $(SRC)/moldyn/TAPENO.INC

# clbck2
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/NOUTPT.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(clbck2.o): $(SRC)/moldyn/TAPENO.INC

# clear
$(LIB)/moldyn.a(clear.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(clear.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(clear.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(clear.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(clear.o): $(SRC)/moldyn/IFIRST.INC
$(LIB)/moldyn.a(clear.o): $(SRC)/moldyn/INTGRL.INC

# clfor1
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(clfor1.o): $(SRC)/moldyn/LDEBUG.INC

# clfor3
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(clfor3.o): $(SRC)/moldyn/LDEBUG.INC

# clfr2a
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/CINPUT.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/IFIRST.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/NOUTPT.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(clfr2a.o): $(SRC)/moldyn/TIMESS.INC

# clfr2b
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/NOUTPT.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(clfr2b.o): $(SRC)/moldyn/LDEBUG.INC

# cmpic1
$(LIB)/moldyn.a(cmpic1.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(cmpic1.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(cmpic1.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(cmpic1.o): $(SRC)/moldyn/INFOV.INC
$(LIB)/moldyn.a(cmpic1.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(cmpic1.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(cmpic1.o): $(SRC)/moldyn/OPTION.INC
$(LIB)/moldyn.a(cmpic1.o): $(SRC)/moldyn/SPECIF.INC

# cmpic2
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/STATUS.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/COMPOS.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/INFOV.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/OPTION.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(cmpic2.o): $(SRC)/moldyn/TAPENO.INC

# cmpic3
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(cmpic3.o): $(SRC)/moldyn/SELECT.INC

# cmposn
$(LIB)/moldyn.a(cmposn.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(cmposn.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(cmposn.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(cmposn.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(cmposn.o): $(SRC)/moldyn/SPECIF.INC

# compin
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/COMPOS.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/COMPOS.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(compin.o): $(SRC)/moldyn/CHARMM.INC

# compiv
$(LIB)/moldyn.a(compiv.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(compiv.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(compiv.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(compiv.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(compiv.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(compiv.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(compiv.o): $(SRC)/moldyn/TAPENO.INC

# cpamat

# crea
$(LIB)/moldyn.a(crea.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(crea.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(crea.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(crea.o): $(SRC)/moldyn/CHARMM.INC

# cread0
$(LIB)/moldyn.a(cread0.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(cread0.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(cread0.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(cread0.o): $(SRC)/moldyn/CHARMM.INC

# creb
$(LIB)/moldyn.a(creb.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(creb.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(creb.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(creb.o): $(SRC)/moldyn/CHARMM.INC

# crec
$(LIB)/moldyn.a(crec.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(crec.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(crec.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(crec.o): $(SRC)/moldyn/CHARMM.INC

# cree
$(LIB)/moldyn.a(cree.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(cree.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(cree.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(cree.o): $(SRC)/moldyn/CHARMM.INC

# cremu0
$(LIB)/moldyn.a(cremu0.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(cremu0.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(cremu0.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(cremu0.o): $(SRC)/moldyn/TAPENO.INC

# cret3
$(LIB)/moldyn.a(cret3.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(cret3.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(cret3.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(cret3.o): $(SRC)/moldyn/LDEBUG.INC

# ctinit1_CHARMM
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/OPTION.INC
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(ctinit1_CHARMM.o): $(SRC)/moldyn/LDEBUG.INC

# datex

# delta_v
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/COMPOS.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(delta_v.o): $(SRC)/moldyn/CHARMM.INC

# dgeco

# dgefa

# dgesl

# dlef

# dlespa
$(LIB)/moldyn.a(dlespa.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(dlespa.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(dlespa.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(dlespa.o): $(SRC)/moldyn/TAPENO.INC

# dllt

# dloop

# dsico

# dsifa

# dsisl

# dsvdc

# dyns20
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/CONPAR.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/ILINER.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/MULTIPOLE.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/OPTION.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/TIMING.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/GCOMP.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/MDTYPE.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/INFOV.INC
$(LIB)/moldyn.a(dyns20.o): $(SRC)/moldyn/MDCON.INC

# eign1
$(LIB)/moldyn.a(eign1.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(eign1.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(eign1.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(eign1.o): $(SRC)/moldyn/PARAM.FOR

# engmom
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/COMPOS.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/MULTIPOLE.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(engmom.o): $(SRC)/moldyn/VECTOR.INC

# engmom_ke
$(LIB)/moldyn.a(engmom_ke.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(engmom_ke.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(engmom_ke.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(engmom_ke.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(engmom_ke.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(engmom_ke.o): $(SRC)/moldyn/VECTOR.INC

# errhdl
$(LIB)/moldyn.a(errhdl.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(errhdl.o): $(SRC)/moldyn/ERRHDL.INC

# eulerAngle

# eulseq
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/MDTYPE.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(eulseq.o): $(SRC)/moldyn/VECTOR.INC

# extor_CHARMM
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/GCOMP.INC
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(extor_CHARMM.o): $(SRC)/moldyn/SPECIF.INC

# factor_b
$(LIB)/moldyn.a(factor_b.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(factor_b.o): $(SRC)/moldyn/TAPENO.INC

# fetch

# fix_orphan
$(LIB)/moldyn.a(fix_orphan.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(fix_orphan.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(fix_orphan.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(fix_orphan.o): $(SRC)/moldyn/ORDERN.INC

# frwd1a
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/IFIRST.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(frwd1a.o): $(SRC)/moldyn/VECTOR.INC

# frwd1b
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(frwd1b.o): $(SRC)/moldyn/VECTOR.INC

# frwrd2
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/CONSTR.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(frwrd2.o): $(SRC)/moldyn/LDEBUG.INC

# getbh
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(getbh.o): $(SRC)/moldyn/ERRHDL.INC

# getvel
$(LIB)/moldyn.a(getvel.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(getvel.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(getvel.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(getvel.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(getvel.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(getvel.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(getvel.o): $(SRC)/moldyn/CSTIFF.INC

# house

# initHeap
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(initHeap.o): $(SRC)/moldyn/MAXMUM.INC

# init_vcd
$(LIB)/moldyn.a(init_vcd.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(init_vcd.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(init_vcd.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(init_vcd.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(init_vcd.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(init_vcd.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(init_vcd.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(init_vcd.o): $(SRC)/moldyn/VECTOR.INC

# irnd

# kabsch
$(LIB)/moldyn.a(kabsch.o): $(SRC)/moldyn/STATUS.INC

# lforce
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/GCOMP.INC
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(lforce.o): $(SRC)/moldyn/SPECIF.INC

# lmadji

# lobint
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/MDCON.INC
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/MULTIPOLE.INC
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(lobint.o): $(SRC)/moldyn/CHARMM.INC

# lobto
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(lobto.o): $(SRC)/moldyn/SPECIF.INC

# mbdyna
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/CONPAR.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/EXTRA.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/IFIRST.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/MULTIPOLE.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/NHNS.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/OPTION.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/TIMING.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/GCOMP.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(mbdyna.o): $(SRC)/moldyn/MOMENG.INC

# mbtopol
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(mbtopol.o): $(SRC)/moldyn/TAPENO.INC

# mdloop_CHARMM
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/CONPAR.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/EXTRA.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/TIMING.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/GCOMP.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(mdloop_CHARMM.o): $(SRC)/moldyn/CHARMM.INC

# memory
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/IFIRST.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/GGSAVE.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/GCOMP.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(memory.o): $(SRC)/moldyn/NOUTPT.INC

# mgen
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/GGSAVE.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/GGSAVE.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/ILINER.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(mgen.o): $(SRC)/moldyn/NUMBRS.INC

# msmodf
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/INFOV.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/NHNS.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/OPTION.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(msmodf.o): $(SRC)/moldyn/VECTOR.INC

# msmodr
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/NHNS.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/OPTION.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(msmodr.o): $(SRC)/moldyn/TAPENO.INC

# msub

# mtsratio
$(LIB)/moldyn.a(mtsratio.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(mtsratio.o): $(SRC)/moldyn/NUMBRS.INC

# multb
$(LIB)/moldyn.a(multb.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(multb.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(multb.o): $(SRC)/moldyn/TAPENO.INC

# multsym

# pagehd
$(LIB)/moldyn.a(pagehd.o): $(SRC)/moldyn/LSTART.INC
$(LIB)/moldyn.a(pagehd.o): $(SRC)/moldyn/LSTRT1.INC
$(LIB)/moldyn.a(pagehd.o): $(SRC)/moldyn/TAPENO.INC

# plotwr
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/INFOV.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(plotwr.o): $(SRC)/moldyn/VECTOR.INC

# posrms
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/INFOV.INC
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(posrms.o): $(SRC)/moldyn/MOMENG.INC

# prntbd
$(LIB)/moldyn.a(prntbd.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(prntbd.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(prntbd.o): $(SRC)/moldyn/COMPOS.INC
$(LIB)/moldyn.a(prntbd.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(prntbd.o): $(SRC)/moldyn/SPECIF.INC

# prnten
$(LIB)/moldyn.a(prnten.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(prnten.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(prnten.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(prnten.o): $(SRC)/moldyn/MULTIPOLE.INC
$(LIB)/moldyn.a(prnten.o): $(SRC)/moldyn/SPECIF.INC

# prntou
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/INFOV.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/MDTYPE.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(prntou.o): $(SRC)/moldyn/TIMESS.INC

# prntsm
$(LIB)/moldyn.a(prntsm.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(prntsm.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(prntsm.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(prntsm.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(prntsm.o): $(SRC)/moldyn/SPECIF.INC

# psitx

# rcmatprd

# rcvcross

# rk4
$(LIB)/moldyn.a(rk4.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(rk4.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(rk4.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(rk4.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(rk4.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(rk4.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(rk4.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(rk4.o): $(SRC)/moldyn/SPECIF.INC

# rkdumb
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(rkdumb.o): $(SRC)/moldyn/MDCON.INC

# rotdh
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(rotdh.o): $(SRC)/moldyn/MISCNO.INC

# rotdh1_CHARMM
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/MULTIPOLE.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(rotdh1_CHARMM.o): $(SRC)/moldyn/LDEBUG.INC

# rotds
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(rotds.o): $(SRC)/moldyn/TAPENO.INC

# rotran
$(LIB)/moldyn.a(rotran.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(rotran.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(rotran.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(rotran.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(rotran.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(rotran.o): $(SRC)/moldyn/TAPENO.INC

# rottr
$(LIB)/moldyn.a(rottr.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(rottr.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(rottr.o): $(SRC)/moldyn/TAPENO.INC

# rtadj

# rtcost

# rtcst2
$(LIB)/moldyn.a(rtcst2.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(rtcst2.o): $(SRC)/moldyn/CSTIFF.INC

# rtiter
$(LIB)/moldyn.a(rtiter.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(rtiter.o): $(SRC)/moldyn/TAPENO.INC

# second

# sizes_amat
$(LIB)/moldyn.a(sizes.o): $(SRC)/moldyn/PARAM.FOR

# skewv3

# start
$(LIB)/moldyn.a(start.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(start.o): $(SRC)/moldyn/LSTART.INC
$(LIB)/moldyn.a(start.o): $(SRC)/moldyn/LSTRT1.INC
$(LIB)/moldyn.a(start.o): $(SRC)/moldyn/LDEBUG.INC

# store

# svbksb

# torque
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/GCOMP.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/GGSAVE.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/ILINER.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/MULTIPOLE.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/OPTION.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/TIMING.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(torque.o): $(SRC)/moldyn/ERRHDL.INC

# vcdint
$(LIB)/moldyn.a(vcdint.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(vcdint.o): $(SRC)/moldyn/MDCON.INC
$(LIB)/moldyn.a(vcdint.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(vcdint.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(vcdint.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(vcdint.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(vcdint.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(vcdint.o): $(SRC)/moldyn/CHARMM.INC

# vcross

# vel_verl
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(vel_verl.o): $(SRC)/moldyn/SPECIF.INC

# velrms
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/INFOV.INC
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(velrms.o): $(SRC)/moldyn/MOMENG.INC

# verlcd
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/IFIRST.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/SELECT.INC
$(LIB)/moldyn.a(verlcd.o): $(SRC)/moldyn/SPECIF.INC

# vmispa

# vvint
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/MDCON.INC
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/MULTIPOLE.INC
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(vvint.o): $(SRC)/moldyn/CHARMM.INC

# write
$(LIB)/moldyn.a(write.o): $(SRC)/moldyn/TAPENO.INC

# writelgcl
$(LIB)/moldyn.a(writelgcl.o): $(SRC)/moldyn/TAPENO.INC

# writes
$(LIB)/moldyn.a(writes.o): $(SRC)/moldyn/TAPENO.INC

# writim
$(LIB)/moldyn.a(writim.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(writim.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(writim.o): $(SRC)/moldyn/TAPENO.INC

# writis
$(LIB)/moldyn.a(writis.o): $(SRC)/moldyn/TAPENO.INC

# ydot
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/PARAM.FOR
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/AMUBW.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/BHBSRD.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/COMPOS.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/COREA.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/CSTIFF.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/ERRHDL.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/F1BKF2.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/GCOMP.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/HANDS2.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/HEAPMB.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/IFIRST.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/ILINER.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/INTGRL.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/IVCONS.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/JILFLG.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/LAMBDA.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/LDEBUG.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/MAXMUM.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/MEMLB.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/MISCNO.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/MISCN2.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/MOMENG.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/NUMBRS.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/ORDERN.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/PARTCL.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/PINRP.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/SPECIF.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/TAPENO.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/TIMESS.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/TIMING.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/VECTOR.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/CLOOP.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/NOUTPT.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/CHARMM.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/CPATHS.INC
$(LIB)/moldyn.a(ydot.o): $(SRC)/moldyn/SELECT.INC

# zero
