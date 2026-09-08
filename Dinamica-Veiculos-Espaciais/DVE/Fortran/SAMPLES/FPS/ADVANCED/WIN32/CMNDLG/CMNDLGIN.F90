module cmndlgin
use msfwina
! menu commands

! Find menu
integer , parameter, public :: IDM_OPENFILE       = 100
integer , parameter, public :: IDM_SAVEFILE       = 101
integer , parameter, public :: IDM_SAVEFILEAS     = 102
integer , parameter, public :: IDM_PRINT          = 103
integer , parameter, public :: IDM_EXIT           = 104

!// Options menu
integer , parameter, public :: IDM_CHOOSECOLOR    = 200
integer , parameter, public :: IDM_ENTERNEW       = 201
integer , parameter, public :: IDM_CHOOSEFONT     = 202
integer , parameter, public :: IDM_FINDTEXT       = 203
integer , parameter, public :: IDM_REPLACETEXT    = 204
integer , parameter, public :: IDM_STANDARD       = 205
integer , parameter, public :: IDM_HOOK           = 206
integer , parameter, public :: IDM_CUSTOM         = 207
 
! Help menu
integer , parameter, public :: IDM_ABOUT          = 300
 

! Dialog box constants
integer , parameter, public :: IDEDIT             = 500

! string constants

integer , parameter, public :: IDS_DIALOGFAILURE   =  1
integer , parameter, public :: IDS_STRUCTSIZE      =  2
integer , parameter, public :: IDS_INITIALIZATION  =  3
integer , parameter, public :: IDS_NOTEMPLATE      =  4
integer , parameter, public :: IDS_NOHINSTANCE     =  5
integer , parameter, public :: IDS_LOADSTRFAILURE  =  6
integer , parameter, public :: IDS_FINDRESFAILURE  =  7
integer , parameter, public :: IDS_LOADRESFAILURE  =  8
integer , parameter, public :: IDS_LOCKRESFAILURE  =  9
integer , parameter, public :: IDS_MEMALLOCFAILURE = 10
integer , parameter, public :: IDS_MEMLOCKFAILURE  = 11
integer , parameter, public :: IDS_NOHOOK          = 12
integer , parameter, public :: IDS_SETUPFAILURE    = 13
integer , parameter, public :: IDS_PARSEFAILURE    = 14
integer , parameter, public :: IDS_RETDEFFAILURE   = 15
integer , parameter, public :: IDS_LOADDRVFAILURE  = 16
integer , parameter, public :: IDS_GETDEVMODEFAIL  = 17
integer , parameter, public :: IDS_INITFAILURE     = 18
integer , parameter, public :: IDS_NODEVICES       = 19
integer , parameter, public :: IDS_NODEFAULTPRN    = 20
integer , parameter, public :: IDS_DNDMMISMATCH    = 21
integer , parameter, public :: IDS_CREATEICFAILURE = 22
integer , parameter, public :: IDS_PRINTERNOTFOUND = 23
integer , parameter, public :: IDS_NOFONTS         = 24
integer , parameter, public :: IDS_SUBCLASSFAILURE = 25
integer , parameter, public :: IDS_INVALIDFILENAME = 26
integer , parameter, public :: IDS_BUFFERTOOSMALL  = 27
integer , parameter, public :: IDS_FILTERSTRING    = 28
integer , parameter, public :: IDS_UNKNOWNERROR    = 29
!Template Identifiers

!integer , parameter, public :: FINDDLGORD = 1000
!integer , parameter, public :: FILEOPENORD = 1001
!integer , parameter, public :: FORAMTDLGORD31 = 1002
!integer , parameter, public :: REPLACEDLGORD = 1003
!integer , parameter, public :: PRINTDLGORD = 1004
!integer , parameter, public :: PRNSETUPDLGORD = 1005



! constants

integer , parameter, public :: FILE_LEN           = 80


integer                 hInst
type (T_OPENFILENAME)   OpenFN
character*256           szDirName
character*256           szFile
character*256           szFileTitle

! Filter specification for the OPENFILENAME struct
! This is portable for i386 and MIPS
! Leaving out the \0 terminator will cause improper DWORD alignment
! and cause a failure under MIPS

character*256              szFilter


character*(FILE_LEN)        FileBuf
integer                     dwFileSize
integer                     FindReplaceMsg
character*64                szFindString
character*64                szReplaceString
type (T_FINDREPLACE)        frText

character*256               BufPtr
type (T_CHOOSEFONT)         chf
type (T_CHOOSECOLOR)        chsclr
integer*4                   crColor
type (T_LOGFONT)            lf
integer                     wMode
integer                     hDlgFR
type (T_PRINTDLG)           pd

end module
