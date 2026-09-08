!****************************************************************************
!*
!*    PROGRAM: Select.f90
!*
!*    PURPOSE: Contains library routines for selecting a region
!*
!*    FUNCTIONS:
!*
!*        StartSelection(HWND, POINT, LPRECT, int) - begin selection area
!*        UpdateSelection(HWND, POINT, LPRECT, int) - update selection area
!*        EndSelection(POINT, LPRECT) - end selection area
!*        ClearSelection(HWND, LPRECT, int) - clear selection area
!*
!*******************************************************************************/

use msfwina
!include 'select.fi' 
end

!****************************************************************************
!*   FUNCTION: LibMain(HANDLE, DWORD, LPVOID)
!*
!*   PURPOSE:  LibMain is called by Windows when
!*             the DLL is initialized, Thread Attached, and other times.
!*             Refer to SDK documentation, as to the different ways this
!*             may be called.
!*             
!*             The LibMain function should perform additional initialization
!*             tasks required by the DLL.  In this example, no initialization
!*             tasks are required.  LibMain should return a value of 1 if
!*             the initialization is successful.
!*           
!*******************************************************************************/

integer*4 function DllMain (hInst, ul_reason_being_called, lpReserved)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DllMain@12' :: DllMain
use msfwina
integer*4 hInst
integer*4 ul_reason_being_called 
integer*4 lpReserved
               
hInst               =  hInst
ul_reason_being_called  =  ul_reason_being_called
lpReserved      =  lpReserved

   DllMain = 1
   return 
end


!****************************************************************************
!*
!*    FUNCTION: StartSelection(HWND, POINT, LPRECT, int)
!*
!*    PURPOSE: Begin selection of region
!*
!****************************************************************************/

integer*4 function StartSelection (hWnd, ptCurrent, lpSelectRect, fFlags)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StartSelection@16':: StartSelection
!MS$ ATTRIBUTES REFERENCE :: ptcurrent
!MS$ ATTRIBUTES REFERENCE :: lpSelectRect
use msfwina
use selectin

interface 
integer*4 function ClearSelection (hWnd, lpSelRect,fFlags)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ClearSelection@12':: ClearSelection
!MS$ ATTRIBUTES REFERENCE :: lpSelRect
use msfwinty
integer*4       hWnd
type (T_RECT)   lpSelRect
integer*4       fFlags
end function ClearSelection
end interface

integer*4 hWnd
type (T_POINTS)  ptCurrent
type (T_RECT)  lpSelectRect
integer*4 fFlags


   if ((lpSelectRect%left .ne. lpSelectRect%right) .or.(lpSelectRect%top .ne. lpSelectRect%bottom)) then
      i = ClearSelection(hWnd, lpSelectRect, fFlags)
   end if

   lpSelectRect%right   = ptCurrent%x
   lpSelectRect%bottom  = ptCurrent%y

! If you are extending the box, then invert the current rectangle 

   if (IAND(fFlags,SL_SPECIAL) == SL_EXTEND) then
      i = ClearSelection(hWnd, lpSelectRect, fFlags)
   else 
      lpSelectRect%left = ptCurrent%x
      lpSelectRect%top = ptCurrent%y
   end if
   i = SetCapture(hWnd)
   StartSelection = 1
   return 
end 

!****************************************************************************
!*
!*    FUNCTION: UpdateSelection(HWND, POINT, LPRECT, int) - update selection area
!*
!*    PURPOSE: Update selection
!*
!****************************************************************************/

integer*4 function UpdateSelection (hWnd,ptCurrent,lpSelectRect,fFlags)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_UpdateSelection@16':: UpdateSelection
!MS$ ATTRIBUTES REFERENCE :: ptCurrent
!MS$ ATTRIBUTES REFERENCE :: lpSelectRect
use msfwina
use selectin

integer*4 hWnd
type (T_POINTS)  ptCurrent
type (T_RECT)  lpSelectRect
 integer*4 fFlags

integer*4   hDC
integer*2   OldROP

   hDC = GetDC(hWnd)
   select case (IAND(fFlags,SL_TYPE))

      case (SL_BOX)
         OldROP = INT2(SetROP2(hDC, R2_NOTXORPEN))
         i = MoveToEx(hDC, lpSelectRect%left, lpSelectRect%top, NULL_POINT)
         i = LineTo(hDC, lpSelectRect%right, lpSelectRect%top)
         i = LineTo(hDC, lpSelectRect%right, lpSelectRect%bottom)
         i  = LineTo(hDC, lpSelectRect%left, lpSelectRect%bottom)
         i = LineTo(hDC, lpSelectRect%left, lpSelectRect%top)
         i = LineTo(hDC, ptCurrent%x, lpSelectRect%top)
         i = LineTo(hDC, ptCurrent%x, ptCurrent%y)
         i = LineTo(hDC, lpSelectRect%left, ptCurrent%y)
         i = LineTo(hDC, lpSelectRect%left, lpSelectRect%top)
         i = SetROP2(hDC, INT(OldROP))
    
      case (SL_BLOCK)
         i = PatBlt(hDC, lpSelectRect%left, lpSelectRect%bottom, lpSelectRect%right - lpSelectRect%left,&
                              ptCurrent%y - lpSelectRect%bottom,  DSTINVERT)
         i = PatBlt(hDC, lpSelectRect%right,lpSelectRect%top,ptCurrent%x - lpSelectRect%right,ptCurrent%y - lpSelectRect%top,&
                DSTINVERT)
   end select 
   lpSelectRect%right = ptCurrent%x
   lpSelectRect%bottom = ptCurrent%y
   i  = ReleaseDC(hWnd, hDC)
   UpdateSelection = 1
   return 
end 

