SUBROUTINE CHAOSDRV
  USE MSFLIB, SETPIXEL0=>SETPIXEL
  USE MSFWIN
  USE CHAOSCOM
  USE PALET

  IMPLICIT NONE

!******************************************************************************
!*                                                                            *
!*  DESCRIPTION FOR SUBROUTINE CHAOSDRV                                       *
!*                                                                            *
!*  THIS IS A DRIVER PROGRAM FOR A SERIES OF SUBROUTINES THAT GENREATE A      *
!*  SERIES OF CHAOTIC EQUATIONS THAT HAVE DIFFERENT LEVELS OF SYMETRY.  THIS  *
!*  PROGRAM REQUIRES THE FOLLOWING SUBROUTINES TO RUN:                        *
!*                                                                            *
!*              CHAOS3.FOR - 3 FOLD SYMETRY                                   *
!*              CHAOS4.FOR - 4 FOLD SYMETRY                                   *
!*              CHAOS5.FOR - 5 FOLD SYMETRY                                   *
!*                                                                            *
!*  AN INPUT FILE IS ALSO NEEDED WITH THE FOLLOWING INPUTS IN A NAMELIST      *
!*  ENTITLED XXXXXXX:                                                         *
!*                                                                            *
!*                                                                            *
!*  HINTS FOR USE                                                             *
!*                                                                            *
!*  CHANGING A, B, C, D:                                                      *
!*                                                                            *
!*     SMALL CHANGES IN THESE CONSTANTS CAN RESULTS IN RADICAL CHANGES IN THE *
!*     IMAGE GENERATED OR IN THE PROGRAM BLOWING UP WITH AN OVERFLOW ERROR OR *
!*     SOME OTHER FLOATING POINT ERROR.  YOU NEED TO EXPEREMENT BUT BE CAREFUL*
!*                                                                            *
!*  USING IWASTE:                                                             *
!*     IF YOU NOTICE THAT YOUR IMAGES ARE A FEW SCATTERED POINTS AND THEN     *
!*     SETTLES DOWN TO A COPUPE OF SPOTS, IT MEANS THAT THE EQUATION IS WILD  *
!*     AT THE BEGGINING AND THIS NEEDS TO BE INCREASED TO GET RID OF THE ILL  *
!*     BEHAVED POINTS.                                                        *
!*                                                                            *
!*  USING IMINMAX:                                                            *
!*   IF YOU NOTICE THAT YOUR IMAGES APPEAR TO BE CLIPPED OR CUTOFF AT THE     *
!*   EDGES YOU MAY HAVE TO INCREASE THIS NUMBER TO GET ALL THE POINTS FOR MIN *
!*   AND MAX DETERMINATION                                                    *
!*                                                                            *
!*  USING SCALMM:                                                             *
!*   THIS MAY ALSO BE USED TO INCREASE THE MIN AND MAX RANGE IF YOUR IMAGES   *
!*   APPEAR TO BE CUTOFF.  MAKE GREATER THAN 1.00. IF NOT USED MAKE EQUAL TO  *
!*   1.00                                                                     *
!*                                                                            *
!*  USING X1 AND X2:                                                          *
!*   CHANGING THESE CAN SOME TIME CHANGE YOUR IMAGE                           *
!*                                                                            *
!*  WHEN THE PROGRAM IS FINISHED, IT GOES INTO A DO NOTHING LOOP UNTIL A KEY  *
!*  IS PRESSED.  THIS ALLOWS THE USER TO VIEW THE IMAGE CREATED BUT THERE IS  *
!*  NO OUTWARD SIGN THAT THE IMAGE GENERATION IS FINISHED.  THIS MAY BE       *
!*  CONFUSING AT THE HIGHER RESOLUTIONS BECAUSE AFTER A WHILE IT IS DIFFICULT *
!*  TO DETERMINE IF THE IMAGE IS CHANGING.  AFTER HITTING A KEY AT THIS POINT,*
!*  THE FILE SAVING PROCESS AND MODE RESETTING TAKES PLACE.                   *
!*                                                                            *
!*  IF YOU HAVE DISCOVERED THAT YOU ASKED FOR TO MANY POINTS IN THE IMAGE OR  *
!*  IF THE IMAGE IS PROVING TO BE A DUDE OR IF YOU DESIRE TO TERMINATE THE    *
!*  IMAGE GENERTION PROCESS FOR ANY OTHER REASON, JUST HIT THE ES!* KEY.      *
!*  THIS WILL TERMINATE THE IMAGE GENERATION MODE AND PUT YOU IN THE WAIT MODE*
!*  MENTIONED ABOVE.                                                          *
!*                                                                            *
!*  HAVE FUN AND EXPERIMENT.                                                  *
!*                                                                            *
!*  HERE IS A SAMPLE INPUT FILE WITH THE ENTRIES LABLED                       *
!*                                                                            *
!******************************************************************************

  TYPE(WINDOWCONFIG)CURRENT


  INTEGER(KIND=4)I, IARR(0:1279, 0:1023),II1, JJ1, IFST, L, IQ, III2, IRET

  INTEGER(KIND=2)IXPIX, IYPIX, ICOL, I1, I2, SETPIXEL, IARG1, IARG2, IARG3, IARG4

  REAL(KIND=4)XMAX, XMIN, YMAX, YMIN, X, Y, XNORM, YNORM, THETA, XTRANS, YTRANS, YTEMP, &
              XA, YA, XTRANSA, YTRANSA, XMAXA, XMINA, YMAXA, YMINA

  LOGICAL(KIND=4) CHECKED


  CHARACTER(LEN=50)MESSAGE, CAPTION
  CHARACTER(LEN=2)CNUM

  CAPTION = 'CHAOS'C
  WRITE(CNUM,'(A2)')ICHAOS
  MESSAGE =' INVALID CHAOS EQUATION SELECTION '//CNUM//''C 

