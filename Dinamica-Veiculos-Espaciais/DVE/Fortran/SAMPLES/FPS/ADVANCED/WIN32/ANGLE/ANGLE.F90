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

integer*4 function  WinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow)                          
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain    
use msfwina
use anginc
include 'angle.fi'
integer*4       hInstance, hPrevInstance, lpCmdLine, nCmdShow

type (T_MSG)        mesg
type (T_WNDCLASS)   wc
integer           ret
logical(4)         lret
integer*4         hWndMain
character*100     lpszClassName, lpszMenuName, lpszIconName

! Unreferenced variables
        
    lpCmdLine       = lpCmdLine
    lpszMenuName    = lpszMenuName

! Check for previous instance.  If none, then register class.
    if (hPrevInstance == 0) then
        lpszClassName       = "Angle"C
        lpszIconName        = "AngleIcon"C
        wc%style            = 0
        wc%lpfnWndProc      = LOC(MainWndProc)
        wc%cbClsExtra       = 0
        wc%cbWndExtra       = 0
        wc%hInstance        = hInstance
        wc%hIcon            = LoadIcon(hInstance, LOC(lpszIconName))
        wc%hCursor          = LoadCursor(NULL, IDC_ARROW)
        wc%hbrBackground    = GetStockObject(LTGRAY_BRUSH)
        wc%lpszMenuName     = NULL
        wc%lpszClassName    = LOC(lpszClassName)

        if (RegisterClass(wc) == 0) then
            WinMain = 0
            return
        end if
  end if   !/* class registered o.k. */
! /*  Create the main window.  Return FALSE if CreateWindow() fails */

   hInst = hInstance
   hwndMain =  CreateWindow(                                     &
                      lpszClassName,                             &
                      'AngleArc'C   ,                            &
                      IOR(INT4(WS_OVERLAPPEDWINDOW),             &
                      INT4(WS_CLIPCHILDREN)),                    &
                      CW_USEDEFAULT,                             &
                      CW_USEDEFAULT,                             &
                      CW_USEDEFAULT,                             &
                      CW_USEDEFAULT,                             &
                      NULL,                                      &
                      NULL,                                      &
                      hInstance,                                 &
                      NULL)

   if (hwndMain == 0) then
      ierr = GetLastError()
      WinMain = 0
      return
   end if

   lret = ShowWindow(hwndMain, nCmdShow)
   lret = UpdateWindow(hwndMain)

   ! /* Loop getting messages and dispatching them. */
   do while (GetMessage(mesg, NULL, 0, 0) .NEQV. .FALSE.)
      if (IsDialogMessage(hwndDlg, mesg) .EQV. .FALSE.) then
         ret = TranslateMessage(mesg)
         ret = DispatchMessage(mesg)
      end if
   end do
   WinMain = mesg%wParam
   return
end                                    

!
!MainWndProc
!
integer*4 function MainWndProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL :: MainWndProc
use msfwina
use anginc

interface
integer(4) function DlgProc(hwnd, message, wPAram, lParam) 
!MS$  ATTRIBUTES STDCALL, ALIAS : '_DlgProc@16' :: DlgProc
integer hwnd, message, wParam, lParam
end function DlgProc
end interface

integer*4   hwnd, message, wParam, lParam

type (T_PAINTSTRUCT)  ps
type (T_RECT)         rectp
character*(MAXCHARS)   buffer 
integer           hPenGrid, hPenArc
SAVE              hPenGrid, hPenArc
integer           hdc, hDlg
SAVE              hDlg

integer           i
integer           x, y, radius
real              start, sweep
logical*4         result
integer*4         ret
logical(4)        bret
character*100     lpszEditText

select case (message)

