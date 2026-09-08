!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
subroutine Key_SPACE()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_SPACE@0' :: Key_SPACE
use twaveinc
use opengl

interface
subroutine Animate()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Animate@0' :: Animate
end subroutine Animate
end interface

    stepMode = NOT(stepMode)

    if (stepMode) then
        call fauxIdleFunc(0)

    else 
        call fauxIdleFunc(LOC(Animate))

    end if
end 

subroutine Key_n()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_n@0' :: Key_n
use twaveinc
    if (stepMode) then
        nextFrame = 1
    end if
end

subroutine Key_a()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_a@0' :: Key_a
use twaveinc

   spinMode = NOT(spinMode)
end

