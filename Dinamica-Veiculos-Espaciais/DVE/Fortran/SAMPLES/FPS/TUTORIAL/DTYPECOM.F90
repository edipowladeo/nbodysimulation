!     DTYPECOM.F90   Demonstrate placing derived-type objects in common block

      PROGRAM structure_in_common

      REAL        a
      INTEGER     j

      TYPE simple
        SEQUENCE
        LOGICAL   l
        INTEGER   i
        REAL      r
        COMPLEX   c
      END TYPE simple
      TYPE (simple) s

      COMMON / chamelion / a, s, j

      WRITE(*,*) 'Before initialization:'
      WRITE(*,1) a, s%l, s%i, s%r, s%c, j

      a   = 9.9
      s%l = .FALSE.
      s%i = 1
      s%r = 2.2
      s%c = (3.3, 3.3)
      j   = 9
      WRITE(*,*) 'After initialization:'
      WRITE(*,1) a, s%l, s%i, s%r, s%c, j

      CALL sub1
      WRITE(*,*) 'After modification by subroutine 1:'
      WRITE(*,1) a, s%l, s%i, s%r, s%c, j

      CALL sub2
      WRITE(*,*) 'After modification by subroutine 2:'
      WRITE(*,1) a, s%l, s%i, s%r, s%c, j

    1 FORMAT (4X,F3.1,2X,L1,2X,I1,2X,F3.1,2X,F3.1,2X,F3.1,2X,I1)
      END PROGRAM structure_in_common

      SUBROUTINE sub1
      COMMON / chamelion / a, l, i, r, c, j
      LOGICAL   l
      INTEGER   i, j
      REAL      r, a
      COMPLEX   c

      a = 8.8
      l = .TRUE.
      i = 4
      r = 5.5
      c = (6.6, 6.6)
      j = 8
      END

      SUBROUTINE sub2
      COMMON / chamelion / ss
      TYPE t
        SEQUENCE
        REAL      a
        LOGICAL   l
        INTEGER   i
        REAL      r
        COMPLEX   c
        INTEGER   j
      END TYPE t
      TYPE (t) ss

      ss%a = 9.9
      ss%l = .FALSE.
      ss%i = 1
      ss%r = 2.2
      ss%c = (3.3, 3.3)
      ss%j = 9
      END
!____________________________________

!  Expected output:

!  Before initialization:
!      .0  F  0   .0   .0   .0  0
!  After initialization:
!     9.9  F  1  2.2  3.3  3.3  9
!  After modification by subroutine 1:
!     8.8  T  4  5.5  6.6  6.6  8
!  After modification by subroutine 2:
!     9.9  F  1  2.2  3.3  3.3  9
