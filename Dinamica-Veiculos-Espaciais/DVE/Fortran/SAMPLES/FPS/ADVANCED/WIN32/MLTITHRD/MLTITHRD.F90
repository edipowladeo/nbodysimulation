!******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************/

!****************************** Module Header ******************************\
!* Module Name: demo.f90
!***************************************************************************/


!*      ******MULTI-THREADED GUIDE********


!*There are aspects to a multi-threaded app, that need be explained,
!*so that a programmer understand the pitfalls of a multi-threaded app,
!*and avoid future problems in a multi-threaded application.
!*
!*The primary pifalls involve the usage of GDI objects. (DC's, regions, etc).
!*GDI is the only subsytem in NT win32, that does NOT serialize access
!*to its objects.  This is for speed/throughput reasons.  The premise
!*of GDI objects, is that an object is per process owned, per thread locked.
!*
!*        This means if you have multiple threads, accessing the same GDI object,
!*you will have MAJOR headaches, because while one thread deletes an object,
!*the other may be using it.  The model we put forward towards developers, is
!*the following model.
!*
!*        Seperate threads for
!*
!*                > Input
!*                > File IO
!*                > Printing
!*                > Graphics
!*
!** Note its ok to have graphics/Printing threads, because the use a different
!*  device.
!*
!*
!*Note that you can be single threaded, and have no GDI object serialization
!*problems. What types of problems occur, is when seperate threads attempt
!*to delete/use a GDI object, or share an object between multiple threads.
!*Since an object is per thread locked, means you will get an unexpected
!*error within the other thread.  Many windows programmers, do not expect
!*certain calls to ever fail, but a poorly constructed multi-threaded app
!*under win32  (given the above scenerios) may fail, and if not checked,
!*will cause subsequent GDI calls to fail, ultimately causing the GDI client
!*side server to die, taking the app with it.
!*
!*Thus its most important to realize that while multi-threaded apps are cool,
!*they must be programmed with respect to the above guidelines.
!*
!**/
!*
use thrdinc

interface
integer(4) function WinMain (hInstance, hPrevInstance, lpszCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
integer(4) hInstance
integer(4) hPrevInstance
integer(4) lpszCmdLine
integer(4) nCmdShow
end function WinMain
end interface
include 'data.f90'

end


!***************************************************************************\
!* WinMain
!***************************************************************************/

integer*4 function WinMain(hInstance, hPrevInstance, lpCmdLine, nShowCmd)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use thrdinc
integer*4       hInstance, hPrevInstance, lpCmdLine, nShowCmd

type (T_MSG)    mesg
integer*4       ret
logical(4)      bret

!// this will change to something more reasonable

hInstance = hInstance
hPrevInstance = hPrevInstance
lpCmdLine = lpCmdLine
nShowCmd = nShowCmd

ghModule = GetModuleHandle(NULL)

if (InitializeApp() == 0) then
    ret = MessageBox(ghwndMain,                                 &
                    "MLTITHRD: InitializeApp failure!"C,        &
                    "Error"C, MB_OK)
    WinMain = 0
    return
end if

!/*
!** DEMO MODE - These PostMessages are for Demonstration Only
!*/

bret = PostMessage(ghwndMain, WM_COMMAND, MM_BOUNCE, 0)
bret = PostMessage(ghwndMain, WM_COMMAND, MM_BOUNCE, 0)
bret = PostMessage(ghwndMain, WM_COMMAND, MM_BOUNCE, 0)
bret = PostMessage(ghwndMain, WM_COMMAND, MM_BOUNCE, 0)
bret = PostMessage(ghwndMain, WM_COMMAND, MM_BOUNCE, 0)
bret = PostMessage(ghwndMain, WM_COMMAND, MM_BOUNCE, 0)
bret = PostMessage(ghwndMain, WM_COMMAND, MM_BOUNCE, 0)
bret = PostMessage(ghwndMain, WM_COMMAND, MM_BOUNCE, 0)

bret = PostMessage(ghwndMain, WM_COMMAND, IDM_TILE, 0)

do while (GetMessage(mesg, NULL, 0, 0))
    bret = TranslateMessage(mesg)
    ret = DispatchMessage(mesg)
end do

WinMain = 1
return
end








