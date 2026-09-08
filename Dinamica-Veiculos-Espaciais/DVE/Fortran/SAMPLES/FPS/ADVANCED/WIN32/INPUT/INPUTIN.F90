module inputin

interface 
integer function InitApplication(hInstance) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitApplication@4' :: InitApplication
integer         hInstance
end function InitApplication
end interface

interface 
integer function InitInstance(hInstance,nCmdShow) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitInstance@8' :: InitInstance 
integer         hInstance
integer         nCmdShow
end function InitInstance
end interface

interface 
integer function  MainWndProc(hWnd,messsage,wParam,lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer     hWnd
integer     messsage 
integer     wParam 
integer     lParam 
end function MainWndProc
end interface

interface 
integer function  About(hDlg,messsage,wParam,lParam) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About 
integer     hDlg 
integer     messsage 
integer     wParam 
integer     lParam 
end function About
end interface


interface 
subroutine dummy (hwnd, uMsg, idEvent, dwTime)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_dummy@16' :: dummy
integer hwnd
integer uMsg
integer idEvent
integer dwTime
end subroutine 
end interface

end module
