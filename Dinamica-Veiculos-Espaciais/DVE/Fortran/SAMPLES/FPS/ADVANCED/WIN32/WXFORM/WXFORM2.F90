!*************************************************************************\
!*
!*  function:  TransformDlgProc()
!*
!*  input parameters:  normal window procedure parameters.
!*
!*  global variables:
!*   showTransform  - TRUE if window is restored, FALSE if minimized.
!*       maintain the value in this routine for other windows' use.
!*   ptoRect - pointer to the track object.
!*   showMouse, hwndMain.
!*
!*  nonstandard messages:
!*   WM_PUTUPFLOATS - fill the entry fields with the contents of an XFORM.
!*************************************************************************/
integer*4 function TransformDlgProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_TransformDlgProc@16' :: TransformDlgProc
use wxfrminc
use msfwina
interface
subroutine doTrackObject(pto, mesg, hwnd, lParam)
!MS$ ATTRIBUTES REFERENCE :: pto
USE wxfrminc
type (TrackObject) pto
integer*4 mesg
integer*4 hwnd
integer*4 lParam
end subroutine doTrackObject
end interface
integer*4 hwnd, message, wParam, lParam
type (T_XFORM)  xform1,pxform 

character*(MAXCHARS) buffer

select case (message) 

!*********************************************************************\
!*  WM_INITDIALOG
!*
!* Fill the entry fields with sensible original values.
!*********************************************************************/
      case (WM_INITDIALOG) 
         i  = SetDlgItemText(hwnd, IDD_13, "0.0"C) 
         i = SetDlgItemText(hwnd, IDD_23, "0.0"C) 
         i = SetDlgItemText(hwnd, IDD_33, "1.0"C) 
         TransformDlgProc = TRUE
         return


!*****************************************************************\
!*  WM_PUTUPFLOATS
!*
!*  lParam - pointer to an XFORM structure.
!*   fill the entry fields with the XFORM values.
!*****************************************************************/
      case (WM_PUTUPFLOATS)

      call CopyMemory (LOC(pxform), lParam, 24)

      write(buffer, 100) pxform%eM11
100   FORMAT (F7.2)       
      i = SetDlgItemText(hwnd, IDD_EM11, buffer)
      write(buffer, 200) pxform%eM12
200   FORMAT (F7.2)       
      i = SetDlgItemText(hwnd, IDD_EM12, buffer)
      write(buffer, 300) pxform%eDx
300   FORMAT (F7.2)       
      i = SetDlgItemText(hwnd, IDD_EDX, buffer) 

      write(buffer, 400) pxform%eM21
400   FORMAT (F7.2)       
      i = SetDlgItemText(hwnd, IDD_EM21, buffer) 

      write(buffer, 500) pxform%eM22
500   FORMAT (F7.2)       
      i = SetDlgItemText(hwnd, IDD_EM22, buffer) 
      write(buffer, 600) pxform%eDy
600   FORMAT (F7.2)       
      i = SetDlgItemText(hwnd, IDD_EDY, buffer) 

      TransformDlgProc = FALSE
      return 



!*****************************************************************\
!*  WM_SIZE
!*
!*  toggle the global variable keeping track of the iconized state
!*   of this window.
!*****************************************************************/
      case (WM_SIZE)
      if (wParam .eq. SIZEICONIC) then
        showTransform = FALSE 
      else 
        showTransform = TRUE 
        i = SendMessage (hwnd, WM_PUTUPFLOATS, 0,LOC(ptoRect%xfmChange)) 
      end if
      TransformDlgProc = FALSE
      return 


      case (WM_COMMAND)
!*****************************************************************
!*  WM_COMMAND,  IDD_SETXFORM
!*
!*  take the values from the entry field, fill them into an XFORM
!*   structure and then send the track object the message to use
!*   these values.  Finally, reformat and repaint the entry fields.
!*****************************************************************
      if (LOWORD(wParam) .eq. IDD_SETXFORM) then
        i = GetDlgItemText(hwnd, IDD_EM11, buffer, MAXCHARS) 
        xform1%eM11 = chartoreal(LOC(buffer) )
        i = GetDlgItemText(hwnd, IDD_EM12, buffer, MAXCHARS) 
        xform1%eM12 = chartoreal(LOC(buffer) )
        i = GetDlgItemText(hwnd, IDD_EDX, buffer, MAXCHARS) 
        xform1%eDx = chartoreal(LOC(buffer) )

        i = GetDlgItemText(hwnd, IDD_EM21, buffer, MAXCHARS) 
        xform1%eM21 =  chartoreal(LOC(buffer) )
        i = GetDlgItemText(hwnd, IDD_EM22, buffer, MAXCHARS) 
        xform1%eM22 =  chartoreal(LOC(buffer) )
        i = GetDlgItemText(hwnd, IDD_EDY, buffer, MAXCHARS) 
        xform1%eDy =  chartoreal(LOC(buffer) )

        ! HACK.  The WM_SIZE here is used to flush the GDI buffer in order
        !  to eliminate a very strange bug whereby DPtoLP() doesn't work.
        if (showMouse .ne. 0) then
          i = SendMessage (hwndMain, WM_SIZE, 0,0) 
        end if


        call doTrackObject (ptoRect, TROB_SETXFORM, hwnd, LOC(xform1)) 
        i = SendMessage (hwnd, WM_PUTUPFLOATS, 0, LOC(xform1) )


