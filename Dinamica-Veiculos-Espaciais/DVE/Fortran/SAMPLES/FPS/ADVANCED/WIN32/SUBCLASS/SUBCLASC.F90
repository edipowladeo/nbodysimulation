!**************************************************************************\
!*  function:  PaintRect
!*
!*  input parameters:
!*   hwnd - window handle,  prect - pointer to rectangle to be painted.
!*
!*  Get an HDC and draw the rectangle in R2_NOT mode which if done twice will
!*   leave the screen in its initial state.
!**************************************************************************/
subroutine PaintRect (hwnd, prect)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: prect
use subclinc
integer*4   hwnd, prect

type (T_RECT)   rects
integer*4   hdc
integer*4   ret

hdc = GetDC (hwnd)
ret = SetROP2(hdc, R2_NOT)
ret = SelectObject (hdc, GetStockObject (NULL_BRUSH))
call CopyMemory(LOC(rects), prect, 16)
ret = Rectangle (hdc, rects%left, rects%top,                      &
                rects%right, rects%bottom)
ret = ReleaseDC (hwnd, hdc)
end


!**************************************************************************\
!*  function:  ToggleMenu
!*
!*  input parameters:
!*   hmenu - menu handle,  iditem - id of the item to check.
!*
!*  returns:  the new checked state.
!*
!*  Change a menu item to be checked if it is not, or unchecked if it is.
!**************************************************************************/
integer*4 function ToggleMenu (hmenu, iditem)
!MS$ATTRIBUTES VALUE :: hmenu
!MS$ATTRIBUTES VALUE :: iditem
use subclinc
integer*4   hmenu
integer*2   iditem

integer*4   state
integer*4   ret

!/* query the checked state.
! *  unfortunately, this turns checked off.
! */
state = CheckMenuItem (hmenu, INT4(iditem), MF_BYCOMMAND)

!/* switch the truth value of oldstate. */
if (state > 0) then
    state = MF_UNCHECKED 
else
    state = MF_CHECKED
end if

!/* reset the menu item. */
ret = CheckMenuItem (hmenu, INT4(iditem), IOR(MF_BYCOMMAND , state))

ToggleMenu = state
return
end
