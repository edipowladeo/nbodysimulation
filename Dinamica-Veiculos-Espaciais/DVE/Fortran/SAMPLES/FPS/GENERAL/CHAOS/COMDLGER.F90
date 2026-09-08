SUBROUTINE COMDLGER(IRET)
!****************************************************************************************
!*
!* THIS SUBROUTINE IS CALLED TO DETECT ERRORS WHEN THE COMMON DIALOGS ARE CREATED
!*
!****************************************************************************************
  USE MSFLIB
  USE MSFWINTY
  USE MSFWIN

  IMPLICIT NONE

  CHARACTER(LEN=30)MSG1
  CHARACTER(LEN=210) MSG2
  INTEGER(KIND=4)IRET

  IRET = COMMDLGEXTENDEDERROR()
  MSG1 = 'FILE OPEN DIALOG FAILURE'C
  SELECT CASE(IRET)
    CASE (CDERR_FINDRESFAILURE)
	  MSG2 = 'The common dialog box procedure failed to find a specified resource.'C
    CASE (CDERR_INITIALIZATION)
	  MSG2 = 'The common dialog box procedure failed during initialization. This error often occurs when insufficient memory is available.'C
    CASE (CDERR_LOCKRESFAILURE)
	  MSG2 = 'The common dialog box procedure failed to lock a specified resource.'C
    CASE (CDERR_LOADRESFAILURE)
	  MSG2 = 'The common dialog box procedure failed to load a specified resource.'C
    CASE (CDERR_LOADSTRFAILURE)
	  MSG2 = 'The common dialog box procedure failed to load a specified string.'C
    CASE (CDERR_MEMALLOCFAILURE)
	  MSG2 = 'The common dialog box procedure was unable to allocate memory for internal structures.'C
    CASE (CDERR_MEMLOCKFAILURE)
	  MSG2 = 'The common dialog box procedure was unable to lock the memory associated with a handle.'C
    CASE (CDERR_NOHINSTANCE)
	  MSG2 = 'The ENABLETEMPLATE flag was specified in the Flags member of a structure for the corresponding common dialog box, but the appl&
ication failed to provide a corresponding instance handle.'C
    CASE (CDERR_NOHOOK)
	  MSG2 = 'The ENABLEHOOK flag was specified in the Flags member of a structure for the corresponding common dialog box, but the application&
 failed to provide a pointer to a corresponding hook function'C
    CASE (CDERR_NOTEMPLATE)
	  MSG2 = 'The ENABLETEMPLATE flag was specified in the Flags member of a structure for the corresponding common dialog box, but the &
application failed to provide a corresponding template.'C
    CASE (CDERR_STRUCTSIZE)
	  MSG2 = 'The lStructSize member of a structure for the corresponding common dialog box is invalid.'C
    CASE (FNERR_BUFFERTOOSMALL)
	  MSG2 = 'The buffer for a filename is too small. (This buffer is pointed to by the lpstrFile member of the structure for a common dialog box.)'C
    CASE (FNERR_INVALIDFILENAME)
	  MSG2 = 'A filename is invalid.'C
    CASE (FNERR_SUBCLASSFAILURE)
	  MSG2 = 'An attempt to subclass a list box failed because insufficient memory was available.'C
	CASE DEFAULT
	  MSG2 = 'Unknown error number'C
  END SELECT
  IF(IRET /= 0)THEN
    IRET = MESSAGEBOXQQ(MSG2, MSG1,MB$ICONEXCLAMATION .OR. MB$OK)
  ENDIF


  RETURN
END SUBROUTINE COMDLGER