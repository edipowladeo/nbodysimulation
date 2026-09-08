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
! *  CreateDisplayList creates a display list that draws a cube.
! *
! *  Input parameters:
! *      None
! *  
! *  Returns:
! *      Nothing
! */

subroutine CreateDisplayList ()
use msfwin
use opengl
use cubeinc
real(4) glfMaterialColor(4)
data glfMaterialColor / 0.0, 0.0, 1.0, 1.0 /

    call fglNewList (DRAWCUBE, GL_COMPILE)
    call fglMaterialfv (GL_FRONT, GL_AMBIENT_AND_DIFFUSE, LOC(glfMaterialColor))

    call fglBegin(GL_POLYGON)               !// Front face
        call fglNormal3f (0.0, 0.0, 1.0)        
        call fglVertex3f(1.0, 1.0, 1.0)
        call fglVertex3f(-1.0, 1.0, 1.0)
        call fglVertex3f(-1.0, -1.0, 1.0)
        call fglVertex3f(1.0, -1.0, 1.0)
    call fglEnd()

    call fglBegin(GL_POLYGON)               !// Back face
        call fglNormal3f (0.0, 0.0, -1.0)
        call fglVertex3f(1.0, 1.0, -1.0)
        call fglVertex3f(1.0, -1.0, -1.0)
        call fglVertex3f(-1.0, -1.0, -1.0)
        call fglVertex3f(-1.0, 1.0, -1.0)
    call fglEnd()

    call fglBegin(GL_POLYGON)               !// Left face
        call fglNormal3f (-1.0, 0.0, 0.0)           
        call fglVertex3f(-1.0, 1.0, 1.0)
        call fglVertex3f(-1.0, 1.0, -1.0)
        call fglVertex3f(-1.0, -1.0, -1.0)
        call fglVertex3f(-1.0, -1.0, 1.0)
    call fglEnd()

    call fglBegin(GL_POLYGON)               !// Right face
        call fglNormal3f (1.0, 0.0, 0.0)
        call fglVertex3f(1.0, 1.0, 1.0)
        call fglVertex3f(1.0, -1.0, 1.0)
        call fglVertex3f(1.0, -1.0, -1.0)
        call fglVertex3f(1.0, 1.0, -1.0)
    call fglEnd()

    call fglBegin(GL_POLYGON)               !// Top face
        call fglNormal3f (0.0, 1.0, 0.0)            
        call fglVertex3f(-1.0, 1.0, -1.0)
        call fglVertex3f(-1.0, 1.0, 1.0)
        call fglVertex3f(1.0, 1.0, 1.0)
        call fglVertex3f(1.0, 1.0, -1.0)
    call fglEnd()

    call fglBegin(GL_POLYGON)               !// Bottom face 
        call fglNormal3f (0.0, -1.0, 0.0)
        call fglVertex3f(-1.0, -1.0, -1.0)
        call fglVertex3f(1.0, -1.0, -1.0)
        call fglVertex3f(1.0, -1.0, 1.0)
        call fglVertex3f(-1.0, -1.0, 1.0)
    call fglEnd()

call fglEndList ()
end


!/*
! *  DrawScene uses OpenGL commands to draw a cube.
! *
! *  Input parameters:
! *      hdc = Device context handle.
! *      nAngle = Angle of rotation of cube.
! *
! *  Returns:
! *      Nothing
! */

subroutine DrawScene (hdc, nAngle)
!MS$  ATTRIBUTES VALUE :: hdc
!MS$  ATTRIBUTES VALUE :: nAngle
use msfwin
use opengl
use cubeinc
integer(4)  hdc, nAngle
integer i, j, k
logical(4)  bret

    !//
    !//  Clear the color and depth buffers
    !//
        
    call fglClear(IOR(GL_COLOR_BUFFER_BIT , GL_DEPTH_BUFFER_BIT))

    !//
    !//  Define the modelview transformation.
    !//

    call fglMatrixMode(GL_MODELVIEW)
    call fglLoadIdentity()
    call fglTranslatef(0.0, 0.0, -32.0)
    call fglRotatef(50.0, 1.0, 0.0, 0.0)
    call fglRotatef(REAL(nAngle), 0.0, 1.0, 0.0)

    !//
    !//  Draw a 3 dimensional array of cubes.
    !//
    do i = -3, 3, 3
        do j = -3, 3, 3
            do k = -3, 3, 3
                call fglPushMatrix ()
                call fglTranslatef (REAL(i), REAL(j), REAL(k))
                call fglCallList (DRAWCUBE)
                call fglPopMatrix ()
            end do
        end do
    end do

    !//
    !//  Swap the buffers.
    !//
    bret = SwapBuffers(hdc)
end

