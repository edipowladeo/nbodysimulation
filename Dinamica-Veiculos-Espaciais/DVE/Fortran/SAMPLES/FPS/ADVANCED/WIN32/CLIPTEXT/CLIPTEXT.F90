!/****************************************************************************
!
!    PROGRAM: Cliptext.f90
!
!    PURPOSE: Demonstrates copying text to and from the clipboard
!
!    FUNCTIONS:
!
!        WinMain() - calls initialization function, processes message loop
!        InitApplication() - initializes window data and registers window
!        InitInstance() - saves instance handle and creates main window
!        MainWndProc() - processes messages
!        About() - processes messages for "About" dialog box
!        OutOfMemory() - displays warning message
!
!****************************************************************************/
interface
integer(4) function WinMain (hInstance, hPrevInstance, lpszCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
integer(4) hInstance
integer(4) hPrevInstance
integer(4) lpszCmdLine
integer(4) nCmdShow
end function WinMain
end interface
end

!/****************************************************************************
!
!    FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!
!    PURPOSE: calls initialization function, processes message loop
!
!****************************************************************************/

integer*4 function WinMain( hInstance, hPrevInstance, lpCmdLine, nCmdShow )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin
use clipinc
include 'cliptext.fi'

integer             hInstance, hPrevInstance, nCmdShow
integer(4)          lpCmdLine 
type(T_MSG)           message
type (T_WNDCLASS)     wc
integer*4           ret
integer*4           dLen    
integer*4           lpStringPtr     
integer*4           lpszText
character*400       szInitialClientAreaText

szInitialClientAreaText =                                         &
"This program demonstrates the use of the Edit menu to copy and   &
paste text to and from the clipboard.  Try using the Copy command & 
to move this text to the clipboard, and the Paste command to repla&
ce this text with data from another application." // char(13) //  &
char(13) // "You might want to try running Notepad and Clipbrd alongside &
this application so that you can watch the data exchanges take place.  "C


    lpcmdline = lpcmdline

    hText = NULL
    if (hPrevInstance == 0) then
        wc%style            = 0
        wc%lpfnWndProc      = LOC(MainWndProc)
        wc%cbClsExtra       = 0
        wc%cbWndExtra       = 0
        wc%hInstance        = hInstance
        wc%hIcon            = LoadIcon(NULL, IDI_APPLICATION)
        wc%hCursor          = LoadCursor(NULL, IDC_ARROW)
        wc%hbrBackground    = GetStockObject(WHITE_BRUSH) 
        wc%lpszMenuName     =  LOC("CliptextMenu"C)
        wc%lpszClassName    = LOC("CliptextWClass"C)
    
        if (RegisterClass (wc) == 0 ) then
            WinMain = FALSE
            return
        end if
    end if

hInst = hInstance

    hAccTable = LoadAccelerators(hInst, LOC("ClipTextAcc"C))
    hText = GlobalAlloc(GMEM_MOVEABLE, len(szInitialClientAreaText))

    if (hText == 0) then
        call OutOf_Memory()
        !InitInstance = FALSE
    end if

    lpszText = GlobalLock(hText)
    if (lpszText == 0) then
        call OutOf_Memory()
        !InitInstance = FALSE
    end if

    dLen = lstrlen(szInitialClientAreaText)
    lpStringPtr = LOC(szInitialClientAreaText)
    call CopyMemory(lpszText,lpStringPtr,dLen)

    ret = GlobalUnlock(hText)

    hwind = CreateWindow(                                         &
      "CliptextWClass"C,                                          &
      "Cliptext Sample Application"C,                             &
      INT4(WS_OVERLAPPEDWINDOW),                                  &
      CW_USEDEFAULT,                                              &
      CW_USEDEFAULT,                                              &
      CW_USEDEFAULT,                                              &
      CW_USEDEFAULT,                                              &
      NULL,                                                       &
      NULL,                                                       &
      hInstance,                                                  &
      NULL                                                        &
    )                                                             

    if (hwind == 0) then
        WinMain = FALSE
        return
    end if

    bret = ShowWindow(hwind, nCmdShow)
    bret = UpdateWindow(hwind)

    do while (GetMessage(message, NULL, 0, 0))
!/* Only translate message if it is not an accelerator message */
    if (TranslateAccelerator(hwind, hAccTable, message) .EQ. 0)  then
          bret = TranslateMessage (message)
          ret = DispatchMessage (message)
    end if
end do
WinMain = message%wParam
return
end 


