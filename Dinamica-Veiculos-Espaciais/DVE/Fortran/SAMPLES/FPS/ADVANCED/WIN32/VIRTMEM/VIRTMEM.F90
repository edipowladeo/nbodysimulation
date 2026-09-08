 
!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/

!/*************************************************************************\
!*  PROGRAM: Virtmem.f90
!*
!*  PURPOSE:
!*
!*     To demonstrate the use of various virtual memory API.
!*
!*  FUNCTIONS:
!*
!*    WinMain()      - Initializes the window, and process the message loop.
!*    MainWndProc()  - Process messages, launches server & client threads.
!*    ResetMenu()    - Looks at the memory page and checks the menu items
!*                     accordingly.
!*    ShowDlgProc()  - Shows information regarding the virtual page.
!*
!*  GLOBAL VARIABLES:
!*
!*    - Buf, Buf2:
!*             Character arrays used for error messages.
!*
!*    - base:  Pointer to CHAR, used as a pointer to the base of the page.
!*    - hInst: Handle to the application's Instance.
!*    - hWnd:  Handle to the parent window.
!*    - MemInfo:
!*             Structure used to hold the page's memory information.
!*
!*  COMMENTS:
!*
!*    To Use:
!*      Start the application.  You are automatically given a Reserved page
!*      of memory with no access (4096 bytes in size).  You can then use
!*      the various menu selection to change the state and protection on
!*      the page.  "State" allows you to change the page between Free,
!*      Reserved, and Committed.  "Access" allows you to change the
!*      protection on the page between Read/Write, Read Only, or No Access.
!*      Lock allows you to Lock or Unlock the page in memory (note that
!*      this was not yet implemented in PDK-2).  Test trys to write to
!*      memory.  If the page is not committed, and is marked with read/
!*      write access, this will cause an exception.  There is an example
!*      of exception handling in the code.
!*
!*      The menu will keep track of the state and protection access
!*      to the page, and the menu items will be checked accordingly.
!*      For more information on the page, you can select "Show Page"
!*      from the menu.  A dialog box will appear showing you the page
!*      information.  You can dismiss the dialog box through its system
!*      menu.
!*
!\*************************************************************************/

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

