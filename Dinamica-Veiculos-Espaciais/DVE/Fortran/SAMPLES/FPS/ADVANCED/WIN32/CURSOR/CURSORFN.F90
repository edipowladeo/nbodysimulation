module cursorfn
interface 
integer function MainWndProc(hWnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer hWnd
integer message
integer wParam
integer lParam
end function MainWndProc
end interface

interface 
integer function  About(hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL , ALIAS : '_About@16' :: About
integer hDlg
integer message 
integer wParam 
integer lParam 
end function About
end interface

interface 
integer function sieve()
end function
end interface 
end module
