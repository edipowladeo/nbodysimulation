!**********************************************************************
!
! POKER -- Video Poker in Fortran 90 with QuickWin
!
! Copyright (C) 1995 Microsoft Corporation, All Rights Reserved.
!

!======================================================================
!
! Module Subclass		(Windows tricks with the Poker window)
!

module subclass

use msflib
use msfwin
implicit none

private
public SubClassInit

integer(4) FrameProc, ChildProc

contains

subroutine SubclassInit()
integer i, j
logical l

FrameProc = SetWindowLong( GetHWndQQ(QWIN$FRAMEWINDOW), &
			   GWL_WNDPROC, loc(SubclassFrame) )
j = GetWindowLong( GetHWndQQ(QWIN$FRAMEWINDOW), GWL_STYLE )
j = ior( iand( j, not(WS_THICKFRAME) ), WS_BORDER )
j = iand( j, not(WS_MAXIMIZEBOX) )
i = SetWindowLong( GetHWndQQ(QWIN$FRAMEWINDOW), GWL_STYLE, j )	    

l = SetWindowText( GetHwndQQ(QWIN$FRAMEWINDOW), &
		    "Microsoft Fortran PowerStation Video Poker"C )

ChildProc = SetWindowLong( GetHWndQQ(0), &
			   GWL_WNDPROC, loc(SubclassChild) )
j = GetWindowLong( GetHWndQQ(0), GWL_STYLE )
j = ior( iand( j, not(WS_CAPTION.or.WS_THICKFRAME.or.WS_SYSMENU) ), WS_BORDER )
i = SetWindowLong( GetHWndQQ(0), GWL_STYLE, j )	    

l = MoveWindow( GetHWndQQ(0), -1, -1, 500, 400, .TRUE. )

end subroutine

integer(4) function SubclassFrame( Hwnd, Msg, wParam, lParam )
!ms$attributes stdcall :: SubclassFrame
use pokerregistry
automatic
integer(4) Hwnd, Msg, wParam, lParam

if( Msg == WM_CLOSE ) then
	call SaveRegistry()	
end if
SubclassFrame = CallWindowProc( FrameProc, Hwnd, Msg, wParam, lParam )
end function

integer(4) function SubclassChild( Hwnd, Msg, wParam, lParam )
use layout
!ms$attributes stdcall :: SubclassChild
automatic
integer(4) Hwnd, Msg, wParam, lParam
integer i, newmsg

if( Msg == WM_CHAR ) then
	SubclassChild = 0
	return
else if( Msg == WM_KEYDOWN .or. Msg == WM_KEYUP ) then
	select case( Msg )
		case( WM_KEYDOWN ); newmsg = WM_LBUTTONDOWN
		case( WM_KEYUP );   newmsg = WM_LBUTTONUP
	end select
	if( wParam >= ichar('1') .and. wParam <= ichar('5') ) then
		i = CallWindowProc( ChildProc, Hwnd, newmsg, 0, &
				    ishl(cardy(wParam-ichar('0'))+1,16) .or. &
				    cardx(wParam-ichar('0'))+1 )
	    	SubclassChild = 0
		return
	else if( wParam == VK_RETURN ) then
	    if( Msg /= WM_CHAR ) &
		i = CallWindowProc( ChildProc, Hwnd, newmsg, 0, &
				    ishl(DealButtonY+1,16) .or. &
				    DealButtonX+1 )
	    	SubclassChild = 0
	    	return
	end if
end if
SubclassChild = CallWindowProc( ChildProc, Hwnd, Msg, wParam, lParam )
end function

end module

	