!* DO INITIALIZATION
  CALL TOTAL_INIT

!* GET THE CURRENT WINDOW PARAMETERS
  CHECKED = GETWINDOWCONFIG(CURRENT)

  CHECKED = .TRUE.

!* CLEAR THE SCREEN
  CALL CLEARSCREEN($GCLEARSCREEN)

!* INITIALIZE THE SCREEN PIXEL ARRAY
  DO II1 = 0, CURRENT%NUMXPIXELS-1
    DO JJ1 = 0, CURRENT%NUMYPIXELS-1
      IARR(II1,JJ1) = 0
    ENDDO
  ENDDO

!* WASTE SOME POINTS
  CALL WASTEPTS(A, B, C, D, X1, Y1, X, Y, IWASTE, ICHAOS)
!* CALCULATE THE MIN AND MAX VALUES
  CALL MINMAXC(A, B, C, D, X1, Y1, X, Y, IMINMAX, SCALMM, LROTAT, XMINA, XMAXA, YMINA, YMAXA,    &
                   ICHAOS, YTEMP, XMAX, XMIN, YMAX, YMIN)
!* CALCULATE THE POINTS AND CREATE THE IMAGE
  ICOL = 0
  IFST = 0
!* GET THE CURRENT CLOCK COUNT
  ISTART = GETTICKCOUNT()
  CALL GETTIM(IARG1, IARG2, IARG3, IARG4)
!* GENERATE THE IMAGE
  DO I = 1, IIMAGE
!* CHOSE DESIRED EQUATIONS
    INUM = I
    IF(ICHAOS .EQ. 3)THEN
      CALL CHAOS3(A, B, C, D, X1, Y1, X, Y)
    ELSE IF(ICHAOS .EQ. 4)THEN
      CALL CHAOS4(A, B, C, D, X1, Y1, X, Y)
    ELSE IF(ICHAOS .EQ. 5)THEN
      CALL CHAOS5(A, B, C, D, X1, Y1, X, Y)
    ELSE
      IRET = MESSAGEBOXQQ(MESSAGE, CAPTION, MB$IDOK)
      RETURN
    ENDIF
    X1 = X
    Y1 = Y
!* CHECK TO SEE IF IMAGE IS TO BE ROTATED
    IF(LROTAT)THEN
      THETA = 0.00E+00