!/*************************************************************************\
!*
!*  FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!*
!*  PURPOSE: calls initialization function, processes message loop
!*
!*  COMMENTS:
!*
!\*************************************************************************/
integer*4 function WinMain (hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use vmeminc
integer*4   hInstance, hPrevInstance,  lpCmdLine, nCmdShow

interface 
integer(4) function MainWndProc (hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function
end interface 

type(T_MSG)      mesg
type(T_WNDCLASS) wc
integer*4   ret
logical(4)  bret
character*100  lpszClassName, lpszMenuName, lpszAppName


hPrevInstance =  hPrevInstance
lpCmdLine = lpCmdLine

hInst = hInstance
lpszMenuName ="Virtmem_Menu"C
lpszClassName ="VirtmemWClass"C

wc%style = 0
wc%lpfnWndProc = LOC(MainWndProc)
wc%cbClsExtra = 0
wc%cbWndExtra = 0
wc%hInstance = hInstance
wc%hIcon = LoadIcon (NULL, IDI_APPLICATION)
wc%hCursor = LoadCursor (NULL, IDC_ARROW)
wc%hbrBackground = GetStockObject (WHITE_BRUSH)
wc%lpszMenuName = LOC(lpszMenuName)
wc%lpszClassName = LOC(lpszClassName)

ret = RegisterClass(wc)

lpszAppName = "Virtual Memory Sample"C
hWind = CreateWindow (                                             &
                  lpszClassName,                          &
          "Virtual Memory Sample"C,      &
                  INT4(WS_OVERLAPPEDWINDOW),                      &
                  CW_USEDEFAULT,                                  &
                  CW_USEDEFAULT,                                  &
                  CW_USEDEFAULT,                                  &
                  CW_USEDEFAULT,                                  &
                  NULL,                                           &
                  NULL,                                           &
                  hInstance,                                      &
                  NULL)

bret = ShowWindow(hWind, nCmdShow)
do while (GetMessage (mesg, NULL, 0, 0))
    ret = DispatchMessage (mesg)      !// Dispatch message to window.
end do

WinMain = mesg%wParam           !// Returns value from PostQuitMessage.
return
end 

!/*************************************************************************\
!*
!*  FUNCTION:  MainWndProc (HWND, UINT, UINT, LONG)
!*
!*  PURPOSE:   To process the windows messages.
!*
!*  VARIABLES USED:
!*
!*    - Buf[]: Array of CHAR, error message buffer.
!*    - retCode:
!*             DWORD used to trap return codes.
!*    - oldProtection:
!*             DWORD used to hold the old protection value returned from
!*             VirtualProtect() call.
!*    - page:  Array of CHAR, used as a base pointer to the page.
!*    - ExceptError[]:
!*             Array of CHAR, used to be printed as an error message string.
!*    - ExceptSuccess[]:
!*             Array of CHAR, used to be printed an a success message string.
!*
!*  MESSAGES:
!*
!*    WM_DESTROY:     - Terminates the threads and post the quit message.
!*    WM_CREATE:      - Allocates memory to hold some color values, and
!*                      creates the two threads.
!*    WM_USER:        - Used to delay the message to reset the menu until
!*                      the window is created.
!*
!*    WM_COMMAND
!*
!*      IDM_LOCK:
!*               Uses VirtualLock() to lock the page into memory (preventing
!*               it from being paged out.
!*
!*      IDM_UNLOCK:
!*               Unlocks the page from memory allowing it to be paged out
!*               by the system.
!*
!*      IDM_WRITE:
!*               Attempts to write to the page.  This message uses structured
!*               exception handling and tries to write to offset 100 in the
!*               page.  If there is an exception (usually due to the memory
!*               not being committed, or not having the proper read/write
!*               access), then the exception is handled by putting up a message
!*               box.  If no exception is trapped, a success message is
!*               put up.
!*
!*      IDM_SHOW:
!*               Puts up a dialog box which gives information about the current
!*               state of the page (See comments on ShowDlgProc);
!*
!*      IDM_NOACCESS:
!*               Uses VirtualProtect() to change the protection on the page
!*               to PAGE_NOACCESS.  Note a page must be committed before
!*               changing its protection.
!*
!*      IDM_READONLY:
!*               Uses VirtualProtect() to change the protection on the page to
!*               PAGE_READONLY.  Note a page must be committed before changing
!*               its protection.
!*
!*      IDM_READWRITE:
!*               Uses VirtualProtect() to change the protection on the page to
!*               PAGE_READWRITE.  Note a page must be committed before
!*               changing its protection.
!*
!*      IDM_COMMIT:
!*               Uses VirtualAlloc() to commit the page.  Note that if the
!*               page has been previously RESERVED with VirtualAlloc, then
!*               you can use a pointer to the base of the memory as the first
!*               parameter of the call.  If the page is FREE rather than
!*               RESERVED, then you use NULL as the first parameter.
!*
!*      IDM_FREE:
!*               Uses VirtualFree() to commit the page.  Note that a committed
!*               page must first be decommitted before it can be freed.
!*
!*      IDM_RESERVE:
!*               If the page is FREE, this uses VirtualAlloc() reserve it.
!*               If the page is committed, this uses VirtualFree() to
!*               decommit the page.
!*
!*  CALLED BY:
!*
!*    WinMain();
!*
!*  CALLS TO:
!*
!*    ResetMenu();
!*    ShowDlgProc();
!*
!*  COMMENTS:
!*
!*
!\*************************************************************************/

integer function MainWndProc (hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use vmeminc
integer*4   hwnd, message, wParam, lParam
external WERR

interface
integer(4) function ShowDlgProc (hDlg, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ShowDlgProc@16' :: ShowDlgProc
integer*4   hDlg 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function ShowDlgProc
end interface


integer*4   retCode
integer*4   oldProtection
integer*4   page1
character*200  ExceptError
character*100  ExceptSuccess, lpszMessage, lpszHeader

data ExceptError /"An exception was trapped and handled with this &
message box. Make sure the page is commited and that you have Read&
/Write access."C/

data ExceptSuccess /"Writing to memory was successful: base(100) =&
'a'"C/


ExceptError = ExceptError
select case (message)

    case (WM_CREATE)

        base = VirtualAlloc (NULL, PAGESIZE, MEM_RESERVE, PAGE_NOACCESS)

        if (base == 0) then
            call WERR ("VirtualAlloc", "WM_CREATE")
        end if

        ret = PostMessage (hwnd, WM_USER, 0, 0)

        MainWndProc = 0
        return
                             
    case (WM_USER)
        call ResetMenu()
        MainWndProc = 0
        return

    case (WM_COMMAND)
        select case (INT4(LoWord(wParam)))
        

!$ if defined (IMPLEMENTED)
            case (IDM_LOCK)

                ret = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)
                if (MemInfo%State .NE. MEM_COMMIT) then
                    ret =MessageBox (                             &
                         hWind,                                   &
                        "Stop!  You must first COMMIT a page before locking it."C, &
                        "From IDM_LOCK"C,                                           &
                         MB_OK)
                    MainWndProc = 0
                    return
                end if

                retCode = VirtualLock(base, PAGESIZE)
                if (retCode == 0) then
                    ret = MessageBox(hWind,                       &
                            "Error in locking memory"C,      &
                            "From within IDM_LOCK"C, MB_OK)
                else
                    ret = MessageBox(hWind,                       &
                            "The Memory was Locked."C,       &
                            "From within IDM_LOCK"C, MB_OK)
                end if

                MainWndProc = 0
                return
            
            case (IDM_UNLOCK)

                retCode = VirtualUnlock(base, PAGESIZE)
                if (retCode == 0) then
                    ret = MessageBox(hWind,                       &
                            "Error in unlocking memory"C,    &
                            "From within IDM_UNLOCK"C, MB_OK)
                else
                    ret = MessageBox(hWind,                       &
                            "The Memory was Unlocked."C,     &
                            "From within IDM_UNLOCK"C, MB_OK)
                end if
                MainWndProc = 0
                return

!$ endif
            case (IDM_WRITE)
                !__except
                !This cannot be used through FORTRAN as it does not
                !support exception handling
                !An exception will occur if the Page is not committed
                ! and there is no  Read/Write access
                call CopyMemory (base+100, LOC("a"C), 1)
                ret = MessageBox (hWind, ExceptSuccess,      &
                            "try/except"C, MB_OK)
                MainWndProc = 0
                return


            case (IDM_SHOW)
                ret = DialogBox (hInst, LOC("Page_Info"C), hwnd, LOC(ShowDlgProc))
                MainWndProc = 0
                return


            case (IDM_NOACCESS)

                retCode = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)
                if (retCode == 0) then
                    call WERR("VirtualQuery", "IDM_NOACCESS")
                    MainWndProc = 0
                    return
                end if

                if (MemInfo%State .NE. MEM_COMMIT) then
                    ret =MessageBox ( hWind,                      &
                         "The page must be commited first."C,&
                         "From IDM_NOACCESS"C, MB_OK)
                    MainWndProc = 0
                    return
                end if

                retCode = VirtualProtect (base, PAGESIZE,         &
                               PAGE_NOACCESS, LOC(oldProtection))
                if (retCode == 0) then
                    call WERR("VirtualProtect","IDM_NOACCESS")
                end if

                call ResetMenu()
                MainWndProc = 0
                return


            case (IDM_READONLY)
                retCode = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)
                if (retCode == 0) then
                    call WERR("VirtualQuery", "IDM_READONLY")
                    MainWndProc = 0
                    return
                end if

                if (MemInfo%State .NE. MEM_COMMIT) then
                    ret =MessageBox ( hWind,                      &
                         "The page must be commited first."C,&
                         "From IDM_READONLY"C, MB_OK)
                    MainWndProc = 0
                    return
                end if

                retCode = VirtualProtect (base, PAGESIZE,         &
                               PAGE_READONLY, LOC(oldProtection))
                if (retCode == 0) then
                    call WERR("VirtualProtect", "IDM_READONLY")
                end if

                call ResetMenu()
                MainWndProc = 0
                return


            case (IDM_READWRITE)
                retCode = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)
                if (retCode == 0) then
                    call WERR("VirtualQuery", "IDM_READWRITE")
                    MainWndProc = 0
                    return
                end if

                if (MemInfo%State .NE. MEM_COMMIT) then           
                    ret =MessageBox ( hWind,                      &
                         "The page must be commited first."C,&
                         "From IDM_READWRITE"C, MB_OK)
                MainWndProc = 0
                return
                end if

                retCode = VirtualProtect (base, PAGESIZE,         &
                              PAGE_READWRITE, LOC(oldProtection))
                if (retCode == 0) then
                    lpszMessage ="VirtualProtect"
                    lpszHeader ="IDM_READWRITE"
                    call WERR("VirtualProtect","IDM_READWRITE")
                end if

                call ResetMenu()
                MainWndProc = 0
                return

            case (IDM_COMMIT)

                ret = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)

                select case (MemInfo%State)
                    case (MEM_COMMIT)
                        MainWndProc = 0
                        return

                    case (MEM_RESERVE)
                        page1 = VirtualAlloc (base, PAGESIZE,     &
                                            MEM_COMMIT,           &
                                            PAGE_READWRITE)

                        if (page1 .NE. 0) then
                            call ResetMenu()
                        else
                           call WERR("VirtualAlloc", "IDM_COMMIT")
                        end if

                    case (MEM_FREE)
                        base = VirtualAlloc (NULL, PAGESIZE,      &
                                            MEM_COMMIT,           &
                                            PAGE_READWRITE)
                        if (base .NE. 0) then
                            call ResetMenu()
                        else
                           call WERR("VirtualAlloc", "IDM_COMMIT")
                        end if
                end select

                call ResetMenu()
                MainWndProc = 0
                return

            case (IDM_FREE)

                ret = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)

                if (MemInfo%State == MEM_COMMIT) then
                    retCode = VirtualFree(base, PAGESIZE, MEM_DECOMMIT)
                    if (retCode == 0) then
                        call WERR("VirtualFree","IDM_FREE")
                    end if
                end if

                ret = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)

                if (MemInfo%State == MEM_RESERVE) then
                    retCode = VirtualFree(base, 0, MEM_RELEASE)
                    if (retCode == 0) then
                        call WERR("VirtualFree", "IDM_FREE")
                    end if
                end if

                call ResetMenu()
                MainWndProc = 0
                return

            case (IDM_RESERVE)

                ret = VirtualQuery (base, MemInfo, SIZE_MEM_BASIC_INFO)

                select case (MemInfo%State)
                    case (MEM_RESERVE)
                        MainWndProc = 0
                        return


                    case (MEM_FREE)
                        base = VirtualAlloc(NULL, PAGESIZE,       &
                                MEM_RESERVE, PAGE_NOACCESS)
                        if (base == 0) then
                           call WERR("VirtualAlloc","IDM_RESERVE")
                        end if

                        call ResetMenu()
                        MainWndProc = 0
                        return

                    case (MEM_COMMIT)
                        retCode = VirtualFree(base, PAGESIZE,     &
                                        MEM_DECOMMIT)

                        if (retCode == 0) then
                            call WERR("VirtualFree","IDM_RESERVE")
                        end if

                        call ResetMenu()
                        MainWndProc = 0
                        return

                    case DEFAULT
                        ret = MessageBox(hWind,                   &
                                "Unknown MemInfo.State"C,    &
                                "From IDM_RESERVE"C, MB_OK)

                end select
                MainWndProc = 0
                return

            case DEFAULT
                MainWndProc = 0
                return
        end select

    case (WM_DESTROY)
        call PostQuitMessage(0)
        MainWndProc = 0
        return
end select
MainWndProc = DefWindowProc (hwnd, message, wParam, lParam)
return
end 

