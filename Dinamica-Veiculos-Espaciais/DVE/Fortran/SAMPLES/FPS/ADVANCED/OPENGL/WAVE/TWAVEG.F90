!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************
integer(4) function Args (argc)
!MS$ATTRIBUTES VALUE :: argc
use twaveinc
use opengl

      INTERFACE
        SUBROUTINE GETARG(N, BUFFER, STATUS)
          INTEGER*2 N
          CHARACTER*(*) BUFFER
          INTEGER*2, OPTIONAL :: STATUS      
        END SUBROUTINE
      END INTERFACE

interface
real(4) function chartoreal (buffer)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_chartoreal@4' :: chartoreal
integer(4)  buffer
end function chartoreal
end interface

integer(4)  argc
integer(2) i
character*30    argv


    rgbValue = GL_TRUE
    doubleBuffer = GL_TRUE


    frames = 10
    widthX = 10
    widthY = 10
    checkerSize = 2
    height = 0.2
    i = 1
    do while ( i < argc )
        call getarg (i, argv)
        if (VERIFY(argv, "-ci") .eq. 0) then
           rgbValue = GL_FALSE
        else if (VERIFY(argv, "-rgb") .eq. 0) then
           rgbValue = GL_TRUE
        else if (VERIFY(argv, "-sb") .eq. 0) then
           doubleBuffer = GL_FALSE;
        else if (VERIFY(argv, "-db") .eq. 0) then
           doubleBuffer = GL_TRUE;
        else if (VERIFY(argv, "-grid") .eq. 0) then
            if ((i+2 .ge. argc) .OR. (argv(i+1:1) .eq. '-') .OR. (argv(i+2:1) .eq. '-')) then
                Args = GL_FALSE
                return
            else
                i = i + 1
                call getarg (i, argv)
                write(widthX, '(I2)') argv
                i = i + 1
                call getarg (i, argv)
                write(widthY, '(I2)') argv
            end if
        else if (VERIFY(argv, "-size") .eq. 0) then
            if (i+1 >= argc .OR. argv(i+1:1) == '-') then
                Args = GL_FALSE
                return
            else
                i = i + 1
                call getarg (i, argv)
                write(checkerSize, '(I2)') argv
           end if
        else if (VERIFY(argv, "-wave") .eq. 0) then
           if (i+1 >= argc .OR. argv(i+1:1) == '-') then
              Args = GL_FALSE
              return
           else
                i = i + 1
                call getarg (i, argv)
                 height = chartoreal(LOC(argv))
           end if
        else if (VERIFY(argv, "-frames") .eq. 0) then
           if (i+1 >= argc .OR. argv(i+1:1) == '-') then
              Args = GL_FALSE
              return
           else
                i = i + 1
                call getarg (i, argv)
                write(frames, '(I2)') argv
           end if
        else 
           Args = GL_FALSE
           return
        end if
    end do
    Args = GL_TRUE
    return
end


integer(4) function GETCOORD (frame, x, y)
!MS$ATTRIBUTES VALUE :: frame
!MS$ATTRIBUTES VALUE :: x
!MS$ATTRIBUTES VALUE :: y
use twaveinc
use opengl

integer(4)  frame, x, y
integer(4)  i
    i = theMesh%widthX
    i = (frame*theMesh%numCoords)+(x)+y*(theMesh%widthX+1)
    GETCOORD = theMesh%coords + i * 24

    return
end 
