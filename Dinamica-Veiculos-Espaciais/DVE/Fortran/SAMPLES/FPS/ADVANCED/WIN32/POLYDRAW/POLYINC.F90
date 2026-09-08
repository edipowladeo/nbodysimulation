module polyinc
character*70, parameter, public :: instruction0  = "Left mouse button places or moves points. Right button erases."C

character*28, parameter, public :: instruction1  = "  default -- PT_LINETO  "C

character*28, parameter, public :: instruction2  = "  <shift> -- PT_MOVETO  "C

character*28, parameter, public :: instruction3  = "  <ctrl>  -- PT_BEZIERTO"C


!/* polydraw.fi - header file for the polydraw demonstration program. */


integer*4, parameter, public :: MAXPOINTS    =  16
!The following was -1 for c
integer*4, parameter, public :: NONE       =  0

integer*4, parameter, public :: HITSIZE    =  10

!* strings to write to the window as labels. */
character*11, parameter, public :: STROKEPATH      =  "StrokePath"C
character*9, parameter, public :: FILLPATH        =  "FillPath"C
character*23, parameter, public :: STROKEANDFILLWIND = "StrokeAndFill, Winding"C
character*25, parameter, public :: STROKEANDFILLALT=  "StrokeAndFill, Alternate"C
character*18, parameter, public :: CLIPPATHWIND    =  "ClipPath, Winding"C
character*20, parameter, public :: CLIPPATHALT     =  "ClipPath, Alternate"C

end module polyinc

