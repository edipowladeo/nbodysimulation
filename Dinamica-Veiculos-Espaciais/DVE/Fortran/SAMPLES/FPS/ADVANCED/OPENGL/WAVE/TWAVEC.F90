!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
subroutine InitTexture()
use opengl
    call fglTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, REAL(GL_REPEAT))
    call fglTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, REAL(GL_REPEAT))
    call fglTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, REAL(GL_NEAREST))
    call fglTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, REAL(GL_NEAREST))
    call fglTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, REAL(GL_MODULATE))
end

subroutine Init()
use opengl

external InitMaterials
external InitTexture
external InitMesh

    call fglClearColor(0.0, 0.0, 0.0, 0.0)

    call fglShadeModel(GL_SMOOTH)
    
    call fglFrontFace(GL_CW)

    call fglDepthFunc(GL_LEQUAL)
    call fglEnable(GL_DEPTH_TEST)

    call InitMaterials()
    call InitTexture()
    call InitMesh()

    call fglMatrixMode(GL_MODELVIEW)
    call fglTranslatef(0.0, 0.4, -1.8)
    call fglScalef(2.0, 2.0, 2.0)
    call fglRotatef(-35.0, 1.0, 0.0, 0.0)
    call fglRotatef(35.0, 0.0, 0.0, 1.0)
end

