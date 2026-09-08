module monkeyin

character*(512) RegPath 

integer*4 ,parameter, public :: IDE_NAME     = 101
integer*4 ,parameter, public :: IDE_TITLEINDE= 102             
integer*4 ,parameter, public :: IDE_ACL      = 104             
integer*4 ,parameter, public :: IDE_LASTWRT  = 105             
integer*4 ,parameter, public :: IDE_VALUE1   = 106             
integer*4 ,parameter, public :: IDE_VALUE2   = 107             
integer*4 ,parameter, public :: IDE_VALUE3   = 108             
integer*4 ,parameter, public :: IDE_CLASS    = 109             
integer*4 ,parameter, public :: IDB_NEXT     = 111             
integer*4 ,parameter, public :: IDB_BACK     = 112             
integer*4 ,parameter, public :: IDL_LISTBOX  = 110             
integer*4 ,parameter, public :: IDL_LISTBOX2 = 103             
integer*4 ,parameter, public :: IDE_CVALUES  = 113             
integer*4 ,parameter, public :: IDB_PRINT    = 114             
integer*4 ,parameter, public :: IDR_FULL     = 115             
integer*4 ,parameter, public :: IDE_TEXTOUT  = 116             
integer*4 ,parameter, public :: IDR_TRIMMED  = 117             

integer*4 ,parameter, public :: MAX_VALUE_NAME = 128            
integer*4 ,parameter, public :: MAX_DATA_LEN   = 1024             

integer*4 ,parameter, public :: LINE_LEN    = 80               

integer*4 ,parameter, public :: BRANCH     = 1                
integer*4 ,parameter, public :: CHILD      = 2                
integer*4 ,parameter, public :: OTHER      = 3                

character*13 ,parameter, public :: BOOT_INI             = "c:\\boot.ini"
character*13 ,parameter, public :: REGISTRY_TXT         = "registry.txt"      

! MAX_PATH is defined as 260 in windef.h

integer*4 ,parameter, public :: WM_APP          = #08000           
integer*4 ,parameter, public :: WM_GETFIRSTKEY  = WM_APP

!Globals 

integer*4 hInst, hDlg1, hHeap



common /globdata/ hInst, hDlg1, hHeap, RegPath 

end module
