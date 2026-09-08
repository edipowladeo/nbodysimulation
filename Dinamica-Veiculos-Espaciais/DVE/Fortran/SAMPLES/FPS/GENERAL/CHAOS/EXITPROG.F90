SUBROUTINE EXITPROG(CHECKED)
!****************************************************************************************
!*
!* THIS SUBROUTINE IS CALLED TO TERMINATE THE DRAWING IF THE FILE.EXIT MENU IS SELECTED
!*
!****************************************************************************************
  USE MSFLIB
  USE CHAOSCOM

  IMPLICIT NONE

  LOGICAL(KIND=4)CHECKED

  CALL UNUSEDQQ(CHECKED)
  IF(.NOT.OUT)THEN
    OUT = .TRUE.
    LDEMO = .FALSE.
  ENDIF

  STOP
END
