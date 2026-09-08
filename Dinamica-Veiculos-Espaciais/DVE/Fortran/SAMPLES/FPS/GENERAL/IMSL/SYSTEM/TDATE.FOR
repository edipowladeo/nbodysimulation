C-----------------------------------------------------------------------
C  IMSL Name:  TDATE (Single precision version)
C
C  Computer:   pcdsms/SINGLE
C
C  Revised:    May 14, 1991
C
C  Purpose:    Get today's date.
C
C  Usage:      CALL TDATE (IDAY, MONTH, IYEAR)
C
C  Arguments:
C     IDAY   - Day of the month.  (Output)
C              IDAY is between 1 and 31 inclusive.
C     MONTH  - Month of the year.  (Output)
C              MONTH is between 1 and 12 inclusive.
C     IYEAR  - AD year.  (Output)
C              For example, IYEAR = 1985.
C
C  Keywords:   Utilities; Calendar
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
      SUBROUTINE TDATE (IDAY, MONTH, IYEAR)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER    IDAY, MONTH, IYEAR
C
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER    *2 IY, IM, ID
C                                  SPECIFICATIONS FOR SUBROUTINES
      EXTERNAL   GETDAT
C
      CALL GETDAT (IY, IM, ID)
      IYEAR = IY
      MONTH = IM
      IDAY = ID
      RETURN
      END
