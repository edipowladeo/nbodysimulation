module threadin

integer*4 ,parameter, public :: IDM_SUSPENDGREEN    = 501
integer*4 ,parameter, public :: IDM_SUSPENDRED      = 502
integer*4 ,parameter, public :: IDM_RESUMEGREEN     = 601
integer*4 ,parameter, public :: IDM_RESUMERED       = 602

integer*4 ,parameter, public :: IDM_GIDLE           = 700
integer*4 ,parameter, public :: IDM_GLOW            = 701
integer*4 ,parameter, public :: IDM_GBNORM          = 702
integer*4 ,parameter, public :: IDM_GNORM           = 703
integer*4 ,parameter, public :: IDM_GANORM          = 704
integer*4 ,parameter, public :: IDM_GHIGH           = 705
integer*4 ,parameter, public :: IDM_GTC             = 706

integer*4 ,parameter, public :: IDM_RIDLE           = 750
integer*4 ,parameter, public :: IDM_RLOW            = 751
integer*4 ,parameter, public :: IDM_RBNORM          = 752
integer*4 ,parameter, public :: IDM_RNORM           = 753
integer*4 ,parameter, public :: IDM_RANORM          = 754
integer*4 ,parameter, public :: IDM_RHIGH           = 755
integer*4 ,parameter, public :: IDM_RTC             = 756

integer*4 ,parameter, public :: GREEN   = #00007F00
integer*4 ,parameter, public :: RED     = #0000007F

!User defined message for creating threads after WM_CREATE
integer*4 , parameter, public :: WM_THREADS = #500

integer*4 hInst, hWnd2, RedSuspendCnt, GreenSuspendCnt


common /globdata/ hInst, hWnd2, RedSuspendCnt, GreenSuspendCnt

end module

