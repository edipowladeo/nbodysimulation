module trackin
use msfwina

!* special messages for doTrackobject(). */
integer*4 ,parameter, public :: TROB_NEW        = WM_USER+1
integer*4 ,parameter, public :: TROB_DELETE     = WM_USER+2
integer*4 ,parameter, public :: TROB_PAINT      = WM_USER+3
integer*4 ,parameter, public :: TROB_HITTEST    = WM_USER+5


!* Different "Track modes." */
integer*4 ,parameter, public :: TMNONE   = #0000
integer*4 ,parameter, public :: TMMOVE   = #0001
integer*4 ,parameter, public :: TMSIZEX  = #0002
integer*4 ,parameter, public :: TMSIZEY  = #0004
integer*4 ,parameter, public :: TMSIZEXY = #0006
integer*4 ,parameter, public :: TMSHEARX = #0010
integer*4 ,parameter, public :: TMSHEARY = #0020
integer*4 ,parameter, public :: TMROTATE = #0008
integer*4 ,parameter, public :: TMALL    = #00ff

real*4    ,parameter, public :: EPSILON     = 0.001
integer*4 ,parameter, public :: RECTSIZE    = 60
integer*4 ,parameter, public :: TICKSPACE   = 20


!* structure for the track object.  */
type TrackObject
  type (T_RECT)     rect1
  type (T_XFORM)    xfmChange    ! World coordinate transform      */
  type (T_XFORM)    xfmDown      ! transform when the mouse down happens. */
  integer*4         hdc 
  integer*4         Mode         ! TMROTATE, TMSIZEXY, TMMOVE, ... */
  integer*4         allowedModes 
  type (T_RECT)     rectClip 
  integer*4         Next 
end type

end 
