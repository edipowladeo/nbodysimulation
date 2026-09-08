SUBROUTINE TOTAL_INIT
!***************************************************************************
!*                                                                         *
!*  THIS SUBROUTINE IS USED TO INITIALIZE THE CHAOS DRIVER BEFORE THE      *
!*  START OF THE START OF AN IMAGE GENERATION.  IT SETS THE DEFAULT VALUES *
!*  OF VARIOUS PARAMETERS IF NO FILES HAVE BEEN READ IN.                   *
!*                                                                         *
!***************************************************************************

  USE MSFLIB
  USE CHAOSCOM
  USE INPUTINFO
  USE PALET

  IMPLICIT NONE

  TYPE(WINDOWCONFIG)CURRENT

  LOGICAL(KIND=4)IRET
!* IF NOT RUNNING IN DEMO MODE, SET THE VIDEO PARAMETERS.
  IF(.NOT.LDEMO)THEN
    CALL SET_VIDEO
  ENDIF
  
  IRET = GETWINDOWCONFIG(CURRENT)

  X1 = X1_INP
  Y1 = Y1_INP
  ISTART = 0
  INUM = 0

!* CALCULATE ROTATION PARAMETERS
  IF(LROTAT)THEN
!* THIS SWCTION OF CODE MODIFIES THE VALUE OF ROTMAG SO THAT
!* AN INTEGER NUMBER OF COPIES OF THE IMAGE IS CREATED
    NDIV = NINT((2.00E+00*3.14159270E+00)/ROTMAG)
    ROTMAG = (2.00E+00*3.14159270E+00)/REAL(NDIV)
  ENDIF

!* INITIALIZE TERMINATION FLAG TO FALSE
  OUT = .FALSE.

!* PALLET INITIALIZATION
!* CHANGE THE PALLET
  CALL CREATE_PALLET
!* IF NO INPUT CHAOS FILE HAS BEEN READ, SET DEF PARAMETERS
  IF(.NOT.CHAOS_FILE_INP)THEN
    IF(ICHAOS .EQ.3)THEN
      A = -1.701E+00															   
      B =  0.910E+00														   
      C = -0.129E+00															   
      D =  0.713E+00															   
      X1_INP = 0.0106E+00
      Y1_INP =-0.0102E+00															   
      X1 = X1_INP
      Y1 = Y1_INP
	ELSE IF (ICHAOS .EQ. 4)THEN
      A = -1.06E+00
      B =  0.7E+00
      C = -0.129E+00
      D =  0.712E+00
      X1_INP =-0.0106E+00
      Y1_INP =-0.0102E+00
      X1 = X1_INP
      Y1 = Y1_INP
	ELSE IF (ICHAOS .EQ. 5)THEN
      A = -1.61E+00
      B =  0.93E+00
      C =  0.25E+00
      D =  0.713E+00
      X1_INP = 0.0106E+00
      Y1_INP =-0.0102E+00
      X1 = X1_INP
      Y1 = Y1_INP
	ENDIF
  ENDIF      


RETURN
END
