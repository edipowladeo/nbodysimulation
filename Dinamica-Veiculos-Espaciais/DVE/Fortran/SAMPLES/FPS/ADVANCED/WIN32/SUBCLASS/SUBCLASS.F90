!******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************/

!**************************************************************************\
!*  subclass.f90 -- Demonstrate subclassing of standard controls.
!*
!* This sample allows the user to create an arbitrary number of child
!*  controls on the main window.  These controls are subclassed, and the
!*  subclass procedure provides the user a way to move and size the controls.
!*  A menu item switches in and out of "Test Mode."  When this is on, the
!*  subclass procedure passes all messages through to the old procedure, and
!*  the controls act just like normal.
!*
!* There is a single subclass window procedure for a variety of different
!*  control classes.  This is accomplished by storing the old window procedure
!*  for the control in a structure pointed at by the 4 "user extra bytes."
!*  I.e. the GWL_USERDATA contains a pointer to the following structure:
!*
!*       typedef struct tagExtraBytes{
!*           WNDPROC    pfnOldProc;
!*           RECT       rect;
!*           int        Action;
!*       } ExtraBytes, *PExtraBytes;
!*
!*  and the old window procedure is stored in the pfnOldProc field.
!*  The rect field is used for drawing the temporary rectangle while the
!*  user is dragging, and the Action field holds the type of action that
!*  is allowed (move, size, ...).  Notice that the rect rectangle is in
!*  the coordinate space of the parent window.
!*
!* Warning:  buttons, edit fields, and list boxes are easy.  It is difficult
!*  to extend this to static controls because they do not normally receive
!*  input and thus do not get mousedown messages.  It is difficult to extend
!*  this to comboboxes because of the compound structure and the fact that
!*  the comboboxes children controls (edit field & list box) get the mouse
!*  messages first.
!*
!**************************************************************************/

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

!**************************************************************************\
!*
!*  function:  WinMain()
!*
!*  input parameters:  c.f. generic sample
!*
!**************************************************************************/
integer*4 function WinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use subclinc
integer*4   hInstance, hPrevInstance, lpCmdLine, nCmdShow

interface 
integer(4) function MainWndProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function MainWndProc
end interface 

logical(4)         bret
type (T_MSG)         mesg
type (T_WNDCLASS)    wc
character*100      lpszClassName, lpszMenuName, lpszIconName

lpcmdline = lpcmdline 

!/* Check for previous instance.  If none, then register class. */
lpszClassName="scClass"C
lpszMenuName ="scMenu"C
lpszIconName = "subclassIcon"C
if (hPrevInstance == 0) then
    wc%style = 0
    wc%lpfnWndProc = LOC(MainWndProc)
    wc%cbClsExtra = 0
    wc%cbWndExtra = 0
    wc%hInstance = hInstance
    wc%hIcon = LoadIcon(hInstance, LOC(lpszIconNAme))
    wc%hCursor = LoadCursor(NULL, IDC_ARROW)
    wc%hbrBackground = GetStockObject(GRAY_BRUSH)
    wc%lpszMenuName =  LOC(lpszMenuName)
    wc%lpszClassName = LOC(lpszClassName)

    if (RegisterClass(wc) == 0) then
        WinMain = FALSE
        return 
    end if
end if  !/* class registered o.k. */


!/* Create the main window.  Return false if CreateWindow() fails */
hInst = hInstance


hwndMain = CreateWindow(                                        &
     lpszClassName,                                             &
     "Subclass Window Sample"C,                                 &
     INT4(WS_OVERLAPPEDWINDOW),                                         &
     CW_USEDEFAULT,                                               &
     CW_USEDEFAULT,                                               &
     CW_USEDEFAULT,                                               &
     CW_USEDEFAULT,                                               &
     NULL,                                                        &
     NULL,                                                        &
     hInstance,                                                   &
     NULL)

if (hwndMain == 0) then
    WinMain = 0
    return
end if


ret = ShowWindow(hwndMain, nCmdShow)

!/* Loop getting messages and dispatching them. */
do while (GetMessage(mesg,NULL, 0,0)) 
    bret = TranslateMessage(mesg)
    ret = DispatchMessage(mesg)
end do

!/* Return the value from PostQuitMessage */
WinMain = mesg%wParam
return
end













