SUBROUTINE SELECT_CHAOS_SYM(CHECKED)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE CREATES A DIALOG BOX THAT ALLOWS THE USER TO SPECIFY   *
!*  THE DEGREE OF SYMETRY OF THE CHAOS EQUATION DESIRED.  IT ALSO SETS     *
!*  THE CALL BACK ROUTINES FOR THE HELP AND OK BUTTONS.                    *
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
  CHARACTER(LEN=55) MSG0, MSG1
  EXTERNAL SELECT_CHAOS_SYM_HELP, SELECT_CHAOS_SYM_OK
  LOGICAL(KIND=4)CHECKED

  CALL UNUSEDQQ(CHECKED)

  IERR = 0
  MSG0 = ''C
  MSG1 = ''C

!* INITIALIZE THE DIALOG BOX
  RET = DLGINIT(IDD_CHAOS_SEL, DLG)
!* SET UP CALLBACK ROUTINES FOR HELP AND OK BUTTON
  RET = DLGSETSUB(DLG, IDHELP_CHAOS_SEL, SELECT_CHAOS_SYM_HELP)
  RET = DLGSETSUB(DLG, IDOK, SELECT_CHAOS_SYM_OK)

!* INITIALIZE ALL RADIO BUTTONS
  RETLOG = DLGSET(DLG, IDC_RADIO_THREE, .FALSE.)
  RETLOG = DLGSET(DLG, IDC_RADIO_FOUR, .FALSE.)
  RETLOG = DLGSET(DLG, IDC_RADIO_FIVE, .FALSE.)

!* SET THE RADIO BUTTON FOR THE SELECTION CURRENTLY DEFINED BY ICHAOS
  SELECT CASE(ICHAOS)
    CASE(3)
      RETLOG = DLGSET(DLG, IDC_RADIO_THREE, .TRUE.)
	CASE(4)
	  RETLOG = DLGSET(DLG, IDC_RADIO_FOUR, .TRUE.)
    CASE(5)
      RETLOG = DLGSET(DLG, IDC_RADIO_FIVE, .TRUE.)
  END SELECT


!* BRING UP THE DIALOG BOX
  IRET = DLGMODAL(DLG)


!* DESTROY AND RELEASE THE DIALOG RESOURCES
  CALL DLGUNINIT(DLG)

  RETURN
END SUBROUTINE SELECT_CHAOS_SYM
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SUBROUTINE SELECT_CHAOS_SYM_HELP(DLGPARENT, ID, CALLBACKTYPE)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE CREATS A DIALOG BOX CONTAINING HELP FOR THE SELECT     *
!*  CHAOS TYPE  DIALOG BOX.  IT IS A CALLBACK ROUITINE FOR THE HELP BUTTON *
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
  RET = DLGINIT(IDD_CHAOS_SEL_HELP, DLG2)

  IRET = DLGMODAL(DLG2)

  CALL DLGUNINIT(DLG2)
  RETURN
END SUBROUTINE SELECT_CHAOS_SYM_HELP
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SUBROUTINE SELECT_CHAOS_SYM_OK(DLG, ID, CALLBACKTYPE)
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE IS THE CALLBACK ROUTINE FOR WHEN THE OK BUTTON IS      *
!*  PUSHED IN THE SELECT CHAOS EQUATION DIALOG BOX.  IT CONTAINS CODE TO   *
!*  SENSE IF NONE OF THE RADIO BUTTONS HAVE BEEN SELECTED.  IF AN ERROR    *
!*  OCCURS, AN ERROR MESSAGE IS PRINTED IF NO ERROR OCCURS, THE DIALOG     *
!*  RETURN VALUE IS SET TO THE ID NUMBER FOR THE OK BUTTEN AND THE DIALOG  *
!*  IS EXITED                                                              *
!*                                                                         *
!***************************************************************************
  USE MSFLIB
  USE DIALOGM
  USE CHAOSCOM

  IMPLICIT NONE

  INCLUDE 'RESOURCE.FD'
  TYPE(DIALOG)DLG

  LOGICAL(KIND=4)RET, LERR, PUSH3, PUSH4, PUSH5
  INTEGER(KIND=4)IRET, ID, CALLBACKTYPE
  CHARACTER(LEN=55) MSG0, MSG1

  CALL UNUSEDQQ(ID, CALLBACKTYPE)
  LERR = .FALSE.
!* GET THE NEW INFORMATION
    RET = DLGGET(DLG, IDC_RADIO_THREE, PUSH3)
    RET = DLGGET(DLG, IDC_RADIO_FOUR, PUSH4)
    RET = DLGGET(DLG, IDC_RADIO_FIVE, PUSH5)
!* SET ICHAOS FOR THE BUTTON THAT HAS BEEN PUSHED
	IF(PUSH3)THEN
	  ICHAOS=3
	ELSE IF (PUSH4) THEN
	  ICHAOS=4
	ELSE IF (PUSH5) THEN
	  ICHAOS=5
    ELSE
!* ERROR NO BUTTON HAS BEEN PUSHED
	  MSG0 = ' NONE OF THE RADIO BUTTONS WERE PUSHED, PLEASE TRY AGAIN'C	  
	  MSG1 = ' SELECT SYMMETRY'C
	  IRET = MESSAGEBOXQQ(' NONE OF THE RADIO BUTTONS WERE PUSHED, PLEASE TRY AGAIN'C , &
	                      ' SELECT SYMMETRY'C,MB$ICONEXCLAMATION .OR. MB$OK)
      LERR = .TRUE.
    ENDIF

  IF(.NOT. LERR)THEN
!* SET RETURN VALUE AND EXIT
	CALL DLGSETRETURN(DLG, IDOK)
    CALL DLGEXIT(DLG)
  ENDIF

  RETURN
END SUBROUTINE SELECT_CHAOS_SYM_OK
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

