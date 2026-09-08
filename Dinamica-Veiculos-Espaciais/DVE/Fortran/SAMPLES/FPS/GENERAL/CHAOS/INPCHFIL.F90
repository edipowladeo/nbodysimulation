SUBROUTINE INPCHAOSFIL(CHECKED)
!***************************************************************************
!*																	       *
!*  THIS SUBROUTINE CREATES A DIALOG BOX THAT ALLOWS THE USER TO INPUT THE *
!*  CHAOS DATA FILE.  THIS ROUTINE USES THE SYSTEM COMMON DIALOG ACCESSES  *
!*  THROUGH THE WINDOWS API'S                                              *
!*																		   *
!***************************************************************************

  USE MSFLIB
  USE INPUTINFO
  USE MSFWINTY
  USE MSFWIN

  IMPLICIT NONE

  TYPE (T_OPENFILENAME)FRED

  LOGICAL(KIND=4)RET
  INTEGER(KIND=4)IERROR
  CHARACTER(LEN=26)FILTER(7)
  CHARACTER(LEN=60)DLGTITLE
  LOGICAL(KIND=4)CHECKED

  CALL UNUSEDQQ(CHECKED)

  FILTER(1) = 'Chaos data files(*.DAT)  'C
  FILTER(2) = '*.dat                    'C
  FILTER(3) = 'Palette data files(*.PAL)'C
  FILTER(4) = '*.pal                    'C
  FILTER(5) = 'All files(*.*)           'C
  FILTER(6) = '*.*                      'C
  FILTER(7) = ''C


  DLGTITLE = 'Input Chaos Data File'C


  FRED%LSTRUCTSIZE = (BIT_SIZE(FRED%LSTRUCTSIZE) +        &
                       BIT_SIZE(FRED%HWNDOWNER) +        &
                       BIT_SIZE(FRED%HINSTANCE) +        &
                       BIT_SIZE(FRED%LPSTRFILTER) +        &
                       BIT_SIZE(FRED%LPSTRCUSTOMFILTER) +        &
                       BIT_SIZE(FRED%NMAXCUSTFILTER) +        &
                       BIT_SIZE(FRED%NFILTERINDEX) +        &
                       BIT_SIZE(FRED%LPSTRFILE) +        &
                       BIT_SIZE(FRED%NMAXFILE) +        &
                       BIT_SIZE(FRED%LPSTRFILETITLE) +        &
                       BIT_SIZE(FRED%NMAXFILETITLE) +        &
                       BIT_SIZE(FRED%LPSTRINITIALDIR) +        &
                       BIT_SIZE(FRED%LPSTRTITLE) +        &
                       BIT_SIZE(FRED%FLAGS) +        &
                       BIT_SIZE(FRED%NFILEOFFSET) +        &
                       BIT_SIZE(FRED%NFILEEXTENSION) +        &
                       BIT_SIZE(FRED%LPSTRDEFEXT) +        &
                       BIT_SIZE(FRED%LCUSTDATA) +        &
                       BIT_SIZE(FRED%LPFNHOOK) +        &
                       BIT_SIZE(FRED%LPTEMPLATENAME))/8

  FRED%HWNDOWNER = NULL
  FRED%HINSTANCE = NULL
  FRED%LPSTRFILTER = LOC(FILTER(1))
  FRED%LPSTRCUSTOMFILTER = NULL
  FRED%NMAXCUSTFILTER = NULL
  FRED%NFILTERINDEX = 1
  FRED%LPSTRFILE = LOC(CHAOS_INP) 
  FRED%NMAXFILE = LEN(CHAOS_INP) 
  FRED%LPSTRFILETITLE = NULL 
  FRED%NMAXFILETITLE = NULL
  FRED%LPSTRINITIALDIR = NULL
  FRED%LPSTRTITLE = LOC(DLGTITLE)
  FRED%FLAGS = NULL 
  FRED%NFILEOFFSET = NULL
  FRED%NFILEEXTENSION = NULL
  FRED%LPSTRDEFEXT = NULL
  FRED%LCUSTDATA = NULL
  FRED%LPFNHOOK = NULL
  FRED%LPTEMPLATENAME = NULL 


  RET = GETOPENFILENAME(FRED)

  CALL COMDLGER(IERROR)

  CHAOS_FILE_INP = .FALSE.
!* CHECK TO SEE IF THE OK BUTTON HAS BEEN PRESSED
  IF(RET .AND. (IERROR == 0))THEN
	CALL READ_CHAOS
	CHAOS_FILE_INP = .TRUE.
  ENDIF

  RETURN
END SUBROUTINE INPCHAOSFIL
