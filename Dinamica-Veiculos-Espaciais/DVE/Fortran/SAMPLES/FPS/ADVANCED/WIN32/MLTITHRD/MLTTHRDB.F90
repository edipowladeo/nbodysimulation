!********************************************************************\
!* ThreadWndProc
!***************************************************************************/

integer function ThreadWndProc(hwnd, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ThreadWndProc@16' :: ThreadWndProc
use thrdinc
integer*4 hwnd, message, wParam, lParam      

integer*4               pThreadBlockInfo
integer*4               pHead
integer*4               hHead, hTmp
integer*4               pThreadBlockInfo1
integer*4               pHead1
integer*4               hHead1, hTmp1

type (THREADBLOCKINFO)  tbi, tbi1
type (NODE)             Head, Head1

select case (message) 
    case (WM_SIZE, WM_CREATE)

        !// now find match
        hHead = GetWindowLong(ghwndMain, 0)
        if (hHead .NE. 0) then
            pHead = LocalLock(hHead)
            if (pHead == NULL) then
                ret = MessageBox(ghwndMain,"Failed in LocalLock!"C,"Error"C, MB_OK)
            end if

            call CopyMemory (LOC(Head), pHead, SIZEOFNODE)

            do while ((Head%ThreadWindow%hwndThreadWindow .NE.  hwnd) .AND. &
                      (Head%hNext .NE. NULL)) 

                hTmp = hHead
                hHead = Head%hNext
                ret = LocalUnlock(hTmp)
                pHead = LocalLock(hHead)

                if (pHead == NULL) then
                    ret = MessageBox(ghwndMain,"Failed in LocalLock!"C, "Error"C,MB_OK)
                end if

                call CopyMemory (LOC(Head), pHead, SIZEOFNODE)
            end do
            
            if (Head%ThreadWindow%hwndThreadWindow == hwnd) then
                pThreadBlockInfo = LOC(Head%ThreadWindow)
                goto 10
            else
                goto 20
            end if


10          call CopyMemory (LOC(tbi), pThreadBlockInfo, SIZEOFTHREADBLOCKINFO)

            if (GetClientRect(tbi%hwndThreadWindow, tbi%rcClient) .EQV. .FALSE.) then
                ret = MessageBox(ghwndMain,"Failed in GetClientRect!"C,"Error"C, MB_OK)
            end if                      

            call CopyMemory (pThreadBlockInfo, LOC(tbi), SIZEOFTHREADBLOCKINFO)

20          ret = LocalUnlock(hHead)

            ThreadWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)
            return
        else 
            !//ret = MessageBox(ghwndMain, "Can't GetWindowLong(ghwndMain,0) !", "Error", MB_OK)
        end if
            ThreadWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)
            return


    case (WM_CLOSE)

       
        hHead1 = GetWindowLong(ghwndMain, 0)
        if (hHead1 .NE. 0 ) then
            pHead1 = LocalLock(hHead1)
            if (pHead1 == NULL) then
                ret = MessageBox(ghwndMain,"Failed in LocalLock!"C,"Error"C, MB_OK)
            end if

            call CopyMemory (LOC(Head1), pHead1, SIZEOFNODE)

            do while ((Head1%ThreadWindow%hwndThreadWindow .NE.   &
                            hwnd) .AND. (Head1%hNext .NE. NULL))
                hTmp1 = hHead1
                hHead1 = Head1%hNext
                ret = LocalUnlock(hTmp1)
            
                pHead1 = LocalLock(hHead1)
                if (pHead1 == NULL) then
                    ret = MessageBox(ghwndMain,"Failed in LocalLock!"C,"Error"C, MB_OK)
                end if
                call CopyMemory (LOC(Head1), pHead1, SIZEOFNODE)
            end do

            if(Head1%ThreadWindow%hwndThreadWindow == hwnd) then
                pThreadBlockInfo1 = LOC(Head1%ThreadWindow)
                goto 30
            else 
                goto 40
            end if


30          call CopyMemory (LOC(tbi1),  pThreadBlockInfo1, SIZEOFTHREADBLOCKINFO)
            tbi1%bKillThrd = .TRUE.
            call CopyMemory (pThreadBlockInfo1, LOC(tbi1), SIZEOFTHREADBLOCKINFO)
            ret = CloseHandle(tbi1%hThread)


40          ret = LocalUnlock(hHead1)

        else
            !//ret = MessageBox(ghwndMain, "Can't GetWindowLong(ghwndMain,0) !", "Error", MB_OK)
        end if
        ThreadWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)
        return

    case (WM_DESTROY)
        ThreadWndProc = 0
        return

    case DEFAULT
        ThreadWndProc = DefMDIChildProc(hwnd, message, wParam, lParam)
        return
end select
end


!***************************************************************************\
!* About
!***************************************************************************/

integer*4 function About(hDlg, message, wParam, lParam)
!MS$ATTRIBUTES STDCALL, ALIAS : '_About@16' :: About
use thrdinc
integer*4 hDlg, message, wParam, lParam

lParam = lParam

select case (message) 
    case (WM_INITDIALOG)
        About = 1
        return

    case (WM_COMMAND)
        if (wParam == IDOK) then
            ret = EndDialog(hDlg, wParam)
        end if
end select

About = 0
return
end

