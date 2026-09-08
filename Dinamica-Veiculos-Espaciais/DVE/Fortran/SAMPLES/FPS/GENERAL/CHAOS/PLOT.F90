SUBROUTINE PLOT(X, Y, ICOL, XP, YP)
!******************************************************************************
!*
!*  THIS SUBORUTINE IS USED TO PLOT THE LINES SHOWING THE RED, GREEN AND BLUE 
!*  COLOR COMPONENT INTENSITY
!*
!******************************************************************************
  USE MSFLIB, SETPIXEL0=>SETPIXEL
  USE PLOTVAL
  USE VIDCONF
  IMPLICIT NONE

  REAL(KIND=4)X, Y, XPIX, YPIX
  INTEGER(KIND=2)IXPIX, IYPIX, I2, XP, YP
  INTEGER(KIND=4)ICOL, I1

    I1 = SETCOLOR(ICOL)
    XPIX = (X/XPIXVAL) - XPIXOFF
    YPIX = YPIXOFF - (Y/YPIXVAL)
    IXPIX = INT2(XPIX)
    IYPIX = INT2(YPIX)
!* PLOT PIXEL
    CALL MOVETO(XP, YP, XY)
    I2 = LINETO(IXPIX,IYPIX)
	XP = IXPIX
	YP = IYPIX

  RETURN
END
