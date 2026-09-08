
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! dialogm.f90
!!
!! This is the source code for the modal dialog manager.
!! Provides a procedural interface to Windows dialogs.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

module dialogt

  ! all character strings should be this size
  integer, parameter :: STRSZ = 256

  type ControlType
	integer control ! ctrl_[] :identifies the control type
    integer id		! the associated Windows control id
	logical dirty	! true if a control value is modified
					! and needs to be written to the dialog
	logical duplicate ! controls that have duplicate ids are read-only

	! arrays of each data type.  This allows us to create a
	! union-like structure

	integer intsize
	integer, pointer, dimension(:) :: intvalue
	integer logsize
	logical, pointer, dimension(:) :: logvalue
	integer charsize
	character*(STRSZ), pointer, dimension(:) :: charvalue
	! we would like to make this an array of externals but that is not
	! allowed in F90
	integer callbacksize
	integer, pointer, dimension(:) :: callbackvalue

	! the previous arrays are used as follows depending on the value of control

	! ctrl_StaticText
	! intsize = 0
	! logsize = 1
	! logvalue(1) = dlg_enable
	! charsize = 1
	! charvalue(1) = dlg_title
	! callbacksize = 0

	! ctrl_GroupBox
	! intsize = 0
	! logsize = 1
	! logvalue(1) = dlg_enable
	! charsize = 1
	! charvalue(1) = dlg_title
	! callbacksize = 0

	! ctrl_PushButton
	! intsize = 0
	! logsize = 1
	! logvalue(1) = dlg_enable
	! charsize = 1
	! charvalue(1) = dlg_title
	! callbacksize = 1
	! callbackvalue(1) = dlg_clicked

	! ctrl_CheckBox
	! intsize = 0
	! logsize = 2
	! logvalue(1) = dlg_enable
	! logvalue(2) = dlg_state (default)
	! charsize = 1
	! charvalue(1) = dlg_title
	! callbacksize = 1
	! callbackvalue(1) = dlg_clicked

	! ctrl_RadioButton
	! intsize = 2
	! intvalue(1) = index of first button in group
	! intvalue(2) = index of last button in group
	! logsize = 2
	! logvalue(1) = dlg_enable
	! logvalue(2) = dlg_state (default)
	! charsize = 1
	! charvalue(1) = dlg_title
	! callbacksize = 1
	! callbackvalue(1) = dlg_clicked

	! ctrl_Edit
	! intsize = 0
	! logsize = 1
	! logvalue(1) = dlg_enable
	! charsize = 1
	! charvalue(1) = dlg_state
	! callbacksize = 2
	! callbackvalue(1) = dlg_change (default)
	! callbackvalue(2) = dlg_update

	! ctrl_ScrollBar
	! intsize = 2
	! intvalue(1) = dlg_position (default)
	! intvalue(2) = dlg_range
	! intvalue(3) = dlg_smallstep
	! intvalue(4) = dlg_bigstep
	! logsize = 1
	! logvalue(1) = dlg_enable
	! charsize = 0
	! callbacksize = 1
	! callbackvalue(1) = dlg_change

	! ctrl_ListBox
	! IMPLEMENTATION
	! note: n is the number of elements in the listbox
	! intsize = n+2
	! intvalue(1) = number of items in listbox
	! intvalue(2...n+2) = index of selected entry (1 based)
	!   list is terminated with 0
	! logsize = 1
	! logvalue(1) = dlg_enable
	! charsize = n+1
	! charvalue(1) = selected value
	! charvalue(2...n+1) = text
	! callbacksize = 2
	! callbackvalue(1) = dlg_selchange
	! callbackvalue(2) = dlg_dblclick
    ! USER
	! intvalue(dlg_numitems) = number of items in listbox
	! intvalue(1...n) = index of selected entry (1 based, 0 terminated)
	! charvalue(x) = selected value
	! charvalue(1..n) = indexed value

	! ctrl_ComboBox
	! IMPLEMENTATION
	! note: n is the number of elements in the listbox
	! intsize = 1
	! intvalue(1) = number of items in listbox
	! logsize = 1
	! logvalue(1) = dlg_enable
	! charsize = n+1
	! charvalue(1) = selected value
	! charvalue(2...n+1) = text
	! callbacksize = 4
	! callbackvalue(1) = dlg_selchange
	! callbackvalue(2) = dlg_dblclick
	! callbackvalue(3) = dlg_update
	! callbackvalue(4) = dlg_change
    ! USER
	! intvalue(dlg_numitems) = number of items in listbox
	! charvalue(dlg_state) = selected value
	! charvalue(1..n) = indexed value

	! ctrl_DropList
	! IMPLEMENTATION
	! note: n is the number of elements in the listbox
	! intsize = 2
	! intvalue(1) = number of items in listbox
	! intvalue(2) = current selected item (may be 0)
	! logsize = 1
	! logvalue(1) = dlg_enable
	! charsize = n+1
	! charvalue(1) = selected value
	! charvalue(2...n+1) = text
	! callbacksize = 2
	! callbackvalue(1) = dlg_selchange
	! callbackvalue(2) = dlg_dblclick
    ! USER
	! intvalue(dlg_numitems) = number of items in listbox
	! intvalue(dlg_state) = index of selected value
	! charvalue(dlg_state) = selected value
	! charvalue(1..n) = indexed value

  end type

  ! data types returned from resource parsing functions

  type DialogHeader
    integer Style
	integer ExtendedStyle
	integer NumberOfItems
	integer x
	integer y
	integer cx
	integer cy
	integer MenuId
	character*(STRSZ) MenuName
	integer ClassId
	character*(STRSZ) ClassName
	character*(STRSZ) Caption
	integer PointSize
	character*(STRSZ) FontName
  end type

  type ControlHeader
    integer Style
	integer ExtendedStyle
	integer x
	integer y
	integer cx
	integer cy
	integer id
	integer ClassId
	character*(STRSZ) ClassName
	integer TextId
	character*(STRSZ) TextName
	integer ExtraStuff
  end type

  type DialogResource
	integer ptr
  end type

  type strpos
	character*(STRSZ), pointer :: s
    character c
	integer i
  end type

  type, public :: dialog
    !private
	integer dlgid
	integer hwnd	! 0 if dialog is not displayed
	integer retval
	logical dirty	! prevents unwanted callbacks when dlg values are changed
    logical mutexflush
    logical comboupdate
	integer dlginitcallback
	integer NumControls
	type (ControlType), pointer, dimension(:) :: list
  end type

end module dialogt

module dialogm

!make sure we link with the correct library
!ms$objcomment lib: "dialogm.lib"

  use dialogt

  ! windows ids and constants
  use msfwinty

implicit none

private	! everything that is not explicitly declared public is private

  ! defined in msfwinty
  public idok
  public idcancel
  public idabort
  public idretry
  public idignore
  public idyes
  public idno
  public idclose
  public idhelp

  public dialog

  ! this global should only be referenced by DlgProc
  type (dialog), pointer :: g_dlg

  ! predefined index values for Get/Set functions

  integer, parameter, public :: dlg_default   = -1
  integer, parameter, public :: dlg_title     = -2
  integer, parameter, public :: dlg_enable    = -3
  integer, parameter, public :: dlg_clicked   = -4
  integer, parameter, public :: dlg_state     = -5
  integer, parameter, public :: dlg_change    = -6
  integer, parameter, public :: dlg_update    = -7
  integer, parameter, public :: dlg_range     = -8
  integer, parameter, public :: dlg_position  = -9
  integer, parameter, public :: dlg_selchange = -10
  integer, parameter, public :: dlg_bigstep   = -11
  integer, parameter, public :: dlg_smallstep = -12
  integer, parameter, public :: dlg_numitems  = -13
  integer, parameter, public :: dlg_dblclick  = -14

  ! OK and Cancel IDs
  integer, parameter, public :: IDC_BUTTON_OK      = 1
  integer, parameter, public :: IDC_BUTTON_CANCEL  = 2

  ! control classes (not Windows constants but should be)
  integer, parameter :: CLS_BUTTON    = 16#80
  integer, parameter :: CLS_EDIT      = 16#81
  integer, parameter :: CLS_STATIC    = 16#82
  integer, parameter :: CLS_LISTBOX   = 16#83
  integer, parameter :: CLS_SCROLLBAR = 16#84
  integer, parameter :: CLS_COMBOBOX  = 16#85

  ! internal constants for each supported control type

  integer, parameter :: ctrl_statictext  = 1
  integer, parameter :: ctrl_groupbox    = 2
  integer, parameter :: ctrl_pushbutton  = 3
  integer, parameter :: ctrl_checkbox    = 4
  integer, parameter :: ctrl_radiobutton = 5
  integer, parameter :: ctrl_edit        = 6
  integer, parameter :: ctrl_scrollbar   = 7
  integer, parameter :: ctrl_listbox     = 8
  integer, parameter :: ctrl_combobox    = 9
  integer, parameter :: ctrl_droplist    = 10

  integer, parameter :: TotalControls = 10

  ! interfaces for routines implemented in C (dlglow.cpp)

