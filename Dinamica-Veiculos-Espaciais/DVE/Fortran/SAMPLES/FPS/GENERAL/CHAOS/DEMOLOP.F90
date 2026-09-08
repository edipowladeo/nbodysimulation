SUBROUTINE DEMOLOP
!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR SUBROUTINE DEMOLOP                                        *
!*                                                                            *
!*  THIS SUBROUTINE IS USED TO RUN THE PROGRAM IN A DEMO MODE.  IT LOOPS      *
!*  THROUGH A SERIES FO DATA FILES UNTIL TOLD TO STOP                         *
!*                                                                            *
!******************************************************************************

  USE MSFLIB
  USE GETWIN
  USE CHAOSCOM
  USE INPUTINFO

  CHARACTER FILARR(0:16)*15, INFILE*255

  DATA FILARR / 'SAVE3A.DAT', 'SAVE3B.DAT', 'SAVE3C.DAT', 'SAVE3D.DAT',   &
                'SAVE3E.DAT', 'SAVE3F.DAT', 'SAVE4A.DAT', 'SAVE4B.DAT',   &
				'SAVE4C.DAT', 'SAVE4D.DAT', 'SAVE4E.DAT', 'SAVE5A.DAT',   &
                'SAVE5B.DAT', 'SAVE5C.DAT', 'SAVE5D.DAT', 'SAVE5E.DAT',   &
				'SAVE5F.DAT'/

  NAMELIST /CHAOSINPUT/ NUMXPIXELS, NUMYPIXELS, NUMCOLORS, A, B, C, D, &
                        X1_INP, Y1_INP, IWASTE, IMINMAX, IIMAGE,       &
						LROTAT, ROTMAG, SCALMM, IDIV, ICHAOS


  I = 0
  LDEMO = .TRUE.
  CHAOS_FILE_INP = .TRUE.
  DO WHILE (LDEMO)
    IFILE = MOD(I, 17)
    IF(IFILE .GE. 0 .AND. IFILE .LE. 16)THEN
      INFILE = FILARR(IFILE) 
      OPEN(FILE = INFILE, UNIT = 12, STATUS = 'UNKNOWN')
	  REWIND(UNIT=12)   
      READ(12,CHAOSINPUT)
	  IIMAGE = 3000
      CALL SET_VIDEO
    ENDIF
    I = I+1
    CALL CHAOSDRV
    IF(OUT)THEN
      OUT = .FALSE.
      EXIT
    ENDIF
  END DO

  RETURN
END
