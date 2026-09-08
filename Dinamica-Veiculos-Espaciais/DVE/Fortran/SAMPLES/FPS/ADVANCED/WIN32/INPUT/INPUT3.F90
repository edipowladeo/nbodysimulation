!****************************************************************************
!
!    FUNCTION:  InitInstance(HANDLE, int)
!
!    PURPOSE:  Saves instance handle and creates main window
!
!****************************************************************************

integer*4 function InitInstance(hInstance, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitInstance@8' :: InitInstance 
use inputgl
interface 

integer function InitApplication(hInstance) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitApplication@4' :: InitApplication
integer         hInstance
end function InitApplication
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
integer  hInstance, nCmdShow


integer              hWnd
character*100        lpszClassName

 

   hInst = hInstance

   lpszClassName = "InputWClass"C
   hWnd = CreateWindowEx(0,&
        lpszClassName,&
        "Input Sample Application"C,&
        IOR(INT(WS_OVERLAPPEDWINDOW) , IOR(INT(WS_HSCROLL) ,INT( WS_VSCROLL))),&  !/* horz & vert scroll bars */
        CW_USEDEFAULT,&
        CW_USEDEFAULT,&
        CW_USEDEFAULT, &
        CW_USEDEFAULT,  &
        NULL,&
        NULL,&
        hInstance,&
        NULL)

   if (hWnd == 0) then
      ierror = GetLastError ();
      InitInstance = FALSE
      return
   end if
   i = ShowWindow(hWnd, nCmdShow)
   i = UpdateWindow(hWnd)
   InitInstance = TRUE

end 

subroutine dummy(hwnd, uMsg, idEvent, dwTime)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_dummy@16' :: dummy
integer*4 hwnd, uMsg, idEvent, dwTime
   hwnd    = hwnd
   uMsg    = uMsg
   idEvent = idEvent
   dwTime  = dwTime

   return
end 

