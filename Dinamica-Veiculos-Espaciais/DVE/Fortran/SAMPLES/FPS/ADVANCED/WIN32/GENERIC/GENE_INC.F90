!/******* Menu Defines *******/
module gene_inc 
      integer   ,parameter, public :: IDM_SCALE         = 1002 
      integer*4 , parameter, public :: IDM_NEW          =  100
      integer*4 , parameter, public :: IDM_OPEN         =  101
      integer*4 , parameter, public :: IDM_SAVE         =  102
      integer*4 , parameter, public :: IDM_SAVEAS       =  103
      integer*4 , parameter, public :: IDM_PRINT        =  104
      integer*4 , parameter, public :: IDM_PRINTSETUP   =  105
      integer*4 , parameter, public :: IDM_EXIT         =  106
      integer*4 , parameter, public :: IDM_UNDO         =  200
      integer*4 , parameter, public :: IDM_CUT          =  201
      integer*4 , parameter, public :: IDM_COPY         =  202
      integer*4 , parameter, public :: IDM_PASTE        =  203
      integer*4 , parameter, public :: IDM_LINK         =  204
      integer*4 , parameter, public :: IDM_LINKS        =  205
      integer*4 , parameter, public :: IDM_HELPCONTENTS =  300
      integer*4 , parameter, public :: IDM_HELPSEARCH   =  301
      integer*4 , parameter, public :: IDM_HELPHELP     =  302
      integer*4 , parameter, public :: IDM_ABOUT        =  303
      integer*4 , parameter, public :: DLG_VERFIRST     =   400
      integer*4 , parameter, public :: DLG_VERLAST      =   404

!/***** Control Defines ******/
      integer , parameter, public ::  IDC_HORZ      = 2000 
      integer , parameter, public ::  IDC_VERT      = 2001 
!/**********************  Defines  *************************/
      integer , parameter, public :: VSCROLLMAX     = 50 
      integer , parameter, public :: HSCROLLMAX     = 50 
      integer , parameter, public :: VERTSCALE  = VSCROLLMAX/3 
      integer , parameter, public :: HORZSCALE  = HSCROLLMAX/3 
      integer , parameter, public :: LINEINC = 1 
      integer , parameter, public :: PAGEINC = 4 
      integer , parameter, public :: FIRSTSTRING    = 0 
      integer , parameter, public :: LASTSTRING     = 10 
      integer , parameter, public :: MAXINPUT       = 10 

end module


