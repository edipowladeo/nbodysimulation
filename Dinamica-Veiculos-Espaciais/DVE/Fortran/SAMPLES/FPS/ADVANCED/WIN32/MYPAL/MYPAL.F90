
!******************************************************************************
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************

!***************************************************************************
!*                                                                         *
!*  PROGRAM     : MyPal.f90                                                  *
!*                                                                         *
!*  PURPOSE     : Sets up a bar representation of the current physical     *
!*                palette and displays useful information regarding        *
!*                pixel colors and palette indices.                        *
!*                                                                         *
!*  FUNCTIONS   : WinMain() - calls initialization function,               *
!*                            processes message loop                       *
!*                                                                         *
!*                WndProc() - Window function for app. Processes           *
!*                            window messages.                             *
!*                                                                         *
!*              ShowColor() - Displays a little box on each side of the    *
!*                            caption bar displaying the pixel color at the*
!*                            mouse position.                              *
!***************************************************************************

interface
integer(4) function WinMain (hInstance, hPrevInstance, lpszCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
integer(4) hInstance
integer(4) hPrevInstance
integer(4) lpszCmdLine
integer(4) nCmdShow
end function WinMain
end interface
end

!****************************************************************************
!*                                                                          *
!*  FUNCTION   : WinMain(HANDLE, HANDLE, LPSTR, int)                        *
!*                                                                          *
!*  PURPOSE    : Creates the app. window and processes the message loop.    *
!*                                                                          *
!****************************************************************************/
integer*4 function WinMain(hInstance,hPrevInstance,lpCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwina
use mypalinc

integer*4 hInstance, hPrevInstance, lpCmdLine, nCmdShow

interface
integer(4) function WndProc(hWnd, iMessage, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WndProc@16' :: WndProc
integer*4 hWnd 
integer*4 iMessage 
integer*4 wParam 
integer*4 lParam 
end function WndProc
end interface

    
character*50 szMyAppName 
integer*4 hWnd
type (T_WNDCLASS)     wc
type (T_MSG)         mesg 
integer*4 xScreen
integer*4 yScreen
logical(4)  bret

szMyAppName = "MyPal"C

lpcmdline = lpcmdline

if (hPrevInstance == 0) then
    wc%style         = IOR(CS_HREDRAW,CS_VREDRAW)
    wc%lpfnWndProc   = LOC(WndProc)
    wc%cbClsExtra    = 0
    wc%cbWndExtra    = 0
    wc%hInstance     = hInstance
    wc%hIcon         = LoadIcon(hInstance, LOC(szMyAppName))
    wc%hCursor       = LoadCursor (NULL, IDC_ARROW)
    wc%hbrBackground = GetStockObject (BLACK_BRUSH)
    wc%lpszMenuName  = LOC(szMyAppName)
    wc%lpszClassName = LOC(szMyAppName)

    if (RegisterClass (wc) == 0) then
        WinMain = 0
        return
    end if
end if

! Do some global initializations */
xScreen     = GetSystemMetrics (SM_CXSCREEN)
yScreen     = GetSystemMetrics (SM_CYSCREEN)
nXBorder    = GetSystemMetrics (SM_CXFRAME)
nXTitle     = GetSystemMetrics (SM_CXSIZE)
nYTitle     = GetSystemMetrics (SM_CYSIZE)
iIndex      = 0
bCaptureOn  = .FALSE.

hDCGlobal   = GetDC (NULL)
iRasterCaps = GetDeviceCaps(hDCGlobal, RASTERCAPS)
if (IAND(iRasterCaps,RC_PALETTE) .NE. 0) then
  iRasterCaps = TRUE 
else
  iRasterCaps = FALSE
end if

if (iRasterCaps .NE. 0) then
   iNumColors = GetDeviceCaps(hDCGlobal, SIZEPALETTE)
else
   iNumColors = GetDeviceCaps( hDCGlobal, NUMCOLORS)
end if
i = ReleaseDC (NULL,hDCGlobal)

nSizeX = ((xScreen - 2*nXBorder) / PALETTESIZE) * PALETTESIZE

! create the app. window 
hWnd = CreateWindowEx (0, szMyAppName,                            &
                     "My Physical Palette "C,                     &
                     INT4(WS_OVERLAPPEDWINDOW),                   &
                     (xScreen-nSizeX) / 2 - nXBorder,             &
                     yScreen - ( 4 * GetSystemMetrics (           &
                     SM_CYCAPTION)),                              &
                     nSizeX + 2 * nXBorder,                       &
                     4 * GetSystemMetrics (SM_CYCAPTION),         &
                     NULL,                                        &
                     NULL,                                        &
                     hInstance,                                   &
                     NULL)
bret = ShowWindow (hWnd, nCmdShow)
bret = UpdateWindow (hWnd)

do while (GetMessage (mesg, NULL, 0, 0))
      bret = TranslateMessage (mesg) 
      i = DispatchMessage (mesg) 
end do

WinMain = mesg%wParam 
return 
end 




!****************************************************************************
!*                                                                          *
!*  FUNCTION   : void ShowColor(HWND hWnd, HDC hDC)                         *
!*                                                                          *
!*  PURPOSE    : Displays a little box on each side of the caption bar      *
!*               displaying the pixel color at the mouse position.          *
!*                                                                          *
!****************************************************************************
subroutine ShowColor (hWnd, hDC,Index)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ShowColor@12' :: ShowColor

use mypalinc

integer*4 hWnd,hDC,Index

integer*4 hBrush, hOldBrush
logical(4)  bret


bret = GetWindowRect (hWnd, rClientRect)

hBrush    = CreateSolidBrush ( INT4(PALETTEINDEX(Index) ))
hOldBrush = SelectObject (hDC,hBrush) 

bret = PatBlt ( hDC,                                              &
         rClientRect%left + nXTitle + nXBorder + 1,               &
         rClientRect%top + nXBorder,                              &
         nXTitle,                                                 &
         nYTitle,                                                 &
         PATCOPY)

bret = PatBlt(hDC,                                                &
       rClientRect%right - ( 3 * nXTitle + nXBorder + 2),         &
       rClientRect%top + nXBorder,                                &
       nXTitle,                                                   &
       nYTitle,                                                   &
       PATCOPY)
i = SelectObject (hDC, hOldBrush)
bret = DeleteObject (hBrush) 
end 

