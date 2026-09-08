C-----------------------------------------------------------------------
C  IMSL Name:  TIMDY
C
C  Computer:   pcdsms/SINGLEX
C
C  Revised:    March 19, 1991
C
C  Purpose:    Get time of day.
C
C  Usage:      CALL TIMDY (IHOUR, MINUTE, ISEC)
C
C  Arguments:
C     IHOUR  - Hour of the day.  (Output)
C              IHOUR is between 0 and 23 inclusive.
C     MINUTE - Minute within the hour.  (Output)
C              MINUTE is between 0 and 59 inclusive.
C     ISEC   - Second within the minute.  (Output)
C              ISEC is between 0 and 59 inclusive.
C
C  Keywords:   Utilities; Clock
C
C  GAMS:       R
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
      SUBROUTINE TIMDY (IHOUR, MINUTE, ISEC)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER    IHOUR, MINUTE, ISEC
C
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER    *2 IH, IM, IS, IHS
C                                  SPECIFICATIONS FOR SUBROUTINES
      EXTERNAL   GETTIM
C
      CALL GETTIM (IH, IM, IS, IHS)
      IHOUR = IH
      MINUTE = IM
      ISEC = IS
      RETURN
      END
