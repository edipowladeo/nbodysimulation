!************************************************************************
!*  function:  CenterOrigin()
!*
!*  input parameters:
!*   hwnd - window with client we want the center of.
!*   hdc - device context which we set the Viewport origin of.
!*
!*************************************************************************
subroutine CenterOrigin (hwnd, hdc)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: hdc
use msfwina
use wxfrminc
integer*4 hwnd, hdc

type(T_RECT)  rect1 
type(T_POINT) center 

i = GetClientRect (hwnd, rect1)
center%x = rect1%right / 2 
center%y = rect1%bottom /2 

i = SetViewportOrgEx (hdc, center%x, center%y, NULL_POINT) 
return 
end 

!*************************************************************************\
!*
!*  function:  doTrackObject()
!*
!*  input parameters:
!*   pto -  pointer to a track object.
!*   mesg -  message selecting what action to take.  Values may include WM_*'s
!*           (see case statements below for more information.)
!*   hwnd - Window handle for the window the track object exists within.
!*   lParam - Usually fourth param to window proc. varies based on mesg.
!*
!*  global variables:  none.
!*
!*  coordinate spaces:  There are three coordinate spaces of interest here,
!*   and this routine is frequently switching between them...
!*
!*           WORLD                   DEVICE                  SCREEN
!*
!*      object coordinates       input mouse pos       used w/ SetCursorPos()
!*         (pto.rect)          (lParam for WM_*)
!*
!*             ----->  LPtoDP() ---->    ----> ClientToScreen() -->
!*             <-----  DPtoLP() <----    <---- ScreenToClient() <--
!*
!*   in addition, the HDC has an offset origin.  Device coordinates for the
!*   mouse (lParam) never take this into account, but it is necessary to
!*   translate them in order to get direct manipulation right.
!*
!**************************************************************************
subroutine doTrackObject(pto, mesg, hwnd, lParam)
!MS$ ATTRIBUTES REFERENCE :: pto
use MSFWINA
use wxfrminc


interface
subroutine CenterOrigin (hwnd, hdc)
!MS$ATTRIBUTES VALUE :: hwnd
!MS$ATTRIBUTES VALUE :: hdc
integer(4)      hwnd, hdc
end subroutine
end interface

interface
subroutine doTrackObjectDum (tpto, mesg, hwnd, lParam)
!MS$ ATTRIBUTES REFERENCE :: tpto
use wxfrminc
type (TRACKOBJECT) tpto
integer*4 mesg ,hwnd, lParam
end subroutine
end interface

type (TrackObject) pto
integer*4 mesg
integer*4 hwnd
integer*4 lParam

type(T_POINT)  mouWorld, newmouScreen, mouDevice, orgDevice 
type(T_RECT)  rect1 
type (TrackObject) tpto
integer*4 tmesg
integer*4 thwnd
integer*4 tlParam


!      if ((pto .eq. NULL) && (mesg != TROB_NEW))  return NULL 

call CopyMemory (LOC(tpto), LOC(pto), 76)
tmesg = mesg
thwnd = hwnd
tlParam = lParam

select case (mesg) 


