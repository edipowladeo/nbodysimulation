! **************************************************************************
!  This file is not guaranteed by Microsoft to be error free. Every effort
!  has been made to ensure proper data-types and declarations, but no
!  testing has been performed using this include file. Additionally, some
!  API's though listed, may not be compatible with the Microsoft Fortran
!  language.
! **************************************************************************
module timerinc
use msfwina
integer*4, parameter, public :: ID_TIMER1      = 1
integer*4, parameter, public :: ID_TIMER2      = 2
integer*4, parameter, public :: ID_TIMER3      = 3
integer*4, parameter, public :: ID_TIMER4      = 4

integer*4, parameter, public :: BUFSIZE        = 20

integer*4, parameter, public :: BUTTONBORDER   = 5
integer*4, parameter, public :: BUTTONHEIGHT   = 25
integer*4, parameter, public :: TEXTHEIGHT     = 8

integer*4, parameter, public :: TIMERINTERVAL  = 250



!******************************************************************************\
!*                               GLOBAL VARIABLES
!******************************************************************************/

      integer*4 ghInst
      integer*4 gahwndButtons(5)  
      !  Array of HWNDs for the start/stop timer buttons. 
      !  Note: the first element (hwndButtons[0]) is unused 
      !  (since it doesn't correspond with a timer ID).
      !  
      
      type(T_RECT)   gaFlashRects(5)   
      
      !  Array of RECTs for the flashing rectandgles.
      !  Note: the first element (flashRects[0]) is unused 
      !  (since it doesn't correspond with a timer ID).
      !  
end module timerinc

