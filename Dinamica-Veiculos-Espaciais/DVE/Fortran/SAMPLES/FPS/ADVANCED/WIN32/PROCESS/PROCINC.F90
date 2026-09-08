module procinc
use msfwin
integer, parameter, public :: DID_CREATE     = 16#0065
integer, parameter, public :: DID_TERMINATE  = 16#0066
integer, parameter, public :: DID_LISTBOX    = 16#0067
integer, parameter, public :: DID_HEADER     = 16#0068

integer, parameter, public :: MAXCHARS       = MAX_PATH

integer, parameter, public :: SIZEOPENFILENAME      = 76

integer, parameter, public :: SIZESTARTUPINFO       = 68

integer ghInstance

end module procinc

