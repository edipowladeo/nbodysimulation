!**************************************************************************\
!*  function:  SubclassWindow
!*
!*  input parameters:
!*   hwnd            - window handle to be subclassed,
!*   SubclassWndProc - the new window procedure.
!*
!*  Set in a new window procedure for this window.  Store the old window
!*   procedure in the first field of the extrabytes structure.  This routine
!*   is specific to this program in the use of this particular extrabyte
!*   structure.  Note that the pointer in the user bytes needs to be freed
!*   later (in WM_DESTROY).
!**************************************************************************/
subroutine SubclassWindow (hwnd, pSubclassWndProc)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: pSubclassWndProc
use subclinc
integer*4   hwnd, pSubclassWndProc
integer*4   peb
type (ExtraBytes)     eb

  peb = LocalAlloc (LPTR, SIZEOFEXTRABYTES)
  call CopyMemory (LOC(eb), peb, SIZEOFEXTRABYTES)
  eb%pfnOldProc = GetWindowLong (hwnd, GWL_WNDPROC)
  call CopyMemory (peb, LOC(eb), SIZEOFEXTRABYTES)

  ret = SetWindowLong (hwnd, GWL_USERDATA, peb)
  ret = SetWindowLong (hwnd, GWL_WNDPROC,  pSubclassWndProc)
end


!**************************************************************************\
!*  function:  QueryWindowPos
!*
!*  input parameters:
!*   hwnd - window handle,  prect - pointer to rectangle to hold the answer.
!*
!*  global variables:
!*   hwndMain  - parent window of the control.
!*
!*  Return the bounding rectangle for the hwnd control relative to hwndMain.
!**************************************************************************/
subroutine QueryWindowPos (hwnd, prect)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES REFERENCE :: prect
use subclinc
integer*4   hwnd, prect
integer*4   ret
type (T_RECT)    rects
type (T_POINT)   newpoint

ret = GetWindowRect (hwnd, rects)

newpoint%x = rects%left
newpoint%y = rects%top
ret = ScreenToClient (hwndMain, newpoint)
rects%left = newpoint%x
rects%top  = newpoint%y


newpoint%x = rects%right
newpoint%y = rects%bottom
ret = ScreenToClient (hwndMain, newpoint)
rects%right  = newpoint%x
rects%bottom = newpoint%y

call CopyMemory(prect, LOC(rects), 16)


end



