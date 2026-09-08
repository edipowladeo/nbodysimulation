      





!   SHOWFONT.F90 - Displays sample text in various fonts.
! 
      USE MSFLIB

      INTEGER(2)           grstat                ! Temporary variables
      INTEGER(2)           numfonts,indx
      TYPE (xycoord)    xys
      TYPE (fontinfo)   f
      CHARACTER           SearchStr*6       ! 5 chars for font num      
                                            ! (max. is 32767), 1 for 'n'
      INTEGER(2)           System_Height,Curr_Height
!
!  Initializations
!
      numfonts=INITIALIZEFONTS()
      IF (numfonts.LE.0) PRINT *,"InitializeFonts error"

      IF (GRSTATUS().NE.$GROK) PRINT *,'InitializeFonts GrStatus error.'

      CALL MOVETO (0,0,xys)

      grstat=SETFONT('n1')
      grstat=GETFONTINFO(f)
      System_Height=f.pixheight

      grstat=SETCOLORRGB(#FF0000)
      grstat=FLOODFILLRGB(0,0,#00FF00)
      grstat=SETCOLORRGB(#000000)

      DO indx=1,numfonts
!
!  Determine height of this line
!
         WRITE(SearchStr,10)indx
         grstat=SETFONT(SearchStr)

         Curr_Height=System_Height
         IF (grstat.GT.0) THEN
            grstat=GETFONTINFO(f)
            IF (f.pixheight.GT.Curr_Height) Curr_Height=f.pixheight
         END IF
!
!  If won't fit then wait for a key
!
         CALL GETCURRENTPOSITION(xys)
         IF (480-xys.ycoord.LT.Curr_Height) THEN

            grstat=INCHARQQ()
            CALL CLEARSCREEN($GCLEARSCREEN)
            CALL MOVETO(0,0,XYS)
            grstat=SETCOLORRGB(#FF0000)
            grstat=FLOODFILLRGB(0,0,#00FF00)
            grstat=SETCOLORRGB(#000000)
         ENDIF
!
!  Display header
!
         grstat=SETFONT('n1')
         WRITE (SearchStr,'(i5.5)') indx
         CALL OUTGTEXT(SearchStr(:5))
         CALL OUTGTEXT(' : ')

         WRITE(SearchStr,10)indx
         grstat=SETFONT(SearchStr)

         IF (grstat.LT.1) THEN
            CALL OUTGTEXT('SetFont error.')
         ELSE

            grstat=GETFONTINFO(f)
            grstat=SETFONT('n1')
            CALL OUTGTEXT(f.facename(:len_trim(f.facename)))

            CALL OUTGTEXT(' ')
!
!  Display font
!
            grstat=SETFONT(SearchStr)
            CALL OUTGTEXT('ABCDEFGabcdefg12345!@#$%')

         END IF
!
!  Go to next line
!
         CALL GETCURRENTPOSITION(xys)
         CALL MOVETO(0,INT2(xys.ycoord+Curr_Height),xys)

      END DO

10    FORMAT('n',i5.5)
      END




