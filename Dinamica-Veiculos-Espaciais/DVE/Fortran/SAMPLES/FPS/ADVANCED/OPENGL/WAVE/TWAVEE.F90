!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
subroutine Key_l()
use twaveinc
use opengl
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_l@0' :: Key_l

    lighting = NOT(lighting)
    if (lighting) then
        call fglEnable(GL_LIGHTING)
        call fglEnable(GL_LIGHT0)
    else 
        call fglDisable(GL_LIGHTING)
        call fglDisable(GL_LIGHT0)
    end if
end

subroutine Key_d()
use twaveinc
use opengl

!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_d@0' :: Key_d

    depth = NOT(depth)
    if (depth) then
        call fglEnable(GL_DEPTH_TEST)
        clearMask = IOR(clearmask, GL_DEPTH_BUFFER_BIT)
    else
        call fglDisable(GL_DEPTH_TEST)
        clearMask = IAND(clearmask, NOT(GL_DEPTH_BUFFER_BIT))
    end if
end

