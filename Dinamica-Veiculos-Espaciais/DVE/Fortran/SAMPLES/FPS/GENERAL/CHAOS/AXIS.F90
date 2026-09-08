SUBROUTINE AXIS
!******************************************************************************
!*                                                                            *
!*  THIS SUBROUTINE IS USED TO DRAW A PAIR IF X ANF Y AXISES FOR THE PLOT OF  *
!*  THE INTENSITY OF THE COLOR COMPONENTS                                     *
!*                                                                            *
!******************************************************************************

  USE MSFLIB
  USE PLOTVAL
  USE VIDCONF

  IMPLICIT NONE
  

  INTEGER(KIND=2)IXPIX, IYPIX
  REAL(KIND=4)X, Y, XPIX, YPIX
  INTEGER(KIND=4)ISTATUS, RGB
 
   ISTATUS = SETCOLORRGB(RGB(255,255,255))
!* DRAW AXISES
!* X-AXIS  
  X = 0.00E+00
  Y = YMIN
  XPIX = (X/XPIXVAL) - XPIXOFF
  YPIX = YPIXOFF - (Y/YPIXVAL)
  IXPIX = INT(XPIX)
  IYPIX = INT(YPIX)
  CALL MOVETO(IXPIX, IYPIX, XY)

  X = 0.00E+00
  Y = YMAX
  XPIX = (X/XPIXVAL) - XPIXOFF
  YPIX = YPIXOFF - (Y/YPIXVAL)
  IXPIX = INT(XPIX)
  IYPIX = INT(YPIX)
  ISTATUS = LINETO(IXPIX,IYPIX)
  
  !* Y-AXIS
  X = XMAX
  Y = 0.00E+00
  XPIX = (X/XPIXVAL) - XPIXOFF
  YPIX = YPIXOFF - (Y/YPIXVAL)
  IXPIX = INT(XPIX)
  IYPIX = INT(YPIX)
  CALL MOVETO(IXPIX, IYPIX, XY)
  
  X = XMIN
  Y = 0.00E+00
  XPIX = (X/XPIXVAL) - XPIXOFF
  YPIX = YPIXOFF - (Y/YPIXVAL)
  IXPIX = INT(XPIX)
  IYPIX = INT(YPIX)
  ISTATUS = LINETO(IXPIX,IYPIX)

  RETURN 
END
