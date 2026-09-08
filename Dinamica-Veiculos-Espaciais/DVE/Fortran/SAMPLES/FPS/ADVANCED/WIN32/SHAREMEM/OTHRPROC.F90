!*************************************************************************\
!*  PROGRAM: othrproc.F90
!*
!*  PURPOSE:
!*
!*    To assist in showing how to processes can share named shared memory.
!*
!*  GLOBAL VARIABLES:
!*
!*    HANDLE hInst:  - Instance handle.
!*
!*    HWND   hWnd:   - Client window handle.
!*
!*    HWND   hWndDlg:- Window handle to upper dialog box.
!*
!*    HANDLE hMapObject:
!*                   - Handle to the file mapping object.
!*
!*    LONG *MapView: - Base address of the share memory.
!*
!*    CHAR Buf[80], Buf2[80]:
!*                   - Error buffers.
!*
!*
!*  FUNCTIONS:
!*
!*    WinMain()      - Initializes the window, and process the message loop.
!*    MainWndProc()  - To handle the messages to the main window.
!*    ReadProc()     - A thread which loops  reading the shared memory
!*                     and drawing a bitmap in a location indicated by
!*                     the values in the share memory.
!*
!*  COMMENTS:
!*
!*    Overview:
!*      This sample is meant to be run with the Sharemem sample.  This
!*      code basically reads the shared memory, and based on the values
!*      found there (an X and Y coordinate representing the mouse
!*      position in the window of the Sharemem sample), this code draws
!*      a bitmap in the same relative position.
!*
!*    To Use:
!*      Start the Sharemem sample first, and then this one.  Set the
!*      focus to this application, and then move the mouse in the window
!*      of the Sharemem application.  A bitmap will be drawn to represent
!*      the relative mouse position in the other application, and the
!*      mouse's X and Y coordinates will appear in the edit fields in
!*      the dialog box imposed on the top of the client space.
!*
!*************************************************************************/
interface
integer*4 function WinMain (hInstance,hPrevInstance,lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
integer*4 hInstance
integer*4 hPrevInstance
integer*4 lpCmdLine 
integer*4 nCmdShow
end function
end interface
end
!*************************************************************************
!*
!*  FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!*
!*  PURPOSE:  To initialize the window, and process the message loop.
!*
!*  COMMENTS: A fairly standard WinMain except that it creates a dialog
!*            box which is imposed on the upper part of the window.  This
!*            dialog box is used to show the mouse coordinates.
!*
!*************************************************************************

integer*4 function WinMain (hInstance,hPrevInstance,lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use msfwin
use otherinc

integer*4 hInstance, hPrevInstance, lpCmdLine, nCmdShow

interface 
integer(4) function MainWndProc (x, y, z, w)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4 x 
integer*4 y 
integer*4 z 
integer*4 w 
end function MainWndProc

end interface

type (T_MSG)  mesg 
type (T_WNDCLASS)  wc 
type (T_RECT)  rect1 
character*100  lpszClassName, lpszMenuName

hInst = hInstance 
hPrevInstance = hPrevInstance 
lpcmdline = lpcmdline

wc%style = 0                           ! Replaces CS_SIZEREDRAW.
wc%lpfnWndProc = LOC(MainWndProc)  ! The client window procedure.
wc%cbClsExtra = 0                      ! No room reserved for extra data.
wc%cbWndExtra = 0 
wc%hInstance = hInstance 
wc%hIcon = LoadIcon (NULL, IDI_APPLICATION) 
wc%hCursor = LoadCursor (NULL, IDC_ARROW) 
wc%hbrBackground = GetStockObject (WHITE_BRUSH) 
lpszMenuName = ""C
wc%lpszMenuName = LOC(lpszMenuNAme) 
lpszCLassName = "OthrProcWClass"C
wc%lpszClassName = LOC(lpszClassName) 

i = RegisterClass(wc)

hWnd1 = CreateWindowEx (0, lpszClassName,                &
                  "Other Procedure"C,                        &
                  INT4(WS_OVERLAPPEDWINDOW),                      &
                  CW_USEDEFAULT,                                  &
                  CW_USEDEFAULT,                                  &
                  CW_USEDEFAULT,                                  &
                  CW_USEDEFAULT,                                  &
                  NULL,                                           &
                  NULL,                                           &
                  hInstance,                                      &
                  NULL) 


bret = ShowWindow  (hWnd1, nCmdShow) 

hWndDlg = CreateDialogParam(hInst,LOC("StatusDlg"C),hWnd1,NULL,0) 

ret = GetClientRect (hWnd1, rect1) 
i = SendMessage (hWnd1, WM_SIZE, 0, (rect1%right - rect1%left)) 
bret = ShowWindow  (hWndDlg,  SW_SHOW) 

do while (GetMessage (mesg, NULL, 0, 0))
   if (IsDialogMessage (hWndDlg, mesg) .EQV. .FALSE.) then
      i = DispatchMessage (mesg)    ! Dispatch message to window.
   end if
end do

WinMain = mesg%wParam            ! Returns value from PostQuitMessage.
return 

end 

!*************************************************************************\
!*
!*  FUNCTION:  MainWndProc (HWND, UINT, UINT, LONG)
!*
!*  PURPOSE:   To process messages.  To open and gain access to the shared
!*             memory.
!*
!*  VARIABLES USED:
!*
!*    - ThreadID:
!*             DWORD, used in the CreateThread call.
!*
!*  MESSAGES:
!*
!*    WM_DESTROY      - Cleans up handles and destroys the window.
!*    WM_SIZE         - Sizes the dialog box to the client window.
!*    WM_CREATE       - First it opens the shared memory using
!*                      CreateFileMapping().  It then gets an address to
!*                      the shared memory by using MapViewOfFile().
!*                      If both calls were successful, this code then
!*                      creates a thread which continually reads the
!*                      shared memory and draws the bitmap.
!*
!*  CALLED BY:
!*
!*    WinMain() 
!*
!*  CALLS TO:
!*
!*    ReadProc() 
!*
!*************************************************************************/

integer(4) function MainWndProc (hwnd,message,wParam,lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use msfwin
use otherinc
integer*4 hwnd,message,wParam,lParam

interface
subroutine ReadProc()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadProc@0' :: ReadProc
end subroutine ReadProc
end interface

integer*4   ThreadID 
INTEGER*4   hMapObject
SAVE        hMapObject
integer*4   hMutex
SAVE        hMutex

select case (message)
   case (WM_CREATE)
 
      hMapObject = OpenFileMapping (FILE_MAP_READ,.FALSE.,"shared_memory"C) 
      if (hMapObject == 0) then
         call PostQuitMessage (0) 
         MainWndProc = 0
         return 
      end if

      MapView = MapViewOfFile (hMapObject, FILE_MAP_READ, 0, 0, 0) 
      if (MapView == 0) then
         i = MessageBox (hwnd, "ERROR: MapViewOfFile was not successful."C, &
                 "From within WM_CREATE"C, MB_OK) 
         ierror = GetLastError ()
         call PostQuitMessage (0) 
         MainWndProc = 0
         return 
      end if
      
      NULLIFY(NULL_SECURITY_ATTRIBUTES)
      hThread = CreateThread(NULL_SECURITY_ATTRIBUTES, &
                 0,                &
                 LOC(ReadProc),        &
                 NULL,             &
                 0,                &
                 LOC(ThreadID)) 
      if (hThread == 0) then
         call PostQuitMessage(0) 
      end if

      MainWndProc = 0
      return 

   case (WM_SIZE)
      i = SetWindowPos (hWndDlg, NULL, 0,0, INT4(LOWORD(lParam)), DIALOGHEIGHT, 0)                                             
      MainWndProc = 0
      return 
   
   case (WM_DESTROY)
       i = CloseHandle (hMutex)
      i = CloseHandle (hMapObject) 
      i = CloseHandle (hThread) 
      call PostQuitMessage (0) 
      i = EndDialog(hWndDlg, 0) 
      MainWndProc = 0
      return 
end select 
MainWndProc = DefWindowProc (hwnd, message, wParam, lParam) 
return 
end 