interface

  function DlgCastFunc2Int( func ) result (r)
  external func
  integer r
  end function DlgCastFunc2Int

  subroutine DlgDoCallBack( subr, dlg, id, code )
  use dialogt
  integer, intent(in) :: subr
  type (dialog), intent(in) :: dlg
  integer, intent(in) :: id
  integer, intent(in) :: code
  end subroutine DlgDoCallback

  function DlgGetRes ( id, res ) result (r)
  use dialogt
  integer, intent(in) :: id
  type (DialogResource), intent(out) :: res
  logical r
  end function DlgGetRes

  subroutine DlgParseRes ( res, dlgheader )
  use dialogt
  type (DialogResource), intent(in) :: res
  type (DialogHeader), intent(out) :: dlgheader
  end subroutine DlgParseRes

  subroutine DlgParseResControl ( res, ctrlheader )
  use dialogt
  type (DialogResource), intent(in) :: res
  type (ControlHeader), intent(out) :: ctrlheader
  end subroutine DlgParseResControl

  function DlgDoModal ( dlgid, hwndParent, dlgproc ) result (r)
  integer, intent(in) :: dlgid
  integer, intent(in) :: hwndParent
  integer, external :: dlgproc
  integer r
  end function DlgDoModal

  subroutine DlgEndDialog ( hwnd, retval )
  integer, intent(in) :: hwnd
  integer, intent(in) :: retval
  end subroutine DlgEndDialog

  function DlgSendMessage( hwnd, msg, wparam, lparam ) result (r)
  integer, intent(in) :: hwnd, msg, wparam, lparam
  integer r
  end function DlgSendMessage

  function DlgHwnd2Id( hwnd ) result (r)
  integer, intent(in) :: hwnd
  integer r
  end function DlgHwnd2Id

  function DlgId2Hwnd( hwndDlg, id ) result (r)
  integer, intent(in) :: hwndDlg, id
  integer r
  end function DlgId2Hwnd

  function DlgEnableWindow( hwnd, enabled ) result (r)
  integer, intent(in) :: hwnd
  logical, intent(in) :: enabled
  logical r
  end function DlgEnableWindow

  function DlgIsWindowEnabled( hwnd ) result (r)
  integer, intent(in) :: hwnd
  logical r
  end function DlgIsWindowEnabled

  !TODO: runtime function -- should be replaced by use msflib
  function GetHwndQQ( iunit ) result (r)
  integer iunit, r
  END FUNCTION

end interface

  ! overload the dialog get and set routines using F90 generics

interface DlgSet
  module procedure DlgSetInt
  module procedure DlgSetLog
  module procedure DlgSetChar
end interface
interface DlgGet
  module procedure DlgGetInt
  module procedure DlgGetLog
  module procedure DlgGetChar
end interface

  ! all public module fuctions are listed here

  public DlgInit
  public DlgModal
  public DlgSetReturn
  public DlgExit
  public DlgUninit
!ms$if defined(DEBUG)
  public DlgDump
!ms$endif

  public DlgSetInt
  public DlgSetLog
  public DlgSetChar
  public DlgSetSub
  public DlgSet
  public DlgGetInt
  public DlgGetLog
  public DlgGetChar
  public DlgGet

