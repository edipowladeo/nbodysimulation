!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************

!
! cube.f90
! Draws a 3-D cube, viewed with perspective, stretched 
! along the y-axis.
!

! Main Loop
! Open window with initial window size, title bar, 
! RGBA display mode, and handle input events.
!
use opengl
use msfwin

interface
subroutine myReshape (w, h)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_myReshape@8' :: myReshape
integer(4)  w
integer(4)  h
end subroutine

subroutine myinit ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_myinit@0' :: myinit
end subroutine myinit

subroutine display ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_display@0' :: display
end subroutine display

end interface

integer  ret

    call fauxInitDisplayMode (IOR(AUX_SINGLE, AUX_RGB))
    call fauxInitPosition (0, 0, 500, 500)
    ret = fauxInitWindow ("Perspective 3-D Cube"C)
    call myinit ()
    call fauxReshapeFunc (LOC(myReshape))
    call fauxIdleFunc(LOC(display))
    call fauxMainLoop(NULL)
end 





!/*  Called when the window is first opened and whenever 
! *  the window is reconfigured (moved or resized).
! */
subroutine myReshape(w, h)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_myReshape@8' :: myReshape
use opengl
use msfwin
integer(4)  w,h

    call fglMatrixMode (GL_PROJECTION)   !/*  prepare for and then  */ 
    call fglLoadIdentity ()  !/*  define the projection  */
    call fglFrustum (-1.0, 1.0, -1.0, 1.0, 1.5, 20.0)    !/*  transformation  */
    call fglMatrixMode (GL_MODELVIEW)    !/*  back to modelview matrix    */
    call fglViewport (0, 0, w, h)    !/*  define the viewport */
    call fglClear(INT4(GL_COLOR_BUFFER_BIT))

end subroutine
