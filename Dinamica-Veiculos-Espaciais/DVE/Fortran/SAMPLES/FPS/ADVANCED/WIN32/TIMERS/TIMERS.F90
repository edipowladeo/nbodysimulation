
!******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************/

!******************************************************************************\
!*
!*  PROGRAM:     TIMERS.F90
!*
!*  PURPOSE:     To demonstrate the use of APIs SetTimer() and KillTimer().
!*
!*  FUNCTIONS:   WinMain               - standard WinMain()
!*               MainWndProc           - main window procedure
!*               TimerFunc             - handles timer messages
!*               SetButtonPositions    - sizes buttons to client area
!*               SetFlashRectPositions - sizes flashing rectangles to
!*                                         client area
!*               DrawStuff()             - draws separator, headers,
!*                                         rectangles
!*
!*  COMMENTS:    When a timer is started it's corresponding rectangle (in
!*               the client area) is inverted each time a WM_TIMER is
!*               received or each timer the TimerFunc() is called.
!*
!******************************************************************************/

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

!******************************************************************************\
!*
!*  FUNCTION:    WinMain (standard WinMain INPUTS/RETURNS)
!*
!*  GLOBAL VARS: ghInst - handle of program instance
!*
!*  LOCAL VARS:  hwnd - handle of the main standard window
!*               msg  - msg to get/dispatch
!*
!******************************************************************************/

integer*4 function  WinMain (hInstance,hPrevInstance,lpCmdLine, nCmdShow) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use timerinc
integer*4 hInstance, hPrevInstance, lpCmdLine, nCmdShow


