module mfmtinc
use msfwin
integer, parameter, public :: SIZEOFDISKGEOMETRY = 24 

integer, parameter, public :: SIZEOFSUPPORTEDGEOMETRY = 24*20 

integer, parameter, public :: SIZEOFFORMATPARAMETERS = 20

type (T_DISK_GEOMETRY)   SupportedGeometry(20)
end module mfmtinc
