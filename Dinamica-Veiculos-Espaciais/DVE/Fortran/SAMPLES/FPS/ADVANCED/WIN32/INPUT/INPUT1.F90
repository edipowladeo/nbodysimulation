!****************************************************************************
!
!    FUNCTION: MainWndProc(HWND, unsigned, WORD, LONG)
!
!    PURPOSE:  Processes messages
!
!    MESSAGES:
!
!        WM_COMMAND    - application menu (About dialog box)
!        WM_CREATE     - create window
!        WM_MOUSEMOVE  - mouse movement
!        WM_LBUTTONDOWN - left mouse button pressed
!        WM_LBUTTONUP  - left mouse button released
!        WM_LBUTTONDBLCLK - left mouse button double clicked
!        WM_KEYDOWN    - key pressed
!        WM_KEYUP      - key released
!        WM_CHAR       - ASCII character received
!        WM_TIMER      - timer has elapsed
!        WM_HSCROLL    - mouse click in horizontal scroll bar
!        WM_VSCROLL    - mouse click in vertical scroll bar
!        WM_PAINT      - update window, draw objects
!        WM_DESTROY    - destroy window
!
!    COMMENTS:
!
!        This demonstrates how input messages are received, and what the
!        additional information is that comes with the message.
!
!****************************************************************************

