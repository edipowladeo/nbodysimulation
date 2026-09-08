module gtsysinc
use msfwin
!/* declare global variable to be used by all of the do... functions */
character*100   buffer

!/* the control ID's from the dialog box. */
integer*4, parameter, public :: DID_SYSCOLORS    = 16#0065 

integer*4, parameter, public :: DID_DIRECTORY    = 16#0066 

integer*4, parameter, public :: DID_INFO         = 16#0067 

integer*4, parameter, public :: DID_METRICS      = 16#0068 

integer*4, parameter, public :: DID_PALETTE      = 16#0069 

integer*4, parameter, public :: DID_LOCALTIME    = 16#006A 

integer*4, parameter, public :: DID_TIME         = 16#006B 

integer*4, parameter, public :: DID_LISTBOX      = 16#006C 

integer*4, parameter, public :: DID_TEXT         = 16#006D 



!/* structure for the lookup tables.  */
type LookupEntry
   integer          Val
   character*100    String
end type


integer*4, parameter, public ::   SIZEOFPALETTEENTRY = 4


integer*4, parameter, public :: NSYSCOLORS = COLOR_BTNHIGHLIGHT+1  !// assumes order puts BTNHIGHLIGHT last 

integer*4, parameter, public :: NSYSMETRICS = SM_CMETRICS 


type(LookupEntry)  SysColors(NSYSCOLORS)

type(LookupEntry)  SystemMetrics(NSYSMETRICS)


end module gtsysinc

