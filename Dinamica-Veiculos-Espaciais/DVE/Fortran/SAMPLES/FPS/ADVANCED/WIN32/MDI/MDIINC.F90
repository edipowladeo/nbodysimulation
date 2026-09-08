
!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/
module mdiinc
use msfwina
!/*
! * Menu ID's
! */
integer*2, parameter, public :: MM_ABOUT        = 8000 

integer*2, parameter, public :: MM_MDI          = 8001 

integer*2, parameter, public :: MM_RESERVE1     = 8002 

integer*2, parameter, public :: MM_RESERVE2     = 8003 


integer*2, parameter, public :: MM_OPT_1        = 7001 

integer*2, parameter, public :: MM_OPT_2        = 7002 

integer*2, parameter, public :: MM_OPT_3        = 7003 

integer*2, parameter, public :: MM_OPT_4        = 7004 

integer*2, parameter, public :: MM_OPT_5        = 7005 

integer*2, parameter, public :: MM_OPT_6        = 7006 

integer*2, parameter, public :: MM_OPT_7        = 7007 

integer*2, parameter, public :: MM_OPT_8        = 7008 


integer*2, parameter, public :: IDM_CASCADE     = 30 

integer*2, parameter, public :: IDM_TILE        = 31 

integer*2, parameter, public :: IDM_ARRANGE     = 32 

integer*2, parameter, public :: IDM_CLOSEALL    = 33 


integer*4, parameter, public :: SIZEOFCAPTIONTEXT       = 20 


integer*2, parameter, public :: ACCEL_ID        = 100 

integer*4, parameter, public :: SIZEOFLF  = 60 

integer*4, parameter, public :: SIZEOFACH = 128 

integer*4, parameter, public :: SIZEOFINFO = 44 

!integer*4, parameter, public :: STRICT = 0 

!//
!// Instance data for each MDI child window
!//
type PERWNDINFO
    integer*4       hParent
    integer*4       hTextWnd
    type(T_RECT)      rcClient
    character*(SIZEOFCAPTIONTEXT)       CaptionBarText
end type PERWNDINFO

!record /PerWndInfo/ Info 

integer ghModule
integer   ghwndMain   
integer   ghwndClient 

integer  hMenu, hMenuWindow
integer  hChildMenu, hChildMenuWindow

character   gszFile(20)
character   gszMapName(20)

end module mdiinc
