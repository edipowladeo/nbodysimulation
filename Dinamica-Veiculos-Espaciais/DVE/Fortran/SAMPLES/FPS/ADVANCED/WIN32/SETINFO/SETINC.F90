module setinc
use msfwin
integer*4, parameter, public :: IDE_API                  =   101 
integer*4, parameter, public :: IDE_RETSTAT              =   102 
integer*4, parameter, public :: IDB_STEP                 =   103 
integer*4, parameter, public :: IDE_TIME                 =   104 

integer*4, parameter, public :: DIALOGHEIGHT             =   80 

integer*4, parameter, public :: WM_REPSTAT               =   WM_USER+1 


integer*4, parameter, public :: IDE_FILENAME             =   101 
integer*4, parameter, public :: IDB_OPENFILE             =   102 
integer*4, parameter, public :: IDE_MONTH                =   103 
integer*4, parameter, public :: IDE_DAY                  =   104 
integer*4, parameter, public :: IDE_YEAR                 =   105 
integer*4, parameter, public :: IDE_HOURS                =   201 
integer*4, parameter, public :: IDE_MINUTES              =   202 
integer*4, parameter, public :: IDE_SECONDS              =   203 
integer*4, parameter, public :: IDB_SET                  =   204 
integer*4, parameter, public :: IDE_SIZE                 =   205 
integer*4, parameter, public :: IDC_HIDE                 =   206 
integer*4, parameter, public :: IDC_SYSTEM               =   207 
integer*4, parameter, public :: IDC_ARC                  =   208 
integer*4, parameter, public :: IDC_READ                 =   209 
integer*4, parameter, public :: IDC_NORMAL               =   210 
integer*4, parameter, public :: IDB_ATTR                 =   222 


integer*4, parameter, public :: YRMASK     =   #FE00 
integer*4, parameter, public :: YRSHIFT    =   9 

integer*4, parameter, public :: MONMASK    =   #01E0 
integer*4, parameter, public :: MONSHIFT   =   5 

integer*4, parameter, public :: DAYMASK    =   #001F 
integer*4, parameter, public :: DAYSHIFT   =   0 

integer*4, parameter, public :: HRMASK     =   #F800 
integer*4, parameter, public :: HRSHIFT    =   11 
integer*4, parameter, public :: MINMASK    =   #07E0 
integer*4, parameter, public :: MINSHIFT   =   5 
integer*4, parameter, public :: SECMASK    =   #001F 
integer*4, parameter, public :: SECSHIFT   =   0 

integer*4   hInst
integer*4   hWind, hWndDlg, hWndFileDlg
integer*4   StepTime

end module setinc