contains

  ! helper functions

  recursive function log2int( lvalue ) result (ivalue)
  logical, intent(in) :: lvalue
  integer ivalue
    if ( lvalue ) then
	  ivalue = 1
	else
	  ivalue = 0
	end if
  end function log2int

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! StrFor2C
!!
!! Null terminates a blank padded string and saves string
!! information in a strpos structure. (F90 string to C string)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine StrFor2C( str, pos )
  character*(*), target, intent(inout) :: str
  type (strpos), intent(out) :: pos
    integer iEnd
	iEnd = len_trim(str)+1
	if (iEnd .eq. len(str)+1) iEnd = len(str)
	pos%s => str
	pos%c = str(iEnd:iEnd)
	pos%i = iEnd
	str(iEnd:iEnd) = char(0)
  end subroutine StrFor2C

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! StrC2For
!!
!! Restores a previously null terminated string into its
!! original blank padded state
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine StrC2For( pos )
  type (strpos), intent(inout) :: pos
    pos%s(pos%i:pos%i) = pos%c
  end subroutine StrC2For

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! PadStrFor
!!
!! Pads out a null terminated string (F90 string to C string)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine PadStrFor( str )
  character*(*), intent(inout) :: str
    integer i
	! scan up to the terminating null
	i = 1
	do while( i .le. len(str) .and. str(i:i) .ne. char(0) )
	  i = i + 1
	end do
    ! pad the rest with blanks
	do while( i .le. len(str) )
	  str(i:i) = ' '
	  i = i + 1
	end do
  end subroutine PadStrFor

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DefaultCallback
!!
!! This is the initial callback for the messages of all 
!! controls except pushbuttons.  No action is performed
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine DefaultCallback( dlg, id, code )
  type (dialog) dlg
  integer id
  integer code

    ! supress compiler warnings
    type (dialog) local_dlg
    integer local_i
	local_dlg = dlg
	local_i = id
	local_i = code

  end subroutine DefaultCallback

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DefaultPushbuttonCallback
!!
!! This is the initial callback for the dlg_click message 
!! for pushbutton controls.  The dialog is terminated, 
!! returning the control id of the pushbutton.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine DefaultPushbuttonCallback( dlg, id, code )
  type (dialog) dlg
  integer id
  integer code

    ! supress compiler warnings
    integer local_i
	local_i = code

	call DlgSetReturn( dlg, id )
	call DlgExit( dlg )

  end subroutine DefaultPushbuttonCallback

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgBadStyle
!!
!! Halts the program displaying the incorrect style and id
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  recursive subroutine DlgBadStyle ( cid, str )
  integer cid
  character*(*) str

	character*20 text
	write (text,*) cid

	write (*,*) "Invalid style ",trim(str)," used for control ",adjustl(text)
	stop

  end subroutine DlgBadStyle

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgInit
!! PUBLIC ROUTINE
!!
!! Given a dialog's resource id, scans the resource for 
!! supported controls and initializes the dialog structure
!! appropriately
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgInit ( id, dlg ) result (r)
  integer, intent(in) :: id
  type (dialog), intent(out) :: dlg
  logical r

	integer i, i2
    type (DialogHeader) dlgheader
    type (ControlHeader) ctrlheader
	integer class, style
	type (DialogResource) dlgres, dlgres2
	integer idxFirstRadio, idLastRadio

    r = .true.
    idxFirstRadio = 0

    dlg % dlgid = id
    dlg % hwnd = 0
    dlg % retval = 1
    dlg % dirty = .true.
    dlg % mutexflush = .false.
	dlg % comboupdate = .true.
	dlg % dlginitcallback = loc(DefaultCallback)

	if ( .not. DlgGetRes( id, dlgres ) ) then
	  r = .false.
	  return
	end if

	call DlgParseRes( dlgres, dlgheader )

	! note: this may be larger than necessary since we only
	! need an entry for each supported control while we allocate
	! an entry for each control in the dialog
	allocate( dlg % list( dlgheader % NumberOfItems ) )

	dlg % NumControls = 0
	do i = 1, dlgheader % NumberOfItems
	  call DlgParseResControl( dlgres, ctrlheader )
	  class = ctrlheader % ClassId
	  style =  ctrlheader % Style

      ! check for duplicate ids
	  dlg % list(dlg%NumControls+1) % duplicate = .false.
      do i2 = 1, i-1
	    if (dlg % list(i2) % id .eq. ctrlheader % id ) then
		  dlg % list(i2) % duplicate = .true.
		  dlg % list(dlg%NumControls+1) % duplicate = .true.
		  exit
		end if
	  end do

	  ! if the control matches one of the controls that we support then add it

	  if ( class .eq. CLS_BUTTON ) then  ! is it a button?
	    style = iand( style, 15 )  ! just keep the low 4 bits

		if (style .eq. BS_PUSHBUTTON .or. style .eq. BS_DEFPUSHBUTTON) then

		  dlg%NumControls = dlg%NumControls + 1
		  dlg % list(dlg%NumControls) % id = ctrlheader % id
		  dlg % list(dlg%NumControls) % control = ctrl_pushbutton
		  dlg % list(dlg%NumControls) % dirty = .true.

		  dlg % list(dlg%NumControls) % intsize = 0

		  dlg % list(dlg%NumControls) % logsize = 1
		  allocate( dlg % list(dlg%NumControls) % logvalue(1) )
		  dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled

		  dlg % list(dlg%NumControls) % charsize = 1
		  allocate( dlg % list(dlg%NumControls) % charvalue(1) )
		  dlg % list(dlg%NumControls) % charvalue(1) &
		          = ctrlheader % textname ! dlg_title

		  dlg % list(dlg%NumControls) % callbacksize = 1
		  allocate( dlg % list(dlg%NumControls) % callbackvalue(1) )
		  dlg % list(dlg%NumControls) % callbackvalue(1) &
		          = loc(DefaultPushbuttonCallback)

		else if (style .eq. BS_AUTOCHECKBOX) then
		  dlg%NumControls = dlg%NumControls + 1
		  dlg % list(dlg%NumControls) % id = ctrlheader % id
		  dlg % list(dlg%NumControls) % control = ctrl_checkbox
		  dlg % list(dlg%NumControls) % dirty = .true.

		  dlg % list(dlg%NumControls) % intsize = 0

		  dlg % list(dlg%NumControls) % logsize = 2
		  allocate( dlg % list(dlg%NumControls) % logvalue(2) )
		  dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled
		  dlg % list(dlg%NumControls) % logvalue(2) = .true. ! dlg_state

		  dlg % list(dlg%NumControls) % charsize = 1
		  allocate( dlg % list(dlg%NumControls) % charvalue(1) )
		  dlg % list(dlg%NumControls) % charvalue(1) &
		          = ctrlheader % textname ! dlg_title

		  dlg % list(dlg%NumControls) % callbacksize = 1
		  allocate( dlg % list(dlg%NumControls) % callbackvalue(1) )
		  dlg % list(dlg%NumControls) % callbackvalue(1) = loc(DefaultCallback)

		else if (style .eq. BS_AUTORADIOBUTTON .or. style .eq. BS_RADIOBUTTON .or. &
				style .eq. BS_AUTO3STATE .or. style .eq. BS_3STATE ) then
		  dlg%NumControls = dlg%NumControls + 1
		  dlg % list(dlg%NumControls) % id = ctrlheader % id
		  dlg % list(dlg%NumControls) % control = ctrl_radiobutton
		  dlg % list(dlg%NumControls) % dirty = .true.

		  dlg % list(dlg%NumControls) % intsize = 2
		  allocate( dlg % list(dlg%NumControls) % intvalue(2) )
		  ! do int initialization later

		  dlg % list(dlg%NumControls) % logsize = 2
		  allocate( dlg % list(dlg%NumControls) % logvalue(2) )
		  dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled
		  ! do dlg_state later
		  
		  dlg % list(dlg%NumControls) % charsize = 1
		  allocate( dlg % list(dlg%NumControls) % charvalue(1) )
		  dlg % list(dlg%NumControls) % charvalue(1) &
		          = ctrlheader % textname ! dlg_title

		  dlg % list(dlg%NumControls) % callbacksize = 1
		  allocate( dlg % list(dlg%NumControls) % callbackvalue(1) )
		  dlg % list(dlg%NumControls) % callbackvalue(1) &
		          = loc(DefaultCallback)

	      if ( idxFirstRadio .eq. 0) then
	        ! scan ahead counting radio buttons to next group control 
	        ! or last control
	        idxFirstRadio = i
		    idLastRadio = ctrlheader % id
	        dlgres2 = dlgres
		    do i2 = i, dlgheader % NumberOfItems
			  call DlgParseResControl( dlgres2, ctrlheader )
			  if ( iand(ctrlheader%Style,16#00020000) .eq. 16#00020000) exit
			  if (iand(ctrlheader%Style,15) .eq. 9) &
			    idLastRadio = ctrlheader % id
		    end do		    
		    dlg % list(dlg%NumControls) % logvalue(2) = .true. ! dlg_state
		  else
		    dlg % list(dlg%NumControls) % logvalue(2) = .false. ! dlg_state
		  end if

		  if ( idLastRadio .eq. dlg % list(dlg%NumControls) % id ) then
		    ! fill whole radio group with first and last index value
		    do i2 = idxFirstRadio, i
			  if (dlg % list(i2) % control .eq. ctrl_radiobutton) then
			    dlg % list(i2) % intvalue(1) = idxFirstRadio
			    dlg % list(i2) % intvalue(2) = i
			  end if
		    end do
		    idxFirstRadio = 0
		  end if

		else if (style .eq. BS_GROUPBOX ) then
		  dlg%NumControls = dlg%NumControls + 1
		  dlg % list(dlg%NumControls) % id = ctrlheader % id
		  dlg % list(dlg%NumControls) % control = ctrl_groupbox
		  dlg % list(dlg%NumControls) % dirty = .true.

		  dlg % list(dlg%NumControls) % intsize = 0

		  dlg % list(dlg%NumControls) % logsize = 1
		  allocate( dlg % list(dlg%NumControls) % logvalue(1) )
		  dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled

		  dlg % list(dlg%NumControls) % charsize = 1
		  allocate( dlg % list(dlg%NumControls) % charvalue(1) )
		  dlg % list(dlg%NumControls) % charvalue(1) &
		          = ctrlheader % textname ! dlg_title

		  dlg % list(dlg%NumControls) % callbacksize = 0

		else if ( style .eq. BS_OWNERDRAW ) then
		    call DlgBadStyle( ctrlheader%id, "BS_OWNERDRAW")
		else if ( style .eq. BS_USERBUTTON ) then
		    call DlgBadStyle( ctrlheader%id, "BS_USERBUTTON")
		else
		    call DlgBadStyle( ctrlheader%id, "<unknown>")
		end if
	  else if ( class .eq. CLS_STATIC ) then  ! is it a static control?
		  dlg%NumControls = dlg%NumControls + 1
		  dlg % list(dlg%NumControls) % id = ctrlheader % id
		  dlg % list(dlg%NumControls) % control = ctrl_statictext
		  dlg % list(dlg%NumControls) % dirty = .true.

		  dlg % list(dlg%NumControls) % intsize = 0

		  dlg % list(dlg%NumControls) % logsize = 1
		  allocate( dlg % list(dlg%NumControls) % logvalue(1) )
		  dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled

		  dlg % list(dlg%NumControls) % charsize = 1
		  allocate( dlg % list(dlg%NumControls) % charvalue(1) )
		  dlg % list(dlg%NumControls) % charvalue(1) &
		          = ctrlheader % textname ! dlg_title

		  dlg % list(dlg%NumControls) % callbacksize = 0

	  else if ( class .eq. CLS_EDIT ) then  ! is it an edit control?

		  if ( iand(ctrlheader%Style,ES_MULTILINE) .eq. ES_MULTILINE ) then
		    call DlgBadStyle( ctrlheader%id, "ES_MULTILINE")
		  endif

		  dlg%NumControls = dlg%NumControls + 1
		  dlg % list(dlg%NumControls) % id = ctrlheader % id
		  dlg % list(dlg%NumControls) % control = ctrl_edit
		  dlg % list(dlg%NumControls) % dirty = .true.

		  dlg % list(dlg%NumControls) % intsize = 0

		  dlg % list(dlg%NumControls) % logsize = 1
		  allocate( dlg % list(dlg%NumControls) % logvalue(1) )
		  dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled

		  dlg % list(dlg%NumControls) % charsize = 1
		  allocate( dlg % list(dlg%NumControls) % charvalue(1) )
		  dlg % list(dlg%NumControls) % charvalue(1) &
		          = ctrlheader % textname ! dlg_title

		  dlg % list(dlg%NumControls) % callbacksize = 2
		  allocate( dlg % list(dlg%NumControls) % callbackvalue(2) )
		  dlg % list(dlg%NumControls) % callbackvalue(1) &
		          = loc(DefaultCallback)
		  dlg % list(dlg%NumControls) % callbackvalue(2) &
		          = loc(DefaultCallback)

	  else if ( class .eq. CLS_LISTBOX) then  ! is it a list box control?

		  if ( iand(ctrlheader%Style,LBS_OWNERDRAWFIXED) .eq. LBS_OWNERDRAWFIXED ) then
		    call DlgBadStyle( ctrlheader%id, "LBS_OWNERDRAWFIXED")
		  else if ( iand(ctrlheader%Style,LBS_OWNERDRAWVARIABLE) .eq. LBS_OWNERDRAWVARIABLE ) then
		    call DlgBadStyle( ctrlheader%id, "LBS_OWNERDRAWVARIABLE")
		  endif

		  dlg%NumControls = dlg%NumControls + 1
		  dlg % list(dlg%NumControls) % id = ctrlheader % id
		  dlg % list(dlg%NumControls) % control = ctrl_listbox
		  dlg % list(dlg%NumControls) % dirty = .true.

          dlg % list(dlg%NumControls) % intsize = 2
		  allocate( dlg % list(dlg%NumControls) % intvalue(2) )
		  dlg % list(dlg%NumControls) % intvalue(1) = 0  !listbox is 0 length
		  dlg % list(dlg%NumControls) % intvalue(2) = 0  !no items are selected

          dlg % list(dlg%NumControls) % logsize = 1
		  allocate( dlg % list(dlg%NumControls) % logvalue(1) )
		  dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled

          dlg % list(dlg%NumControls) % charsize = 1
		  allocate( dlg % list(dlg%NumControls) % charvalue(1) )

          dlg % list(dlg%NumControls) % callbacksize = 2
		  allocate( dlg % list(dlg%NumControls) % callbackvalue(2) )
		  dlg % list(dlg%NumControls) % callbackvalue(1) &
		          = loc(DefaultCallback)
		  dlg % list(dlg%NumControls) % callbackvalue(2) &
		          = loc(DefaultCallback)

	  else if ( class .eq. CLS_COMBOBOX ) then  ! is it a combo box control?

		  if ( iand(ctrlheader%Style,CBS_OWNERDRAWFIXED) .ne. 0 ) then
		    call DlgBadStyle( ctrlheader%id, "CBS_OWNERDRAWFIXED")
		  else if ( iand(ctrlheader%Style,CBS_OWNERDRAWVARIABLE) .ne. 0 ) then
		    call DlgBadStyle( ctrlheader%id, "CBS_OWNERDRAWVARIABLE")
		  endif

		  if ( iand(ctrlheader%Style,3) .eq. CBS_DROPDOWNLIST) then
			! droplist combo
		    dlg%NumControls = dlg%NumControls + 1
		    dlg % list(dlg%NumControls) % id = ctrlheader % id
		    dlg % list(dlg%NumControls) % control = ctrl_droplist
		    dlg % list(dlg%NumControls) % dirty = .true.

		    dlg % list(dlg%NumControls) % intsize = 2
		    allocate( dlg % list(dlg%NumControls) % intvalue(2) )
		    dlg % list(dlg%NumControls) % intvalue(1) = 0  !listbox is 0 length
		    dlg % list(dlg%NumControls) % intvalue(2) = 0

            dlg % list(dlg%NumControls) % logsize = 1
		    allocate( dlg % list(dlg%NumControls) % logvalue(1) )
		    dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled

            dlg % list(dlg%NumControls) % charsize = 1
		    allocate( dlg % list(dlg%NumControls) % charvalue(1) )
			dlg % list(dlg%NumControls) % charvalue(1) = ""

            dlg % list(dlg%NumControls) % callbacksize = 2
		    allocate( dlg % list(dlg%NumControls) % callbackvalue(2) )
		    dlg % list(dlg%NumControls) % callbackvalue(1) &
		          = loc(DefaultCallback)
		    dlg % list(dlg%NumControls) % callbackvalue(2) &
		          = loc(DefaultCallback)
		  else
			! simple combo or dropdown combo
		    dlg%NumControls = dlg%NumControls + 1
		    dlg % list(dlg%NumControls) % id = ctrlheader % id
		    dlg % list(dlg%NumControls) % control = ctrl_combobox
		    dlg % list(dlg%NumControls) % dirty = .true.

		    dlg % list(dlg%NumControls) % intsize = 1
		    allocate( dlg % list(dlg%NumControls) % intvalue(1) )
		    dlg % list(dlg%NumControls) % intvalue(1) = 0  !listbox is 0 length

            dlg % list(dlg%NumControls) % logsize = 1
		    allocate( dlg % list(dlg%NumControls) % logvalue(1) )
		    dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled

            dlg % list(dlg%NumControls) % charsize = 1
		    allocate( dlg % list(dlg%NumControls) % charvalue(1) )
			dlg % list(dlg%NumControls) % charvalue(1) = ""

            dlg % list(dlg%NumControls) % callbacksize = 4
		    allocate( dlg % list(dlg%NumControls) % callbackvalue(4) )
		    dlg % list(dlg%NumControls) % callbackvalue(1) &
		          = loc(DefaultCallback)
		    dlg % list(dlg%NumControls) % callbackvalue(2) &
		          = loc(DefaultCallback)
		    dlg % list(dlg%NumControls) % callbackvalue(3) &
		          = loc(DefaultCallback)
		    dlg % list(dlg%NumControls) % callbackvalue(4) &
		          = loc(DefaultCallback)
		  endif

	  else if ( class .eq. CLS_SCROLLBAR ) then  ! is it a scroll bar control?
		  dlg%NumControls = dlg%NumControls + 1
		  dlg % list(dlg%NumControls) % id = ctrlheader % id
		  dlg % list(dlg%NumControls) % control = ctrl_scrollbar
		  dlg % list(dlg%NumControls) % dirty = .true.

		  dlg % list(dlg%NumControls) % intsize = 4
		  allocate( dlg % list(dlg%NumControls) % intvalue(4) )
		  dlg % list(dlg%NumControls) % intvalue(1) = 0
		  dlg % list(dlg%NumControls) % intvalue(2) = 100
		  dlg % list(dlg%NumControls) % intvalue(3) = 1
		  dlg % list(dlg%NumControls) % intvalue(4) = 10

		  dlg % list(dlg%NumControls) % logsize = 1
		  allocate( dlg % list(dlg%NumControls) % logvalue(1) )
		  dlg % list(dlg%NumControls) % logvalue(1) = .true. ! dlg_enabled

		  dlg % list(dlg%NumControls) % charsize = 0

		  dlg % list(dlg%NumControls) % callbacksize = 1
		  allocate( dlg % list(dlg%NumControls) % callbackvalue(1) )
		  dlg % list(dlg%NumControls) % callbackvalue(1) &
		          = loc(DefaultCallback)

	  end if

	end do

  end function DlgInit

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Id2Index
!!
!! Given the control id of a dialog, returns the index of 
!! that control in our dialog structure
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function Id2Index( dlg, id ) result (index)
  type (dialog), intent(in) :: dlg
  integer, intent(in) :: id
  integer index

	integer i

    ! TODO: binary search instead of linear

	do i = 1, dlg % NumControls
	  if ( dlg % list(i) % id .eq. id ) then
	    index = i
		return
	  end if
	end do

	index = 0

  end function Id2Index

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Data2Dialog
!!
!! Sets all values for a single control in the dialog box
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine Data2Dialog( dlg, index )
  type (dialog), intent(inout) :: dlg
  integer index

	logical dummyL
	integer dummyi, i
	integer hwndControl
	type (strpos) pos

    ! controls with duplicate ids are inaccessable
    if (dlg % list(index) % duplicate) return

	hwndControl = DlgID2Hwnd( dlg%hwnd, dlg % list(index) % id )

    select case (dlg % list(index) % control)
      case (ctrl_statictext)
	    call StrFor2C( dlg % list(index) % charvalue(1), pos )
	    dummyi = DlgSendMessage( hwndControl, WM_SETTEXT, &
	            0, loc(dlg % list(index) % charvalue(1)) )
	    call StrC2For( pos )
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
      case (ctrl_groupbox)
	    call StrFor2C( dlg % list(index) % charvalue(1), pos )
	    dummyi = DlgSendMessage( hwndControl, WM_SETTEXT, &
	            0, loc(dlg % list(index) % charvalue(1)) )
	    call StrC2For( pos )
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
      case (ctrl_pushbutton)
	    call StrFor2C( dlg % list(index) % charvalue(1), pos )
	    dummyi = DlgSendMessage( hwndControl, WM_SETTEXT, &
	            0, loc(dlg % list(index) % charvalue(1)) )
	    call StrC2For( pos )
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
      case (ctrl_checkbox)
	    call StrFor2C( dlg % list(index) % charvalue(1), pos )
	    dummyi = DlgSendMessage( hwndControl, WM_SETTEXT, &
	            0, loc(dlg % list(index) % charvalue(1)) )
	    call StrC2For( pos )
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
	    dummyi = DlgSendMessage( hwndControl, BM_SETCHECK, &
	            log2int( dlg % list(index) % logvalue(2) ), 0 )
      case (ctrl_radiobutton)
	    call StrFor2C( dlg % list(index) % charvalue(1), pos )
	    dummyi = DlgSendMessage( hwndControl, WM_SETTEXT, &
	            0, loc(dlg % list(index) % charvalue(1)) )
	    call StrC2For( pos )
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
	    dummyi = DlgSendMessage( hwndControl, BM_SETCHECK, &
	            log2int( dlg % list(index) % logvalue(2) ), 0 )
      case (ctrl_edit)
	    call StrFor2C( dlg % list(index) % charvalue(1), pos )
	    dummyi = DlgSendMessage( hwndControl, WM_SETTEXT, &
	            0, loc(dlg % list(index) % charvalue(1)) )
	    call StrC2For( pos )
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
      case (ctrl_scrollbar)
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
		dummyi = DlgSendMessage( hwndControl, SBM_SETRANGE, &
		        1, dlg % list(index) % intvalue(2) )
		dummyi = DlgSendMessage( hwndControl, SBM_SETPOS, &
		        dlg % list(index) % intvalue(1), 1 )
      case (ctrl_listbox)
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
		dummyi = DlgSendMessage( hwndControl, LB_RESETCONTENT, 0, 0 )
        do i = 2, dlg % list(index) % intvalue(1) + 1
	      call StrFor2C( dlg % list(index) % charvalue(i), pos )
		  dummyi = DlgSendMessage( hwndControl, LB_ADDSTRING, &
		          0, loc(dlg % list(index) % charvalue(i)) )
	      call StrC2For( pos )
		end do
        do i = 2, dlg % list(index) % intvalue(1) + 1
		  if (dlg % list(index) % intvalue(i) .eq. 0) then
		    exit
		  endif
		  dummyi = DlgSendMessage( hwndControl, LB_SETSEL, &
		          1, dlg % list(index) % intvalue(i) - 1 )
		end do
      case (ctrl_combobox)
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
		dummyi = DlgSendMessage( hwndControl, CB_RESETCONTENT, 0, 0 )
        do i = 2, dlg % list(index) % intvalue(1) + 1
	      call StrFor2C( dlg % list(index) % charvalue(i), pos )
		  dummyi = DlgSendMessage( hwndControl, CB_ADDSTRING, &
		          0, loc(dlg % list(index) % charvalue(i)) )
	      call StrC2For( pos )
		end do
	    call StrFor2C( dlg % list(index) % charvalue(1), pos )
	    dummyi = DlgSendMessage( hwndControl, WM_SETTEXT, &
	            0, loc(dlg % list(index) % charvalue(1)) )
	    call StrC2For( pos )
      case (ctrl_droplist)
		dummyL = DlgEnableWindow( hwndControl, dlg % list(index) % logvalue(1) )
		dummyi = DlgSendMessage( hwndControl, CB_RESETCONTENT, 0, 0 )
        do i = 2, dlg % list(index) % intvalue(1) + 1
	      call StrFor2C( dlg % list(index) % charvalue(i), pos )
		  dummyi = DlgSendMessage( hwndControl, CB_ADDSTRING, &
		          0, loc(dlg % list(index) % charvalue(i)) )
	      call StrC2For( pos )
		end do
	    dummyi = DlgSendMessage( hwndControl, CB_SETCURSEL, &
		          dlg % list(index) % intvalue(2) - 1, 0 )
      case default
!ms$if defined(DEBUG)
		stop "assert in module dialogm"
!ms$endif
    end select

  end subroutine Data2Dialog

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! Dialog2Data
!!
!! Gets all values of a single control from the dialog box
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine Dialog2Data( dlg, index )
  type (dialog), intent(inout) :: dlg
  integer index

	integer dummyi, i, i2
	integer hwndControl

    ! controls with duplicate ids are inaccessable
    if (dlg % list(index) % duplicate) return

	hwndControl = DlgID2Hwnd( dlg%hwnd, dlg % list(index) % id )

    select case (dlg % list(index) % control)
      case (ctrl_statictext)
	    dummyi = DlgSendMessage( hwndControl, WM_GETTEXT, &
	            STRSZ, loc(dlg % list(index) % charvalue(1)) )
	    call PadStrFor(dlg % list(index) % charvalue(1) )
		dlg % list(index) % logvalue(1) = DlgIsWindowEnabled( hwndControl )
      case (ctrl_groupbox)
	    dummyi = DlgSendMessage( hwndControl, WM_GETTEXT, &
	            STRSZ, loc(dlg % list(index) % charvalue(1)) )
	    call PadStrFor(dlg % list(index) % charvalue(1))
		dlg % list(index) % logvalue(1) = DlgIsWindowEnabled( hwndControl )
      case (ctrl_pushbutton)
	    dummyi = DlgSendMessage( hwndControl, WM_GETTEXT, &
	            STRSZ, loc(dlg % list(index) % charvalue(1)) )
	    call PadStrFor(dlg % list(index) % charvalue(1))
		dlg % list(index) % logvalue(1) = DlgIsWindowEnabled( hwndControl )
      case (ctrl_checkbox)
	    dummyi = DlgSendMessage( hwndControl, WM_GETTEXT, &
	            STRSZ, loc(dlg % list(index) % charvalue(1)) )
	    call PadStrFor(dlg % list(index) % charvalue(1))
		dlg % list(index) % logvalue(1) = DlgIsWindowEnabled( hwndControl )
	    if ( DlgSendMessage( hwndControl, BM_GETCHECK, 0, 0 ) .eq. 0 ) then
		  dlg % list(index) % logvalue(2) = .false.
		else
		  dlg % list(index) % logvalue(2) = .true.
		endif
      case (ctrl_radiobutton)
	    dummyi = DlgSendMessage( hwndControl, WM_GETTEXT, &
	            STRSZ, loc(dlg % list(index) % charvalue(1)) )
	    call PadStrFor(dlg % list(index) % charvalue(1))
		dlg % list(index) % logvalue(1) = DlgIsWindowEnabled( hwndControl )
	    if ( DlgSendMessage( hwndControl, BM_GETCHECK, 0, 0 ) .eq. 0 ) then
		  dlg % list(index) % logvalue(2) = .false.
		else
		  dlg % list(index) % logvalue(2) = .true.
		endif
      case (ctrl_edit)
	    dummyi = DlgSendMessage( hwndControl, WM_GETTEXT, &
	            STRSZ, loc(dlg % list(index) % charvalue(1)) )
	    call PadStrFor(dlg % list(index) % charvalue(1))
		dlg % list(index) % logvalue(1) = DlgIsWindowEnabled( hwndControl )
      case (ctrl_scrollbar)
		dlg % list(index) % logvalue(1) = DlgIsWindowEnabled( hwndControl )
	    dlg % list(index) % intvalue(1) = DlgSendMessage( hwndControl, SBM_GETPOS, 0, 0 )
	    dummyi = DlgSendMessage( hwndControl, SBM_GETRANGE, &
	            loc(dummyi), loc(dlg % list(index) % intvalue(2)) )
      case (ctrl_listbox)
	    do i = 2, dlg % list(index) % intvalue(1) + 1
	      dummyi = DlgSendMessage( hwndControl, LB_GETTEXT, &
	              i-2, loc(dlg % list(index) % charvalue(i)) )
	      call PadStrFor(dlg % list(index) % charvalue(i))
		end do
		i2 = 2
        do i = 0, dlg % list(index) % intvalue(1) - 1
		   dummyi = DlgSendMessage( hwndControl, LB_GETSEL, i, 0 )
		   if (dummyi .gt. 0) then
		     dlg % list(index) % intvalue(i2) = i+1
			 i2 = i2 + 1
		   endif
		end do
		dlg % list(index) % intvalue(i2) = 0
		if (dlg % list(index) % intvalue(2) .eq. 0) then
		  dlg % list(index) % charvalue(1) = ""
		else
	      dummyi = DlgSendMessage( hwndControl, LB_GETTEXT, &
	              dlg % list(index) % intvalue(2) - 1, &
	              loc(dlg % list(index) % charvalue(1)) )
	      call PadStrFor(dlg % list(index) % charvalue(1))
		endif
      case (ctrl_combobox)
	    do i = 2, dlg % list(index) % intvalue(1) + 1
	      dummyi = DlgSendMessage( hwndControl, CB_GETLBTEXT, &
	              i-2, loc(dlg % list(index) % charvalue(i)) )
	      call PadStrFor(dlg % list(index) % charvalue(i))
		end do
		if ( dlg % comboupdate ) then
	      dummyi = DlgSendMessage( hwndControl, WM_GETTEXT, &
	              STRSZ, loc(dlg % list(index) % charvalue(1)) )
	      call PadStrFor(dlg % list(index) % charvalue(1))
		else
		  i = DlgSendMessage( hwndControl, CB_GETCURSEL, 0, 0 )
          if ( i .eq. -1 ) i=0
		  dlg % list(index) % charvalue(1) = dlg % list(index) % charvalue(i+2)
		endif
      case (ctrl_droplist)
	    do i = 2, dlg % list(index) % intvalue(1) + 1
	      dummyi = DlgSendMessage( hwndControl, CB_GETLBTEXT, &
	              i-2, loc(dlg % list(index) % charvalue(i)) )
	      call PadStrFor(dlg % list(index) % charvalue(i))
		end do
		open( 15, file="output1.txt")
		i = DlgSendMessage( hwndControl, CB_GETCURSEL, 0, 0 )
        if ( i .eq. -1 ) i=0
		dlg % list(index) % charvalue(1) = dlg % list(index) % charvalue(i+2)
		dlg % list(index) % intvalue(2) = i+1
		close( 15 )
      case default
!ms$if defined(DEBUG)
		stop "assert in module dialogm"
!ms$endif
    end select

  end subroutine Dialog2Data

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgFlush
!!
!! Sets controls with any unwritten control data.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine DlgFlush( dlg )
  type (dialog), intent(inout) :: dlg
  
	integer i

    ! ignore callbacks caused by internal writes
    dlg % mutexflush = .true.

	if (dlg % dirty) then
	  dlg % dirty = .false.
	  do i = 1, dlg % NumControls
	    if (dlg % list(i) % dirty) then
          dlg % list(i) % dirty = .false.
	      call Data2Dialog( dlg, i )
		endif
	  end do
	endif
    
    dlg % mutexflush = .false.

  end subroutine DlgFlush

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgWmCommand
!!
!! Turns WM_COMMAND messages into appropriate callback calls
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgWmCommand ( dlg, id, code, hwndControl ) result (r)
  type (dialog), intent(inout) :: dlg
  integer, intent(in) :: id, code, hwndControl
  integer r

	integer i

    ! supress compiler warning
    i = hwndControl

	i = id2index( dlg, id )

	r = 0

    ! ignore unsupported controls
	if (i .eq. 0) return

    ! if the dialog is not running or if the message
	! was caused by our own write then don't call the 
	! callback
	if ( id .eq. 0 .or. dlg % mutexflush ) return

	select case (dlg % list(i) % control)
	case (ctrl_statictext)
	  ! no callbacks
	case (ctrl_groupbox)
	  ! no callbacks
	case (ctrl_pushbutton)
	  if ( code .eq. BN_CLICKED ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(1), &
		        dlg, id, dlg_clicked )
	    r = 1
      end if
	case (ctrl_checkbox)
	  if ( code .eq. BN_CLICKED ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(1), &
		        dlg, id, dlg_clicked )
        r = 1
      end if
	case (ctrl_radiobutton)
	  if ( code .eq. BN_CLICKED ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(1), &
		        dlg, id, dlg_clicked )
	    r = 1
      end if
	case (ctrl_edit)
	  if ( code .eq. EN_CHANGE ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(1), &
		        dlg, id, dlg_change )
	    r = 1
      else if (code .eq. EN_UPDATE ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(2), &
		        dlg, id, dlg_update )
	    r = 1
	  end if
	case (ctrl_listbox)
	  if ( code .eq. LBN_SELCHANGE ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(1), &
		        dlg, id, dlg_selchange )
	    r = 1
      else if (code .eq. LBN_DBLCLK ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(2), &
		        dlg, id, dlg_dblclick )
	    r = 1
	  end if
	case (ctrl_combobox)
	  if ( code .eq. CBN_SELCHANGE ) then
		dlg % comboupdate = .false.
		call DlgDoCallback( dlg % list(i) % callbackvalue(1), &
		        dlg, id, dlg_selchange )
		dlg % comboupdate = .true.
	    r = 1
	  else if (code .eq. CBN_DBLCLK ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(2), &
		        dlg, id, dlg_dblclick )
	    r = 1
	  else if ( code .eq. CBN_EDITCHANGE ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(3), &
		        dlg, id, dlg_change )
	    r = 1
      else if (code .eq. CBN_EDITUPDATE ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(4), &
		        dlg, id, dlg_update )
	    r = 1
      end if
	case (ctrl_droplist)
	  if ( code .eq. CBN_SELCHANGE ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(1), &
		        dlg, id, dlg_selchange )
	    r = 1
	  else if (code .eq. CBN_DBLCLK ) then
		call DlgDoCallback( dlg % list(i) % callbackvalue(2), &
		        dlg, id, dlg_dblclick )
	    r = 1
	  end if
	case default
!ms$if defined(DEBUG)
      stop "assert in module dialogm"
!ms$endif
	end select

	if (r .eq. 1) call DlgFlush( dlg )

  end function DlgWmCommand

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgWmScroll
!!
!! Turn scrollbar messages into appropriate callbacks
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine DlgWmScroll( dlg, hwndScroll, code, pos )
  type (dialog), intent(inout) :: dlg
  integer, intent(in) :: hwndScroll, code, pos

	integer i, id, dummyi

	id = DlgHwnd2Id(hwndScroll)

	i = Id2Index( dlg, id )

    ! ignore unsupported controls
	if (i .eq. 0) return

    if ( dlg % mutexflush ) return

	select case(code)
	case (SB_LINEUP)
	  dlg % list(i) % intvalue(1) &
	          = dlg % list(i) % intvalue(1) - dlg % list(i) % intvalue(3)
	case (SB_LINEDOWN)
	  dlg % list(i) % intvalue(1) &
	          = dlg % list(i) % intvalue(1) + dlg % list(i) % intvalue(3)
	case (SB_PAGEUP)
	  dlg % list(i) % intvalue(1) &
	          = dlg % list(i) % intvalue(1) - dlg % list(i) % intvalue(4)
	case (SB_PAGEDOWN)
	  dlg % list(i) % intvalue(1) &
	          = dlg % list(i) % intvalue(1) + dlg % list(i) % intvalue(4)
	case (SB_THUMBPOSITION)
	  dlg % list(i) % intvalue(1) = pos
	case (SB_THUMBTRACK)
	  dlg % list(i) % intvalue(1) = pos
	case (SB_TOP)
	  dlg % list(i) % intvalue(1) = 1
	case (SB_BOTTOM)
	  dlg % list(i) % intvalue(1) = dlg % list(i) % intvalue(2)
	case default
	  return
	end select

    ! position can never slide below 1
	if ( dlg % list(i) % intvalue(1) < 1 ) then
	  dlg % list(i) % intvalue(1) = 1
	end if

    ! position can never slide above maximum range
	if ( dlg % list(i) % intvalue(1) > dlg % list(i) % intvalue(2) ) then
	  dlg % list(i) % intvalue(1) = dlg % list(i) % intvalue(2)
	end if

	dummyi = DlgSendMessage( hwndScroll, SBM_SETPOS, dlg % list(i) % intvalue(1), 1 )

	call DlgDoCallback( dlg % list(i) % callbackvalue(1), dlg, id, dlg_change )

    call DlgFlush( dlg )

  end subroutine DlgWmScroll

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgProc
!!
!! This is the main dlgproc.  All dialog messages are handled here
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgProc ( hwnd, msg, wparam, lparam ) result (r)
  integer, intent(in) :: hwnd, msg, wparam, lparam
  integer r

	if (msg .eq. WM_INITDIALOG) then
	  g_dlg % hwnd = hwnd  ! required for DlgExit()	  
      call DlgFlush( g_dlg )
      call DlgDoCallback( g_dlg % dlginitcallback, g_dlg, g_dlg % dlgid, 0 )
	  r = 1

	else if (msg .eq. WM_COMMAND) then
	  r = DlgWmCommand( g_dlg, iand(wparam, 16#ffff), &
	  		iand(ishft(wparam,-16), 16#ffff), lparam )

	else if (msg .eq. WM_HSCROLL .or. msg .eq. WM_VSCROLL) then
	  call DlgWmScroll( g_dlg, lparam, iand(wparam, 16#ffff), &
	  		iand(ishft(wparam,-16), 16#ffff))
	  r = 1

	else
	  r = 0
	end if

  end function DlgProc

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgModal
!! PUBLIC ROUTINE
!!
!! Bring up a modal dialog
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgModal ( dlg ) result (r)
  !use msflib
  type (dialog), target, intent(inout) :: dlg
  integer r

	! TODO replace with 
    INTEGER*4 GETHWNDQQ, QWIN$FRAMEWINDOW
    PARAMETER (QWIN$FRAMEWINDOW = #80000000) 

    type (dialog), pointer :: dlgSave
	integer hwndParent

    ! save pointer to allow single thread re-entrancy
    dlgSave => g_dlg

	g_dlg => dlg  ! make dlg global for DlgProc

    if ( associated(dlgSave) ) then
	  ! we are in a nested dialog so the parent is the previous dialog
	  hwndParent = dlgSave % hwnd
	else
	  hwndParent = GetHwndQQ(QWIN$FRAMEWINDOW)
	end if

	if ( DlgDoModal ( dlg % dlgid, hwndParent, DlgProc ) .eq. -1 ) then
	  r = -1
	else
	  r = dlg % retval
	end if

    g_dlg => dlgSave

  end function DlgModal

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgSetReturn
!! PUBLIC ROUTINE
!!
!! Change the return value of a dialog (usually called from
!! within callbacks)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine DlgSetReturn ( dlg, retval )
  type (dialog), intent(inout) :: dlg
  integer retval

	dlg % retval = retval
	
  end subroutine DlgSetReturn

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgExit
!! PUBLIC ROUTINE
!!
!! Terminate the dialog.  Should only be called from 
!! within a callback.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine DlgExit( dlg )
  type (dialog), intent(inout) :: dlg

	integer i

	if (dlg % hwnd .eq. 0) then
		return
	end if

	! save data from controls
	do i = 1, dlg % NumControls
	  call Dialog2Data( dlg, i )
	end do

	call DlgEndDialog(dlg % hwnd,0)

	dlg % hwnd = 0

  end subroutine DlgExit

!ms$if defined(DEBUG)
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgDumpCtrl
!!
!! Displays the ControlType structure
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine DlgDumpCtrl ( unit, ctrl )
  integer unit
  type (ControlType), intent(inout) :: ctrl

    integer i

    write (unit,*) 'Control =',ctrl % control
    write (unit,*) 'Id =',ctrl % id
    write (unit,*) 'Dirty =',ctrl % dirty
    write (unit,*) 'Duplicate =',ctrl % duplicate
    write (unit,*) 'IntSize =',ctrl % intsize
    write (unit,'(1X,A15,\)') 'intvalues: '
    do i=1,ctrl % intsize
	  write (unit,'(1X,I5,\)') ctrl % intvalue(i)
	end do
	write (unit,'(/)')
    write (unit,*) 'LogSize =',ctrl % logsize
    write (unit,'(1X,A15,\)') 'logvalues: '
    do i=1,ctrl % logsize
	  write (unit,'(1X,L5,\)') ctrl % logvalue(i)
	end do
	write (unit,'(/)')
    write (unit,*) 'CharSize =',ctrl % charsize
    write (unit,'(1X,A15,\)') 'charvalues: '
    do i=1,ctrl % charsize
	  write (unit,'(1X,A15,\)') ctrl % charvalue(i)
	end do
	write (unit,'(/)')
    write (unit,*) 'CallBackSize =',ctrl % callbacksize
    write (unit,'(1X,A15,\)') 'callbackvalues: '
    do i=1,ctrl % callbacksize
	  write (unit,'(1X,I10,\)') ctrl % callbackvalue(i)
	end do
	write (unit,'(/)')

  end subroutine DlgDumpCtrl

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgDump
!!
!! Displays the dialog structure
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine DlgDump ( unit, dlg )
  integer unit
  type (dialog), intent(inout) :: dlg

    integer i

    write (unit,*) '--- dlg begin dump ---'    
    write (unit,*) 'DlgId =',dlg % dlgid
    write (unit,*) 'hwnd =',dlg % hwnd
    write (unit,*) 'retval =',dlg % retval
    write (unit,*) 'dirty =',dlg % dirty
    write (unit,*) 'mutexflush =',dlg % mutexflush
    write (unit,*) 'comboupdate =',dlg % comboupdate
    write (unit,*) 'numcontrols =',dlg % numcontrols
	do i=1,dlg % numcontrols
	  call DlgDumpCtrl( unit, dlg % list(i) )
	end do
    write (unit,*) '--- dlg end dump ---'    

  end subroutine DlgDump

!ms$endif

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgUninit
!! PUBLIC ROUTINE
!!
!! Free any allocated dialog resources.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine DlgUninit ( dlg )
  type (dialog), intent(inout) :: dlg

	integer i

	do i = 1, dlg % NumControls

	  if ( .not. dlg % list(i) % intsize .eq. 0 ) then
	    deallocate( dlg % list(i) % intvalue )
	  end if

	  if ( .not. dlg % list(i) % logsize .eq. 0 ) then
	    deallocate( dlg % list(i) % logvalue )
	  end if

	  if ( .not. dlg % list(i) % charsize .eq. 0 ) then
	    deallocate( dlg % list(i) % charvalue )
	  end if

	  if ( .not. dlg % list(i) % callbacksize .eq. 0 ) then
	    deallocate( dlg % list(i) % callbackvalue )
	  end if

	end do

	deallocate( dlg % list )

  end subroutine DlgUninit

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! ChangeComboboxItems
!!
!! Change the elements in a listbox or combobox to reflect
!! the new size.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine ChangeComboboxItems( control, newsize )
  type (ControlType), intent(inout) :: control
  integer, intent(in) :: newsize !number of elements in new listbox

    !note: selections are lost when the size of the list has changed

	character*(STRSZ), pointer, dimension(:) :: charvalue
	integer i, lesser

    ! assert that control is of type listbox, combobox, or droplist
!ms$if defined(DEBUG)
    if (control%control .ne. ctrl_listbox .and. &
	  control%control .ne. ctrl_combobox .and. &
	  control%control .ne. ctrl_droplist) then
      stop "assert in module dialogm"
	endif
!ms$endif

    allocate( charvalue(newsize+1) )
    lesser = min( newsize+1, control%charsize )

    charvalue(1) = ""
    do i = 2, lesser
      charvalue(i) = control % charvalue(i)
	enddo
	do i = lesser+1, newsize+1
	  charvalue(i) = ""
	end do

	deallocate( control%charvalue )
	allocate( control%charvalue(newsize+1) )
	control % charsize = newsize+1

    do i = 1, control % charsize
	  control % charvalue(i) = charvalue(i)
	end do

  end subroutine ChangeComboboxItems

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! ChangeListboxItems
!!
!! Changes the size of a listbox.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive subroutine ChangeListboxItems( control, newsize )
  type (ControlType), intent(inout) :: control
  integer, intent(in) :: newsize !number of elements in new listbox

    ! assert that control is of type listbox
!ms$if defined(DEBUG)
    if (control%control .ne. ctrl_listbox) then
      stop "assert in module dialogm"
	endif
!ms$endif

    call ChangeComboBoxItems( control, newsize )

    deallocate( control%intvalue )
    control%intsize = newsize+2
	allocate( control%intvalue(newsize+2) )
	control%intvalue(1) = newsize
	control%intvalue(2) = 0

  end subroutine ChangeListboxItems

  !!! Control routines !!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgSetInt
!! PUBLIC ROUTINE
!!
!! Sets integer values of dialog controls.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgSetInt( dlg, controlid, value, index ) result (r)
  type (dialog), intent(inout) :: dlg
  integer, intent(in) :: controlid
  integer, intent(in) :: value
  integer, optional, intent(in) :: index
  logical r

	integer i, idx

	if ( present(index) ) then
	  idx = index
	else
	  idx = dlg_default
	end if

	i = id2index( dlg, controlid )

    ! ignore unsupported controls
	if (i .eq. 0) then 
	  r = .false.
	  return
	end if

    ! controls with duplicate ids are inaccessable
    if (dlg % list(i) % duplicate) then
	  r = .false.
	  return
	end if

	if (.not. (dlg % hwnd .eq. 0) .and. .not. dlg % list(i) % dirty) then
	  call Dialog2Data( dlg, i )
	end if

	select case (dlg % list(i) % control)
	case (ctrl_statictext)
	  r = .false.
	case (ctrl_groupbox)
	  r = .false.
	case (ctrl_pushbutton)
	  r = .false.
	case (ctrl_checkbox)
	  r = .false.
	case (ctrl_radiobutton)
      r = .false.
	case (ctrl_edit)
	  r = .false.
	case (ctrl_scrollbar)
	  if ( idx .eq. dlg_position .or. idx .eq. dlg_default) then
	    dlg % list(i) % intvalue(1) = value
	    r = .true.
	  else if ( idx .eq. dlg_range ) then
	    dlg % list(i) % intvalue(2) = value
	    r = .true.
	  else if ( idx .eq. dlg_smallstep ) then
	    dlg % list(i) % intvalue(3) = value
	    r = .true.
	  else if ( idx .eq. dlg_bigstep ) then
	    dlg % list(i) % intvalue(4) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_listbox)
	  if (idx .eq. dlg_numitems .or. idx .eq. dlg_default) then
	    call ChangeListboxItems( dlg % list(i), value)
		r = .true.
	  else if (idx>0 .and. idx <= dlg % list(i) % intvalue(1)) then
	    dlg % list(i) % intvalue(idx+1) = value
	    r = .true.
	  else
	    r = .false.
	  endif
	case (ctrl_combobox)
	  if (idx .eq. dlg_numitems .or. idx .eq. dlg_default) then
	    call ChangeComboboxItems( dlg % list(i), value)
	    dlg % list(i) % intvalue(1) = value
		r = .true.
	  else
	    r = .false.
	  endif
	case (ctrl_droplist)
	  if (idx .eq. dlg_numitems .or. idx .eq. dlg_default) then
	    call ChangeComboboxItems( dlg % list(i), value)
	    dlg % list(i) % intvalue(1) = value
		r = .true.
	  else if (idx .eq. dlg_state) then
	    dlg % list(i) % intvalue(2) = value
	    r = .true.
	  else
	    r = .false.
	  endif
	case default
!ms$if defined(DEBUG)
      stop "assert in module dialogm"
!ms$endif
	end select

	if (.not. (dlg % hwnd .eq. 0)) then
	  dlg % dirty = .true.
	  dlg % list(i) % dirty = .true.
	end if

  end function DlgSetInt

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgSetLog
!! PUBLIC ROUTINE
!!
!! Sets logical values of dialog controls.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgSetLog( dlg, controlid, value, index ) result (r)
  type (dialog), intent(inout) :: dlg
  integer, intent(in) :: controlid
  logical, intent(in) :: value
  integer, optional, intent(in) :: index
  logical r

	integer i, i2, idx

	if ( present(index) ) then
	  idx = index
	else
	  idx = dlg_default
	end if

	i = id2index( dlg, controlid )

    ! ignore unsupported controls
	if (i .eq. 0) then 
	  r = .false.
	  return
	end if

    ! controls with duplicate ids are inaccessable
    if (dlg % list(i) % duplicate) then
	  r = .false.
	  return
	end if

	if (.not. (dlg % hwnd .eq. 0) .and. .not. dlg % list(i) % dirty) then
	  call Dialog2Data( dlg, i )
	end if

	select case (dlg % list(i) % control)
	case (ctrl_statictext)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_groupbox)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_pushbutton)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_checkbox)
	  if ( idx .eq. dlg_state .or. idx .eq. dlg_default) then
	    dlg % list(i) % logvalue(2) = value
		r = .true.
	  else if ( idx .eq. dlg_enable ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
		r = .false.
	  end if
	case (ctrl_radiobutton)
	  if ( idx .eq. dlg_state .or. idx .eq. dlg_default) then
	    ! set all buttons in the group to false
	    do i2 = dlg % list(i) % intvalue(1), dlg % list(i) % intvalue(2)
	      if ( dlg % list(i2) % control .eq. ctrl_radiobutton ) then
	        dlg % list(i2) % logvalue(2) = .false.
	      end if
	    end do
	    if ( value ) then
	      dlg % list(i) % logvalue(2) = .true.
	    else
	      dlg % list(dlg % list(i) % intvalue(1)) % logvalue(2) = .true.
	    end if
		r = .true.
	  else if ( idx .eq. dlg_enable ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
		r = .false.
	  end if
	case (ctrl_edit)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_scrollbar)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_listbox)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_combobox)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_droplist)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    dlg % list(i) % logvalue(1) = value
		r = .true.
	  else
	    r = .false.
	  end if
	case default
!ms$if defined(DEBUG)
      stop "assert in module dialogm"
!ms$endif
	end select

	if (.not. (dlg % hwnd .eq. 0) .and. r) then
	  dlg % dirty = .true.
	  dlg % list(i) % dirty = .true.
	end if

  end function DlgSetLog

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgSetChar
!! PUBLIC ROUTINE
!!
!! Sets character values of dialog controls.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgSetChar( dlg, controlid, value, index ) result (r)
  type (dialog), intent(inout) :: dlg
  integer, intent(in) :: controlid
  character*(*), intent(in) :: value
  integer, optional, intent(in) :: index
  logical r

	integer i, idx

	if ( present(index) ) then
	  idx = index
	else
	  idx = dlg_default
	end if

	i = id2index( dlg, controlid )

    ! ignore unsupported controls
	if (i .eq. 0) then 
	  r = .false.
	  return
	end if

    ! controls with duplicate ids are inaccessable
    if (dlg % list(i) % duplicate) then
	  r = .false.
	  return
	end if

	if (.not. (dlg % hwnd .eq. 0) .and. .not. dlg % list(i) % dirty) then
	  call Dialog2Data( dlg, i )
	end if

	select case (dlg % list(i) % control)
	case (ctrl_statictext)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    dlg % list(i) % charvalue(1) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_groupbox)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    dlg % list(i) % charvalue(1) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	  r = .false.
	case (ctrl_pushbutton)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    dlg % list(i) % charvalue(1) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_checkbox)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    dlg % list(i) % charvalue(1) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_radiobutton)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    dlg % list(i) % charvalue(1) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_edit)
	  if ( idx .eq. dlg_state .or. idx .eq. dlg_default ) then
	    dlg % list(i) % charvalue(1) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_scrollbar)
	  r = .false.
	case (ctrl_listbox)
	  if ( idx >= 1 .and. idx <= dlg % list(i) % intvalue(1) ) then
	    dlg % list(i) % charvalue(idx+1) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_combobox)
	  if ( idx .eq. dlg_default .or. idx .eq. dlg_state) then
	    dlg % list(i) % charvalue(1) = value
	  else if ( idx >= 1 .and. idx <= dlg % list(i) % intvalue(1) ) then
	    dlg % list(i) % charvalue(idx+1) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	case (ctrl_droplist)
	  if ( idx >= 1 .and. idx <= dlg % list(i) % intvalue(1) ) then
	    dlg % list(i) % charvalue(idx+1) = value
	    r = .true.
	  else
	    r = .false.
	  end if
	case default
