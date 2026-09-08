module demoin
use msfwina

integer*4 , parameter, public :: IDM_BOX     = 101     
integer*4 , parameter, public :: IDM_BLOCK   = 102     
integer*4 , parameter, public :: IDM_RETAIN  = 103     
integer*4 , parameter, public :: IDM_ABOUT   = 104     

integer*4 hInst
integer*4 bTrack
integer*4 OrgX , OrgY
integer*4 PrevX , PrevY 
integer*4 X , Y 

type (T_RECT) Rect1

integer*4 Shape              ! Shape to use for rectangle 
integer*4 RetainShape        ! Retain or destroy shape    

common /globdata/ hInst, bTrack, OrgX, OrgY, PrevX, PrevY, X, Y, &
        Shape, RetainShape
end module
