module olympinc
use msfwin

integer(4), parameter, public ::  XSIZE   = 100
integer(4), parameter, public ::  YSIZE   = 75

integer(4), parameter, public ::  RINGS      = 5
integer(4), parameter, public ::  BLUERING   = 1
integer(4), parameter, public ::  BLACKRING  = 2
integer(4), parameter, public ::  REDRING    = 3
integer(4), parameter, public ::  YELLOWRING = 4
integer(4), parameter, public ::  GREENRING  = 5

real(4), parameter, public ::  BACKGROUND = 8.0

integer(4), parameter, public ::  BLACK   = 0
integer(4), parameter, public ::  RED     = 1
integer(4), parameter, public ::  GREEN   = 2
integer(4), parameter, public ::  YELLOW  = 3
integer(4), parameter, public ::  BLUE    = 4
integer(4), parameter, public ::  MAGENTA = 5
integer(4), parameter, public ::  CYAN    = 6
integer(4), parameter, public ::  WHITE   = 7
                                            

integer(2) Point(2)
integer(4) rgbmode, doubleBuffer

integer(1)  rgb_colors(RINGS, 3)
integer(4)  mapped_colors(RINGS)
real(4)     dests(RINGS,3)
real(4)     offsets(RINGS,3)
real(4)     angs(RINGS)
real(4)     rotAxis(RINGS,3)
integer(4)  iters(RINGS)
integer(4)  theTorus
end module olympinc

