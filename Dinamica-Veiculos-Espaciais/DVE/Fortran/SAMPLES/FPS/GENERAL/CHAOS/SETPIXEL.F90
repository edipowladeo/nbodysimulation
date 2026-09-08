!***************************************************************************
!*                                                                         *
!*  BUFFERING REPLACEMENT FOR SETPIXEL.  THIS CAN DRAMATICALLY IMPROVE     *
!*  PERFORMANCE BY DOING BATCHES OF PIXELS TOGETHER.  TO BE USED, THE USER *
!*  MUST RENAME THE SETPIXEL FUNCTION IN MSFLIB THROUGN THE USE STATEMENT  *
!*  THIS FORM OF SET PIXEL CNAN BE USED ONLY WHEN THE RETURN VALUE OF      *
!*  SETPIXEL IS ONT NEEDED.  SETPIXELFLUSH NEEDS TO BE CALLED WHEN ALL     *
!*  PIXELS HAVE BEEN DRAWN                                                 *
!*                                                                         *
!***************************************************************************
INTEGER(KIND=2) FUNCTION SETPIXEL(X,Y)
  USE MSFLIB, SETPIXEL0 => SETPIXEL
  INTEGER(KIND=2) X,Y
  INTEGER(KIND=4)$BSIZE

!*  SET UP THE BUFFER IN A COMMON BLOCL FOR SHARING
!*  WITH SETPIXELFLUSH
  PARAMETER ($BSIZE = 128)  ! BUFFER SIZE = 128
  COMMON /SETPIXEL_BUFFER/ BX($BSIZE), BY($BSIZE), BC($BSIZE), BN
  INTEGER(KIND=2)BX, BY, BC
  INTEGER(KIND=4)BN

!*  STORE THE PIXEL TO BE SET
  BN = BN + 1
  BX(BN) = X
  BY(BN) = Y
  BC(BN) = GETCOLOR()

!*  IF THE BUFFER IS FULL, FLUSH
  IF( BN .EQ. $BSIZE ) THEN
    CALL SETPIXELS(BN, BX, BY, BC)
    bn = 0
  ENDIF

!* ALWAYS RETURN 0 TO THE USER (DOESN'T RETURN REAL COLOR INDEX)
  SETPIXEL = 0

  RETURN
END

!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE EMPTIES THE BUFFER WHEN DRAWNING IS DONE.  IF NOT      *
!*  CALLED WHEN FINISHED DRAWNING, THE NEXT DRAWING MAY CONTAIN PIXELS FROM*
!*  THE PREVIOUS DRAWNING.                                                 *
!*                                                                         *
!***************************************************************************
SUBROUTINE SETPIXELFLUSH
  USE MSFLIB
!*SAME COMMON AS ABOVE
  INTEGER(KIND=4) $BSIZE  
  PARAMETER ($BSIZE = 128)  ! BUFFER SIZE = 128
  COMMON /SETPIXEL_BUFFER/ BX($BSIZE), BY($BSIZE), BC($BSIZE), BN
  INTEGER(KIND=2) BX, BY, BC
  INTEGER(KIND=4) BN

  CALL SETPIXELS( BN, BX, BY, BC)
  BN = 0

  RETURN
END

