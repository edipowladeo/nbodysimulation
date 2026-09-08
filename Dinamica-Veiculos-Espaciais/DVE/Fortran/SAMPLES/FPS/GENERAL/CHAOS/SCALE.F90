SUBROUTINE SCALE(CHECKED)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE CREATES THE DIALOG THAT ALLOWS THE USER TO INPUT A     *
!*  SCALE FACTOR FOR THE IMAGE BEING GENERATED.  IT ALSO SETS UP THE       *
!*  CALLBACK ROUTINES FOR THE HELP AND OK BUTTONS                          *
!*                                                                         *
!***************************************************************************

  USE MSFLIB
  USE DIALOGM
  USE CHAOSCOM

  IMPLICIT NONE

  INCLUDE 'RESOURCE.FD'

  TYPE(DIALOG)DLG

  LOGICAL(KIND=4)RET, RETLOG
  INTEGER(KIND=4)IRET, IERR
  CHARACTER(LEN=55) CTEMP, MSG0, MSG1
  EXTERNAL SCALE_HELP, SCALE_OK
  LOGICAL(KIND=4)CHECKED

  CALL UNUSEDQQ(CHECKED)

  IERR = 0
  MSG0 = ''C
  MSG1 = ''C

!* INITIALIZE THE DIALOG BOX
  RET = DLGINIT(IDD_SCALE, DLG)
!* SET UP THE CALLBACKS FOR THE OK AND HELP BUTTONS
  RET = DLGSETSUB(DLG, IDHELP_SCALE, SCALE_HELP)
  RET = DLGSETSUB(DLG, IDOK, SCALE_OK)

!* GET THE CURRENT VALUES  AND PUT IT IN THE 
!* EDIT FIELD
  WRITE(CTEMP,*)SCALMM
  RETLOG = DLGSET(DLG, IDC_EDIT_SCALE, CTEMP)

!* BRING UP THE DIALOG BOX
  IRET = DLGMODAL(DLG)

!* DESTROY AND RELEASE THE DIALOG RESOURCES
  CALL DLGUNINIT(DLG)

  RETURN
END SUBROUTINE SCALE
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SUBROUTINE SCALE_HELP(DLGPARENT, ID, CALLBACKTYPE)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE IS THE CALLBACK ROUTINE FOR WHEN THE HELP BUTTON IS    *
!*  PUSHED IN THE SET DRAWING SCALE FACTOR DIALOG BOX.  IT BRINGS UP A     *
!*  DIALOG BOX WITH HELP INFORMATION IN IT                                 *
!*                                                                         *
!***************************************************************************
  USE MSFLIB
  USE DIALOGM

  IMPLICIT NONE

  INCLUDE 'RESOURCE.FD'

  TYPE(DIALOG)DLG2
  TYPE(DIALOG)DLGPARENT

  LOGICAL(KIND=4)RET
  INTEGER(KIND=4)IRET, ID, CALLBACKTYPE
  
  CALL UNUSEDQQ(DLGPARENT, ID, CALLBACKTYPE)

!* INITIALIZE THE DIALOG BOX
  RET = DLGINIT(IDD_SCALE_HELP, DLG2)
!* CREATE DIALOG
  IRET = DLGMODAL(DLG2)
!* DESTROY DIALOG AND RELEASE RESOURCES
  CALL DLGUNINIT(DLG2)
  END SUBROUTINE SCALE_HELP
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SUBROUTINE SCALE_OK(DLG, ID, CALLBACKTYPE)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE IS THE CALLBACK ROUTINE FOR WHEN THE OK BUTTON IS      *
!*  PUSHED IN THE SET DRAWING SCALE FACTOR DIALOG BOX.  IT CONTAINS CODE TO*
!*  SENSE IF AN INVALID ENTRY IN THE EDIT BOX HAS BEEN MADE.  IF AN ERROR  *
!*  OCCURS, AN ERROR MESSAGE IS PRINTED AND THE EDIT BOX IS RESET BACK TO  *
!*  ITS ORIGINAL VALUE.  IF NO ERROR OCCURS, THE DIALOG RETURN VALUE IS    *
!*  SET TO THE ID NUMBER FOR THE OK BUTTEN AND THE DIALOG IS EXITED        *
!*                                                                         *
!***************************************************************************
  USE MSFLIB
  USE DIALOGM
  USE CHAOSCOM

  IMPLICIT NONE

  INCLUDE 'RESOURCE.FD'
  TYPE(DIALOG)DLG

  LOGICAL(KIND=4)RET, LERR
  INTEGER(KIND=4)IRET, ID, CALLBACKTYPE, IERR
  CHARACTER(LEN=55) CTEMP, MSG0, MSG1

  CALL UNUSEDQQ(ID, CALLBACKTYPE)
  LERR = .FALSE.

!* GET THE NEW INFORMATION
  RET = DLGGET(DLG, IDC_EDIT_SCALE, CTEMP)
  READ(CTEMP,*,IOSTAT = IERR)SCALMM
  IF(IERR /= 0)THEN
!* ERROR CONDITION, PRINT MESSAGE, RELOAD EDIT BOX
    MSG0 = 'ERROR READING INFORMATION IN EDIT FIELD'C
    MSG1 = 'ERROR READING INFORMATION'C
    IRET = MESSAGEBOXQQ(MSG0, MSG1,MB$ICONEXCLAMATION .OR. MB$OK)
    WRITE(CTEMP,*)SCALMM
    RET = DLGSET(DLG, IDC_EDIT_SCALE, CTEMP)
    LERR = .TRUE.
  ENDIF


  IF(.NOT. LERR)THEN
!* SET DIALOG RETURN VALUE AND EXIT DIALOG BOX
	CALL DLGSETRETURN(DLG, IDOK)
    CALL DLGEXIT(DLG)
  ENDIF
  RETURN
END SUBROUTINE SCALE_OK
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