!ms$if defined(DEBUG)
      stop "assert in module dialogm"
!ms$endif
	end select

	if (.not. (dlg % hwnd .eq. 0)) then
	  dlg % dirty = .true.
	  dlg % list(i) % dirty = .true.
	end if

  end function DlgSetChar

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgSetSub
!! PUBLIC ROUTINE
!!
!! Sets callback values of dialog controls.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgSetSub( dlg, controlid, value, index ) result (r)
  type (dialog), intent(inout) :: dlg
  integer, intent(in) :: controlid
  external value
  integer, optional, intent(in) :: index
  logical r

	integer i, idx

	if ( present(index) ) then
	  idx = index
	else
	  idx = dlg_default
	end if

	i = id2index( dlg, controlid )

    ! ignore unsupported controls
	if (i .eq. 0) then
	  if (controlid .eq. dlg % dlgid) then
	    dlg % dlginitcallback = loc(value)
	    r = .true.
		return
	  else
	    r = .false.
	    return
	  endif
	end if

    ! controls with duplicate ids are inaccessable
    if (dlg % list(i) % duplicate) then
	  r = .false.
	  return
	end if

	r = .false.

	! don't let the user change these from within a dlgproc
	!
	if (.not. dlg % hwnd .eq. 0) then
	  return
	end if

	select case (dlg % list(i) % control)
	case (ctrl_statictext)
	case (ctrl_groupbox)
	case (ctrl_pushbutton)
	  if ( idx .eq. dlg_clicked .or. idx .eq. dlg_default ) then
	    dlg % list(i) % callbackvalue(1) = loc(value)
		r = .true.
	  end if
	case (ctrl_checkbox)
	  if ( idx .eq. dlg_clicked .or. idx .eq. dlg_default ) then
	    dlg % list(i) % callbackvalue(1) = loc(value)
		r = .true.
	  end if
	case (ctrl_radiobutton)
	  if ( idx .eq. dlg_clicked .or. idx .eq. dlg_default ) then
	    dlg % list(i) % callbackvalue(1) = loc(value)
		r = .true.
	  end if
	case (ctrl_edit)
	  if ( idx .eq. dlg_change .or. idx .eq. dlg_default ) then
	    dlg % list(i) % callbackvalue(1) = loc(value)
		r = .true.
	  else if (idx .eq. dlg_update) then
	    dlg % list(i) % callbackvalue(2) = loc(value)
		r = .true.
	  end if
	case (ctrl_scrollbar)
	  if ( idx .eq. dlg_change .or. idx .eq. dlg_default ) then
	    dlg % list(i) % callbackvalue(1) = loc(value)
		r = .true.
	  end if
	case (ctrl_listbox)
	  if ( idx .eq. dlg_selchange .or. idx .eq. dlg_default ) then
	    dlg % list(i) % callbackvalue(1) = loc(value)
		r = .true.
	  else if (idx .eq. dlg_dblclick) then
	    dlg % list(i) % callbackvalue(2) = loc(value)
		r = .true.
	  end if
	case (ctrl_combobox)
	  if ( idx .eq. dlg_selchange .or. idx .eq. dlg_default ) then
	    dlg % list(i) % callbackvalue(1) = loc(value)
		r = .true.
	  else if (idx .eq. dlg_dblclick) then
	    dlg % list(i) % callbackvalue(2) = loc(value)
		r = .true.
	  else if (idx .eq. dlg_update) then
	    dlg % list(i) % callbackvalue(3) = loc(value)
		r = .true.
	  else if (idx .eq. dlg_change) then
	    dlg % list(i) % callbackvalue(4) = loc(value)
		r = .true.
	  end if
	case (ctrl_droplist)
	  if ( idx .eq. dlg_selchange .or. idx .eq. dlg_default ) then
	    dlg % list(i) % callbackvalue(1) = loc(value)
		r = .true.
	  else if (idx .eq. dlg_dblclick) then
	    dlg % list(i) % callbackvalue(2) = loc(value)
		r = .true.
	  end if
	case default
