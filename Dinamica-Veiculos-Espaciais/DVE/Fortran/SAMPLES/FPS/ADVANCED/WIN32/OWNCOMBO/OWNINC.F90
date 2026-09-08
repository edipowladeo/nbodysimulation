module owncbinc
!/* Defines for menu items */
integer*4, parameter, public :: IDM_EXIT    =  201 
integer*4, parameter, public :: IDM_ABOUT   =  202 

integer*4, parameter, public :: IDM_LISTBOX       =  300 
integer*4, parameter, public :: IDM_MULTILISTBOX  =  301 
integer*4, parameter, public :: IDM_COMBOBOX      =  302 
integer*4, parameter, public :: IDM_OWNERCOMBOBOX =  303 

integer*4, parameter, public :: IDM_HELP          =  400 

!/* Defines for dialog box ownerdraw controls. */
integer*4, parameter, public :: ID_LISTBOX  =  1000 
integer*4, parameter, public :: ID_BLACK    =  1003 
integer*4, parameter, public :: ID_WHITE    =  1004 
integer*4, parameter, public :: ID_RED      =  1005 
integer*4, parameter, public :: ID_BLUE     =  1006 
integer*4, parameter, public :: ID_GREEN    =  1007 

!/* Defines for combo box example */
integer*4, parameter, public :: ID_COMBOBOX     =  1000 
integer*4, parameter, public :: ID_SINGLEEDIT   =  1001 
integer*4, parameter, public :: ID_TEXT1        =  1002 
integer*4, parameter, public :: ID_TEXT2        =  1003 
integer*4, parameter, public :: ID_STEPSBOX     =  1004 
integer*4, parameter, public :: ID_UNSLBUTTON   =  1005 
integer*4, parameter, public :: ID_NUMSELBUTTON =  1006 
integer*4, parameter, public :: ID_TXTSELBUTTON =  1007 
integer*4, parameter, public :: ID_FNDSELBUTTON =  1008 
integer*4, parameter, public :: ID_CLRBUTTON    =  1009 
integer*4, parameter, public :: ID_ADDBUTTON    =  1010 
integer*4, parameter, public :: ID_DELETEBUTTON =  1011 
integer*4, parameter, public :: ID_CPYBUTTON    =  1012 
integer*4, parameter, public :: ID_CBDIRBUTTON  =  1013 

integer*4, parameter, public :: SIZEOFDRAWITEMSTRUCT = 48 

integer*4, parameter, public :: SIZEOFMEASUREITEMSTRUCT = 24 
integer*4   hInst

end module owncbinc

