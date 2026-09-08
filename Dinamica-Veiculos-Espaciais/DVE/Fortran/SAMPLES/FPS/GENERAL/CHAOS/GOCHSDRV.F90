SUBROUTINE GO_CHAOSDRV(ARG2)
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR SUBROUTINE GO_CHAOSDRV(ARG2)                              *
!*                                                                            *
!*  THIS SUBROTINE IS USED TO CALL THE SUBROUTINE THAT DOES THE CHAOS         *
!*  CALCULATIONS                                                              *
!*                                                                            *
!******************************************************************************

  USE MT
  IMPLICIT NONE

  INTEGER(4) ARG2

  ARG2 = 1
  CALL CHAOSDRV
  CALL EXITTHREAD(0)		!exit code is 0

  RETURN
END
