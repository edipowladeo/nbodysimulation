module selectin
!* These defines determine the meaning of the fFlags variable.  The low byte
!* is used for the various types of "boxes" to draw.  The high byte is
!* available for special commands.

! Draw a solid border around the rectangle  
integer*4, parameter, public ::  SL_BOX   = 1
! Draw a solid rectangle                    
integer*4, parameter, public ::  SL_BLOCK  = 2
! Extend the current pattern                
integer*4, parameter, public ::  SL_EXTEND= 256

! Mask out everything but the type flags    
integer*4, parameter, public ::  SL_TYPE    = #00ff
! Mask out everything but the special flags 
integer*4, parameter, public ::  SL_SPECIAL = #00ff

! Temporary porting macros
!#define MAKEMPOINT(l)           (*((MPOINT *)&(l)))
!#define MPOINT2POINT(mpt, pt)   ((pt).x = (mpt).x, (pt).y = (mpt).y)
!#define POINT2MPOINT(pt, mpt)   ((mpt).x = (SHORT)(pt).x, (mpt).y = (SHORT)(pt).y)
end module