integer*4 function MainWndProc(hWnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use inputgl
interface 
integer function InitApplication(hInstance) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitApplication@4' :: InitApplication
integer         hInstance
end function InitApplication
end interface

interface 
integer function InitInstance(hInstance,nCmdShow) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitInstance@8' :: InitInstance 
integer         hInstance
integer         nCmdShow
end function InitInstance
end interface

interface
subroutine dummy (hwnd, message, wparam, lparam)
!MS$ ATTRIBUTES  STDCALL, ALIAS : '_dummy@16' :: dummy
integer hwnd 
integer message
integer wParam
integer lParam
end subroutine 
end interface

interface 
integer function  About(hDlg,messsage,wParam,lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About 
integer     hDlg 
integer     messsage 
integer     wParam 
integer     lParam 
end function About
end interface

interface
integer function itoa (value, buffer, radix)
!MS$ ATTRIBUTES STDCALL , ALIAS :'_itoa' :: itoa
integer Value
integer Buffer
integer radix
end function
end interface

integer  hWnd, message, wParam, lParam


integer                 hDC                 !/* display-context variable     */
type (T_PAINTSTRUCT)    ps
character*10            HorzOrVertText
character*16            ScrollTypeText
type(T_RECT)            rect1
type(T_TEXTMETRIC)      textmetric1
integer                 nLineHeight
integer                 nTimerCount 
character*(256)         MouseText
Character*(256)         ButtonText
character*(256)         KeyboardText
character*(256)         CharacterText
character*(256)         ScrollText
character*(256)         TimerText
type (T_RECT)           rectButton, rectScroll, rectKeyBoard,rectCharacter
type (T_RECT)           rectMouse, RectTimer

save MouseText, ButtonText, KeyBoardText, CharacterText, ScrollText, TimerText
save rectButton, rectScroll, rectKeyBoard,rectCharacter,rectMouse, RectTimer


   select case (message)
      case (WM_COMMAND)
         if (LOWORD(wParam) == IDM_ABOUT) then
            i = DialogBoxParam(hInst,&
                    LOC("AboutBox"C),&
                    NULL,&
                    LOC(About), 0)
         else
            MainWndProc = DefWindowProc(hWnd, message, wParam, lParam)
            return
         end if

      case (WM_CREATE)
         !/* Set the timer for five-second intervals */
         idTimer =  SetTimer(hWnd, 0, 5000, NULL, 1)
         !Set The Rectangular Areas for each Input
         hDC = GetDC(hWnd)
         i = GetTextMetrics(hDC, textmetric1)
         nLineHeight = textmetric1%tmExternalLeading + textmetric1%tmHeight

         rect1%left   = GetDeviceCaps(hDC, LOGPIXELSX) / 4   !/* 1/4 inch */
         rect1%right  = GetDeviceCaps(hDC, HORZRES)
         rect1%top    = GetDeviceCaps(hDC, LOGPIXELSY) / 4   !/* 1/4 inch */
         i = ReleaseDC(hWnd, hDC)
         rect1%bottom = rect1%top + nLineHeight
         rectMouse = rect1

         rect1%top = rect1%top + nLineHeight
         rect1%bottom = rect1%bottom + nLineHeight
         rectButton = rect1

         rect1%top = rect1%top + nLineHeight
         rect1%bottom = rect1%bottom + nLineHeight
         rectKeyboard = rect1

         rect1%top = rect1%top + nLineHeight
         rect1%bottom = rect1%bottom + nLineHeight
         rectCharacter = rect1

         rect1%top = rect1%top + nLineHeight
         rect1%bottom = rect1%bottom + nLineHeight
         rectScroll = rect1

         rect1%top = rect1%top + nLineHeight
         rect1%bottom   = rect1%bottom + nLineHeight
         rectTimer      = rect1
         nTimerCount    = 0
         MainWndProc = 0
         return

      case (WM_MOUSEMOVE)
         write(MouseText,100) wParam, INT2(LOWORD(lParam)),INT2(HIWORD(lParam))
100   FORMAT('WM_MOUSEMOVE: ', I2, ',', I3, ',', I3)
         i = InvalidateRect(hWnd, rectMouse, .TRUE.)

      case (WM_LBUTTONDOWN)
         write(ButtonText,200) wParam,INT2(LOWORD(lParam)), INT2(HIWORD(lParam))
200   format('WM_LBUTTONDOWN: ', I2,',', I3,',', I3)
         i = InvalidateRect(hWnd, rectButton, .TRUE.)

      case (WM_LBUTTONUP)
         write(ButtonText,300) wParam,INT2(LOWORD(lParam)),INT2(HIWORD(lParam))
300   format('WM_LBUTTONUP: ', I2,',', I3,',', I3)
         i =   InvalidateRect(hWnd, rectButton, .TRUE.)

      case (WM_LBUTTONDBLCLK)
         write(ButtonText,400) wParam,INT2(LOWORD(lParam)), INT2(HIWORD(lParam))
400   format('WM_LBUTTONDBLCLK: ', I3,',',I3,',', I3)
         i = InvalidateRect(hWnd, rectButton, .TRUE.)

      case (WM_RBUTTONDOWN)
         write(ButtonText,500) wParam,INT2(LOWORD(lParam)),INT2(HIWORD(lParam))
500   format('WM_RBUTTONDOWN: ', I3, ',',I3,',', I3)
         i  = InvalidateRect(hWnd, rectButton, .TRUE.)

      case (WM_RBUTTONUP)
         i = InvalidateRect(hWnd, rectButton, .TRUE.)

      case (WM_RBUTTONDBLCLK)
         write(ButtonText,700) wParam,INT2(LOWORD(lParam)), INT2(HIWORD(lParam))
700   format('WM_RBUTTONDBLCLK: ',I4, ',', I5,',',I5)
         i = InvalidateRect(hWnd, rectButton, .TRUE.)

       case (WM_KEYDOWN)
         write(KeyboardText,800) wParam,INT2(LOWORD(lParam)),INT2(HIWORD(lParam))
800   format('WM_KEYDOWN: ',I4, ',',I5,',', I6)
         i  = InvalidateRect(hWnd, rectKeyboard, .TRUE.)

       case (WM_KEYUP)
         write(KeyboardText,900) wParam, INT2(LOWORD(lParam)), INT2(HIWORD(lParam))
900   format('WM_KEYUP: ',I4,',', I5,',' I6)
         i  = InvalidateRect(hWnd, rectKeyboard, .TRUE.)

      case (WM_CHAR)
         write(CharacterText,1000) wParam, INT2(LOWORD(lParam)), INT2(HIWORD(lParam))
1000  format('WM_CHAR: ', I2, ',', I4, ',',I6)
         i = InvalidateRect(hWnd, rectCharacter, .TRUE.)

      case (WM_TIMER)
        nTimerCount = nTimerCount +  5
         write(TimerText,1100) nTimerCount
1100    format('WM_TIMER: ',I4, 'seconds')
         i = InvalidateRect(hWnd, rectTimer, .TRUE.)

      case (WM_HSCROLL, WM_VSCROLL)
         if (message == WM_HSCROLL) then
            HorzOrVertText = "WM_HSCROLL"C
         else
            HorzOrVertText = "WM_VSCROLL"C
         end if

         select case (INT4(LOWORD(wParam)))
         iCommand = INT4(LOWORD(wParam))
            case (SB_LINEUP) 
               ScrollTypeText = "SB_LINEUP       "C 

            case (SB_LINEDOWN) 
               ScrollTypeText = "SB_LINEDOWN     "C 

            case (SB_PAGEUP) 
               ScrollTypeText = "SB_PAGEUP       "C 

            case (SB_PAGEDOWN) 
               ScrollTypeText = "SB_PAGEDOWN     "C 

            case (SB_THUMBPOSITION) 
               ScrollTypeText = "SB_THUMBPOSITION"C 

            case (SB_THUMBTRACK) 
               ScrollTypeText = "SB_THUMBTRACK   "C 

            case (SB_ENDSCROLL) 
               ScrollTypeText = "SB_ENDSCROLL    "C

            case DEFAULT
               ScrollTypeText = "unknown         "C
         end select
         write(ScrollText, 1200) HorzOrVertText, ScrollTypeText,INT2(HIWORD(wParam)),&
                            lParam
1200  FORMAT(A10, ': ', A16, z4, z4)

         i = InvalidateRect(hWnd, rectScroll, .TRUE.)

         case (WM_PAINT)
            hDC = BeginPaint (hWnd, ps)

            if (IntersectRect(rect1, rectMouse, ps%rcPaint) .neqv. .FALSE.) then
               i = TextOut(hDC, rectMouse%left, rectMouse%top,  MouseText, lstrlen(MouseText))
            else 
               ierror = GetLastError ()               
            end if
            if (IntersectRect(rect1, rectButton, ps%rcPaint) .neqv. .FALSE.) then
               i = TextOut(hDC, rectButton%left, rectButton%top, ButtonText, lstrlen(ButtonText))
            end if
            if (IntersectRect(rect1, rectKeyboard, ps%rcPaint) .neqv. .FALSE.) then
               i = TextOut(hDC, rectKeyboard%left, rectKeyboard%top, KeyboardText, lstrlen(KeyboardText))
            else
               ierror = GetLastError()
            end if
            if (IntersectRect(rect1, rectCharacter, ps%rcPaint) .neqv. .FALSE.) then
               i = TextOut(hDC, rectCharacter%left, rectCharacter%top, &
                            CharacterText, lstrlen(CharacterText))
            end if
            if (IntersectRect(rect1, rectTimer, ps%rcPaint) .neqv. .FALSE.) then
                i = TextOut(hDC, rectTimer%left, rectTimer%top, TimerText, lstrlen(TimerText))
            end if
            if (IntersectRect(rect1, rectScroll, ps%rcPaint) .neqv. .FALSE.) then
               i = TextOut(hDC, rectScroll%left, rectScroll%top, &
                             ScrollText, lstrlen(ScrollText))
            end if

            i = EndPaint(hWnd, ps)

         case (WM_DESTROY)
              !/* Bug?, SetTimer returns an int, KillTimer takes a WORD*/
            i = KillTimer(hWnd, idTimer)                     !/* Stops the timer */
            call PostQuitMessage(0)

         case DEFAULT
            MainWndProc = DefWindowProc(hWnd, message, wParam, lParam)
            return
   end select
   MainWndProc = 0
   return
end 


!/****************************************************************************
!
!    FUNCTION: About(HWND, unsigned, WORD, LONG)
!
!    PURPOSE:  Processes messages for "About" dialog box
!
!    MESSAGES:
!
!        WM_INITDIALOG - initialize dialog box
!        WM_COMMAND    - Input received
!
!****************************************************************************/

integer*4 function  About(hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use msfwin
use inputgl
integer hDlg, message, wParam , lParam

    lpParam = lParam
    select case (message) 
        case (WM_INITDIALOG)
            About = 1
            return

        case (WM_COMMAND)
            if (LOWORD(wParam) == IDOK) then
                i  = EndDialog(hDlg, 1)
                About = 1
                return
            end if
    end select
    About = 0
    return  
end 

