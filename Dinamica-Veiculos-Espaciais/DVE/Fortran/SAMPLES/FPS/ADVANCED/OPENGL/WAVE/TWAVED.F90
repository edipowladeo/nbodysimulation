!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
subroutine ReshapeFunction(width, height)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ReshapeFunction@8' :: ReshapeFunction
use opengl
integer(4)  width, height
    call fglViewport(0, 0, width, height)
end

subroutine Key_c()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_c@0' :: Key_c
use twaveinc
use opengl
real(4) map(4)
data map /0, 0, 20, 0/ 

    contouring = contouring + 1
    if (contouring == 1) then

        call fglTexImage2d(GL_TEXTURE_2D, 0, 3, 4, 4, 0, GL_LUMINANCE, &
             GL_UNSIGNED_BYTE, LOC(contourTexture1))
        call fglTexGeni(GL_S, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR)
        call fglTexGeni(GL_T, GL_TEXTURE_GEN_MODE, GL_OBJECT_LINEAR)
        call fglTexGenfv(GL_S, GL_OBJECT_PLANE, LOC(map))
        call fglTexGenfv(GL_T, GL_OBJECT_PLANE, LOC(map))
        call fglEnable(GL_TEXTURE_2D)
        call fglEnable(GL_TEXTURE_GEN_S)
        call fglEnable(GL_TEXTURE_GEN_T)

    else if (contouring == 2) then

        call fglTexGeni(GL_S, GL_TEXTURE_GEN_MODE, GL_EYE_LINEAR)
        call fglTexGeni(GL_T, GL_TEXTURE_GEN_MODE, GL_EYE_LINEAR)
        call fglPushMatrix()
        call fglMatrixMode(GL_MODELVIEW)
        call fglLoadIdentity()
        call fglTexGenfv(GL_S, GL_EYE_PLANE, LOC(map))
        call fglTexGenfv(GL_T, GL_EYE_PLANE, LOC(map))
        call fglPopMatrix()
    else 
        contouring = 0
        call fglDisable(GL_TEXTURE_GEN_S)
        call fglDisable(GL_TEXTURE_GEN_T)
        call fglDisable(GL_TEXTURE_2D)
    end if
end


subroutine Key_s()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_s@0' :: Key_s
use twaveinc
use opengl
    smooth = NOT(smooth)
    if (smooth) then
        call fglShadeModel(GL_SMOOTH)
    else 
        call fglShadeModel(GL_FLAT)
    end if
end

