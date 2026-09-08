module wxfrminc
use msfwina

!* dialog id's for the Transform dialog *
integer*4, parameter, public :: IDD_EM11         = 101
integer*4, parameter, public :: IDD_EM12         = 102
integer*4, parameter, public :: IDD_EDX          = 103
integer*4, parameter, public :: IDD_EM21         = 104
integer*4, parameter, public :: IDD_EM22         = 105
integer*4, parameter, public :: IDD_EDY          = 106
integer*4, parameter, public :: IDD_13           = 107
integer*4, parameter, public :: IDD_23           = 108
integer*4, parameter, public :: IDD_33           = 109
integer*4, parameter, public :: IDD_SETXFORM     = 110
integer*4, parameter, public :: IDD_IDENTITY     = 111


!* dialog id's for the Mouse dialog *
integer*4, parameter, public :: IDD_SCREENX      = 201
integer*4, parameter, public :: IDD_SCREENY      = 202
integer*4, parameter, public :: IDD_DEVICEX      = 203
integer*4, parameter, public :: IDD_DEVICEY      = 204
integer*4, parameter, public :: IDD_WORLDX       = 205
integer*4, parameter, public :: IDD_WORLDY       = 206


!* special messages for doTrackobject(). *
integer*4, parameter, public :: TROB_NEW          = WM_USER+1
integer*4, parameter, public :: TROB_DELETE       = WM_USER+2
integer*4, parameter, public :: TROB_PAINT        = WM_USER+3
integer*4, parameter, public :: TROB_HITTEST      = WM_USER+5
integer*4, parameter, public :: TROB_CENTER       = WM_USER+6
integer*4, parameter, public :: TROB_SETXFORM     = WM_USER+7

!* special user message for two of the dialogs *
integer*4, parameter, public :: WM_PUTUPFLOATS   = WM_USER+1


!* Different "Track modes." *
integer*4, parameter, public :: TMNONE     = #0000
integer*4, parameter, public :: TMMOVE     = #0001
integer*4, parameter, public :: TMSIZEX    = #0002
integer*4, parameter, public :: TMSIZEY    = #0004
integer*4, parameter, public :: TMSIZEXY   = #0006
integer*4, parameter, public :: TMSHEARX   = #0010
integer*4, parameter, public :: TMSHEARY   = #0020
integer*4, parameter, public :: TMROTATE   = #0008


!* misc. defines for drawing and formating *
integer*4, parameter, public :: TICKSPACE  = 20
integer*4, parameter, public :: MAXCHARS   = 32
integer*4, parameter, public :: INC    = 5
character*6, parameter, public :: FORMATFLOAT     = "%1.2f"C
integer*4, parameter, public :: GRIDCOLOR  = #01000006



!* structure for the track object.  c.f. ptoRect *
type TrackObject
  type(T_RECT)    rect1 
  type(T_XFORM)   xfmChange    ! World coordinate transform      */
  type(T_XFORM)   xfmDown      ! transform when the mouse down happens. */
  integer*4    hdc 
  integer*4    Mode         ! TMROTATE, TMSIZEXY, TMMOVE, ... */
  integer*4 Next 
end type




!! Global variables. 
integer*4 showTransform, showMouse, showHelp 
integer*4 hwndTransform, hwndMouse, hwndHelp 
type(TrackObject)       ptoRect
integer*4 hInst 
integer*4 hwndMain, glob_hittest, from_where

end module wxfrminc

