 
!***************************************************************************\
!* InitializeApp
!***************************************************************************/

integer*4 function InitializeApp()
use thrdinc
use msfwin

interface
integer(4) function MainWndProc (hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function 

integer function ThreadWndProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ThreadWndProc@16' :: ThreadWndProc
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function 
end interface

type (T_WNDCLASS)     wc
integer*4            i
integer(4)          ret
character*100     lpszClassName, lpszMenuName, lpszIconName, lpszAppName


call seed(51537)



aclr(1) =   #00000000       !// black                                      
aclr(2) =   #007F0000       !// red                                        
aclr(3) =   #00007F00       !// green                                      
aclr(4) =   #007F7F00       !// mustard/brown                              
aclr(5) =   #0000007F       !// blue                                       
aclr(6) =   #007F007F       !// magenta                                    
aclr(7) =   #00007F7F       !// cyan                                       
aclr(8) =   #00BFBFBF       !// light gray                                 
aclr(9) =   #007F7F7F       !// dark gray                                  
aclr(10) =   #00FF0000      !// bright red                                 
aclr(11) =   #0000FF00      !// bright green                               
aclr(12) =   #00FFFF00      !// bright yellow                              
aclr(13) =   #000000FF      !// bright blue                                
aclr(14) =   #00FF00FF      !// bright magenta                             
aclr(15) =   #0000FFFF      !// bright cyan                                
aclr(16) =   #00FFFFFF      !// bright white                               

do i = 1, CCOLORS
    gahbrColor(i) = CreateSolidBrush(aclr(i))
end do

ghbrWhite = CreateSolidBrush(#00FFFFFF)
ghbrBlack = CreateSolidBrush(#00000000)

lpszIconNAme = "APPICON"C
lpszMenuName = "MainMenu"C
lpszClassName = "MltithrdClass"C

wc%style            = IOR(CS_OWNDC, IOR(CS_HREDRAW, CS_VREDRAW))
wc%lpfnWndProc      = LOC(MainWndProc)
wc%cbClsExtra       = 0
wc%cbWndExtra       = 4
wc%hInstance        = ghModule
wc%hIcon            = LoadIcon(wc%hInstance, LOC(lpszIconName))
wc%hCursor          = LoadCursor(NULL, IDC_ARROW)
wc%hbrBackground    = ghbrWhite
wc%lpszMenuName     = LOC(lpszMenuName)
wc%lpszClassName    = LOC(lpszClassName)

if (RegisterClass(wc) == 0) then
    ierror = GetLastError ()
    InitializeApp = 0
    return
end if

wc%style            = IOR(CS_OWNDC , IOR(CS_HREDRAW , CS_VREDRAW))
wc%lpfnWndProc      = LOC(ThreadWndProc)
wc%cbClsExtra       = 0
wc%cbWndExtra       = 0
wc%hInstance        = ghModule
wc%hIcon            = LoadIcon(ghModule,MakeIntResource(APPICON))
wc%hCursor          = LoadCursor(NULL, IDC_ARROW)
wc%hbrBackground    = ghbrWhite
wc%lpszMenuName     = NULL
lpszClassName = "ThreadClass"C
wc%lpszClassName    = LOC(lpszClassName)

if (RegisterClass(wc) == 0) then
    InitializeApp = 0
    return
end if

lpszMenuName = "MainMenu"C
hMenu = LoadMenu(ghModule, LOC(lpszMenuName))
hMenuWindow = GetSubMenu(hMenu, 1)

lpszClassName = "MltithrdClass"C
lpszAppName = "Mltithrd"C
ghwndMain = CreateWindowEx(                             &
                0,                                      &
                lpszClassName,                          &
                lpszAppName,                            &
                IOR(WS_OVERLAPPED, IOR( WS_CAPTION,     &
                IOR(WS_BORDER, IOR(WS_THICKFRAME,       &
                IOR(WS_MAXIMIZEBOX, IOR(WS_MINIMIZEBOX, &
                IOR(WS_CLIPCHILDREN, IOR(WS_VISIBLE, WS_SYSMENU)))))))), &
                80, 70, 400, 300,                                            &
                NULL, hMenu, ghModule, NULL)

if (ghwndMain == NULL) then
    InitializeApp = 0
    return
end if

ret = SetWindowLong(ghwndMain, GWL_USERDATA, 0)

ret = SetFocus(ghwndMain)    !/* set initial focus */

InitializeApp = 1
return
end


!***************************************************************************\
!* MainWndProc
!***************************************************************************/

integer*4 function MainWndProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use thrdinc
use msfwin
integer*4 hwnd, message, wParam, lParam

interface
integer(4) function About  (hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function 

recursive integer function StartBounce (pThrdBlkInfo)
!!MS$ATTRIBUTES STDCALL, ALIAS : '_StartBounce@4' :: StartBounce
!MS$ATTRIBUTES REFERENCE :: pThrdBlkInfo
integer*4   pThrdBlkInfo 
end function 
end interface


integer*4                       iCount
integer*4                       hwndClient
type (T_CLIENTCREATESTRUCT)     clientcreate
integer*4                       hwndChildWindow
integer*4                       hHead, hTmp
integer*4                       pHead
type (NODE)                     Head
type (NODE)                     Node1
integer*4                       hNode1, hHead1
integer*4                       hThrd1
integer*4                       pNode1
type (T_MDICREATESTRUCT)        mdicreate1


SAVE    iCount, hwndClient

data iCount /1/



select case (message) 
    case (WM_CREATE)
        ret = SetWindowLong(hwnd, 0, NULL)

        clientcreate%hWindowMenu  = hMenuWindow
        clientcreate%idFirstChild = 1
        hwndClient = CreateWindow(                              &
                            "MDICLIENT"C, ""C,                  &
                            IOR(WS_CHILD , IOR(WS_CLIPCHILDREN, &
                            WS_VISIBLE)), 0,0,0,0,              &
                            hwnd, NULL, ghModule,               &
                            LOC(clientcreate))

        MainWndProc = 0
        return

    case (WM_DESTROY)

        bKillMe = .TRUE.

        hHead = GetWindowLong(hwnd, 0)
        if (hHead .NE. 0) then
            pHead = LocalLock(hHead)
            if (pHead == NULL) then
                ret = MessageBox(ghwndMain,"Failed in LocalLock!"C,"Error"C, MB_OK)
            end if

            call CopyMemory (LOC(Head), pHead, SIZEOFNODE)
            do while (Head%hNext .NE. NULL) 
                hTmp = hHead
                hHead = Head%hNext
                ret = LocalUnlock(hTmp)

                if (LocalFree(hTmp) .NE. NULL) then
                    ret = MessageBox(ghwndMain,"Failed in LocalFree!"C,"Error"C, MB_OK)
                end if
                pHead = LocalLock(hHead)
                if (pHead == NULL) then
                    ret = MessageBox(ghwndMain,                   &
                            "Failed in LocalLock, hHead!"C,  &
                            "Error"C, MB_OK)
                end if
                call CopyMemory (LOC(Head), pHead, SIZEOFNODE)
            end do

            ret = LocalUnlock(hHead)

            if (LocalFree(hHead) .NE. NULL) then
                ret = MessageBox(ghwndMain,                       &
                        "LocalFree failed to free hHead!"C,  &
                        "Error"C, MB_OK)
            end if
        end if
        call PostQuitMessage(0)
        MainWndProc = 0
        return

!MS$IF DEFINED (LATER)
         case (WM_LBUTTONDOWN)
             call InitializeBoxes(TRUE, LOC(ThreadWindow))
!MS$ENDIF

    case (WM_COMMAND)

        select case (INT4(LoWord(wParam)) )
            case (IDM_TILE)
                ret = SendMessage(hwndClient, WM_MDITILE, 0, 0)
                MainWndProc = 0
                return
            case (IDM_CASCADE)
                ret = SendMessage(hwndClient, WM_MDICASCADE, 0, 0)
                MainWndProc = 0
                return
            case (IDM_ARRANGE)
                ret = SendMessage(hwndClient, WM_MDIICONARRANGE, 0, 0)
                MainWndProc = 0
                return

            case (MM_BOUNCE)
                call Sleep(500)
                hNode1 = LocalAlloc(LHND, SIZEOFNODE)
                if (hNode1 .NE. 0) then
                    pNode1 = LocalLock(hNode1)
                    if (pNode1 == NULL)  then
                        ret = MessageBox(ghwndMain,                     &
                                        "Failed in LocalLock, hNode!"C, &
                                        "Error"C, MB_OK)
                    end if
                    
                    call CopyMemory (LOC(Node1), pNode1, SIZEOFNODE)
                    
                    write(Node1%ThreadWindow%CaptionBarText, 100) iCount
100                 format ('Thread Window ', I5)

                    call CopyMemory (pNode1,LOC(Node1),SIZEOFNODE)

                    mdicreate1%szClass = LOC("ThreadClass"C)
                    mdicreate1%szTitle = LOC(Node1%ThreadWindow%CaptionBarText)
                    mdicreate1%hOwner  = ghModule
                    mdicreate1%x       = CW_USEDEFAULT
                    mdicreate1%y       = CW_USEDEFAULT
                    mdicreate1%cx      = CW_USEDEFAULT
                    mdicreate1%cy      = CW_USEDEFAULT
                    mdicreate1%style   = 0
                    mdicreate1%lParam  = 0

                    !/*Create Child Window*/
                    hwndChildWindow = SendMessage(hwndClient,WM_MDICREATE,0,LOC(mdicreate1))

                    
                    ! *** Is this needed?
                    wndhandles(iCount) = hwndChildWindow

                    if (hwndChildWindow == NULL) then
                        ret = MessageBox(ghwndMain,                         &
                                    "Failed in Creating Thread Window!"C,   &
                                    "Error"C, MB_OK)
                        MainWndProc = 0
                        return
                    end if

                    !// This stuff is here for simplicity.  Initialization should
                    !//   be done in StartDemo

                    Node1%ThreadWindow%hwndClient = hwndClient
                    Node1%ThreadWindow%hwndThreadWindow = hwndChildWindow
                    hHead1 = GetWindowLong(hwnd, 0)
                    Node1%hNext = hHead1
                    call CopyMemory (pNode1,LOC(Node1),SIZEOFNODE)
                    globhandles(iCount) =  hNode1 
                    ret = SetWindowLong(hwnd, 0, hNode1)

            !// Create the thread suspended so we can alter its priority
            !// before it begins to run.

                    !iOurThreadWindow = LOC(pNode1) + 4

                    hThrd1 = CreateThread(                          &
                                NULL_SECURITY_ATTRIBUTES, 0,        &
                                LOC(StartBounce),                   &
                                LOC(pNode1),              &
                                CREATE_SUSPENDED,                   &
                                LOC(Node1%ThreadWindow%lThreadId))
                    if (hThrd1 .NE. 0) then

                        !// I really don't need this info, it won't even be
                        !// updated right the way for this thread will be
                        !// preempted.

                        Node1%ThreadWindow%hThread = hThrd1
                        call CopyMemory (pNode1,LOC(Node1),SIZEOFNODE)
                        thrdhandles(iCount) = hThrd1
                        iCount = iCount+ 1

                        !// This way the primary (input) thread will be higher priority
                        !// than the bouncers, thus keeping MLTITHRD responsive to user
                        !// input.

                        ret = SetThreadPriority(hThrd1, THREAD_PRIORITY_BELOW_NORMAL)

                        !// Everything's set, let it go.

                        ret = ResumeThread(hThrd1)

                    else
                        ret = MessageBox(ghwndMain,             &
                                    "Create Thread Failed!"C,   &
                                    "Error"C, MB_OK)
                    end if
                    
                    ret = LocalUnlock(hNode1)

                else
                    ret = MessageBox(ghwndMain,                 &
                                "Failed to Allocate Node!"C,    &
                                "Error"C, MB_OK)
                end if

                MainWndProc = 0
                return

            case (MM_ABOUT)

                if (DialogBox(ghModule, LOC("AboutBox"C),         &
                             ghwndMain, LOC(About)) == -1) then
                   ret = MessageBox(ghwndMain,                      &
                        "Mltithrd: About Dialog Creation Error!"C,  &
                        "Error"C, MB_OK)
                end if
                MainWndProc = 0
                return

            case DEFAULT
                MainWndProc = DefFrameProc(hwnd, hwndClient, message, wParam, lParam)
                return

        end select

    case DEFAULT
        MainWndProc = DefFrameProc(hwnd, hwndClient, message, wParam, lParam)
        return
end select
end


