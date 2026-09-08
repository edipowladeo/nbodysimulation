!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
subroutine myinit ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_myinit@0' :: myinit
use opengl
use msfwin
    call fglShadeModel (INT4(GL_FLAT))
end subroutine




!/*  Clear the screen.  Set the current color to white.
! *  Draw the wire frame cube.
! */
subroutine display ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_display@0' :: display
use opengl
use msfwin
    call fglColor3f (1.0, 0.0, 0.0)
    call fglLoadIdentity()  !/*  clear the matrix    */
    call fglTranslatef (0.0, 0.0, -5.0)  !/*  viewing transformation  */
    call fglScalef (1.0, 2.0, 1.0)   !/*  modeling transformation */
    call fglBegin(GL_POINTS)
        call fauxWireCube(DBLE(1.0))   !/*  draw the cube   */
    call fglEnd()
    !call fglFlush()
end subroutine