interface 
integer(4) function MainWndProc  (hwnd, mesg, wpar, lparam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4 hwnd 
integer*4 mesg 
integer*4 wpar 
integer*4 lparam
end function MainWndProc
end interface 

integer*4 hwnd
type (T_MSG)  mesg
type (T_WNDCLASS)  wc
logical(4)  bret


    lpcmdline = lpcmdline

    if (hPrevInstance == 0) then
        wc%style         = IOR(CS_HREDRAW ,CS_VREDRAW)
        wc%lpfnWndProc   = LOC(MainWndProc)
        wc%cbClsExtra    = 0
        wc%cbWndExtra    = 0
        wc%hInstance     = hInstance
        wc%hIcon         = LoadIcon(NULL, IDI_APPLICATION)
        wc%hCursor       = LoadCursor (NULL, IDC_ARROW)
        wc%hbrBackground = GetStockObject (WHITE_BRUSH)
        wc%lpszMenuName  =  NULL
        wc%lpszClassName = LOC("TIMERS"C)

        if (RegisterClass (wc) == 0) then
            i = MessageBox (NULL,"WinMain(): RegisterClass() failed"C , &
            "Err! - TIMERS"C, IOR(MB_OK ,MB_ICONEXCLAMATION))
            WinMain = FALSE
            return
        end if
end if

ghInst = hInstance
hwnd = CreateWindowEx (0,                                   &  
                        "TIMERS"C,                          &
                        "TIMERS Sample Application"C,       &
                        INT4(WS_OVERLAPPEDWINDOW),          &
                        CW_USEDEFAULT, CW_USEDEFAULT,       &
                        CW_USEDEFAULT, CW_USEDEFAULT,       &
                        NULL, NULL, ghInst, NULL)            
   if (hwnd == 0) then
      WinMain = 0
      return
   end if

bret = ShowWindow (hwnd, nCmdShow)

do while (GetMessage (mesg, NULL, 0,0))
    bret = TranslateMessage (mesg)
    i = DispatchMessage  (mesg)
end do

WinMain = mesg%wParam
return 
  
end 



!******************************************************************************
!*
!*  FUNCTION:    MainWndProc (standard window procedure INPUTS/RETURNS)
!*
!*  GLOBAL VARS: ghInst       - handle of program instance
!*               gahwndButtons - array of button window handles
!*               gaFlashRects  - array of flashing rectangles coordinates
!*
!******************************************************************************

integer*4 function MainWndProc (hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use timerinc
integer*4 hwnd, message, wParam, lParam


interface
subroutine TimerFunc  (x, y, z, w)
!MS$ATTRIBUTES STDCALL, ALIAS : '_TimerFunc@16' :: TimerFunc
integer*4 x ,y , z , w
end subroutine TimerFunc

subroutine NULLSUBROUTINE (x, y, z, w)
!MS$ATTRIBUTES STDCALL, ALIAS : '_NULLSUBROUTINE@16' :: NULLSUBROUTINE
integer*4 x ,y , z , w
end subroutine NULLSUBROUTINE

subroutine DrawStuff (hwnd, hdc)
!MS$ ATTRIBUTES VALUE :: hwnd
!MS$ ATTRIBUTES VALUE :: hdc
integer(4)  hwnd
integer(4)  hdc
end subroutine DrawStuff

subroutine SetFlashRectPositions (cx, cy)
!MS$ ATTRIBUTES VALUE :: cx
!MS$ ATTRIBUTES VALUE :: cy
integer(4)  cx
integer(4)  cy
end subroutine SetFlashRectPositions 

subroutine SetButtonPositions (cx, cy)
!MS$ ATTRIBUTES VALUE :: cx
!MS$ ATTRIBUTES VALUE :: cy
integer(4)  cx
integer(4)  cy
end subroutine SetButtonPositions


end interface


integer*4 i
character*(BUFSIZE) buf
integer*4 id
integer*4 hdc
integer*4 width  
integer*4 height 
type (T_PAINTSTRUCT)  ps
character*100  lpszMessage


select case (message)
                    
   case (WM_CREATE)

      !
      ! Create the buttons to turn timer on/off
      !
      do i= ID_TIMER1 ,ID_TIMER4 
      gahwndButtons(i) = CreateWindowEx (0,"button"C ,           &
         "Start timer"C,                                           &
         IOR(WS_CHILD ,BS_PUSHBUTTON),                                  &
         0, 0, 0, 0, hwnd, NULL,         &
         ghInst, NULL)
      i1 = SetWindowLong (gahwndButtons(i), GWL_ID, i)
      end do

      !
      ! Have TIMER1 started initially (giving the user a clue what to do)
      !

      i = PostMessage (hwnd, WM_COMMAND, ID_TIMER1,                     &
                  gahwndButtons(ID_TIMER1))

   case (WM_COMMAND)

      id = LOWORD (wParam)
      i = GetWindowText (lParam, buf, BUFSIZE)
      lpszMessage = "Start timer"C
      if (lstrcmp (buf, lpszMessage) == 0) then
      !
      ! Set button text to "Stop timer" and start the timer. For
      !   timers 1&2 we'll specify a WNDPROC ("TimerFunc") which will
      !   get called for each timer tick. For timers 3&4 we'll just
      !   have WM_TIMER messages sent to this window procedure.
      !
      i = SetWindowText (lParam,"Stop timer"C )
      if (id < ID_TIMER3) then
         if (SetTimer (hwnd, id,(id * TIMERINTERVAL),LOC(TimerFunc),1) == &
                                                                     0) then
            i = MessageBox (NULL,"MainWndProc(): SetTimer() failed"C ,  &
                "Err! - TIMERS"C, IOR(MB_OK,MB_ICONEXCLAMATION))
         end if
      else
         if (SetTimer (hwnd, id, (id * TIMERINTERVAL),                 &
                        LOC(NULLSUBROUTINE), 0) == 0) then
            i = MessageBox (NULL,"MainWndProc(): SetTimer() failed"C , &
                   'Err! - TIMERS'C, IOR(MB_OK,MB_ICONEXCLAMATION))
      end if
      end if
      else
      i = SetWindowText (lParam,"Start timer"C )
      i = KillTimer (hwnd, id)
      end if


   case (WM_TIMER)
      !
      ! Invert the gaFlashRect associated with this timer event
      !

      hdc = GetDC (hwnd)

      i = InvertRect (hdc, gaFlashRects(wParam)) ! wParam = timerId
      i = ReleaseDC  (hwnd, hdc)

   case (WM_SIZE)

      width  = LOWORD(lParam)
      height = HIWORD(lParam)

      !
      ! User resized the window, so reposition button & flashing rects
      !

      call SetButtonPositions (width, height)
      call SetFlashRectPositions (width, height)

   case (WM_PAINT)

      i = BeginPaint (hwnd, ps)
      call DrawStuff (hwnd, ps%hdc)
      i = EndPaint (hwnd, ps)

   case (WM_DESTROY)

      call PostQuitMessage(0)

   case default

      MainWndProc = DefWindowProc(hwnd, message, wParam, lParam)
      return 
end select 
MainWndProc = 0
return 
end 





