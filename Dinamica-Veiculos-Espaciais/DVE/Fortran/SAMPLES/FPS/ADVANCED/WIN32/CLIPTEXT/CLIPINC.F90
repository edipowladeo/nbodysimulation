module clipinc
!      external    OutOfMemory

      integer, parameter, public :: IDM_ABOUT  =  100 

!/* file menu items */

      integer, parameter, public :: IDM_NEW    =  101 
      integer, parameter, public :: IDM_OPEN   =  102 
      integer, parameter, public :: IDM_SAVE   =  103 
      integer, parameter, public :: IDM_SAVEAS =  104 
      integer, parameter, public :: IDM_PRINT  =  105 
      integer, parameter, public :: IDM_EXIT   =  106 


!/* edit menu items */

      integer, parameter, public :: IDM_UNDO   =  200 
      integer, parameter, public :: IDM_CUT    =  201 
      integer, parameter, public :: IDM_COPY   =  202 
      integer, parameter, public :: IDM_PASTE  =  203 
      integer, parameter, public :: IDM_CLEAR  =  204 

      integer hInst
      integer hAccTable
      integer hwind
      !/* handles to clip data  */
      integer*4 hData
      integer*4 hClipData
      integer*4 hText          
      !/* pointers to clip data */       
      integer*4 lpData         
      integer*4 lpClipData 

end module clipinc
