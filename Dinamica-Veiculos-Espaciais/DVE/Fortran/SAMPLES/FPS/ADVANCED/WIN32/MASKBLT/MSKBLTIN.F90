! Top dialog item IDs */
module mskbltin
use trackin
integer*4 ,parameter, public :: DID_X         = 100
integer*4 ,parameter, public :: DID_Y         = 101
integer*4 ,parameter, public :: DID_WIDTH     = 102
integer*4 ,parameter, public :: DID_HEIGHT    = 103
integer*4 ,parameter, public :: DID_XSRC      = 104
integer*4 ,parameter, public :: DID_YSRC      = 105
integer*4 ,parameter, public :: DID_XMASK     = 106
integer*4 ,parameter, public :: DID_YMASK     = 107

integer*4 ,parameter, public :: DID_ROP0      = 110
integer*4 ,parameter, public :: DID_ROP1      = 111
integer*4 ,parameter, public :: DID_ROP2      = 112
integer*4 ,parameter, public :: DID_ROP3      = 113

integer*4 ,parameter, public :: DID_NEWSRC    = 300
integer*4 ,parameter, public :: DID_NEWMASK   = 301

integer*4 ,parameter, public :: DID_DRAW      = 302

integer*4 ,parameter, public :: DID_CB_MODE   = 150
integer*4 ,parameter, public :: DID_CB_PATTERN= 151
integer*4 ,parameter, public :: DID_CB_ROPS   = 152



! accelerator IDs */
integer*4 ,parameter, public :: AID_PASTE      = 55
integer*4 ,parameter, public :: AID_COPY       = 56
integer*4 ,parameter, public :: AID_CYCLE      = 57



! Misc. defines for size, color, and appearance of drawing. 
integer*4 ,parameter, public :: GRIDCOLOR = #01000006
integer*4 ,parameter, public :: DIALOGHEIGHT = 90
integer*4 ,parameter, public :: SEPARATORWIDTH= 4
integer*4 ,parameter, public :: MAXCHARS     = 32
integer*4 ,parameter, public :: INC           = 5



! other user messages sent to the main window or the dialog 
integer*4 ,parameter, public :: WM_PUTUPDESTRECT= WM_USER+20
integer*4 ,parameter, public :: WM_PUTUPSRCRECT = WM_USER+21
integer*4 ,parameter, public :: WM_PUTUPMASKPT  = WM_USER+22
integer*4 ,parameter, public :: WM_MASKBLT      = WM_USER+23

integer*4 , parameter, public :: TICKSPACE = 20

! structure for the lookup tables.  
type LookupEntry
   integer*4      Value 
   character*30   String
end type 


integer*4 ,parameter, public :: NROPS = 17
type (LookupEntry)  StandardROPs(NROPS)

integer*4 ,parameter, public :: NPATTERNS = 6
type (LookupEntry)  Patterns(NPATTERNS)

! Global variables 

integer*4 hInst, from_where
integer*4 hwndMain, hwndDlg

type (TrackObject) ptoSrc, ptoDest, ptoMask
integer*4 hdcSrc, hdcDest, hdcMask
integer*4 hbmSrc 
integer*4 hbmMask 

integer*4 ,parameter, public :: NONE= -1
integer*4 iPatternBrush, glob_hittest 

common /globdata/ hwndMain, hwndDlg

end    
