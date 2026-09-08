module worldfnc

interface 
integer function MainWndProc( hwnd, mesg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer hwnd 
integer mesg 
integer wParam
integer lParam 
end function MainWndProc
end interface


interface 
integer function AboutDlgProc( hwnd, mesg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AboutDlgProc@16' :: AboutDlgProc
integer  hwnd
integer mesg 
integer wParam 
integer lParam 
end function AboutDlgProc
end interface 


interface 
integer function ScaleDlgProc( hwnd, mesg, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ScaleDlgProc@16' :: ScaleDlgProc
integer  hwnd 
integer mesg 
integer wParam 
integer lParam 
end function ScaleDlgProc
end interface

interface 
subroutine SetUnityXform
end subroutine SetUnityXform
end interface

interface 
integer function OpenMetaFl (hwnd)
integer hwnd
end function OpenMetaFl
end interface
 
end module

