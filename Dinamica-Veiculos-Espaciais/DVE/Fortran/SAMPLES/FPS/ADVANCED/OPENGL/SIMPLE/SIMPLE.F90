!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
!/*
! *  simple.f90
! */
use opengl
use msfwin

integer(4)      ret
integer(2)      pattern

    call fauxInitDisplayMode (IOR(AUX_SINGLE , AUX_RGB))
    call fauxInitPosition (0, 0, 500, 500)
    ret = fauxInitWindow ("Simple OpengGL Sample"C)

    call fglClearColor (0.0, 0.0, 0.0, 0.0)
    call fglClear(GL_COLOR_BUFFER_BIT)
    call fglColor3f(1.0, 1.0, 1.0)
    call fglMatrixMode (GL_PROJECTION)
    call fglLoadIdentity ()
    call fglOrtho(DBLE(-1.0), DBLE(1.0), DBLE(-1.0), DBLE(1.0), DBLE(-1.0), DBLE(1.0))

    !
    ! Drawing points
    !

        
    call fglBegin(GL_POINTS)
        ! Red 
        call fglColor3f (1.0, 0.0, 0.0)
        call fglVertex2f(-0.1, -0.1)

        ! Green 
        call fglColor3f (0.0, 1.0, 1.0)
        call fglVertex2f(0.0, 0.1)

        ! Blue 
        call fglColor3f (0.0, 0.0, 1.0)
        call fglVertex2f(0.1, 0.0)

        ! Yellow
        call fglColor3f (1.0, 1.0, 0.0)
        call fglVertex2f(0.1, 0.1)

        ! Cyan
        call fglColor3f (0.0, 1.0, 1.0)
        call fglVertex2f(0.0, -0.1)

        ! Magenta
        call fglColor3f (1.0, 0.0, 1.0)
        call fglVertex2f(-0.1, 0.0)

        ! White
        call fglColor3f (1.0, 1.0, 1.0)
        call fglVertex2f(0.1, -0.1)

        ! White
        call fglColor3f (1.0, 1.0, 1.0)
        call fglVertex2f(-0.1, 0.1)


    call fglEnd()

    call fglFlush()

    call sleep (2000)
    call fglClear(GL_COLOR_BUFFER_BIT)

    pattern = INT2(#3f07)
    call fglLineStipple ( 3, pattern)
    call fglEnable (GL_LINE_STIPPLE)                        

    call fglBegin(GL_LINES)
        call fglVertex2f(-0.5, 0.75)
        call fglVertex2f(0.5, 0.75)
    call fglEnd()

    call fglDisable (GL_LINE_STIPPLE)                        

    call fglLineWidth (1)

    call fglBegin(GL_LINES)
        call fglColor3f (1.0, 1.0, 0.0)
        call fglVertex2f(-0.5, 0.5)
        call fglVertex2f(0.5, 0.5)

        call fglColor3f (1.0, 0.0, 0.0)
        call fglVertex2f(-0.5, 0.25)
        call fglVertex2f(0.5, 0.25)

    call fglEnd()
    call fglFlush()

    call sleep (2000)
    call fglClear(GL_COLOR_BUFFER_BIT)
    
    call fglColor3f (1.0, 0.0, 1.0)

    call fglBegin(GL_POLYGON)
        call fglVertex2f(-0.25, -0.25)
        call fglVertex2f(-0.25, 0.5)
        call fglVertex2f(0.5, 0.5)
        call fglVertex2f(0.5, -0.25)
    call fglEnd()
    call fglFlush()
    call sleep (2000)
    call fglClear(GL_COLOR_BUFFER_BIT)

    ! Triangles
    call fglColor3f (0.0, 0.0, 1.0)

    call fglBegin(GL_TRIANGLE_FAN)
        call fglVertex2f(-0.25, 0.5)
        call fglVertex2f(0.75, 0.125)
        call fglVertex2f(0.5, 0.5)
    call fglEnd()
    call fglFlush()
    call sleep (2000)
    call fglClear(GL_COLOR_BUFFER_BIT)
end
