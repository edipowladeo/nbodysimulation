SUBROUTINE CREATE_PALLET
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR SUBROUTINE CREATE_PALLET                                  *
!*                                                                            *
!*  THIS SUBROUTINE IS USED TO CREATE A PALLET AS DEFINED IN THE ARRAY PAL    *
!*                                                                            *
!******************************************************************************

  USE MSFLIB, SETPIXEL0 => SETPIXEL
  USE PALET

  IMPLICIT NONE

  CHARACTER(LEN=50)MESSAGE, CAPTION

  INTEGER(KIND=4)IRET

  CAPTION = 'CREATE PALETTE'C
  MESSAGE =' REMAPPING OF PALETTES NOT ALLOWED IN THIS MODE'C

  IF(LCHG)THEN
    IF( REMAPALLPALETTERGB( PAL ) .EQ. -1 ) THEN
      IRET = MESSAGEBOXQQ(MESSAGE, CAPTION, MB$IDOK) 
    END IF
  ENDIF
  RETURN
END