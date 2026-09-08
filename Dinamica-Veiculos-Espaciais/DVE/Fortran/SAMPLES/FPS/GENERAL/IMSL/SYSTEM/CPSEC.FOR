C-----------------------------------------------------------------------
C  IMSL Name:  CPSEC
C
C  Computer:   ntlnts/SINGLE
C
C  Revised:    March 13, 1991
C
C  Purpose:    Return CPU time used in seconds.
C
C  Usage:      CPSEC ()
C
C  Argument:
C     CPSEC  - CPU time used (in seconds) since first call to CPSEC.
C              (Output)
C
C  Remarks:
C  1. The first call to CPSEC returns 0.0.
C
C  2. The accuracy of this routine depends on the hardware and the
C     operating system.  On some systems, identical runs can produce
C     timings differing by more than 10 percent.
C
C  Keywords:   Utilities; Clock
C
C  GAMS:       S3
C
C  Chapters:   STAT/LIBRARY Utilities
C              MATH/LIBRARY Utilities
C
C  Copyright:  1991 by IMSL, Inc.  All Rights Reserved.
C
C  Warranty:   IMSL warrants only that IMSL testing has been applied
C              to this code.  No other warranty, expressed or implied,
C              is applicable.
C
C-----------------------------------------------------------------------
C
      interface to integer function getcurrentthread
     &   [stdcall, alias:'_GetCurrentThread@0'] ()
      end
      interface to logical function getthreadtimes
     &   [stdcall, alias:'_GetThreadTimes@20'] (t, c, e, k, u)
      integer    t[value]
      integer    c[reference](2), e[reference](2)
      integer    k[reference](2), u[reference](2)
      end
C
      REAL FUNCTION CPSEC ()
C                                  SPECIFICATIONS FOR SAVE VARIABLES
      REAL       BEGTIM
      SAVE       BEGTIM
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER    IER
      REAL       CPU
      INTEGER    CREATE(2), EXIT(2), KERNEL(2), USER(2)
C                                  SPECIFICATIONS FOR SUBROUTINES
      EXTERNAL   GETCURRENTTHREAD, GETTHREADTIMES
      INTEGER    GETCURRENTTHREAD
      LOGICAL    GETTHREADTIMES
C                                  SPECIFICATIONS FOR INTRINSICS
      INTRINSIC  DBLE, SNGL
      REAL       SNGL
      DOUBLE PRECISION DBLE
C
      DATA BEGTIM/-1.0E0/
C                                  Set defaults
      CPSEC = 0.0E0
      IER = 0
C                                  Get CPU time in seconds
      IF (GETTHREADTIMES(GETCURRENTTHREAD(),CREATE,EXIT,KERNEL,USER))
     &    THEN
         CPU = SNGL((DBLE(KERNEL(2))*4.294967296D9+DBLE(KERNEL(1))+
     &         DBLE(USER(2))*4.294967296D9+DBLE(USER(1)))*1.0D-7)
      ELSE
         IER = 1
      END IF
C                                  Errors are flagged by IER .NE. 0
      IF (IER .NE. 0) THEN
         CALL E1PSH ('CPSEC ')
         CALL E1MES (5, 1, 'An error occurred in obtaining the '//
     &               'runtime statistics.')
         CALL E1POP ('CPSEC ')
C                                  Save initial CPU time
      ELSE IF (BEGTIM .LT. 0.0) THEN
         BEGTIM = CPU
C                                  Subtract initial CPU time
      ELSE
         CPSEC = CPU - BEGTIM
      END IF
C
      RETURN
      END
