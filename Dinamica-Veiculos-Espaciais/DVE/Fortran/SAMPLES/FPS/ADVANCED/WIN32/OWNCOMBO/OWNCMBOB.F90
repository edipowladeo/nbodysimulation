!****************************************************************************
!*                                                                          *
!*  FUNCTION   : OwnComboWndProc(hWnd, message, wParam, lParam)             *
!*                                                                          *
!*  PURPOSE    : Window function for the app. It handles menu selections    *
!*               and processes window WM_ messages.                         *
!*                                                                          *
!****************************************************************************/
integer*4 function OwnComboWndProc (hWnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_OwnComboWndProc@16' :: OwnComboWndProc
use msfwin                                              
use owncbinc
integer*4   hWnd, message, wParam, lParam

interface
integer(4) function About(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function

logical(4) function ListBoxExample (hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ListBoxExample@16' :: ListBoxExample
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function

logical(4) function ComboBoxExample (hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ComboBoxExample@16' :: ComboBoxExample
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function

logical(4) function OwnerComboBoxExample (hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_OwnerComboBoxExample@16' :: OwnerComboBoxExample
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function
end interface

select case (message)
    case (WM_COMMAND)
        select case (INT4(LoWord(wParam)))
            case (IDM_EXIT)
                ret = DestroyWindow (hWnd)

            case (IDM_ABOUT)
                !/* Bring up the about box */
                ret = DialogBoxParam (hInst,                           &
                            LOC("ABOUTBOX"C),                     &
                            hwnd,                                 &
                            LOC(About),0)

            case (IDM_LISTBOX)
                !/* Bring up the list box example */
                ret = DialogBox (hInst,                           &
                            LOC("ListBoxDialog"C),                &
                            hWnd,                                 &
                            LOC(ListBoxExample))

            case (IDM_MULTILISTBOX)
                !/* Bring up the multiple selection list box example */
                ret = DialogBox (hInst,                           &
                            LOC("ListBoxDialog"C),           &
                            hWnd,                                 &
                            LOC(ListBoxExample))

            case (IDM_COMBOBOX)
                !/* Bring up the combo box example */
                ret = DialogBox (hInst,                           &
                            LOC("ComboBoxDialog"C),               &
                            hWnd,                                 &
                            LOC(ComboBoxExample))

            case (IDM_OWNERCOMBOBOX)
                !/* Bring up the owner-draw dropdown list box example */
                ret = DialogBox (hInst,                           &
                            LOC("OwnerComboBoxDialog"C),          &
                            hWnd,                                 &
                            LOC(OwnerComboBoxExample))
        end select

    case (WM_DESTROY)
        call PostQuitMessage (0)

    case DEFAULT
        OwnComboWndProc = DefWindowProc(hWnd, message, wParam,    &
                                lParam)
        return
end select
OwnComboWndProc = 0
return
end

!****************************************************************************
!*                                                                          *
!*  FUNCTION   : HandleSelectionState(LPDRAWITEMSTRUCT, int)                *
!*                                                                          *
!*  PURPOSE    : Handles a change in an item selection state. If an item is *
!*               selected, a black rectangular frame is drawn around that   *
!*               item; if an item is de-selected, the frame is removed.     *
!*                                                                          *
!*  COMMENT    : The black selection frame is slightly larger than the gray *
!*               focus frame so they won't paint over each other.           *
!*                                                                          *
!****************************************************************************/
subroutine HandleSelectionState(lpdis, inflate)
!MS$ATTRIBUTES VALUE :: lpdis
!MS$ATTRIBUTES VALUE :: inflate
use msfwin
use owncbinc
integer*4   lpdis, inflate
type (T_DRAWITEMSTRUCT)  dis        
type (T_RECT)    rc
integer*4       hbr
integer*4       ret
logical(4)      bret

  !/* Resize rectangle to place selection frame outside of the focus
  ! * frame and the item.
  ! */
call CopyMemory (LOC(dis), lpdis, SIZEOFDRAWITEMSTRUCT)
bret = CopyRect (rc, dis%rcItem)
call CopyMemory (lpdis, LOC(dis), SIZEOFDRAWITEMSTRUCT)
bret = InflateRect (rc, inflate, inflate)

if (IAND(dis%itemState , ODS_SELECTED) .NE. 0) then
        !/* selecting item -- paint a black frame */
        hbr = GetStockObject(BLACK_BRUSH)
else
        !/* de-selecting item -- remove frame */
        hbr = CreateSolidBrush(GetSysColor(COLOR_WINDOW))
end if
ret = FrameRect(dis%hDC, rc, hbr)
bret = DeleteObject (hbr)
end
