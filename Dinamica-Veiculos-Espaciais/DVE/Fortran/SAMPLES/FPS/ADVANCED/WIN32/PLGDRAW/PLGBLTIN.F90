! Top dialog item IDs */
module plgbltin
use trackin

integer*4 , parameter, public :: DID_P1X      = 101
integer*4 , parameter, public :: DID_P1Y      = 102
integer*4 , parameter, public :: DID_P2X      = 103
integer*4 , parameter, public :: DID_P2Y      = 104
integer*4 , parameter, public :: DID_P3X      = 105
integer*4 , parameter, public :: DID_P3Y      = 106
integer*4 , parameter, public :: DID_XSRC     = 110
integer*4 , parameter, public :: DID_YSRC     = 111
integer*4 , parameter, public :: DID_WIDTH    = 112
integer*4 , parameter, public :: DID_HEIGHT   = 113
integer*4 , parameter, public :: DID_XMASK    = 114
integer*4 , parameter, public :: DID_YMASK    = 115
integer*4 , parameter, public :: DID_NEWSRC   = 160
integer*4 , parameter, public :: DID_NEWMASK  = 161

integer*4 , parameter, public :: DID_DRAW   = 200

integer*4 , parameter, public :: IDM_COPY           = 300
integer*4 , parameter, public :: IDM_PASTE          = 301
integer*4 , parameter, public :: IDM_BOTH           = 302
integer*4 , parameter, public :: IDM_SPINOFF        = 310
integer*4 , parameter, public :: IDM_FLIPONCE       = 311
integer*4 , parameter, public :: IDM_SPIN5          = 312
integer*4 , parameter, public :: IDM_SPIN10         = 313
integer*4 , parameter, public :: IDM_SPIN30         = 314
integer*4 , parameter, public :: IDM_SPIN60         = 315
integer*4 , parameter, public :: IDM_SPIN90         = 316
integer*4 , parameter, public :: IDM_SPINTOPLEFT    = 317
integer*4 , parameter, public :: IDM_SPINCENTER     = 318
integer*4 , parameter, public :: IDM_MODE_BLACKONWHITE   = 320
integer*4 , parameter, public :: IDM_MODE_COLORONCOLOR   = 321
integer*4 , parameter, public :: IDM_MODE_WHITEONBLACK   = 322
integer*4 , parameter, public :: IDM_MODE_HALFTONE       = 323
integer*4 , parameter, public :: IDM_ABOUT          = 330

! Misc. defines for size, color, and appearance of drawing. 
integer*4 , parameter, public :: GRIDCOLOR = #01000006
integer*4 , parameter, public :: DIALOGHEIGHT = 90
integer*4 , parameter, public :: SEPARATORWIDTH= 4
integer*4 , parameter, public :: MAXCHARS     = 32
integer*4 , parameter, public :: INC           = 5



! other user messages sent to the main window or the dialog 
integer*4 , parameter, public :: WM_PUTUPLPOINTS  = WM_USER+20
integer*4 , parameter, public :: WM_PUTUPSRCRECT = WM_USER+21
integer*4 , parameter, public :: WM_PUTUPMASKPT  = WM_USER+22
integer*4 , parameter, public :: WM_PLGBLT        = WM_USER+23
integer*4 , parameter, public :: WM_SPIN          = WM_USER+24

! structure for the lookup tables.  
type LookupEntry
   integer*4     Value 
   character*30    String
end type


integer*4 , parameter, public :: NROPS = 17
type (LookupEntry)  StandardROPs(NROPS)


integer*4 , parameter, public :: NPATTERNS = 6
type (LookupEntry) Patterns(NPATTERNS)


! Global variables 

integer*4 hInst, from_where
integer*4 hwndMain, hwndDlg

type (TrackObject) ptoSrc, ptoDest, ptoMask
integer*4 hdcSrc, hdcDest, hdcMask, nSpin
integer*4 hbmSrc 
integer*4 hbmMask 

integer*4 , parameter, public :: NONE= -1
integer*4 iPatternBrush, glob_hittest 

end module