!/**********************************************************************\
!*  WM_CREATE
!*
!*  Then create three pens for drawing with later.
!\**********************************************************************/
case (WM_CREATE)
      hPenGrid = CreatePen(PS_SOLID, 1, INT4(GRIDCOLOR))
      hPenArc = CreatePen(PS_SOLID, 2, 16#01000005)
      iaddr = LOC(DlgProc)
      hwndDlg = CreateDialogParam(hInst, INT4(100), hwnd, LOC(DlgProc), 0)
      hDlg = hwndDlg
      lret = ShowWindow(hwndDlg, SW_SHOW)

!/**********************************************************************\
!*  WM_DESTROY
!*
!* Complement of the WM_CREATE message.  Delete the pens that were
!*  created and then call postquitmessage.
!\**********************************************************************/
  case (WM_DESTROY)
      bret = DeleteObject(hPenGrid)
      bret = DeleteObject(hPenArc)
      call PostQuitMessage(0)


!/**********************************************************************\
!*  WM_SIZE                                                            
!*
!* Stretch the top dialog to fill the width of the main window.
!\**********************************************************************/
  case (WM_SIZE)
      bret = SetWindowPos(hDlg, NULL, 0, 0, INT4(LoWord(lParam)),   &
           DIALOGHEIGHT, 0)


!/**********************************************************************\
!*  WM_PAINT
!*
!* First shift the viewport origin down so that 0,0 is the top left
!*  most visible point (out from underneath the top dialog).  Second,
!*  draw the grid with wider lines on the axes.  Finally, read the
!*  values out of the top dialog, do elementary validation, and then
!*  try to call AngleArc() with the values.  If a value fails validation,
!*  then write a small error message, and don't draw the arc.
!\**********************************************************************/
    case (WM_PAINT)

        hdc = BeginPaint(hwnd, ps)

        bret = SetViewportOrgEx(hdc, 0, DIALOGHEIGHT, NULL_POINT)

        bret = GetClientRect(hwnd, rectp)

        ret = SelectObject(hdc, hPenGrid)
        !/* Draw vertical lines.  */
        do i = 0, rectp%right, TICKSPACE
            bret = MoveToEx(hdc, i, rectp%top, NULL_POINT)
            bret = LineTo(hdc, i, rectp%bottom)
        end do

        bret = MoveToEx(hdc, 1, 0, NULL_POINT)
        bret = LineTo(hdc, 1, rectp%bottom)

        !/* Draw horizontal lines.  */
        do i = 0, rectp%bottom, TICKSPACE
            bret = MoveToEx(hdc, rectp%left, i, NULL_POINT)
            bret = LineTo(hdc, rectp%right, i)
        end do

        bret = MoveToEx(hdc, 0, 1, NULL_POINT)
        bret = LineTo(hdc, rectp%right, 1)

        !/* new color pen for the actual arc. */
        ret = SelectObject(hdc, hPenArc)

        !/*
        ! * Query the top dialog parameters, if a value is bad, report that
        ! * and break out of conditional. if all values are good, then set
        ! * the current point and call AngleArc(). 
        ! */
        if (IsWindow(hDlg) .NEQV. .FALSE.) then
            x = GetDlgItemInt(hDlg, DID_X, LOC(result) ,.TRUE.)
            if (result .EQV. .FALSE.) then  
                lpszEditText = "Bad X"C
                bret = TextOut(hdc, 10, rectp%bottom - 2*DIALOGHEIGHT, lpszEditText, 5)
                goto 1001
            end if
            y = GetDlgItemInt(hDlg, DID_Y, LOC(result), .TRUE.)
            if (result .EQV. .FALSE.) then
                lpszEditText = "Bad Y"C
                bret = TextOut(hdc, 30, rectp%bottom - 2 * DIALOGHEIGHT, lpszEditText, 5)
                goto 1001
            end if
            radius = GetDlgItemInt(hDlg, DID_RADIUS, LOC(result), .TRUE.)
            if (result .EQV. .FALSE.) then
                lpszEditText = "Bad Radius"C
                bret = TextOut(hdc, 50, rectp%bottom - 2*DIALOGHEIGHT, lpszEditText, 10)
                goto 1001
            end if
           !/*
           !* Hard to validate these floating point numbers. Good chance
           !* that invalid values will just map to 0.0 
           !*/
         if (GetDlgItemText(hDlg, DID_START, buffer, MAXCHARS) == 0) then                        
               lpszEditText = "Bad Start"C
               bret = TextOut(hdc, 70, rectp%bottom -  2*DIALOGHEIGHT,lpszEditText, 9)
               goto 1001
           end if
           !** chartoreal needs to be done as FORTRAN does a strict 
           !** format checking
           start = chartoreal(LOC(buffer))
           if (GetDlgItemText(hDlg, DID_SWEEP, buffer, MAXCHARS) == 0) then
               lpszEditText = "Bad Sweep"C
               bret = TextOut(hdc, 90, INT(rectp%bottom - 2*DIALOGHEIGHT),lpszEditText, 9)
               goto 1001
           end if
           sweep = chartoreal(LOC(buffer))
            
           bret = MoveToEx(hdc, x, y, NULL_POINT)
           bret = AngleArc(hdc, x, y, radius, start, sweep)
        end if
        bret = EndPaint(hwnd, ps)
        MainWndProc = 0
        return
    end select   !/* end switch */

1001  MainWndProc = DefWindowProc(hwnd, message, wParam, lParam)

return
end

