!  REALG.F90 - Illustrates coordinate graphics.
!
      USE MSFLIB
      LOGICAL             statusmode
      TYPE (windowconfig) myscreen
      COMMON              myscreen
!
!     Set the screen to the best resolution and maximum number of 
!     available colors.
      myscreen.numxpixels   = -1
      myscreen.numypixels   = -1
      myscreen.numtextcols  = -1
      myscreen.numtextrows  = -1
      myscreen.numcolors    = -1
	  myscreen.fontsize = -1
      myscreen.title = " "C
	  statusmode = SETWINDOWCONFIG(myscreen)
      IF(.NOT. statusmode) statusmode = SETWINDOWCONFIG(myscreen)

      statusmode = GETWINDOWCONFIG( myscreen )
      CALL threegraphs()
      END

! THREEGRAPHS - This subroutine sets up graphs for REALG.FOR
!      
      SUBROUTINE threegraphs()

      USE MSFLIB
      INTEGER(2)            status, halfx, halfy
      INTEGER(2)            xwidth, yheight, cols, rows
      TYPE (windowconfig)   myscreen
      COMMON                myscreen

      CALL CLEARSCREEN( $GCLEARSCREEN )
      xwidth  = myscreen.numxpixels
      yheight = myscreen.numypixels
      cols    = myscreen.numtextcols
      rows    = myscreen.numtextrows
      halfx   = xwidth / 2
      halfy   = (yheight / rows) * ( rows / 2 )
!
!     First window
!
      CALL SETVIEWPORT( INT2(0), INT2(0), halfx - 1, halfy - 1 )
      CALL SETTEXTWINDOW( INT2(1), INT2(1), rows / 2, cols / 2 )
      status = SETWINDOW( .FALSE., -2.0_8, -2.0_8, 2.0_8, 2.0_8)
	  ! The 2.0_8 notation makes these constants REAL(8) 

      CALL gridshape( rows / 2  )
      status = RECTANGLE( $GBORDER,INT2(0),INT2(0),halfx-1,halfy-1)
!
!     Second window
!
      CALL SETVIEWPORT( halfx, INT2(0), xwidth - 1, halfy - 1 )
      CALL SETTEXTWINDOW( INT2(1), (cols/2) + 1, rows/2, cols)
      status = SETWINDOW( .FALSE., -3.0D0, -3.0D0, 3.0D0, 3.0D0)
	  ! The 3.0D0 notation makes these constants REAL(8)

      CALL gridshape (rows / 2  )
      status = RECTANGLE_W( $GBORDER, -3.0_8,-3.0_8,3.0_8, 3.0_8)

!  
!     Third window
!
      CALL SETVIEWPORT( 0, halfy, xwidth - 1, yheight - 1 )
      CALL SETTEXTWINDOW( (rows / 2 ) + 1, 1_2, rows, cols )
      status = SETWINDOW( .TRUE., -3.0_8, -1.5_8, 1.5_8, 1.5_8)
      CALL gridshape (( (rows / 2) + MOD( rows, INT2(2))))
      status = RECTANGLE_W( $GBORDER, -3.0_8, -1.5_8, 1.5_8, 1.5_8)
      END


!  GRIDSHAPE - This subroutine plots data for REALG.FOR
!
      SUBROUTINE gridshape( numc )
!
      USE MSFLIB
      INTEGER(2)            numc, i, status
      INTEGER(4)            rgbcolor, oldcolor
      CHARACTER(8)          str
      REAL(8)               bananas(21), x
      TYPE (windowconfig)   myscreen
      TYPE (wxycoord)       wxy
      TYPE (rccoord)        curpos
      COMMON                myscreen
!
!     Data for the graph:
!
      DATA bananas / -0.3, -0.2, -0.224, -0.1, -0.5, 0.21, 2.9,         &
     &                0.3,  0.2,  0.0, -0.885, -1.1, -0.3, -0.2,        &
     &                0.001, 0.005, 0.14, 0.0, -0.9, -0.13, 0.31 /
!
!     Print colored words on the screen.
!
      
	  IF(myscreen.numcolors .LT. numc) numc = myscreen.numcolors-1
      DO i = 1, numc
         CALL SETTEXTPOSITION( i, INT2(2), curpos )
         rgbcolor = 12**i -1 
		 rgbcolor = MODULO(rgbcolor, #FFFFFF)
         oldcolor = SETTEXTCOLORRGB( rgbcolor ) 
         WRITE ( str, '(I8)' ) rgbcolor
         CALL OUTTEXT( 'Color ' // str )
      END DO
!
!     Draw a double rectangle around the graph.
!
      oldcolor = SETCOLORRGB( #0000FF )  ! full red
      status = RECTANGLE_W( $GBORDER, -1.00_8, -1.00_8, 1.00_8,1.00_8)
	  ! constants made REAL(8) by appending _8
      status = RECTANGLE_W( $GBORDER, -1.02_8, -1.02_8, 1.02_8, 1.02_8)
!
!     Plot the points.
!
      x = -0.90
      DO i = 1, 19
         oldcolor = SETCOLORRGB( #00FF00 )   ! full green
         CALL MOVETO_W( x, -1.0_8, wxy )
         status = LINETO_W( x,  1.0_8 )
         CALL MOVETO_W( -1.0_8, x, wxy )
         status   = LINETO_W(  1.0_8, x )
         oldcolor = SETCOLORRGB( #FF0000 )      ! full blue
         CALL MOVETO_W( x - 0.1_8, bananas( i ), wxy )
         status = LINETO_W( x, bananas( i + 1 ) )
         x     = x + 0.1
      END DO

      CALL     MOVETO_W( 0.9_8, bananas( i ), wxy )
      status = LINETO_W( 1.0_8, bananas( i + 1 ) )
      oldcolor = SETCOLORRGB( #00FFFF )    ! yellow
      END
