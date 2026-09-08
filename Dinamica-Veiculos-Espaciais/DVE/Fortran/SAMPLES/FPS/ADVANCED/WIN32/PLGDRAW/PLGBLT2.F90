!**************************************************************************\
!*
!*  function:  DrawGrids()
!*
!*  input parameters:
!*   hdc - Device context to draw into%
!*   width, height - size of the rectangle to fill with grids%
!*
!*  global variables:  none%
!*
!**************************************************************************/
subroutine DrawGrids (hdc, width, height)
use msfwina
use trackin
use plgbltin

integer*4 hdc, width, height

! Draw vertical lines. Double at the axis 
   do i = 0  ,width, TICKSPACE
      i1 = MoveToEx (hdc, i, 0, NULL_POINT) 
      i1 = LineTo (hdc, i, height) 
   end do
   i1 = MoveToEx (hdc, 1, 0, NULL_POINT) 
   i1 = LineTo (hdc, 1, height) 

! Draw horizontal lines. Double at the axis 
   do i = 0, height, TICKSPACE
      i1 = MoveToEx (hdc, 0,i, NULL_POINT) 
      i1 = LineTo (hdc, width,i) 
   end do
   i1 = MoveToEx (hdc, 0, 1, NULL_POINT) 
   i1 = LineTo (hdc, width,1) 
   return 
end 



!****************************************************************************
!*    FUNCTION: About
!****************************************************************************
integer*4 function About(hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use msfwina
use trackin
use plgbltin

integer*4 hwnd, message, wParam, lParam

    lparam = lparam

   if ((message == WM_COMMAND) .and. (LOWORD(wParam) == IDOK)) then
      i  = EndDialog (hwnd, 1) 
      About = TRUE 
      return 
   end if
   if ((message == WM_SYSCOMMAND) .and. (wParam == SC_CLOSE)) then
      i = EndDialog (hwnd, 1) 
      About = TRUE 
      return 
   end if
   About = FALSE 
   return
end 
