module vmeminc
use msfwin

integer, parameter, public :: IDM_FREE       =  501 
integer, parameter, public :: IDM_RESERVE    =  502 
integer, parameter, public :: IDM_COMMIT     =  503 

integer, parameter, public :: IDM_NOACCESS   =  504 
integer, parameter, public :: IDM_READONLY   =  505 
integer, parameter, public :: IDM_READWRITE  =  506 

integer, parameter, public :: IDM_LOCK       =  901 
integer, parameter, public :: IDM_UNLOCK     =  902 

integer, parameter, public :: IDM_WRITE      =  701 

integer, parameter, public :: IDM_SHOW       =  801 

integer, parameter, public :: PAGESIZE       =  16#1000 

integer, parameter, public :: IDE_BASEADDR    =   101 
integer, parameter, public :: IDE_ALLOCBASE   =   102 
integer, parameter, public :: IDE_INITPROT    =   103 
integer, parameter, public :: IDE_SIZE        =   104 
integer, parameter, public :: IDE_STATE       =   105 
integer, parameter, public :: IDE_PROTECT     =   106 

! Sizeof MEMORY_BASIC_INFORMATION structure
integer*4, parameter, public :: SIZE_MEM_BASIC_INFO = 28

character*80  Buf
character*80  Buf2

integer*4   base
integer*4   page

integer     hInst
integer     hWind
type(T_MEMORY_BASIC_INFORMATION) MemInfo

end module vmeminc