!ms$if defined(DEBUG)
      stop "assert in module dialogm"
!ms$endif
	end select

  end function DlgSetSub

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgGetInt
!! PUBLIC ROUTINE
!!
!! Gets an integer value from a dialog control
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgGetInt( dlg, controlid, value, index ) result (r)
  type (dialog), intent(inout) :: dlg
  integer, intent(in) :: controlid
  integer, intent(out) :: value
  integer, optional, intent(in) :: index
  logical r

	integer i, idx

	if ( present(index) ) then
	  idx = index
	else
	  idx = dlg_default
	end if

	i = id2index( dlg, controlid )

    ! ignore unsupported controls
	if (i .eq. 0) then 
	  r = .false.
	  return
	end if

    ! controls with duplicate ids are inaccessable
    if (dlg % list(i) % duplicate) then
	  r = .false.
	  return
	end if

	if (.not. dlg % hwnd .eq. 0 .and. .not. dlg % list(i) % dirty) then
	  call Dialog2Data( dlg, i )
	end if

	r = .false.

	select case (dlg % list(i) % control)
	case (ctrl_statictext)

	case (ctrl_groupbox)

	case (ctrl_pushbutton)

	case (ctrl_checkbox)

	case (ctrl_radiobutton)

	case (ctrl_edit)

	case (ctrl_scrollbar)
	  if ( idx .eq. dlg_position .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % intvalue(1)
	    r = .true.
	  else if ( idx .eq. dlg_range ) then
	    value = dlg % list(i) % intvalue(2)
	    r = .true.
	  else if ( idx .eq. dlg_smallstep ) then
	    value = dlg % list(i) % intvalue(3)
	    r = .true.
	  else if ( idx .eq. dlg_bigstep ) then
	    value = dlg % list(i) % intvalue(4)
	    r = .true.
	  end if
	case (ctrl_listbox)
	  if ( idx .eq. dlg_numitems .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % intvalue(1)
	    r = .true.
	  else if ( idx >= 1 .and. idx <= dlg % list(i) % intvalue(1) ) then
	    value = dlg % list(i) % intvalue(idx+1)
		r = .true.
	  else if ( idx >= 1 ) then
	    value = 0
		r = .true.
	  else
	    r = .false.
	  endif
	case (ctrl_combobox)
	  if ( idx .eq. dlg_numitems .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % intvalue(1)
	    r = .true.
	  else
	    r = .false.
	  endif
	case (ctrl_droplist)
	  if ( idx .eq. dlg_numitems .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % intvalue(1)
	    r = .true.
	  else if ( idx .eq. dlg_state ) then
	    value = dlg % list(i) % intvalue(2)
	    r = .true.
	  else
	    r = .false.
	  endif
	case default
!ms$if defined(DEBUG)
      stop "assert in module dialogm"
!ms$endif
	end select

  end function DlgGetInt

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgGetLog
!! PUBLIC ROUTINE
!!
!! Gets a logical value from a dialog control.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgGetLog( dlg, controlid, value, index ) result (r)
  type (dialog), intent(inout) :: dlg
  integer, intent(in) :: controlid
  logical, intent(out) :: value
  integer, optional, intent(in) :: index
  logical r

	integer i, idx

	if ( present(index) ) then
	  idx = index
	else
	  idx = dlg_default
	end if

	i = id2index( dlg, controlid )

    ! ignore unsupported controls
	if (i .eq. 0) then 
	  r = .false.
	  return
	end if

    ! controls with duplicate ids are inaccessable
    if (dlg % list(i) % duplicate) then
	  r = .false.
	  return
	end if

	if (.not. (dlg % hwnd .eq. 0) .and. .not. dlg % list(i) % dirty) then
	  call Dialog2Data( dlg, i )
	end if

	r = .false.

	select case (dlg % list(i) % control)
	case (ctrl_statictext)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case (ctrl_groupbox)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case (ctrl_pushbutton)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case (ctrl_checkbox)
	  if ( idx .eq. dlg_state .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(2)
		r = .true.
	  else if ( idx .eq. dlg_enable ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case (ctrl_radiobutton)
	  if ( idx .eq. dlg_state .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(2)
		r = .true.
	  else if ( idx .eq. dlg_enable ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case (ctrl_edit)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case (ctrl_scrollbar)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case (ctrl_listbox)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case (ctrl_combobox)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case (ctrl_droplist)
	  if ( idx .eq. dlg_enable .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % logvalue(1)
		r = .true.
	  end if
	case default
!ms$if defined(DEBUG)
      stop "assert in module dialogm"
!ms$endif
	end select

  end function DlgGetLog

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! DlgGetChar
!! PUBLIC ROUTINE
!!
!! Gets a character value from a dialog control.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  recursive function DlgGetChar( dlg, controlid, value, index ) result (r)
  type (dialog), intent(inout) :: dlg
  integer, intent(in) :: controlid
  character*(*), intent(out) :: value
  integer, optional, intent(in) :: index
  logical r

	integer i, idx

	if ( present(index) ) then
	  idx = index
	else
	  idx = dlg_default
	end if

	i = id2index( dlg, controlid )

    ! ignore unsupported controls
	if (i .eq. 0) then 
	  r = .false.
	  return
	end if

    ! controls with duplicate ids are inaccessable
    if (dlg % list(i) % duplicate) then
	  r = .false.
	  return
	end if

	if (.not. (dlg % hwnd .eq. 0) .and. .not. dlg % list(i) % dirty) then
	  call Dialog2Data( dlg, i )
	end if

	r = .false.

	select case (dlg % list(i) % control)
	case (ctrl_statictext)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % charvalue(1)
	    r = .true.
	  end if
	case (ctrl_groupbox)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % charvalue(1)
	    r = .true.
	  end if
	  r = .false.
	case (ctrl_pushbutton)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % charvalue(1)
	    r = .true.
	  end if
	case (ctrl_checkbox)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % charvalue(1)
	    r = .true.
	  end if
	case (ctrl_radiobutton)
	  if ( idx .eq. dlg_title .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % charvalue(1)
	    r = .true.
	  end if
	case (ctrl_edit)
	  if ( idx .eq. dlg_state .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % charvalue(1)
	    r = .true.
	  end if
	case (ctrl_scrollbar)
	  r = .false.
	case (ctrl_listbox)
	  if ( idx .eq. dlg_state .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % charvalue(1)
	    r = .true.
	  else if ( idx>=1 .and. idx<= dlg % list(i) % intvalue(1) ) then
	    value = dlg % list(i) % charvalue(idx+1)
	    r = .true.
	  end if
	case (ctrl_combobox)
	  if ( idx .eq. dlg_state .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % charvalue(1)
	    r = .true.
	  else if ( idx>=1 .and. idx<= dlg % list(i) % intvalue(1) ) then
	    value = dlg % list(i) % charvalue(idx+1)
	    r = .true.
	  end if
	case (ctrl_droplist)
	  if ( idx .eq. dlg_state .or. idx .eq. dlg_default ) then
	    value = dlg % list(i) % charvalue(1)
	    r = .true.
	  else if ( idx>=1 .and. idx<= dlg % list(i) % intvalue(1) ) then
	    value = dlg % list(i) % charvalue(idx+1)
	    r = .true.
	  end if
	case default
!ms$if defined(DEBUG)
      stop "assert in module dialogm"
!ms$endif
	end select

  end function DlgGetChar

  ! NOTE: DlgGetSub does not make sense since an external value
  ! cannot be reassigned so this function is not implemented.

end module dialogm
