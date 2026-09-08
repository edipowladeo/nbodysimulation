SUBROUTINE WASTE_IT(CHECKED)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE CREATES A DIALOG BOX THAT ALLOWS THE USER TO INPUT THE *
!*  NUMBER OF POINTS TO WASTE BEFORE THE GENERATION OF THE IMAGE           *
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
  EXTERNAL WASTE_IT_HELP, WASTE_IT_OK
  LOGICAL(KIND=4)CHECKED

  CALL UNUSEDQQ(CHECKED)

  IERR = 0
  MSG0 = ''C
  MSG1 = ''C


!* INITIALIZE THE DIALOG BOX
  RET = DLGINIT(IDD_WASTE, DLG)
!* SET UP THE CALLBACK SUBROUTINES FOR THE HELP AND OK BUTTONS
  RET = DLGSETSUB(DLG, IDHELP_WASTE, WASTE_IT_HELP)
  RET = DLGSETSUB(DLG, IDOK, WASTE_IT_OK)

!* GET THE CURRENT VALUES OF THE NUMBER OF POINTS AND PUT IT IN THE 
!* EDIT FIELD
  WRITE(CTEMP,*)IWASTE
  RETLOG = DLGSET(DLG, IDC_EDIT_WASTE, CTEMP)

!* BRING UP THE DIALOG BOX
  IRET = DLGMODAL(DLG)

!* DESTROY AND RELEASE THE DIALOG RESOURCES
  CALL DLGUNINIT(DLG)

  RETURN
END SUBROUTINE WASTE_IT
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SUBROUTINE WASTE_IT_HELP(DLGPARENT, ID, CALLBACKTYPE)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE CREATES A DIALOG BOX THAT BRINGS UP HELP INFORMATION   *
!*  FOR THE NUMBER OF POINTS TO WASTE DIALOG BOX                           *
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

!* THESE ARE TO PREVENT COMPILER WARNINGS FOR UNUSED VARIABLES
  CALL UNUSEDQQ(DLGPARENT, ID, CALLBACKTYPE)

!* INITIALIZE THE DIALOG BOX
  RET = DLGINIT(IDD_WASTE_HELP, DLG2)
!* CREATE THE DIALOG BOX
  IRET = DLGMODAL(DLG2)

!* DESTROY AND RELEASE THE DIALOG RESOURCES
  CALL DLGUNINIT(DLG2)

  RETURN
END SUBROUTINE WASTE_IT_HELP
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SUBROUTINE WASTE_IT_OK(DLG, ID, CALLBACKTYPE)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE IS THE CALLBACK ROUTINE FOR THE OK BUTTON IN THE       *
!*  NUMBER OF POINTS TO WASTE DIALOG BOX.  IT EXTRACTS THE INFORMATION IN  *
!*  THE EDIT BOX AND LOADS IN INTO THE APPROPRIATE VARIABLE.  THERE IS     *
!*  ERROR CHECKING TO ALLOW THE PROGRAM TO KEEP RUNNING IF A NON-NUMERIC   *
!*  ENTRY IS MADE IN THE EDIT BOX.                                         *
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

!* THESE ARE TO PREVENT COMPILER WARNINGS FOR UNUSED VARIABLES
  CALL UNUSEDQQ(ID, CALLBACKTYPE)
!* INITIALIZE ERROR FLAG
  LERR = .FALSE.

!* GET THE NEW INFORMATION
  RET = DLGGET(DLG, IDC_EDIT_WASTE, CTEMP)
  READ(CTEMP,*,IOSTAT = IERR)IWASTE
  IF(IERR /= 0)THEN
!* ERROR CONDITION, PRINT MESSAGE, RELOAD CURRENT VALUE IN EDIT BOX
    MSG0 = 'ERROR READING INFORMATION IN EDIT FIELD'C
    MSG1 = 'ERROR READING INFORMATION'C
    IRET = MESSAGEBOXQQ(MSG0, MSG1,MB$ICONEXCLAMATION .OR. MB$OK)
    WRITE(CTEMP,*)IWASTE
    RET = DLGSET(DLG, IDC_EDIT_WASTE, CTEMP)
!* SET ERROR FLAG
	LERR = .TRUE.
  ENDIF

  IF(.NOT. LERR)THEN
!* IF THERE IS NO ERROR SET RETURN VALUE TO OK BUTTON ID AND EXIT DIALOG BOX
	CALL DLGSETRETURN(DLG, IDOK)
    CALL DLGEXIT(DLG)
  ENDIF
  RETURN
END SUBROUTINE WASTE_IT_OK
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
