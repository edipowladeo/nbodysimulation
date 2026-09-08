      USE MSFLIB
      CALL graphicsmode()
      CALL drawlines()
      CALL sinewave()
      CALL drawshapes()
      END
	
      SUBROUTINE graphicsmode() 
         USE MSFLIB
         LOGICAL               modestatus
         INTEGER(2)            maxx, maxy
         TYPE (windowconfig)   myscreen
         COMMON                maxx, maxy

!     Set highest resolution graphics mode.

         myscreen.numxpixels=-1
         myscreen.numypixels=-1
         myscreen.numtextcols=-1
         myscreen.numtextrows=-1
         myscreen.numcolors=-1
         myscreen.fontsize=-1 
         myscreen.title = " "C  ! blank  

         modestatus=SETWINDOWCONFIG(myscreen)

!        Determine the maximum dimensions.

         modestatus=GETWINDOWCONFIG(myscreen)
         maxx=myscreen.numxpixels - 1
         maxy=myscreen.numypixels - 1
       END 
	     
!  DRAWLINES - This subroutine draws a box and
!              several lines.

      SUBROUTINE drawlines()

      USE MSFLIB

      EXTERNAL         newx, newy
      INTEGER(2)       status, newx, newy, maxx, maxy 
      TYPE (xycoord)   xy
      COMMON           maxx, maxy
!
!     Draw the box.

      status = RECTANGLE( $GBORDER, INT2(0), INT2(0), maxx, maxy )
      CALL SETVIEWORG( INT2(0), newy( INT2( 500 ) ), xy )  ! This sets
! the new origin to 0 for x and 500 for y. See comment after subroutine. 

!     Draw the lines.

      CALL MOVETO( INT2(0), INT2(0), xy )
      status = LINETO( newx( INT2( 1000 )), INT2(0))
      CALL SETLINESTYLE( INT2( #AA3C ))
      CALL MOVETO( INT2(0), newy( INT2( -250 )), xy )
      status = LINETO(newx( INT2( 1000 )),newy( INT2( -250 )))
      CALL SETLINESTYLE( INT2( #8888 ))
      CALL MOVETO(INT2(0), newy( INT2( 250 )), xy )
      status = LINETO( newx( INT2( 1000 )),newy( INT2( 250 ) ) )
      END


!  SINEWAVE - This subroutine calculates and plots a sine
!             wave.
!
      SUBROUTINE sinewave()
      USE MSFLIB

      INTEGER(2)        dummy, newx, newy, locx, locy, i
	  INTEGER(4)        color
      REAL              rad
      EXTERNAL          newx, newy

      PARAMETER        ( PI = 3.14159 )
!
!     Calculate each position and display it on the screen.
      color = #0000FF   ! red
      !
      DO i = 0, 999, 3
         rad   = -SIN( PI * i / 250.0 )
         locx  = newx( i )
         locy  = newy( INT2( rad * 250.0 ) )
         dummy = SETPIXELRGB( locx, locy, color  )
      END DO
      END

!  DRAWSHAPES - Draws two boxes and two ellipses.
!
      SUBROUTINE drawshapes()

      USE MSFLIB

      EXTERNAL    newx, newy
      INTEGER(2)  dummy, newx, newy
!
!     Create a masking (fill) pattern.
!
      INTEGER(1)  diagmask(8),  horzmask(8)
      DATA diagmask / #93, #C9, #64, #B2, #59, #2C, #96, #4B /
      DATA horzmask / #FF, #00, #7F, #FE, #00, #00, #00, #CC /
!
!     Draw the rectangles.
!
      CALL SETLINESTYLE( INT2(#FFFF ))
      CALL SETFILLMASK( diagmask )
      dummy = RECTANGLE( $GBORDER,newx(INT2(50)),newy(INT2(-325)),      &
     &                            newx(INT2(200)),newy(INT2(-425)))
      dummy = RECTANGLE( $GFILLINTERIOR,newx(INT2(550)),                &
	 &           newy(INT2(-325)),newx(INT2(700)),newy(INT2(-425)))
!
!     Draw the ellipses.
!
      CALL SETFILLMASK( horzmask )
      dummy = ELLIPSE( $GBORDER,newx(INT2(50)),newy(INT2(325)),          &
     &                          newx(INT2(200)),newy(INT2(425)))
      dummy = ELLIPSE( $GFILLINTERIOR,newx(INT2(550)),                   &
	             newy(INT2(325)),newx(INT2(700)),newy(INT2(425)))
      END 
	  
	   
! NEWX - This function finds new x-coordinates.

      INTEGER(2) FUNCTION newx( xcoord )

      INTEGER(2) xcoord, maxx, maxy
      REAL(4)    tempx
      COMMON     maxx, maxy

      tempx = maxx / 1000.0
      tempx = xcoord * tempx + 0.5
      newx  = tempx
      END

!  NEWY - This function finds new y-coordinates.

      INTEGER(2) FUNCTION newy( ycoord )

      INTEGER(2) ycoord, maxx, maxy
      REAL(4)    tempy
      COMMON     maxx, maxy

      tempy = maxy / 1000.0
      tempy = ycoord * tempy + 0.5
      newy  = tempy
      END

    

 