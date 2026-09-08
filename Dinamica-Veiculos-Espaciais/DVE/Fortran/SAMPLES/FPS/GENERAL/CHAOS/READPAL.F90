SUBROUTINE READ_PALLET
!******************************************************************************
!*                                                                            *
!*  THIS SUBROUTINE READS A PALETTE DATA FILE. IF THE FILE DOES NOT EXISTS A  *
!*  MESSAGE BOX IS DISPLAYED                                                  *
!*                                                                            *
!******************************************************************************
  USE MSFLIB
  USE INPUTINFO
  USE PALET

  IMPLICIT NONE

  NAMELIST /PALLETINPUT/ LCHG, RPHS, BPHS, GPHS, RDELTHE, BDELTHE, GDELTHE, &
                  LSEE, RMAX, BMAX, GMAX, IRDELAY, IBDELAY, IGDELAY,        &
				  REDSTART, REDEND, GREENSTART, GREENEND, BLUESTART,        &
				  BLUEEND, LNRED, LNGREEN, LNBLUE



  CHARACTER(LEN=60)MSG0, MSG1
  INTEGER(KIND=4)IRET, IERR

!* OPEN INPUT FILE
  OPEN(UNIT = 100, FILE = PALLET_INP, STATUS = 'OLD', IOSTAT = IERR)
  IF(IERR .NE. 0)THEN
    MSG0 = ' ERROR OPENING INPUT FILE '//PALLET_INP//' 'C
	MSG1 = ' ERROR OPENING FILE 'C
	IRET = MESSAGEBOXQQ(MSG0, MSG1,MB$ICONEXCLAMATION .OR. MB$OK)
	RETURN
  ENDIF
!* 
!* READ IN THE INFOPRMATION
!*

  READ(100,PALLETINPUT, IOSTAT=IERR)
  IF(IERR .NE. 0)THEN
    MSG0 = ' ERROR READING INPUT FILE '//PALLET_INP//' 'C
	MSG1 = ' ERROR READING FILE 'C
	IRET = MESSAGEBOXQQ(MSG0, MSG1, MB$ICONEXCLAMATION .OR. MB$OK)
    CLOSE(UNIT=100)
  	RETURN
  ENDIF
  CLOSE(UNIT=100)
  LCHG = .TRUE.

!* CREATE THE NEW PALLET
  CALL PALLET

RETURN
END
