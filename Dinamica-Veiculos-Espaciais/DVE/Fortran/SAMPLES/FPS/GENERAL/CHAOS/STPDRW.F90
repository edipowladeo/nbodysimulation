SUBROUTINE STPDRW(CHECKED)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE IS CALLED WHEN THE RUN.STOP DRAWING MENU ITEM IS       *
!*  CHOSEN.  IT SETS A SERIES OF FLAGS TO TERMINATE THE IMAGE GENERATION   *
!*  PROCESS AND DISPLAYS A MESSAGE BOX THAT INFORMS THE USER OF THIS.      *
!*                                                                         *
!***************************************************************************
  USE MSFLIB
  USE CHAOSCOM

  IMPLICIT NONE

  LOGICAL(KIND=4)CHECKED
  INTEGER(KIND=4) IRET

  CALL UNUSEDQQ(CHECKED)
  
  OUT = .TRUE.
  IRET = MESSAGEBOXQQ('DRAWING STOPPED'C,'STOP DRAWING'C,MB$OK)
  LDEMO = .FALSE.
  LRUNNING = .FALSE.
  RETURN
END
