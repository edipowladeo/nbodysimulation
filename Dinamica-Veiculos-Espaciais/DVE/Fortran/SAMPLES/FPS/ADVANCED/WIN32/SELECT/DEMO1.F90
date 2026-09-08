!****************************************************************************
!*
!*    FUNCTION: DemoWndProc(HWND, unsigned, WORD, LONG)
!*
!*    PURPOSE:  Processes messages
!*
!*    MESSAGES:
!*
!*        WM_SYSCOMMAND - system menu (About dialog box)
!*        WM_CREATE     - create window
!*        WM_DESTROY    - destroy window
!*        WM_LBUTTONDOWN - left mouse button
!*        WM_MOUSEMOVE   - mouse movement
!*        WM_LBUTTONUP   - left button released
!*
!*        WM_COMMAND messages:
!*            IDM_BOX    - use inverted box for selecting a region
!*            IDM_BLOCK  - use empty box for selecting a region
!*            IDM_RETAIN - retain/delete selection on button release
!*
!*    COMMENTS:
!*
!*        When the left mouse button is pressed, btrack is set to TRUE so that
!*        the code for WM_MOUSEMOVE will keep track of the mouse and update the
!*        box accordingly%  Once the button is released, btrack is set to
!*        FALSE, and the current position is saved%  Holding the SHIFT key
!*        while pressing the left button will extend the current box rather
!*        then erasing it and starting a new one%  The exception is when the
!*        retain shape option is enabled%  With this option, the rectangle is
!*        zeroed whenever the mouse is released so that it can not be erased or
!*        extended%
!*
!****************************************************************************/

integer*4 function DemoWndProc(hWnd,message,wParam,lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DemoWndProc@16' :: DemoWndProc
use msfwina
use demoin
use selectin
include 'select.fi'

interface 
integer function DemoInit(HANDLE)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DemoInit@4' :: DemoInit
integer*4 HANDLE
end function
end interface

interface 
integer function About(x, y, z, w)
!MS$ ATTRIBUTES STDCALL, ALIAS: '_About@16' :: About
integer*4 x 
integer*4 y 
integer*4 z 
integer*4 w 
end function
end interface

integer*4 hWnd
integer*4 message
integer*4 wParam
integer*4 lParam

integer*4 hMenu
type (T_POINTS)  pts
save pts

   lparam = lparam
   select case (message) 

   case (WM_COMMAND)
      ! LOWORD added for portability
      select case (INT4(LOWORD(wParam)))
         case (IDM_BOX)
            Shape = SL_BOX
            hMenu = GetMenu(hWnd)
            i = CheckMenuItem(hMenu, IDM_BOX, MF_CHECKED)
            i = CheckMenuItem(hMenu, IDM_BLOCK, MF_UNCHECKED)

         case (IDM_BLOCK)
            Shape = SL_BLOCK
            hMenu = GetMenu(hWnd)
            i = CheckMenuItem(hMenu, IDM_BOX, MF_UNCHECKED)
            i = CheckMenuItem(hMenu, IDM_BLOCK, MF_CHECKED)

         case (IDM_RETAIN)
            if (RetainShape .ne. 0) then
               hMenu = GetMenu(hWnd)
               i = CheckMenuItem(hMenu,IDM_RETAIN,MF_UNCHECKED)
               RetainShape = FALSE
            else 
               hMenu = GetMenu(hWnd)
               i = CheckMenuItem(hMenu, IDM_RETAIN, MF_CHECKED)
               RetainShape = TRUE
            end if

          case (IDM_ABOUT)
              i = DialogBoxParam (hInst, LOC("ABOUTBOX"C), hWnd, &
                           LOC(About) , 0)


      end select

      case (WM_LBUTTONDOWN)

         bTrack = TRUE               ! user has pressed the left button 

         ! If you don't want the shape cleared, you must clear the Rect
         ! coordinates before calling StartSelection

         if (RetainShape .ne. 0) then
            i = SetRectEmpty(Rect1)
         end if

         if (IAND(wParam,MK_SHIFT) .ne. 0) then
            pts%x = INT2(LOWORD(lParam))
            pts%y = INT2(HIWORD(lParam))
            i  = StartSelection(hWnd, pts, Rect1, IOR(SL_EXTEND,Shape ))
         else
            pts%x = INT2(LOWORD(lParam))
            pts%y = INT2(HIWORD(lParam))
            i  = StartSelection(hWnd, pts, Rect1, Shape )
         end if

      case (WM_MOUSEMOVE)
            if (bTrack .ne. 0) then
               pts%x = INT2(LOWORD(lParam))
               pts%y = INT2(HIWORD(lParam))
               i = UpdateSelection(hWnd, pts, Rect1, Shape)
               Rect1%right = pts%x
               Rect1%bottom = pts%y
            end if

      case (WM_LBUTTONUP)
         if (bTrack .ne. 0)  then
            pts%x = INT2(LOWORD(lParam))
            pts%y = INT2(HIWORD(lParam))

            i = EndSelection(pts, Rect1)
            Rect1%right = pts%x
            Rect1%bottom = pts%y
            bTrack = FALSE
         end if

      case (WM_SIZE)
         select case (wParam) 
            case (SIZEICONIC)

            ! If we aren't in retain mode we want to clear the 
            ! current rectangle now! 
            !
            if (RetainShape == 0) then
               i = SetRectEmpty(Rect1)
            end if
         end select 

      case (WM_DESTROY)
         call PostQuitMessage(0)

      case default
         DemoWndProc = DefWindowProc(hWnd, message, wParam, lParam)
      return
   end select 
   DemoWndProc = 0
end 

!****************************************************************************
!*
!*    FUNCTION: About(HWND, unsigned, WORD, LONG)
!*
!*    PURPOSE:  Processes messages for "About" dialog box
!*
!*    MESSAGES:
!*
!*        WM_INITDIALOG - initialize dialog box
!*        WM_COMMAND    - Input received
!*
!****************************************************************************/

integer*4 function About(hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use msfwina
include 'select.fi'
integer*4 hDlg
integer*4 message
integer*4 wParam
integer*4 lParam

    lparam = lparam
   select case (message) 
      case (WM_INITDIALOG)
         About = TRUE
         return 

      case (WM_COMMAND)
         ! LOWORD added for portability
         if ((LOWORD(wParam) == IDOK) .or. (LOWORD(wParam) == IDCANCEL)) then
            i = EndDialog(hDlg, TRUE)
            About = TRUE
            return 
         end if
            About = TRUE
            return 
   end select 
   About = FALSE
   return
end 
