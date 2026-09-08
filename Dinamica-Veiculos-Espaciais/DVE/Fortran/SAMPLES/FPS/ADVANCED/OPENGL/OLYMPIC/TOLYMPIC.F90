!/*
! * (c) Copyright 1993, Silicon Graphics, Inc.
! *               1993, 1994 Microsoft Corporation
! *
! * ALL RIGHTS RESERVED
! *
! * Please refer to OpenGL/readme.txt for additional information
! *
! */


use opengl
use olympinc

interface
subroutine DrawScene ()
!MS$ATTRIBUTES STDCALL, ALIAS : '_DrawScene@0' :: DrawScene
end subroutine DrawScene

subroutine ReshapeFunction (width, height)
!MS$  ATTRIBUTES STDCALL, ALIAS : '_ReshapeFunction@8' :: ReshapeFunction
integer(4)  width
integer(4)  height
end subroutine ReshapeFunction

subroutine Key_SPACE ()
!MS$ATTRIBUTES STDCALL, ALIAS : '_Key_SPACE@0' :: Key_SPACE
end subroutine Key_SPACE

integer(4) function Args (argc)
!MS$ATTRIBUTES VALUE :: argc
integer(4)  argc
end function Args

end interface

EXTERNAL Init

integer(4)  argc
integer(4) type

    argc = nargs()
    if (Args (argc) == GL_FALSE) then
      call fauxQuit()
    end if

    call fauxInitPosition(0, 0, 400, 300)

   if (rgbmode) then
      type = AUX_RGB
   else
      type = AUX_INDEX
   end if  

   if (doublebuffer) then
      type = IOR(type, AUX_DOUBLE)
   else
      type = IOR(type, AUX_SINGLE)
   end if

   call fauxInitDisplayMode(type)

   if (fauxInitWindow("Olympic"C) == GL_FALSE) then
        call fauxQuit()
   end if

   call Init()

   call fauxExposeFunc(LOC(ReshapeFunction))
   call fauxReshapeFunc(LOC(ReshapeFunction))
   call fauxKeyFunc(AUX_SPACE, LOC(Key_SPACE))
   call fauxIdleFunc(LOC(DrawScene))

   call fauxMainLoop(NULL)
end
