SUBROUTINE GO_DEMO(ARG2)
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR SUBROUTINE GO_DEMO(ARG2)                                  *
!*                                                                            *
!*  THIS SUBROTINE IS USED TO CALL THE SUBROUTINE THAT DOES THE CHAOS DEMO    *
!*  MODE                                                                      *
!*                                                                            *
!******************************************************************************

  USE MT
  IMPLICIT NONE

  INTEGER(4) ARG2

  ARG2 = 1
  CALL DEMOLOP
  CALL EXITTHREAD(0)		!exit code is 0

  RETURN
END
