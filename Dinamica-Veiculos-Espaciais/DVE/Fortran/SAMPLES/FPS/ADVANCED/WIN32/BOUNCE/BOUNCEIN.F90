module bouncein
use msfwinty

integer*4   , parameter, public :: MAX_THREADS =  32

!globals

integer hConsoleOut, hRunMutex, hScreenMutex, ThreadNr
type (T_CONSOLE_SCREEN_BUFFER_INFO) csbiInfo    !/* Console information */
save ThreadNr
end module




