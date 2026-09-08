!**************************************************************************\
!*
!*  subroutine:  doCreate()
!*
!*  input parameters: hDlg - window handle for the dialog%
!*  global parameters: hInst (for the OPENFILENAME struct%)
!*
!* Call GetOpenFileName() in order to get the name of some EXE file,
!*  then call CreatProcess() and put the results in the list box%
!*
!**************************************************************************/

subroutine doCreate(hDlg)
!MS$ ATTRIBUTES VALUE :: hDlg
use procinc
integer*4 hDlg

type (T_OPENFILENAME)       of
character*256               buffer
character*256               buffer1
character*56                buffer2
character*56                buffer3
character*56                buffer4
character*256               szFileTitle

type (T_STARTUPINFO)            sui
type (T_PROCESS_INFORMATION)    pi

integer*4           ret

logical(4)          bret

szFileTitle = ""C
buffer = szFileTitle

!    /* set up the OPENFILE structure,
!     *  then use the appropriate common dialog
!     */

call ZeroMemory(LOC(buffer),256)
iret = lstrcpy(buffer,"*.exe"C)
of%lStructSize       = SIZEOPENFILENAME    !76
of%hwndOwner         = NULL
of%hInstance         = ghInstance
of%lpstrFilter       = LOC("Executables\0,*.EXE\0\0"C)
of%lpstrCustomFilter = NULL
of%nMaxCustFilter    = 0
of%nFilterIndex      = 0
of%lpstrFile         = LOC(buffer)
of%nMaxFile          = MAXCHARS
of%lpstrFileTitle    = NULL
of%nMaxFileTitle     = 0
of%lpstrInitialDir   = NULL
of%lpstrTitle        = NULL
of%Flags             = OFN_HIDEREADONLY
of%nFileOffset       = 0
of%nFileExtension    = 0
of%lpstrDefExt       = NULL
of%lCustData         = 0
of%lpfnHook          = NULL
of%lpTemplateName    = NULL

if ( GetOpenFileName(of) .EQV. .FALSE. ) then
    return
endif

!    /* set up the STARTUPINFO structure,
!     *  then call CreateProcess to try and start the new exe.
!     */
sui%cb             = SIZESTARTUPINFO  ! 68 ( sizeof(StartUpInfo)
sui%lpReserved       = 0
sui%lpDesktop        = NULL
sui%lpTitle          = NULL
sui%dwX              = 0
sui%dwY              = 0
sui%dwXSize          = 0
sui%dwYSize          = 0
sui%dwXCountChars    = 0
sui%dwYCountChars    = 0
sui%dwFillAttribute  = 0
sui%dwFlags          = 0
sui%wShowWindow      = 0
sui%cbReserved2      = 0
sui%lpReserved2      = 0
  

iret = ConvertFToCString (buffer, of%lpstrFile)

bret = CreateProcess (                              &
                     buffer,                        &
                     NULL_CHARACTER,                &
                     NULL_SECURITY_ATTRIBUTES,      & 
                     NULL_SECURITY_ATTRIBUTES,      &
                     .FALSE.,                       &
                     DETACHED_PROCESS,              &
                     NULL,                          &
                     NULL_CHARACTER,                &
                     sui,                           &
                     pi)


if (bret .eqv. .TRUE.) then
   write(buffer1,10) pi%hProcess
10       format(Z8) 
   buffer1(9:9) = char(0)
   ret = lstrcat(buffer1, "\t"C)

   write(buffer2,20) pi%hThread
20       format(Z8) 
   buffer2(9:9) = char(0)
   ret = lstrcat(buffer2, "\t"C)
   ret = lstrcat(buffer1, buffer2)
   ret = pi%dwProcessId
   write(buffer3,30) ret
30       format(Z8) 
   buffer3(9:9) = char(0)
   ret = lstrcat(buffer3, "\t"C)
   ret = lstrcat(buffer1, buffer3)
   
   write(buffer4,40) pi%dwThreadId
40       format(Z8) 
   buffer4(9:9) = char(0)
   ret = lstrcat(buffer4, "\t"C)
   ret = lstrcat(buffer1, buffer4)
   ret = lstrcat(buffer1, buffer)
   ret = SendDlgItemMessage (hDlg, DID_LISTBOX, LB_ADDSTRING, 0, LOC(buffer1))

else 
!      /* report failure to the user. */
    ret = GetLastError ()
    write(buffer,100) ret 
100 format ('0x',Z5)
    ret = MessageBox( hDlg, buffer, "GetLastError..."C,IOR(MB_ICONSTOP,MB_OK ))
end if

end

!**************************************************************************\
!*
!*  function:  doTerminate()
!*
!*  input parameters: hDlg - window handle for the dialog%
!*
!* Determine which process is selected in the list box%  Then parse the
!*  process handle out of that string and call TerminateProcess() with it%
!*

!Warning:

!"TerminateProcess is used to cause all of the threads within a process
!to terminate.  While TerminateProcess will cause all threads within a
!process to terminate, and will cause an application to exit, it does
!not notify DLLs that the process is attached to that the process is
!terminating.  TerminateProcess is used to unconditionally cause a
!process to exit. It should only be used in extreme circumstances.
!The state of global data maintained by DLLs may be compromised if
!TerminateProcess is used rather that ExitProcess."
!

!**************************************************************************/
subroutine doTerminate(hDlg)
!MS$ ATTRIBUTES VALUE :: hDlg
use procinc
integer*4 hDlg


character*256   buffer5
character*256   buffer6
integer*4       sel
integer*4       ret
logical(4)      bret
integer*4      hProcess

!    /* determine which item is selected in the list box, and get the text */
    sel= SendDlgItemMessage (hDlg, DID_LISTBOX, LB_GETCURSEL, 0, 0)
    if (sel == LB_ERR) then
        ret = MessageBox (hDlg, "No listbox item is selected."C, "Incorrect use"C, IOR(MB_ICONSTOP, MB_OK))
        return
    end if

    ret = SendDlgItemMessage (hDlg, DID_LISTBOX, LB_GETTEXT, sel, LOC(buffer5))

    !    /* pick the process handle out of the string. */
    read(buffer5, 50) hProcess

50  format(Z8)
  
    bret = TerminateProcess (hProcess, 0)

    if (bret .eqv. .TRUE.) then
        ret = SendDlgItemMessage (hDlg, DID_LISTBOX, LB_DELETESTRING, sel, 0)
    else 
        ret = GetLastError ()
        write(buffer6,200) ret 
200     format ('0x',Z5)
   
        ret = MessageBox( hDlg, buffer6, "GetLastError..."C, IOR(MB_ICONSTOP,MB_OK))
    endif
end
