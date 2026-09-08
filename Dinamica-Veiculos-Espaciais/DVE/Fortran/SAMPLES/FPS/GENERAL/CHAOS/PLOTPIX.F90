
SUBROUTINE PLOTPIX
  USE MSFLIB
  USE PLOTVAL
  USE VIDCONF

  IMPLICIT NONE

!************************************************************************
!*  DESCRIPTION FOR SUBROUTINE PLOTPIX(XMAX, XMIN, YMAX, YMIN, XRANGE,  *
!*             YRANGE, XPIXVAL, YPIXVAL,                                *
!*             XPIXOFF, YPIXOFF)                                        *
!*                                                                      *
!*  THIS SUBROUTINE IS USED TO CALCULATE THE PLOT RANGE, PLOT PIXEL     *
!*  VALUES AND THE PIXEL OFFSET VALUES THAT ARE USED TO PLOT INFORMATION*
!*  IN ABSOLUTE PIXEL VALUES                                            *
!*                                                                      *
!*  INPUT:                                                              *
!*     XMAX - MAXIMUM VALUE OF X-AXIS                                   *
!*     XMIN - MINIMUM VALUE OF X-AXIS                                   *
!*     YMAX - MAXIMUM VALUE OF Y-AXIS                                   *
!*     YMIN - MINIMUM VALUE OF Y-AXIS                                   *
!*     VIDIEO.NUMXPIXELS - NUMBER OF PIXELS IN X AXIS                   *
!*     VIDIEO.NUMYPIXELS - NUMBER OF PIXELS IN Y AXIS                   *
!*                                                                      *
!*  OUTPUT:                                                             *
!*      XRANGE - RANGE OF X-AXIS                                        *
!*      YRANGE - RANGE OF Y-AXIS                                        *
!*      XPIXVAL - VALUE OF ONE X PIXEL                                  *
!*      YPIXVAL - VALUE OF ONE Y PIXEL                                  *
!*      XPIXOFF - ZERO OFFSET FOR X-AXIS IN PIXELS                      *
!*      YPIXOFF - ZERO OFFSET FOR Y-AXIS IN PIXELS                      *
!*                                                                      *
!************************************************************************

!* CALCULATE THE X AND Y PIXEL VALUES
  XRANGE = XMAX - XMIN
  YRANGE = YMAX - YMIN
  XPIXVAL = XRANGE/REAL(WC.NUMXPIXELS)
  YPIXVAL = YRANGE/REAL(WC.NUMYPIXELS)
!* CALCULATE THE PIXEL OFFSET FOR ABSOLUTE PIXEL ADDRESSING
  XPIXOFF = XMIN/XPIXVAL
  YPIXOFF = YMAX/YPIXVAL

  RETURN
END
