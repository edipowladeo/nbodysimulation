!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************

use twaveinc
use opengl

interface
integer(4) function Args (argc)
!MS$ATTRIBUTES VALUE :: argc
integer(4)  argc
end function Args

subroutine ReshapeFunction(width, height)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ReshapeFunction@8' :: ReshapeFunction
integer(4)  width, height
end subroutine ReshapeFunction

subroutine Animate()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Animate@0' :: Animate
end subroutine Animate

subroutine Key_c()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_c@0' :: Key_c
end subroutine Key_c

subroutine Key_s()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_s@0' :: Key_s
end subroutine Key_s

subroutine Key_l()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_l@0' :: Key_l
end subroutine Key_l

subroutine Key_d()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_d@0' :: Key_d
end subroutine Key_d

subroutine Key_SPACE()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_SPACE@0' :: Key_SPACE
end subroutine Key_SPACE

subroutine Key_n()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_n@0' :: Key_n
end subroutine Key_n

subroutine Key_a()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_a@0' :: Key_a
end subroutine Key_a

end interface

integer(4)  type
integer(4)  argc


    ! Doing all global variable initializations here.

    clearmask = IOR(GL_COLOR_BUFFER_BIT , GL_DEPTH_BUFFER_BIT)

    smooth = GL_TRUE
    lighting = GL_FALSE
    depth = GL_TRUE
    stepMode = GL_FALSE
    spinMode = GL_FALSE
    contouring = 0
    curFrame = 0
    nextFrame = 0

    do i = 1,12
        contourTexture1(i) = 255
    end do

    do i = 13,16
        contourTexture1(i) = 127
    end do

    do i = 1,4
        contourTexture2(i) = 255
    end do
    do i = 5,13,4
        contourTexture2(i) = 255
    end do
    do i = 6,8
        contourTexture2(i) = 127
    end do
    do i = 10,12
        contourTexture2(i) = 127
    end do
    do i = 14,16
        contourTexture2(i) = 127
    end do

    argc = nargs()
    
    if (Args(argc) == GL_FALSE) then
      call fauxQuit()
    end if

    call fauxInitPosition(0, 0, 300, 300)

    type = AUX_DEPTH16

    if (rgbValue) then
      type = IOR(type, AUX_RGB)
    else
      type = IOR(type, AUX_INDEX)
    end if

    if (doublebuffer) then
      type = IOR(type, AUX_DOUBLE)
    else
      type = IOR(type, AUX_SINGLE)
    end if  

    call fauxInitDisplayMode(type)
    if (fauxInitWindow("Wave Demo"C) == GL_FALSE) then
      call fauxQuit()
    end if

    call Init()

    call fauxExposeFunc(LOC(ReshapeFunction))
    call fauxReshapeFunc(LOC(ReshapeFunction))
    call fauxKeyFunc(INT(AUX_c), LOC(Key_c))
    call fauxKeyFunc(AUX_s, LOC(Key_s))
    call fauxKeyFunc(AUX_l, LOC(Key_l))
    call fauxKeyFunc(AUX_d, LOC(Key_d))
    call fauxKeyFunc(AUX_SPACE, LOC(Key_SPACE))
    call fauxKeyFunc(AUX_n, LOC(Key_n))
    call fauxKeyFunc(AUX_a, LOC(Key_a))
    call fauxIdleFunc(LOC(Animate))
    call fauxMainLoop(0)
end


integer(4) function GETFACET (frame, x, y)
!MS$ATTRIBUTES VALUE :: frame
!MS$ATTRIBUTES VALUE :: x
!MS$ATTRIBUTES VALUE :: y
use twaveinc
integer(4)  frame, x, y
integer(4)  i
    i = frame*theMesh%numFacets+(x)+(y*theMesh%widthX)
    GETFACET = theMesh%facets + i * 24

    return
end

