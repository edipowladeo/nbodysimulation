 
!/****************************************************************************
! *                                                                          *
! *  FUNCTION   : HandlePopupMenu (hwnd, point)                              *
! *                                                                          *
! *  PURPOSE    : Handles the display of the "floating" popup that appears   *                                                           *
! *               on a mouse click in the app's client area.                 *
! *                                                                          *
! ****************************************************************************/
subroutine HandlePopupMenu (hwnd, pt)
!MS$ ATTRIBUTES VALUE :: hwnd
!MS$ ATTRIBUTES VALUE :: pt
use msfwin
use menuinc
integer*4       hwnd
type (T_POINT)   pt

integer*4       hMenu
integer*4       hMenuTrackPopup
logical(4)      bret

!/* Get the menu for the popup from the resource file. */
hMenu = LoadMenu (hInst, LOC("PopupMenu"C))
if (hMenu == 0) then
    return
end if

!/* Get the first menu in it which we will use for the call to
! * TrackPopup(). This could also have been created on the fly using
! * CreatePopupMenu and then we could have used InsertMenu() or
! * AppendMenu.
! */
hMenuTrackPopup = GetSubMenu (hMenu, 0)

!/* Convert the mouse point to screen coordinates since that is what
! * TrackPopup expects.
! */
bret = ClientToScreen (hwnd, pt)

!/* Draw and track the "floating" popup */
bret = TrackPopupMenu (hMenuTrackPopup, 0, pt%x, pt%y, 0, hwnd, NULL_RECT)

!/* Destroy the menu since were are done with it. */
bret = DestroyMenu (hMenu)
end


