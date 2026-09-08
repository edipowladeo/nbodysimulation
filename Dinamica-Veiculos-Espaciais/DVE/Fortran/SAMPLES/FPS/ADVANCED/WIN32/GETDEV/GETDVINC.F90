module getdvinc
!/* declare global variable to be used to hold string sent to list box. */
character       buffer*110

!/* the control ID from the dialog box. */
integer, parameter, public :: DID_LISTBOX    = 16#006B 


!/* structure for the lookup tables.  */
type LookupEntry
    integer         Val
    character*100   String
end type



!/* GetDeviceCaps() codes from MSFWINTY.F90 */
integer, parameter, public :: NINDEX = 28 
type(LookupEntry)    DevCap(NINDEX)

integer, parameter, public :: NDevice  = 7 
type(LookupEntry)       Device(NDevice)

integer, parameter, public :: NCurveCaps  = 9 
type(LookupEntry)    CurveCap(NCurveCaps)

integer, parameter, public :: NLineCaps  = 8 
type(LookupEntry)    LineCap(NLineCaps)

integer, parameter, public :: NPolygonalCaps  = 10 
type(LookupEntry)  PolygonalCap(NPolygonalCaps)

integer, parameter, public :: NClipCaps = 2 
type(LookupEntry)   ClipCap(NClipCaps)

integer, parameter, public :: NTextCaps = 16 
type(LookupEntry)   TextCap(NTextCaps)

integer, parameter, public :: NRasterCaps  = 12 
type(LookupEntry)   RasterCap(NRasterCaps)

end module getdvinc

