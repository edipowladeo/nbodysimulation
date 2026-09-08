!
!     MSIMSLSS.F90 - Declare single-precision MS IMSL STAT/LIBRARY routines
!
!     Copyright (c) 1994 by Visual Numerics, Inc.  All Rights Reserved.
!

module msimslss

!ms$objcomment lib:'stats.lib'

      use msimslc	! IMSL common routines
      use msimslsc	! IMSL common stat routines
      use msimslcs	! IMSL common single-precision routines

!
!     Chapter 1:  Basic Statistics
!

      interface
        subroutine owfrq (nobs, x, k, iopt, xlo, xhi, clhw,div, table)
          integer    nobs, k, iopt
          real       xlo, xhi, clhw, x(*), div(*), table(*)
        end subroutine
      end interface

      interface
        subroutine twfrq (nobs, x, y, kx, ky, iopt, xlo, ylo,xhi, yhi, clhwx, clhwy, divx, divy, table, ldtabl)
          integer    nobs, kx, ky, iopt, ldtabl
          real       xlo, ylo, xhi, yhi, clhwx, clhwy, x(*), y(*),          &
     &           divx(*), divy(*), table(ldtabl,*)
        end subroutine
      end interface

      interface
        subroutine freq (ido, nobs, ncol, x, ldx, ifrq,nclvar, indcl, maxtab, maxcl, nclval, clval, table)
          integer    ido, nobs, ncol, ldx, ifrq, nclvar, maxtab, maxcl,     &
     &           indcl(*), nclval(*)
          real       x(ldx,*), clval(*), table(*)
        end subroutine
      end interface

      interface
        subroutine f2eq (ido, nobs, ncol, x, ldx, ifrq,nclvar, indcl, maxtab, maxcl, nclval, clval, table,indx, vec)
          integer    ido, nobs, ncol, ldx, ifrq, nclvar, maxtab, maxcl,     &
     &           indcl(*), nclval(*), indx(*)
          real       x(ldx,*), clval(*), table(*), vec(*)
        end subroutine
      end interface

      interface
        subroutine uvsta (ido, nrow, nvar, x, ldx, ifrq, iwt,mopt, conprm, conprv, iprint, stat, ldstat, nrmiss)
          integer    ido, nrow, nvar, ldx, ifrq, iwt, mopt, iprint,         &
     &           ldstat, nrmiss
          real       conprm, conprv, x(ldx,*), stat(ldstat,*)
        end subroutine
      end interface

      interface
        subroutine u2sta (ido, nrow, nvar, x, ldx, ifrq, iwt,mopt, conprm, conprv, iprint, stat, ldstat, nrmiss, wk)
          integer    ido, nrow, nvar, ldx, ifrq, iwt, mopt, iprint,         &
     &           ldstat, nrmiss
          real       conprm, conprv, x(ldx,*), stat(ldstat,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine ranks (nobs, x, fuzz, itie, iscore, score)
          integer    nobs, itie, iscore
          real       fuzz, x(*), score(*)
        end subroutine
      end interface

      interface
        subroutine r2nks (nobs, x, fuzz, itie, iscore, score,iwk)
          integer    nobs, itie, iscore, iwk(*)
          real       fuzz, x(*), score(*)
        end subroutine
      end interface

      interface
        subroutine lettr (nobs, x, num, sumry, nmiss)
          integer    nobs, num, nmiss
          real       x(*), sumry(*)
        end subroutine
      end interface

      interface
        subroutine l2ttr (nobs, x, num, sumry, nmiss, wk)
          integer    nobs, num, nmiss
          real       x(*), sumry(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine ordst (nobs, x, nos, iopt, ios, os, nmiss)
          integer    nobs, nos, iopt, nmiss, ios(*)
          real       x(*), os(*)
        end subroutine
      end interface

      interface
        subroutine o2dst (nobs, x, nos, iopt, ios, os, nmiss,wk)
          integer    nobs, nos, iopt, nmiss, ios(*)
          real       x(*), os(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine eqtil (nobs, x, nqprop, qprop, q, xlo,xhi, nmiss)
          integer    nobs, nqprop, nmiss
          real       x(*), qprop(*), q(*), xlo(*), xhi(*)
        end subroutine
      end interface

      interface
        subroutine e2til (nobs, x, nqprop, qprop, q, xlo,xhi, nmiss, wk)
          integer    nobs, nqprop, nmiss
          real       x(*), qprop(*), q(*), xlo(*), xhi(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine twomv (ido, nrowx, x, nrowy, y, conprm,conprv, iprint, stat)
          integer    ido, nrowx, nrowy, iprint
          real       conprm, conprv, x(*), y(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine bines (n, k, conper, phat, plower, pupper)
          integer    n, k
          real       conper, phat, plower, pupper
        end subroutine
      end interface

      interface
        subroutine poies (nobs, ix, conper, that, tlower,tupper)
          integer    nobs, ix(*)
          real       conper, that, tlower, tupper
        end subroutine
      end interface

      interface
        subroutine nrces (nobs, xrt, xlt, icen, epsm, epssig,maxits, init, xmean, xsigma, vxm, vxs, covxms, number)
          integer    nobs, maxits, init, icen(*), number(*)
          real       epsm, epssig, xmean, xsigma, vxm, vxs, covxms,         &
     &           xrt(*), xlt(*)
        end subroutine
      end interface

      interface
        subroutine grpes (ngroup, table, clow, cwidth,iprint, stat)
          integer    ngroup, iprint
          real       clow, cwidth, table(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine cstat (ido, nrow, ncol, x, ldx, nr, irx,ifrq, iwt, mopt, kmax, k, celif, ldceli)
          integer    ido, nrow, ncol, ldx, nr, ifrq, iwt, mopt, kmax, k,    &
     &           ldceli, irx(*)
          real       x(ldx,*), celif(ldceli,*)
        end subroutine
      end interface

      interface
        subroutine medpl (nrow, ncol, table, ldtabl, maxit,ptable, ldptab, iter)
          integer    nrow, ncol, ldtabl, maxit, ldptab, iter
          real       table(ldtabl,*), ptable(ldptab,*)
        end subroutine
      end interface

      interface
        subroutine m2dpl (nrow, ncol, table, ldtabl, maxit,ptable, ldptab, iter, wk)
          integer    nrow, ncol, ldtabl, maxit, ldptab, iter
          real       table(ldtabl,*), ptable(ldptab,*), wk(*)
        end subroutine
      end interface

!
!     Chapter 2:  Regression
!

      interface
        subroutine rone (nobs, ncol, x, ldx, intcep, irsp,ind, ifrq, iwt, ipred, conpcm, conpcp, iprint, aov,coef, ldcoef, covb, ldcovb, testlf, case, ldcase,nrmiss)
          integer    nobs, ncol, ldx, intcep, irsp, ind, ifrq, iwt, ipred,  &
     &           iprint, ldcoef, ldcovb, ldcase, nrmiss
          real       conpcm, conpcp, x(*), aov(*), coef(*), covb(*),        &
     &           testlf(*), case(*)
        end subroutine
      end interface

      interface
        subroutine r2ne (nobs, ncol, x, ldx, intcep, irsp,ind, ifrq, iwt, ipred, conpcm, conpcp, iprint, aov,coef, ldcoef, covb, ldcovb, testlf, case, ldcase,nrmiss, iwk, wk)
          integer    nobs, ncol, ldx, intcep, irsp, ind, ifrq, iwt, ipred,  &
     &           iprint, ldcoef, ldcovb, ldcase, nrmiss, iwk(*)
          real       conpcm, conpcp, x(ldx,*), aov(*), coef(ldcoef,*),      &
     &           covb(ldcovb,*), testlf(10), case(ldcase,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rincf (sumwtf, dfe, intcep, b, xymean,ssx, s2, swtfy0, conper, ylower, yupper, xlower,xupper)
          integer    intcep
          real       sumwtf, dfe, ssx, s2, swtfy0, conper, ylower, yupper,  &
     &           xlower, xupper, b(*), xymean(2)
        end subroutine
      end interface

      interface
        subroutine rinpf (sumwtf, dfs2, intcep, b, xymean,ssx, s2, conper, iy0, swtfy0, y0, x0hat, xlower,xupper)
          integer    intcep, iy0
          real       sumwtf, dfs2, ssx, s2, conper, swtfy0, y0, x0hat,      &
     &           xlower, xupper, b(*), xymean(2)
        end subroutine
      end interface

      interface
        subroutine rlse (nobs, y, nind, x, ldx, intcep, b,sst, sse)
          integer    nobs, nind, ldx, intcep
          real       sst, sse, y(*), x(*), b(*)
        end subroutine
      end interface

      interface
        subroutine r2se (nobs, y, nind, x, ldx, intcep, b,sst, sse, r, ldr, dfe, nrmiss, wk)
          integer    nobs, nind, ldx, intcep, ldr, nrmiss
          real       sst, sse, dfe, y(*), x(*), b(*), r(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rcov (intcep, nind, ndep, cov, ldcov,xymean, sumwtf, tol, b, ldb, r, ldr, irank, scpe,ldscpe)
          integer    intcep, nind, ndep, ldcov, ldb, ldr, irank, ldscpe
          real       sumwtf, tol, cov(ldcov,*), xymean(*), b(ldb,*),        &
     &           r(ldr,*), scpe(ldscpe,*)
        end subroutine
      end interface

      interface
        subroutine rgivn (ido, nrow, ncol, x, ldx, intcep,iind, indind, idep, inddep, ifrq, iwt, isub, tol, b,ldb, r, ldr, d, irank, dfe, scpe, ldscpe, nrmiss, xmin,xmax)
          integer    ido, nrow, ncol, ldx, intcep, iind, idep, ifrq, iwt,   &
     &           isub, ldb, ldr, irank, ldscpe, nrmiss, indind(*),      &
     &           inddep(*)
          real       tol, dfe, x(ldx,*), b(ldb,*), r(ldr,*), d(*),          &
     &           scpe(ldscpe,*), xmin(*), xmax(*)
        end subroutine
      end interface

      interface
        subroutine r2ivn (ido, nrow, nvar, x, ldx, intcep,iind, indind, idep, inddep, ifrq, iwt, isub, tol, b,ldb, r, ldr, d, irank, dfe, scpe, ldscpe, nrmiss, xmin,xmax, wk)
          integer    ido, nrow, nvar, ldx, intcep, iind, idep, ifrq, iwt,   &
     &           isub, ldb, ldr, irank, ldscpe, nrmiss, indind(*),      &
     &           inddep(*)
          real       tol, dfe, x(*), b(ldb,*), r(ldr,*), d(*),              &
     &           scpe(ldscpe,*), xmin(*), xmax(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rglm (ido, nrow, ncol, x, ldx, intcep,nclvar, indcl, nef, nvef, indef, idep, inddep, ifrq,iwt, idummy, isub, tol, maxcl, nclval, clval, irbef, b,ldb, r, ldr, d, irank, dfe, scpe, ldscpe, nrmiss, xmin,xmax)
          integer    ido, nrow, ncol, ldx, intcep, nclvar, nef, idep,       &
     &           ifrq, iwt, idummy, isub, maxcl, ldb, ldr, irank,       &
     &           ldscpe, nrmiss, indcl(*), nvef(*), indef(*),           &
     &           inddep(*), nclval(*), irbef(*)
          real       tol, dfe, x(*), clval(*), b(*), r(*), d(*), scpe(*),   &
     &           xmin(*), xmax(*)
        end subroutine
      end interface

      interface
        subroutine r2lm (ido, nrow, ncol, x, ldx, intcep,nclvar, indcl, nef, nvef, indef, idep, inddep, ifrq,iwt, idummy, isub, tol, maxcl, nclval, clval, irbef, b,ldb, r, ldr, d, irank, dfe, scpe, ldscpe, nrmiss, xmin,xmax, iwk, wk)
          integer    ido, nrow, ncol, ldx, intcep, nclvar, nef, idep,       &
     &           ifrq, iwt, idummy, isub, maxcl, ldb, ldr, irank,       &
     &           ldscpe, nrmiss, indcl(*), nvef(*), indef(*),           &
     &           inddep(*), nclval(*), irbef(*), iwk(*)
          real       tol, dfe, x(ldx,*), clval(*), b(ldb,*), r(ldr,*),      &
     &           d(*), scpe(ldscpe,*), xmin(*), xmax(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rlequ (invoke, nh, ncoef, h, ldh, ig,ndep, g, ldg, tol, b, ldb, r, ldr, d, irankr, dfe,scpe, ldscpe, irankh)
          integer    invoke, nh, ncoef, ldh, ig, ndep, ldg, ldb, ldr,       &
     &           irankr, ldscpe, irankh
          real       tol, dfe, h(*), g(*), b(*), r(*), d(*), scpe(*)
        end subroutine
      end interface

      interface
        subroutine r2equ (invoke, nh, ncoef, h, ldh, ig,ndep, g, ldg, tol, b, ldb, r, ldr, d, irankr, dfe,scpe, ldscpe, irankh, wk)
          integer    invoke, nh, ncoef, ldh, ig, ndep, ldg, ldb, ldr,       &
     &           irankr, ldscpe, irankh
          real       tol, dfe, h(ldh,*), g(ldg,*), b(ldb,*), r(ldr,*),      &
     &           d(*), scpe(ldscpe,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rstat (intcep, ief, irbef, b, r, ldr, dfe,sse, print, aov, sqss, ldsqss, coef, ldcoef, covb,ldcovb)
          integer    intcep, ief, ldr, ldsqss, ldcoef, ldcovb, irbef(*)
          real       dfe, sse, b(*), r(ldr,*), aov(*), sqss(ldsqss,*),      &
     &           coef(ldcoef,*), covb(ldcovb,*)
          character  print*(*)
        end subroutine
      end interface

      interface
        subroutine rcovb (ncoef, r, ldr, s2, covb, ldcovb)
          integer    ncoef, ldr, ldcovb
          real       s2, r(ldr,*), covb(ldcovb,*)
        end subroutine
      end interface

      interface
        subroutine cesti (nhp, ncoef, hp, ldhp, ndep, nu, gp,ldgp, r, ldr, irankp, nh, h, ldh, g, ldg)
          integer    nhp, ncoef, ldhp, ndep, nu, ldgp, ldr, irankp, nh,     &
     &           ldh, ldg
          real       hp(*), gp(*), r(*), h(*), g(*)
        end subroutine
      end interface

      interface
        subroutine c2sti (nhp, ncoef, hp, ldhp, ndep, nu, gp,ldgp, r, ldr, irankp, nh, h, ldh, g, ldg, iwk, wk)
          integer    nhp, ncoef, ldhp, ndep, nu, ldgp, ldr, irankp, nh,     &
     &           ldh, ldg, iwk(*)
          real       hp(*), gp(*), r(*), h(*), g(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rhpss (nh, ncoef, h, ldh, ndep, b, ldb,nu, u, ldu, g, ldg, r, ldr, dfh, scph, ldscph)
          integer    nh, ncoef, ldh, ndep, ldb, nu, ldu, ldg, ldr, ldscph
          real       dfh, h(*), b(*), u(*), g(*), r(*), scph(*)
        end subroutine
      end interface

      interface
        subroutine r2pss (nh, ncoef, h, ldh, ndep, b, ldb,nu, u, ldu, g, ldg, r, ldr, dfh, scph, ldscph, iwk, wk)
          integer    nh, ncoef, ldh, ndep, ldb, nu, ldu, ldg, ldr, ldscph,  &
     &           iwk(*)
          real       dfh, h(*), b(*), u(*), g(*), r(*), scph(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rhpte (dfe, ndep, scpe, ldscpe, nu, u,ldu, dfh, scph, ldscph, test)
          integer    ndep, ldscpe, nu, ldu, ldscph
          real       dfe, dfh, scpe(*), u(*), scph(*), test(*)
        end subroutine
      end interface

      interface
        subroutine r2pte (dfe, ndep, scpe, ldscpe, nu, u,ldu, dfh, scph, ldscph, test, wk)
          integer    ndep, ldscpe, nu, ldu, ldscph
          real       dfe, dfh, scpe(*), u(*), scph(*), test(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rlofe (nobs, ncol, x, ldx, irep, indrep,irsp, ifrq, iwt, dfe, sse, igroup, ngroup, testlf)
          integer    nobs, ncol, ldx, irep, irsp, ifrq, iwt, ngroup,        &
     &           indrep(*), igroup(*)
          real       dfe, sse, x(*), testlf(10)
        end subroutine
      end interface

      interface
        subroutine r2ofe (nobs, ncol, x, ldx, irep, indrep,irsp, ifrq, iwt, dfe, sse, igroup, ngroup, testlf, iwk,wk)
          integer    nobs, ncol, ldx, irep, irsp, ifrq, iwt, ngroup,        &
     &           indrep(*), igroup(*), iwk(*)
          real       dfe, sse, x(*), testlf(10), wk(*)
        end subroutine
      end interface

      interface
        subroutine rlofn (nobs, ncol, x, ldx, intcep, iind,indind, irsp, ifrq, iwt, b, r, ldr, dfe, sse, iclust,maxit, tol, ngroup, igroup, testlf)
          integer    nobs, ncol, ldx, intcep, iind, irsp, ifrq, iwt, ldr,   &
     &           iclust, maxit, ngroup, indind(*), igroup(*)
          real       dfe, sse, tol, x(*), b(*), r(*), testlf(10)
        end subroutine
      end interface

      interface
        subroutine r2ofn (nobs, ncol, x, ldx, intcep, iind,indind, irsp, ifrq, iwt, b, r, ldr, dfe, sse, iclust,maxit, tol, ngroup, igroup, testlf, iwk, wk)
          integer    nobs, ncol, ldx, intcep, iind, irsp, ifrq, iwt, ldr,   &
     &           iclust, maxit, ngroup, indind(*), igroup(*), iwk(*)
          real       dfe, sse, tol, x(*), b(*), r(*), testlf(10), wk(*)
        end subroutine
      end interface

      interface
        subroutine rcase (ido, nrx, ncol, x, ldx, intcep,ief, nclvar, indcl, nclval, clval, nvef, indef, idummy,irsp, iwt, ipred, conpcm, conpcp, print, iobs, ncoef,b, r, ldr, dfe, sse, case, ldcase, nrmiss)
          integer    ido, nrx, ncol, ldx, intcep, ief, nclvar, idummy,      &
     &           irsp, iwt, ipred, iobs, ncoef, ldr, ldcase, nrmiss,    &
     &           indcl(*), nclval(*), nvef(*), indef(*)
          real       conpcm, conpcp, dfe, sse, x(*), clval(*), b(*), r(*),  &
     &           case(*)
          character  print*(*)
        end subroutine
      end interface

      interface
        subroutine r2ase (ido, nrx, ncol, x, ldx, intcep,ief, nclvar, indcl, nclval, clval, nvef, indef, idummy,irsp, iwt, ipred, conpcm, conpcp, print, iobs, ncoef,b, r, ldr, dfe, sse, case, ldcase, nrmiss, wk)
          integer    ido, nrx, ncol, ldx, intcep, ief, nclvar, idummy,      &
     &           irsp, iwt, ipred, iobs, ncoef, ldr, ldcase, nrmiss,    &
     &           indcl(*), nclval(*), nvef(*), indef(*)
          real       conpcm, conpcp, dfe, sse, x(ldx,*), clval(*), b(*),    &
     &           r(ldr,*), case(ldcase,12), wk(*)
          character  print*(*)
        end subroutine
      end interface

      interface
        subroutine rotin (nrx, ncol, x, ldx, intcep, iind,indind, iwt, r, ldr, dfe, sse, e, otin, ldotin, nrmiss)
          integer    nrx, ncol, ldx, intcep, iind, iwt, ldr, ldotin,        &
     &           nrmiss, indind(*)
          real       dfe, sse, x(*), r(*), e(*), otin(*)
        end subroutine
      end interface

      interface
        subroutine r2tin (nrx, ncol, x, ldx, intcep, iind,indind, iwt, r, ldr, dfe, sse, e, otin, ldotin, nrmiss,wk)
          integer    nrx, ncol, ldx, intcep, iind, iwt, ldr, ldotin,        &
     &           nrmiss, indind(*)
          real       dfe, sse, x(ldx,*), r(ldr,*), e(*), otin(ldotin,*),    &
     &           wk(*)
        end subroutine
      end interface

      interface
        subroutine gclas (ido, nrow, ncol, x, ldx, nclvar,indcl, maxcl, nclval, clval, nmiss)
          integer    ido, nrow, ncol, ldx, nclvar, maxcl, indcl(*),         &
     &           nclval(*), nmiss(*)
          real       x(ldx,*), clval(*)
        end subroutine
      end interface

      interface
        subroutine grglm (nrow, ncol, x, ldx, nclvar, indcl,nclval, clval, nef, nvef, indef, idummy, nreg, reg,ldreg, nrmiss)
          integer    nrow, ncol, ldx, nclvar, nef, idummy, nreg, ldreg,     &
     &           nrmiss, indcl(*), nclval(*), nvef(*), indef(*)
          real       x(*), clval(*), reg(ldreg,*)
        end subroutine
      end interface

      interface
        subroutine rbest (nvar, cov, ldcov, nobs, icrit,nbest, ngood, iprint, icritx, crit, ivarx, indvar,icoefx, coef, ldcoef)
          integer    nvar, ldcov, nobs, icrit, nbest, ngood, iprint,        &
     &           ldcoef, icritx(*), ivarx(*), indvar(*), icoefx(*)
          real       cov(*), crit(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine r2est (nvar, cov, ldcov, nobs, icrit,nbest, ngood, iprint, icritx, crit, ivarx, indvar,icoefx, coef, ldcoef, wk, iwk)
          integer    nvar, ldcov, nobs, icrit, nbest, ngood, iprint,        &
     &           ldcoef, icritx(*), ivarx(*), indvar(*), icoefx(*),     &
     &           iwk(*)
          real       cov(*), crit(*), coef(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rstep (invoke, nvar, cov, ldcov, level,nforce, nstep, istep, nobs, pin, pout, tol, iprint,scale, hist, iend, aov, coef, ldcoef, covb, ldcovb)
          integer    invoke, nvar, ldcov, nforce, nstep, istep, nobs,       &
     &           iprint, iend, ldcoef, ldcovb, level(*)
          real       pin, pout, tol, cov(ldcov,*), scale(*), hist(*),       &
     &           aov(*), coef(ldcoef,*), covb(ldcovb,*)
        end subroutine
      end interface

      interface
        subroutine r2tep (invoke, nvar, cov, ldcov, level,nforce, nstep, istep, nobs, pin, pout, tol, iprint,scale, hist, iend, aov, coef, ldcoef, covb, ldcovb, wk,iwk)
          integer    invoke, nvar, ldcov, nforce, nstep, istep, nobs,       &
     &           iprint, iend, ldcoef, ldcovb, level(*), iwk(*)
          real       pin, pout, tol, cov(ldcov,*), scale(*), hist(*),       &
     &           aov(*), coef(ldcoef,*), covb(ldcovb,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine gswep (krow, n, a, lda, irev, tol, scale,swept)
          integer    krow, n, lda, irev
          real       tol, a(lda,*), scale(*), swept(*)
        end subroutine
      end interface

      interface
        subroutine rsubm (na, a, lda, swept, nasub, asub,ldasub)
          integer    na, lda, nasub, ldasub
          real       a(*), swept(*), asub(*)
        end subroutine
      end interface

      interface
        subroutine r2ubm (na, a, lda, swept, nasub, asub,ldasub, iwk)
          integer    na, lda, nasub, ldasub, iwk(*)
          real       a(lda,*), swept(*), asub(ldasub,*)
        end subroutine
      end interface

      interface
        subroutine rpoly (nobs, ncol, x, ldx, irsp, ind,ifrq, iwt, ipred, conpcm, conpcp, maxdeg, icrit, crit,lof, iprint, ndeg, aov, sqss, ldsqss, coef, ldcoef,tlof, ldtlof, case, ldcase, nrmiss)
          integer    nobs, ncol, ldx, irsp, ind, ifrq, iwt, ipred, maxdeg,  &
     &           icrit, lof, iprint, ndeg, ldsqss, ldcoef, ldtlof,      &
     &           ldcase, nrmiss
          real       conpcm, conpcp, crit, x(*), aov(*), sqss(*), coef(*),  &
     &           tlof(*), case(*)
        end subroutine
      end interface

      interface
        subroutine r2oly (nobs, ncol, x, ldx, irsp, ind,ifrq, iwt, ipred, conpcm, conpcp, maxdeg, icrit, crit,lof, iprint, ndeg, aov, sqss, ldsqss, coef, ldcoef,tlof, ldtlof, case, ldcase, nrmiss, wk, iwk)
          integer    nobs, ncol, ldx, irsp, ind, ifrq, iwt, ipred, maxdeg,  &
     &           icrit, lof, iprint, ndeg, ldsqss, ldcoef, ldtlof,      &
     &           ldcase, nrmiss, iwk(*)
          real       conpcm, conpcp, crit, x(ldx,*), aov(*),                &
     &           sqss(ldsqss,*), coef(ldcoef,*), tlof(ldtlof,*),        &
     &           case(ldcase,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rcomp (nvar, xmin, xmax, ncentr, ifrep,npts, x, ldx)
          integer    nvar, ncentr, ifrep, npts, ldx
          real       xmin(*), xmax(*), x(ldx,*)
        end subroutine
      end interface

      interface
        subroutine rforp (nobs, ncol, x, ldx, irsp, ind,ifrq, iwt, maxdeg, icrit, crit, lof, ndeg, smultc,saddc, a, b, scoef, d, dfe, sse, dfpe, sspe, nrmiss)
          integer    nobs, ncol, ldx, irsp, ind, ifrq, iwt, maxdeg, icrit,  &
     &           lof, ndeg, nrmiss
          real       crit, smultc, saddc, dfe, sse, dfpe, sspe, x(*),       &
     &           a(*), b(*), scoef(*), d(*)
        end subroutine
      end interface

      interface
        subroutine r2orp (nobs, ncol, x, ldx, irsp, ind,ifrq, iwt, maxdeg, icrit, crit, lof, ndeg, smultc,saddc, a, b, scoef, ssorp, dfe, sse, dfpe, sspe,nrmiss, wk, iwk)
          integer    nobs, ncol, ldx, irsp, ind, ifrq, iwt, maxdeg, icrit,  &
     &           lof, ndeg, nrmiss, iwk(*)
          real       crit, smultc, saddc, dfe, sse, dfpe, sspe, x(ldx,*),   &
     &           a(*), b(*), scoef(*), ssorp(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rstap (ndeg, a, b, smultc, saddc, scoef,d, dfe, sse, lof, dfpe, sspe, iprint, aov, sqss,ldsqss, coef, ldcoef, tlof, ldtlof)
          integer    ndeg, lof, iprint, ldsqss, ldcoef, ldtlof
          real       smultc, saddc, dfe, sse, dfpe, sspe, a(*), b(*),       &
     &           scoef(*), d(*), aov(*), sqss(*), coef(*), tlof(*)
        end subroutine
      end interface

      interface
        subroutine r2tap (ndeg, a, b, smultc, saddc, scoef,d, dfe, sse, lof, dfpe, sspe, iprint, aov, sqss,ldsqss, coef, ldcoef, tlof, ldtlof, wk)
          integer    ndeg, lof, iprint, ldsqss, ldcoef, ldtlof
          real       smultc, saddc, dfe, sse, dfpe, sspe, a(*), b(*),       &
     &           scoef(*), d(*), aov(*), sqss(ldsqss,*),                &
     &           coef(ldcoef,*), tlof(ldtlof,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rcasp (nobs, ncol, x, ldx, irsp, ind, iwt,ipred, conpcm, conpcp, ndeg, smultc, saddc, a, b,scoef, d, sse, dfe, print, case, ldcase, nrmiss)
          integer    nobs, ncol, ldx, irsp, ind, iwt, ipred, ndeg, ldcase,  &
     &           nrmiss
          real       conpcm, conpcp, smultc, saddc, sse, dfe, x(*), a(*),   &
     &           b(*), scoef(*), d(*), case(*)
          character  print*(*)
        end subroutine
      end interface

      interface
        subroutine r2asp (nobs, ncol, x, ldx, irsp, ind, iwt,ipred, conpcm, conpcp, ndeg, smultc, saddc, a, b,scoef, d, sse, dfe, print, case, ldcase, nrmiss, pwk)
          integer    nobs, ncol, ldx, irsp, ind, iwt, ipred, ndeg, ldcase,  &
     &           nrmiss
          real       conpcm, conpcp, smultc, saddc, sse, dfe, x(ldx,*),     &
     &           a(*), b(*), scoef(*), d(*), case(ldcase,*), pwk(*)
          character  print*(*)
        end subroutine
      end interface

      interface
        subroutine opoly (n, x, iwt, wt, ndeg, smultc, saddc,sx, a, b, poly, ldpoly)
          integer    n, iwt, ndeg, ldpoly
          real       smultc, saddc, x(*), wt(*), sx(*), a(*), b(*),         &
     &           poly(ldpoly,*)
        end subroutine
      end interface

      interface
        subroutine gcscp (ido, nrx, nvar, x, ldx, isub,xmean, scpm, cscp, ldcscp, nrmiss, nvobs)
          integer    ido, nrx, nvar, ldx, isub, ldcscp, nrmiss, nvobs
          real       x(ldx,*), xmean(*), scpm(*), cscp(ldcscp,*)
        end subroutine
      end interface

      interface
        subroutine tcscp (nvar, xmean, scpm, bc, b)
          integer    nvar
          real       xmean(*), scpm(*), bc(*), b(*)
        end subroutine
      end interface

      interface
        subroutine rnlin (func, nparm, ideriv, theta, r, ldr,irank, dfe, sse)
          integer    nparm, ideriv, ldr, irank
          real       dfe, sse, theta(*), r(*)
          external   func
        end subroutine
      end interface

      interface
        subroutine r2lin (func, nparm, ideriv, theta, r, ldr,irank, dfe, sse, iparam, rparam, scale, iwk, wk)
          integer    nparm, ideriv, ldr, irank, iparam(*), iwk(*)
          real       dfe, sse, theta(*), r(*), rparam(*), scale(*), wk(*)
          external   func
        end subroutine
      end interface

      interface
        subroutine r8lin (iparam, rparam)
          integer    iparam(*)
          real       rparam(*)
        end subroutine
      end interface

      interface
        subroutine rlav (nobs, ncol, x, ldx, intcep, iind,indind, irsp, b, irank, sae, iter, nrmiss)
          integer    nobs, ncol, ldx, intcep, iind, irsp, irank, iter,      &
     &           nrmiss, indind(*)
          real       sae, x(*), b(*)
        end subroutine
      end interface

      interface
        subroutine r2av (nobs, ncol, x, ldx, intcep, iind,indind, irsp, b, irank, sae, iter, nrmiss, iwk, wk)
          integer    nobs, ncol, ldx, intcep, iind, irsp, irank, iter,      &
     &           nrmiss, indind(*), iwk(*)
          real       sae, x(*), b(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rllp (nobs, ncol, x, ldx, intcep, iind,indind, irsp, ifrq, iwt, p, tol, maxit, eps, b, r, ldr,irank, dfe, e, scale2, elp, iter, nrmiss)
          integer    nobs, ncol, ldx, intcep, iind, irsp, ifrq, iwt,        &
     &           maxit, ldr, irank, iter, nrmiss, indind(*)
          real       p, tol, eps, dfe, scale2, elp, x(*), b(*), r(*), e(*)
        end subroutine
      end interface

      interface
        subroutine r2lp (nobs, ncol, x, ldx, intcep, iind,indind, irsp, ifrq, iwt, p, tol, maxit, eps, b, r, ldr,irank, dfe, e, scale2, elp, iter, nrmiss, iwk, wk)
          integer    nobs, ncol, ldx, intcep, iind, irsp, ifrq, iwt,        &
     &           maxit, ldr, irank, iter, nrmiss, indind(*), iwk(*)
          real       p, tol, eps, dfe, scale2, elp, x(ldx,*), b(*), r(*),   &
     &           e(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rlmv (nobs, ncol, x, ldx, intcep, iind,indind, irsp, b, irank, aemax, iter, nrmiss)
          integer    nobs, ncol, ldx, intcep, iind, irsp, irank, iter,      &
     &           nrmiss, indind(*)
          real       aemax, x(*), b(*)
        end subroutine
      end interface

      interface
        subroutine r2mv (nobs, ncol, x, ldx, intcep, iind,indind, irsp, b, irank, aemax, iter, nrmiss, wk)
          integer    nobs, ncol, ldx, intcep, iind, irsp, irank, iter,      &
     &           nrmiss, indind(*)
          real       aemax, x(*), b(*), wk(*)
        end subroutine
      end interface

!
!     Chapter 3:  Correlation
!

      interface
        subroutine corvc (ido, nrow, nvar, x, ldx, ifrq, iwt,mopt, icopt, xmean, cov, ldcov, incd, ldincd, nobs,nmiss, sumwt)
          integer    ido, nrow, nvar, ldx, ifrq, iwt, mopt, icopt, ldcov,   &
     &           ldincd, nobs, nmiss, incd(*)
          real       sumwt, x(*), xmean(*), cov(*)
        end subroutine
      end interface

      interface
        subroutine c2rvc (ido, nrow, nvar, x, ldx, ifrq, iwt,mopt, icopt, xmean, cov, ldcov, incd, ldincd, nobs,nmiss, sumwt, wk)
          integer    ido, nrow, nvar, ldx, ifrq, iwt, mopt, icopt, ldcov,   &
     &           ldincd, nobs, nmiss, incd(ldincd,*)
          real       sumwt, x(ldx,*), xmean(*), cov(ldcov,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine covpl (ido, nrow, nvar, ncol, x, ldx, ind,ifrq, iwt, ngroup, igrp, ni, swt, xmean, ldxmea, cov,ldcov, nrmiss)
          integer    ido, nrow, nvar, ncol, ldx, ifrq, iwt, ngroup, igrp,   &
     &           ldxmea, ldcov, nrmiss, ind(*), ni(*)
          real       x(*), swt(*), xmean(*), cov(*)
        end subroutine
      end interface

      interface
        subroutine c2vpl (ido, nrow, nvar, ncol, x, ldx, ind,ifrq, iwt, ngroup, igrp, ni, swt, xmean, ldxmea, cov,ldcov, nrmiss, d, ob, xval, dif)
          integer    ido, nrow, nvar, ncol, ldx, ifrq, iwt, ngroup, igrp,   &
     &           ldxmea, ldcov, nrmiss, ind(*), ni(*)
          real       x(ldx,*), swt(*), xmean(ldxmea,*), cov(ldcov,*),       &
     &           d(*), ob(*), xval(nvar,*), dif(*)
        end subroutine
      end interface

      interface
        subroutine pcorr (nvar, cor, ldcor, ndf, icor, nind,ind, ndep, inddep, pcor, ldpcor, ndfp, pval, ldpval)
          integer    nvar, ldcor, ndf, icor, nind, ndep, ldpcor, ndfp,      &
     &           ldpval, ind(*), inddep(*)
          real       cor(*), pcor(*), pval(*)
        end subroutine
      end interface

      interface
        subroutine p2orr (nvar, cor, ldcor, ndf, icor, nind,ind, ndep, inddep, pcor, ldpcor, ndfp, pval, ldpval,sxy, sxx, lx, iy, ix)
          integer    nvar, ldcor, ndf, icor, nind, ndep, ldpcor, ndfp,      &
     &           ldpval, lx, ind(*), inddep(*), iy(*), ix(*)
          real       cor(ldcor,*), pcor(ldpcor,*), pval(ldpval,*),          &
     &           sxy(lx,*), sxx(lx,*)
        end subroutine
      end interface

      interface
        subroutine rbcov (wghts, nobs, nvar, ncol, x, ldx,ind, ifrq, iwt, ngroup, igrp, init, imth, percnt,maxit, eps, ni, swt, xmean, ldxmea, cov, ldcov, const,nrmiss)
          integer    nobs, nvar, ncol, ldx, ifrq, iwt, ngroup, igrp, init,  &
     &           imth, maxit, ldxmea, ldcov, nrmiss, ind(*), ni(*)
          real       percnt, eps, x(*), swt(*), xmean(*), cov(*), const(*)
          external   wghts
        end subroutine
      end interface

      interface
        subroutine r2cov (wghts, nobs, nvar, ncol, x, ldx,ind, ifrq, iwt, ngroup, igrp, init, imth, percnt,maxit, eps, ni, swt, xmean, ldxmea, cov, ldcov, const,nrmiss, d, u, gxb, ob, ob1, ob2, sww, wk, irn, isf)
          integer    nobs, nvar, ncol, ldx, ifrq, iwt, ngroup, igrp, init,  &
     &           imth, maxit, ldxmea, ldcov, nrmiss, ind(*), ni(*),     &
     &           irn(*), isf(*)
          real       percnt, eps, x(ldx,*), swt(*), xmean(ldxmea,*),        &
     &           cov(ldcov,*), const(*), d(*), u(nvar,nvar,*),          &
     &           gxb(nvar,*), ob(*), ob1(*), ob2(*), sww(*), wk(*)
          external   wghts
        end subroutine
      end interface

      interface
        subroutine r5cov (r, nvar, percnt, uu, ww, up)
          integer    nvar
          real       r, percnt, uu, ww, up
        end subroutine
      end interface

      interface
        subroutine ctrho (nrow, ncol, table, ldtabl, eps,rho, var, pltmy, prob, ldprob, deriv, ldderi)
          integer    nrow, ncol, ldtabl, ldprob, ldderi
          real       eps, rho, var, table(ldtabl,*), pltmy(*),              &
     &           prob(ldprob,*), deriv(ldderi,*)
        end subroutine
      end interface

      interface
        subroutine tetcc (ido, nrow, x, y, hx, hy, icount,ldicou, nr, r, rs)
          integer    ido, nrow, ldicou, nr, icount(ldicou,*)
          real       hx, hy, rs, x(*), y(*), r(*)
        end subroutine
      end interface

      interface
        subroutine bspbs (k, a, lda, stat)
          integer    k, lda
          real       a(lda,*), stat(*)
        end subroutine
      end interface

      interface
        subroutine bscat (k, a, lda, stat)
          integer    k, lda
          real       a(lda,*), stat(*)
        end subroutine
      end interface

      interface
        subroutine cncrd (nobs, k, x, ldx, fuzz, sums, stat)
          integer    nobs, k, ldx
          real       fuzz, x(*), sums(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine c2crd (nobs, k, x, ldx, fuzz, sums, stat,iwk, xwk)
          integer    nobs, k, ldx, iwk(*)
          real       fuzz, x(ldx,*), sums(*), stat(*), xwk(*)
        end subroutine
      end interface

      interface
        subroutine kendl (nobs, x, y, fuzz, stat, freq)
          integer    nobs
          real       fuzz, x(*), y(*), stat(*), freq(*)
        end subroutine
      end interface

      interface
        subroutine k2ndl (nobs, x, y, fuzz, stat, freq, iwk,wk, xrnk, yrnk)
          integer    nobs, iwk(*)
          real       fuzz, x(*), y(*), stat(*), freq(*), wk(*), xrnk(*),    &
     &           yrnk(*)
        end subroutine
      end interface

      interface
        subroutine kendp (nobs, k, freq, prob)
          integer    nobs, k
          real       prob, freq(*)
        end subroutine
      end interface

      interface
        subroutine k2ndp (nobs, k, freq, prob, fwk)
          integer    nobs, k
          real       prob, freq(*), fwk(*)
        end subroutine
      end interface

!
!     Chapter 4:  Analysis of Variance
!

      interface
        subroutine aonew (ngroup, ni, y, iprint, aov, stat,ldstat, nmiss)
          integer    ngroup, iprint, ldstat, nmiss, ni(*)
          real       y(*), aov(15), stat(ldstat,*)
        end subroutine
      end interface

      interface
        subroutine aonec (ngroup, ni, ncov, xy, ldxy, itest,iprint, coef, ldcoef, r, ldr, aov, ptss, testpl,xymean, ldxyme, covm, ldcovm, covb, ldcovb, nrmiss)
          integer    ngroup, ncov, ldxy, itest, iprint, ldcoef, ldr,        &
     &           ldxyme, ldcovm, ldcovb, nrmiss, ni(*)
          real       xy(ldxy,*), coef(ldcoef,*), r(ldr,*), aov(*),          &
     &           ptss(*), testpl(*), xymean(ldxyme,*), covm(ldcovm,*),  &
     &           covb(ldcovb,*)
        end subroutine
      end interface

      interface
        subroutine a2nec (ngroup, ni, ncov, xy, ldxy, itest,iprint, coef, ldcoef, r, ldr, aov, ptss, testpl,xymean, ldxyme, covm, ldcovm, covb, ldcovb, nrmiss, wk)
          integer    ngroup, ncov, ldxy, itest, iprint, ldcoef, ldr,        &
     &           ldxyme, ldcovm, ldcovb, nrmiss, ni(*)
          real       xy(ldxy,*), coef(ldcoef,*), r(ldr,*), aov(*),          &
     &           ptss(*), testpl(*), xymean(ldxyme,*), covm(ldcovm,*),  &
     &           covb(ldcovb,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine atwob (nblk, ntrt, nresp, y, iprint, aov,efss, testlf, ymeans)
          integer    nblk, ntrt, nresp, iprint
          real       y(nresp,nblk,*), aov(*), efss(2,*), testlf(*),         &
     &           ymeans(*)
        end subroutine
      end interface

      interface
        subroutine abibd (ntrt, nrep, nblk, ntblk, nresp, y,itrt, inter, iprint, aov, sqss, ssalt, testlf, ymeans,setrtd, efncy)
          integer    ntrt, nrep, nblk, ntblk, nresp, inter, iprint, itrt(*)
          real       setrtd, efncy, y(*), aov(*), sqss(3,*), ssalt(*),      &
     &           testlf(*), ymeans(*)
        end subroutine
      end interface

      interface
        subroutine a2ibd (ntrt, nrep, nblk, ntblk, nresp, y,itrt, inter, iprint, aov, sqss, ssalt, testlf, ymeans,setrtd, efncy, wk)
          integer    ntrt, nrep, nblk, ntblk, nresp, inter, iprint, itrt(*)
          real       setrtd, efncy, y(*), aov(*), sqss(3,*), ssalt(*),      &
     &           testlf(*), ymeans(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine alatn (ntrt, nresp, y, itrt, iprint, aov,efss, testlf, ymeans)
          integer    ntrt, nresp, iprint, itrt(ntrt,*)
          real       y(nresp,ntrt,*), aov(*), efss(3,*), testlf(*),         &
     &           ymeans(*)
        end subroutine
      end interface

      interface
        subroutine anway (nf, nl, y, intera, iprint, aov,efss, ldefss, ymeans)
          integer    nf, intera, iprint, ldefss, nl(*)
          real       y(*), aov(*), efss(ldefss,*), ymeans(*)
        end subroutine
      end interface

      interface
        subroutine a2way (nf, nl, y, intera, iprint, aov,efss, ldefss, ymeans, wk, iwk)
          integer    nf, intera, iprint, ldefss, nl(*), iwk(*)
          real       y(*), aov(*), efss(ldefss,*), ymeans(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine abald (nf, nl, y, nrf, indrf, nef, nfef,indef, conper, iprint, model, aov, ems, vc, ldvc,ymeans)
          integer    nf, nrf, nef, iprint, model, ldvc, nl(*), indrf(*),    &
     &           nfef(*), indef(*)
          real       conper, y(*), aov(*), ems(*), vc(ldvc,*), ymeans(*)
        end subroutine
      end interface

      interface
        subroutine a2ald (nf, nl, y, nrf, indrf, nef, nfef,indef, conper, iprint, model, aov, ems, vc, ldvc,ymeans, wk, iwk, c13ksp)
          integer    nf, nrf, nef, iprint, model, ldvc, nl(*), indrf(*),    &
     &           nfef(*), indef(*), iwk(*)
          real       conper, y(*), aov(*), ems(*), vc(ldvc,*), ymeans(*),   &
     &           wk(*)
          character  c13ksp(*)*13
        end subroutine
      end interface

      interface
        subroutine anest (nf, ieq, nl, y, conper, iprint,aov, ems, vc, ldvc, ymeans, nmiss)
          integer    nf, ieq, iprint, ldvc, nmiss, nl(*)
          real       conper, y(*), aov(*), ems(*), vc(ldvc,*), ymeans(*)
        end subroutine
      end interface

      interface
        subroutine a2est (nf, ieq, nl, y, conper, iprint,aov, ems, vc, ldvc, ymeans, nmiss, wk, iwk, c10wk)
          integer    nf, ieq, iprint, ldvc, nmiss, nl(*), iwk(*)
          real       conper, y(*), aov(*), ems(*), vc(ldvc,*), ymeans(*),   &
     &           wk(*)
          character  c10wk(*)*10
        end subroutine
      end interface

      interface
        subroutine ctrst (ngroup, ni, ymeans, nctrst, c, ldc,est, ss)
          integer    ngroup, nctrst, ldc, ni(*)
          real       ymeans(*), c(ldc,*), est(*), ss(*)
        end subroutine
      end interface

      interface
        subroutine scipm (ngroup, ni, ymeans, dfs2, s2,imeth, conper, iprint, stat, ldstat)
          integer    ngroup, imeth, iprint, ldstat, ni(*)
          real       dfs2, s2, conper, ymeans(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine s2ipm (ngroup, ni, ymeans, dfs2, s2,imeth, conper, iprint, stat, ldstat, wk, iwk)
          integer    ngroup, imeth, iprint, ldstat, ni(*), iwk(*)
          real       dfs2, s2, conper, ymeans(*), stat(ldstat,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine snkmc (ngroup, ymeans, semean, dfse,alpha, iprint, ieqmns)
          integer    ngroup, iprint, ieqmns(*)
          real       semean, dfse, alpha, ymeans(*)
        end subroutine
      end interface

      interface
        subroutine s2kmc (ngroup, ymeans, semean, dfse,alpha, iprint, ieqmns, wk, iwk)
          integer    ngroup, iprint, ieqmns(*), iwk(*)
          real       semean, dfse, alpha, ymeans(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine cidms (df1, efms1, df2, efms2, vchat,conper, imeth, ci)
          integer    imeth
          real       df1, efms1, df2, efms2, vchat, conper, ci(*)
        end subroutine
      end interface

      interface
        subroutine rorex (nf, nl, iord, yin, jord, yout)
          integer    nf, nl(*), iord(*), jord(*)
          real       yin(*), yout(*)
        end subroutine
      end interface

      interface
        subroutine r2rex (nf, nl, iord, yin, jord, yout, iwk)
          integer    nf, nl(*), iord(*), jord(*), iwk(*)
          real       yin(*), yout(*)
        end subroutine
      end interface

!
!     Chapter 5:  Categorical and Discrete Data Analysis
!

      interface
        subroutine cttwo (table, ldtabl, icmpt, iprint,expect, ldexpe, chi, ldchi, chisq, stat, ldstat)
          integer    ldtabl, icmpt, iprint, ldexpe, ldchi, ldstat
          real       table(ldtabl,2), expect(ldexpe,3), chi(ldchi,3),       &
     &           chisq(15), stat(ldstat,5)
        end subroutine
      end interface

      interface
        subroutine ctchi (nrow, ncol, table, ldtabl, icmpt,iprint, expect, ldexpe, chi, ldchi, chisq, stat,ldstat)
          integer    nrow, ncol, ldtabl, icmpt, iprint, ldexpe, ldchi,      &
     &           ldstat
          real       table(ldtabl,*), expect(ldexpe,*), chi(ldchi,*),       &
     &           chisq(10), stat(ldstat,5)
        end subroutine
      end interface

      interface
        subroutine ctprb (nrow, ncol, table, ldtabl, prt,pre, pchek)
          integer    nrow, ncol, ldtabl
          real       prt, pre, pchek, table(*)
        end subroutine
      end interface

      interface
        subroutine c2prb (nrow, ncol, table, ldtabl, prt,pre, pchek, iwk)
          integer    nrow, ncol, ldtabl, iwk(*)
          real       prt, pre, pchek, table(ldtabl,*)
        end subroutine
      end interface

      interface
        subroutine ctepr (nrow, ncol, table, ldtabl, expect,percnt, emin, prt, pre)
          integer    nrow, ncol, ldtabl
          real       expect, percnt, emin, prt, pre, table(*)
        end subroutine
      end interface

      interface
        subroutine c2epr (nrow, ncol, table, ldtabl, expect,percnt, emin, prt, pre, fact, ico, iro, kyy, idif, irn,key, ldkey, ipoin, stp, ldstp, ifrq, dlp, dsp, tm,key2, iwk, rwk)
          integer    nrow, ncol, ldtabl, ldkey, ldstp, ico(*), iro(*),      &
     &           kyy(*), idif(*), irn(*), key(*), ipoin(*), ifrq(*),    &
     &           key2(*), iwk(*)
          real       expect, percnt, emin, prt, pre, table(ldtabl,*),       &
     &           fact(0:*), stp(*), dlp(*), dsp(*), tm(*), rwk(*)
        end subroutine
      end interface

      interface
        subroutine prpft (nclvar, nclval, table, nef, nvef,indef, eps, maxit, fit)
          integer    nclvar, nef, maxit, nclval(*), nvef(*), indef(*)
          real       eps, table(*), fit(*)
        end subroutine
      end interface

      interface
        subroutine p2pft (nclvar, nclval, table, nef, nvef,indef, eps, maxit, fit, amar, index, wk, iwk)
          integer    nclvar, nef, maxit, nclval(*), nvef(*), indef(*),      &
     &           index(*), iwk(*)
          real       eps, table(*), fit(*), amar(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine ctlln (nclvar, nclval, table, nef, nvef,indef, eps, maxit, tol, iprint, fit, ncoef, coef,ldcoef, cov, ldcov, resid, ldresi, stat)
          integer    nclvar, nef, maxit, iprint, ncoef, ldcoef, ldcov,      &
     &           ldresi, nclval(*), nvef(*), indef(*)
          real       eps, tol, table(*), fit(*), coef(*), cov(*),           &
     &           resid(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine c2lln (nclvar, nclval, table, nef, nvef,indef, eps, maxit, tol, iprint, fit, ncoef, coef,ldcoef, cov, ldcov, resid, ldresi, stat, amar, indx,ncvef, ixef, iindef, ia, indcl, clval, reg, x, d, xmin,xmax, covwk, wk, iwk)
          integer    nclvar, nef, maxit, iprint, ncoef, ldcoef, ldcov,      &
     &           ldresi, nclval(*), nvef(*), indef(*), indx(*),         &
     &           ncvef(*), ixef(*), iindef(*), ia(*), indcl(*), iwk(*)
          real       eps, tol, table(*), fit(*), coef(ldcoef,*),            &
     &           cov(ldcov,*), resid(ldresi,*), stat(*), amar(*),       &
     &           clval(*), reg(*), x(*), d(*), xmin(*), xmax(*),        &
     &           covwk(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine ctpar (nclvar, nclval, nef, nvef, indef,fit, tol, iprint, ncoef, coef, ldcoef, cov, ldcov)
          integer    nclvar, nef, iprint, ncoef, ldcoef, ldcov, nclval(*),  &
     &           nvef(*), indef(*)
          real       tol, fit(*), coef(*), cov(*)
        end subroutine
      end interface

      interface
        subroutine c2par (nclvar, nclval, nef, nvef, indef,fit, tol, iprint, ncoef, coef, ldcoef, cov, ldcov,irank, ncvef, ixef, iindef, ia, indcl, clval, reg, x,d, xmin, xmax, wk)
          integer    nclvar, nef, iprint, ncoef, ldcoef, ldcov, irank,      &
     &           nclval(*), nvef(*), indef(*), ncvef(*), ixef(*),       &
     &           iindef(*), ia(*), indcl(*)
          real       tol, fit(*), coef(ldcoef,*), cov(ldcov,*), clval(*),   &
     &           reg(*), x(*), d(*), xmin(*), xmax(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine ctasc (nclvar, nclval, table, zero, eps,maxit, iprint, assoc, ldasso, chihi, ldchih, chisim,ldchis)
          integer    nclvar, maxit, iprint, ldasso, ldchih, ldchis,         &
     &           nclval(*)
          real       eps, table(*), zero(*), assoc(*), chihi(*), chisim(*)
        end subroutine
      end interface

      interface
        subroutine c2asc (nclvar, nclval, table, zero, eps,maxit, iprint, assoc, ldasso, chihi, ldchih, chisim,ldchis, fitwk, ncvef, ixef, amar, indx, wk, iwk, covwk)
          integer    nclvar, maxit, iprint, ldasso, ldchih, ldchis,         &
     &           nclval(*), ncvef(*), ixef(*), indx(*), iwk(*)
          real       eps, table(*), zero(*), assoc(ldasso,*),               &
     &           chihi(ldchih,*), chisim(ldchis,*), fitwk(*), amar(*),  &
     &           wk(*), covwk(*)
        end subroutine
      end interface

      interface
        subroutine ctstp (ido, nclvar, nclval, table, pin,pout, istep, nstep, nforce, iprint, nef, nvef, maxnvf,indef, maxind, fit, stat, iend)
          integer    ido, nclvar, istep, nstep, nforce, iprint, nef,        &
     &           maxnvf, maxind, iend, nclval(*), nvef(*), indef(*)
          real       pin, pout, table(*), fit(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine c2stp (ido, nclvar, nclval, table, pin,pout, istep, nstep, nforce, iprint, nef, nvef, maxnvf,indef, maxind, fit, stat, iend, maxmar, amar, invef,iindef, idf, zwk, rwk, iwk)
          integer    ido, nclvar, istep, nstep, nforce, iprint, nef,        &
     &           maxnvf, maxind, iend, maxmar, nclval(*), nvef(*),      &
     &           indef(*), invef(*), iindef(*), idf(*), iwk(*)
          real       pin, pout, table(*), fit(*), stat(*), amar(*),         &
     &           zwk(*), rwk(*)
        end subroutine
      end interface

      interface
        subroutine ctran (nclvar, nclval, table, indrow,indcol, itype, irowsc, icolsc, iprint, rowscr, colscr,stat, ldstat)
          integer    nclvar, indrow, indcol, itype, irowsc, icolsc,         &
     &           iprint, ldstat, nclval(*)
          real       table(*), rowscr(*), colscr(*), stat(ldstat,*)
        end subroutine
      end interface

      interface
        subroutine c2ran (nclvar, nclval, table, indrow,indcol, itype, irowsc, icolsc, iprint, rowscr, colscr,stat, ldstat, ix, f, colsum, rowsum, difvec, difsum,cov, covsum, awk, bwk)
          integer    nclvar, indrow, indcol, itype, irowsc, icolsc,         &
     &           iprint, ldstat, nclval(*), ix(*)
          real       table(*), rowscr(*), colscr(*), stat(ldstat,*), f(*),  &
     &           colsum(*), rowsum(*), difvec(*), difsum(*), cov(*),    &
     &           covsum(*), awk(*), bwk(*)
        end subroutine
      end interface

      interface
        subroutine ctglm (nobs, ncol, x, ldx, model, ilt,irt, ifrq, ifix, ipar, icen, infin, maxit, eps, intcep,nclvar, indcl, nef, nvef, indef, init, iprint, maxcl,nclval, clval, ncoef, coef, ldcoef, algl, cov, ldcov,xmean, case, ldcase, gr, iadd, nrmiss)
          integer    nobs, ncol, ldx, model, ilt, irt, ifrq, ifix, ipar,    &
     &           icen, infin, maxit, intcep, nclvar, nef, init,         &
     &           iprint, maxcl, ncoef, ldcoef, ldcov, ldcase, nrmiss,   &
     &           indcl(*), nvef(*), indef(*), nclval(*), iadd(*)
          real       eps, algl, x(*), clval(*), coef(*), cov(*), xmean(*),  &
     &           case(*), gr(*)
        end subroutine
      end interface

      interface
        subroutine c2glm (nobs, ncol, x, ldx, model, ilt,irt, ifrq, ifix, ipar, icen, infin, maxit, eps, intcep,nclvar, indcl, nef, nvef, indef, init, iprint, maxcl,nclval, clval, ncoef, coef, ldcoef, algl, cov, ldcov,xmean, case, ldcase, gr, iadd, nrmiss, nmax, obs, addx,xd, wk, kbasis)
          integer    nobs, ncol, ldx, model, ilt, irt, ifrq, ifix, ipar,    &
     &           icen, infin, maxit, intcep, nclvar, nef, init,         &
     &           iprint, maxcl, ncoef, ldcoef, ldcov, ldcase, nrmiss,   &
     &           nmax, indcl(*), nvef(*), indef(*), nclval(*),          &
     &           iadd(*), kbasis(*)
          real       eps, algl, x(*), clval(*), coef(ldcoef,*),             &
     &           cov(ldcov,*), xmean(*), case(ldcase,*), gr(*),         &
     &           obs(*), xd(*), wk(*)
          logical    addx(*)
        end subroutine
      end interface

      interface
        subroutine ctwls (nresp, npop, table, ldtabl, ntran,itran, isize, amats, ncoef, x, ldx, numh, nh, h, ldh,iprint, chsq, ldchsq, coef, ldcoef, covcf, ldcovc, f,covf, ldcovf, resid, ldresi)
          integer    nresp, npop, ldtabl, ntran, ncoef, ldx, numh, ldh,     &
     &           iprint, ldchsq, ldcoef, ldcovc, ldcovf, ldresi,        &
     &           itran(*), isize(*), nh(*)
          real       table(*), amats(*), x(*), h(*), chsq(*), coef(*),      &
     &           covcf(*), f(*), covf(*), resid(*)
        end subroutine
      end interface

      interface
        subroutine c2wls (nresp, npop, table, ldtabl, ntran,itran, isize, amats, ncoef, x, ldx, numh, nh, h, ldh,iprint, chsq, ldchsq, coef, ldcoef, covcf, ldcovc, f,covf, ldcovf, resid, ldresi, pder, frq, est, xx, wk,iwk, wwk)
          integer    nresp, npop, ldtabl, ntran, ncoef, ldx, numh, ldh,     &
     &           iprint, ldchsq, ldcoef, ldcovc, ldcovf, ldresi,        &
     &           itran(*), isize(*), nh(*), iwk(*)
          real       table(ldtabl,*), amats(*), x(ldx,*), h(ldh,*),         &
     &           chsq(ldchsq,*), coef(ldcoef,*), covcf(ldcovc,*),       &
     &           f(*), covf(ldcovf,*), resid(ldresi,*), pder(*),        &
     &           frq(*), est(*), xx(*), wk(*), wwk(*)
        end subroutine
      end interface

!
!     Chapter 6:  Nonparametric Statistics
!

      interface
        subroutine signt (nobs, x, q, p, npos, ntie, prob,nmiss)
          integer    nobs, npos, ntie, nmiss
          real       q, p, prob, x(*)
        end subroutine
      end interface

      interface
        subroutine snrnk (nobs, y, fuzz, stat, nmiss)
          integer    nobs, nmiss
          real       fuzz, y(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine s2rnk (nobs, y, fuzz, stat, nmiss, ir,yrank)
          integer    nobs, nmiss, ir(*)
          real       fuzz, y(*), stat(*), yrank(*)
        end subroutine
      end interface

      interface
        subroutine nctrd (nobs, x, fuzz, nstat, p, nmiss)
          integer    nobs, nmiss, nstat(*)
          real       fuzz, x(*), p(*)
        end subroutine
      end interface

      interface
        subroutine sdplc (nobs, x, iopt, k, ids, fuzz, nstat,pstat, nmiss)
          integer    nobs, iopt, k, ids, nmiss, nstat(*)
          real       fuzz, x(*), pstat(*)
        end subroutine
      end interface

      interface
        subroutine s2plc (nobs, x, iopt, k, ids, fuzz, nstat,pstat, nmiss, xwk)
          integer    nobs, iopt, k, ids, nmiss, nstat(*)
          real       fuzz, x(*), pstat(*), xwk(*)
        end subroutine
      end interface

      interface
        subroutine nties (nobs, x, fuzz, ties)
          integer    nobs
          real       fuzz, x(*), ties(*)
        end subroutine
      end interface

      interface
        subroutine rnksm (nobsx, x, nobsy, y, fuzz, stat,nmissx, nmissy)
          integer    nobsx, nobsy, nmissx, nmissy
          real       fuzz, x(*), y(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine r2ksm (nobsx, x, nobsy, y, fuzz, stat,nmissx, nmissy, iwk, ywk)
          integer    nobsx, nobsy, nmissx, nmissy, iwk(*)
          real       fuzz, x(*), y(*), stat(*), ywk(*)
        end subroutine
      end interface

      interface
        subroutine incld (nobsx, x, nobsy, y, ilx, ihx, fuzz,stat, nmissx, nmissy)
          integer    nobsx, nobsy, ilx, ihx, nmissx, nmissy
          real       fuzz, x(*), y(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine i2cld (nobsx, x, nobsy, y, ilx, ihx, fuzz,stat, nmissx, nmissy, wk)
          integer    nobsx, nobsy, ilx, ihx, nmissx, nmissy
          real       fuzz, x(*), y(*), stat(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine krskl (ngroup, ni, y, fuzz, stat)
          integer    ngroup, ni(*)
          real       fuzz, y(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine k2skl (ngroup, ni, y, fuzz, stat, iwk, wk,yrnk)
          integer    ngroup, ni(*), iwk(*)
          real       fuzz, y(*), stat(*), wk(*), yrnk(*)
        end subroutine
      end interface

      interface
        subroutine bhakv (ngroup, ni, y, v, prob)
          integer    ngroup, ni(*)
          real       v, prob, y(*)
        end subroutine
      end interface

      interface
        subroutine b2akv (ngroup, ni, y, v, prob, iwk, wk,ywk)
          integer    ngroup, ni(*), iwk(*)
          real       v, prob, y(*), wk(*), ywk(*)
        end subroutine
      end interface

      interface
        subroutine frdmn (nb, nt, y, fuzz, alpha, stat,smrnk, d)
          integer    nb, nt
          real       fuzz, alpha, d, y(*), stat(*), smrnk(*)
        end subroutine
      end interface

      interface
        subroutine f2dmn (nb, nt, y, fuzz, alpha, stat,smrnk, d, iwk, wk)
          integer    nb, nt, iwk(nt)
          real       fuzz, alpha, d, y(*), stat(*), smrnk(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine qtest (nobs, nvar, x, ldx, q, pq)
          integer    nobs, nvar, ldx
          real       q, pq, x(ldx,*)
        end subroutine
      end interface

      interface
        subroutine ktrnd (ngroup, ni, x, stat)
          integer    ngroup, ni(*)
          real       x(*), stat(*)
        end subroutine
      end interface

!
!     Chapter 7:  Tests of Goodness of Fit and Randomness
!

      interface
        subroutine ksone (cdf, nobs, x, pdif, nmiss)
          integer    nobs, nmiss
          real       cdf, x(*), pdif(*)
          external   cdf
        end subroutine
      end interface

      interface
        subroutine k2one (cdf, nobs, x, pdif, nmiss, xwk)
          integer    nobs, nmiss
          real       cdf, x(*), pdif(*), xwk(*)
          external   cdf
        end subroutine
      end interface

      interface
        subroutine chigf (ido, cdf, nelm, x, freq, ncat,rnge, ndfest, cutp, counts, expect, chisq, p, df)
          integer    ido, nelm, ncat, ndfest
          real       cdf, p, df, x(*), freq(*), rnge(2), cutp(*),           &
     &           counts(*), expect(*), chisq(*)
          external   cdf
        end subroutine
      end interface

      interface
        subroutine spwlk (nobs, x, w, p, nmiss)
          integer    nobs, nmiss
          real       w, p, x(*)
        end subroutine
      end interface

      interface
        subroutine s2wlk (nobs, x, w, p, nmiss, wk)
          integer    nobs, nmiss
          real       w, p, x(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lillf (nobs, x, ipdf, xmean, std, dif,prob, nmiss)
          integer    nobs, ipdf, nmiss
          real       xmean, std, dif, prob, x(*)
        end subroutine
      end interface

      interface
        subroutine l2llf (nobs, x, ipdf, xmean, std, dif,prob, nmiss, xwk)
          integer    nobs, ipdf, nmiss
          real       xmean, std, dif, prob, x(*), xwk(*)
        end subroutine
      end interface

      interface
        subroutine mvmmt (nobs, nvar, ncol, x, ldx, ind,ifrq, iwt, icmput, ni, swt, xmean, r, ldr, stat,nrmiss)
          integer    nobs, nvar, ncol, ldx, ifrq, iwt, icmput, ni, ldr,     &
     &           nrmiss, ind(*)
          real       swt, x(*), xmean(*), r(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine m2mmt (nobs, nvar, ncol, x, ldx, ind,ifrq, iwt, icmput, ni, swt, xmean, r, ldr, stat,nrmiss, d, ob, cc)
          integer    nobs, nvar, ncol, ldx, ifrq, iwt, icmput, ni, ldr,     &
     &           nrmiss, ind(*)
          real       swt, x(ldx,*), xmean(*), r(ldr,*), stat(*), d(*),      &
     &           ob(*), cc(nvar,nvar,*)
        end subroutine
      end interface

      interface
        subroutine kstwo (nobsx, x, nobsy, y, pdif, nmissx,nmissy)
          integer    nobsx, nobsy, nmissx, nmissy
          real       x(*), y(*), pdif(*)
        end subroutine
      end interface

      interface
        subroutine k2two (nobsx, x, nobsy, y, pdif, nmissx,nmissy, xwk, ywk)
          integer    nobsx, nobsy, nmissx, nmissy
          real       x(*), y(*), pdif(*), xwk(*), ywk(*)
        end subroutine
      end interface

      interface
        subroutine runs (ido, nran, x, nrun, count, expect,covar, ldcova, chisq, df, prob)
          integer    ido, nran, nrun, ldcova
          real       chisq, df, prob, x(*), count(*), expect(*), covar(*)
        end subroutine
      end interface

      interface
        subroutine r2ns (ido, nran, x, nrun, count, expect,covar, ldcova, chisq, df, prob, rwk, cwk, lrun, nobs,xlast)
          integer    ido, nran, nrun, ldcova, lrun, nobs
          real       chisq, df, prob, xlast, x(*), count(*), expect(*),     &
     &           covar(ldcova,*), rwk(*), cwk(nrun,*)
        end subroutine
      end interface

      interface
        subroutine pairs (ido, nran, x, ncell, lag, count,ldcoun, expect, chisq, df, prob)
          integer    ido, nran, ncell, lag, ldcoun
          real       expect, chisq, df, prob, x(*), count(ldcoun,*)
        end subroutine
      end interface

      interface
        subroutine dsqar (ido, nran, x, ncell, count, expect,chisq, df, prob)
          integer    ido, nran, ncell
          real       expect, chisq, df, prob, x(*), count(*)
        end subroutine
      end interface

      interface
        subroutine dcube (ido, nran, x, ncell, count, ldcoun,expect, chisq, df, prob)
          integer    ido, nran, ncell, ldcoun
          real       expect, chisq, df, prob, x(*), count(ldcoun,ldcoun,*)
        end subroutine
      end interface

!
!     Chapter 8:  Time Series Analysis and Forecasting
!

      interface
        subroutine bctr (nobs, z, iprint, idir, power, shift,x)
          integer    nobs, iprint, idir
          real       power, shift, z(*), x(*)
        end subroutine
      end interface

      interface
        subroutine diff (nobsz, z, ndiff, iper, iord, iprint,imiss, nlost, nobsx, x)
          integer    nobsz, ndiff, iprint, imiss, nlost, nobsx, iper(*),    &
     &           iord(*)
          real       z(*), x(*)
        end subroutine
      end interface

      interface
        subroutine d2ff (nobsz, z, ndiff, iper, iord, iprint,imiss, nlost, nobsx, x, xwk)
          integer    nobsz, ndiff, iprint, imiss, nlost, nobsx, iper(*),    &
     &           iord(*)
          real       z(*), x(*), xwk(*)
        end subroutine
      end interface

      interface
        subroutine acf (nobs, x, iprint, iseopt, imean,xmean, maxlag, acv, ac, seac)
          integer    nobs, iprint, iseopt, imean, maxlag
          real       xmean, x(*), acv(0:*), ac(0:*), seac(*)
        end subroutine
      end interface

      interface
        subroutine pacf (maxlag, ac, pac)
          integer    maxlag
          real       ac(0:*), pac(*)
        end subroutine
      end interface

      interface
        subroutine p2cf (maxlag, ac, pac, wk)
          integer    maxlag
          real       ac(0:*), pac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine ccf (nobs, x, y, maxlag, iprint, iseopt,imean, xmean, ymean, xvar, yvar, ccv, cc, secc)
          integer    nobs, maxlag, iprint, iseopt, imean
          real       xmean, ymean, xvar, yvar, x(*), y(*), ccv(*), cc(*),   &
     &           secc(*)
        end subroutine
      end interface

      interface
        subroutine c2f (nobs, x, y, maxlag, iprint, iseopt,imean, xmean, ymean, xvar, yvar, ccv, cc, secc, acx,acy)
          integer    nobs, maxlag, iprint, iseopt, imean
          real       xmean, ymean, xvar, yvar, x(*), y(*), ccv(-maxlag:*),  &
     &           cc(-maxlag:*), secc(-maxlag:*), acx(0:*), acy(0:*)
        end subroutine
      end interface

      interface
        subroutine mccf (nobsx, nchanx, x, ldx, nobsy,nchany, y, ldy, maxlag, iprint, imean, xmean, ymean,xvar, yvar, ccv, ldccv, mdccv, cc, ldcc, mdcc)
          integer    nobsx, nchanx, ldx, nobsy, nchany, ldy, maxlag,        &
     &           iprint, imean, ldccv, mdccv, ldcc, mdcc
          real       x(ldx,*), y(ldy,*), xmean(*), ymean(*), xvar(*),       &
     &           yvar(*), ccv(ldccv,mdccv,-maxlag:*),                   &
     &           cc(ldcc,mdcc,-maxlag:*)
        end subroutine
      end interface

      interface
        subroutine armme (maxlag, acv, iprint, npma, npar,par)
          integer    maxlag, iprint, npma, npar
          real       acv(*), par(*)
        end subroutine
      end interface

      interface
        subroutine a2mme (maxlag, acv, iprint, npma, npar,par, a, fac, ipvt, wklslr)
          integer    maxlag, iprint, npma, npar, ipvt(*)
          real       acv(0:*), par(*), a(npar,*), fac(*), wklslr(*)
        end subroutine
      end interface

      interface
        subroutine mamme (maxlag, acv, iprint, npar, par,relerr, maxit, npma, pma)
          integer    maxlag, iprint, npar, maxit, npma
          real       relerr, acv(*), par(*), pma(*)
        end subroutine
      end interface

      interface
        subroutine m2mme (maxlag, acv, iprint, npar, par,relerr, maxit, npma, pma, parwk, acvmod, tauini, tau,fvec, fjac, r, qtf, wknln)
          integer    maxlag, iprint, npar, maxit, npma
          real       relerr, acv(0:*), par(*), pma(*), parwk(0:*),          &
     &           acvmod(0:*), tauini(0:*), tau(0:*), fvec(*), fjac(*),  &
     &           r(*), qtf(*), wknln(*)
        end subroutine
      end interface

      interface
        subroutine nspe (nobs, w, iprint, imean, wmean, npar,npma, relerr, maxit, const, par, pma, avar)
          integer    nobs, iprint, imean, npar, npma, maxit
          real       wmean, relerr, const, avar, w(*), par(*), pma(*)
        end subroutine
      end interface

      interface
        subroutine n2pe (nobs, w, iprint, imean, wmean, npar,npma, relerr, maxit, const, par, pma, avar, acv, parwk,acvmod, tauini, tau, fvec, fjac, r, qtf, wknln, a, fac,ipvt, wkarmm)
          integer    nobs, iprint, imean, npar, npma, maxit, ipvt(*)
          real       wmean, relerr, const, avar, w(*), par(*), pma(*),      &
     &           acv(0:*), parwk(*), acvmod(*), tauini(*), tau(0:*),    &
     &           fvec(*), fjac(*), r(*), qtf(*), wknln(*), a(*),        &
     &           fac(*), wkarmm(*)
        end subroutine
      end interface

      interface
        subroutine nslse (nobs, w, iprint, imean, wmean,npar, par, lagar, npma, pma, lagma, maxbc, tolbc,tolss, const, cov, ldcov, na, a, avar)
          integer    nobs, iprint, imean, npar, npma, maxbc, ldcov, na,     &
     &           lagar(*), lagma(*)
          real       wmean, tolbc, tolss, const, avar, w(*), par(*),        &
     &           pma(*), cov(*), a(*)
        end subroutine
      end interface

      interface
        subroutine n2lse (nobs, w, iprint, imean, wmean,npar, par, lagar, npma, pma, lagma, maxbc, tolbc,tolss, const, cov, ldcov, na, a, avar, xguess, xscale,fscale, x, fvec, fjac, ldfjac, rwkunl, iwkunl, wknsre,ai, fcst)
          integer    nobs, iprint, imean, npar, npma, maxbc, ldcov, na,     &
     &           ldfjac, lagar(*), lagma(*), iwkunl(*)
          real       wmean, tolbc, tolss, const, avar, w(*), par(*),        &
     &           pma(*), cov(ldcov,*), a(*), xguess(*), xscale(*),      &
     &           fscale(*), x(*), fvec(*), fjac(ldfjac,*), rwkunl(*),   &
     &           wknsre(*), ai(*), fcst(*)
        end subroutine
      end interface

      interface
        subroutine spwf (nobs, w, iwmean, wmean, wnadj, eps,mlfop, lfop, fop)
          integer    nobs, iwmean, mlfop, lfop
          real       wmean, wnadj, eps, w(*), fop(*)
        end subroutine
      end interface

      interface
        subroutine s2wf (nobs, w, iwmean, wmean, wnadj, eps,mlfop, lfop, fop, cw, wk)
          integer    nobs, iwmean, mlfop, lfop
          real       wmean, wnadj, eps, w(*), fop(*), cw(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine nsbjf (nobs, w, iprint, npar, par, lagar,npma, pma, lagma, iconst, const, avar, alpha, mxbkor,mxlead, fcst, ldfcst)
          integer    nobs, iprint, npar, npma, iconst, mxbkor, mxlead,      &
     &           ldfcst, lagar(*), lagma(*)
          real       const, avar, alpha, w(*), par(*), pma(*),              &
     &           fcst(ldfcst,*)
        end subroutine
      end interface

      interface
        subroutine n2bjf (nobs, w, iprint, npar, par, lagar,npma, pma, lagma, iconst, const, avar, alpha, mxbkor,mxlead, fcst, ldfcst, parh, pmah, psih, psi, lagpsi)
          integer    nobs, iprint, npar, npma, iconst, mxbkor, mxlead,      &
     &           ldfcst, lagar(*), lagma(*), lagpsi(*)
          real       const, avar, alpha, w(*), par(*), pma(*),              &
     &           fcst(ldfcst,*), parh(*), pmah(*), psih(*), psi(*)
        end subroutine
      end interface

      interface
        subroutine irnse (nobs, x, y, iprint, npar, par,npma, pma, mwtir, mwtsn, wtir, snoise, xpw, ypw)
          integer    nobs, iprint, npar, npma, mwtir, mwtsn
          real       x(*), y(*), par(*), pma(*), wtir(*), snoise(*),        &
     &           xpw(*), ypw(*)
        end subroutine
      end interface

      interface
        subroutine i2nse (nobs, x, y, iprint, npar, par,npma, pma, mwtir, mwtsn, wtir, snoise, xpw, ypw, acxpw,acypw, ccpw)
          integer    nobs, iprint, npar, npma, mwtir, mwtsn
          real       x(*), y(*), par(*), pma(*), wtir(0:*), snoise(*),      &
     &           xpw(*), ypw(*), acxpw(0:*), acypw(0:*), ccpw(-mwtir:*)
        end subroutine
      end interface

      interface
        subroutine tfpe (iprint, nplhs, nprhs, npnar, npnma,ndelay, mwtir, wtir, nsnois, snoise, relerr, maxit,plhs, prhs, pnar, pnma, avar)
          integer    iprint, nplhs, nprhs, npnar, npnma, ndelay, mwtir,     &
     &           nsnois, maxit
          real       relerr, avar, wtir(*), snoise(*), plhs(*), prhs(*),    &
     &           pnar(*), pnma(*)
        end subroutine
      end interface

      interface
        subroutine t2pe (iprint, nplhs, nprhs, npnar, npnma,ndelay, mwtir, wtir, nsnois, snoise, relerr, maxit,plhs, prhs, pnar, pnma, avar, a, fac, ipvt, wk, acv,parwk, acvmod, tauini, tau, fvec, fjac, r, qtf, wknln,h)
          integer    iprint, nplhs, nprhs, npnar, npnma, ndelay, mwtir,     &
     &           nsnois, maxit, ipvt(*)
          real       relerr, avar, wtir(0:*), snoise(*), plhs(*), prhs(0:*),&
     &           pnar(*), pnma(*), a(nplhs,*), fac(*), wk(*), acv(*),   &
     &           parwk(*), acvmod(*), tauini(*), tau(*), fvec(*),       &
     &           fjac(*), r(*), qtf(*), wknln(*), h(*)
        end subroutine
      end interface

      interface
        subroutine mlse (nobsx, nchanx, x, ldx, imean, xmean,ndiff, ndpreg, lag, const, npreg, preg)
          integer    nobsx, nchanx, ldx, imean, npreg, ndiff(*),            &
     &           ndpreg(*), lag(*)
          real       const, x(*), xmean(*), preg(*)
        end subroutine
      end interface

      interface
        subroutine m2se (nobsx, nchanx, x, ldx, imean, xmean,ndiff, ndpreg, lag, const, npreg, preg, xwk, iwk)
          integer    nobsx, nchanx, ldx, imean, npreg, ndiff(*),            &
     &           ndpreg(*), lag(*), iwk(*)
          real       const, x(ldx,*), xmean(*), preg(*), xwk(*)
        end subroutine
      end interface

      interface
        subroutine mwfe (nchx, mlfil, cxx, ldcxx, mdcxx,nchz, czx, ldczx, mdczx, eps, trace, lfil, fil, ldfil,mdfil, enms)
          integer    nchx, mlfil, ldcxx, mdcxx, nchz, ldczx, mdczx, lfil,   &
     &           ldfil, mdfil
          real       eps, trace, cxx(*), czx(*), fil(*), enms(*)
        end subroutine
      end interface

      interface
        subroutine m2fe (nchx, mlfil, cxx, ldcxx, mdcxx,nchz, czx, ldczx, mdczx, eps, trace, lfil, fil, ldfil,mdfil, enms, iwk, wk)
          integer    nchx, mlfil, ldcxx, mdcxx, nchz, ldczx, mdczx, lfil,   &
     &           ldfil, mdfil, iwk(*)
          real       eps, trace, cxx(ldcxx,mdcxx,*), czx(ldczx,mdczx,*),    &
     &           fil(ldfil,mdfil,*), enms(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine kalmn (ny, y, nb, z, ldz, r, ldr, it, t,ldt, iq, q, ldq, tol, b, covb, ldcovb, n, ss, alndet,v, covv, ldcovv)
          integer    ny, nb, ldz, ldr, it, ldt, iq, ldq, ldcovb, n, ldcovv
          real       tol, ss, alndet, y(*), z(*), r(*), t(*), q(*), b(*),   &
     &           covb(*), v(*), covv(*)
        end subroutine
      end interface

      interface
        subroutine k2lmn (ny, y, nb, z, ldz, r, ldr, it, t,ldt, iq, q, ldq, tol, b, covb, ldcovb, n, ss, alndet,v, covv, ldcovv, covvch, wk1, wk2)
          integer    ny, nb, ldz, ldr, it, ldt, iq, ldq, ldcovb, n, ldcovv
          real       tol, ss, alndet, y(*), z(ldz,*), r(ldr,*), t(ldt,*),   &
     &           q(ldq,*), b(*), covb(ldcovb,*), v(*), covv(ldcovv,*),  &
     &           covvch(*), wk1(nb,*), wk2(*)
        end subroutine
      end interface

      interface
        subroutine lofcf (nobs, lagmin, lagmax, cf, npfree,q, pvalue)
          integer    nobs, lagmin, lagmax, npfree
          real       q, pvalue, cf(*)
        end subroutine
      end interface

      interface
        real function diric (m, rangle, eps)
          integer    m
          real       rangle, eps
        end function
      end interface

      interface
        real function fejer (m, rangle, eps)
          integer    m
          real       rangle, eps
        end function
      end interface

      interface
        subroutine pfft (nobs, x, iprint, xcntr, npad,ifscal, ipver, pm, ldpm)
          integer    nobs, iprint, npad, ifscal, ipver, ldpm
          real       xcntr, x(*), pm(*)
        end subroutine
      end interface

      interface
        subroutine p2ft (nobs, x, iprint, xcntr, npad,ifscal, ipver, pm, ldpm, cx, coef, wfftc, cpy)
          integer    nobs, iprint, npad, ifscal, ipver, ldpm
          real       xcntr, x(*), pm(ldpm,*), wfftc(*), cpy(*)
          complex    cx(*), coef(0:*)
        end subroutine
      end interface

      interface
        subroutine sswd (nobs, x, iprint, xcntr, npad,ifscal, nf, f, tint, iswver, nm, m, pm, ldpm, sm, ldsm)
          integer    nobs, iprint, npad, ifscal, nf, iswver, nm, ldpm,      &
     &           ldsm, m(*)
          real       xcntr, tint, x(*), f(*), pm(*), sm(*)
        end subroutine
      end interface

      interface
        subroutine s2wd (nobs, x, iprint, xcntr, npad,ifscal, nf, f, tint, iswver, nm, m, pm, ldpm, sm, ldsm,cx, coef, wfftc, cpy)
          integer    nobs, iprint, npad, ifscal, nf, iswver, nm, ldpm,      &
     &           ldsm, m(*)
          real       xcntr, tint, x(*), f(*), pm(ldpm,*), sm(ldsm,*),       &
     &           wfftc(*), cpy(*)
          complex    cx(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine sswp (n, px, nf, f, iswver, m, sx)
          integer    n, nf, iswver, m
          real       px(*), f(*), sx(*)
        end subroutine
      end interface

      interface
        subroutine swed (nobs, x, iprint, xcntr, npad,ifscal, nf, f, tint, nwt, wt, pm, ldpm, sm, ldsm)
          integer    nobs, iprint, npad, ifscal, nf, nwt, ldpm, ldsm
          real       xcntr, tint, x(*), f(*), wt(*), pm(*), sm(*)
        end subroutine
      end interface

      interface
        subroutine s2ed (nobs, x, iprint, xcntr, npad,ifscal, nf, f, tint, nwt, wt, pm, ldpm, sm, ldsm, cx,coef, wfftc, cpy)
          integer    nobs, iprint, npad, ifscal, nf, nwt, ldpm, ldsm
          real       xcntr, tint, x(*), f(*), wt(-nwt/2:*),                 &
     &           pm(0:ldpm-1,*), sm(ldsm,*), wfftc(*), cpy(*)
          complex    cx(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine swep (n, px, nf, f, nwt, wt, sx)
          integer    n, nf, nwt
          real       px(0:*), f(*), wt(-nwt/2:*), sx(*)
        end subroutine
      end interface

      interface
        subroutine cpfft (nobs, x, y, iprint, xcntr, ycntr,npad, ifscal, ipver, cpm, ldcpm)
          integer    nobs, iprint, npad, ifscal, ipver, ldcpm
          real       xcntr, ycntr, x(*), y(*), cpm(*)
        end subroutine
      end interface

      interface
        subroutine c2fft (nobs, x, y, iprint, xcntr, ycntr,npad, ifscal, ipver, cpm, ldcpm, cx, coef, wfftc, cpy)
          integer    nobs, iprint, npad, ifscal, ipver, ldcpm
          real       xcntr, ycntr, x(*), y(*), cpm(ldcpm,*), wfftc(*),      &
     &           cpy(*)
          complex    cx(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine csswd (nobs, x, y, iprint, xcntr, ycntr,npad, ifscal, nf, f, tint, iswver, nm, m, cpm, ldcpm,csm, ldcsm)
          integer    nobs, iprint, npad, ifscal, nf, iswver, nm, ldcpm,     &
     &           ldcsm, m(*)
          real       xcntr, ycntr, tint, x(*), y(*), f(*), cpm(*), csm(*)
        end subroutine
      end interface

      interface
        subroutine c2swd (nobs, x, y, iprint, xcntr, ycntr,npad, ifscal, nf, f, tint, iswver, nm, m, cpm, ldcpm,csm, ldcsm, cx, coef, wfftc, cpy)
          integer    nobs, iprint, npad, ifscal, nf, iswver, nm, ldcpm,     &
     &           ldcsm, m(*)
          real       xcntr, ycntr, tint, x(*), y(*), f(*), cpm(ldcpm,10),   &
     &           csm(ldcsm,*), wfftc(*), cpy(*)
          complex    cx(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine csswp (n, sx, sy, cpreal, cpimag, nf, f,iswver, m, cospec, quadra, crampl, phase, cohere)
          integer    n, nf, iswver, m
          real       sx(*), sy(*), cpreal(*), cpimag(*), f(*), cospec(*),   &
     &           quadra(*), crampl(*), phase(*), cohere(*)
        end subroutine
      end interface

      interface
        subroutine cswed (nobs, x, y, iprint, xcntr, ycntr,npad, ifscal, nf, f, tint, nwt, wt, cpm, ldcpm, csm,ldcsm)
          integer    nobs, iprint, npad, ifscal, nf, nwt, ldcpm, ldcsm
          real       xcntr, ycntr, tint, x(*), y(*), f(*), wt(*), cpm(*),   &
     &           csm(*)
        end subroutine
      end interface

      interface
        subroutine c2wed (nobs, x, y, iprint, xcntr, ycntr,npad, ifscal, nf, f, tint, nwt, wt, cpm, ldcpm, csm,ldcsm, cx, coef, wfftc, cpy)
          integer    nobs, iprint, npad, ifscal, nf, nwt, ldcpm, ldcsm
          real       xcntr, ycntr, tint, x(*), y(*), f(*), wt(*),           &
     &           cpm(ldcpm,*), csm(ldcsm,*), wfftc(*), cpy(*)
          complex    cx(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine cswep (n, sx, sy, cpreal, cpimag, nf, f,nwt, wt, cospec, quadra, crampl, phase, cohere)
          integer    n, nf, nwt
          real       sx(*), sy(*), cpreal(*), cpimag(*), f(*), wt(*),       &
     &           cospec(*), quadra(*), crampl(*), phase(*), cohere(*)
        end subroutine
      end interface

!
!     Chapter 9:  Covariance Structures and Factor Analysis
!

      interface
        subroutine princ (ndf, nvar, cov, ldcov, icov, eval,pct, std, evec, ldevec, a, lda)
          integer    ndf, nvar, ldcov, icov, ldevec, lda
          real       cov(ldcov,*), eval(*), pct(*), std(*),                 &
     &           evec(ldevec,*), a(lda,*)
        end subroutine
      end interface

      interface
        subroutine kprin (nvar, nmat, cov, ldcov, ani, imeth,evec, ldevec)
          integer    nvar, nmat, ldcov, imeth, ldevec
          real       cov(*), ani(*), evec(*)
        end subroutine
      end interface

      interface
        subroutine k2rin (nvar, nmat, cov, ldcov, ani, imeth,evec, ldevec, h, aux, bold, g, t)
          integer    nvar, nmat, ldcov, imeth, ldevec
          real       cov(ldcov,ldcov,*), ani(*), evec(ldevec,*),            &
     &           h(nvar,nvar,*), aux(nvar,*), bold(*), g(*), t(*)
        end subroutine
      end interface

      interface
        subroutine factr (nvar, cov, ldcov, nf, imth, ndf,init, maxit, maxstp, eps, epse, iprint, uniq, a, lda,eval, stat, der)
          integer    nvar, ldcov, nf, imth, ndf, init, maxit, maxstp,       &
     &           iprint, lda
          real       eps, epse, cov(*), uniq(*), a(*), eval(*), stat(*),    &
     &           der(*)
        end subroutine
      end interface

      interface
        subroutine f2ctr (nvar, cov, ldcov, nf, imth, ndf,init, maxit, maxstp, eps, epse, iprint, uniq, a, lda,eval, stat, der, is, covi, wk, old, evec, hess)
          integer    nvar, ldcov, nf, imth, ndf, init, maxit, maxstp,       &
     &           iprint, lda, is(*)
          real       eps, epse, cov(ldcov,*), uniq(*), a(lda,*), eval(*),   &
     &           stat(*), der(*), covi(nvar,*), wk(*), old(*),          &
     &           evec(nvar,*), hess(nvar,*)
        end subroutine
      end interface

      interface
        subroutine frota (nvar, nf, a, lda, norm, maxit, w,eps, b, ldb, t, ldt)
          integer    nvar, nf, lda, norm, maxit, ldb, ldt
          real       w, eps, a(*), b(*), t(*)
        end subroutine
      end interface

      interface
        subroutine f2ota (nvar, nf, a, lda, norm, maxit, w,eps, b, ldb, t, ldt, work)
          integer    nvar, nf, lda, norm, maxit, ldb, ldt
          real       w, eps, a(lda,*), b(ldb,*), t(ldt,*), work(*)
        end subroutine
      end interface

      interface
        subroutine fopcs (nvar, nf, a, lda, x, ldx, b, ldb,t, ldt)
          integer    nvar, nf, lda, ldx, ldb, ldt
          real       a(*), x(*), b(*), t(*)
        end subroutine
      end interface

      interface
        subroutine f2pcs (nvar, nf, a, lda, x, ldx, b, ldb,t, ldt, wk, s)
          integer    nvar, nf, lda, ldx, ldb, ldt
          real       a(lda,*), x(ldx,*), b(ldb,*), t(ldt,*), wk(*), s(*)
        end subroutine
      end interface

      interface
        subroutine fdobl (nvar, nf, a, lda, norm, w, maxit,eps, b, ldb, t, ldt, fcor, ldfcor)
          integer    nvar, nf, lda, norm, maxit, ldb, ldt, ldfcor
          real       w, eps, a(*), b(*), t(*), fcor(*)
        end subroutine
      end interface

      interface
        subroutine f2obl (nvar, nf, a, lda, norm, w, maxit,eps, b, ldb, t, ldt, fcor, ldfcor, wk1, wk2, wk3)
          integer    nvar, nf, lda, norm, maxit, ldb, ldt, ldfcor
          real       w, eps, a(lda,*), b(ldb,*), t(ldt,*), fcor(ldfcor,*),  &
     &           wk1(*), wk2(*), wk3(*)
        end subroutine
      end interface

      interface
        subroutine fprmx (nvar, nf, a, lda, imth, norm, w,maxit, eps, f, x, ldx, b, ldb, t, ldt, fcor, ldfcor)
          integer    nvar, nf, lda, imth, norm, maxit, ldx, ldb, ldt,       &
     &           ldfcor
          real       w, eps, a(*), f(*), x(*), b(*), t(*), fcor(*)
        end subroutine
      end interface

      interface
        subroutine f2rmx (nvar, nf, a, lda, imth, norm, w,maxit, eps, f, x, ldx, b, ldb, t, ldt, fcor, ldfcor,qr, qraux, ipvt, work)
          integer    nvar, nf, lda, imth, norm, maxit, ldx, ldb, ldt,       &
     &           ldfcor, ipvt(*)
          real       w, eps, a(lda,*), f(*), x(ldx,*), b(ldb,*), t(ldt,*),  &
     &           fcor(ldfcor,*), qr(nvar,*), qraux(*), work(*)
        end subroutine
      end interface

      interface
        subroutine fharr (nvar, nf, a, lda, norm, maxit, w,c, eps, scale, b, ldb, t, ldt, fcor, ldfcor)
          integer    nvar, nf, lda, norm, maxit, ldb, ldt, ldfcor
          real       w, c, eps, a(*), scale(*), b(*), t(*), fcor(*)
        end subroutine
      end interface

      interface
        subroutine f2arr (nvar, nf, a, lda, norm, maxit, w,c, eps, scale, b, ldb, t, ldt, fcor, ldfcor, wk1, wk2)
          integer    nvar, nf, lda, norm, maxit, ldb, ldt, ldfcor
          real       w, c, eps, a(lda,*), scale(*), b(ldb,*), t(ldt,*),     &
     &           fcor(ldfcor,*), wk1(*), wk2(*)
        end subroutine
      end interface

      interface
        subroutine fgcrf (nvar, nf, a, lda, norm, w, maxit,eps, b, ldb, t, ldt, fcor, ldfcor)
          integer    nvar, nf, lda, norm, maxit, ldb, ldt, ldfcor
          real       eps, a(*), w(*), b(*), t(*), fcor(*)
        end subroutine
      end interface

      interface
        subroutine f2crf (nvar, nf, a, lda, norm, w, maxit,eps, b, ldb, t, ldt, fcor, ldfcor, wk1, wk2, wk3)
          integer    nvar, nf, lda, norm, maxit, ldb, ldt, ldfcor
          real       eps, a(lda,*), w(*), b(ldb,*), t(ldt,*),               &
     &           fcor(ldfcor,*), wk1(*), wk2(nvar,*), wk3(nf,*)
        end subroutine
      end interface

      interface
        subroutine fimag (nf, t, ldt, ti, ldti)
          integer    nf, ldt, ldti
          real       t(*), ti(*)
        end subroutine
      end interface

      interface
        subroutine f2mag (nf, t, ldt, ti, ldti, rwk, iwk)
          integer    nf, ldt, ldti, iwk(*)
          real       t(ldt,*), ti(ldti,*), rwk(*)
        end subroutine
      end interface

      interface
        subroutine frvar (nvar, nf, a, lda, t, ldt, var, s,lds, fvar)
          integer    nvar, nf, lda, ldt, lds
          real       a(lda,*), t(ldt,*), var(*), s(lds,*), fvar(*)
        end subroutine
      end interface

      interface
        subroutine f2var (nvar, nf, a, lda, t, ldt, var, s,lds, fvar, tinv, wkinv, iwkinv)
          integer    nvar, nf, lda, ldt, lds, iwkinv(*)
          real       a(lda,*), t(ldt,*), var(*), s(lds,*), fvar(*),         &
     &           tinv(ldt,*), wkinv(*)
        end subroutine
      end interface

      interface
        subroutine fcoef (nvar, nf, a, lda, imth, cov, ldcov,t, ldt, scoef, ldscoe)
          integer    nvar, nf, lda, imth, ldcov, ldt, ldscoe
          real       a(*), cov(*), t(*), scoef(*)
        end subroutine
      end interface

      interface
        subroutine f2oef (nvar, nf, a, lda, imth, cov, ldcov,t, ldt, scoef, ldscoe, b, rwk1, s, uniq, rwk2)
          integer    nvar, nf, lda, imth, ldcov, ldt, ldscoe
          real       a(lda,*), cov(ldcov,*), t(ldt,*), scoef(ldscoe,*),     &
     &           b(*), rwk1(*), s(*), uniq(*), rwk2(*)
        end subroutine
      end interface

      interface
        subroutine fscor (nvar, nf, scoef, ldscoe, nobs, x,ldx, xbar, std, scor, ldscor)
          integer    nvar, nf, ldscoe, nobs, ldx, ldscor
          real       scoef(ldscoe,*), x(ldx,*), xbar(*), std(*),            &
     &           scor(ldscor,*)
        end subroutine
      end interface

      interface
        subroutine f2cor (nvar, nf, scoef, ldscoe, nobs, x,ldx, xbar, std, scor, ldscor, wk)
          integer    nvar, nf, ldscoe, nobs, ldx, ldscor
          real       scoef(ldscoe,*), x(ldx,*), xbar(*), std(*),            &
     &           scor(ldscor,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine fresi (nvar, cov, ldcov, nf, a, lda, y,resid, ldresi)
          integer    nvar, ldcov, nf, lda, ldresi
          real       cov(ldcov,*), a(lda,*), y(*), resid(ldresi,*)
        end subroutine
      end interface

      interface
        subroutine mvind (ndf, nvar, cov, ldcov, ngroup,nvset, stat)
          integer    ndf, nvar, ldcov, ngroup, nvset(*)
          real       cov(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine m2ind (ndf, nvar, cov, ldcov, ngroup,nvset, stat, fac, wk, ipvt)
          integer    ndf, nvar, ldcov, ngroup, nvset(*), ipvt(*)
          real       cov(ldcov,*), stat(*), fac(nvar,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine cancr (nobs, nvar1, nvar2, ncol, x, ldx,ifrq, iwt, ind1, ind2, tol, iprint, xx, ldxx, corr,ldcorr, coef1, ldcof1, coef2, ldcof2, coefr1, ldcfr1,coefr2, ldcfr2, stat, ldstat)
          integer    nobs, nvar1, nvar2, ncol, ldx, ifrq, iwt, iprint,      &
     &           ldxx, ldcorr, ldcof1, ldcof2, ldcfr1, ldcfr2, ldstat,  &
     &           ind1(*), ind2(*)
          real       tol, x(*), xx(*), corr(*), coef1(*), coef2(*),         &
     &           coefr1(*), coefr2(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine c2ncr (nobs, nvar1, nvar2, ncol, x, ldx,ifrq, iwt, ind1, ind2, tol, iprint, xx, ldxx, corr,ldcorr, coef1, ldcof1, coef2, ldcof2, coefr1, ldcfr1,coefr2, ldcfr2, stat, ldstat, r, s, ind, work, wka, wk)
          integer    nobs, nvar1, nvar2, ncol, ldx, ifrq, iwt, iprint,      &
     &           ldxx, ldcorr, ldcof1, ldcof2, ldcfr1, ldcfr2, ldstat,  &
     &           ind1(*), ind2(*), ind(*)
          real       tol, x(ldx,*), xx(ldxx,*), corr(ldcorr,*),             &
     &           coef1(ldcof1,*), coef2(ldcof2,*), coefr1(ldcfr1,*),    &
     &           coefr2(ldcfr2,*), stat(ldstat,*), r(*), s(*),          &
     &           work(*), wka(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine canvc (ndf, nvar1, nvar2, cov, ldcov,ind1, ind2, iprint, corr, ldcorr, coef1, ldcof1, coef2,ldcof2, coefr1, ldcfr1, coefr2, ldcfr2)
          integer    ndf, nvar1, nvar2, ldcov, iprint, ldcorr, ldcof1,      &
     &           ldcof2, ldcfr1, ldcfr2, ind1(*), ind2(*)
          real       cov(*), corr(*), coef1(*), coef2(*), coefr1(*),        &
     &           coefr2(*)
        end subroutine
      end interface

      interface
        subroutine c2nvc (ndf, nvar1, nvar2, cov, ldcov,ind1, ind2, iprint, corr, ldcorr, coef1, ldcof1, coef2,ldcof2, coefr1, ldcfr1, coefr2, ldcfr2, r, s, std1,std2, wka, wk)
          integer    ndf, nvar1, nvar2, ldcov, iprint, ldcorr, ldcof1,      &
     &           ldcof2, ldcfr1, ldcfr2, ind1(*), ind2(*)
          real       cov(*), corr(*), coef1(*), coef2(*), coefr1(*),        &
     &           coefr2(*), r(*), s(*), std1(*), std2(*), wka(*), wk(*)
        end subroutine
      end interface

!
!     Chapter 10:  Discriminant Analysis
!

      interface
        subroutine dscrm (ido, nrow, nvar, ncol, x, ldx, ind,ifrq, iwt, igrp, ngroup, imth, iprint, prior, ni,xmean, ldxmea, cov, ldcov, coef, ldcoef, iclass, prob,ldprob, class, ldclas, d2, ldd2, stat, nrmiss)
          integer    ido, nrow, nvar, ncol, ldx, ifrq, iwt, igrp, ngroup,   &
     &           imth, iprint, ldxmea, ldcov, ldcoef, ldprob, ldclas,   &
     &           ldd2, nrmiss, ind(*), ni(*), iclass(*)
          real       x(ldx,*), prior(*), xmean(ldxmea,*),                   &
     &           cov(ldcov,ldcov,*), coef(ldcoef,*), prob(ldprob,*),    &
     &           class(ldclas,*), d2(ldd2,*), stat(*)
        end subroutine
      end interface

      interface
        subroutine d2crm (ido, nrow, nvar, ncol, x, ldx, ind,ifrq, iwt, igrp, ngroup, imth, iprint, prior, ni,xmean, ldxmea, cov, ldcov, coef, ldcoef, iclass, prob,ldprob, class, ldclas, d2, ldd2, stat, nrmiss, d, ob,ob1)
          integer    ido, nrow, nvar, ncol, ldx, ifrq, iwt, igrp, ngroup,   &
     &           imth, iprint, ldxmea, ldcov, ldcoef, ldprob, ldclas,   &
     &           ldd2, nrmiss, ind(*), ni(*), iclass(*)
          real       x(ldx,*), prior(*), xmean(ldxmea,*),                   &
     &           cov(ldcov,ldcov,*), coef(ldcoef,*), prob(ldprob,*),    &
     &           class(ldclas,*), d2(ldd2,*), stat(*), d(nvar,*),       &
     &           ob(*), ob1(*)
        end subroutine
      end interface

      interface
        subroutine dmscr (ngroup, nvar, xmean, ldxmea, sumwt,cov, ldcov, nnv, eval, coef, ldcoef, cmean, ldcmea)
          integer    ngroup, nvar, ldxmea, ldcov, nnv, ldcoef, ldcmea
          real       xmean(*), sumwt(*), cov(*), eval(*), coef(*), cmean(*)
        end subroutine
      end interface

      interface
        subroutine d2scr (ngroup, nvar, xmean, ldxmea, sumwt,cov, ldcov, nnv, eval, coef, ldcoef, cmean, ldcmea,bcov, eval2, evec, wkr, wk)
          integer    ngroup, nvar, ldxmea, ldcov, nnv, ldcoef, ldcmea
          real       xmean(ldxmea,*), sumwt(*), cov(ldcov,*), eval(*),      &
     &           coef(ldcoef,*), cmean(ldcmea,*), bcov(nvar,*),         &
     &           eval2(*), evec(nvar,*), wkr(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine nnbrd (nrow, nvar, ncol, x, ldx, k, ind,igrp, ngroup, nrule, nclass, metric, prior, thresh,part, idiscr, ni, iclass, prob, ldprob, class, ldclas)
          integer    nrow, nvar, ncol, ldx, k, igrp, ngroup, nrule,         &
     &           nclass, metric, ldprob, ldclas, ind(*), idiscr(*),     &
     &           ni(*), iclass(*)
          real       thresh, x(*), prior(*), part(*), prob(*), class(*)
        end subroutine
      end interface

      interface
        subroutine n2brd (nrow, nvar, ncol, x, ldx, k, ind,igrp, ngroup, nrule, nclass, metric, prior, thresh,part, idiscr, ni, iclass, prob, ldprob, class, ldclas,wk, iwk, ilow, ihigh, iside, bndl, bndh, xkey, ipqr,pqd)
          integer    nrow, nvar, ncol, ldx, k, igrp, ngroup, nrule,         &
     &           nclass, metric, ldprob, ldclas, ind(*), idiscr(*),     &
     &           ni(*), iclass(*), iwk(*), ilow(*), ihigh(*),           &
     &           iside(*), ipqr(*)
          real       thresh, x(ldx,*), prior(*), part(*), prob(ldprob,*),   &
     &           class(ldclas,*), wk(*), bndl(nvar,*), bndh(nvar,*),    &
     &           xkey(*), pqd(*)
        end subroutine
      end interface

!
!     Chapter 11:  Cluster Analysis
!

      interface
        subroutine cdist (nrow, ncol, x, ldx, ndstm, ind,imeth, irow, iscale, dist, lddist)
          integer    nrow, ncol, ldx, ndstm, imeth, irow, iscale, lddist,   &
     &           ind(*)
          real       x(*), dist(*)
        end subroutine
      end interface

      interface
        subroutine c2ist (nrow, ncol, x, ldx, ndstm, ind,imeth, irow, iscale, dist, lddist, x1, x2, scale, wk,ind1)
          integer    nrow, ncol, ldx, ndstm, imeth, irow, iscale, lddist,   &
     &           ind(*), ind1(*)
          real       x(ldx,*), dist(lddist,*), x1(*), x2(*), scale(*),      &
     &           wk(ndstm,*)
        end subroutine
      end interface

      interface
        subroutine clink (npt, imeth, idist, dist, lddist,clevel, iclson, icrson)
          integer    npt, imeth, idist, lddist, iclson(*), icrson(*)
          real       dist(*), clevel(*)
        end subroutine
      end interface

      interface
        subroutine c2ink (npt, imeth, idist, dist, lddist,clevel, iclson, icrson, iptr, iclus, cwt, csum)
          integer    npt, imeth, idist, lddist, iclson(*), icrson(*),       &
     &           iptr(*), iclus(*)
          real       dist(lddist,*), clevel(*), cwt(*), csum(*)
        end subroutine
      end interface

      interface
        subroutine kmean (nobs, ncol, nvar, x, ldx, ifrq,iwt, ind, k, maxit, cm, ldcm, swt, ldswt, ic, nc, wss)
          integer    nobs, ncol, nvar, ldx, ifrq, iwt, k, maxit, ldcm,      &
     &           ldswt, ind(*), ic(*), nc(*)
          real       x(*), cm(*), swt(*), wss(*)
        end subroutine
      end interface

      interface
        subroutine k2ean (nobs, ncol, nvar, x, ldx, ifrq,iwt, ind, k, maxit, cm, ldcm, swt, ldswt, ic1, nc, wss,ic2, ncp, d, itran, live)
          integer    nobs, ncol, nvar, ldx, ifrq, iwt, k, maxit, ldcm,      &
     &           ldswt, ind(*), ic1(*), nc(*), ic2(*), ncp(*),          &
     &           itran(*), live(*)
          real       x(ldx,*), cm(ldcm,*), swt(ldswt,*), wss(*), d(*)
        end subroutine
      end interface

!
!     Chapter 12:  Sampling
!

      interface
        subroutine smppr (nint, nsamp, npop, conper, stat)
          integer    nint, nsamp, npop
          real       conper, stat(*)
        end subroutine
      end interface

      interface
        subroutine smpps (nstrat, nints, nsamps, npops,conper, propor, stat)
          integer    nstrat, nints(*), nsamps(*), npops(*)
          real       conper, propor(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine smprr (ido, nrow, x, y, npop, iopt, xmean,r1oef, conper, stat)
          integer    ido, nrow, npop, iopt
          real       xmean, r1oef, conper, x(*), y(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine smprs (ido, nstrat, nrows, x, y, npops,iopt, itopt, xmeans, conper, coefs, xbars, xvars, xcvs,ybars, yvars, ycvs, xycovs, nsamps, stat)
          integer    ido, nstrat, iopt, itopt, nrows(*), npops(*),          &
     &           nsamps(*)
          real       conper, x(*), y(*), xmeans(*), coefs(*), xbars(*),     &
     &           xvars(*), xcvs(*), ybars(*), yvars(*), ycvs(*),        &
     &           xycovs(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine smpsc (ido, nclstr, nrows, y, iopt,nclpop, npop, size, tsize, conper, clmean, clvar,nsamps, stat)
          integer    ido, nclstr, iopt, nclpop, npop, nrows(*), nsamps(*)
          real       tsize, conper, y(*), size(*), clmean(*), clvar(*),     &
     &           stat(*)
        end subroutine
      end interface

      interface
        subroutine smpsr (ido, nrow, y, npop, iopt, nsampo,conper, stat)
          integer    ido, nrow, npop, iopt, nsampo
          real       conper, y(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine smpss (ido, nstrat, nrows, y, npops,ivopt, conper, ybars, yvars, nsamps, stat)
          integer    ido, nstrat, ivopt, nrows(*), npops(*), nsamps(*)
          real       conper, y(*), ybars(*), yvars(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine smpst (ido, nunsam, nelsam, nobs, y,nunpop, nelpop, conper, pumean, puvar, stat)
          integer    ido, nunsam, nelsam, nobs, nunpop, nelpop
          real       conper, y(*), pumean(*), puvar(*), stat(*)
        end subroutine
      end interface

!
!     Chapter 13:  Survival Analysis, Life Testing and Reliability
!

      interface
        subroutine kapmr (nobs, ncol, x, ldx, irt, ifrq,icen, igrp, isrt, sprob, ldspro, nrmiss)
          integer    nobs, ncol, ldx, irt, ifrq, icen, igrp, isrt, ldspro,  &
     &           nrmiss
          real       x(ldx,*), sprob(ldspro,2)
        end subroutine
      end interface

      interface
        subroutine k2pmr (nobs, ncol, x, ldx, irt, ifrq,icen, igrp, isrt, sprob, ldspro, nrmiss, igp, iperm,inddr, iwk, wk, iper)
          integer    nobs, ncol, ldx, irt, ifrq, icen, igrp, isrt, ldspro,  &
     &           nrmiss, igp(*), iperm(*), inddr(*), iwk(*), iper(*)
          real       x(ldx,*), sprob(ldspro,2), wk(*)
        end subroutine
      end interface

      interface
        subroutine ktble (nobs, ncol, x, ldx, irt, ifrq,icen, igrp, isrt, sprob, ldspro)
          integer    nobs, ncol, ldx, irt, ifrq, icen, igrp, isrt, ldspro
          real       x(*), sprob(*)
        end subroutine
      end interface

      interface
        subroutine k2ble (nobs, ncol, x, ldx, irt, ifrq,icen, igrp, isrt, sprob, ldspro, algl, iperm, inddr,wk, wk1, iwk)
          integer    nobs, ncol, ldx, irt, ifrq, icen, igrp, isrt, ldspro,  &
     &           iperm(*), inddr(*), iwk(*)
          real       x(ldx,*), sprob(ldspro,*), algl(*), wk(*), wk1(*)
        end subroutine
      end interface

      interface
        subroutine trnbl (nobs, ncol, x, ldx, ilt, irt, ifrq,icen, maxit, eps, iprint, nintvl, sprob, ldspro, algl,nrmiss)
          integer    nobs, ncol, ldx, ilt, irt, ifrq, icen, maxit, iprint,  &
     &           nintvl, ldspro, nrmiss
          real       eps, algl, x(*), sprob(*)
        end subroutine
      end interface

      interface
        subroutine t2nbl (nobs, ncol, x, ldx, ilt, irt, ifrq,icen, maxit, eps, iprint, nintvl, sprob, ldspro, algl,nrmiss, wk, iperm, inddr, wwk, iwk)
          integer    nobs, ncol, ldx, ilt, irt, ifrq, icen, maxit, iprint,  &
     &           nintvl, ldspro, nrmiss, iperm(*), inddr(*), iwk(*)
          real       eps, algl, x(ldx,*), sprob(ldspro,*), wk(nobs,*),      &
     &           wwk(*)
        end subroutine
      end interface

      interface
        subroutine phglm (nrow, ncol, x, ldx, irt, ifrq,ifix, icen, istrat, maxit, eps, ratio, nclvar, indcl,nef, nvef, indef, init, itie, iprint, maxcl, nclval,clval, ncoef, coef, ldcoef, algl, cov, ldcov, xmean,case, ldcase, gr, igrp, nrmiss)
          integer    nrow, ncol, ldx, irt, ifrq, ifix, icen, istrat,        &
     &           maxit, nclvar, nef, init, itie, iprint, maxcl, ncoef,  &
     &           ldcoef, ldcov, ldcase, nrmiss, indcl(*), nvef(*),      &
     &           indef(*), nclval(*), igrp(*)
          real       eps, ratio, algl, x(*), clval(*), coef(*), cov(*),     &
     &           xmean(*), case(*), gr(*)
        end subroutine
      end interface

      interface
        subroutine p2glm (nrow, ncol, x, ldx, irt, ifrq,ifix, icen, istrat, maxit, eps, ratio, nclvar, indcl,nef, nvef, indef, init, itie, iprint, maxcl, nclval,clval, ncoef, coef, ldcoef, algl, cov, ldcov, xmean,case, ldcase, gr, igrp, nrmiss, obs, smg, smh, iptr,idt, iwk)
          integer    nrow, ncol, ldx, irt, ifrq, ifix, icen, istrat,        &
     &           maxit, nclvar, nef, init, itie, iprint, maxcl, ncoef,  &
     &           ldcoef, ldcov, ldcase, nrmiss, indcl(*), nvef(*),      &
     &           indef(*), nclval(*), igrp(*), iptr(*), idt(*), iwk(*)
          real       eps, ratio, algl, x(*), clval(*), coef(*), cov(*),     &
     &           xmean(*), case(*), gr(*), obs(*), smg(*), smh(*)
        end subroutine
      end interface

      interface
        subroutine svglm (nobs, ncol, x, ldx, model, ilt,irt, ifrq, ifix, icen, infin, maxit, eps, intcep,nclvar, indcl, nef, nvef, indef, init, iprint, maxcl,nclval, clval, ncoef, coef, ldcoef, algl, cov, ldcov,xmean, case, ldcase, gr, iadd, nrmiss)
          integer    nobs, ncol, ldx, model, ilt, irt, ifrq, ifix, icen,    &
     &           infin, maxit, intcep, nclvar, nef, init, iprint,       &
     &           maxcl, ncoef, ldcoef, ldcov, ldcase, nrmiss,           &
     &           indcl(*), nvef(*), indef(*), nclval(*), iadd(*)
          real       eps, algl, x(*), clval(*), coef(*), cov(*), xmean(*),  &
     &           case(*), gr(*)
        end subroutine
      end interface

      interface
        subroutine s2glm (nobs, ncol, x, ldx, model, ilt,irt, ifrq, ifix, icen, infin, maxit, eps, intcep,nclvar, indcl, nef, nvef, indef, init, iprint, maxcl,nclval, clval, ncoef, coef, ldcoef, algl, cov, ldcov,xmean, case, ldcase, gr, iadd, nrmiss, nmax, obs, add,xd, wk, kbasis, rwk, iwk)
          integer    nobs, ncol, ldx, model, ilt, irt, ifrq, ifix, icen,    &
     &           infin, maxit, intcep, nclvar, nef, init, iprint,       &
     &           maxcl, ncoef, ldcoef, ldcov, ldcase, nrmiss, nmax,     &
     &           indcl(*), nvef(*), indef(*), nclval(*), iadd(*),       &
     &           kbasis(*), iwk(*)
          real       eps, algl, x(*), clval(*), coef(ldcoef,*),             &
     &           cov(ldcov,*), xmean(*), case(ldcase,*), gr(*),         &
     &           obs(*), xd(*), wk(*), rwk(*)
          logical    add(*)
        end subroutine
      end interface

      interface
        subroutine stble (nrow, ncol, xpt, ldxpt, model,time, npt, delta, ifix, intcep, nclvar, indcl, nclval,clval, nef, nvef, indef, ncoef, coef, iprint, sprob,ldspro, xbeta)
          integer    nrow, ncol, ldxpt, model, npt, ifix, intcep, nclvar,   &
     &           nef, ncoef, iprint, ldspro, indcl(*), nclval(*),       &
     &           nvef(*), indef(*)
          real       time, delta, xpt(*), clval(*), coef(*), sprob(*),      &
     &           xbeta(*)
        end subroutine
      end interface

      interface
        subroutine s2ble (nrow, ncol, xpt, ldxpt, model,time, npt, delta, ifix, intcep, nclvar, indcl, nclval,clval, nef, nvef, indef, ncoef, coef, iprint, sprob,ldspro, xbeta, chwk, obs, vector)
          integer    nrow, ncol, ldxpt, model, npt, ifix, intcep, nclvar,   &
     &           nef, ncoef, iprint, ldspro, indcl(*), nclval(*),       &
     &           nvef(*), indef(*)
          real       time, delta, xpt(ldxpt,*), clval(*), coef(*),          &
     &           sprob(ldspro,*), xbeta(*), obs(*), vector(1,*)
          character  chwk(*)*10
        end subroutine
      end interface

      interface
        subroutine actbl (imth, n, npop, age, a, ipop, idth,iprint, table, ldtabl)
          integer    imth, n, npop, iprint, ldtabl, ipop(*), idth(*)
          real       age(*), a(*), table(ldtabl,*)
        end subroutine
      end interface

!
!     Chapter 14:  Multidimensional Scaling
!

      interface
        subroutine msidv (nstim, nsub, x, icnvt, model,istrs, itrans, ndim, iprint, dist, cfl, ldcfl, w, ldw,a, b, wt, strs, strss, resid)
          integer    nstim, nsub, icnvt, model, istrs, itrans, ndim,        &
     &           iprint, ldcfl, ldw
          real       strss, x(*), dist(*), cfl(*), w(*), a(*), b(*),        &
     &           wt(*), strs(*), resid(*)
        end subroutine
      end interface

      interface
        subroutine m2idv (nstim, nsub, x, icnvt, model,istrs, itrans, ndim, iprint, dist, cfl, ldcfl, w, ldw,a, b, wt, strs, strss, resid, wk1, wk2, wk3, wk4, wk5,wk6, wk7, iwk8, wk10, wk11, wk12, wk13, id, wkder,dwkhes, dwkgra, wkddp, ncom, disp)
          integer    nstim, nsub, icnvt, model, istrs, itrans, ndim,        &
     &           iprint, ldcfl, ldw, iwk8, id(*), ncom(*)
          real       strss, x(*), dist(*), cfl(*), w(*), a(*), b(*),        &
     &           wt(*), strs(*), resid(*), wk1(*), wk2(*), wk3(*),      &
     &           wk4(*), wk5(*), wk6(*), wk7(*), wk10(*), wk11(*),      &
     &           wk12(*), wk13(*), wkder(*), wkddp(*), disp(*)
          double precision dwkhes(*), dwkgra(*)
        end subroutine
      end interface

      interface
        subroutine msdst (nstim, ndim, cfl, ldcfl, nsub,imod, iform, itrans, w, ldw, ws, ldws, dist)
          integer    nstim, ndim, ldcfl, nsub, iform, itrans, ldw, ldws,    &
     &           imod(3)
          real       cfl(ldcfl,*), w(ldw,*), ws(ldws,*), dist(*)
        end subroutine
      end interface

      interface
        subroutine msstn (nrow, ncol, nsub, iform, x, ldx,icnvt, istrat, iscale, ncom, xout)
          integer    nrow, ncol, nsub, iform, ldx, icnvt, istrat, iscale,   &
     &           ncom(*)
          real       x(*), xout(*)
        end subroutine
      end interface

      interface
        subroutine m2stn (nrow, ncol, nsub, iform, x, ldx,icnvt, istrat, iscale, ncom, xout, nstim, xx, xmis)
          integer    nrow, ncol, nsub, iform, ldx, icnvt, istrat, iscale,   &
     &           nstim, ncom(*)
          real       x(ldx,*), xout(*), xx(nstim,*), xmis(nstim,*)
        end subroutine
      end interface

      interface
        subroutine msdbl (nstim, nsub, iform, x, ldx, iscale,disp, lddisp, p, ldp, ds, ldds)
          integer    nstim, nsub, iform, ldx, iscale, lddisp, ldp, ldds
          real       x(ldx,*), disp(lddisp,lddisp,*), p(ldp,ldp,*),         &
     &           ds(ldds,*)
        end subroutine
      end interface

      interface
        subroutine msini (nstim, nsub, iform, x, ldx, imod,ndim, cfl, ldcfl, w, ldw, ws, ldws, wmin, wsmin)
          integer    nstim, nsub, iform, ldx, ndim, ldcfl, ldw, ldws,       &
     &           imod(*)
          real       wmin, wsmin, x(*), cfl(*), w(*), ws(*)
        end subroutine
      end interface

      interface
        subroutine m2ini (nstim, nsub, iform, x, ldx, imod,ndim, cfl, ldcfl, w, ldw, ws, ldws, wmin, wsmin, tr,xx, disp, ds, ewk1, ewk2, iewk, c)
          integer    nstim, nsub, iform, ldx, ndim, ldcfl, ldw, ldws,       &
     &           imod(*), iewk(*)
          real       wmin, wsmin, x(ldx,*), cfl(ldcfl,*), w(ldw,*),         &
     &           ws(ldws,*), tr(*), xx(*), disp(nstim,nstim,*),         &
     &           ds(nstim,*), ewk1(*), ewk2(*), c(ndim,ndim,*)
        end subroutine
      end interface

      interface
        subroutine mstrs (n, dist, disp, intcep, a, islope,b, power, istrs, strss, wt)
          integer    n, intcep, islope, istrs
          real       a, b, power, strss, wt, dist(*), disp(*)
        end subroutine
      end interface

!
!     Chapter 15:  Density and Hazard Estimation
!

      interface
        subroutine despl (nobs, x, node, bnds, init, alpha,maxit, eps, dens, stat, nmiss)
          integer    nobs, node, init, maxit, nmiss
          real       alpha, eps, x(*), bnds(*), dens(*), stat(*)
        end subroutine
      end interface

      interface
        subroutine d2spl (nobs, x, node, bnds, init, alpha,maxit, eps, dens, stat, nmiss, hess, ldhess, ilohi,denest, b, ipvt, wk2, xwk)
          integer    nobs, node, init, maxit, nmiss, ldhess,                &
     &           ilohi(node,*), ipvt(*)
          real       alpha, eps, x(*), bnds(2), dens(*), stat(*), hess(*),  &
     &           denest(*), b(*), wk2(*), xwk(*)
        end subroutine
      end interface

      interface
        subroutine deskn (xker, nobs, x, window, xmax, nxpt,xpt, dens, nmiss)
          integer    nobs, nxpt, nmiss
          real       xker, window, xmax, x(*), xpt(*), dens(*)
          external   xker
        end subroutine
      end interface

      interface
        subroutine dnfft (nobs, x, freq, bnds, window, ifft,nxpt, coef, dens, nrmiss)
          integer    nobs, ifft, nxpt, nrmiss
          real       window, x(*), freq(*), bnds(*), coef(*), dens(*)
        end subroutine
      end interface

      interface
        subroutine d2fft (nobs, x, freq, bnds, window, ifft,nxpt, coef, dens, nrmiss, wfftr)
          integer    nobs, ifft, nxpt, nrmiss
          real       window, x(*), freq(*), bnds(*), coef(*), dens(*),      &
     &           wfftr(*)
        end subroutine
      end interface

      interface
        subroutine despt (node, xpt, iopt, nord, amesh, dens,denest)
          integer    node, iopt, nord
          real       xpt(*), amesh(*), dens(*), denest(*)
        end subroutine
      end interface

      interface
        subroutine d2spt (node, xpt, iopt, nord, amesh, dens,denest, cf, x, break)
          integer    node, iopt, nord
          real       xpt(*), amesh(*), dens(*), denest(*), cf(4,*), x(*),   &
     &           break(*)
        end subroutine
      end interface

      interface
        subroutine hazrd (nobs, x, ldx, irt, icen, iwto,ngrid, bstart, ginc, kmin, ink, nk, iprint, isort, st,jcen, alpha, beta, k, vml, h, nmiss)
          integer    nobs, ldx, irt, icen, iwto, ngrid, kmin, ink, nk,      &
     &           iprint, isort, k, nmiss, jcen(*)
          real       bstart, ginc, alpha, beta, vml, x(ldx,*), st(*), h(*)
        end subroutine
      end interface

      interface
        subroutine hazez (nobs, x, ldx, irt, icen, iprint,st, jcen, alpha, beta, k, vml, h, nmiss)
          integer    nobs, ldx, irt, icen, iprint, k, nmiss, jcen(*)
          real       alpha, beta, vml, x(ldx,*), st(*), h(*)
        end subroutine
      end interface

      interface
        subroutine hazst (nobs, st, jcen, iwto, ngrid, gstrt,ginc, alpha, beta, k, ihcomp, h, haz)
          integer    nobs, iwto, ngrid, k, ihcomp, jcen(*)
          real       gstrt, ginc, alpha, beta, st(*), h(*), haz(*)
        end subroutine
      end interface

!
!     Chapter 16:  Line Printer Graphics
!

      interface
        subroutine vhstp (nbar, frq, isp, title)
          integer    nbar, isp
          real       frq(*)
          character  title*(*)
        end subroutine
      end interface

      interface
        subroutine vhs2p (nbar, frqx, frqy, isp, title)
          integer    nbar, isp
          real       frqx(*), frqy(*)
          character  title*(*)
        end subroutine
      end interface

      interface
        subroutine v2s2p (nbar, frqx, frqy, isp, title, wk)
          integer    nbar, isp
          real       frqx(*), frqy(*), wk(*)
          character  title*(*)
        end subroutine
      end interface

      interface
        subroutine hhstp (nbar, frq, ibeg, ispace, length,irep, iopt, title)
          integer    nbar, ibeg, ispace, length, irep, iopt
          real       frq(*)
          character  title*(*)
        end subroutine
      end interface

      interface
        subroutine sctp (nobs, nvar, a, lda, icol, range,symbol, xtitle, ytitle, title)
          integer    nobs, nvar, lda, icol(*)
          real       a(lda,*), range(*)
          character  symbol*(*), xtitle*(*), ytitle*(*), title*(*)
        end subroutine
      end interface

      interface
        subroutine boxp (ngroup, ni, x, title)
          integer    ngroup, ni(*)
          real       x(*)
          character  title*(*)
        end subroutine
      end interface

      interface
        subroutine b2xp (ngroup, ni, x, title, xi)
          integer    ngroup, ni(*)
          real       x(*), xi(*)
          character  title*(*)
        end subroutine
      end interface

      interface
        subroutine stmlp (nobs, x, unit, title)
          integer    nobs
          real       unit, x(*)
          character  title*(*)
        end subroutine
      end interface

      interface
        subroutine s2mlp (nobs, x, unit, title, maxwid, iwk,xi)
          integer    nobs, maxwid, iwk(maxwid)
          real       unit, x(*), xi(*)
          character  title*(*)
        end subroutine
      end interface

      interface
        subroutine cdfp (cdf, nobs, x, n12, n95, iprint)
          integer    nobs, n12, n95, iprint
          real       cdf, x(*)
          external   cdf
        end subroutine
      end interface

      interface
        subroutine c2fp (cdf, nobs, x, n12, n95, iprint, wkx,wk)
          integer    nobs, n12, n95, iprint
          real       cdf, x(*), wkx(*), wk(nobs,*)
          external   cdf
        end subroutine
      end interface

      interface
        subroutine cdf2p (nobs1, nobs2, x)
          integer    nobs1, nobs2
          real       x(*)
        end subroutine
      end interface

      interface
        subroutine c2f2p (nobs1, nobs2, x, wk, iwk)
          integer    nobs1, nobs2, iwk(*)
          real       x(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine probp (nobs, n1, n2, x, idist)
          integer    nobs, n1, n2, idist
          real       x(*)
        end subroutine
      end interface

      interface
        subroutine p2obp (nobs, n1, n2, x, idist, m1, m2, wk)
          integer    nobs, n1, n2, idist, m1, m2
          real       x(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine treep (node, iclson, icrson, imeth,clevel, iroot, nscale, nfill, scale, nodenm)
          integer    node, imeth, iroot, nscale, nfill, iclson(*),          &
     &           icrson(*)
          real       clevel(*), scale(2)
          character  nodenm(*)*(*)
        end subroutine
      end interface

      interface
        subroutine t2eep (node, iclson, icrson, imeth,clevel, iroot, nscale, nfill, scale, nodenm, idtree,istree, iotree, intree, tltree)
          integer    node, imeth, iroot, nscale, nfill, iclson(*),          &
     &           icrson(*), idtree(*), istree(*), iotree(*), intree(*)
          real       clevel(*), scale(2), tltree(*)
          character  nodenm(*)*(*)
        end subroutine
      end interface

!
!     Chapter 17:  Probability Distribution Functions and Inverses
!

      interface
        real function csnin (p, df, alam)
          real       p, df, alam
        end function
      end interface

      interface
        real function gamin (p, a)
          real       p, a
        end function
      end interface

      interface
        real function tnin (p, idf, delta)
          integer    idf
          real       p, delta
        end function
      end interface

      interface
        real function gfnin (f, p, eps, guess)
          real       f, p, eps, guess
          external   f
        end function
      end interface

!
!     Chapter 18:  Random Number Generation
!

      interface
        subroutine rnses (table)
          real       table(128)
        end subroutine
      end interface

      interface
        subroutine rnges (table)
          real       table(128)
        end subroutine
      end interface

      interface
        subroutine rngda (nr, iopt, imin, nmass, probs, iwk,wk, ir)
          integer    nr, iopt, imin, nmass, iwk(*), ir(*)
          real       probs(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rngds (prf, iopt, del, nndx, imin, nmass,cumpr, lcumpr)
          integer    iopt, nndx, imin, nmass, lcumpr
          real       prf, del, cumpr(*)
          external   prf
        end subroutine
      end interface

      interface
        subroutine rngdt (nr, imin, nmass, cumpr, ir)
          integer    nr, imin, nmass, ir(*)
          real       cumpr(*)
        end subroutine
      end interface

      interface
        subroutine rnbet (nr, pin, qin, r)
          integer    nr
          real       pin, qin, r(*)
        end subroutine
      end interface

      interface
        subroutine rnchi (nr, df, r)
          integer    nr
          real       df, r(*)
        end subroutine
      end interface

      interface
        subroutine rnchy (nr, r)
          integer    nr
          real       r(*)
        end subroutine
      end interface

      interface
        subroutine rnexp (nr, r)
          integer    nr
          real       r(*)
        end subroutine
      end interface

      interface
        subroutine rnext (nr, theta1, theta2, p, r)
          integer    nr
          real       theta1, theta2, p, r(*)
        end subroutine
      end interface

      interface
        subroutine rngam (nr, a, r)
          integer    nr
          real       a, r(*)
        end subroutine
      end interface

      interface
        subroutine rngcs (cdf, iopt, ndata, table, ldtabl)
          integer    iopt, ndata, ldtabl
          real       cdf, table(ldtabl,*)
          external   cdf
        end subroutine
      end interface

      interface
        subroutine rngct (nr, ndata, table, ldtabl, r)
          integer    nr, ndata, ldtabl
          real       table(ldtabl,*), r(*)
        end subroutine
      end interface

      interface
        subroutine rnlnl (nr, xm, s, r)
          integer    nr
          real       xm, s, r(*)
        end subroutine
      end interface

      interface
        subroutine rnnoa (nr, r)
          integer    nr
          real       r(*)
        end subroutine
      end interface

      interface
        real function rnnof ()
        end function
      end interface

      interface
        subroutine rnnor (nr, r)
          integer    nr
          real       r(*)
        end subroutine
      end interface

      interface
        subroutine rnsta (nr, alpha, bprime, r)
          integer    nr
          real       alpha, bprime, r(*)
        end subroutine
      end interface

      interface
        subroutine rnstt (nr, df, r)
          integer    nr
          real       df, r(*)
        end subroutine
      end interface

      interface
        subroutine rntri (nr, r)
          integer    nr
          real       r(*)
        end subroutine
      end interface

      interface
        subroutine rnvms (nr, c, r)
          integer    nr
          real       c, r(*)
        end subroutine
      end interface

      interface
        subroutine rnwib (nr, a, r)
          integer    nr
          real       a, r(*)
        end subroutine
      end interface

      interface
        subroutine rncor (n, iopt, ev, a, lda, cor, ldcor)
          integer    n, iopt, lda, ldcor
          real       ev(*), a(lda,*), cor(ldcor,*)
        end subroutine
      end interface

      interface
        subroutine r2cor (n, iopt, ev, a, lda, cor, ldcor,iwk, wk)
          integer    n, iopt, lda, ldcor, iwk(n,*)
          real       ev(*), a(lda,*), cor(ldcor,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rndat (ido, nr, k, nsamp, x, ldx, nn, r,ldr)
          integer    ido, nr, k, nsamp, ldx, nn, ldr
          real       x(*), r(*)
        end subroutine
      end interface

      interface
        subroutine r2dat (ido, nr, k, nsamp, x, ldx, nn, r,ldr, iwk, wk)
          integer    ido, nr, k, nsamp, ldx, nn, ldr, iwk(*)
          real       x(ldx,*), r(ldr,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine rnmvn (nr, k, rsig, ldrsig, r, ldr)
          integer    nr, k, ldrsig, ldr
          real       rsig(ldrsig,*), r(ldr,*)
        end subroutine
      end interface

      interface
        subroutine rnsph (nr, k, z, ldz)
          integer    nr, k, ldz
          real       z(ldz,*)
        end subroutine
      end interface

      interface
        subroutine rnnos (ifirst, ilast, n, r)
          integer    ifirst, ilast, n
          real       r(*)
        end subroutine
      end interface

      interface
        subroutine rnuno (ifirst, ilast, n, r)
          integer    ifirst, ilast, n
          real       r(*)
        end subroutine
      end interface

      interface
        subroutine rnarm (nw, const, npar, par, lagar, npma,pma, lagma, iadist, avar, a, wi, w)
          integer    nw, npar, npma, iadist, lagar(*), lagma(*)
          real       const, avar, par(*), pma(*), a(*), wi(*), w(*)
        end subroutine
      end interface

      interface
        subroutine rnnpp (timbeg, timend, ftheta, themin,themax, neub, ne, r)
          integer    neub, ne
          real       timbeg, timend, ftheta, themin, themax, r(*)
          external   ftheta
        end subroutine
      end interface

      interface
        subroutine rnsrs (ido, nrow, nvar, pop, ldpop, nsamp,npop, samp, ldsamp, index)
          integer    ido, nrow, nvar, ldpop, nsamp, npop, ldsamp, index(*)
          real       pop(ldpop,*), samp(ldsamp,*)
        end subroutine
      end interface

!
!     Chapter 19:  Utilities
!

      interface
        subroutine rordm (naa, aa, ldaa, na, indaa, a, lda)
          integer    naa, ldaa, na, lda, indaa(*)
          real       aa(*), a(*)
        end subroutine
      end interface

      interface
        subroutine r2rdm (naa, aa, ldaa, na, indaa, a, lda,iwk)
          integer    naa, ldaa, na, lda, indaa(*), iwk(*)
          real       aa(ldaa,*), a(lda,*)
        end subroutine
      end interface

      interface
        subroutine mvnan (nrow, ncol, iind, ind, x, ldx,iswap, nrmiss)
          integer    nrow, ncol, iind, ldx, nrmiss, ind(*), iswap(*)
          real       x(ldx,*)
        end subroutine
      end interface

      interface
        subroutine scolr (nrx, ncx, x, ldx, icomp, iordr,iret, nkey, indkey, iperm, ngroup, ni)
          integer    nrx, ncx, ldx, icomp, iordr, iret, nkey, ngroup,       &
     &           indkey(*), iperm(*), ni(*)
          real       x(*)
        end subroutine
      end interface

      interface
        subroutine s2olr (nrx, ncx, x, ldx, icomp, iordr,iret, nkey, indkey, iperm, ngroup, ni, wk, iwk)
          integer    nrx, ncx, ldx, icomp, iordr, iret, nkey, ngroup,       &
     &           indkey(*), iperm(*), ni(*), iwk(*)
          real       x(ldx,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine srowr (nrow, ncol, x, ldx, icomp, iordr,iret, nkey, indkey, iperm, ngroup, ni, nrmiss)
          integer    nrow, ncol, ldx, icomp, iordr, iret, nkey, ngroup,     &
     &           nrmiss, indkey(*), iperm(*), ni(*)
          real       x(*)
        end subroutine
      end interface

      interface
        subroutine s2owr (nrow, ncol, x, ldx, icomp, iordr,iret, nkey, indkey, iperm, ngroup, ni, nrmiss, wk, iwk)
          integer    nrow, ncol, ldx, icomp, iordr, iret, nkey, ngroup,     &
     &           nrmiss, indkey(*), iperm(*), ni(*), iwk(*)
          real       x(ldx,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine gdata (idata, iprint, nobs, nvar, x, ldx,ndx)
          integer    idata, iprint, nobs, nvar, ldx, ndx
          real       x(ldx,ndx)
        end subroutine
      end interface

!
!     Chapter 20:  Mathematical Support
!

      interface
        subroutine chfac (n, a, lda, tol, irank, r, ldr)
          integer    n, lda, irank, ldr
          real       tol, a(*), r(*)
        end subroutine
      end interface

      interface
        subroutine mchol (n, a, lda, tol, irank, r, ldr,dmax, ind)
          integer    n, lda, irank, ldr, ind
          real       tol, dmax, a(*), r(*)
        end subroutine
      end interface

      interface
        subroutine girts (n, r, ldr, nb, b, ldb, ipath,irank, x, ldx, rinv, ldrinv)
          integer    n, ldr, nb, ldb, ipath, irank, ldx, ldrinv
          real       r(*), b(*), x(*), rinv(*)
        end subroutine
      end interface

      interface
        real function enos (i, n)
          integer    i, n
        end function
      end interface

      interface
        real function amillr (x)
          real       x
        end function
      end interface

      interface
        subroutine quadt (nrow, nvar, ncol, x, ldx, ind,nbuck, idiscr, part)
          integer    nrow, nvar, ncol, ldx, nbuck, ind(*), idiscr(*)
          real       x(*), part(*)
        end subroutine
      end interface

      interface
        subroutine q2adt (nrow, nvar, ncol, x, ldx, ind,nbuck, idiscr, part, ilow, ihigh, wk, iwk)
          integer    nrow, nvar, ncol, ldx, nbuck, ind(*), idiscr(*),       &
     &           ilow(*), ihigh(*), iwk(*)
          real       x(ldx,*), part(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine nghbr (nvar, xkey, k, nrow, ncol, x, ldx,ind, nbuck, idiscr, part, metric, ipqr, pqd)
          integer    nvar, k, nrow, ncol, ldx, nbuck, metric, ind(*),       &
     &           idiscr(*), ipqr(*)
          real       xkey(*), x(*), part(*), pqd(*)
        end subroutine
      end interface

      interface
        subroutine n2hbr (nvar, xkey, k, nrow, ncol, x, ldx,ind, nbuck, idiscr, part, metric, ipqr, pqd, ilow,ihigh, iside, bndl, bndh)
          integer    k, nrow, nvar, ncol, ldx, metric, nbuck, ind(*),       &
     &           idiscr(*), ipqr(*), ilow(*), ihigh(*), iside(*)
          real       xkey(*), x(ldx,*), part(*), pqd(*), bndl(*), bndh(*)
        end subroutine
      end interface

end module
