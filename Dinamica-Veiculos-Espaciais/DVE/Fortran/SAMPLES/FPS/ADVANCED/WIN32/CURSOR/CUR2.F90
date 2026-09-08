integer function MainWndProc( hWnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL , ALIAS : '_MainWndProc@16' :: MainWndProc
use cursorin

interface 
integer function  About(hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL , ALIAS : '_About@16' :: About
integer hDlg
integer message 
integer wParam 
integer lParam 
end function About
end interface

interface 
integer function sieve()
end function
end interface 

integer hWnd, message, wParam, lParam
type (T_POINT)          pt
integer                 hDC
type (T_RECT)           rectClient
integer                 NextX, NextY
type (T_PAINTSTRUCT)    ps


   select case (message) 
      case (WM_CREATE)
         str = "Press Return For Hourglass"C
         MainWndProc = 0
         return
         
      case (WM_COMMAND)
         if (LOWORD(wParam) == IDM_ABOUT) then
            i = DialogBoxParam(hInst, LOC("AboutBox"C), hWnd,LOC(About), 0)
         else
            MainWndProc = DefWindowProc(hWnd,message,wParam,lParam)
         end if
      case (WM_CHAR)
         if (INT1(wParam) == VK_RETURN) then
             i = SetCapture(hWnd)
            !/* Set the cursor to an hourglass */
             hSaveCursor = SetCursor(hHourGlass)
             write(str, '(A30)') "Calculating prime numbers.."
             i = InvalidateRect (hWnd, NULL_RECT, .TRUE.)
             i =  UpdateWindow (hWnd)
             write(str,'(A11 I4 A8)') 'Calculated ',sieve(),'primes.'
             i = InvalidateRect (hWnd, NULL_RECT, .TRUE.)
             i = UpdateWindow (hWnd)
          i = SetCursor(hSaveCursor)   !/* Restores previous cursor */
             i = ReleaseCapture()
         end if
         MainWndProc = 0
         return

      case (WM_LBUTTONDOWN)
            bTrack = .TRUE.
            str = ''C
            PrevX = INT2(LOWORD(lParam))
            PrevY = INT2(HIWORD(lParam))
            if (IAND(wParam , MK_SHIFT) == 0) then       !/* If shift key is not pressed */
               OrgX = INT2(LOWORD(lParam))
               OrgY = INT2(HIWORD(lParam))
            end if
            i = InvalidateRect (hWnd, NULL_RECT, .TRUE.)
            i = UpdateWindow (hWnd)
            !/* Capture all input even if the mouse goes outside of window */
            i = SetCapture(hWnd)
            MainWndProc = 0 
            return
      case (WM_MOUSEMOVE)
         if (bTrack .neqv. .FALSE. ) then
            NextX = INT2(LOWORD(lParam))
             NextY = INT2(HIWORD(lParam))
             !/* Do not draw outside the window's client area */
             i = GetClientRect (hWnd, rectClient)
             if (NextX < rectClient%left) then
                NextX = rectClient%left
             else if (NextX >= rectClient%right) then
                 NextX = rectClient%right - 1
            end if
             if (NextY < rectClient%top) then
                NextY = rectClient%top
             else if (NextY >= rectClient%bottom) then
                NextY = rectClient%bottom - 1
             end if
             !/* If the mouse position has changed, then clear the */
            !/* previous rectangle and draw the new one.          */
             if ((NextX .ne. PrevX) .OR. (NextY .ne. PrevY)) then
                hDC = GetDC(hWnd)
               ! in ATTRIBUTES statement
                i = SetROP2(hDC, R2_NOT)          !/* Erases the previous box */
                i = MoveToEx(hDC, OrgX, OrgY, NULL_POINT)
                i = LineTo(hDC, OrgX, PrevY)
                i = LineTo(hDC, PrevX, PrevY)
                i = LineTo(hDC, PrevX, OrgY)
                i = LineTo(hDC, OrgX, OrgY)
                    !/* Get the current mouse position */
                PrevX = NextX
                PrevY = NextY
                i = MoveToEx(hDC, OrgX, OrgY, NULL_POINT) !/* Draws the new box */
                i = LineTo(hDC, OrgX, PrevY)
                i = LineTo(hDC, PrevX, PrevY)
                i = LineTo(hDC, PrevX, OrgY)
                i = LineTo(hDC, OrgX, OrgY)
                i = ReleaseDC(hWnd, hDC)
            end if
         end if
          MainWndProc = 0
         return
         case (WM_LBUTTONUP)
             bTrack = .FALSE.                 !/* No longer creating a selection */
             i = ReleaseCapture()               !/* Releases hold on mouse input */
    
             X = INT2(LOWORD(lParam))             !/* Saves the current value      */
             Y = INT2(HIWORD(lParam))
            MainWndProc = 0
            return
         case (WM_KEYDOWN)
            if (((wParam .ne. VK_LEFT) .AND. (wParam .ne. VK_RIGHT) &
              .AND. (wParam .ne. VK_UP) .AND. (wParam .ne. VK_DOWN)) .EQV. .FALSE.) then
            pt%x = ptCursor%x 
            pt%y = ptCursor%y
             i = GetCursorPos(pt)
             !/* Convert screen coordinates to client coordinates */
            i = ScreenToClient(hWnd, pt)
            ptCursor%x = pt%x
            ptCursor%y = pt%y
            repeat = repeat + 1              !/* Increases the repeat rate */
            select case (wParam) 
            !/* Adjust cursor position according to which key was pressed. */
               case (VK_LEFT)
                  ptCursor%x = ptCursor%x - repeat
                case (VK_RIGHT)
                  ptCursor%x = ptCursor%x + repeat
               case (VK_UP)
                  ptCursor%y = ptCursor%y - repeat
               case (VK_DOWN)
                   ptCursor%y = ptCursor%y + repeat
            end select
                   !/* Get the client boundaries */
             i = GetClientRect(hWnd, rect1)
             !/* Do not draw outside the window's client area */
            pt%x = ptCursor%x 
            pt%y = ptCursor%y

             if (pt%x >= rect1%right) then
                pt%x = rect1%right - 1
             else if (pt%x < rect1%left) then
                pt%x = rect1%left
                end if
    
             if (pt%y >= rect1%bottom) then
                pt%y = rect1%bottom - 1
             else if (pt%y < rect1%top) then
                pt%y = rect1%top
                end if
    
                !/* Convert the coordinates to screen coordinates */
              
             i =  ClientToScreen(hWnd, pt)
             i = SetCursorPos(pt%x, pt%y)
           MainWndProc = 0
           return 
         else 
            MainWndProc = 1 
            return
         end if
         case (WM_KEYUP)
             repeat = 1                          !/* Clears the repeat count. */
            MainWndProc = 0
            return
         case (WM_ACTIVATE)
             if (GetSystemMetrics(SM_MOUSEPRESENT) == 0) then
                if (INT2(HIWORD(wParam)) == 0) then
                    !// LOWORD added for portability
                   if (INT2(LOWORD(wParam)) .ne. 0) then
                      i = SetCursor(LoadCursor(hInst, LOC("bullseye")))
                      pt%x = X
                      pt%y = Y
                      i = ClientToScreen(hWnd, pt)
                      i = SetCursorPos(pt%x, pt%y)
                   end if  
                  ! WA_INACTIVE
                  i = ShowCursor(.FALSE.)
                end if
             end if
            MainWndProc = 0
            return  
          case (WM_PAINT)
                hDC = BeginPaint (hWnd, ps)
              if ((OrgX .ne. PrevX) .OR. (OrgY .ne. PrevY))  then
                i = MoveToEx(hDC, OrgX, OrgY, NULL_POINT)
                i = LineTo(hDC, OrgX, PrevY)
                i = LineTo(hDC, PrevX, PrevY)
                i = LineTo(hDC, PrevX, OrgY)
                i = LineTo(hDC, OrgX, OrgY)
             end if
             i = TextOut (hDC, 1, 1, str, len(str))
             i = EndPaint (hWnd, ps)
            MainWndProc = 0
            return
          case (WM_DESTROY)
             call PostQuitMessage(0)
             MainWndProc = 0
            return
          case default
             MainWndProc = DefWindowProc(hWnd, message, wParam, lParam)
            return 
       end select
      MainWndProc = 0
      return 
        end
 
