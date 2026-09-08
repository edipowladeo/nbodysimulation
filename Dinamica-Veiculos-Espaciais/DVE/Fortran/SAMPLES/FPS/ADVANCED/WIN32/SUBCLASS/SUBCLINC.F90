module subclinc
use msfwina
integer*2, parameter, public :: IDM_BUTTON        = 101 
integer*2, parameter, public :: IDM_EDIT          = 102 
integer*2, parameter, public :: IDM_LIST          = 103 
integer*2, parameter, public :: IDM_TEST          = 110 


integer*4, parameter, public :: WM_SC_CREATE  = WM_USER+1 



!* Different "Tracking actions." */
integer*4, parameter, public :: ACTIONNONE    = #0000 
integer*4, parameter, public :: ACTIONMOVE    = #0001 
integer*4, parameter, public :: ACTIONSIZEX   = #0002 
integer*4, parameter, public :: ACTIONSIZEY   = #0004 
integer*4, parameter, public :: ACTIONSIZEXY  = #0006 


!* misc. defines for drawing and formating */
integer*4, parameter, public :: INC   = 5 
real*4   , parameter, public :: EPSILON  = 0.0001 
integer*4, parameter, public :: MAXCHARS = 32 
integer*4, parameter, public :: MINSIZE = 5 


!* Global variables. */
integer*4   hwndMain
integer*4   hInst
integer*4   fTestMode


!* structure pointed at by the extra user bytes. */
type ExtraBytes
    integer*4   pfnOldProc
    type(T_RECT)  rects
    integer*4   Action   !/* ACTIONSIZEXY, ACTIONMOVE, ... */
end type

integer*4, parameter, public :: SIZEOFEXTRABYTES = 24

end module subclinc
      
