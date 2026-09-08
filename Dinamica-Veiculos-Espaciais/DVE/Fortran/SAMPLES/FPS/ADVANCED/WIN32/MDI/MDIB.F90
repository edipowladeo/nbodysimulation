
!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/

integer*4 function MainWndProc(hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MainWndProc@16' :: MainWndProc
use mdiinc
integer hwnd, message, wParam, lParam

interface 
integer(4) function About (hwnd, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
integer*4   hwnd 
integer*4   message 
integer*4   wParam 
integer*4   lParam 
end function About
end interface

integer*4           iMDICount
SAVE                iMDICount
type (T_CLIENTCREATESTRUCT)      clientcreate
type (T_MDICREATESTRUCT)     mdicreate
integer*4           hwndChildWindow
integer*4           hInfo
integer*4           pInfo
character*30        Title
type (PERWNDINFO)   Info
integer*4           hActiveChild
integer*4           ret
logical(4)          bret
character(20)       Caption   
character*100       lpszAppName
data iMDICount /1/


select case (message) 

    case (WM_CREATE)
        ret = SetWindowLong(hwnd, 0, NULL)

        clientcreate%hWindowMenu  = hMenuWindow
        clientcreate%idFirstChild = 1
        lpszAppName = "MDICLIENT"C

        ghwndClient = CreateWindow(                               &
                            lpszAppName, ""C,               &
                            IOR(WS_CHILD , IOR(WS_CLIPCHILDREN,   &
                                WS_VISIBLE)), 0, 0, 0, 0,         &
                        hwnd, NULL, ghModule, LOC(clientcreate))
        MainWndProc = 0
        return

    case (WM_DESTROY)
        call PostQuitMessage(0)
        MainWndProc = 0
        return

    case (WM_COMMAND)

        select case (LoWord(wParam)) 
        !//
        !// Getting default MDI functionalities...
        !//
            case (IDM_TILE)
                ret = SendMessage(                                &
                    ghwndClient, WM_MDITILE, 0, 0)
                MainWndProc = 0
                return
            case (IDM_CASCADE)
                ret = SendMessage(                                &
                    ghwndClient, WM_MDICASCADE, 0, 0)
                MainWndProc = 0
                return
            case (IDM_ARRANGE)
                ret = SendMessage(                                &
                    ghwndClient, WM_MDIICONARRANGE, 0, 0)
                MainWndProc = 0
                return

        !//
        !// Creates MDI child
        !//
            case (MM_MDI)

        !//
        !// Allocating memory for INFO to be associated with the
        !//  new child
        !//
                hInfo = LocalAlloc(LHND, SIZEOFINFO)
                if (hInfo .NE. 0) then
                pInfo = LocalLock(hInfo)
                if (pInfo == NULL) then
                    ret = MessageBox(ghwndMain,"Failed in LocalLock"C,"Error"C, MB_OK)
                end if
                    ret = lstrcpy(Caption, "MDI "C)
                    write (Caption, 100 ) iMDICount
100                 format ('MDI', I4)
                    Info%CaptionBarText = Caption
                    Info%hParent     = ghwndClient
                    call CopyMemory(pInfo, LOC(Info), 44) ! SIZEOFINFO = 44

                    Title = Info%CaptionBarText // ""C
                    lpszAppName = "MDIClass"C
                    mdicreate%szClass = LOC(lpszAppName)
                    mdicreate%szTitle = LOC(Title)
                    mdicreate%hOwner  = ghModule
                    mdicreate%x       = CW_USEDEFAULT
                    mdicreate%y       = CW_USEDEFAULT
                    mdicreate%cx      = CW_USEDEFAULT
                    mdicreate%cy      = CW_USEDEFAULT
                    mdicreate%style   = 0
!                    //
!                    // passing the handle of the per MDI child INFO to the
!                    //  child MDI window for storage
!                    //
                    mdicreate%lParam  = hInfo

!                    /*Create Child Window*/
                    hwndChildWindow = SendMessage(ghwndClient,    &
                             WM_MDICREATE, INT4(0),               &
                             LOC(mdicreate))

                    if (hwndChildWindow == NULL) then
                        ret = MessageBox(ghwndMain,"Failed in Creating Child Window"C,& 
                                         "Error"C, MB_OK)
                        MainWndProc = 0
                        return
                    end if

                    iMDICount = iMDICount + 1

                    bret = LocalUnlock(hInfo)
                else
                    ret = MessageBox(ghwndMain,"Failed to Allocate INFO data!"C,& 
                            "Error"C, MB_OK)
                end if
                MainWndProc = 0
                return

            case (MM_ABOUT)
                if (DialogBox(ghModule, LOC("AboutBox"C),         &
                            ghwndMain, LOC(About)) == -1) then
                    ret = MessageBox(ghwndMain,"DEMO: About Dialog Creation Error!"C,& 
                                     "Error"C, MB_OK)
                end if
                MainWndProc = 0
                return

!            //
!            // Passes these WM_COMMAND messages to the appropriate active child
!            //  window proc for processing
!            //
            case (MM_OPT_1, MM_OPT_2, MM_OPT_3, MM_OPT_4,         &
                  MM_OPT_5, MM_OPT_6, MM_OPT_7, MM_OPT_8)

                hActiveChild = SendMessage(ghwndClient,           &
                                            WM_MDIGETACTIVE, 0, 0)
                if (hActiveChild .NE. 0) then
                    ret = SendMessage(hActiveChild, WM_COMMAND,   &
                                    wParam, lParam)
                end if
                MainWndProc = 0
                return

            case DEFAULT
                MainWndProc = DefFrameProc(hwnd,  ghwndClient,    &
                                message, wParam, lParam)
                return
        end select

    case DEFAULT

        MainWndProc = DefFrameProc(hwnd,  ghwndClient, message,   &
                                wParam, lParam)
        return
end select
end 

!/***************************************************************************\
!* MDIWndProc
!*
!* History:
!* 11-Feb-1992   Petrus Wong []
!*   Name changes. Added comments.
!* 09-09-91      Petrus Wong Rewrote.
!* 04-17-91 ????      Created.
!\***************************************************************************/
integer*4  function MDIWndProc ( hwnd, message, wParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MDIWndProc@16' :: MDIWndProc
use mdiinc
integer*4   hwnd, message, wParam, lParam

integer*4   hInfo
integer*4   pInfo
integer*4   hTextWnd
integer*4   hInfo1
integer*4   pInfo1
integer*4   hTextWnd1
integer*4   pInfo2
integer*4   hInfo2
integer*4   hTextWnd2
integer*4   hInfo4
type (PERWNDINFO)    Info, Info1, Info2
integer*4   ret
logical(4)  bret


select case (message)       
    case (WM_COMMAND)

!          //
!          // Retrieving this child window's INFO data for displaying
!          //    messages in the text window
!          //
        hInfo = GetWindowLong(hwnd, 0)
        if (hInfo .NE. 0) then
            pInfo = LocalLock(hInfo)
            if (pInfo == NULL) then
                ret = MessageBox(ghwndMain,"Failed in LocalLock"C,"Error"C, MB_OK)
            end if
            call CopyMemory(LOC(Info), pInfo, 44) ! SIZEOFINFO = 44
            hTextWnd = Info%hTextWnd
            call vTest(pInfo)
            bret = LocalUnlock(hInfo)
        else
            ret = MessageBox(ghwndMain, "Can't get hInfo!"C,"Can't get hInfo!"C, MB_OK)
        end if


        select case (LoWord(wParam))
            case (MM_OPT_1)
                bret = SetWindowText(hTextWnd, "MM_OPT_1"C)
                MDIWndProc = 0
                return
            

            case (MM_OPT_2)
                bret = SetWindowText(hTextWnd, "MM_OPT_2"C)
                MDIWndProc = 0
                return
            

            case (MM_OPT_3)
                bret = SetWindowText(hTextWnd, "MM_OPT_3"C)
                MDIWndProc = 0
                return
            

            case (MM_OPT_4)
                bret = SetWindowText(hTextWnd, "MM_OPT_4"C)
                MDIWndProc = 0
                return
            
            case DEFAULT
                MDIWndProc = 0
                return

        end select
          
  
    case (WM_SETFOCUS)

!        //
!        // Potentially, you can set different menu for different MDI
!        //  child which is currently being active.
!        //
    case (WM_MDIACTIVATE)
        if (lParam == hwnd) then
            ret = SendMessage(GetParent(hwnd), WM_MDISETMENU,     &
                       hChildMenu,                                &
                       hChildMenuWindow) 
            ret = DrawMenuBar(GetParent(GetParent(hwnd))) 
        end if  
        MDIWndProc = 0
        return

!        //
!        // Whenever the MDI child window is resized, its children has to be
!        //  resized accordingly.
!        //
    case (WM_SIZE)

!            //
!            // First, get the text window's handle from the per MDI child
!            //  INFO data structure
!            //
        hInfo1 = GetWindowLong(hwnd, 0)
        if (hInfo1 .NE. 0)  then
            pInfo1 = LocalLock(hInfo1)
            if (pInfo1 == NULL) then
                ret = MessageBox(ghwndMain,"Failed in LocalLock"C,"Error"C, MB_OK)
            end if
            call CopyMemory(LOC(Info1), pInfo1, 44) ! SIZEOFINFO = 44

            hTextWnd1 = Info1%hTextWnd
            bret = LocalUnlock(hInfo1)
        else 
            ret = MessageBox(ghwndMain,"Can't get hInfo!"C,"Error"C, MB_OK)
        end if

!            //
!            // Always, put the text window at the bottom of the MDI window
!            //
        ret = MoveWindow(hTextWnd1,                               &
                  0,                                              &
                  HiWord(lParam) -                                &
                  GetWindowLong(hTextWnd1, GWL_USERDATA),         &
                  INT4(LoWord(lParam)),                           &
                  INT4(HiWord(lParam)), .TRUE.)

!        //
!        // Creates the text window for this MDI child and saves its handle
!        //  in the per MDI child INFO data structure.
!        //
    case (WM_CREATE)

        hTextWnd2 = CreateWindow(                                 &
                        "Text"C, ""C,                             &
                        IOR (WS_BORDER, IOR(SS_LEFT,              &
                        IOR(WS_CHILD, WS_VISIBLE))),              &
                        0, 0, 0, 0,                               &
                        hwnd,                                     &
                        2,                                        &
                        ghModule,                                 &
                        NULL)
        
        ret = SetWindowText(hTextWnd2,"Select 'Option' menu items"C)

!            //
!            // INFO was allocated in the MDIWndProc at MM_MDI time and is
!            //  passed to us at WM_CREATE time...
!            //
        hInfo2 = SetHandle (lParam)
        if (hInfo2 .NE. 0 )  then
            pInfo2 = LocalLock(hInfo2)
            if (pInfo2 == NULL) then
                ret = MessageBox(ghwndMain,                       &
                                "Failed in LocalLock"C,      &
                                "Error"C, MB_OK)
            end if
            call CopyMemory(LOC(Info2), pInfo2, 44) ! SIZEOFINFO = 44
            Info2%hTextWnd = hTextWnd2
            
            if (GetClientRect(hwnd, Info2%rcClient) .EQV. .FALSE.)  &
                                                    then
                ret = MessageBox(ghwndMain,                       &
                                "Failed in GetClientRect!"C, &
                                "Error"C, MB_OK)
            end if
            call Copymemory(pInfo2, LOC(Info2), 44) ! SIZEOFINFO = 44
!       //
!       // Save the handle to INFO in our window structure
!       //
            ret = SetWindowLong(hwnd, 0, hInfo2)
            bret = LocalUnlock(hInfo2)
        else
            ret = MessageBox(ghwndMain,"Can't allocate hInfo!"C,"Error"C, MB_OK)
        end if

!        //
!        // Free the INFO data that associates with this window
!        //  also, reset the menu.
!        //
    case (WM_CLOSE)
        

        ret = SendMessage(GetParent(hwnd), WM_MDISETMENU,         &
                                     hMenu,                       &
                                     hMenuWindow) 
        ret = DrawMenuBar(GetParent(GetParent(hwnd))) 
        hInfo4 = GetWindowLong(hwnd, 0)
        ret = LocalFree(hInfo4)

    case DEFAULT
        MDIWndProc =DefMDIChildProc(hwnd, message, wParam, lParam)
        return

end select
MDIWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)
return
end

