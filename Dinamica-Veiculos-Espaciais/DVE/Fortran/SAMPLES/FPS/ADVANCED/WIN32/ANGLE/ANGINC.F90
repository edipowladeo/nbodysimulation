! **************************************************************************
!  This file is not guaranteed by Microsoft to be error free. Every effort
!  has been made to ensure proper data-types and declarations, but no
!  testing has been performed using this include file. Additionally, some
!  API's though listed, may not be compatible with the Microsoft Fortran
!  language.
! **************************************************************************
module anginc
use msfwinty      


! anginc.f90 - header file for the AngleArc() demonstration program. 


!/* Top dialog item IDs */
integer, parameter, public :: DID_X      =  101
integer, parameter, public :: DID_Y      =  102
integer, parameter, public :: DID_RADIUS =  103
integer, parameter, public :: DID_START  =  104
integer, parameter, public :: DID_SWEEP  =  105
integer, parameter, public :: DID_DRAW   =  200

integer, parameter, public :: MAXCHARS   =  32

!/* Misc. defines for size, color, and appearance of drawing. */
integer, parameter, public :: GRIDCOLOR     =  16#01000006
integer, parameter, public :: TICKSPACE     =  20
integer, parameter, public :: DIALOGHEIGHT  =  60

integer*4   hInst
integer*4   hwnddlg

end module anginc





                                                          
