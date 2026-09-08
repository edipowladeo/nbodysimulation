!**************************************************************************\
!*  track.f90 -- support for direct manipulation of parallelogram object.
!*
!*  function:  doTrackObject()
!*
!*  input parameters:
!*   pto -  pointer to a track object.
!*   msg -  message selecting what action to take.  Values may use s
!
!*           (see case statements below for more information.)
!*   hwnd - Window handle for the window the track object exists within.
!*   lParam - Usually fourth param to window proc. varies based on msg.
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
!*             ----.  LPtoDP() ---.    ---. ClientToScreen() -.
!*             <-----  DPtoLP() <----    <---- ScreenToClient() <--
!*
!*   in addition, the HDC has an offset origin.  Device coordinates for the
!*   mouse (lParam) never take this into account, but it is necessary to
!*   translate them in order to get direct manipulation right.
!*
!**************************************************************************/

recursive subroutine doTrackObject(pto, mesg, hwnd, lParam)
!MS$ ATTRIBUTES REFERENCE :: pto
use msfwina
use trackin
use strbltin

type (TrackObject)  pto
integer*4 mesg
integer*4 hwnd
integer*4 lParam

type (T_POINT)   mouWorld, newmouScreen, mouDevice, orgDevice 

   !if ((pto .eq.== NULL) .AND. (mesg .ne. TROB_NEW))  return NULL 

   select case (mesg) 
   !**********************************************************************\
   !*  TROB_NEW
   !*
   !* Allocate new PTrackObject structure.  Fill in default values
   !*  for the fields of the structure.  Set up the HDC correctly.
   !* return - pointer to the new object.
   !**********************************************************************/
      case  (TROB_NEW)
         pto%hdc = GetDC(hwnd) 
         i = SetGraphicsMode (pto%hdc, GM_ADVANCED) 
         i = SetROP2(pto%hdc, R2_NOT) 
         i = SelectObject (pto%hdc, GetStockObject (NULL_BRUSH)) 
         pto%Mode = TMNONE 
         pto%allowedModes = IOR(TMMOVE,TMSIZEXY)
         i = GetWorldTransform (pto%hdc, pto%xfmChange) 

         ! initialize the size. 
         pto%rect1%top = 0
         pto%rect1%left = 0 
         pto%rect1%bottom = RECTSIZE
         pto%rect1%right = RECTSIZE
         return 
   !**********************************************************************\
   !*  TROB_DELETE
   !*
   !* Complement of TROB_NEW.  Free up the memory allocated for the object.
   !**********************************************************************/
      case  (TROB_DELETE)
         call doTrackObject (pto, TROB_PAINT, hwnd, lParam) 
         i = ReleaseDC (hwnd, pto%hdc) 
         return 
   !**********************************************************************\
   !*  TROB_PAINT
   !*
   !* Paint the object into its hdc.  Called half the time to erase
   !*  the object, and half the time to redraw it.
   !**********************************************************************/
      case (TROB_PAINT)
         i = MoveToEx (pto%hdc, pto%rect1%right, pto%rect1%top, NULL_POINT) 
         i = LineTo (pto%hdc,  pto%rect1%left, pto%rect1%top) 
         i = LineTo (pto%hdc,  pto%rect1%left, pto%rect1%bottom) 

         if (IAND(pto%allowedModes,TMSIZEXY) .ne. 0) then
            i = LineTo (pto%hdc,  pto%rect1%right, pto%rect1%bottom) 
            i = LineTo (pto%hdc,  pto%rect1%right, pto%rect1%top) 
         end if
         if (IAND(pto%allowedModes,TMROTATE) .ne. 0) then
            i = MoveToEx(pto%hdc, pto%rect1%left, pto%rect1%bottom/4,NULL_POINT) 
            i = AngleArc (pto%hdc, pto%rect1%left, pto%rect1%top,         &
                        pto%rect1%bottom/ 4, 270.0, 90.0) 
         end if
         return 
   !**********************************************************************\
   !*  TROB_HITTEST
   !*
   !* Check the point sent in in the lParam to see if it lays within
   !*  the bounds of the objects defining rectangle.
   !* return - pointer to the object iff the point is in rectangle,
   !*  otherwise return NULL.
   !**********************************************************************/
      case (TROB_HITTEST)
         mouWorld%x = LOWORD(lParam) 
         mouWorld%y = HIWORD(lParam) 
         i = DPtoLP (pto%hdc, mouWorld, 1) 
         if (PtInRect (pto%rect1, mouWorld) .neqv. .FALSE.) then
            glob_hittest = 1
         else  
            glob_hittest = 0
         end if
         return 
   !**********************************************************************\
   !*  WM_LBUTTONDOWN &  WM_RBUTTONDOWN
   !*
   !* Capture the mouse, set the tracking mode depending on the mouse
   !*  location in world coordinates, reset the mouse position.
   !*
   !**********************************************************************/
      case (WM_LBUTTONDOWN,WM_RBUTTONDOWN)
         mouWorld%x = LOWORD(lParam) 
         mouWorld%y = HIWORD(lParam) 
         i  = DPtoLP (pto%hdc, mouWorld, 1) 

         ! upper left hand corner. right button is no-op. 
         if ((mouWorld%x <= (pto%rect1%right  / 2)) .and.               &
                        (mouWorld%y <= (pto%rect1%bottom / 2))) then
            if (mesg == WM_RBUTTONDOWN) then
               return 
            end if
            pto%Mode = TMMOVE 
            newmouScreen%x = pto%rect1%left 
            newmouScreen%y = pto%rect1%top 
         ! lower left hand corner 
         else 
            if ((mouWorld%x <= (pto%rect1%right  / 2)) .and.              &
                           (mouWorld%y > (pto%rect1%bottom / 2))) then
               if (mesg == WM_RBUTTONDOWN) then
                  pto%Mode =  TMSHEARY 
               else
                  pto%Mode =  TMSIZEY 
               end if
               newmouScreen%x = pto%rect1%left 
               newmouScreen%y = pto%rect1%bottom 

         ! upper right hand corner
            else 
               if ((mouWorld%x > (pto%rect1%right  / 2)) .and.            &
                        (mouWorld%y <= (pto%rect1%bottom / 2))) then
                  if (mesg == WM_RBUTTONDOWN) then
                     pto%Mode =  TMSHEARX 
                  else
                     pto%Mode =  TMSIZEX 
                  end if
                  newmouScreen%x = pto%rect1%right 
                  newmouScreen%y = pto%rect1%top 
         ! lower right hand corner 
               else 
                  if ((mouWorld%x > (pto%rect1%right  / 2)) .and.          &
                     (mouWorld%y > (pto%rect1%bottom / 2))) then
                     if (mesg == WM_RBUTTONDOWN) then
                        pto%Mode =  TMROTATE
                     else
                        pto%Mode =  TMSIZEXY 
                     end if
                     newmouScreen%x = pto%rect1%right 
                     newmouScreen%y = pto%rect1%bottom 
                  end if
               end   if
            end if
         end if

         if (IAND(pto%Mode,pto%allowedModes) == 0) then
            pto%Mode = TMNONE 
            return 
         end if

         i  = SetCapture(hwnd) 
         i = LPtoDP (pto%hdc, newmouScreen, 1) 
         i = ClientToScreen (hwnd, newmouScreen)
         i = SetCursorPos (newmouScreen%x,newmouScreen%y) 
         i  = GetWorldTransform (pto%hdc, pto%xfmDown)
      return 
   !**********************************************************************\
   !*  WM_MOUSEMOVE
   !*
   !* this is where almost all of the interesting calculation is done.
   !* First clip the mouse location to be in rectClip, then
   !*  call MouseMove() to handle the different tracking modes.
   !**********************************************************************/
      case (WM_MOUSEMOVE)
         if (LOWORD(lParam) < INT2(pto%rectClip%left)) then
            lParam = MAKELONG (INT2(pto%rectClip%left), HIWORD(lParam)) 
         end if

         if (LOWORD(lParam) > INT2(pto%rectClip%right)) then
            lParam = MAKELONG (INT2(pto%rectClip%right), HIWORD(lParam)) 
         end if

         if (HIWORD(lParam) < INT2(pto%rectClip%top)) then
            lParam = MAKELONG (INT2(LOWORD(lParam)), INT2(pto%rectClip%top))
         end if

         if (HIWORD(lParam) > INT2(pto%rectClip%bottom)) then
            lParam = MAKELONG (INT2(LOWORD(lParam)),INT2(pto%rectClip%bottom))
         end if 

   !**************************************************************************\
   !*  function:  MouseMove()
   !*
   !*  input parameters:
   !*   pto -  pointer to a track object.
   !*   msg -  not used.
   !*    hwnd - Window handle for the window the track object exists within.
   !*   lParam - Usually fourth param to window proc. varies based on msg.
   !*
   !*  The tracking behavior which the user observers when moving the mouse
   !*   is based on the current tracking mode of the object.  This is usually
   !*   determined on the mouse down event (c.f. TM*).  First erase the old
   !*   object, then figure out the change to the transform matrix, finally
   !*   change the world transform matrix and redraw the object.
   !*
   !*  Tranform:
   !*    (    eM11        eM12        0   )
   !*    (    eM21        eM22        0   )
   !*    (    eDx         eDy         1   )
   !*
   !*   xDevice = (xWorld * eM11) + (yWorld * eM21) + eDx
   !*   yDevice = (xWorld * eM12) + (yWorld * eM22) + eDy
   !*
   !*   In this routine the Device (mouse location) and World (rectangle corner)
   !*   points are known.  Therefore, the two equations above are solved for
   !*   the desired matrix entry value (e.g. eM11, 1M12, ... eDy).  The tracking
   !*   mode determines which one of these entries may be changed.  E.g. scaling
   !*   in X modifies eM11 while shearing in X modifies eM12.  So rather than
   !*   using the world transform to map from world to device points, we are
   !*   back-computing the proper contents of the world transform.
   !*
   !**************************************************************************/
         call doTrackObject(pto, TROB_PAINT, hwnd, lParam) 
         mouDevice%x = LOWORD(lParam) 
         mouWorld%x = LOWORD(lParam) 
         mouDevice%y = HIWORD(lParam) 
         mouWorld%y = HIWORD(lParam) 

         i = SetWorldTransform(pto%hdc, pto%xfmDown) 
         i = DPtoLP (pto%hdc, mouWorld, 1) 

         ! offset the mouse device point for the viewport's origin. 
         i = GetViewportOrgEx (pto%hdc, orgDevice) 
         mouDevice%x =mouDevice%x - orgDevice%x 
         mouDevice%y =mouDevice%y - orgDevice%y 
         i = GetWorldTransform(pto%hdc, pto%xfmChange) 
         select case (pto%Mode) 
   !*******************************************************\
   !*    (     1         xShear       0   )
   !*    (     0           1          0   )
   !*    (     0           0          1   )
   !*
   !* xWorld = rect%left == 0 
   !*******************************************************/
            case (TMSHEARX)
               pto%xfmChange%eM12 = mouDevice%y 
               pto%xfmChange%eM12 =pto%xfmChange%eM12 -pto%xfmChange%eDy 
               pto%xfmChange%eM12 =pto%xfmChange%eM12 /REAL( pto%rect1%right)  
               i = SetWorldTransform (pto%hdc, pto%xfmChange) 
   !*******************************************************\
   !*    (     1           0          0   )
   !*    (   yShear        1          0   )
   !*    (     0           0          1   )
   !*
   !* yWorld = rect%top == 0 
   !*******************************************************/
            case (TMSHEARY)
               pto%xfmChange%eM21 = REAL(mouDevice%x)
               pto%xfmChange%eM21 =pto%xfmChange%eM21 -pto%xfmChange%eDx 
               pto%xfmChange%eM21 =pto%xfmChange%eM21 /REAL( pto%rect1%bottom ) 
               i = SetWorldTransform (pto%hdc, pto%xfmChange) 
   !*******************************************************\
   !*    (   cos(a)      -sin(a)      0   )
   !*    (   sin(a)       cos(a)      0   )
   !*    (     0           0          1   )
   !*
   !* a == rotation angle%  Since mouse in in lower right,
   !*  we need to shift this back 45 degrees (assuming that
   !*  straight down is 0 degrees).  Thus we actually compute
   !*  cos(a) = cos(b - 45) = cos(b)sin(45) + cos(45)sin(45)
   !*  where b is angle from the origin to the mouse (x,y)
   !*  cos(45) = sin(45) ~= 0.707107
   !*  cos(b) = y/r    sin(b) = x/r
   !*
   !*******************************************************/
         case (TMROTATE)
            ! translate back to the origin. 
            pto%xfmChange%eDx = 0.0 
            pto%xfmChange%eDy = 0.0 
            i = SetWorldTransform (pto%hdc, pto%xfmChange) 

            ! rotate about the origin. */
            r = REAL((mouWorld%x * mouWorld%x) +                            &
                     (mouWorld%y * mouWorld%y)) ** 0.5

            pto%xfmChange%eM11 = REAL(mouWorld%y) / r 
            pto%xfmChange%eM11 = pto%xfmChange%eM11 + (REAL(mouWorld%x) / r)
            pto%xfmChange%eM11 = pto%xfmChange%eM11 * 0.707107 
            pto%xfmChange%eM22 = pto%xfmChange%eM11 

            pto%xfmChange%eM12 = REAL(mouWorld%y) / r 
            pto%xfmChange%eM12 = pto%xfmChange%eM12 -(REAL(mouWorld%x) / r) 
            pto%xfmChange%eM12 = pto%xfmChange%eM12 * 0.707107 
            pto%xfmChange%eM21 = -pto%xfmChange%eM12 

            pto%xfmChange%eDx = 0.0 
            pto%xfmChange%eDy = 0.0 

            i = ModifyWorldTransform (pto%hdc, pto%xfmChange,          &
                        MWT_RIGHTMULTIPLY) 

            ! translate back to the original offset. */
            pto%xfmChange%eM11 = 1.0 
            pto%xfmChange%eM22 = 1.0 
            pto%xfmChange%eM12 = 0.0 
            pto%xfmChange%eM21 = 0.0 

            pto%xfmChange%eDx = pto%xfmDown%eDx 
            pto%xfmChange%eDy = pto%xfmDown%eDy 
            i = ModifyWorldTransform (pto%hdc, pto%xfmChange,          &
                     MWT_RIGHTMULTIPLY) 
            i = GetWorldTransform (pto%hdc, pto%xfmChange) 
   !*******************************************************\
   !*    (  Size X         0          0   )
   !*    (     0        Size Y        0   )
   !*    (     0           0          1   )
   !*
   !*******************************************************/
         case (TMSIZEXY)
            pto%xfmChange%eM11 = REAL(mouDevice%x) 
            pto%xfmChange%eM11 =pto%xfmChange%eM11 -pto%xfmChange%eDx 
            pto%xfmChange%eM11 =pto%xfmChange%eM11 -(REAL(pto%rect1%bottom)*&
                                 pto%xfmChange%eM21) 
            pto%xfmChange%eM11 =pto%xfmChange%eM11 /REAL(pto%rect1%right )
            if (abs(pto%xfmChange%eM11) < EPSILON) then ! HACK.  system bug ?
               pto%xfmChange%eM11 = EPSILON 
            end if
            pto%xfmChange%eM22 = REAL(mouDevice%y) 
            pto%xfmChange%eM22 =pto%xfmChange%eM22 -pto%xfmChange%eDy 
            pto%xfmChange%eM22 =pto%xfmChange%eM22 -(REAL(pto%rect1%right)* &
                                             pto%xfmChange%eM12) 
            pto%xfmChange%eM22 =pto%xfmChange%eM22 /REAL(pto%rect1%bottom )
            if (abs(pto%xfmChange%eM22) < EPSILON) then ! HACK.  system bug ?
               pto%xfmChange%eM22 = EPSILON 
            end if
            i = SetWorldTransform (pto%hdc, pto%xfmChange) 

   !*******************************************************\
   !*    (  Size X         0          0   )
   !*    (     0           1          0   )
   !*    (     0           0          1   )
   !*
   !* yWorld = rect%top == 0 
   !*******************************************************/
         case (TMSIZEX)
            pto%xfmChange%eM11 = REAL(mouDevice%x) 
            pto%xfmChange%eM11 =pto%xfmChange%eM11 -pto%xfmChange%eDx 
            pto%xfmChange%eM11 =pto%xfmChange%eM11 /REAL(pto%rect1%right ) 
            if (abs(pto%xfmChange%eM11) < EPSILON) then ! HACK.  system bug ?
               pto%xfmChange%eM11 = EPSILON 
            end if
            i = SetWorldTransform (pto%hdc, pto%xfmChange) 
   !*******************************************************\
   !*    (     1           0          0   )
   !*    (     0        Size Y        0   )
   !*    (     0           0          1   )
   !*
   !* xWorld = rect%left == 0 
   !*******************************************************/
         case (TMSIZEY)
            pto%xfmChange%eM22 = REAL(mouDevice%y) 
            pto%xfmChange%eM22 =pto%xfmChange%eM22 -pto%xfmChange%eDy 
            pto%xfmChange%eM22 =pto%xfmChange%eM22 /REAL(pto%rect1%bottom)  
            if (abs(pto%xfmChange%eM22) < EPSILON) then ! HACK.  system bug ?
               pto%xfmChange%eM22 = EPSILON 
            end if
            i =  SetWorldTransform (pto%hdc, pto%xfmChange) 
   !*******************************************************\
   !*    (     1           0          0   )
   !*    (     0           1          0   )
   !*    (   Move x      Move y       1   )
   !*
   !* xWorld = rect%left == 0 
   !* yWorld = rect%top == 0 
   !*******************************************************/
         case (TMMOVE)
            pto%xfmChange%eDx = REAL(mouDevice%x ) 
            pto%xfmChange%eDy = REAL(mouDevice%y ) 
            i  = SetWorldTransform (pto%hdc, pto%xfmChange) 
      end select ! end switch 
      call doTrackObject(pto, TROB_PAINT, hwnd, lParam) 
      return 

   !**********************************************************************\
   !*  WM_RBUTTONUP & WM_LBUTTONUP
   !*
   !* simply release the mouse capture, and set the mode to TMNONE%
   !**********************************************************************/
      case (WM_RBUTTONUP,WM_LBUTTONUP)
         if (pto%Mode .ne. 0) then
            i = ReleaseCapture() 
            pto%Mode = TMNONE 
         end if
         return 
   end select 
end 






