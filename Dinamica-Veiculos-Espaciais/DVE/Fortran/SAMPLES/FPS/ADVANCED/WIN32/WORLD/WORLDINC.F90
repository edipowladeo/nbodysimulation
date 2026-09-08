module worldinc
use msfwin

!/******* Menu Defines *******/

integer, parameter, public ::  IDM_OPEN   = 1000
integer, parameter, public ::  IDM_EXIT   = 1001
integer, parameter, public ::  IDM_SCALE  = 1002
integer, parameter, public ::  IDM_ABOUT  = 1003

!/***** Control Defines ******/

integer, parameter, public ::  IDC_HORZ = 2000
integer, parameter, public ::  IDC_VERT = 2001
!/**********************  Defines  *************************/

integer, parameter, public ::  VSCROLLMAX = 50
integer, parameter, public ::  HSCROLLMAX=  50
integer, parameter, public ::  VERTSCALE =  (50/3)
integer, parameter, public ::  HORZSCALE =  (50/4)

integer, parameter, public ::  LINEINC = 1
integer, parameter, public ::  PAGEINC = 4

integer, parameter, public ::  FIRSTSTRING = 0
integer, parameter, public ::  LASTSTRING =  10
integer, parameter, public ::  MAXINPUT   =  8

type (T_OPENFILENAME) OFName
type (T_XFORM)  xForm1   !/* Transform to apply in SetWorldTransform()  *!/
integer     bFileOpen       !/* Logs if a metafile has been opened or not  *!/
integer     bFileJustOpen   !/* Used to re-initialize "Scale Image" values *!/
integer     ghInstance
integer     hEMF


character*260   szFile
character*260   szFileTitle
character*150   szFilter
character*128   Filebuffer
character*256   FileName

common /globdata/ hEMF, bFileOpen, bFileJustOpen, ghInstance,szFile,szFileTitle,szFilter,Filebuffer,FileName



end module   
