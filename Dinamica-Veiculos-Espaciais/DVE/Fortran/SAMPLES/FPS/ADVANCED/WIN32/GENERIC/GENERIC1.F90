!/****************************************************************************
!
!        FUNCTION: CenterWindow (HWND, HWND)
!
!        PURPOSE:  Center one window over another
!
!        COMMENTS:
!
!        Dialog boxes take on the screen position that they were designed at,
!        which is not always appropriate. Centering the dialog over a particular
!        window usually results in a better position.
!
!****************************************************************************/

subroutine CenterWindow (hwndChild, hwndParent)
use msfwin 
use gene_inc
integer         hwndChild, hwndParent
type (T_RECT)     rChild, rParent
integer         wChild, hChild, wParent, hParent
integer         wScreen, hScreen, xNew, yNew
integer         hdc
integer*4       retval

! Get the Height and Width of the child window
   retval = GetWindowRect (hwndChild, rChild)
   wChild = rChild.right - rChild.left
   hChild = rChild.bottom - rChild.top

! Get the Height and Width of the parent window
   retval = GetWindowRect (hwndParent, rParent)
   wParent = rParent.right - rParent.left
   hParent = rParent.bottom - rParent.top

! Get the display limits
   hdc = GetDC (hwndChild)
   wScreen = GetDeviceCaps (hdc, HORZRES)
   hScreen = GetDeviceCaps (hdc, VERTRES)
   retval = ReleaseDC (hwndChild, hdc)

! Calculate new X position, then adjust for screen
   xNew = rParent.left + ((wParent - wChild) /2)
   if (xNew .LT. 0) then
      xNew = 0
   else if ((xNew+wChild) .GT. wScreen) then
      xNew = wScreen - wChild
   end if

! Calculate new Y position, then adjust for screen
   yNew = rParent.top  + ((hParent - hChild) /2)
   if (yNew .LT. 0) then
      yNew = 0
   else if ((yNew+hChild) .GT. hScreen) then
      yNew = hScreen - hChild
   end if

! Set it, and return
   ret = SetWindowPos (hwndChild, NULL, xNew, yNew, 0, 0,            &
                  IOR(SWP_NOSIZE , SWP_NOZORDER))
end  

 
!/****************************************************************************
!
!        FUNCTION: AboutDlgProc(HWND, UINT, WPARAM, LPARAM)
!
!        PURPOSE:  Processes messages for "About" dialog box
!
!        MESSAGES:
!
!        WM_INITDIALOG - initialize dialog box
!        WM_COMMAND    - Input received
!
!        COMMENTS:
!
!        Display version information from the version section of the
!        application resource.
!
!        Wait for user to click on "Ok" button, then close the dialog box.
!
!****************************************************************************/

integer*4 function AboutDlgProc( hDlg, message, uParam, lParam )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AboutDlgProc@16' :: AboutDlgProc
use msfwin
use gene_inc

integer     hDlg        !// window handle of the dialog box
integer     message     !// type of message
integer     uParam      !// message-specific information
integer     lParam
integer*4   hfontDlg
save        hfontDlg

integer     dwVerHnd
integer     dwVerInfoSize
integer     uVersionLen
integer     bRetCode
integer     i
character*256   szFullPath
character*256   szResult
character*256   szGetName
character*256   lpversion

common      hinst 
COMMON /globdata/ ghInstance

integer*4           lpstrVffInfo
integer*4           hMem
integer*4           ret
character*100       lpszTempBuffer

lparam = lparam
   select case (message)
      case (WM_INITDIALOG)   ! message: initialize dialog box
         ! Create a font to use
         lpszTempBuffer = ""C
         hfontDlg = CreateFont(14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,& 
                        IOR(INT(VARIABLE_PITCH) , INT(FF_SWISS)), ""C)

         ! Center the dialog over the application window
         call CenterWindow (hDlg, GetWindow (hDlg, GW_OWNER))

         ! Get version information from the application
         ret = GetModuleFileName (INT(ghInstance), szFullPath,     &
                               len(szFullPath))
         dwVerInfoSize = GetFileVersionInfoSize(szFullPath,   &
                                       LOC(dwVerHnd))

         if (dwVerInfoSize .NE. 0) then
            ! If we were able to get the information, process it:
            hMem = GlobalAlloc(GMEM_MOVEABLE, INT(dwVerInfoSize))
            lpstrVffInfo  = GlobalLock(hMem)
            ret = GetFileVersionInfo (szFullPath, dwVerHnd, &
            dwVerInfoSize, lpstrVffInfo)

            ! Walk through the dialog items that we want to replace:
            do i = DLG_VERFIRST, DLG_VERLAST
               ret = GetDlgItemText(hDlg, i, szResult,      &     
                             len(szResult))
                
               szGetName = "\\StringFileInfo\\040904E4\\"C               
               ret =lstrcat(szGetName,szResult)

               bRetCode  =  VersionQueryValue(lpstrVffInfo,       &
                                            LOC(szGetName),       &
                                            LOC(lpVersion),       &
                                            LOC(uVersionLen)) ! For MIPS strictness

               if ( bRetCode .NE. 0 ) then
                    ! Replace dialog item text with version info
                  ret = lstrcpy(szResult,lpVersion)
                  retval = SetDlgItemText(hDlg, i,szResult)
                  retval = SendMessage (GetDlgItem (hDlg, i),   &
                                   WM_SETFONT, hfontDlg, TRUE)
               end if
            end do 

            retval = GlobalUnlock(hMem)
            retval = GlobalFree(hMem)
         end if 
         AboutDlgProc = 1
         return
      case (WM_COMMAND)                      ! message: received a command
         if ((LoWord(uParam) .EQ. IDOK) &       !OK Selected
            .OR. (LoWord(uParam) .EQ. IDCANCEL)) then  ! System menu close command?
            ret = EndDialog(hDlg, TRUE)        ! Exit the dialog
            ret = DeleteObject (hfontDlg)
            AboutDlgProc = 1
            return
         end if
   end select  
   AboutDlgProc = 0 ! Didn't process the message
   return
end 