!*****************************************************************\
!*  WM_COMMAND,  IDD_IDENTITY
!*
!*  fill a local XFORM structure with the identity matrix.  Now
!*   send the track object the message to use these values.
!*   Finally, reformat and repaint the entry fields.
!*****************************************************************/
        else 
          if (LOWORD(wParam) .eq. IDD_IDENTITY) then
            xform1%eM11 =  1.0 
            xform1%eM22 =  1.0 
            xform1%eDx  =  0.0 
            xform1%eDy  =  0.0 
            xform1%eM12 =  0.0 
            xform1%eM21 =  0.0 

        ! HACK.  The WM_SIZE here is used to flush the GDI buffer in order
        !  to eliminate a very strange bug whereby DPtoLP() doesn't work.
        if (showMouse .ne. 0) then
            i = SendMessage (hwndMain, WM_SIZE, 0,0) 
        end if

        call doTrackObject (ptoRect, TROB_SETXFORM, hwnd, LOC(xform1)) 
        i = SendMessage (hwnd, WM_PUTUPFLOATS, 0, LOC(xform1) )
      end if ! end WM_COMMAND 
      TransformDlgProc = FALSE
      return 
      end if
      end select 
      TransformDlgProc = FALSE
      return 
      end





!*************************************************************************
!*
!*  function:  MouseDlgProc()
!*
!*  input parameters:  normal window procedure parameters.
!*
!*  global variables:
!*   showMouse  -- TRUE if window is restored, FALSE if minimized.
!*       maintain the value in this routine for other windows' use.
!*   ptoRect - pointer to the track object.  Needed for DPtoLP()
!*
!*  nonstandard messages:
!*   WM_PUTUPFLOATS - fill the entry fields with the mouse position.
!*
!*************************************************************************
integer*4 function MouseDlgProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MouseDlgProc@16' :: MouseDlgProc
use MSFWINA
use wxfrminc

integer*4 hwnd, message, wParam, lParam

character*(MAXCHARS) buffer
type (T_POINT) pScreen, pWorld 
!      integer*4 hwndMain 

select case (message) 

!*****************************************************************
!*  WM_PUTUPFLOATS
!*
!*  wParam - contains the hwnd for the main window.
!*  lParam - contains the mouse position in device coordinates.
!*           (c.f. WM_MOUSEMOVE)
!*****************************************************************
      case (WM_PUTUPFLOATS)

      hwndMain = wParam 
      pScreen%x = LOWORD(lParam) 
      pWorld%x = LOWORD(lParam) 
      pScreen%y = HIWORD(lParam) 
      pWorld%y  = HIWORD(lParam) 

      write(buffer, '(I5)') pScreen%x
      i = SetDlgItemText(hwnd, IDD_DEVICEX, buffer )
      write(buffer, '(I5)') pScreen%y
      i = SetDlgItemText(hwnd, IDD_DEVICEY, buffer )

      i = ClientToScreen (hwndMain, pScreen) 
      write(buffer, '(I5)') pScreen%x
      i = SetDlgItemText(hwnd, IDD_SCREENX, buffer) 
      write(buffer, '(I5)') pScreen%y
      i = SetDlgItemText(hwnd, IDD_SCREENY, buffer) 

      i = DPtoLP (ptoRect%hdc, pWorld, 1) 
      write(buffer, '(F7.2)') REAL(pWorld%x)
      i = SetDlgItemText(hwnd, IDD_WORLDX , buffer)
      write(buffer, '(F7.2)') REAL(pWorld%y)
      i = SetDlgItemText(hwnd, IDD_WORLDY , buffer) 

      MouseDlgProc = FALSE 
      return 


!*****************************************************************\
!*  WM_SIZE
!*
!*  toggle the global variable keeping track of the iconized state
!*   of this window.
!*****************************************************************/
      case (WM_SIZE)
      if (wParam .eq. SIZEICONIC) then
        showMouse = FALSE 
      else
        showMouse = TRUE 
      end if
      MouseDlgProc = FALSE 
      return 

end select 
MouseDlgProc = FALSE 
return 
end 
