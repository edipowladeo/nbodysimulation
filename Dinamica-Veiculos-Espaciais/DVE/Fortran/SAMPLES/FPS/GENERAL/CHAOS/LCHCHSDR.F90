SUBROUTINE LAUNCH_CHAOSDRV(ARG2)
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR SUBROUTINE LAUNCH_CHAOSDRV(ARG2)                          *
!*                                                                            *
!*  THIS SUBROUTINE IS USED TI LAUNCH THE THREAD THAT DOES THE CHAOS EQUATIONS*
!*  AND PLOTTING                                                              *
!*                                                                            *
!******************************************************************************

  USE MT
  USE MSFLIB
  USE CHAOSCOM

  IMPLICIT NONE

  CHARACTER(LEN=100)MSG0, MSG1
  INTEGER(KIND=4)IRET
  EXTERNAL GO_CHAOSDRV

  INTEGER(KIND=4) ARG2, THREADHANDLE,THREADID

  IF(.NOT. LRUNNING)THEN
    LRUNNING = .TRUE.
    THREADHANDLE = CREATETHREAD(0,0,GO_CHAOSDRV,ARG2,0,THREADID)
  ELSE
    MSG0 = ' YOU HAVE ALREADY STARTED AN IMAGE.  PRESS RUN.STOP DRAWING TO TERMINATE CURRENT IMAGE 'C
	MSG1 = ' IMAGE ALL READY RUNNING'C
	IRET = MESSAGEBOXQQ(MSG0, MSG1,MB$ICONEXCLAMATION .OR. MB$OK)
  ENDIF

  RETURN
  
END
