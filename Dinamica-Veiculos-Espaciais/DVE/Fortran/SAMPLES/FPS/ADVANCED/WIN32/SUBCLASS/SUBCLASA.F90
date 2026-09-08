!**************************************************************************\
!*
!*  function:  MainWndProc()
!*
!*  input parameters:  normal window procedure parameters.
!*  global variables:
!*   hInst     - global instance handle.  used in create window.
!*   fTestMode - global boolean, set by menu, if true ignore subclass actions.
!*
!* The main window actually does very little.  Just respond to menu commands.
!**************************************************************************/
integer*4 function MainWndProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use subclinc
integer*4   hwnd, message, wParam, lParam

interface
integer(4) function SubclassWndProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_SubclassWndProc@16' :: SubclassWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function SubclassWndProc

subroutine SubclassWindow (hwnd, WndProc)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: WndProc
integer*4   hwnd 
integer*4   WndProc 
end subroutine SubclassWindow

integer(4) function ToggleMenu (hmenu, iditem)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: iditem
integer*4   hmenu 
integer*2   iditem 
end function ToggleMenu

end interface

!interface to function ShiftlParam(HWND, HWND, LONG)

integer*4   hwndChild
select case (message) 

!/**********************************************************************\
!*  WM_DESTROY
!*
!* Post quit message.
!\**********************************************************************/
    case (WM_DESTROY)
        call PostQuitMessage(0)


!/**********************************************************************\
!*  WM_COMMAND
!*
!* Switch on the different menu items.  Create a different class of
!*  window for most of them.  Switch on and off the fTestMode global
!*  variable on IDM_TEST.
!\**********************************************************************/
    case (WM_COMMAND)
        select case(LoWord (wParam))
            case (IDM_BUTTON)
                hwndChild = CreateWindow(                         &
                "BUTTON"C, "button"C,                   &
                IOR(WS_VISIBLE , IOR(WS_CHILD , WS_CLIPSIBLINGS)),&
                50,10, 60, 32,                                    &
                hwnd, NULL, hInst, NULL)

                call SubclassWindow (hwndChild,                   &
                                    LOC(SubclassWndProc))

            case (IDM_EDIT)
                 hwndChild = CreateWindow(                        &
                 "EDIT"C, "edit"C,                                &
                 IOR(WS_VISIBLE , IOR(WS_CHILD ,                  &
                 IOR(WS_BORDER , WS_CLIPSIBLINGS))),              &
                 50,50, 60, 20,                                   &
                 hwnd, NULL, hInst, NULL)

              call SubclassWindow (hwndChild,                     &
                                    LOC(SubclassWndProc))

            case (IDM_LIST)
              hwndChild = CreateWindow(                           &
                 "LISTBOX"C, ""C,                           &
                 IOR(WS_VISIBLE , IOR(WS_CHILD ,                  &
                 IOR(WS_BORDER , WS_CLIPSIBLINGS))),              &
                 50,90, 70, 150,                                   &
                 hwnd, NULL, hInst, NULL)
              ierrror = GetLAstError ()

              call SubclassWindow (hwndChild,                     &
                                    LOC(SubclassWndProc))

            case (IDM_TEST)
              fTestMode = ToggleMenu (GetMenu(hwnd), IDM_TEST)

        end select   !/* end switch */
end select
MainWndProc = DefWindowProc(hwnd, message, wParam, lParam)
return
end




!**************************************************************************\
!*
!*  function:  SubclassWndProc
!*
!*  input parameters:  normal window procedure parameters.
!*  global variables:
!*   hwndMain  - parent window of the control.
!*   fTestMode - global boolean, set by menu, if true ignore subclass actions.
!**************************************************************************/
integer*4 function SubclassWndProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_SubclassWndProc@16' :: SubclassWndProc
use subclinc
integer*4   hwnd, message, wParam, lParam

interface
subroutine QueryWindowPos (hwnd, lpRect)
!MS$ATTRIBUTES VALUE :: hwnd
integer*4   hwnd 
integer*4   lpRect 
end subroutine QueryWindowPos

