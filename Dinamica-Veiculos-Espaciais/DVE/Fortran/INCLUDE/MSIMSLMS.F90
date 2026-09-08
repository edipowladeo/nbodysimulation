!
!     MSIMSLMS.F90 - Declare single-precision MS IMSL MATH/LIBRARY routines
!
!     Copyright (c) 1994 by Visual Numerics, Inc.  All Rights Reserved.
!

module msimslms

!ms$objcomment lib:'maths.lib'

      use msimslc	! IMSL common routines
      use msimslmc	! IMSL common math routines
      use msimslcs	! IMSL common single-precision routines

!
!     Chapter 1:  Linear Systems
!

      interface
        subroutine lsarg (n, a, lda, b, ipath, x)
          integer    n, lda, ipath
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2arg (n, a, lda, b, ipath, x, fac, ipvt,wk)
          integer    n, lda, ipath, ipvt(*)
          real       a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfcrg (n, a, lda, fac, ldfac, ipvt, rcond)
          integer    n, lda, ldfac, ipvt(*)
          real       rcond, a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2crg (n, a, lda, fac, ldfac, ipvt, rcond,z)
          integer    n, lda, ldfac, ipvt(*)
          real       rcond, a(lda,*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lfirg (n, a, lda, fac, ldfac, ipvt, b,ipath, x, res)
          integer    n, lda, ldfac, ipath, ipvt(*)
          real       a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lsacg (n, a, lda, b, ipath, x)
          integer    n, lda, ipath
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2acg (n, a, lda, b, ipath, x, fac, ipvt,wk)
          integer    n, lda, ipath, ipvt(*)
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslcg (n, a, lda, b, ipath, x)
          integer    n, lda, ipath
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lcg (n, a, lda, b, ipath, x, fac, ipvt,wk)
          integer    n, lda, ipath, ipvt(*)
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfccg (n, a, lda, fac, ldfac, ipvt, rcond)
          integer    n, lda, ldfac, ipvt(*)
          real       rcond
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2ccg (n, a, lda, fac, ldfac, ipvt, rcond,z)
          integer    n, lda, ldfac, ipvt(*)
          real       rcond
          complex    a(lda,*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lftcg (n, a, lda, fac, ldfac, ipvt)
          integer    n, lda, ldfac, ipvt(*)
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2tcg (n, a, lda, fac, ldfac, ipvt, scale)
          integer    n, lda, ldfac, ipvt(n)
          complex    a(lda,*), fac(ldfac,*), scale(*)
        end subroutine
      end interface

      interface
        subroutine lfscg (n, fac, ldfac, ipvt, b, ipath, x)
          integer    n, ldfac, ipath, ipvt(*)
          complex    fac(ldfac,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lficg (n, a, lda, fac, ldfac, ipvt, b,ipath, x, res)
          integer    n, lda, ldfac, ipath, ipvt(*)
          complex    a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lfdcg (n, fac, ldfac, ipvt, det1, det2)
          integer    n, ldfac, ipvt(*)
          real       det2
          complex    det1, fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lincg (n, a, lda, ainv, ldainv)
          integer    n, lda, ldainv
          complex    a(lda,*), ainv(ldainv,*)
        end subroutine
      end interface

      interface
        subroutine l2ncg (n, a, lda, ainv, ldainv, wk, iwk)
          integer    n, lda, ldainv, iwk(*)
          complex    a(lda,*), ainv(ldainv,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslrt (n, a, lda, b, ipath, x)
          integer    n, lda, ipath
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lfcrt (n, a, lda, ipath, rcond)
          integer    n, lda, ipath
          real       rcond, a(lda,*)
        end subroutine
      end interface

      interface
        subroutine l2crt (n, a, lda, ipath, rcond, z)
          integer    n, lda, ipath
          real       rcond, a(lda,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lfdrt (n, a, lda, det1, det2)
          integer    n, lda
          real       det1, det2, a(lda,*)
        end subroutine
      end interface

      interface
        subroutine linrt (n, a, lda, ipath, ainv, ldainv)
          integer    n, lda, ipath, ldainv
          real       a(lda,*), ainv(ldainv,*)
        end subroutine
      end interface

      interface
        subroutine lslct (n, a, lda, b, ipath, x)
          integer    n, lda, ipath
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lfcct (n, a, lda, ipath, rcond)
          integer    n, lda, ipath
          real       rcond
          complex    a(lda,*)
        end subroutine
      end interface

      interface
        subroutine l2cct (n, a, lda, ipath, rcond, z)
          integer    n, lda, ipath
          real       rcond
          complex    a(lda,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lfdct (n, a, lda, det1, det2)
          integer    n, lda
          real       det2
          complex    det1, a(lda,*)
        end subroutine
      end interface

      interface
        subroutine linct (n, a, lda, ipath, ainv, ldainv)
          integer    n, lda, ipath, ldainv
          complex    a(lda,*), ainv(ldainv,*)
        end subroutine
      end interface

      interface
        subroutine lsads (n, a, lda, b, x)
          integer    n, lda
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2ads (n, a, lda, b, x, fac, wk)
          integer    n, lda
          real       a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslds (n, a, lda, b, x)
          integer    n, lda
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lds (n, a, lda, b, x, fac, wk)
          integer    n, lda
          real       a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfcds (n, a, lda, fac, ldfac, rcond)
          integer    n, lda, ldfac
          real       rcond, a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2cds (n, a, lda, fac, ldfac, rcond, z)
          integer    n, lda, ldfac
          real       rcond, a(lda,*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lftds (n, a, lda, fac, ldfac)
          integer    n, lda, ldfac
          real       a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lfsds (n, fac, ldfac, b, x)
          integer    n, ldfac
          real       fac(ldfac,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lfids (n, a, lda, fac, ldfac, b, x, res)
          integer    n, lda, ldfac
          real       a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lfdds (n, fac, ldfac, det1, det2)
          integer    n, ldfac
          real       det1, det2, fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine linds (n, a, lda, ainv, ldainv)
          integer    n, lda, ldainv
          real       a(lda,*), ainv(ldainv,*)
        end subroutine
      end interface

      interface
        subroutine l2nds (n, a, lda, ainv, ldainv, wk)
          integer    n, lda, ldainv
          real       a(lda,*), ainv(ldainv,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lsasf (n, a, lda, b, x)
          integer    n, lda
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2asf (n, a, lda, b, x, fac, ipvt, wk)
          integer    n, lda, ipvt(*)
          real       a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslsf (n, a, lda, b, x)
          integer    n, lda
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lsf (n, a, lda, b, x, fac, ipvt, wk)
          integer    n, lda, ipvt(*)
          real       a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfcsf (n, a, lda, fac, ldfac, ipvt, rcond)
          integer    n, lda, ldfac, ipvt(*)
          real       rcond, a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2csf (n, a, lda, fac, ldfac, ipvt, rcond,z)
          integer    n, lda, ldfac, ipvt(*)
          real       rcond, a(*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lftsf (n, a, lda, fac, ldfac, ipvt)
          integer    n, lda, ldfac, ipvt(*)
          real       a(*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lfssf (n, fac, ldfac, ipvt, b, x)
          integer    n, ldfac, ipvt(*)
          real       fac(ldfac,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lfisf (n, a, lda, fac, ldfac, ipvt, b, x,res)
          integer    n, lda, ldfac, ipvt(*)
          real       a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lfdsf (n, fac, ldfac, ipvt, det1, det2)
          integer    n, ldfac, ipvt(*)
          real       det1, det2, fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lsadh (n, a, lda, b, x)
          integer    n, lda
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2adh (n, a, lda, b, x, fac, wk)
          integer    n, lda
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lsldh (n, a, lda, b, x)
          integer    n, lda
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2ldh (n, a, lda, b, x, fac, wk)
          integer    n, lda
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfcdh (n, a, lda, fac, ldfac, rcond)
          integer    n, lda, ldfac
          real       rcond
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2cdh (n, a, lda, fac, ldfac, rcond, z)
          integer    n, lda, ldfac
          real       rcond
          complex    a(lda,*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lftdh (n, a, lda, fac, ldfac)
          integer    n, lda, ldfac
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lfsdh (n, fac, ldfac, b, x)
          integer    n, ldfac
          complex    fac(ldfac,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lfidh (n, a, lda, fac, ldfac, b, x, res)
          integer    n, lda, ldfac
          complex    a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lfddh (n, fac, ldfac, det1, det2)
          integer    n, ldfac
          real       det1, det2
          complex    fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lsahf (n, a, lda, b, x)
          integer    n, lda
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2ahf (n, a, lda, b, x, fac, ipvt, wk)
          integer    n, lda, ipvt(*)
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslhf (n, a, lda, b, x)
          integer    n, lda
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lhf (n, a, lda, b, x, fac, ipvt, wk)
          integer    n, lda, ipvt(*)
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfchf (n, a, lda, fac, ldfac, ipvt, rcond)
          integer    n, lda, ldfac, ipvt(*)
          real       rcond
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2chf (n, a, lda, fac, ldfac, ipvt, rcond,z)
          integer    n, lda, ldfac, ipvt(*)
          real       rcond
          complex    a(lda,*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lfthf (n, a, lda, fac, ldfac, ipvt)
          integer    n, lda, ldfac, ipvt(*)
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lfshf (n, fac, ldfac, ipvt, b, x)
          integer    n, ldfac, ipvt(*)
          complex    fac(ldfac,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lfihf (n, a, lda, fac, ldfac, ipvt, b, x,res)
          integer    n, lda, ldfac, ipvt(*)
          complex    a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lfdhf (n, fac, ldfac, ipvt, det1, det2)
          integer    n, ldfac, ipvt(*)
          real       det1, det2
          complex    fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lsltr (n, c, d, e, b)
          integer    n
          real       c(*), d(*), e(*), b(*)
        end subroutine
      end interface

      interface
        subroutine lslcr (n, c, a, b, ijob, y, u, ir, is)
          integer    n, ijob
          real       c(*), a(*), b(*), y(*), u(*)
        end subroutine
      end interface

      interface
        subroutine lsarb (n, a, lda, nlca, nuca, b, ipath, x)
          integer    n, lda, nlca, nuca, ipath
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2arb (n, a, lda, nlca, nuca, b, ipath, x,fac, ipvt, wk)
          integer    n, lda, nlca, nuca, ipath, ipvt(*)
          real       a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslrb (n, a, lda, nlca, nuca, b, ipath, x)
          integer    n, lda, nlca, nuca, ipath
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lrb (n, a, lda, nlca, nuca, b, ipath, x,fac, ipvt, wk)
          integer    n, lda, nlca, nuca, ipath, ipvt(*)
          real       a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfcrb (n, a, lda, nlca, nuca, fac, ldfac,ipvt, rcond)
          integer    n, lda, nlca, nuca, ldfac, ipvt(*)
          real       rcond, a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2crb (n, a, lda, nlca, nuca, fac, ldfac,ipvt, rcond, z)
          integer    n, lda, nlca, nuca, ldfac, ipvt(*)
          real       rcond, a(lda,*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lftrb (n, a, lda, nlca, nuca, fac, ldfac,ipvt)
          integer    n, lda, nlca, nuca, ldfac, ipvt(*)
          real       a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2trb (n, a, lda, nlca, nuca, fac, ldfac,ipvt, scale)
          integer    n, lda, nlca, nuca, ldfac, ipvt(*)
          real       a(lda,*), fac(ldfac,*), scale(*)
        end subroutine
      end interface

      interface
        subroutine lfsrb (n, fac, ldfac, nlca, nuca, ipvt, b,ipath, x)
          integer    n, ldfac, nlca, nuca, ipath, ipvt(*)
          real       fac(ldfac,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lfirb (n, a, lda, nlca, nuca, fac, ldfac,ipvt, b, ipath, x, res)
          integer    n, lda, nlca, nuca, ldfac, ipath, ipvt(*)
          real       a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lfdrb (n, fac, ldfac, nlca, nuca, ipvt,det1, det2)
          integer    n, ldfac, nlca, nuca, ipvt(*)
          real       det1, det2, fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lsaqs (n, a, lda, ncoda, b, x)
          integer    n, lda, ncoda
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2aqs (n, a, lda, ncoda, b, x, fac, wk)
          integer    n, lda, ncoda
          real       a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslqs (n, a, lda, ncoda, b, x)
          integer    n, lda, ncoda
          real       a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lqs (n, a, lda, ncoda, b, x, fac, wk)
          integer    n, lda, ncoda
          real       a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslpb (n, a, lda, ncoda, ijob, u)
          integer    n, lda, ncoda, ijob
          real       a(-ncoda+1:lda-ncoda,*), u(*)
        end subroutine
      end interface

      interface
        subroutine l2lpb (n, a, lda, ncoda, ijob, u, w)
          integer    lda, n, ncoda, ijob
          real       a(-ncoda+1:lda-ncoda,*), u(*), w(*)
        end subroutine
      end interface

      interface
        subroutine lfcqs (n, a, lda, ncoda, fac, ldfac,rcond)
          integer    n, lda, ncoda, ldfac
          real       rcond, a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2cqs (n, a, lda, ncoda, fac, ldfac,rcond, z)
          integer    n, lda, ncoda, ldfac
          real       rcond, a(lda,*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lftqs (n, a, lda, ncoda, fac, ldfac)
          integer    n, lda, ncoda, ldfac
          real       a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lfsqs (n, fac, ldfac, ncoda, b, x)
          integer    n, ldfac, ncoda
          real       fac(ldfac,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lfiqs (n, a, lda, ncoda, fac, ldfac, b, x,res)
          integer    n, lda, ncoda, ldfac
          real       a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lfdqs (n, fac, ldfac, ncoda, det1, det2)
          integer    n, ldfac, ncoda
          real       det1, det2, fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lsltq (n, c, d, e, b)
          integer    n
          complex    c(*), d(*), e(*), b(*)
        end subroutine
      end interface

      interface
        subroutine lslcq (n, c, a, b, ijob, y, u, ir, is)
          integer    n, ijob
          real       u(*)
          complex    c(*), a(*), b(*), y(*)
        end subroutine
      end interface

      interface
        subroutine lsacb (n, a, lda, nlca, nuca, b, ipath, x)
          integer    n, lda, nlca, nuca, ipath
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2acb (n, a, lda, nlca, nuca, b, ipath, x,fac, ipvt, wk)
          integer    n, lda, nlca, nuca, ipath, ipvt(*)
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslcb (n, a, lda, nlca, nuca, b, ipath, x)
          integer    n, lda, nlca, nuca, ipath
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lcb (n, a, lda, nlca, nuca, b, ipath, x,fac, ipvt, wk)
          integer    n, lda, nlca, nuca, ipath, ipvt(*)
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfccb (n, a, lda, nlca, nuca, fac, ldfac,ipvt, rcond)
          integer    n, lda, nlca, nuca, ldfac, ipvt(*)
          real       rcond
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2ccb (n, a, lda, nlca, nuca, fac, ldfac,ipvt, rcond, z)
          integer    n, lda, nlca, nuca, ldfac, ipvt(*)
          real       rcond
          complex    a(lda,*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lftcb (n, a, lda, nlca, nuca, fac, ldfac,ipvt)
          integer    n, lda, nlca, nuca, ldfac, ipvt(*)
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2tcb (n, a, lda, nlca, nuca, fac, ldfac,ipvt, scale)
          integer    n, lda, nlca, nuca, ldfac, ipvt(*)
          complex    a(lda,*), fac(ldfac,*), scale(*)
        end subroutine
      end interface

      interface
        subroutine lfscb (n, fac, ldfac, nlca, nuca, ipvt, b,ipath, x)
          integer    n, ldfac, nlca, nuca, ipath, ipvt(*)
          complex    fac(ldfac,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lficb (n, a, lda, nlca, nuca, fac, ldfac,ipvt, b, ipath, x, res)
          integer    n, lda, nlca, nuca, ldfac, ipath, ipvt(*)
          complex    a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lfdcb (n, fac, ldfac, nlca, nuca, ipvt,det1, det2)
          integer    n, ldfac, nlca, nuca, ipvt(*)
          real       det2
          complex    det1, fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lsaqh (n, a, lda, ncoda, b, x)
          integer    n, lda, ncoda
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2aqh (n, a, lda, ncoda, b, x, fac, wk)
          integer    n, lda, ncoda
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslqh (n, a, lda, ncoda, b, x)
          integer    n, lda, ncoda
          complex    a(lda,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lqh (n, a, lda, ncoda, b, x, fac, wk)
          integer    n, lda, ncoda
          complex    a(lda,*), b(*), x(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslqb (n, a, lda, ncoda, ijob, u)
          integer    n, lda, ncoda, ijob
          real       a(-ncoda+1:lda-ncoda,*), u(*)
        end subroutine
      end interface

      interface
        subroutine l2lqb (n, a, lda, ncoda, ijob, u, x, y)
          integer    lda, n, ncoda, ijob
          real       a(-ncoda+1:lda-ncoda,*), u(*), x(*), y(*)
        end subroutine
      end interface

      interface
        subroutine lfcqh (n, a, lda, ncoda, fac, ldfac,rcond)
          integer    n, lda, ncoda, ldfac
          real       rcond
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine l2cqh (n, a, lda, ncoda, fac, ldfac,rcond, z)
          integer    n, lda, ncoda, ldfac
          real       rcond
          complex    a(lda,*), fac(ldfac,*), z(*)
        end subroutine
      end interface

      interface
        subroutine lftqh (n, a, lda, ncoda, fac, ldfac)
          integer    n, lda, ncoda, ldfac
          complex    a(lda,*), fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lfsqh (n, fac, ldfac, ncoda, b, x)
          integer    n, ldfac, ncoda
          complex    fac(ldfac,*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lfiqh (n, a, lda, ncoda, fac, ldfac, b, x,res)
          integer    n, lda, ncoda, ldfac
          complex    a(lda,*), fac(ldfac,*), b(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine lfdqh (n, fac, ldfac, ncoda, det1, det2)
          integer    n, ldfac, ncoda
          real       det1, det2
          complex    fac(ldfac,*)
        end subroutine
      end interface

      interface
        subroutine lslxg (n, nz, a, irow, jcol, b, ipath,iparam, rparam, x)
          integer    n, nz, ipath, irow(*), jcol(*), iparam(*)
          real       a(*), b(*), rparam(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lxg (n, nz, a, irow, jcol, b, ipath,iparam, rparam, x, wk, lwk, iwk, liwk)
          integer    n, nz, ipath, lwk, liwk, irow(*), jcol(*), iparam(*),  &
     &           iwk(*)
          real       a(*), b(*), rparam(*), x(*), wk(lwk)
        end subroutine
      end interface

      interface
        subroutine l4lxg (iparam, rparam)
          integer    iparam(*)
          real       rparam(*)
        end subroutine
      end interface

      interface
        subroutine lftxg (n, nz, a, irow, jcol, iparam,rparam, nfac, nl, fac, irfac, jcfac, ipvt, jpvt)
          integer    n, nz, nfac, nl, irow(*), jcol(*), iparam(*),          &
     &           irfac(*), jcfac(*), ipvt(*), jpvt(*)
          real       a(*), rparam(*), fac(*)
        end subroutine
      end interface

      interface
        subroutine l2txg (n, nz, a, irow, jcol, iparam,rparam, nfac, nl, fac, irfac, jcfac, ipvt, jpvt, wk,lwk, iwk, liwk)
          integer    n, nz, nfac, nl, lwk, liwk, irow(*), jcol(*),          &
     &           iparam(*), irfac(*), jcfac(*), ipvt(*), jpvt(*),       &
     &           iwk(*)
          real       a(*), rparam(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfsxg (n, nfac, nl, fac, irfac, jcfac,ipvt, jpvt, b, ipath, x)
          integer    n, nfac, nl, ipath, irfac(*), jcfac(*), ipvt(*),       &
     &           jpvt(*)
          real       fac(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lslzg (n, nz, a, irow, jcol, b, ipath,iparam, rparam, x)
          integer    n, nz, ipath, irow(*), jcol(*), iparam(*)
          real       rparam(*)
          complex    a(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lzg (n, nz, a, irow, jcol, b, ipath,iparam, rparam, x, wk, lwk, iwk, liwk)
          integer    n, nz, ipath, lwk, liwk, irow(*), jcol(*), iparam(*),  &
     &           iwk(*)
          real       rparam(*)
          complex    a(*), b(*), x(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine l4lzg (iparam, rparam)
          integer    iparam(*)
          real       rparam(*)
        end subroutine
      end interface

      interface
        subroutine lftzg (n, nz, a, irow, jcol, iparam,rparam, nfac, nl, fac, irfac, jcfac, ipvt, jpvt)
          integer    n, nz, nfac, nl, irow(*), jcol(*), iparam(*),          &
     &           irfac(*), jcfac(*), ipvt(*), jpvt(*)
          real       rparam(*)
          complex    a(*), fac(*)
        end subroutine
      end interface

      interface
        subroutine l2tzg (n, nz, a, irow, jcol, iparam,rparam, nfac, nl, fac, irfac, jcfac, ipvt, jpvt, wk,lwk, iwk, liwk)
          integer    n, nz, nfac, nl, lwk, liwk, irow(*), jcol(*),          &
     &           iparam(*), irfac(*), jcfac(*), ipvt(*), jpvt(*),       &
     &           iwk(*)
          real       rparam(*)
          complex    a(*), fac(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfszg (n, nfac, nl, fac, irfac, jcfac,ipvt, jpvt, b, ipath, x)
          integer    n, nfac, nl, ipath, irfac(*), jcfac(*), ipvt(*),       &
     &           jpvt(*)
          complex    fac(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lslxd (n, nz, a, irow, jcol, b, itwksp, x)
          integer    n, nz, itwksp, irow(*), jcol(*)
          real       a(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lxd (n, nz, a, irow, jcol, b, x, iper,iparam, rparam, wk, lwk, iwk, liwk)
          integer    n, nz, lwk, liwk, irow(*), jcol(*), iper(*),           &
     &           iparam(*), iwk(*)
          real       a(*), b(*), x(*), rparam(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine l4lxd (iparam, rparam)
          integer    iparam(*)
          real       rparam(*)
        end subroutine
      end interface

      interface
        subroutine lscxd (n, nz, irow, jcol, ijob, itwksp,maxsub, nzsub, inzsub, maxnz, ilnz, iper, invper,ispace)
          integer    n, nz, ijob, itwksp, maxsub, maxnz, ispace, irow(*),   &
     &           jcol(*), nzsub(*), inzsub(*), ilnz(*), iper(*),        &
     &           invper(*)
        end subroutine
      end interface

      interface
        subroutine l2cxd (n, nz, irow, jcol, ijob, maxsub,nzsub, inzsub, maxnz, ilnz, iper, invper, ispace, liwk,iwk)
          integer    n, nz, ijob, maxsub, maxnz, ispace, liwk, irow(*),     &
     &           jcol(*), nzsub(*), inzsub(*), ilnz(*), iper(*),        &
     &           invper(*), iwk(*)
        end subroutine
      end interface

      interface
        subroutine lnfxd (n, nz, a, irow, jcol, ijob, maxsub,nzsub, inzsub, maxnz, ilnz, iper, invper, ispace,itwksp, diag, rlnz, rparam)
          integer    n, nz, ijob, maxsub, maxnz, ispace, itwksp, irow(*),   &
     &           jcol(*), nzsub(*), inzsub(*), ilnz(*), iper(*),        &
     &           invper(*)
          real       a(*), diag(*), rlnz(*), rparam(*)
        end subroutine
      end interface

      interface
        subroutine l2fxd (n, nz, a, irow, jcol, ijob, maxsub,nzsub, inzsub, maxnz, ilnz, iper, invper, ispace, diag,rlnz, rparam, wk, lwk, iwk, liwk)
          integer    n, nz, ijob, maxsub, maxnz, ispace, lwk, liwk,         &
     &           irow(*), jcol(*), nzsub(*), inzsub(*), ilnz(*),        &
     &           iper(*), invper(*), iwk(*)
          real       a(*), diag(*), rlnz(*), rparam(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfsxd (n, maxsub, nzsub, inzsub, maxnz,rlnz, ilnz, diag, iper, b, x)
          integer    n, maxsub, maxnz, nzsub(*), inzsub(*), ilnz(*),        &
     &           iper(*)
          real       rlnz(*), diag(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lslzd (n, nz, a, irow, jcol, b, itwksp, x)
          integer    n, nz, itwksp, irow(*), jcol(*)
          complex    a(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lzd (n, nz, a, irow, jcol, b, x, iper,iparam, rparam, wk, lwk, iwk, liwk)
          integer    n, nz, lwk, liwk, irow(*), jcol(*), iper(*),           &
     &           iparam(*), iwk(*)
          real       rparam(*)
          complex    a(*), b(*), x(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine l4lzd (iparam, rparam)
          integer    iparam(*)
          real       rparam(*)
        end subroutine
      end interface

      interface
        subroutine lnfzd (n, nz, a, irow, jcol, ijob, maxsub,nzsub, inzsub, maxnz, ilnz, iper, invper, ispace,itwksp, diag, rlnz, rparam)
          integer    n, nz, ijob, maxsub, maxnz, ispace, itwksp, irow(*),   &
     &           jcol(*), nzsub(*), inzsub(*), ilnz(*), iper(*),        &
     &           invper(*)
          real       rparam(*)
          complex    a(*), diag(*), rlnz(*)
        end subroutine
      end interface

      interface
        subroutine l2fzd (n, nz, a, irow, jcol, ijob, maxsub,nzsub, inzsub, maxnz, ilnz, iper, invper, ispace, diag,rlnz, rparam, wk, lwk, iwk, liwk)
          integer    n, nz, ijob, maxsub, maxnz, ispace, lwk, liwk,         &
     &           irow(*), jcol(*), nzsub(*), inzsub(*), ilnz(*),        &
     &           iper(*), invper(*), iwk(*)
          real       rparam(*)
          complex    a(*), diag(*), rlnz(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lfszd (n, maxsub, nzsub, inzsub, maxnz,rlnz, ilnz, diag, iper, b, x)
          integer    n, maxsub, maxnz, nzsub(*), inzsub(*), ilnz(*),        &
     &           iper(*)
          complex    rlnz(*), diag(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine lslto (n, a, b, ipath, x)
          integer    n, ipath
          real       a(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lto (n, a, b, ipath, x, wk)
          integer    n, ipath
          real       a(*), b(*), x(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lsltc (n, a, b, ipath, x)
          integer    n, ipath
          complex    a(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2ltc (n, a, b, ipath, x, wk)
          integer    n, ipath
          complex    a(*), b(*), x(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lslcc (n, a, b, ipath, x)
          integer    n, ipath
          complex    a(*), b(*), x(*)
        end subroutine
      end interface

      interface
        subroutine l2lcc (n, a, b, ipath, x, ahat, wk)
          integer    n, ipath
          real       wk(*)
          complex    a(*), b(*), x(*), ahat(*)
        end subroutine
      end interface

      interface
        subroutine pcgrc (ido, n, x, p, r, z, relerr, itmax)
          integer    ido, n, itmax
          real       relerr, x(*), p(*), r(*), z(*)
        end subroutine
      end interface

      interface
        subroutine p2grc (ido, n, x, p, r, z, relerr, itmax,tri, work, iwork)
          integer    ido, n, itmax, iwork(*)
          real       relerr, x(*), p(*), r(*), z(*), tri(2,*), work(*)
        end subroutine
      end interface

      interface
        subroutine jcgrc (ido, n, diag, x, p, r, z, relerr,itmax)
          integer    ido, n, itmax
          real       relerr, diag(*), x(*), p(*), r(*), z(*)
        end subroutine
      end interface

      interface
        subroutine j2grc (ido, n, diag, x, p, r, z, relerr,itmax, tri, work, iwork)
          integer    ido, n, itmax, iwork(*)
          real       relerr, diag(*), x(*), p(*), r(*), z(*), tri(2,*),     &
     &           work(*)
        end subroutine
      end interface

      interface
        subroutine lqrrv (nra, nca, numexc, a, lda, x, ldx)
          integer    nra, nca, numexc, lda, ldx
          real       a(lda,*), x(ldx,*)
        end subroutine
      end interface

      interface
        subroutine l2rrv (nra, nca, numexc, a, lda, x, ldx,fac, ldfac, work)
          integer    nra, nca, numexc, lda, ldx, ldfac
          real       a(lda,*), x(ldx,*), fac(ldfac,*), work(nca+numexc+1,*)
        end subroutine
      end interface

      interface
        subroutine lclsq (nra, nca, ncon, a, lda, b, c, ldc,bl, bu, irtype, xlb, xub, x, res)
          integer    nra, nca, ncon, lda, ldc, irtype(*)
          real       a(lda,*), b(*), c(ldc,*), bl(*), bu(*), xlb(*),        &
     &           xub(*), x(*), res(*)
        end subroutine
      end interface

      interface
        subroutine l2lsq (nra, nca, ncon, a, lda, b, c, ldc,bl, bu, irtype, xlb, xub, x, res, wk, iwk)
          integer    nra, nca, ncon, lda, ldc, irtype(*), iwk(*)
          real       a(lda,*), b(*), c(ldc,*), bl(*), bu(*), xlb(*),        &
     &           xub(*), x(*), res(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lqrrr (nra, nca, a, lda, pivot, ipvt, qr,ldqr, qraux, conorm)
          integer    nra, nca, lda, ldqr, ipvt(*)
          real       a(*), qr(*), qraux(*), conorm(*)
          logical    pivot
        end subroutine
      end interface

      interface
        subroutine l2rrr (nra, nca, a, lda, pivot, ipvt, qr,ldqr, qraux, conorm, work)
          integer    nra, nca, lda, ldqr, ipvt(*)
          real       a(lda,*), qr(ldqr,*), qraux(*), conorm(*), work(*)
          logical    pivot
        end subroutine
      end interface

      interface
        subroutine lqerr (nrqr, ncqr, qr, ldqr, qraux, q,ldq)
          integer    nrqr, ncqr, ldqr, ldq
          real       qr(ldqr,*), qraux(*), q(ldq,*)
        end subroutine
      end interface

      interface
        subroutine l2err (nrqr, ncqr, qr, ldqr, qraux, q,ldq, work)
          integer    nrqr, ncqr, ldqr, ldq
          real       qr(ldqr,*), qraux(*), q(ldq,*), work(*)
        end subroutine
      end interface

      interface
        subroutine lqrsl (nra, kbasis, qr, ldqr, qraux, b,ipath, qb, qtb, x, res, ab)
          integer    nra, kbasis, ldqr, ipath
          real       qr(ldqr,*), qraux(*), b(*), qb(*), qtb(*), x(*),       &
     &           res(*), ab(*)
        end subroutine
      end interface

      interface
        subroutine lupqr (nrow, ncol, alpha, w, y, q, ldq, r,ldr, ipath, qnew, ldqnew, rnew, ldrnew)
          integer    nrow, ncol, ldq, ldr, ipath, ldqnew, ldrnew
          real       alpha, w(*), y(*), q(*), r(*), qnew(*), rnew(*)
        end subroutine
      end interface

      interface
        subroutine l2pqr (nrow, ncol, alpha, w, y, q, ldq, r,ldr, ipath, qnew, ldqnew, rnew, ldrnew, z, work)
          integer    nrow, ncol, ldq, ldr, ipath, ldqnew, ldrnew
          real       alpha, w(*), y(*), q(ldq,*), r(ldr,*),                 &
     &           qnew(ldqnew,*), rnew(ldrnew,*), z(*), work(*)
        end subroutine
      end interface

      interface
        subroutine lchrg (n, a, lda, pivot, ipvt, fac, ldfac)
          integer    n, lda, ldfac, ipvt(*)
          real       a(lda,*), fac(ldfac,*)
          logical    pivot
        end subroutine
      end interface

      interface
        subroutine lupch (n, r, ldr, x, rnew, ldrnew, cs, sn)
          integer    n, ldr, ldrnew
          real       r(ldr,*), x(*), rnew(ldrnew,*), cs(*), sn(*)
        end subroutine
      end interface

      interface
        subroutine ldnch (n, r, ldr, x, rnew, ldrnew, cs, sn)
          integer    n, ldr, ldrnew
          real       r(ldr,*), x(*), rnew(ldrnew,*), cs(*), sn(*)
        end subroutine
      end interface

      interface
        subroutine lsvcr (nra, nca, a, lda, ipath, tol,irank, s, u, ldu, v, ldv)
          integer    nra, nca, lda, ipath, irank, ldu, ldv
          real       tol
          complex    a(lda,*), s(*), u(ldu,*), v(ldv,*)
        end subroutine
      end interface

      interface
        subroutine l2vcr (nra, nca, a, lda, ipath, tol,irank, s, u, ldu, v, ldv, wka, wk)
          integer    nra, nca, lda, ipath, irank, ldu, ldv
          real       tol
          complex    a(lda,*), s(*), u(*), v(*), wka(*), wk(*)
        end subroutine
      end interface

!
!     Chapter 2:  Eigensystem Analysis
!

      interface
        subroutine evlrg (n, a, lda, eval)
          integer    n, lda
          real       a(lda,*)
          complex    eval(*)
        end subroutine
      end interface

      interface
        subroutine e3lrg (n, a, lda, eval, acopy, wk, iwk)
          integer    n, lda, iwk(n,2)
          real       a(lda,*), acopy(*), wk(n,4)
          complex    eval(*)
        end subroutine
      end interface

      interface
        subroutine evcrg (n, a, lda, eval, evec, ldevec)
          integer    n, lda, ldevec
          real       a(lda,*)
          complex    eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e8crg (n, a, lda, eval, evec, ldevec,acopy, ecopy, wk, iwk)
          integer    n, lda, ldevec, iwk(n)
          real       a(lda,*), acopy(*), ecopy(*), wk(n,6)
          complex    eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        real function epirg (n, neval, a, lda, eval, evec,ldevec)
          integer    n, neval, lda, ldevec
          real       a(lda,*)
          complex    eval(*), evec(ldevec,*)
        end function
      end interface

      interface
        real function e2irg (n, neval, a, lda, eval, evec,ldevec, cwk)
          integer    n, neval, lda, ldevec
          real       a(lda,*)
          complex    eval(*), evec(ldevec,*), cwk(*)
        end function
      end interface

      interface
        subroutine evlcg (n, a, lda, eval)
          integer    n, lda
          complex    a(lda,*), eval(*)
        end subroutine
      end interface

      interface
        subroutine e3lcg (n, a, lda, eval, acopy, rwk, cwk,iwk)
          integer    n, lda, iwk(n)
          real       rwk(*)
          complex    a(lda,*), eval(*), acopy(*), cwk(n,*)
        end subroutine
      end interface

      interface
        subroutine evccg (n, a, lda, eval, evec, ldevec)
          integer    n, lda, ldevec
          complex    a(lda,*), eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e6ccg (n, a, lda, eval, evec, ldevec,acopy, rwk, cwk, iwk)
          integer    n, lda, ldevec, iwk(n)
          real       rwk(n)
          complex    a(lda,*), eval(*), evec(ldevec,*), acopy(*), cwk(n,*)
        end subroutine
      end interface

      interface
        real function epicg (n, neval, a, lda, eval, evec,ldevec)
          integer    n, neval, lda, ldevec
          complex    a(lda,*), eval(*), evec(ldevec,*)
        end function
      end interface

      interface
        real function e2icg (n, neval, a, lda, eval, evec,ldevec, wk)
          integer    n, neval, lda, ldevec
          complex    a(lda,*), eval(*), evec(ldevec,*), wk(*)
        end function
      end interface

      interface
        subroutine evlsf (n, a, lda, eval)
          integer    n, lda
          real       a(lda,*), eval(*)
        end subroutine
      end interface

      interface
        subroutine e4lsf (n, a, lda, eval, wk, iwk)
          integer    n, lda, iwk(n)
          real       a(lda,*), eval(*), wk(n,2)
        end subroutine
      end interface

      interface
        subroutine evasf (n, neval, a, lda, small, eval)
          integer    n, neval, lda
          real       a(lda,*), eval(*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e4asf (n, neval, a, lda, small, eval, wk,iwk)
          integer    n, neval, lda, iwk(n)
          real       a(lda,*), eval(*), wk(n,4)
          logical    small
        end subroutine
      end interface

      interface
        subroutine evesf (n, nevec, a, lda, small, eval,evec, ldevec)
          integer    n, nevec, lda, ldevec
          real       a(lda,*), eval(*), evec(ldevec,*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e5esf (n, nevec, a, lda, small, eval,evec, ldevec, wk, iwk)
          integer    n, nevec, lda, ldevec, iwk(n)
          real       a(lda,*), eval(*), evec(ldevec,*), wk(n,9)
          logical    small
        end subroutine
      end interface

      interface
        subroutine evbsf (n, mxeval, a, lda, elow, ehigh,neval, eval)
          integer    n, mxeval, lda, neval
          real       elow, ehigh, a(lda,*), eval(mxeval)
        end subroutine
      end interface

      interface
        subroutine e5bsf (n, mxeval, a, lda, elow, ehigh,neval, eval, wk, iwk)
          integer    n, mxeval, lda, neval, iwk(n)
          real       elow, ehigh, a(lda,*), eval(mxeval), wk(n,5)
        end subroutine
      end interface

      interface
        subroutine evfsf (n, mxeval, a, lda, elow, ehigh,neval, eval, evec, ldevec)
          integer    n, mxeval, lda, neval, ldevec
          real       elow, ehigh, a(lda,*), eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e3fsf (n, mxeval, a, lda, elow, ehigh,neval, eval, evec, ldevec, wk, iwk)
          integer    n, mxeval, lda, neval, ldevec, iwk(n)
          real       elow, ehigh, a(lda,*), eval(mxeval), evec(ldevec,*),   &
     &           wk(n,9)
        end subroutine
      end interface

      interface
        subroutine evlsb (n, a, lda, ncoda, eval)
          integer    n, lda, ncoda
          real       a(lda,*), eval(*)
        end subroutine
      end interface

      interface
        subroutine e3lsb (n, a, lda, ncoda, eval, acopy, wk)
          integer    n, lda, ncoda
          real       a(lda,*), eval(*), acopy(ncoda+1,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine evcsb (n, a, lda, ncoda, eval, evec,ldevec)
          integer    n, lda, ncoda, ldevec
          real       a(lda,*), eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e4csb (n, a, lda, ncoda, eval, evec,ldevec, acopy, wk, iwk)
          integer    n, lda, ncoda, ldevec, iwk(*)
          real       a(lda,*), eval(*), evec(ldevec,*), acopy(ncoda+1,*),   &
     &           wk(*)
        end subroutine
      end interface

      interface
        subroutine evasb (n, neval, a, lda, ncoda, small,eval)
          integer    n, neval, lda, ncoda
          real       a(lda,*), eval(*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e3asb (n, neval, a, lda, ncoda, small,eval, acopy, wk)
          integer    n, neval, lda, ncoda
          real       a(lda,*), eval(*), acopy(ncoda+1,*), wk(3*n)
          logical    small
        end subroutine
      end interface

      interface
        subroutine evesb (n, nevec, a, lda, ncoda, small,eval, evec, ldevec)
          integer    n, nevec, lda, ncoda, ldevec
          real       a(lda,*), eval(*), evec(ldevec,*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e4esb (n, nevec, a, lda, ncoda, small,eval, evec, ldevec, acopy, wk, iwk)
          integer    n, nevec, lda, ncoda, ldevec, iwk(n)
          real       a(lda,*), eval(*), evec(ldevec,*), acopy(ncoda+1,*),   &
     &           wk(n*(2*ncoda+5))
          logical    small
        end subroutine
      end interface

      interface
        subroutine evbsb (n, mxeval, a, lda, ncoda, elow,ehigh, neval, eval)
          integer    n, mxeval, lda, ncoda, neval
          real       elow, ehigh, a(lda,*), eval(*)
        end subroutine
      end interface

      interface
        subroutine e3bsb (n, mxeval, a, lda, ncoda, elow,ehigh, neval, eval, acopy, wk)
          integer    n, mxeval, lda, ncoda, neval
          real       elow, ehigh, a(lda,*), eval(*), acopy(ncoda+1,*),      &
     &           wk(n,*)
        end subroutine
      end interface

      interface
        subroutine evfsb (n, mxeval, a, lda, ncoda, elow,ehigh, neval, eval, evec, ldevec)
          integer    n, mxeval, lda, ncoda, neval, ldevec
          real       elow, ehigh, a(lda,*), eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e3fsb (n, mxeval, a, lda, ncoda, elow,ehigh, neval, eval, evec, ldevec, acopy, wk1, wk2, iwk)
          integer    n, mxeval, lda, ncoda, neval, ldevec, iwk(n)
          real       elow, ehigh, a(lda,*), eval(*), evec(ldevec,*),        &
     &           acopy(ncoda+1,*), wk1(6*n), wk2(2*n*ncoda+n)
        end subroutine
      end interface

      interface
        real function episb (n, neval, a, lda, ncoda, eval,evec, ldevec)
          integer    n, neval, lda, ncoda, ldevec
          real       a(lda,*), eval(*), evec(ldevec,*)
        end function
      end interface

      interface
        real function e2isb (n, neval, a, lda, ncoda, eval,evec, ldevec, wk)
          integer    n, neval, lda, ncoda, ldevec
          real       a(lda,*), eval(*), evec(ldevec,*), wk(*)
        end function
      end interface

      interface
        subroutine evlhf (n, a, lda, eval)
          integer    n, lda
          real       eval(*)
          complex    a(lda,*)
        end subroutine
      end interface

      interface
        subroutine e3lhf (n, a, lda, eval, acopy, rwk, cwk,iwk)
          integer    n, lda, iwk(n)
          real       eval(*), rwk(*)
          complex    a(lda,*), acopy(*), cwk(*)
        end subroutine
      end interface

      interface
        subroutine evchf (n, a, lda, eval, evec, ldevec)
          integer    n, lda, ldevec
          real       eval(*)
          complex    a(lda,*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e5chf (n, a, lda, eval, evec, ldevec,acopy, rwk, cwk, iwk)
          integer    n, lda, ldevec, iwk(n)
          real       eval(*), rwk(*)
          complex    a(lda,*), evec(ldevec,*), acopy(*), cwk(*)
        end subroutine
      end interface

      interface
        subroutine evahf (n, neval, a, lda, small, eval)
          integer    n, neval, lda
          real       eval(*)
          complex    a(lda,*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e3ahf (n, neval, a, lda, small, eval,acopy, rwk, cwk, iwk)
          integer    n, neval, lda, iwk(*)
          real       eval(*), rwk(n,*)
          complex    a(lda,*), acopy(n,*), cwk(n,*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine evehf (n, nevec, a, lda, small, eval,evec, ldevec)
          integer    n, nevec, lda, ldevec
          real       eval(*)
          complex    a(lda,*), evec(ldevec,*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e3ehf (n, nevec, a, lda, small, eval,evec, ldevec, acopy, rw1, rw2, cwk, iwk)
          integer    n, nevec, lda, ldevec, iwk(*)
          real       eval(*), rw1(n,*), rw2(n,*)
          complex    a(lda,*), evec(ldevec,*), acopy(n,*), cwk(n,*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine evbhf (n, mxeval, a, lda, elow, ehigh,neval, eval)
          integer    n, mxeval, lda, neval
          real       elow, ehigh, eval(*)
          complex    a(lda,*)
        end subroutine
      end interface

      interface
        subroutine e3bhf (n, mxeval, a, lda, elow, ehigh,neval, eval, acopy, rwk, cwk, iwk)
          integer    n, mxeval, lda, neval, iwk(*)
          real       elow, ehigh, eval(*), rwk(n,*)
          complex    a(lda,*), acopy(n,*), cwk(n,*)
        end subroutine
      end interface

      interface
        subroutine evfhf (n, mxeval, a, lda, elow, ehigh,neval, eval, evec, ldevec)
          integer    n, mxeval, lda, neval, ldevec
          real       elow, ehigh, eval(*)
          complex    a(lda,*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e3fhf (n, mxeval, a, lda, elow, ehigh,neval, eval, evec, ldevec, acopy, ecopy, rwk, cwk, iwk)
          integer    n, mxeval, lda, neval, ldevec, iwk(*)
          real       elow, ehigh, eval(*), ecopy(n,*), rwk(n,*)
          complex    a(lda,*), evec(ldevec,*), acopy(n,*), cwk(n,*)
        end subroutine
      end interface

      interface
        real function epihf (n, neval, a, lda, eval, evec,ldevec)
          integer    n, neval, lda, ldevec
          real       eval(*)
          complex    a(lda,*), evec(ldevec,*)
        end function
      end interface

      interface
        real function e2ihf (n, neval, a, lda, eval, evec,ldevec, wk)
          integer    n, neval, lda, ldevec
          real       eval(*)
          complex    a(lda,*), evec(ldevec,*), wk(*)
        end function
      end interface

      interface
        subroutine evlrh (n, a, lda, eval)
          integer    n, lda
          real       a(lda,*)
          complex    eval(*)
        end subroutine
      end interface

      interface
        subroutine e3lrh (n, a, lda, eval, acopy, wk, iwk)
          integer    n, lda, iwk(n,1)
          real       a(lda,*), acopy(n,*), wk(n,3)
          complex    eval(*)
        end subroutine
      end interface

      interface
        subroutine evcrh (n, a, lda, eval, evec, ldevec)
          integer    n, lda, ldevec
          real       a(lda,*)
          complex    eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e6crh (n, a, lda, eval, evec, ldevec,acopy, ecopy, rwk, iwk)
          integer    n, lda, ldevec, iwk(n)
          real       a(lda,*), acopy(n,*), ecopy(n,n), rwk(n,3)
          complex    eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine evlch (n, a, lda, eval)
          integer    n, lda
          complex    a(lda,*), eval(*)
        end subroutine
      end interface

      interface
        subroutine e3lch (n, a, lda, eval, acopy, rwk, iwk)
          integer    n, lda, iwk(n)
          complex    a(lda,*), eval(*), acopy(n,*)
          real       rwk(n)
        end subroutine
      end interface

      interface
        subroutine evcch (n, a, lda, eval, evec, ldevec)
          integer    n, lda, ldevec
          complex    a(lda,*), eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e4cch (n, a, lda, eval, evec, ldevec,acopy, cwork, rwk, iwk)
          integer    n, lda, ldevec, iwk(n)
          real       rwk(n)
          complex    a(lda,*), eval(*), evec(ldevec,*), acopy(n,*),         &
     &           cwork(n,*)
        end subroutine
      end interface

      interface
        subroutine gvlrg (n, a, lda, b, ldb, alpha, beta)
          integer    n, lda, ldb
          real       a(lda,*), b(ldb,*), beta(*)
          complex    alpha(*)
        end subroutine
      end interface

      interface
        subroutine g3lrg (n, a, lda, b, ldb, alpha, beta,acopy, bcopy, rwk, cwk, iwk)
          integer    n, lda, ldb, iwk(n)
          real       a(lda,*), b(ldb,*), beta(*), acopy(*), bcopy(*),       &
     &           rwk(*)
          complex    alpha(*), cwk(*)
        end subroutine
      end interface

      interface
        subroutine gvcrg (n, a, lda, b, ldb, alpha, beta,evec, ldevec)
          integer    n, lda, ldb, ldevec
          real       a(lda,*), b(ldb,*), beta(*)
          complex    alpha(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine g8crg (n, a, lda, b, ldb, alpha, beta,evec, ldevec, acopy, bcopy, ecopy, rwk, cwk, iwk)
          integer    n, lda, ldb, ldevec, iwk(n)
          real       a(lda,*), b(ldb,*), beta(*), acopy(*), bcopy(*),       &
     &           ecopy(*), rwk(*)
          complex    alpha(*), evec(ldevec,*), cwk(*)
        end subroutine
      end interface

      interface
        real function gpirg (n, neval, a, lda, b, ldb, alpha,beta, evec, ldevec)
          integer    n, neval, lda, ldb, ldevec
          real       a(lda,*), b(ldb,*), beta(*)
          complex    alpha(*), evec(ldevec,*)
        end function
      end interface

      interface
        real function g2irg (n, neval, a, lda, b, ldb, alpha,beta, evec, ldevec, wk)
          integer    n, neval, lda, ldb, ldevec
          real       a(lda,*), b(ldb,*), beta(*)
          complex    alpha(*), evec(ldevec,*), wk(n,*)
        end function
      end interface

      interface
        subroutine gvlcg (n, a, lda, b, ldb, alpha, beta)
          integer    n, lda, ldb
          complex    a(lda,*), b(ldb,*), alpha(*), beta(*)
        end subroutine
      end interface

      interface
        subroutine g3lcg (n, a, lda, b, ldb, alpha, beta,acopy, bcopy, cwk, wk, iwk)
          integer    n, lda, ldb, iwk(n)
          real       wk(n)
          complex    a(lda,*), b(ldb,*), alpha(*), beta(*), acopy(n,*),     &
     &           bcopy(n,*), cwk(n)
        end subroutine
      end interface

      interface
        subroutine gvccg (n, a, lda, b, ldb, alpha, beta,evec, ldevec)
          integer    n, lda, ldb, ldevec
          complex    a(lda,*), b(ldb,*), alpha(*), beta(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine g6ccg (n, a, lda, b, ldb, alpha, beta,evec, ldevec, acopy, bcopy, cwk, wk, iwk)
          integer    n, lda, ldb, ldevec, iwk(n)
          real       wk(n)
          complex    a(lda,*), b(ldb,*), alpha(*), beta(*),                 &
     &           evec(ldevec,*), acopy(n,*), bcopy(n,*), cwk(n)
        end subroutine
      end interface

      interface
        real function gpicg (n, neval, a, lda, b, ldb, alpha,beta, evec, ldevec)
          integer    n, neval, lda, ldb, ldevec
          complex    a(lda,*), b(ldb,*), alpha(*), beta(*), evec(ldevec,*)
        end function
      end interface

      interface
        real function g2icg (n, neval, a, lda, b, ldb, alpha,beta, evec, ldevec, wk)
          integer    n, neval, lda, ldb, ldevec
          complex    a(lda,*), b(ldb,*), alpha(*), beta(*),                 &
     &           evec(ldevec,*), wk(n,*)
        end function
      end interface

      interface
        subroutine gvcsp (n, a, lda, b, ldb, eval, evec,ldevec)
          integer    n, lda, ldb, ldevec
          real       a(lda,*), b(ldb,*), eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine g3csp (n, a, lda, b, ldb, eval, evec,ldevec, iwk, wk1, wk2)
          integer    n, lda, ldb, ldevec, iwk(*)
          real       a(lda,*), b(ldb,*), eval(*), evec(ldevec,*),           &
     &           wk1(n,*), wk2(n+1,*)
        end subroutine
      end interface

      interface
        real function gpisp (n, neval, a, lda, b, ldb, eval,evec, ldevec)
          integer    n, neval, lda, ldb, ldevec
          real       a(lda,*), b(ldb,*), eval(*), evec(ldevec,*)
        end function
      end interface

      interface
        real function g2isp (n, neval, a, lda, b, ldb, eval,evec, ldevec, work)
          integer    n, neval, lda, ldb, ldevec
          real       a(lda,*), b(ldb,*), eval(*), evec(ldevec,*), work(n,*)
        end function
      end interface

!
!     Chapter 3:  Interpolation and Approximation
!

      interface
        subroutine csiez (ndata, xdata, fdata, n, xvec,value)
          integer    ndata, n
          real       xdata(*), fdata(*), xvec(*), value(*)
        end subroutine
      end interface

      interface
        subroutine c2iez (ndata, xdata, fdata, n, xvec,value, iwk, wk1, wk2)
          integer    ndata, n, iwk(*)
          real       xdata(*), fdata(*), xvec(*), value(*), wk1(*), wk2(*)
        end subroutine
      end interface

      interface
        subroutine csint (ndata, xdata, fdata, break, cscoef)
          integer    ndata
          real       xdata(*), fdata(*), break(*), cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine c2int (ndata, xdata, fdata, break, cscoef,ipvt)
          integer    ndata, ipvt(*)
          real       xdata(*), fdata(*), break(*), cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine csdec (ndata, xdata, fdata, ileft, dleft,iright, dright, break, cscoef)
          integer    ndata, ileft, iright
          real       dleft, dright, xdata(*), fdata(*), break(*),           &
     &           cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine c2dec (ndata, xdata, fdata, ileft, dleft,iright, dright, break, cscoef, ipvt)
          integer    ndata, ileft, iright, ipvt(*)
          real       dleft, dright, xdata(*), fdata(*), break(*),           &
     &           cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine csher (ndata, xdata, fdata, dfdata, break,cscoef)
          integer    ndata
          real       xdata(*), fdata(*), dfdata(*), break(*), cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine c2her (ndata, xdata, fdata, dfdata, break,cscoef, ipvt)
          integer    ndata, ipvt(*)
          real       xdata(*), fdata(*), dfdata(*), break(*), cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine csakm (ndata, xdata, fdata, break, cscoef)
          integer    ndata
          real       xdata(*), fdata(*), break(*), cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine c2akm (ndata, xdata, fdata, break, cscoef,ipvt)
          integer    ndata, ipvt(*)
          real       xdata(*), fdata(*), break(*), cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine cscon (ndata, xdata, fdata, ibreak, break,cscoef)
          integer    ndata, ibreak
          real       xdata(*), fdata(*), break(*), cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine c2con (ndata, xdata, fdata, ibreak, break,cscoef, itmax, xsrt, fsrt, a, y, divd, id, wk)
          integer    ndata, ibreak, itmax, id(*)
          real       xdata(*), fdata(*), break(*), cscoef(4,*), xsrt(*),    &
     &           fsrt(*), a(*), y(*), divd(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine csper (ndata, xdata, fdata, break, cscoef)
          integer    ndata
          real       xdata(*), fdata(*), break(*), cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine c2per (ndata, xdata, fdata, break, cscoef,work, ipvt)
          integer    ndata, ipvt(*)
          real       xdata(*), fdata(*), break(*), cscoef(4,*), work(6,*)
        end subroutine
      end interface

      interface
        real function csval (x, nintv, break, cscoef)
          integer    nintv
          real       x, break(*), cscoef(4,*)
        end function
      end interface

      interface
        real function csder (ideriv, x, nintv, break, cscoef)
          integer    ideriv, nintv
          real       x, break(*), cscoef(4,*)
        end function
      end interface

      interface
        subroutine cs1gd (ideriv, n, xvec, nintv, break,cscoef, value)
          integer    ideriv, n, nintv
          real       xvec(*), break(*), cscoef(4,*), value(*)
        end subroutine
      end interface

      interface
        subroutine c21gd (ideriv, n, xvec, nintv, break,cscoef, value, left, h, p)
          integer    ideriv, n, nintv, left(*)
          real       xvec(*), break(*), cscoef(4,*), value(*), h(*), p(*)
        end subroutine
      end interface

      interface
        real function csitg (a, b, nintv, break, cscoef)
          integer    nintv
          real       a, b, break(*), cscoef(4,*)
        end function
      end interface

      interface
        subroutine splez (ndata, xdata, fdata, itype, ider,n, xvec, value)
          integer    ndata, itype, ider, n
          real       xdata(*), fdata(*), xvec(*), value(*)
        end subroutine
      end interface

      interface
        subroutine s2lez (ndata, xdata, fdata, itype, ider,n, xvec, value, wk, iwk)
          integer    ndata, itype, ider, n, iwk(*)
          real       xdata(*), fdata(*), xvec(*), value(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine bsint (ndata, xdata, fdata, korder, xknot,bscoef)
          integer    ndata, korder
          real       xdata(*), fdata(*), xknot(*), bscoef(*)
        end subroutine
      end interface

      interface
        subroutine b2int (ndata, xdata, fdata, korder, xknot,bscoef, work1, work2, work3, iwork)
          integer    ndata, korder, iwork(*)
          real       xdata(*), fdata(*), xknot(*), bscoef(*), work1(*),     &
     &           work2(*), work3(*)
        end subroutine
      end interface

      interface
        subroutine bsnak (ndata, xdata, korder, xknot)
          integer    ndata, korder
          real       xdata(*), xknot(*)
        end subroutine
      end interface

      interface
        subroutine b2nak (ndata, xdata, korder, xknot, xsrt,iwk)
          integer    ndata, korder, iwk(*)
          real       xdata(*), xknot(*), xsrt(*)
        end subroutine
      end interface

      interface
        subroutine bsopk (ndata, xdata, korder, xknot)
          integer    ndata, korder
          real       xdata(*), xknot(*)
        end subroutine
      end interface

      interface
        subroutine b2opk (ndata, xdata, korder, xknot, maxit,wk, iwk)
          integer    ndata, korder, maxit, iwk(*)
          real       xdata(*), xknot(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine bs2in (nxdata, xdata, nydata, ydata,fdata, ldf, kxord, kyord, xknot, yknot, bscoef)
          integer    nxdata, nydata, ldf, kxord, kyord
          real       xdata(*), ydata(*), fdata(*), xknot(*), yknot(*),      &
     &           bscoef(*)
        end subroutine
      end interface

      interface
        subroutine b22in (nxdata, xdata, nydata, ydata,fdata, ldf, kxord, kyord, xknot, yknot, bscoef, wk,iwk)
          integer    nxdata, nydata, ldf, kxord, kyord, iwk(*)
          real       xdata(*), ydata(*), fdata(ldf,*), xknot(*), yknot(*),  &
     &           bscoef(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine bs3in (nxdata, xdata, nydata, ydata,nzdata, zdata, fdata, ldf, mdf, kxord, kyord, kzord,xknot, yknot, zknot, bscoef)
          integer    nxdata, nydata, nzdata, ldf, mdf, kxord, kyord, kzord
          real       xdata(*), ydata(*), zdata(*), fdata(*), xknot(*),      &
     &           yknot(*), zknot(*), bscoef(*)
        end subroutine
      end interface

      interface
        subroutine b23in (nxdata, xdata, nydata, ydata,nzdata, zdata, fdata, ldf, mdf, kxord, kyord, kzord,xknot, yknot, zknot, bscoef, wk, iwk)
          integer    nxdata, nydata, nzdata, ldf, mdf, kxord, kyord,        &
     &           kzord, iwk(*)
          real       xdata(*), ydata(*), zdata(*), fdata(ldf,mdf,*),        &
     &           xknot(*), yknot(*), zknot(*), bscoef(*), wk(*)
        end subroutine
      end interface

      interface
        real function bsval (x, korder, xknot, ncoef, bscoef)
          integer    korder, ncoef
          real       x, xknot(*), bscoef(*)
        end function
      end interface

      interface
        real function b2val (x, korder, xknot, ncoef, bscoef,aj, dl, dr)
          integer    korder, ncoef
          real       x, xknot(*), bscoef(*), aj(*), dl(*), dr(*)
        end function
      end interface

      interface
        real function bsder (ideriv, x, korder, xknot, ncoef,bscoef)
          integer    ideriv, korder, ncoef
          real       x, xknot(*), bscoef(*)
        end function
      end interface

      interface
        real function b2der (ideriv, x, korder, xknot, ncoef,bscoef, aj, dl, dr)
          integer    ideriv, korder, ncoef
          real       x, xknot(*), bscoef(*), aj(*), dl(*), dr(*)
        end function
      end interface

      interface
        subroutine bs1gd (ideriv, n, xvec, korder, xknot,ncoef, bscoef, value)
          integer    ideriv, n, korder, ncoef
          real       xvec(*), xknot(*), bscoef(*), value(*)
        end subroutine
      end interface

      interface
        subroutine b21gd (ideriv, n, xvec, korder, xknot,ncoef, bscoef, value, ppcoef, break, left, h, p, wk)
          integer    ideriv, n, korder, ncoef, left(*)
          real       xvec(*), xknot(*), bscoef(*), value(*),                &
     &           ppcoef(korder,*), break(*), h(*), p(*), wk(*)
        end subroutine
      end interface

      interface
        real function bsitg (a, b, korder, xknot, ncoef,bscoef)
          integer    korder, ncoef
          real       a, b, xknot(*), bscoef(*)
        end function
      end interface

      interface
        real function b2itg (a, b, korder, xknot, ncoef,bscoef, tcoef, aj, dl, dr)
          integer    korder, ncoef
          real       a, b, xknot(*), bscoef(*), tcoef(0:*), aj(*), dl(*),   &
     &           dr(*)
        end function
      end interface

      interface
        real function bs2vl (x, y, kxord, kyord, xknot,yknot, nxcoef, nycoef, bscoef)
          integer    kxord, kyord, nxcoef, nycoef
          real       x, y, xknot(*), yknot(*), bscoef(*)
        end function
      end interface

      interface
        real function b22vl (x, y, kxord, kyord, xknot,yknot, nxcoef, nycoef, bscoef, wk)
          integer    kxord, kyord, nxcoef, nycoef
          real       x, y, xknot(*), yknot(*), bscoef(*), wk(*)
        end function
      end interface

      interface
        real function bs2dr (ixder, iyder, x, y, kxord,kyord, xknot, yknot, nxcoef, nycoef, bscoef)
          integer    ixder, iyder, kxord, kyord, nxcoef, nycoef
          real       x, y, xknot(*), yknot(*), bscoef(*)
        end function
      end interface

      interface
        real function b22dr (ixder, iyder, x, y, kxord,kyord, xknot, yknot, nxcoef, nycoef, bscoef, wk)
          integer    ixder, iyder, kxord, kyord, nxcoef, nycoef
          real       x, y, xknot(*), yknot(*), bscoef(nxcoef,*), wk(*)
        end function
      end interface

      interface
        subroutine bs2gd (ixder, iyder, nx, xvec, ny, yvec,kxord, kyord, xknot, yknot, nxcoef, nycoef, bscoef,value, ldvalu)
          integer    ixder, iyder, nx, ny, kxord, kyord, nxcoef, nycoef,    &
     &           ldvalu
          real       xvec(*), yvec(*), xknot(*), yknot(*), bscoef(*),       &
     &           value(ldvalu,*)
        end subroutine
      end interface

      interface
        subroutine b22gd (ixder, iyder, nx, xvec, ny, yvec,kxord, kyord, xknot, yknot, nxcoef, nycoef, bscoef,value, ldvalu, leftx, lefty, a, b, dbiatx, dbiaty, bx,by)
          integer    ixder, iyder, nx, ny, kxord, kyord, nxcoef, nycoef,    &
     &           ldvalu, leftx(*), lefty(*)
          real       xvec(*), yvec(*), xknot(*), yknot(*),                  &
     &           bscoef(nxcoef,*), value(ldvalu,*), a(kxord,*),         &
     &           b(kyord,*), dbiatx(kxord,*), dbiaty(kyord,*),          &
     &           bx(kxord,*), by(kyord,*)
        end subroutine
      end interface

      interface
        real function bs2ig (a, b, c, d, kxord, kyord, xknot,yknot, nxcoef, nycoef, bscoef)
          integer    kxord, kyord, nxcoef, nycoef
          real       a, b, c, d, xknot(*), yknot(*), bscoef(*)
        end function
      end interface

      interface
        real function b22ig (a, b, c, d, kxord, kyord, xknot,yknot, nxcoef, nycoef, bscoef, wk)
          integer    kxord, kyord, nxcoef, nycoef
          real       a, b, c, d, xknot(*), yknot(*), bscoef(nxcoef,*),      &
     &           wk(*)
        end function
      end interface

      interface
        real function bs3vl (x, y, z, kxord, kyord, kzord,xknot, yknot, zknot, nxcoef, nycoef, nzcoef, bscoef)
          integer    kxord, kyord, kzord, nxcoef, nycoef, nzcoef
          real       x, y, z, xknot(*), yknot(*), zknot(*), bscoef(*)
        end function
      end interface

      interface
        real function b23vl (x, y, z, kxord, kyord, kzord,xknot, yknot, zknot, nxcoef, nycoef, nzcoef, bscoef,wk)
          integer    kxord, kyord, kzord, nxcoef, nycoef, nzcoef
          real       x, y, z, xknot(*), yknot(*), zknot(*),                 &
     &           bscoef(nxcoef,nycoef,*), wk(*)
        end function
      end interface

      interface
        real function bs3dr (ixder, iyder, izder, x, y, z,kxord, kyord, kzord, xknot, yknot, zknot, nxcoef,nycoef, nzcoef, bscoef)
          integer    ixder, iyder, izder, kxord, kyord, kzord, nxcoef,      &
     &           nycoef, nzcoef
          real       x, y, z, xknot(*), yknot(*), zknot(*), bscoef(*)
        end function
      end interface

      interface
        real function b23dr (ixder, iyder, izder, x, y, z,kxord, kyord, kzord, xknot, yknot, zknot, nxcoef,nycoef, nzcoef, bscoef, wk)
          integer    ixder, iyder, izder, kxord, kyord, kzord, nxcoef,      &
     &           nycoef, nzcoef
          real       x, y, z, xknot(*), yknot(*), zknot(*),                 &
     &           bscoef(nxcoef,nycoef,*), wk(*)
        end function
      end interface

      interface
        subroutine bs3gd (ixder, iyder, izder, nx, xvec, ny,yvec, nz, zvec, kxord, kyord, kzord, xknot, yknot,zknot, nxcoef, nycoef, nzcoef, bscoef, value, ldvalu,mdvalu)
          integer    ixder, iyder, izder, nx, ny, nz, kxord, kyord, kzord,  &
     &           nxcoef, nycoef, nzcoef, ldvalu, mdvalu
          real       xvec(*), yvec(*), zvec(*), xknot(*), yknot(*),         &
     &           zknot(*), bscoef(*), value(ldvalu,mdvalu,*)
        end subroutine
      end interface

      interface
        subroutine b23gd (ixder, iyder, izder, nx, xvec, ny,yvec, nz, zvec, kxord, kyord, kzord, xknot, yknot,zknot, nxcoef, nycoef, nzcoef, bscoef, value, ldvalu,mdvalu, leftx, lefty, leftz, a, b, c, dbiatx, dbiaty,dbiatz, bx, by, bz)
          integer    ixder, iyder, izder, nx, ny, nz, kxord, kyord, kzord,  &
     &           nxcoef, nycoef, nzcoef, ldvalu, mdvalu, leftx(*),      &
     &           lefty(*), leftz(*)
          real       xvec(*), yvec(*), zvec(*), xknot(*), yknot(*),         &
     &           zknot(*), bscoef(nxcoef,nycoef,*),                     &
     &           value(ldvalu,mdvalu,*), a(kxord,*), b(kyord,*),        &
     &           c(kzord,*), dbiatx(kxord,*), dbiaty(kyord,*),          &
     &           dbiatz(kzord,*), bx(kxord,*), by(kyord,*), bz(kzord,*)
        end subroutine
      end interface

      interface
        real function bs3ig (a, b, c, d, e, f, kxord, kyord,kzord, xknot, yknot, zknot, nxcoef, nycoef, nzcoef,bscoef)
          integer    kxord, kyord, kzord, nxcoef, nycoef, nzcoef
          real       a, b, c, d, e, f, xknot(*), yknot(*), zknot(*),        &
     &           bscoef(*)
        end function
      end interface

      interface
        real function b23ig (a, b, c, d, e, f, kxord, kyord,kzord, xknot, yknot, zknot, nxcoef, nycoef, nzcoef,bscoef, wk)
          integer    kxord, kyord, kzord, nxcoef, nycoef, nzcoef
          real       a, b, c, d, e, f, xknot(*), yknot(*), zknot(*),        &
     &           bscoef(*), wk(*)
        end function
      end interface

      interface
        subroutine bscpp (korder, xknot, ncoef, bscoef,nppcf, break, ppcoef)
          integer    korder, ncoef, nppcf
          real       xknot(*), bscoef(*), break(*), ppcoef(*)
        end subroutine
      end interface

      interface
        subroutine b2cpp (korder, xknot, ncoef, bscoef,nppcf, break, ppcoef, wk)
          integer    korder, ncoef, nppcf
          real       xknot(*), bscoef(*), break(*), ppcoef(*), wk(*)
        end subroutine
      end interface

      interface
        real function ppval (x, korder, nintv, break, ppcoef)
          integer    korder, nintv
          real       x, break(*), ppcoef(*)
        end function
      end interface

      interface
        real function ppder (ideriv, x, korder, nintv, break,ppcoef)
          integer    ideriv, korder, nintv
          real       x, break(*), ppcoef(korder,*)
        end function
      end interface

      interface
        subroutine pp1gd (ideriv, n, xvec, korder, nintv,break, ppcoef, value)
          integer    ideriv, n, korder, nintv
          real       xvec(*), break(*), ppcoef(*), value(*)
        end subroutine
      end interface

      interface
        subroutine p21gd (ideriv, n, xvec, korder, nintv,break, ppcoef, value, left, h, p)
          integer    ideriv, n, korder, nintv, left(*)
          real       xvec(*), break(*), ppcoef(korder,*), value(*), h(*),   &
     &           p(*)
        end subroutine
      end interface

      interface
        real function ppitg (a, b, korder, nintv, break,ppcoef)
          integer    korder, nintv
          real       a, b, break(*), ppcoef(korder,*)
        end function
      end interface

      interface
        real function qdval (x, ndata, xdata, fdata, check)
          integer    ndata
          real       x, xdata(*), fdata(*)
          logical    check
        end function
      end interface

      interface
        real function qdder (ideriv, x, ndata, xdata, fdata,check)
          integer    ideriv, ndata
          real       x, xdata(*), fdata(*)
          logical    check
        end function
      end interface

      interface
        real function qd2vl (x, y, nxdata, xdata, nydata,ydata, fdata, ldf, check)
          integer    nxdata, nydata, ldf
          real       x, y, xdata(*), ydata(*), fdata(*)
          logical    check
        end function
      end interface

      interface
        real function qd2dr (ixder, iyder, x, y, nxdata,xdata, nydata, ydata, fdata, ldf, check)
          integer    ixder, iyder, nxdata, nydata, ldf
          real       x, y, xdata(*), ydata(*), fdata(ldf,*)
          logical    check
        end function
      end interface

      interface
        real function qd3vl (x, y, z, nxdata, xdata, nydata,ydata, nzdata, zdata, fdata, ldf, mdf, check)
          integer    nxdata, nydata, nzdata, ldf, mdf
          real       x, y, z, xdata(*), ydata(*), zdata(*), fdata(*)
          logical    check
        end function
      end interface

      interface
        real function qd3dr (ixder, iyder, izder, x, y, z,nxdata, xdata, nydata, ydata, nzdata, zdata, fdata,ldf, mdf, check)
          integer    ixder, iyder, izder, nxdata, nydata, nzdata, ldf, mdf
          real       x, y, z, xdata(*), ydata(*), zdata(*),                 &
     &           fdata(ldf,mdf,*)
          logical    check
        end function
      end interface

      interface
        subroutine surf (ndata, xydata, fdata, nxout, nyout,xout, yout, sur, ldsur)
          integer    ndata, nxout, nyout, ldsur
          real       xydata(2,*), fdata(*), xout(*), yout(*), sur(*)
        end subroutine
      end interface

      interface
        subroutine s2rf (ndata, xydata, fdata, nxout, nyout,xout, yout, sur, ldsur, iwk, wk)
          integer    ndata, nxout, nyout, ldsur, iwk(*)
          real       xydata(2,*), fdata(*), xout(*), yout(*),               &
     &           sur(ldsur,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine fnlsq (f, intcep, nbasis, ndata, xdata,fdata, iwt, weight, a, sse)
          integer    intcep, nbasis, ndata, iwt
          real       f, sse, xdata(*), fdata(*), weight(*), a(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine f2lsq (f, intcep, nbasis, ndata, xdata,fdata, iwt, weight, a, sse, wk)
          integer    intcep, nbasis, ndata, iwt
          real       f, sse, xdata(*), fdata(*), weight(*), a(*), wk(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine bslsq (ndata, xdata, fdata, weight,korder, xknot, ncoef, bscoef)
          integer    ndata, korder, ncoef
          real       xdata(*), fdata(*), weight(*), xknot(*), bscoef(*)
        end subroutine
      end interface

      interface
        subroutine b2lsq (ndata, xdata, fdata, weight,korder, xknot, ncoef, bscoef, wk, xsort, fsort, wsort,ipvt)
          integer    ndata, korder, ncoef, ipvt(*)
          real       xdata(*), fdata(*), weight(*), xknot(*), bscoef(*),    &
     &           wk(*), xsort(*), fsort(*), wsort(*)
        end subroutine
      end interface

      interface
        subroutine bsvls (ndata, xdata, fdata, weight,korder, ncoef, xguess, xknot, bscoef, ssq)
          integer    ndata, korder, ncoef
          real       ssq, xdata(*), fdata(*), weight(*), xguess(*),         &
     &           xknot(*), bscoef(*)
        end subroutine
      end interface

      interface
        subroutine b2vls (ndata, xdata, fdata, weight,korder, ncoef, xguess, xknot, bscoef, ssq, iwk, wk)
          integer    ndata, korder, ncoef, iwk(*)
          real       ssq, xdata(*), fdata(*), weight(*), xguess(*),         &
     &           xknot(*), bscoef(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine conft (ndata, xdata, fdata, weight, nxval,xval, nhard, ider, itype, bl, bu, korder, xknot, ncoef,bscoef)
          integer    ndata, nxval, nhard, korder, ncoef, ider(*), itype(*)
          real       xdata(*), fdata(*), weight(*), xval(*), bl(*), bu(*),  &
     &           xknot(*), bscoef(*)
        end subroutine
      end interface

      interface
        subroutine c2nft (ndata, xdata, fdata, weight, nxval,xval, nhard, ider, itype, bl, bu, korder, xknot, ncoef,bscoef, h, g, a, rhs, wk, iperm, iwk)
          integer    ndata, nhard, nxval, korder, ncoef, ider(*),           &
     &           itype(*), iperm(*), iwk(*)
          real       xdata(*), fdata(*), weight(*), xval(*), bl(*), bu(*),  &
     &           xknot(*), bscoef(*), h(*), g(*), a(*), rhs(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine bsls2 (nxdata, xdata, nydata, ydata,fdata, ldf, kxord, kyord, xknot, yknot, nxcoef, nycoef,xweigh, yweigh, bscoef)
          integer    nxdata, nydata, ldf, kxord, kyord, nxcoef, nycoef
          real       xdata(*), ydata(*), fdata(*), xknot(*), yknot(*),      &
     &           xweigh(*), yweigh(*), bscoef(*)
        end subroutine
      end interface

      interface
        subroutine b2ls2 (nxdata, xdata, nydata, ydata,fdata, ldf, kxord, kyord, xknot, yknot, nxcoef, nycoef,xweigh, yweigh, bscoef, wk)
          integer    nxdata, nydata, ldf, kxord, kyord, nxcoef, nycoef
          real       xdata(*), ydata(*), fdata(*), xknot(*), yknot(*),      &
     &           xweigh(*), yweigh(*), bscoef(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine bsls3 (nxdata, xdata, nydata, ydata,nzdata, zdata, fdata, ldfdat, mdfdat, kxord, kyord,kzord, xknot, yknot, zknot, nxcoef, nycoef, nzcoef,xweigh, yweigh, zweigh, bscoef)
          integer    nxdata, nydata, nzdata, ldfdat, mdfdat, kxord, kyord,  &
     &           kzord, nxcoef, nycoef, nzcoef
          real       xdata(*), ydata(*), zdata(*), fdata(*), xknot(*),      &
     &           yknot(*), zknot(*), xweigh(*), yweigh(*), zweigh(*),   &
     &           bscoef(nxcoef,nycoef,*)
        end subroutine
      end interface

      interface
        subroutine b2ls3 (nxdata, xdata, nydata, ydata,nzdata, zdata, fdata, ldfdat, mdfdat, kxord, kyord,kzord, xknot, yknot, zknot, nxcoef, nycoef, nzcoef,xweigh, yweigh, zweigh, bscoef, wk)
          integer    nxdata, nydata, nzdata, ldfdat, mdfdat, kxord, kyord,  &
     &           kzord, nxcoef, nycoef, nzcoef
          real       zknot(*), xdata(*), ydata(*), zdata(*), fdata(*),      &
     &           xknot(*), yknot(*), xweigh(*), yweigh(*), zweigh(*),   &
     &           bscoef(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine cssed (ndata, xdata, fdata, dis, sc,maxit, sdata)
          integer    ndata, maxit
          real       dis, sc, xdata(*), fdata(*), sdata(*)
        end subroutine
      end interface

      interface
        subroutine c2sed (ndata, xdata, fdata, dis, sc,maxit, sdata, wk, iwk)
          integer    ndata, maxit, iwk(*)
          real       dis, sc, xdata(*), fdata(*), sdata(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine cssmh (ndata, xdata, fdata, weight, smpar,break, cscoef)
          integer    ndata
          real       smpar, xdata(*), fdata(*), weight(*), break(*),        &
     &           cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine c2smh (ndata, xdata, fdata, weight, smpar,break, cscoef, wk, iwk)
          integer    ndata, iwk(*)
          real       smpar, xdata(*), fdata(*), weight(*), break(*),        &
     &           cscoef(4,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine csscv (ndata, xdata, fdata, iequal, break,cscoef)
          integer    ndata, iequal
          real       xdata(*), fdata(*), break(*), cscoef(4,*)
        end subroutine
      end interface

      interface
        subroutine c2scv (ndata, xdata, fdata, iequal, break,cscoef, wk, ywk, iwk)
          integer    ndata, iequal, iwk(*)
          real       xdata(*), fdata(*), break(*), cscoef(4,*),             &
     &           wk(0:ndata+1,7), ywk(*)
        end subroutine
      end interface

      interface
        subroutine ratch (f, phi, weight, a, b, n, m, p, q,error)
          integer    n, m
          real       f, phi, weight, a, b, error, p(*), q(*)
          external   f, phi, weight
        end subroutine
      end interface

      interface
        subroutine r2tch (f, phi, weight, a, b, n, m, p, q,error, itmax, iwk, wk)
          integer    n, m, itmax, iwk(*)
          real       f, phi, weight, a, b, error, p(*), q(*), wk(*)
          external   f, phi, weight
        end subroutine
      end interface

!
!     Chapter 4:  Integration and Differentiation
!

      interface
        subroutine qdag (f, a, b, errabs, errrel, irule,result, errest)
          integer    irule
          real       f, a, b, errabs, errrel, result, errest
          external   f
        end subroutine
      end interface

      interface
        subroutine q2ag (f, a, b, errabs, errrel, irule,result, errest, maxsub, neval, nsubin, alist, blist,rlist, elist, iord)
          integer    irule, maxsub, neval, nsubin, iord(*)
          real       f, a, b, errabs, errrel, result, errest, alist(*),     &
     &           blist(*), rlist(*), elist(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine qdagp (f, a, b, npts, points, errabs,errrel, result, errest)
          integer    npts
          real       f, a, b, errabs, errrel, result, errest, points(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine q2agp (f, a, b, npts, points, errabs,errrel, result, errest, maxsub, neval, nsubin, alist,blist, rlist, elist, iord, level, wk, iwk)
          integer    npts, maxsub, neval, nsubin, iord(*), level(*), iwk(*)
          real       f, a, b, errabs, errrel, result, errest, points(*),    &
     &           alist(*), blist(*), rlist(*), elist(*), wk(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine qdagi (f, bound, interv, errabs, errrel,result, errest)
          integer    interv
          real       f, bound, errabs, errrel, result, errest
          external   f
        end subroutine
      end interface

      interface
        subroutine q2agi (f, bound, interv, errabs, errrel,result, errest, maxsub, neval, nsubin, alist, blist,rlist, elist, iord)
          integer    interv, maxsub, neval, nsubin, iord(*)
          real       f, bound, errabs, errrel, result, errest, alist(*),    &
     &           blist(*), rlist(*), elist(*)
        end subroutine
      end interface

      interface
        subroutine qdawo (f, a, b, iweigh, omega, errabs,errrel, result, errest)
          integer    iweigh
          real       f, a, b, omega, errabs, errrel, result, errest
          external   f
        end subroutine
      end interface

      interface
        subroutine q2awo (f, a, b, iweigh, omega, errabs,errrel, result, errest, maxsub, maxcby, neval, nsubin,alist, blist, rlist, elist, iord, nnlog, wk)
          integer    iweigh, maxsub, maxcby, neval, nsubin, iord(*),        &
     &           nnlog(*)
          real       f, a, b, omega, errabs, errrel, result, errest,        &
     &           alist(*), blist(*), rlist(*), elist(*), wk(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine qdawf (f, a, iweigh, omega, errabs,result, errest)
          integer    iweigh
          real       f, a, omega, errabs, result, errest
          external   f
        end subroutine
      end interface

      interface
        subroutine q2awf (f, a, iweigh, omega, errabs,result, errest, maxcyl, maxsub, maxcby, neval, ncycle,rslist, erlist, ierlst, nsubin, wk, iwk)
          integer    iweigh, maxcyl, maxsub, maxcby, neval, ncycle,         &
     &           nsubin, ierlst(*), iwk(2,*)
          real       f, a, omega, errabs, result, errest, rslist(*),        &
     &           erlist(*), wk(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine qdaws (f, a, b, iweigh, alpha, beta,errabs, errrel, result, errest)
          integer    iweigh
          real       f, a, b, alpha, beta, errabs, errrel, result, errest
          external   f
        end subroutine
      end interface

      interface
        subroutine q2aws (f, a, b, iweigh, alpha, beta,errabs, errrel, result, errest, maxsub, neval, nsubin,alist, blist, rlist, elist, iord)
          integer    iweigh, maxsub, neval, nsubin, iord(*)
          real       f, a, b, alpha, beta, errabs, errrel, result, errest,  &
     &           alist(*), blist(*), rlist(*), elist(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine qdawc (f, a, b, c, errabs, errrel, result,errest)
          real       f, a, b, c, errabs, errrel, result, errest
          external   f
        end subroutine
      end interface

      interface
        subroutine q2awc (f, a, b, c, errabs, errrel, result,errest, maxsub, neval, nsubin, alist, blist, rlist,elist, iord)
          integer    maxsub, neval, nsubin, iord(*)
          real       f, a, b, c, errabs, errrel, result, errest, alist(*),  &
     &           blist(*), rlist(*), elist(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine qdng (f, a, b, errabs, errrel, result,errest)
          real       f, a, b, errabs, errrel, result, errest
          external   f
        end subroutine
      end interface

      interface
        subroutine twodq (f, a, b, g, h, errabs, errrel,irule, result, errest)
          integer    irule
          real       f, a, b, g, h, errabs, errrel, result, errest
          external   f, g, h
        end subroutine
      end interface

      interface
        subroutine t2odq (user, a, b, g, h, errabs, errrel,irule, result, errest, maxsub, neval, nsubin, alist,blist, rlist, elist, iord, wk, iwk)
          integer    irule, maxsub, neval, nsubin, iord(*), iwk(*)
          real       user, a, b, g, h, errabs, errrel, result, errest,      &
     &           alist(*), blist(*), rlist(*), elist(*), wk(*)
          external   user, g, h
        end subroutine
      end interface

      interface
        subroutine qand (f, n, a, b, errabs, errrel, maxfcn,result, errest)
          integer    n, maxfcn
          real       f, errabs, errrel, result, errest, a(*), b(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine gqrul (n, iweigh, alpha, beta, nfix,qxfix, qx, qw)
          integer    n, iweigh, nfix
          real       alpha, beta, qxfix(*), qx(*), qw(*)
        end subroutine
      end interface

      interface
        subroutine g2rul (n, iweigh, alpha, beta, nfix,qxfix, qx, qw, wk)
          integer    n, iweigh, nfix
          real       alpha, beta, qxfix(*), qx(*), qw(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine gqrcf (n, b, c, nfix, qxfix, qx, qw)
          integer    n, nfix
          real       b(*), c(*), qxfix(*), qx(*), qw(*)
        end subroutine
      end interface

      interface
        subroutine g2rcf (n, b, c, nfix, qxfix, qx, qw, wk)
          integer    n, nfix
          real       b(*), c(*), qxfix(*), qx(*), qw(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine reccf (n, iweigh, alpha, beta, b, c)
          integer    n, iweigh
          real       alpha, beta, b(*), c(*)
        end subroutine
      end interface

      interface
        subroutine recqr (n, qx, qw, nterm, b, c)
          integer    n, nterm
          real       qx(*), qw(*), b(*), c(*)
        end subroutine
      end interface

      interface
        subroutine r2cqr (n, qx, qw, nterm, b, c, wk)
          integer    n, nterm
          real       qx(*), qw(*), b(*), c(*), wk(2,*)
        end subroutine
      end interface

      interface
        subroutine fqrul (n, a, b, iweigh, alpha, beta, qx,qw)
          integer    n, iweigh
          real       a, b, alpha, beta, qx(*), qw(*)
        end subroutine
      end interface

      interface
        subroutine f2rul (n, a, b, iweigh, alpha, beta, qx,qw, wk)
          integer    n, iweigh
          real       a, b, alpha, beta, qx(*), qw(*), wk(*)
        end subroutine
      end interface

      interface
        real function deriv (fcn, korder, x, bgstep, tol)
          integer    korder
          real       fcn, x, bgstep, tol
          external   fcn
        end function
      end interface

!
!     Chapter 5:  Differential Equations
!

      interface
        subroutine ivprk (ido, neq, fcn, x, xend, tol, param,y)
          integer    ido, neq
          real       x, xend, tol, param(*), y(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine i2prk (ido, neq, fcn, x, xend, tol, param,y, vnorm, wk)
          integer    ido, neq
          real       x, xend, tol, param(*), y(*), wk(neq,*)
          external   fcn, vnorm
        end subroutine
      end interface

      interface
        subroutine i3prk (neq, v, y, ymax, enorm)
          integer    neq
          real       enorm, v(*), y(*), ymax(*)
        end subroutine
      end interface

      interface
        subroutine ivpag (ido, neq, fcn, fcnj, a, x, xend,tol, param, y)
          integer    ido, neq
          real       x, xend, tol, a(*), param(*), y(*)
          external   fcn, fcnj
        end subroutine
      end interface

      interface
        subroutine i2pag (ido, neq, fcn, fcnj, a, x, xend,tol, param, y, ytemp, ymax, error, save1, save2, pw,ipvt, vnorm)
          integer    ido, neq, ipvt(*)
          real       x, xend, tol, a(*), param(*), y(*), ytemp(*),          &
     &           ymax(*), error(*), save1(*), save2(*), pw(*)
          external   fcn, fcnj, vnorm
        end subroutine
      end interface

      interface
        subroutine bvpfd (fcneqn, fcnjac, fcnbc, fcnpeq,fcnpbc, neqns, nleft, ncupbc, xleft, xright, pistep,tol, ninit, xinit, yinit, ldyini, linear, print,mxgrid, nfinal, xfinal, yfinal, ldyfin, errest)
          integer    neqns, nleft, ncupbc, ninit, ldyini, mxgrid, nfinal,   &
     &           ldyfin
          real       xleft, xright, pistep, tol, xinit(*),                  &
     &           yinit(ldyini,*), xfinal(*), yfinal(ldyfin,*),          &
     &           errest(*)
          logical    linear, print
          external   fcneqn, fcnjac, fcnbc, fcnpeq, fcnpbc
        end subroutine
      end interface

      interface
        subroutine b2pfd (fcneqn, fcnjac, fcnbc, fcnpeq,fcnpbc, neqns, nleft, ncupbc, xleft, xright, pistep,tol, ninit, xinit, yinit, ldyini, linear, print,mxgrid, nfinal, xfinal, yfinal, ldyfin, errest, rwork,iwork)
          integer    neqns, nleft, ncupbc, ninit, ldyini, mxgrid, nfinal,   &
     &           ldyfin, iwork(*)
          real       xleft, xright, pistep, tol, xinit(*),                  &
     &           yinit(ldyini,*), xfinal(*), yfinal(ldyfin,*),          &
     &           errest(*), rwork(*)
          logical    linear, print
          external   fcneqn, fcnjac, fcnbc, fcnpeq, fcnpbc
        end subroutine
      end interface

      interface
        subroutine bvpms (fcneqn, fcnjac, fcnbc, neqns,xleft, xright, dtol, btol, maxit, ninit, xinit, yinit,ldyini, nmax, nfinal, xfinal, yfinal, ldyfin)
          integer    neqns, maxit, ninit, ldyini, nmax, nfinal, ldyfin
          real       xleft, xright, dtol, btol, xinit(*), yinit(ldyini,*),  &
     &           xfinal(*), yfinal(ldyfin,*)
          external   fcneqn, fcnjac, fcnbc
        end subroutine
      end interface

      interface
        subroutine b2pms (fcneqn, fcnjac, fcnbc, neqns,xleft, xright, dtol, btol, maxit, ninit, xinit, yinit,ldyini, nmax, nfinal, xfinal, yfinal, ldyfin, work,iwk)
          integer    neqns, maxit, ninit, ldyini, nmax, nfinal, ldyfin,     &
     &           iwk(*)
          real       xleft, xright, dtol, btol, xinit(*), yinit(ldyini,*),  &
     &           xfinal(*), yfinal(ldyfin,*), work(*)
          external   fcneqn, fcnjac, fcnbc
        end subroutine
      end interface

      interface
        subroutine daspg (neq, t, tout, ido, y, yprime,dgspg)
          integer    neq, ido
          real       t, tout, y(*), yprime(*)
          external   dgspg
        end subroutine
      end interface

      interface
        subroutine d2spg (neq, t, tout, ido, y, yprime,dgspg, djspg, iwork, rwork)
          integer    neq, ido, iwork(*)
          real       t, tout, y(*), yprime(*), rwork(*)
          external   dgspg, djspg
        end subroutine
      end interface

      interface
        subroutine dgspg (n, t, y, ypr, gval)
          integer    n
          real       t, y(n), ypr(n), gval(n)
        end subroutine
      end interface

      interface
        subroutine djspg (n, t, y, ypr, cj, pdg, ldpdg)
          integer    n, ldpdg
          real       t, cj, y(n), ypr(n), pdg(ldpdg*n)
        end subroutine
      end interface

      interface
        subroutine molch (ido, fcnut, fcnbc, npdes, t, tend,nx, xbreak, tol, hinit, y, ldy)
          integer    ido, npdes, nx, ldy
          real       t, tend, tol, hinit, xbreak(*), y(ldy,*)
          external   fcnut, fcnbc
        end subroutine
      end interface

      interface
        subroutine m2lch (ido, fcnut, fcnbc, npdes, t, tend,nx, xbreak, tol, hinit, y, ldy, wk, iwk)
          integer    ido, npdes, nx, ldy, iwk(*)
          real       t, tend, tol, hinit, xbreak(*), y(ldy,*), wk(*)
          external   fcnut, fcnbc
        end subroutine
      end interface

      interface
        subroutine fps2h (prhs, brhs, coefu, nx, ny, ax, bx,ay, by, ibcty, iorder, u, ldu)
          integer    nx, ny, iorder, ldu, ibcty(*)
          real       prhs, brhs, coefu, ax, bx, ay, by, u(ldu,*)
          external   prhs, brhs
        end subroutine
      end interface

      interface
        subroutine f2s2h (prhs, brhs, coefu, nx, ny, ax, bx,ay, by, ibcty, iorder, u, ldu, uwork, work)
          integer    nx, ny, iorder, ldu, ibcty(*)
          real       coefu, ax, bx, ay, by, u(ldu,*), uwork(*), work(*),    &
     &           prhs, brhs
          external   prhs, brhs
        end subroutine
      end interface

      interface
        subroutine fps3h (prhs, brhs, coefu, nx, ny, nz, ax,bx, ay, by, az, bz, ibcty, iorder, u, ldu, mdu)
          integer    nx, ny, nz, iorder, ldu, mdu, ibcty(*)
          real       prhs, brhs, coefu, ax, bx, ay, by, az, bz,             &
     &           u(ldu,mdu,*)
          external   prhs, brhs
        end subroutine
      end interface

      interface
        subroutine f2s3h (prhs, brhs, coefu, nx, ny, nz, ax,bx, ay, by, az, bz, ibcty, iorder, u, ldu, mdu, uwork,work)
          integer    nx, ny, nz, iorder, ldu, mdu, ibcty(*)
          real       prhs, brhs, coefu, ax, bx, ay, by, az, bz,             &
     &           u(ldu,mdu,*), uwork(*), work(*)
          external   prhs, brhs
        end subroutine
      end interface

!
!     Chapter 6:  Transforms
!

      interface
        subroutine fftcf (n, seq, coef)
          integer    n
          complex    seq(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine f2tcf (n, seq, coef, wfftc, cpy)
          integer    n
          real       wfftc(*), cpy(*)
          complex    seq(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine fftcb (n, coef, seq)
          integer    n
          complex    coef(*), seq(*)
        end subroutine
      end interface

      interface
        subroutine f2tcb (n, coef, seq, wfftc, cpy)
          integer    n
          real       wfftc(*), cpy(*)
          complex    coef(*), seq(*)
        end subroutine
      end interface

      interface
        subroutine fftci (n, wfftc)
          integer    n
          real       wfftc(*)
        end subroutine
      end interface

      interface
        subroutine fsint (n, seq, coef)
          integer    n
          real       seq(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine f2int (n, seq, coef, wfsin)
          integer    n
          real       seq(*), coef(*), wfsin(*)
        end subroutine
      end interface

      interface
        subroutine fsini (n, wfsin)
          integer    n
          real       wfsin(*)
        end subroutine
      end interface

      interface
        subroutine fcost (n, seq, coef)
          integer    n
          real       seq(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine f2ost (n, seq, coef, wfcos)
          integer    n
          real       seq(*), coef(*), wfcos(*)
        end subroutine
      end interface

      interface
        subroutine fcosi (n, wfcos)
          integer    n
          real       wfcos(*)
        end subroutine
      end interface

      interface
        subroutine qsinf (n, seq, coef)
          integer    n
          real       seq(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine q2inf (n, seq, coef, wqsin)
          integer    n
          real       seq(*), coef(*), wqsin(*)
        end subroutine
      end interface

      interface
        subroutine qsinb (n, coef, seq)
          integer    n
          real       coef(*), seq(*)
        end subroutine
      end interface

      interface
        subroutine q2inb (n, coef, seq, wqsin)
          integer    n
          real       coef(*), seq(*), wqsin(*)
        end subroutine
      end interface

      interface
        subroutine qsini (n, wqsin)
          integer    n
          real       wqsin(*)
        end subroutine
      end interface

      interface
        subroutine qcosf (n, seq, coef)
          integer    n
          real       seq(*), coef(*)
        end subroutine
      end interface

      interface
        subroutine q2osf (n, seq, coef, wqcos)
          integer    n
          real       seq(*), coef(*), wqcos(*)
        end subroutine
      end interface

      interface
        subroutine qcosb (n, coef, seq)
          integer    n
          real       coef(*), seq(*)
        end subroutine
      end interface

      interface
        subroutine q2osb (n, coef, seq, wqcos)
          integer    n
          real       coef(*), seq(*), wqcos(*)
        end subroutine
      end interface

      interface
        subroutine qcosi (n, wqcos)
          integer    n
          real       wqcos(*)
        end subroutine
      end interface

      interface
        subroutine fft2d (nra, nca, a, lda, coef, ldcoef)
          integer    nra, nca, lda, ldcoef
          complex    a(lda,*), coef(ldcoef,*)
        end subroutine
      end interface

      interface
        subroutine f2t2d (nra, nca, a, lda, coef, ldcoef,wff1, wff2, cwk, cpy)
          integer    nra, nca, lda, ldcoef
          real       wff1(*), wff2(*), cpy(*)
          complex    a(lda,*), coef(ldcoef,*), cwk(*)
        end subroutine
      end interface

      interface
        subroutine fft2b (nrcoef, nccoef, coef, ldcoef, a,lda)
          integer    nrcoef, nccoef, ldcoef, lda
          complex    coef(ldcoef,*), a(lda,*)
        end subroutine
      end interface

      interface
        subroutine f2t2b (nrcoef, nccoef, a, lda, coef,ldcoef, wff1, wff2, cwk, cpy)
          integer    nrcoef, nccoef, lda, ldcoef
          real       wff1(*), wff2(*), cpy(*)
          complex    a(lda,*), coef(ldcoef,*), cwk(*)
        end subroutine
      end interface

      interface
        subroutine fft3f (n1, n2, n3, a, lda, mda, b, ldb,mdb)
          integer    n1, n2, n3, lda, mda, ldb, mdb
          complex    a(*), b(*)
        end subroutine
      end interface

      interface
        subroutine f2t3f (n1, n2, n3, a, lda, mda, b, ldb,mdb, wff1, wff2, wff3, cpy)
          integer    lda, mda, ldb, mdb, n1, n2, n3
          real       wff1(*), wff2(*), wff3(*), cpy(*)
          complex    a(lda,mda,*), b(lda,mda,*)
        end subroutine
      end interface

      interface
        subroutine fft3b (n1, n2, n3, a, lda, mda, b, ldb,mdb)
          integer    n1, n2, n3, lda, mda, ldb, mdb
          complex    a(*), b(*)
        end subroutine
      end interface

      interface
        subroutine f2t3b (n1, n2, n3, a, lda, mda, b, ldb,mdb, wff1, wff2, wff3, cpy)
          integer    n1, n2, n3, lda, mda, ldb, mdb
          real       wff1(*), wff2(*), wff3(*), cpy(*)
          complex    a(lda,mda,*), b(lda,mda,*)
        end subroutine
      end interface

      interface
        subroutine rconv (ido, nx, x, ny, y, ipad, nz, z,zhat)
          integer    ido, nx, ny, ipad, nz
          real       x(*), y(*), z(*), zhat(*)
        end subroutine
      end interface

      interface
        subroutine r2onv (ido, nx, x, ny, y, ipad, nz, z,zhat, xwk, ywk, wk)
          integer    ido, nx, ny, ipad, nz
          real       x(*), y(*), z(*), zhat(*), xwk(*), ywk(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine cconv (ido, nx, x, ny, y, ipad, nz, z,zhat)
          integer    ido, nx, ny, ipad, nz
          complex    x(*), y(*), z(*), zhat(*)
        end subroutine
      end interface

      interface
        subroutine c2onv (ido, nx, x, ny, y, ipad, nz, z,zhat, xwk, ywk, wk)
          integer    ido, nx, ny, ipad, nz
          real       wk(*)
          complex    x(*), y(*), z(*), zhat(*), xwk(*), ywk(*)
        end subroutine
      end interface

      interface
        subroutine rcorl (ido, n, x, y, ipad, nz, z, zhat)
          integer    ido, n, ipad, nz
          real       x(*), y(*), z(*), zhat(*)
        end subroutine
      end interface

      interface
        subroutine r2orl (ido, n, x, y, ipad, nz, z, zhat,xwk, ywk, wk)
          integer    n, ipad, ido, nz
          real       x(*), y(*), z(*), zhat(*), xwk(*), ywk(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine ccorl (ido, n, x, y, ipad, nz, z, zhat)
          integer    ido, n, ipad, nz
          complex    x(*), y(*), z(*), zhat(*)
        end subroutine
      end interface

      interface
        subroutine c2orl (ido, n, x, y, ipad, nz, z, zhat,xwk, ywk, wk)
          integer    ido, n, ipad, nz
          real       wk(*)
          complex    x(*), y(*), z(*), zhat(*), xwk(*), ywk(*)
        end subroutine
      end interface

      interface
        subroutine inlap (f, n, t, alpha, relerr, kmax, finv)
          integer    n, kmax
          real       alpha, relerr, t(*), finv(*)
          complex    f
          external   f
        end subroutine
      end interface

      interface
        subroutine sinlp (f, n, t, sigma0, epstol, errvec,finv)
          integer    n
          real       sigma0, epstol, t(*), errvec(*), finv(*)
          complex    f
          external   f
        end subroutine
      end interface

      interface
        subroutine s2nlp (f, n, t, sigma0, epstol, errvec,finv, sigma, bvalue, mtop, wk, iflovc)
          integer    n, mtop, iflovc(*)
          real       sigma0, epstol, sigma, bvalue, t(*), errvec(*),        &
     &           finv(*), wk(*)
          complex    f
          external   f
        end subroutine
      end interface

!
!     Chapter 7:  Nonlinear Equations
!

      interface
        subroutine zplrc (ndeg, coeff, root)
          integer    ndeg
          real       coeff(*)
          complex    root(*)
        end subroutine
      end interface

      interface
        subroutine zporc (ndeg, coeff, root)
          integer    ndeg
          real       coeff(*)
          complex    root(*)
        end subroutine
      end interface

      interface
        subroutine zpocc (ndeg, coeff, root)
          integer    ndeg
          complex    coeff(*), root(*)
        end subroutine
      end interface

      interface
        subroutine zanly (f, errabs, errrel, nknown, nnew,nguess, xinit, itmax, x, infer)
          integer    nknown, nnew, nguess, itmax, infer(*)
          real       errabs, errrel
          complex    f, xinit(*), x(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine zbren (f, errabs, errrel, a, b, maxfn)
          integer    maxfn
          real       f, errabs, errrel, a, b
          external   f
        end subroutine
      end interface

      interface
        subroutine zreal (f, errabs, errrel, eps, eta, nroot,itmax, xguess, x, infer)
          integer    nroot, itmax, infer(*)
          real       f, errabs, errrel, eps, eta, xguess(*), x(*)
          external   f
        end subroutine
      end interface

      interface
        subroutine neqnf (fcn, errrel, n, itmax, xinit, x,fnorm)
          integer    n, itmax
          real       errrel, fnorm, xinit(*), x(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine n2qnf (fcn, errrel, n, itmax, xinit, x,fnorm, fvec, fjac, r, qtf, wk)
          integer    n, itmax
          real       errrel, fnorm, xinit(*), x(*), fvec(*), fjac(n,*),     &
     &           r(*), qtf(*), wk(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine neqnj (fcn, lsjac, errrel, n, itmax,xinit, x, fnorm)
          integer    n, itmax
          real       errrel, fnorm, xinit(*), x(*)
          external   fcn, lsjac
        end subroutine
      end interface

      interface
        subroutine n2qnj (fcn, lsjac, errrel, n, itmax,xinit, x, fnorm, fvec, fjac, r, qtf, wk)
          integer    n, itmax
          real       errrel, fnorm, xinit(*), x(*), fvec(*), fjac(n,*),     &
     &           r(*), qtf(*), wk(*)
          external   fcn, lsjac
        end subroutine
      end interface

      interface
        subroutine neqbf (fcn, n, xguess, xscale, fscale,iparam, rparam, x, fvec)
          integer    n, iparam(*)
          real       xguess(*), xscale(*), fscale(*), rparam(*), x(*),      &
     &           fvec(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine n2qbf (fcn, n, xguess, xscale, fscale,iparam, rparam, x, fvec, wk, lwk)
          integer    n, lwk, iparam(*)
          real       xguess(*), xscale(*), fscale(*), rparam(*), x(*),      &
     &           fvec(*), wk(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine neqbj (fcn, jac, n, xguess, xscale,fscale, iparam, rparam, x, fvec)
          integer    n, iparam(*)
          real       xguess(*), xscale(*), fscale(*), rparam(*), x(*),      &
     &           fvec(*)
          external   fcn, jac
        end subroutine
      end interface

      interface
        subroutine n2qbj (fcn, jac, n, xguess, xscale,fscale, iparam, rparam, x, fvec, wk, lwk)
          integer    n, lwk, iparam(*)
          real       xguess(*), xscale(*), fscale(*), rparam(*), x(*),      &
     &           fvec(*), wk(*)
          external   fcn, jac
        end subroutine
      end interface

      interface
        subroutine n4qbj (iparam, rparam)
          integer    iparam(*)
          real       rparam(*)
        end subroutine
      end interface

!
!     Chapter 8:  Optimization
!

      interface
        subroutine uvmif (f, xguess, step, bound, xacc,maxfn, x)
          integer    maxfn
          real       f, xguess, step, bound, xacc, x
        end subroutine
      end interface

      interface
        subroutine uvmid (f, g, xguess, errrel, gtol, maxfn,a, b, x, fx, gx)
          integer    maxfn
          real       f, g, xguess, errrel, gtol, a, b, x, fx, gx
          external   f, g
        end subroutine
      end interface

      interface
        subroutine uvmgs (f, a, b, tol, xmin)
          real       f, a, b, tol, xmin
          external   f
        end subroutine
      end interface

      interface
        subroutine uming (fcn, grad, n, xguess, xscale,fscale, iparam, rparam, x, fvalue)
          integer    n, iparam(*)
          real       fscale, fvalue, xguess(*), xscale(*), rparam(*), x(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine u2ing (fcn, grad, n, xguess, xscale,fscale, iparam, rparam, x, fvalue, wk)
          integer    n, iparam(*)
          real       xguess(*), fscale, fvalue, xscale(*), rparam(*),       &
     &           x(*), wk(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine umidh (fcn, grad, n, xguess, xscale,fscale, iparam, rparam, x, fvalue)
          integer    n, iparam(*)
          real       fscale, fvalue, xguess(*), xscale(*), rparam(*), x(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine u2idh (fcn, grad, n, xguess, xscale,fscale, iparam, rparam, x, fvalue, wk)
          integer    n, iparam(*)
          real       fscale, fvalue, xguess(*), xscale(*), rparam(*),       &
     &           x(*), wk(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine umiah (fcn, grad, hess, n, xguess, xscale,fscale, iparam, rparam, x, fvalue)
          integer    n, iparam(*)
          real       fscale, fvalue, xguess(*), xscale(*), rparam(*), x(*)
          external   fcn, grad, hess
        end subroutine
      end interface

      interface
        subroutine u2iah (fcn, grad, hess, n, xguess, xscale,fscale, iparam, rparam, x, fvalue, wk)
          integer    n, iparam(*)
          real       fscale, fvalue, xguess(*), xscale(*), rparam(*),       &
     &           x(*), wk(*)
          external   fcn, grad, hess
        end subroutine
      end interface

      interface
        subroutine umcgf (fcn, n, xguess, xscale, gradtl,maxfn, dfpred, x, g, fvalue)
          integer    n, maxfn
          real       gradtl, dfpred, fvalue, xguess(*), xscale(*), x(*),    &
     &           g(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine u2cgf (fcn, n, xguess, xscale, gradtl,maxfn, dfpred, x, g, fvalue, s, rss, rsg, ginit, xopt,gopt)
          integer    n, maxfn
          real       gradtl, dfpred, fvalue, xguess(*), xscale(*), x(*),    &
     &           g(*), s(*), rss(*), rsg(*), ginit(*), xopt(*), gopt(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine umcgg (fcn, grad, n, xguess, gradtl,maxfn, dfpred, x, g, fvalue)
          integer    n, maxfn
          real       gradtl, dfpred, fvalue, xguess(*), x(*), g(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine u2cgg (fcn, grad, n, xguess, gradtl,maxfn, dfpred, x, g, fvalue, s, rss, rsg, ginit, xopt,gopt)
          integer    n, maxfn
          real       gradtl, dfpred, fvalue, xguess(*), x(*), g(*), s(*),   &
     &           rss(*), rsg(*), ginit(*), xopt(*), gopt(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine umpol (fcn, n, xguess, s, ftol, maxfcn, x,fvalue)
          integer    n, maxfcn
          real       s, ftol, fvalue, xguess(*), x(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine u2pol (fcn, n, xguess, s, ftol, maxfcn, x,fvalue, wk)
          integer    n, maxfcn
          real       s, ftol, fvalue, xguess(*), x(*), wk(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine unlsf (fcn, m, n, xguess, xscale, fscale,iparam, rparam, x, fvec, fjac, ldfjac)
          integer    m, n, ldfjac, iparam(*)
          real       xguess(*), xscale(*), fscale(*), rparam(*), x(*),      &
     &           fvec(*), fjac(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine u2lsf (fcn, m, n, xguess, xscale, fscale,iparam, rparam, x, fvec, fjac, ldfjac, wk, iwk)
          integer    m, n, ldfjac, iparam(*), iwk(*)
          real       xguess(*), xscale(*), fscale(*), rparam(*), x(*),      &
     &           fvec(*), fjac(*), wk(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine u4lsf (iparam, rparam)
          integer    iparam(*)
          real       rparam(*)
        end subroutine
      end interface

      interface
        subroutine unlsj (fcn, jac, m, n, xguess, xscale,fscale, iparam, rparam, x, fvec, fjac, ldfjac)
          integer    m, n, ldfjac, iparam(*)
          real       xguess(*), xscale(*), fscale(*), rparam(*), x(*),      &
     &           fvec(*), fjac(ldfjac,*)
          external   fcn, jac
        end subroutine
      end interface

      interface
        subroutine u2lsj (fcn, jac, m, n, xguess, xscale,fscale, iparam, rparam, x, fvec, fjac, ldfjac, wk, iwk)
          integer    m, n, ldfjac, iparam(*), iwk(*)
          real       xguess(*), xscale(*), fscale(*), rparam(*), x(*),      &
     &           fvec(*), fjac(ldfjac,*), wk(*)
          external   fcn, jac
        end subroutine
      end interface

      interface
        subroutine bconf (fcn, n, xguess, ibtype, xlb, xub,xscale, fscale, iparam, rparam, x, fvalue)
          integer    n, ibtype, iparam(*)
          real       fscale, fvalue, xguess(*), xlb(*), xub(*), xscale(*),  &
     &           rparam(*), x(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine b2onf (fcn, n, xguess, ibtype, xlb, xub,xscale, fscale, iparam, rparam, x, fvalue, wk, iwk)
          integer    n, ibtype, iparam(*), iwk(*)
          real       fscale, fvalue, xguess(*), xlb(*), xub(*), xscale(*),  &
     &           rparam(*), x(*), wk(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine bcong (fcn, grad, n, xguess, ibtype, xlb,xub, xscale, fscale, iparam, rparam, x, fvalue)
          integer    n, ibtype, iparam(*)
          real       fscale, fvalue, xguess(*), xlb(*), xub(*), xscale(*),  &
     &           rparam(*), x(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine b2ong (fcn, grad, n, xguess, ibtype, xlb,xub, xscale, fscale, iparam, rparam, x, fvalue, wk,iwk)
          integer    n, ibtype, iparam(*), iwk(*)
          real       fscale, fvalue, xguess(*), xlb(*), xub(*), xscale(*),  &
     &           rparam(*), x(*), wk(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine bcodh (fcn, grad, n, xguess, ibtype, xlb,xub, xscale, fscale, iparam, rparam, x, fvalue)
          integer    n, ibtype, iparam(*)
          real       fscale, fvalue, xguess(*), xlb(*), xub(*), xscale(*),  &
     &           rparam(*), x(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine b2odh (fcn, grad, n, xguess, ibtype, xlb,xub, xscale, fscale, iparam, rparam, x, fvalue, wk,iwk)
          integer    n, ibtype, iparam(*), iwk(*)
          real       fscale, fvalue, xguess(*), xlb(*), xub(*), xscale(*),  &
     &           rparam(*), x(*), wk(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine bcoah (fcn, grad, hess, n, xguess, ibtype,xlb, xub, xscale, fscale, iparam, rparam, x, fvalue)
          integer    n, ibtype, iparam(*)
          real       fscale, fvalue, xguess(*), xlb(*), xub(*), xscale(*),  &
     &           rparam(*), x(*)
          external   fcn, grad, hess
        end subroutine
      end interface

      interface
        subroutine b2oah (fcn, grad, hess, n, xguess, ibtype,xlb, xub, xscale, fscale, iparam, rparam, x, fvalue,wk, iwk)
          integer    n, ibtype, iparam(*), iwk(*)
          real       fscale, fvalue, xguess(*), xlb(*), xub(*), xscale(*),  &
     &           rparam(*), x(*), wk(*)
          external   fcn, grad, hess
        end subroutine
      end interface

      interface
        subroutine bcpol (fcn, n, xguess, ibtype, xlb, xub,ftol, maxfcn, x, fvalue)
          integer    n, ibtype, maxfcn
          real       ftol, fvalue, xguess(*), xlb(*), xub(*), x(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine b2pol (fcn, n, xguess, ibtype, xlb, xub,ftol, maxfcn, x, fvalue, wk)
          integer    n, ibtype, maxfcn
          real       ftol, fvalue, xguess(*), xlb(*), xub(*), x(*), wk(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine bclsf (fcn, m, n, xguess, ibtype, xlb,xub, xscale, fscale, iparam, rparam, x, fvec, fjac,ldfjac)
          integer    m, n, ibtype, ldfjac, iparam(*)
          real       xguess(*), xlb(*), xub(*), xscale(*), fscale(*),       &
     &           rparam(*), x(*), fvec(*), fjac(ldfjac,*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine b2lsf (fcn, m, n, xguess, ibtype, xlb,xub, xscale, fscale, iparam, rparam, x, fvec, fjac,ldfjac, wk, iwk)
          integer    m, n, ibtype, ldfjac, iparam(*), iwk(*)
          real       xguess(*), xlb(*), xub(*), xscale(*), fscale(*),       &
     &           rparam(*), x(*), fvec(*), fjac(*), wk(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine bclsj (fcn, jac, m, n, xguess, ibtype,xlb, xub, xscale, fscale, iparam, rparam, x, fvec,fjac, ldfjac)
          integer    m, n, ibtype, ldfjac, iparam(*)
          real       xguess(*), xlb(*), xub(*), xscale(*), fscale(*),       &
     &           rparam(*), x(*), fvec(*), fjac(ldfjac,*)
          external   fcn, jac
        end subroutine
      end interface

      interface
        subroutine b2lsj (fcn, jac, m, n, xguess, ibtype,xlb, xub, xscale, fscale, iparam, rparam, x, fvec,fjac, ldfjac, wk, iwk)
          integer    m, n, ibtype, ldfjac, iparam(*), iwk(*)
          real       xguess(*), xlb(*), xub(*), xscale(*), fscale(*),       &
     &           rparam(*), x(*), fvec(*), fjac(ldfjac,*), wk(*)
          external   fcn, jac
        end subroutine
      end interface

      interface
        subroutine dlprs (m, nvar, a, lda, bl, bu, c, irtype,xlb, xub, obj, xsol, dsol)
          integer    m, nvar, lda, irtype(*)
          real       obj, a(lda,*), bl(*), bu(*), c(*), xlb(*), xub(*),     &
     &           xsol(*), dsol(*)
        end subroutine
      end interface

      interface
        subroutine d2prs (m, nvar, a, lda, bl, bu, c, irtype,xlb, xub, obj, xsol, dsol, awk, ldawk, wk, iwk)
          integer    m, nvar, lda, ldawk, irtype(*), iwk(*)
          real       obj, a(lda,*), bl(*), bu(*), c(*), xlb(*), xub(*),     &
     &           xsol(*), dsol(*), awk(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine qprog (nvar, ncon, neq, a, lda, b, g, h,ldh, diag, sol, nact, iact, alamda)
          integer    nvar, ncon, neq, lda, ldh, nact, iact(*)
          real       diag, a(lda,*), b(*), g(*), h(ldh,*), sol(*),          &
     &           alamda(*)
        end subroutine
      end interface

      interface
        subroutine q2rog (nvar, ncon, neq, a, lda, b, grad,h, ldh, diag, sol, nact, iact, alamda, wk)
          integer    nvar, ncon, neq, lda, ldh, nact, iact(*)
          real       diag, a(lda,*), b(*), grad(*), h(ldh,*), sol(*),       &
     &           alamda(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine lconf (fcn, nvar, ncon, neq, a, lda, b,xlb, xub, xguess, acc, maxfcn, sol, obj, nact, iact,alamda)
          integer    nvar, ncon, neq, lda, maxfcn, nact, iact(*)
          real       acc, obj, a(lda,*), b(*), xlb(*), xub(*), xguess(*),   &
     &           sol(*), alamda(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine l2onf (fcn, n, m, meq, a, ia, b, xl, xu,x, acc, maxfcn, sol, obj, nact, iact, par, iprint,info, w)
          integer    n, m, meq, ia, maxfcn, nact, iprint, info, iact(*)
          real       acc, obj, a(ia,*), b(*), xl(*), xu(*), x(*), sol(*),   &
     &           par(*), w(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine lcong (fcn, grad, nvar, ncon, neq, a, lda,b, xlb, xub, xguess, acc, maxfcn, sol, obj, nact, iact,alamda)
          integer    nvar, ncon, neq, lda, maxfcn, nact, iact(*)
          real       acc, obj, a(lda,*), b(*), xlb(*), xub(*), xguess(*),   &
     &           sol(*), alamda(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine l2ong (fcn, grad, n, m, meq, a, ia, b, xl,xu, x, acc, maxfcn, sol, obj, nact, iact, par, iprint,info, w)
          integer    n, m, meq, ia, maxfcn, nact, iprint, info, iact(*)
          real       acc, obj, a(ia,*), b(*), xl(*), xu(*), x(*), sol(*),   &
     &           par(*), w(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine nconf (fcn, m, me, n, xguess, ibtype, xlb,xub, xscale, iprint, maxitn, x, fvalue)
          integer    m, me, n, ibtype, iprint, maxitn
          real       fvalue, xguess(*), xlb(*), xub(*), xscale(*), x(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine n2onf (fcns, m, me, n, xguess, ibtype,xlb, xub, xscale, iprint, maxitn, x, fvalue, wk, lwk,iwk, liwk, conwk)
          integer    m, me, n, ibtype, iprint, maxitn, lwk, liwk, iwk(*)
          real       fvalue, xguess(*), xlb(*), xub(*), xscale(*), x(*),    &
     &           wk(*), conwk(*)
          external   fcns
        end subroutine
      end interface

      interface
        subroutine n0onf (ido, m, me, n, ibtype, xlb, xub,iprint, maxitn, x, fvalue, g, df, dg, lddg, u, c, ldc,d, acc, scbou, maxfun, active, mode, wk, iwk, conwk)
          integer    ido, m, me, n, ibtype, iprint, maxitn, lddg, ldc,      &
     &           maxfun, mode, iwk(*)
          real       fvalue, acc, scbou, xlb(*), xub(*), x(*), g(*),        &
     &           df(*), dg(lddg,*), u(*), c(ldc,*), d(*), wk(*),        &
     &           conwk(*)
          logical    active(*)
        end subroutine
      end interface

      interface
        subroutine ncong (fcn, grad, m, me, n, xguess,ibtype, xlb, xub, iprint, maxitn, x, fvalue)
          integer    m, me, n, ibtype, iprint, maxitn
          real       fvalue, xguess(*), xlb(*), xub(*), x(*)
          external   fcn, grad
        end subroutine
      end interface

      interface
        subroutine n2ong (fcns, grad, m, me, n, xguess,ibtype, xlb, xub, iprint, maxitn, x, fvalue, wk, lwk,iwk, liwk)
          integer    m, me, n, ibtype, iprint, maxitn, lwk, liwk, iwk(*)
          real       fvalue, xguess(*), xlb(*), xub(*), x(*), wk(*)
          external   fcns, grad
        end subroutine
      end interface

      interface
        subroutine cdgrd (fcn, n, xc, xscale, epsfcn, gc)
          integer    n
          real       epsfcn, xc(*), xscale(*), gc(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine fdgrd (fcn, n, xc, xscale, fc, epsfcn, gc)
          integer    n
          real       fc, epsfcn, xc(*), xscale(*), gc(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine fdhes (fcn, n, xc, xscale, fc, epsfcn, h,ldh)
          integer    n, ldh
          real       fc, epsfcn, xc(*), xscale(*), h(ldh,*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine f2hes (fcn, n, xc, xscale, fc, epsfcn, h,ldh, stepsz, fneibr)
          integer    n, ldh
          real       fc, epsfcn, xc(*), xscale(*), h(ldh,*), stepsz(*),     &
     &           fneibr(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine gdhes (grad, n, xc, xscale, gc, epsfcn, h,ldh)
          integer    n, ldh
          real       epsfcn, xc(*), xscale(*), gc(*), h(ldh,*)
          external   grad
        end subroutine
      end interface

      interface
        subroutine g2hes (grad, n, xc, xscale, gc, epsfcn, h,ldh, wk)
          integer    n, ldh
          real       epsfcn, xc(*), xscale(*), gc(*), h(ldh,*), wk(*)
          external   grad
        end subroutine
      end interface

      interface
        subroutine fdjac (fcn, m, n, xc, xscale, fc, epsfcn,fjac, ldfjac)
          integer    m, n, ldfjac
          real       epsfcn, xc(*), xscale(*), fc(*), fjac(ldfjac,*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine f2jac (fcn, m, n, xc, xscale, fc, epsfcn,fjac, ldfjac, work)
          integer    m, n, ldfjac
          real       epsfcn, xc(*), xscale(*), fc(*), fjac(ldfjac,*),       &
     &           work(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine chgrd (fcn, grad, n, x, info)
          integer    n, info(*)
          real       grad(*), x(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine c2grd (fcn, grad, n, x, info, fx, xscale,epsfcn, xnew)
          integer    n, info(*)
          real       fx, epsfcn, grad(*), x(*), xscale(*), xnew(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine chhes (grad, hess, n, x, info, ldinfo)
          integer    n, ldinfo, info(ldinfo,*)
          real       x(*)
          external   grad, hess
        end subroutine
      end interface

      interface
        subroutine c2hes (grad, hess, n, x, info, ldinfo, gx,hx, hs, xscale, epsfcn, inft, xnew)
          integer    n, ldinfo, info(ldinfo,*), inft(*)
          real       epsfcn, x(*), gx(*), hx(n,*), hs(*), xscale(*),        &
     &           xnew(*)
          external   grad, hess
        end subroutine
      end interface

      interface
        subroutine chjac (fcn, jac, m, n, x, info, ldinfo)
          integer    m, n, ldinfo, info(ldinfo,*)
          real       x(*)
          external   fcn, jac
        end subroutine
      end interface

      interface
        subroutine c2jac (fcn, jac, m, n, x, info, ldinfo,fx, fjac, grad, xscale, epsfcn, inft, xnew)
          integer    m, n, ldinfo, info(ldinfo,*), inft(*)
          real       epsfcn, x(*), fx(*), fjac(m,*), grad(*), xscale(*),    &
     &           xnew(*)
          external   fcn, jac
        end subroutine
      end interface

      interface
        subroutine ggues (n, a, b, k, ido, s)
          integer    n, k, ido
          real       a(*), b(*), s(*)
        end subroutine
      end interface

      interface
        subroutine g2ues (n, a, b, k, ido, s, wk, iwk)
          integer    n, k, ido, iwk(*)
          real       a(*), b(*), s(*), wk(*)
        end subroutine
      end interface

!
!     Chapter 9:  Basic Matrix/Vector Operations
!

      interface
        subroutine crgrg (n, a, lda, b, ldb)
          integer    n, lda, ldb
          real       a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine ccgcg (n, a, lda, b, ldb)
          integer    n, lda, ldb
          complex    a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine crbrb (n, a, lda, nlca, nuca, b, ldb,nlcb, nucb)
          integer    n, lda, nlca, nuca, ldb, nlcb, nucb
          real       a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine ccbcb (n, a, lda, nlca, nuca, b, ldb,nlcb, nucb)
          integer    n, lda, nlca, nuca, ldb, nlcb, nucb
          complex    a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine crgrb (n, a, lda, nlc, nuc, b, ldb)
          integer    n, lda, nlc, nuc, ldb
          real       a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine crbrg (n, a, lda, nlc, nuc, b, ldb)
          integer    n, lda, nlc, nuc, ldb
          real       a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine ccgcb (n, a, lda, nlc, nuc, b, ldb)
          integer    n, lda, nlc, nuc, ldb
          complex    a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine ccbcg (n, a, lda, nlc, nuc, b, ldb)
          integer    n, lda, nlc, nuc, ldb
          complex    a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine crgcg (n, a, lda, b, ldb)
          integer    n, lda, ldb
          real       a(lda,*)
          complex    b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine crrcr (nra, nca, a, lda, nrb, ncb, b, ldb)
          integer    nra, nca, lda, nrb, ncb, ldb
          real       a(lda,*)
          complex    b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine crbcb (n, a, lda, nlca, nuca, b, ldb,nlcb, nucb)
          integer    n, lda, nlca, nuca, ldb, nlcb, nucb
          real       a(lda,*)
          complex    b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine csfrg (n, a, lda)
          integer    n, lda
          real       a(lda,*)
        end subroutine
      end interface

      interface
        subroutine chfcg (n, a, lda)
          integer    n, lda
          complex    a(lda,*)
        end subroutine
      end interface

      interface
        subroutine csbrb (n, a, lda, nuca, b, ldb, nlcb,nucb)
          integer    n, lda, nuca, ldb, nlcb, nucb
          real       a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine chbcb (n, a, lda, nuca, b, ldb, nlcb,nucb)
          integer    n, lda, nuca, ldb, nlcb, nucb
          complex    a(lda,*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine mxytf (nra, nca, a, lda, nrb, ncb, b, ldb,nrc, ncc, c, ldc)
          integer    nra, nca, lda, nrb, ncb, ldb, nrc, ncc, ldc
          real       a(lda,*), b(ldb,*), c(ldc,*)
        end subroutine
      end interface

      interface
        subroutine mcrcr (nra, nca, a, lda, nrb, ncb, b, ldb,nrc, ncc, c, ldc)
          integer    nra, nca, lda, nrb, ncb, ldb, nrc, ncc, ldc
          complex    a(lda,*), b(ldb,*), c(ldc,*)
        end subroutine
      end interface

      interface
        subroutine hrrrr (nra, nca, a, lda, nrb, ncb, b, ldb,nrc, ncc, c, ldc)
          integer    nra, nca, lda, nrb, ncb, ldb, nrc, ncc, ldc
          real       a(lda,*), b(ldb,*), c(ldc,*)
        end subroutine
      end interface

      interface
        subroutine polrg (n, a, lda, ncoef, coef, b, ldb)
          integer    n, lda, ncoef, ldb
          real       a(lda,*), coef(*), b(ldb,*)
        end subroutine
      end interface

      interface
        subroutine p2lrg (n, a, lda, ncoef, coef, b, ldb,work)
          integer    n, lda, ncoef, ldb
          real       a(lda,*), coef(*), b(ldb,*), work(n,*)
        end subroutine
      end interface

      interface
        subroutine murrv (nra, nca, a, lda, nx, x, ipath, ny,y)
          integer    nra, nca, lda, nx, ipath, ny
          real       a(lda,*), x(*), y(*)
        end subroutine
      end interface

      interface
        subroutine murbv (n, a, lda, nlca, nuca, nx, x,ipath, ny, y)
          integer    n, lda, nlca, nuca, nx, ipath, ny
          real       a(lda,n), x(nx), y(ny)
        end subroutine
      end interface

      interface
        subroutine mucrv (nra, nca, a, lda, nx, x, ipath, ny,y)
          integer    nra, nca, lda, nx, ipath, ny
          complex    a(lda,*), x(*), y(*)
        end subroutine
      end interface

      interface
        subroutine mucbv (n, a, lda, nlca, nuca, nx, x,ipath, ny, y)
          integer    n, lda, nlca, nuca, nx, ipath, ny
          complex    a(lda,n), x(nx), y(ny)
        end subroutine
      end interface

      interface
        subroutine arbrb (n, a, lda, nlca, nuca, b, ldb,nlcb, nucb, c, ldc, nlcc, nucc)
          integer    n, lda, nlca, nuca, ldb, nlcb, nucb, ldc, nlcc, nucc
          real       a(lda,*), b(ldb,*), c(ldc,*)
        end subroutine
      end interface

      interface
        subroutine acbcb (n, a, lda, nlca, nuca, b, ldb,nlcb, nucb, c, ldc, nlcc, nucc)
          integer    n, lda, nlca, nuca, ldb, nlcb, nucb, ldc, nlcc, nucc
          complex    a(lda,*), b(ldb,*), c(ldc,*)
        end subroutine
      end interface

      interface
        subroutine nrirr (nra, nca, a, lda, anorm)
          integer    nra, nca, lda
          real       anorm, a(lda,*)
        end subroutine
      end interface

      interface
        subroutine nr1rr (nra, nca, a, lda, anorm)
          integer    nra, nca, lda
          real       anorm, a(lda,*)
        end subroutine
      end interface

      interface
        subroutine nr2rr (nra, nca, a, lda, anorm)
          integer    nra, nca, lda
          real       anorm, a(lda,*)
        end subroutine
      end interface

      interface
        subroutine nr1rb (n, a, lda, nlca, nuca, anorm)
          integer    n, lda, nlca, nuca
          real       anorm, a(lda,*)
        end subroutine
      end interface

      interface
        subroutine nr1cb (n, a, lda, nlca, nuca, anorm)
          integer    n, lda, nlca, nuca
          real       anorm
          complex    a(lda,*)
        end subroutine
      end interface

      interface
        real function disl2 (n, x, incx, y, incy)
          integer    n, incx, incy
          real       x(*), y(*)
        end function
      end interface

      interface
        real function disl1 (n, x, incx, y, incy)
          integer    n, incx, incy
          real       x(*), y(*)
        end function
      end interface

      interface
        real function disli (n, x, incx, y, incy)
          integer    n, incx, incy
          real       x(*), y(*)
        end function
      end interface

      interface
        subroutine vconr (nx, x, ny, y, nz, z)
          integer    nx, ny, nz
          real       x(*), y(*), z(*)
        end subroutine
      end interface

      interface
        subroutine v2onr (nx, x, ny, y, nz, z, xwk, ywk, zwk,wk)
          integer    nx, ny, nz
          real       x(*), y(*), z(*), wk(*)
          complex    xwk(*), ywk(*), zwk(*)
        end subroutine
      end interface

      interface
        subroutine vconc (nx, x, ny, y, nz, z)
          integer    nx, ny, nz
          complex    x(*), y(*), z(*)
        end subroutine
      end interface

      interface
        subroutine v2onc (nx, x, ny, y, nz, z, xwk, ywk, wk)
          integer    nx, ny, nz
          real       wk(*)
          complex    x(*), y(*), z(*), xwk(*), ywk(*)
        end subroutine
      end interface

!
!     Chapter 10:  Utilities
!

      interface
        subroutine wrcrn (title, nra, nca, a, lda, itring)
          integer    nra, nca, lda, itring
          complex    a(*)
          character  title*(*)
        end subroutine
      end interface

      interface
        subroutine wrcrl (title, nra, nca, a, lda, itring,fmt, rlabel, clabel)
          integer    nra, nca, lda, itring
          complex    a(*)
          character  title*(*), fmt*(*), rlabel(*)*(*), clabel(0:*)*(*)
        end subroutine
      end interface

      interface
        subroutine w2crl (title, nra, nca, a, lda, itring,fmt, rlabel, clabel, chwk)
          integer    nra, nca, lda, itring
          complex    a(*)
          character  title*(*), fmt*(*), rlabel(*)*(*), clabel(0:*)*(*),    &
     &           chwk(*)*10
        end subroutine
      end interface

      interface
        subroutine svrbn (n, ra, rb)
          integer    n
          real       ra(*), rb(*)
        end subroutine
      end interface

      interface
        subroutine svrbp (n, ra, rb, iperm)
          integer    n, iperm(*)
          real       ra(*), rb(*)
        end subroutine
      end interface

      interface
        real function const (name)
          character  name*(*)
        end function
      end interface

      interface
        subroutine cunit (x, xunits, y, yunits)
          real       x, y
          character  xunits*(*), yunits*(*)
        end subroutine
      end interface

      interface
        real function hypot (a, b)
          real       a, b
        end function
      end interface

!
!     Special Functions Chapter 1:  Elementary Functions
!

      interface
        real function carg (z)
          complex    z
        end function
      end interface

      interface
        real function cbrt (x)
          real       x
        end function
      end interface

      interface
        complex function ccbrt (z)
          complex    z
        end function
      end interface

      interface
        real function exprl (x)
          real       x
        end function
      end interface

      interface
        complex function clog10 (z)
          complex    z
        end function
      end interface

      interface
        real function alnrel (x)
          real       x
        end function
      end interface

!
!     Special Functions Chapter 2:  Trigonometric and Hyperbolic
!                                   Functions
!

      interface
        complex function ctan (z)
          complex    z
        end function
      end interface

      interface
        real function cot (x)
          real       x
        end function
      end interface

      interface
        complex function ccot (z)
          complex    z
        end function
      end interface

      interface
        real function sindg (x)
          real       x
        end function
      end interface

      interface
        real function cosdg (x)
          real       x
        end function
      end interface

      interface
        complex function casin (zinp)
          complex    zinp
        end function
      end interface

      interface
        complex function cacos (z)
          complex    z
        end function
      end interface

      interface
        complex function catan (z)
          complex    z
        end function
      end interface

      interface
        complex function catan2 (csn, ccs)
          complex    csn, ccs
        end function
      end interface

      interface
        complex function csinh (z)
          complex    z
        end function
      end interface

      interface
        complex function ccosh (z)
          complex    z
        end function
      end interface

      interface
        complex function ctanh (z)
          complex    z
        end function
      end interface

      interface
        real function asinh (x)
          real       x
        end function
      end interface

      interface
        complex function casinh (z)
          complex    z
        end function
      end interface

      interface
        real function acosh (x)
          real       x
        end function
      end interface

      interface
        complex function cacosh (z)
          complex    z
        end function
      end interface

      interface
        real function atanh (x)
          real       x
        end function
      end interface

      interface
        complex function catanh (z)
          complex    z
        end function
      end interface

!
!     Special Functions Chapter 3:  Exponential Integrals and Related
!                                   Functions
!

      interface
        real function ei (x)
          real       x
        end function
      end interface

      interface
        real function e1 (x)
          real       x
        end function
      end interface

      interface
        subroutine ene (x, n, f)
          integer    n
          real       x, f(*)
        end subroutine
      end interface

      interface
        real function ali (x)
          real       x
        end function
      end interface

      interface
        real function si (x)
          real       x
        end function
      end interface

      interface
        real function ci (x)
          real       x
        end function
      end interface

      interface
        real function cin (x)
          real       x
        end function
      end interface

      interface
        real function shi (x)
          real       x
        end function
      end interface

      interface
        real function chi (x)
          real       x
        end function
      end interface

      interface
        real function cinh (x)
          real       x
        end function
      end interface

!
!     Special Functions Chapter 4:  Gamma Function and Related Functions
!

      interface
        real function fac (n)
          integer    n
        end function
      end interface

      interface
        real function gamr (x)
          real       x
        end function
      end interface

      interface
        real function alngam (x)
          real       x
        end function
      end interface

      interface
        subroutine algams (x, algm, s)
          real       x, algm, s
        end subroutine
      end interface

      interface
        real function gami (a, x)
          real       a, x
        end function
      end interface

      interface
        real function gamic (a, x)
          real       a, x
        end function
      end interface

      interface
        real function gamit (a, x)
          real       a, x
        end function
      end interface

      interface
        real function psi (x)
          real       x
        end function
      end interface

      interface
        real function poch (a, x)
          real       a, x
        end function
      end interface

      interface
        real function poch1 (a, x)
          real       a, x
        end function
      end interface

      interface
        real function albeta (a, b)
          real       a, b
        end function
      end interface

      interface
        real function betai (x, pin, qin)
          real       x, pin, qin
        end function
      end interface

!
!     Special Functions Chapter 5:  Error Function and Related Functions
!

      interface
        real function erf (x)
          real       x
        end function
      end interface

      interface
        real function erfc (x)
          real       x
        end function
      end interface

      interface
        real function erfce (x)
          real       x
        end function
      end interface

      interface
        complex function cerfe (z)
          complex    z
        end function
      end interface

      interface
        real function erfi (x)
          real       x
        end function
      end interface

      interface
        real function erfci (x)
          real       x
        end function
      end interface

      interface
        real function daws (x)
          real       x
        end function
      end interface

      interface
        real function fresc (x)
          real       x
        end function
      end interface

      interface
        real function fress (x)
          real       x
        end function
      end interface

!
!     Special Functions Chapter 6:  Bessel Functions
!

      interface
        real function bsj0 (x)
          real       x
        end function
      end interface

      interface
        real function bsj1 (x)
          real       x
        end function
      end interface

      interface
        real function bsy0 (x)
          real       x
        end function
      end interface

      interface
        real function bsy1 (x)
          real       x
        end function
      end interface

      interface
        real function bsi0 (x)
          real       x
        end function
      end interface

      interface
        real function bsi1 (x)
          real       x
        end function
      end interface

      interface
        real function bsk0 (x)
          real       x
        end function
      end interface

      interface
        real function bsk1 (x)
          real       x
        end function
      end interface

      interface
        real function bsi0e (x)
          real       x
        end function
      end interface

      interface
        real function bsi1e (x)
          real       x
        end function
      end interface

      interface
        real function bsk0e (x)
          real       x
        end function
      end interface

      interface
        real function bsk1e (x)
          real       x
        end function
      end interface

      interface
        subroutine bsjns (x, n, bs)
          integer    n
          real       x, bs(*)
        end subroutine
      end interface

      interface
        subroutine cbjns (z, n, cbs)
          integer    n
          complex    z, cbs(*)
        end subroutine
      end interface

      interface
        subroutine bsins (x, n, bsi)
          integer    n
          real       x, bsi(*)
        end subroutine
      end interface

      interface
        subroutine cbins (z, n, cbs)
          integer    n
          complex    z, cbs(*)
        end subroutine
      end interface

      interface
        subroutine bsjs (xnu, x, n, bs)
          integer    n
          real       xnu, x, bs(*)
        end subroutine
      end interface

      interface
        subroutine b2js (xnu, x, n, bs, wk)
          integer    n
          real       xnu, x, bs(*), wk(*)
        end subroutine
      end interface

      interface
        subroutine bsys (xnu, x, n, bsy)
          integer    n
          real       xnu, x, bsy(*)
        end subroutine
      end interface

      interface
        subroutine bsis (xnu, x, n, bsi)
          integer    n
          real       xnu, x, bsi(*)
        end subroutine
      end interface

      interface
        subroutine bsies (xnu, x, n, bsi)
          integer    n
          real       xnu, x, bsi(*)
        end subroutine
      end interface

      interface
        subroutine bsks (xnu, x, nin, bk)
          integer    nin
          real       xnu, x, bk(*)
        end subroutine
      end interface

      interface
        subroutine bskes (xnu, x, nin, bke)
          integer    nin
          real       xnu, x, bke(*)
        end subroutine
      end interface

      interface
        subroutine cbjs (xnu, z, n, cbs)
          integer    n
          real       xnu
          complex    z, cbs(*)
        end subroutine
      end interface

      interface
        subroutine cbys (xnu, z, n, cbs)
          integer    n
          real       xnu
          complex    z, cbs(*)
        end subroutine
      end interface

      interface
        subroutine c2ys (xnu, z, n, cbs, fk)
          integer    n
          real       xnu
          complex    z, cbs(*), fk(*)
        end subroutine
      end interface

      interface
        subroutine cbis (xnu, z, n, cbs)
          integer    n
          real       xnu
          complex    z, cbs(*)
        end subroutine
      end interface

      interface
        subroutine cbks (xnu, z, n, cbs)
          integer    n
          real       xnu
          complex    z, cbs(*)
        end subroutine
      end interface

      interface
        subroutine c2ks (xnu, z, n, cbs, fi)
          integer    n
          real       xnu
          complex    z, cbs(*), fi(*)
        end subroutine
      end interface

!
!     Special Functions Chapter 7:  Kelvin Functions
!

      interface
        real function ber0 (x)
          real       x
        end function
      end interface

      interface
        real function bei0 (x)
          real       x
        end function
      end interface

      interface
        real function aker0 (x)
          real       x
        end function
      end interface

      interface
        real function akei0 (x)
          real       x
        end function
      end interface

      interface
        real function berp0 (x)
          real       x
        end function
      end interface

      interface
        real function beip0 (x)
          real       x
        end function
      end interface

      interface
        real function akerp0 (x)
          real       x
        end function
      end interface

      interface
        real function akeip0 (x)
          real       x
        end function
      end interface

      interface
        real function ber1 (x)
          real       x
        end function
      end interface

      interface
        real function bei1 (x)
          real       x
        end function
      end interface

      interface
        real function aker1 (x)
          real       x
        end function
      end interface

      interface
        real function akei1 (x)
          real       x
        end function
      end interface

!
!     Special Functions Chapter 8:  Airy Functions
!

      interface
        real function ai (x)
          real       x
        end function
      end interface

      interface
        real function bi (x)
          real       x
        end function
      end interface

      interface
        real function aid (x)
          real       x
        end function
      end interface

      interface
        real function bid (x)
          real       x
        end function
      end interface

      interface
        real function aie (x)
          real       x
        end function
      end interface

      interface
        real function bie (x)
          real       x
        end function
      end interface

      interface
        real function aide (x)
          real       x
        end function
      end interface

      interface
        real function bide (x)
          real       x
        end function
      end interface

!
!     Special Functions Chapter 9:  Elliptic Integrals
!

      interface
        real function elk (x)
          real       x
        end function
      end interface

      interface
        real function ele (x)
          real       x
        end function
      end interface

      interface
        real function elrf (x, y, z)
          real       x, y, z
        end function
      end interface

      interface
        real function elrd (x, y, z)
          real       x, y, z
        end function
      end interface

      interface
        real function elrj (x, y, z, rho)
          real       x, y, z, rho
        end function
      end interface

      interface
        real function elrc (x, y)
          real       x, y
        end function
      end interface

!
!     Special Functions Chapter 10:  Elliptic and Related Functions
!

      interface
        complex function cwpl (z)
          complex    z
        end function
      end interface

      interface
        complex function cwpld (z)
          complex    z
        end function
      end interface

      interface
        complex function cwpq (z)
          complex    z
        end function
      end interface

      interface
        complex function cwpqd (z)
          complex    z
        end function
      end interface

      interface
        real function ejsn (x, am)
          real       x, am
        end function
      end interface

      interface
        complex function cejsn (z, am)
          real       am
          complex    z
        end function
      end interface

      interface
        real function ejcn (x, am)
          real       x, am
        end function
      end interface

      interface
        complex function cejcn (z, am)
          real       am
          complex    z
        end function
      end interface

      interface
        real function ejdn (x, am)
          real       x, am
        end function
      end interface

      interface
        complex function cejdn (z, am)
          real       am
          complex    z
        end function
      end interface

!
!     Special Functions Chapter 12:  Mathieu Functions
!

      interface
        subroutine matee (q, n, isym, iper, eval)
          integer    n, isym, iper
          real       q, eval(*)
        end subroutine
      end interface

      interface
        subroutine m2tee (q, n, isym, iper, eval, norder,workd, worke)
          integer    n, isym, iper, norder
          real       q, eval(*), workd(*), worke(*)
        end subroutine
      end interface

      interface
        subroutine m3tee (q, n, mmax)
          integer    n, mmax
          real       q
        end subroutine
      end interface

      interface
        subroutine matce (x, q, n, ce)
          integer    n
          real       x, q, ce(*)
        end subroutine
      end interface

      interface
        subroutine m2tce (x, q, n, ce, norder, needev, eval0,eval1, coef, work, bsj)
          logical    needev
          integer    n, norder
          real       x, q, ce(*), eval0(*), eval1(*), coef(*), work(*),     &
     &           bsj(*)
        end subroutine
      end interface

      interface
        subroutine matse (x, q, n, se)
          integer    n
          real       x, q, se(*)
        end subroutine
      end interface

      interface
        subroutine m2tse (x, q, n, se, norder, needev, eval0,eval1, coef, work, bsi)
          logical    needev
          integer    n, norder
          real       x, q, se(*), eval0(*), eval1(*), coef(*), work(*),     &
     &           bsi(*)
        end subroutine
      end interface

!
!     Special Functions Chapter 13:  Miscellaneous Functions
!

      interface
        real function spenc (x)
          real       x
        end function
      end interface

      interface
        integer function inits (os, nos, eta)
          integer    nos
          real       eta, os(*)
        end function
      end interface

      interface
        real function csevl (x, cs, n)
          integer    n
          real       x, cs(*)
        end function
      end interface

!
!     Deprecated Routines
!

      interface
        subroutine e2ahf (n, neval, a, lda, small, eval,acopy, rwk, cwk, iwk)
          integer    n, neval, lda, iwk(*)
          real       eval(*), rwk(n,*)
          complex    a(lda,*), acopy(n,*), cwk(n,*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e2asf (n, neval, a, lda, small, eval,acopy, wk, iwk)
          integer    n, neval, lda, iwk(*)
          real       a(lda,*), eval(*), acopy(n,*), wk(*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e2bhf (n, mxeval, a, lda, elow, ehigh,neval, eval, acopy, rwk, cwk, iwk)
          integer    n, mxeval, lda, neval, iwk(*)
          real       elow, ehigh, eval(*), rwk(n,*)
          complex    a(lda,*), acopy(n,*), cwk(n,*)
        end subroutine
      end interface

      interface
        subroutine e2bsb (n, mxeval, a, lda, ncoda, elow,ehigh, neval, eval, acopy, wk, iwk)
          integer    n, mxeval, lda, ncoda, neval, iwk(*)
          real       elow, ehigh, a(lda,*), eval(*), acopy(ncoda+1,*),      &
     &           wk(n,*)
        end subroutine
      end interface

      interface
        subroutine e2bsf (n, mxeval, a, lda, elow, ehigh,neval, eval, acopy, wk, iwk)
          integer    n, mxeval, lda, neval, iwk(*)
          real       elow, ehigh, a(lda,*), eval(mxeval), acopy(n,n),       &
     &           wk(n,5)
        end subroutine
      end interface

      interface
        subroutine e2ccg (n, a, lda, eval, evec, ldevec,acopy, rwk, cwk)
          integer    n, lda, ldevec
          real       rwk(*)
          complex    a(lda,*), eval(*), evec(ldevec,*), acopy(n,*),         &
     &           cwk(n,*)
        end subroutine
      end interface

      interface
        subroutine e2cch (n, a, lda, eval, evec, ldevec,acopy, cwork)
          integer    n, lda, ldevec
          complex    a(lda,*), eval(*), evec(ldevec,*), acopy(n,*),         &
     &           cwork(n,*)
        end subroutine
      end interface

      interface
        subroutine e2chf (n, a, lda, eval, evec, ldevec,acopy, rwk, cwk)
          integer    n, lda, ldevec
          real       eval(*), rwk(*)
          complex    a(lda,*), evec(ldevec,*), acopy(n,*), cwk(*)
        end subroutine
      end interface

      interface
        subroutine e2crg (n, a, lda, eval, evec, ldevec,acopy, ecopy, rwk)
          integer    n, lda, ldevec
          real       a(lda,*), acopy(n,*), ecopy(n,*), rwk(n,*)
          complex    eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e2crh (n, a, lda, eval, evec, ldevec,acopy, ecopy)
          integer    n, lda, ldevec
          real       a(lda,*), acopy(n,*), ecopy(n,*)
          complex    eval(*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine e2csb (n, a, lda, ncoda, eval, evec,ldevec, acopy, wk)
          integer    n, lda, ncoda, ldevec
          real       a(lda,*), eval(*), evec(ldevec,*), acopy(ncoda+1,*),   &
     &           wk(*)
        end subroutine
      end interface

      interface
        subroutine e2ehf (n, nevec, a, lda, small, eval,evec, ldevec, acopy, rw1, rw2, cwk, iwk)
          integer    n, nevec, lda, ldevec, iwk(*)
          real       eval(*), rw1(n,*), rw2(n,*)
          complex    a(lda,*), evec(ldevec,*), acopy(n,*), cwk(n,*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e2esb (n, nevec, a, lda, ncoda, small,eval, evec, ldevec, acopy, wk, iwk)
          integer    n, nevec, lda, ncoda, ldevec, iwk(*)
          real       a(lda,*), eval(*), evec(ldevec,*), acopy(ncoda+1,*),   &
     &           wk(*)
          logical    small
        end subroutine
      end interface

      interface
        subroutine e2fhf (n, mxeval, a, lda, elow, ehigh,neval, eval, evec, ldevec, acopy, ecopy, rwk, cwk, iwk)
          integer    n, mxeval, lda, neval, ldevec, iwk(*)
          real       elow, ehigh, eval(*), ecopy(n,*), rwk(n,*)
          complex    a(lda,*), evec(ldevec,*), acopy(n,*), cwk(n,*)
        end subroutine
      end interface

      interface
        subroutine e2fsb (n, mxeval, a, lda, ncoda, elow,ehigh, neval, eval, evec, ldevec, acopy, wk1, wk2, iwk)
          integer    n, mxeval, lda, ncoda, neval, ldevec, iwk(*)
          real       elow, ehigh, a(lda,*), eval(*), evec(ldevec,*),        &
     &           acopy(ncoda+1,*), wk1(n,*), wk2(*)
        end subroutine
      end interface

      interface
        subroutine e2fsf (n, mxeval, a, lda, elow, ehigh,neval, eval, evec, ldevec, acopy, wk, iwk)
          integer    n, mxeval, lda, neval, ldevec, iwk(*)
          real       elow, ehigh, a(lda,*), eval(*), evec(ldevec,*),        &
     &           acopy(n,*), wk(n,*)
        end subroutine
      end interface

      interface
        subroutine e2lcg (n, a, lda, eval, acopy, rwk, cwk)
          integer    n, lda
          real       rwk(*)
          complex    a(lda,*), eval(*), acopy(n,*), cwk(n,*)
        end subroutine
      end interface

      interface
        subroutine e2lch (n, a, lda, eval, acopy)
          integer    n, lda
          complex    a(lda,*), eval(*), acopy(n,*)
        end subroutine
      end interface

      interface
        subroutine e2lhf (n, a, lda, eval, acopy, rwk, cwk)
          integer    n, lda
          real       eval(*), rwk(*)
          complex    a(lda,*), acopy(n,*), cwk(*)
        end subroutine
      end interface

      interface
        subroutine e2lrg (n, a, lda, eval, acopy, rwk)
          integer    n, lda
          real       a(lda,*), acopy(n,*), rwk(n,*)
          complex    eval(*)
        end subroutine
      end interface

      interface
        subroutine e2lrh (n, a, lda, eval, acopy)
          integer    n, lda
          real       a(lda,*), acopy(n,*)
          complex    eval(*)
        end subroutine
      end interface

      interface
        subroutine e2lsb (n, a, lda, ncoda, eval, acopy, wk)
          integer    n, lda, ncoda
          real       a(lda,*), eval(*), acopy(ncoda+1,*), wk(*)
        end subroutine
      end interface

      interface
        subroutine e3crg (n, low, igh, a, lda, scale)
          integer    n, low, igh, lda
          real       a(lda,*), scale(*)
        end subroutine
      end interface

      interface
        subroutine e3crh (n, low, igh, a, lda, eval, ecopy,ldecop, evec, ldevec, vector)
          integer    n, low, igh, lda, ldecop, ldevec
          real       a(lda,*), ecopy(ldecop,*)
          complex    eval(*), evec(ldevec,*)
          logical    vector
        end subroutine
      end interface

      interface
        subroutine e3lsf (n, a, lda, d, e, e2)
          integer    n, lda
          real       a(lda,*), d(*), e(*), e2(*)
        end subroutine
      end interface

      interface
        subroutine e4crg (n, low, igh, a, lda, ort, work)
          integer    n, low, igh, lda
          real       a(lda,*), ort(*), work(*)
        end subroutine
      end interface

      interface
        subroutine e4esf (n, nevec, a, evec, ldevec, e)
          integer    n, nevec, ldevec
          real       a(n,*), evec(ldevec,*), e(*)
        end subroutine
      end interface

      interface
        subroutine e5crg (n, low, igh, a, lda, ort, evec,ldevec, g)
          integer    n, low, igh, lda, ldevec
          real       a(lda,*), ort(*), evec(ldevec,*), g(*)
        end subroutine
      end interface

      interface
        subroutine e7crg (n, nevec, eval, evec, ldevec,vector)
          integer    n, nevec, ldevec
          complex    eval(*), evec(ldevec,*)
          logical    vector
        end subroutine
      end interface

      interface
        subroutine g2ccg (n, a, lda, b, ldb, alpha, beta,evec, ldevec, acopy, bcopy)
          integer    n, lda, ldb, ldevec
          complex    a(lda,*), b(ldb,*), alpha(*), beta(*),                 &
     &           evec(ldevec,*), acopy(n,*), bcopy(n,*)
        end subroutine
      end interface

      interface
        subroutine g2crg (n, a, lda, b, ldb, alpha, beta,evec, ldevec, acopy, bcopy, ecopy, rwk, cwk)
          integer    n, lda, ldb, ldevec
          real       a(lda,*), b(ldb,*), beta(*), acopy(n,*), bcopy(n,*),   &
     &           ecopy(n,*), rwk(*)
          complex    alpha(*), evec(ldevec,*), cwk(*)
        end subroutine
      end interface

      interface
        subroutine g2lcg (n, a, lda, b, ldb, alpha, beta,acopy, bcopy)
          integer    n, lda, ldb
          complex    a(lda,*), b(ldb,*), alpha(*), beta(*), acopy(n,*),     &
     &           bcopy(n,*)
        end subroutine
      end interface

      interface
        subroutine g2lrg (n, a, lda, b, ldb, alpha, beta,acopy, bcopy, rwk, cwk)
          integer    n, lda, ldb
          real       a(lda,*), b(ldb,*), beta(*), acopy(n,*), bcopy(n,*),   &
     &           rwk(*)
          complex    alpha(*), cwk(*)
        end subroutine
      end interface

      interface
        subroutine g3ccg (n, a, b, ijob, evec, ldevec)
          integer    n, ijob, ldevec
          complex    a(n,*), b(n,*), evec(ldevec,*)
        end subroutine
      end interface

      interface
        subroutine g4ccg (n, a, b, evec, ldevec, ijob, alpha,beta)
          integer    n, ldevec, ijob
          complex    a(n,*), b(n,*), evec(ldevec,*), alpha(*), beta(*)
        end subroutine
      end interface

      interface
        subroutine g5ccg (n, nevec, alpha, beta, evec,ldevec, vector, eval)
          integer    n, nevec, ldevec
          complex    alpha(*), beta(*), evec(ldevec,*), eval(*)
          logical    vector
        end subroutine
      end interface

      interface
        subroutine g7crg (n, nevec, alpha, beta, evec,ldevec, vector, eval)
          integer    n, nevec, ldevec
          real       beta(*)
          complex    alpha(*), evec(ldevec,*), eval(*)
          logical    vector
        end subroutine
      end interface

      interface
        subroutine ivpbs (ido, neq, fcn, x, xend, tol, param,y)
          integer    ido, neq
          real       x, xend, tol, param(*), y(*)
          external   fcn
        end subroutine
      end interface

      interface
        subroutine i2pbs (ido, n, fcn, x, xend, tol, param,y, r, s, vnorm, wk)
          integer    ido, n
          real       x, xend, tol, param(*), y(*), r(*), s(*), wk(*)
          external   fcn, vnorm
        end subroutine
      end interface

end module