!*********************************************************************\
!*  TROB_NEW
!*
!* Allocate new PTrackObject structure.  Fill in default values
!*  for the fields of the structure.  Set up the HDC correctly.
!* return - pointer to the new object.
!*********************************************************************/
      case  (TROB_NEW)
                     
        ! initialize the HDC and other fields. */
        pto%hdc = GetDC(hwnd) 
        i = SetGraphicsMode (pto%hdc, GM_ADVANCED) 
        i = SetROP2(pto%hdc, R2_NOT) 
        i = SelectObject (pto%hdc, GetStockObject (NULL_BRUSH)) 
        i = SelectObject(pto%hdc, CreatePen (PS_SOLID, 2, #01000009)) 
        pto%Mode = TMNONE 
        from_where = TROB_NEW
        !goto 1000
        call doTrackObjectDum (pto, TROB_CENTER, hwnd, lParam) 

!1005    
        i = GetWorldTransform (pto%hdc, pto%xfmChange)

        ! initialize the size. 
        pto%rect1%top = 0
        pto%rect1%left = 0 
        pto%rect1%bottom = TICKSPACE*5 
        pto%rect1%right = TICKSPACE*5 
        return 
      
!*********************************************************************\
!*  TROB_DELETE
!*
!* Delete the pen that we created, release the DC,
!*  free up the memory allocated for the object.
!*********************************************************************/
      case  (TROB_DELETE)

        i = DeleteObject (SelectObject (pto%hdc, GetStockObject         &
     &   (BLACK_PEN))) 
        from_where = TROB_DELETE
        !goto 2000
        call doTrackObjectDum (pto, TROB_PAINT, hwnd, lParam) 
!2005    
        i = ReleaseDC (hwnd, pto%hdc) 
        return 

!*********************************************************************\
!*  TROB_CENTER
!*
!* Called in order to reset the view port origin in the track objects
!*  hdc whenever the client window changes size.  This hdc is thus kept
!*  synchronized with the hdc that the axes are painted into.
!*********************************************************************/
      case (TROB_CENTER)
!1000    
        call CenterOrigin (hwnd, pto%hdc) 
        !if (from_where .eq. TROB_NEW) then
        !  goto 1005
        !  from_where = 0
        !else
        !  return 
        !end if
    
!*********************************************************************\
!*  TROB_PAINT
!*
!* Paint the object into its hdc.  Called half the time to erase
!*  the object, and half the time to redraw it.
!*********************************************************************/
      case (TROB_PAINT)
!2000    
        i = Rectangle (pto%hdc, pto%rect1%left+1, pto%rect1%top+1,      &
     &                        pto%rect1%left+INC, pto%rect1%top+INC) 
        i = GetLastError();
        i = Rectangle (pto%hdc, pto%rect1%left, pto%rect1%top,          &
     &                        pto%rect1%right, pto%rect1%bottom) 
        i = GetLastError(); 
        !select case (from_where)
        !  case (0)
        !    return 
        !  case (TROB_SETXFORM)
        !    from_where = 0
        !    goto 2100
        !  case (TROB_DELETE)
        !    from_where = 0
        !    goto 2005
        !  case (WM_MOUSEMOVE)
        !    from_where = 0
        !    goto 2200
        !end select

!*********************************************************************\
!*  TROB_SETXFORM
!*
!* lParam - pointer to the new transform.
!*  set the new transform into the HDC, then update xfmChange.
!*********************************************************************/
      case (TROB_SETXFORM)
        from_where = TROB_SETXFORM
        !goto 2000
        call doTrackObjectDum (pto, TROB_PAINT, hwnd, lParam) 
!2100    
        i = SetWorldTransform(pto%hdc, lParam) 
        i = GetWorldTransform(pto%hdc, pto%xfmChange)
        !goto 2000
        call doTrackObjectDum (pto, TROB_PAINT, hwnd, lParam) 
        return 

!*********************************************************************\
!*  TROB_HITTEST
!*
!* Check the point sent in in the lParam to see if it lays within
!*  the bounds of the objects defining rectangle.
!* return - pointer to the object iff the point is in rectangle,
!*  otherwise return NULL.
!*********************************************************************/
      case (TROB_HITTEST)
        mouWorld%x = LOWORD(lParam) 
        mouWorld%y = HIWORD(lParam) 

        i = DPtoLP (pto%hdc, mouWorld, 1) 

        if (PtInRect (pto%rect1, mouWorld) .neqv. .FALSE.)  then 
          glob_hittest = 1
          return 
        else  
          glob_hittest = 0
        end if
        return 

!*********************************************************************\
!*  WM_LBUTTONDOWN &  WM_RBUTTONDOWN
!*
!* Capture the mouse, set the tracking mode depending on the mouse
!*  location in world coordinates, reset the mouse position.
!*
!*********************************************************************/
      case (WM_LBUTTONDOWN,WM_RBUTTONDOWN)
      mouWorld%x = LOWORD(lParam) 
      mouWorld%y = HIWORD(lParam) 
      i = DPtoLP (pto%hdc, mouWorld, 1) 

      ! upper left hand corner. right button is no-op. 
      if ((mouWorld%x .le. (pto%rect1%right  / 2)) .and.                &
     &     (mouWorld%y .le. (pto%rect1%bottom / 2))) then
          if (mesg .eq. WM_RBUTTONDOWN) then
            return 
          end if
          pto%Mode = TMMOVE 
          newmouScreen%x = pto%rect1%left 
          newmouScreen%y = pto%rect1%top 

      ! lower left hand corner 
      else 
        if ((mouWorld%x .le. (pto%rect1%right  / 2)) .and.              &
     &     (mouWorld%y .gt. (pto%rect1%bottom / 2))) then
            if (mesg .eq. WM_RBUTTONDOWN) then
              pto%Mode =  TMSHEARY 
            else
              pto%Mode =  TMSIZEY 
            end if
          newmouScreen%x = pto%rect1%left 
          newmouScreen%y = pto%rect1%bottom 

      ! upper right hand corner 
        else 
          if ((mouWorld%x .gt. (pto%rect1%right  / 2)) .and.            &
     &     (mouWorld%y .le. (pto%rect1%bottom / 2))) then
            if (mesg .eq. WM_RBUTTONDOWN) then
              pto%Mode =  TMSHEARX 
            else
              pto%Mode =  TMSIZEX 
            end if

          newmouScreen%x = pto%rect1%right 
          newmouScreen%y = pto%rect1%top 

      ! lower right hand corner */
          else 
            if ((mouWorld%x .gt. (pto%rect1%right  / 2)) .and.          &
     &       (mouWorld%y .gt. (pto%rect1%bottom / 2))) then
            if (mesg .eq. WM_RBUTTONDOWN) then
              pto%Mode =  TMROTATE
            else
              pto%Mode =  TMSIZEXY 
            end if
            newmouScreen%x = pto%rect1%right 
            newmouScreen%y = pto%rect1%bottom 
            end if
          end if
        end if
      end if

      i = SetCapture(hwnd) 
      i = LPtoDP (pto%hdc, newmouScreen, 1) 
      i = ClientToScreen (hwnd, newmouScreen)
      i = SetCursorPos (newmouScreen%x,newmouScreen%y) 

      i = GetWorldTransform (pto%hdc, pto%xfmDown) 
      return 

!*********************************************************************\
!*  WM_MOUSEMOVE
!*
!* this is where almost all of the interesting calculation is done.
!*  First clip the mouse location to be in client rectangle, then
!*  call MouseMove() to handle the different tracking modes.
!*********************************************************************/
      case (WM_MOUSEMOVE)

      i = GetClientRect (hwnd, rect1) 

      if (LOWORD(lParam) .lt. INT2(rect1%left)) then
        lParam = MAKELONG (INT2(rect1%left), HIWORD(lParam)) 
      end if

      if (LOWORD(lParam) .gt. INT2(rect1%right)) then
        lParam = MAKELONG (INT2(rect1%right), HIWORD(lParam)) 
      end if

      if (HIWORD(lParam) .lt. INT2(rect1%top)) then
        lParam = MAKELONG (LOWORD(lParam), INT2(rect1%top))
      end if

      if (HIWORD(lParam) .gt. INT2(rect1%bottom)) then
        lParam = MAKELONG (LOWORD(lParam),INT2(rect1%bottom))
      end if 

      from_where = WM_MOUSEMOVE
      !goto 2000
      call doTrackObjectDum (pto, TROB_PAINT, hwnd, lParam) 
2200  mouDevice%x = LOWORD(lParam) 
      mouWorld%x = LOWORD(lParam) 
      mouDevice%y = HIWORD(lParam) 
      mouWorld%y = HIWORD(lParam) 

      i = SetWorldTransform(pto%hdc, pto%xfmDown)
      i = DPtoLP (pto%hdc, mouWorld, 1) 

    ! offset the mouse device point for the viewport's origin. */
      i = GetViewportOrgEx (pto%hdc, orgDevice)
      mouDevice%x =mouDevice%x - orgDevice%x 
      mouDevice%y =mouDevice%y - orgDevice%y 

      i = GetWorldTransform(pto%hdc, pto%xfmChange) 

      select case (pto%Mode) 
!******************************************************\
!*    (     1         xShear       0   )
!*    (     0           1          0   )
!*    (     0           0          1   )
!*
!* xWorld = rect.left == 0 
!******************************************************/
      case (TMSHEARX)
        pto%xfmChange%eM12 = REAL(mouDevice%y)
        pto%xfmChange%eM12 =pto%xfmChange%eM12 - pto%xfmChange%eDy 
        pto%xfmChange%eM12 =pto%xfmChange%eM12 / pto%rect1%right  
        i = SetWorldTransform (pto%hdc, pto%xfmChange) 


!*******************************************************
!*    (     1           0          0   )
!*    (   yShear        1          0   )
!*    (     0           0          1   )
!*
!* yWorld = rect.top == 0 
!*******************************************************
      case (TMSHEARY)
        pto%xfmChange%eM21 = REAL(mouDevice%x) 
        pto%xfmChange%eM21 =pto%xfmChange%eM21 - pto%xfmChange%eDx 
        pto%xfmChange%eM21 =pto%xfmChange%eM21 / REAL(pto%rect1%bottom)  
        i = SetWorldTransform (pto%hdc, pto%xfmChange)


!******************************************************\
!*    (   cos(a)      -sin(a)      0   )
!*    (   sin(a)       cos(a)      0   )
!*    (     0           0          1   )
!*
!* a == rotation angle.  Since mouse in in lower right,
!*  we need to shift this back 45 degrees (assuming that
!*  straight down is 0 degrees).  Thus we actually compute
!*  cos(a) = cos(b - 45) = cos(b)sin(45) + cos(45)sin(45)
!*  where b is angle from the origin to the mouse (x,y)
!*  cos(45) = sin(45) ~= 0.707107
!*  cos(b) = y/r    sin(b) = x/r
!*
!*******************************************************/
      case (TMROTATE)

        ! translate back to the origin. */
        pto%xfmChange%eDx = 0.0 
        pto%xfmChange%eDy = 0.0 
        i = SetWorldTransform (pto%hdc, pto%xfmChange)

        ! rotate about the origin. */
        r = ( REAL(mouWorld%x * mouWorld%x) +                           &
     &                     REAL(mouWorld%y * mouWorld%y)) ** 0.5

        pto%xfmChange%eM11 = REAL(mouWorld%y) / r 
        pto%xfmChange%eM11 =pto%xfmChange%eM11 +( REAL(mouWorld%x) / r)
        pto%xfmChange%eM11 =pto%xfmChange%eM11 * 0.707107 
        pto%xfmChange%eM22 = pto%xfmChange%eM11 

        pto%xfmChange%eM12 = REAL(mouWorld%y) / r 
        pto%xfmChange%eM12 =pto%xfmChange%eM12 -( REAL(mouWorld%x) / r) 
        pto%xfmChange%eM12 =pto%xfmChange%eM12 * 0.707107 
        pto%xfmChange%eM21 = -pto%xfmChange%eM12 

        pto%xfmChange%eDx = 0.0 
        pto%xfmChange%eDy = 0.0 

        i = ModifyWorldTransform (pto%hdc, pto%xfmChange,          &
     &   MWT_RIGHTMULTIPLY) 

        ! translate back to the original offset. */
        pto%xfmChange%eM11 = 1.0 
        pto%xfmChange%eM22 = 1.0 
        pto%xfmChange%eM12 = 0.0 
        pto%xfmChange%eM21 = 0.0 

        pto%xfmChange%eDx = pto%xfmDown%eDx 
        pto%xfmChange%eDy = pto%xfmDown%eDy 
        i = ModifyWorldTransform (pto%hdc, pto%xfmChange,          &
     &   MWT_RIGHTMULTIPLY) 
        i = GetWorldTransform (pto%hdc, pto%xfmChange)


!******************************************************\
!*    (  Size X         0          0   )
!*    (     0        Size Y        0   )
!*    (     0           0          1   )
!*
!******************************************************/
      case (TMSIZEXY)
        pto%xfmChange%eM11 = REAL(mouDevice%x) 
        pto%xfmChange%eM11 =pto%xfmChange%eM11 -pto%xfmChange%eDx 
        pto%xfmChange%eM11 =pto%xfmChange%eM11 -(REAL(pto%rect1%bottom) &
     &   * pto%xfmChange%eM21) 
        pto%xfmChange%eM11 =pto%xfmChange%eM11 /REAL(pto%rect1%right)  

        pto%xfmChange%eM22 = REAL(mouDevice%y) 
        pto%xfmChange%eM22 =pto%xfmChange%eM22 -pto%xfmChange%eDy 
        pto%xfmChange%eM22 =pto%xfmChange%eM22 -(REAL(pto%rect1%right)  &
     &   * pto%xfmChange%eM12) 
        pto%xfmChange%eM22 =pto%xfmChange%eM22 /REAL(pto%rect1%bottom)  
        i = SetWorldTransform (pto%hdc, pto%xfmChange) 


!******************************************************\
!*    (  Size X         0          0   )
!*    (     0           1          0   )
!*    (     0           0          1   )
!*
!* yWorld = rect.top == 0 
!******************************************************/
      case (TMSIZEX)
        pto%xfmChange%eM11 = REAL(mouDevice%x) 
        pto%xfmChange%eM11 =pto%xfmChange%eM11 -pto%xfmChange%eDx 
        pto%xfmChange%eM11 =pto%xfmChange%eM11 /REAL(pto%rect1%right)  
        i = SetWorldTransform (pto%hdc, pto%xfmChange) 

!******************************************************\
!*    (     1           0          0   )
!*    (     0        Size Y        0   )
!*    (     0           0          1   )
!*
!* xWorld = rect.left == 0 
!******************************************************/
      case (TMSIZEY)
        pto%xfmChange%eM22 = REAL(mouDevice%y) 
        pto%xfmChange%eM22 =pto%xfmChange%eM22 -pto%xfmChange%eDy 
        pto%xfmChange%eM22 =pto%xfmChange%eM22 /REAL(pto%rect1%bottom)  
        i = SetWorldTransform (pto%hdc, pto%xfmChange) 


!******************************************************\
!*    (     1           0          0   )
!*    (     0           1          0   )
!*    (   Move x      Move y       1   )
!*
!* xWorld = rect.left == 0 
!* yWorld = rect.top == 0 
!******************************************************/
      case (TMMOVE)
        pto%xfmChange%eDx = REAL(mouDevice%x)  
        pto%xfmChange%eDy = REAL(mouDevice%y)  
        i = SetWorldTransform (pto%hdc, pto%xfmChange) 
      end select 
      !goto 2000
      call doTrackObjectDum (pto, TROB_PAINT, hwnd, lParam) 

      return 



!*********************************************************************\
!*  WM_RBUTTONUP & WM_LBUTTONUP
!*
!* simply release the mouse capture, and set the mode to TMNONE.
!*********************************************************************/
      case (WM_RBUTTONUP,WM_LBUTTONUP)

       if (pto%Mode .ne. 0) then
         i = ReleaseCapture() 
         pto%Mode = TMNONE 
       end if
       return 

      end select  ! end switch(mesg) 
end !of subroutine doTrackObject

subroutine doTrackObjectDum (pto, mesg, hwnd, lParam)
!MS$ ATTRIBUTES REFERENCE :: pto
use msfwina
use wxfrminc
type (TrackObject) pto
integer*4 mesg
integer*4 hwnd
integer*4 lParam
    
    call doTrackObject (pto, mesg, hwnd, lParam)

end  ! end of doTrackObjectDum



