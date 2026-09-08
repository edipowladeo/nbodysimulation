SUBROUTINE READ_CHAOS
!******************************************************************************
!*                                                                            *
!*  THIS SUBROUTINE READS A CHAOS   DATA FILE. IF THE FILE DOES NOT EXISTS A  *
!*  MESSAGE BOX IS DISPLAYED                                                  *
!*                                                                            *
!******************************************************************************
  USE MSFLIB
  USE CHAOSCOM
  USE INPUTINFO

  IMPLICIT NONE

  NAMELIST /CHAOSINPUT/ NUMXPIXELS , NUMYPIXELS, NUMCOLORS, A, B, C, D, &
                        X1_INP, Y1_INP, IWASTE, IMINMAX, IIMAGE,       &
						LROTAT, ROTMAG, SCALMM, IDIV, ICHAOS

  CHARACTER(LEN=60)MSG0, MSG1
  INTEGER(KIND=4)IRET, IERR
  MSG0 = ''C
  MSG1 = ''C
!* OPEN INPUT FILE
  OPEN(UNIT = 100, FILE = CHAOS_INP, STATUS = 'OLD', IOSTAT = IERR)
  IF(IERR .NE. 0)THEN
    MSG0 = ' ERROR OPENING INPUT FILE '//CHAOS_INP//' 'C
	MSG1 = ' ERROR OPENING FILE 'C
	IRET = MESSAGEBOXQQ(MSG0, MSG1,MB$ICONEXCLAMATION .OR. MB$OK)
	RETURN
  ENDIF
!* 
!* READ IN INFOPRMATION
!*

  READ(100,CHAOSINPUT, IOSTAT = IERR)
  IF(IERR .NE. 0)THEN
    MSG0 = ' ERROR READING INPUT FILE '//CHAOS_INP//' 'C
	MSG1 = ' ERROR READING FILE 'C
	IRET = MESSAGEBOXQQ(MSG0, MSG1,MB$ICONEXCLAMATION .OR. MB$OK)
	RETURN
  ENDIF


  CLOSE(UNIT=100)

!* SET THE VIDEO MODE
  CALL SET_VIDEO

  RETURN
END