subroutine PaintRect (hwnd, lpRect)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: lpRect
integer*4   hwnd 
integer*4   lpRect 
end subroutine PaintRect
end interface

integer*4   peb

type (ExtraBytes)      eb
type (T_POINT)           mouse, mouse1
integer*4               width, height
integer*4               width2, height2
type (T_RECT)            rects

!/* get the pointer to the extra bytes structure out of the user data. */
peb = GetWindowLong (hwnd, GWL_USERDATA)

!/* if running in test mode, just return the old procedure. */
call CopyMemory (LOC(eb), peb, SIZEOFEXTRABYTES)
if (fTestMode .NE. 0) then
    SubclassWndProc = CallWindowProc (eb%pfnOldProc, hwnd,        &
                            message, wParam, lParam)
    return
end if


select case (message) 


  !/**********************************************************************\
  !*  WM_DESTROY
  !*
  !* Free up the ExtraBytes structure which was allocated at subclass time.
  !\**********************************************************************/
    case (WM_DESTROY)
        ret = LocalUnlock (LocalHandle (peb))


  !/**********************************************************************\
  !*  WM_SETCURSOR
  !*
  !* Set the mouse pointer conditional on the Action which would be taken
  !*  if the user presses mouse down.  This is set in WM_MOUSEMOVE.
  !\**********************************************************************/
    case (WM_SETCURSOR)
        select case (eb%Action) 
            case (ACTIONNONE)
                ret = SetCursor (LoadCursor (NULL, INT4(IDC_ARROW)))
            case (ACTIONMOVE)
                ret = SetCursor (LoadCursor (NULL, INT4(IDC_SIZEALL)))
            case (ACTIONSIZEX)
                ret = SetCursor (LoadCursor (NULL, INT4(IDC_SIZEWE)))
            case (ACTIONSIZEY)
                 ret = SetCursor (LoadCursor (NULL, INT4(IDC_SIZENS)))
            case (ACTIONSIZEXY)
                ret = SetCursor (LoadCursor (NULL, INT4(IDC_SIZENWSE)))
        end select
        SubclassWndProc = 0
        return 



  !/**********************************************************************\
  !*  WM_LBUTTONDOWN
  !*
  !* The user is beginning a drag operation.  Fill in an initial window pos
  !*  in the rect field, figure out which corner the cursor should be set
  !*  to, translate that point to screen coordinates, and finally capture
  !*  the mouse.
  !\**********************************************************************/
    case (WM_LBUTTONDOWN)

        !iret = messagebox(NULL, "WM_LBUTTONDOWN", "ERROR", MB_OK)

        call CopyMemory (LOC(eb), peb, SIZEOFEXTRABYTES)
        call QueryWindowPos (hwnd, LOC(eb%rects))
        call CopyMemory (peb, LOC(eb), SIZEOFEXTRABYTES)

        select case (eb%Action) 
            case (ACTIONMOVE)
                mouse%x = eb%rects%left
                mouse%y = eb%rects%top 

            case (ACTIONSIZEX)
                mouse%x = eb%rects%right
                mouse%y = eb%rects%top 

            case (ACTIONSIZEY)
                mouse%x = eb%rects%left
                mouse%y = eb%rects%bottom

            case (ACTIONSIZEXY)
                mouse%x = eb%rects%right
                mouse%y = eb%rects%bottom
        end select

        !/* SetCursorPos() works based on screen position, and mouse is
        ! *  currently relative to hwndMain.
        ! */
        ret = ClientToScreen (hwndMain, mouse)
        ret = SetCursorPos (mouse%x, mouse%y)
        ret = SetCapture (hwnd)
        SubclassWndProc = 0
        return 


  !/**********************************************************************\
  !*  WM_LBUTTONUP
  !*
  !* Complement of the WM_LBUTTONDOWN message.  Release the capture,
  !*  and reset the actual window's position.
  !\**********************************************************************/
    case (WM_LBUTTONUP)
        !iret = messagebox(NULL, "WM_LBUTTONUP", "ERROR", MB_OK)
        if (GetCapture() == hwnd) then
            ret = ReleaseCapture()
            ret = SetWindowPos (hwnd, NULL, eb%rects%left,        &
                                eb%rects%top,                     &
                                (eb%rects%right - eb%rects%left), &
                                (eb%rects%bottom - eb%rects%top), &
                                SWP_NOZORDER)
            ret = InvalidateRect (hwnd, NULL_RECT, .TRUE.)
        end if
        SubclassWndProc = 0
        return



  !/**********************************************************************\
  !*  WM_MOUSEMOVE
  !*
  !* There are two cases of interest here.  If the mouse is captured, then
  !*  change the rect field in the extrabyte structure to reflect the new
  !*  size/position that the user is selection.
  !*
  !*  If the mouse is not captured, then set the Action field dependent on
  !*  the quadrant so that the WM_SETCURSOR will display the correct cursor.
  !*
  !\**********************************************************************/
    case (WM_MOUSEMOVE)
        !/* the LO/HI-WORD from lParam will be a signed short relative to
        ! *  the child control window.
        ! */
        mouse1%x = LoWord(lParam)
        mouse1%y = HiWord(lParam)


    call CopyMemory (LOC(eb), peb, SIZEOFEXTRABYTES)
    !/* if the mouse is captured, then we are doing direct manipulation */
    if (GetCapture() == hwnd)  then

      !/* translate mouse pos to be client relative, not control relative */
        ret = ClientToScreen (hwnd, mouse1)
        ret = ScreenToClient (hwndMain, mouse1)

      !/* erase the old rectangle */
        
        call PaintRect (hwndMain, LOC(eb%rects))
        
        select case (eb%Action)
            case (ACTIONMOVE)
                width = eb%rects%right - eb%rects%left
                height = eb%rects%bottom - eb%rects%top
                eb%rects%left = mouse1%x
                eb%rects%top  = mouse1%y
                eb%rects%right  = eb%rects%left + width
                eb%rects%bottom = eb%rects%top +  height

            case (ACTIONSIZEX)
                eb%rects%right  = mouse1%x

            case (ACTIONSIZEY)
                eb%rects%bottom = mouse1%y

            case (ACTIONSIZEXY)
                eb%rects%right  = mouse1%x
                eb%rects%bottom = mouse1%y
        end select
        call CopyMemory (peb, LOC(eb), SIZEOFEXTRABYTES)
      !/* Redraw the new rectangle */
        call CopyMemory (LOC(eb), peb, SIZEOFEXTRABYTES)
        call PaintRect (hwndMain, LOC(eb%rects))
        call CopyMemory (peb, LOC(eb), SIZEOFEXTRABYTES)


    !/* if the mouse is not captured, then set the action for the sake of
    ! *  the WM_SETCURSOR message.  The action is dependent upon which
    ! *  quadrant of the window the mouse cursor is over.
    ! */
    else 

        ret = GetClientRect (hwnd, rects)
        width2 =  (rects%right -  rects%left)/2
        height2 =  (rects%bottom -  rects%top)/2

        !/* upper left hand corner */
        if ((mouse1%x <= (width2)) .AND.                        &
                            (mouse1%y <= (height2))) then
                eb%Action = ACTIONMOVE

        !/* lower left hand corner */
        else if ((mouse1%x <= (width2)) .AND.                   &
                            (mouse1%y > (height2))) then
                eb%Action = ACTIONSIZEY

        !/* upper right hand corner */
        else if ((mouse1%x > (width2)) .AND.                   &
                            (mouse1%y <= (height2))) then
                eb%Action = ACTIONSIZEX

        !/* lower right hand corner */
        else if ((mouse1%x > (width2)) .AND.                   &
                            (mouse1%y > (height2))) then
                eb%Action = ACTIONSIZEXY
        end if
        call CopyMemory (peb, LOC(eb), SIZEOFEXTRABYTES)
    end if
    SubclassWndProc = 0
    return 



  !/**********************************************************************\
  !* for messages that are not handled explicitly here, pass them
  !*  back to the old window procedure.
  !\**********************************************************************/
    case DEFAULT
        SubclassWndProc = CallWindowProc (eb%pfnOldProc, hwnd,    &
                            message, wParam, lParam)
        return
end select !/* end switch */

SubclassWndProc = 0
return
end
