PROGRAM CHAOS
  USE MSFLIB
  USE DIALOGM
  IMPLICIT NONE

  INTEGER(KIND=4)I4



!* This is the main loop of the program.  It does nothing but 
!* cycle endlessly, allowing the menus to be used. 
  PRINT*, 'Chaos Demo Program'
  I4 = ABOUTBOXQQ('QuickWin Chaos Program\rVersion 1.0'C)
  DO WHILE(.TRUE.)
    CALL YIELDQQ
  END DO
END
!* The INITIALSETTINGS function initializes the menus that will appear 
!* when the program starts. It is called internally by the QuickWin
!* startup code and should never be directly called from the program.
!*
!* To debug the INITIALSETTINGS routine, put a breakpoint in the code 
!* before starting to debug.  This is necessary since the code gets

!* called before any FORTRAN code is executed.
!
!* Note how the first (menu item 0) menu item for each new menu uses 
!* NUL for the menu routine.
!
!* This routine demonstrates the following menu functions:
!

LOGICAL(KIND=4) FUNCTION INITIALSETTINGS
  USE MSFLIB
  USE DIALOGM
  USE MT
  USE CHAOSCOM
  USE INPUTINFO

  IMPLICIT NONE

  CHARACTER(LEN=50)mname
  INTEGER(KIND=4)mnum
  EXTERNAL INTERACT, INPFIL, CHAOSDRV, STPDRW, SAVFIL, ChgPal, MODCOF, LOOK, &
	       LAUNCH_DEMO, ROTMOD, INPCHAOSFIL, INPPALLETFIL, SET_VID_PARAMS,       &
		   SELECT_CHAOS_SYM, SET_CHAOS_COEFF, WASTE_IT, MINMAX, IMAGE, SCALE,&
		   INITIALXY, ROTATE, QUANTCOL, PALLET_PARMS, SAVCHAOSFIL, SAVPALLETFIL,&
		   LAUNCH_CHAOSDRV, VIEWVIDMODE, SHOW_PALLET, HELP_ABOUT, HELP_INFO_SRC3, &
		   EXITPROG

  
  mnum = 1
  mname = '&File'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,nul)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = 'Input &Chaos Data File...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,InpChaosFil)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = 'Input P&alette Data File...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,InpPalletFil)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Save Chaos Data File...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,SavChaosFil)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF
  mname = 'Save Palette &Data File...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,SavPalletFil)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Print...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,WINPRINT)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = 'Sa&ve...'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,WINSAVE)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = 'E&xit'c       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,EXITPROG)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mnum = 2
  mname = '&Input'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,nul)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Set Video Mode...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,Set_Vid_Params)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Chaos Symmetry...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,Select_Chaos_Sym)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = 'C&haos Coeffecients...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,Set_Chaos_Coeff)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Number of Points to Waste...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,Waste_It)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = 'Number of Points for &Min/Max Calculations...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,MinMax)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = 'N&umber of Points for Image Calculations...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,Image)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Drawing Scale Factor...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,Scale)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Initial X and Y Conditions...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,INITIALXY)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = 'Drawing &Rotation...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,Rotate)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = 'C&olor Stepping...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,QuantCol)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Palette Generation...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,PALLET_PARMS)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mnum = 3
  mname = '&View'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,nul)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Video Mode...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,VIEWVIDMODE)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Palette!'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,SHOW_PALLET)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Drawing Statistics...'C       

  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,Look)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mnum = 4
  mname = '&Run'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,nul)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Go'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,LAUNCH_Chaosdrv)) THEN
    LDEMO = .FALSE.
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF
               
  mname = '&Stop Drawing'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,STPDRW)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF
               
  mname = '&Demo'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,LAUNCH_DEMO)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Pause'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,WINSTATE)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF
  
  mnum = 5
  mname = '&Window'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,nul)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF
  mname = '&Full Screen'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,WINFULLSCREEN)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF
  mname = '&Size to Fit'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,WINSIZETOFIT)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Cascade'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,WINCASCADE)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Tile'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,WINTILE)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&Arrange Icons'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,WINARRANGE)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mnum = 6
  mname = '&Help'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,nul)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&About Chaos...'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,WINABOUT)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  mname = '&More Information'C       
  IF (.NOT.APPENDMENUQQ(mnum,$menuenabled,mname,HELP_INFO_SRC3)) THEN

    INITIALSETTINGS = .FALSE.
    RETURN
  END IF

  IF (.NOT.SETWINDOWMENUQQ(mnum)) THEN
    INITIALSETTINGS = .FALSE.
    RETURN
  END IF
  
  INITIALSETTINGS = .TRUE.
  RETURN  
END      
