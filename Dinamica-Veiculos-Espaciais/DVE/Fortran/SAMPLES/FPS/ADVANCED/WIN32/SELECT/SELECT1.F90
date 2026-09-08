!****************************************************************************
!*
!*    FUNCTION: EndSelection(POINT, LPRECT)
!*
!*    PURPOSE: End selection of region, release capture of mouse movement
!*
!****************************************************************************/

integer*4 function EndSelection (ptCurrent, lpSelectRect)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_EndSelection@8' :: EndSelection
!MS$ ATTRIBUTES REFERENCE :: ptCurrent
!MS$ ATTRIBUTES REFERENCE :: lpSelectRect
use msfwina
use selectin
type (T_POINTS)  ptCurrent
type (T_RECT)  lpSelectRect


   lpSelectRect%right = ptCurrent%x
   lpSelectRect%bottom = ptCurrent%y
   i  = ReleaseCapture()
   EndSelection = 1
   return 
end 

!****************************************************************************
!*
!*    FUNCTION: ClearSelection(HWND, LPRECT, int) - clear selection area
!*
!*    PURPOSE: Clear the current selection
!*
!****************************************************************************

integer*4 function ClearSelection (hWnd, lpSelectRect,fFlags)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ClearSelection@12':: ClearSelection
!MS$ ATTRIBUTES REFERENCE :: lpSelectRect
use msfwina
use selectin

integer*4       hWnd
type (T_RECT)   lpSelectRect
integer*4       fFlags

integer*4 hDC
integer*4 OldROP

   hDC = GetDC(hWnd)
   select case (IAND(fFlags,SL_TYPE))
      case (SL_BOX)
         OldROP = SetROP2(hDC, R2_NOTXORPEN)
         i  = MoveToEx(hDC, lpSelectRect%left, lpSelectRect%top, NULL_POINT)
         i = LineTo(hDC, lpSelectRect%right, lpSelectRect%top)
         i = LineTo(hDC, lpSelectRect%right, lpSelectRect%bottom)
         i = LineTo(hDC, lpSelectRect%left, lpSelectRect%bottom)
         i = LineTo(hDC, lpSelectRect%left, lpSelectRect%top)
         i = SetROP2(hDC, OldROP)

      case (SL_BLOCK)
         i = PatBlt(hDC, lpSelectRect%left, lpSelectRect%top, lpSelectRect%right - lpSelectRect%left,&
                lpSelectRect%bottom - lpSelectRect%top, DSTINVERT)
   end select 
   i = ReleaseDC(hWnd, hDC)
   ClearSelection = 1
   return 
end 
