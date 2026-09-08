module menuinc
use msfwinty
!/* Defines for top-level menu positions */
integer*4, parameter, public :: IDFILE_POS     = 0 
integer*4, parameter, public :: IDCOLORS_POS   = 1 
integer*4, parameter, public :: IDSTATES_POS   = 2 
integer*4, parameter, public :: IDHELP_POS     = 3 

integer*4, parameter, public :: MEASUREITEMWIDTH  = 40 
integer*4, parameter, public :: MEASUREITEMHEIGHT = 40 

!/* Dialog ID for the About.. dialog */
integer*4, parameter, public :: ID_ABOUT = 100 

!/* Defines for menu items */
integer*4, parameter, public :: IDM_EXIT   = 202 
integer*4, parameter, public :: IDM_ABOUT  = 203 

!/* Colors menu IDs */
integer*4, parameter, public :: IDM_COLOROWNERDR = 500 
integer*4, parameter, public :: IDM_BLACK        = 501 
integer*4, parameter, public :: IDM_BLUE         = 502 
integer*4, parameter, public :: IDM_RED          = 503 
integer*4, parameter, public :: IDM_GREEN        = 504 

!/* Floating popup menu IDs */
integer*4, parameter, public :: IDM_FONT         = 600 
integer*4, parameter, public :: IDM_SIZE         = 601 
integer*4, parameter, public :: IDM_STYLE        = 602 

!/* States menu IDs */
integer*4, parameter, public :: IDM_STATE1       = 610 
integer*4, parameter, public :: IDM_STATE2       = 611 
integer*4, parameter, public :: IDM_STATE3       = 612 
integer*4, parameter, public :: IDM_STATE4       = 613 

!/* BitBlt Raster operation */
integer*4, parameter, public :: ROP_PSDPxax     = #00B8074 

integer*4   hInst
integer*4    hBigMenu
integer*4  hbmCheckOn
integer*4  hbmCheckOff


end module menuinc