!* TRANSLAT THE X AND Y TO THE NEW COORDINATE SYSTEM
      XTRANS = X - XMAX
      YTRANS = Y - YTEMP
      XA = XTRANS
      YA = YTRANS
      DO L = 1, NDIV
!* ROTATE THROUT 1.5707963 RADIANS ON EACH STEP
        XTRANSA = XA*COS(THETA) + YA*SIN(THETA)
        YTRANSA = YA*COS(THETA) - XA*SIN(THETA)
        THETA = THETA + ROTMAG
!* NORMILIZE THE VALUES OF X AND Y FOR PLOTTING PURPOSES TO KEEP THEM BETWEN 0 AND 1
        XNORM = ((XTRANSA) - XMINA)/(XMAXA-XMINA)
        YNORM = ((YTRANSA) - YMINA)/(YMAXA-YMINA)
!* CALCULATE THE PIXEL LOCATION BASED ON THE CURRENT VIDEO MODE
        IXPIX = INT2(XNORM*REAL(CURRENT%NUMXPIXELS-1))
        IYPIX = INT2(YNORM*REAL(CURRENT%NUMYPIXELS-1))
!* MAKE SURE PIXEL LOCATIONS ARE VALID, IF NOT IGNORE
        IF(((IXPIX .LT. 0) .OR. (IXPIX .GT. CURRENT%NUMXPIXELS-1)).OR.((IYPIX .LT. 0) .OR. (IYPIX .GT. CURRENT%NUMYPIXELS-1)))CYCLE
!* INCREMENT THE ARRAY LOCATION COESSPONDING TO THAT PIXEL
        IARR(IXPIX, IYPIX) = IARR(IXPIX, IYPIX)+1
        ICOL = INT2(MOD(((IARR(IXPIX, IYPIX)+(IDIV-1))/IDIV),INT4(CURRENT%NUMCOLORS)))
        I1 = SETCOLOR(ICOL)
!* PLOT PIXEL
        I2 = SETPIXEL(IXPIX, IYPIX)
      ENDDO
    ELSE
!* NORMILIZE THE VALUES OF X AND Y FOR PLOTTING PURPOSES TO KEEP THEM BETWEN 0 AND 1
      XNORM = ((X) - XMINA)/(XMAXA-XMINA)
      YNORM = ((Y) - YMINA)/(YMAXA-YMINA)
!* CALCULATE THE PIXEL LOCATION BASED ON THE CURRENT VIDEO MODE
      IXPIX = INT2(XNORM*REAL(CURRENT%NUMXPIXELS-1))
      IYPIX = INT2(YNORM*REAL(CURRENT%NUMYPIXELS-1))
!* MAKE SURE PIXEL LOCATIONS ARE VALID, IF NOT IGNORE
      IF(((IXPIX .LT. 0) .OR. (IXPIX .GT. CURRENT%NUMXPIXELS-1)).OR.((IYPIX .LT. 0) .OR. (IYPIX .GT. CURRENT%NUMYPIXELS-1)))CYCLE
!* INCREMENT THE ARRAY LOCATION COESSPONDING TO THAT PIXEL
        IARR(IXPIX, IYPIX) = IARR(IXPIX, IYPIX)+1
        ICOL = INT2(MOD(((IARR(IXPIX, IYPIX)+(IDIV-1))/IDIV),INT4(CURRENT%NUMCOLORS)))
        I1 = SETCOLOR(ICOL)
!* PLOT PIXEL
        I2 = SETPIXEL(IXPIX, IYPIX)
      ENDIF
      IQ = 0
      DO III2 = 1,1000
        IQ = IQ + 1
      END DO
!* CHECK TERMINATION FLAG.  IF TERMATED, FLUSH PIXEL ARRAY
      IF(OUT)THEN
        CALL SETPIXELFLUSH
        EXIT
      ENDIF
    ENDDO
  CALL SETPIXELFLUSH
  IF((.NOT.LDEMO).AND.(.NOT.OUT))THEN
    LRUNNING = .FALSE.
    IRET = MESSAGEBOXQQ('DRAWING HAS FINISHED'c,'DRAWING FINISHED'c,MB$OK)
  ENDIF
  RETURN
END SUBROUTINE CHAOSDRV

