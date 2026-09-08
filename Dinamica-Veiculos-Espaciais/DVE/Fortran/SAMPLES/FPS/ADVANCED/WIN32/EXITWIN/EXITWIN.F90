!*  To enable NT's Reboot feature enable the below
!*  manifest constants. By default the program will
!*  log the user off only.
!*

!!!MS$DEFINE REBOOT

!****************************************************************************
!
!    FUNCTION: WinMain(HANDLE, HANDLE, LPSTR, int)
!
!    PURPOSE: calls initialization function, processes message loop
!
!    COMMENTS:
!
!        Windows recognizes this function by name as the initial entry point
!        for the program.  This function calls the application initialization
!        routine, if no other instance of the program is running, and always
!        calls the instance initialization routine.  It then executes a message
!        retrieval and dispatch loop that is the top-level control structure
!        for the remainder of execution.  The loop is terminated when a WM_QUIT
!        message is received, at which time this function exits the application
!        instance by returning the value passed by PostQuitMessage().
!
!        If this function must abort before entering the message loop, it
!        returns the conventional value NULL.
!
!****************************************************************************

integer function WinMain(hInstance, hPrevInstance, lpCmdLine, nCmdShow)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
use exitinc

integer        hInstance      !/* current instance  */
integer        hPrevInstance  !/* previous instance */
integer        lpCmdLine      !/* command line      */
integer        nCmdShow       !/* show-window type (open/icon) */


integer                     hToken
type (T_TOKEN_PRIVILEGES)   tkp
character*100               szBuf
character*150               lpszMessage
integer                     x         

hInstance = hInstance 
hPrevInstance = hPrevInstance 
lpcmdline = lpcmdline
ncmdshow = ncmdshow

    lpszMessage = "This application closes all running appl&
        &ications and logs you off of the system.\n Do you wish to continue&
        ?"C
    x = MessageBox(NULL, lpszMessage, "Exit Windows"C, MB_YESNO)

   if (x .eq. IDNO) then 
      WinMain = 0
      return
   end if

   ! Get a token for this process.
   if ((IAND(GetVersion() , WIN32S)) == 0) then
      call OutputDebugString("Setting token"C)
      !// Running on NT so need to change privileges
      if (OpenProcessToken(GetCurrentProcess(), &
         IOR(TOKEN_ADJUST_PRIVILEGES , TOKEN_QUERY), LOC(hToken)) .eqv. .FALSE.) &
            then
            write(szBuf, 100)  GetLastError ()
100         format ('OpenProcessToken Error ', Z4)
            i = MessageBox(NULL, szBuf, ""C, MB_OK)
      end if

      !// Get the LUID for shutdown privilege
      i = LookupPrivilegeValue(NULL_CHARACTER, "SeShutdownPrivilege"C, &
                               LOC(tkp%Privileges(1)%Luid))
      tkp%PrivilegeCount = 1  !// one privilege to set
      tkp%Privileges(1).Attributes = SE_PRIVILEGE_ENABLED

      !// Get shutdown privilege for this process.
      if (AdjustTokenPrivileges(hToken, .FALSE., tkp, &
                    0,NULL_TOKEN_PRIVILEGES, 0) .eqv. .FALSE.) then
         write(szBuf, 200) GetLastError ()
200      format ('AdjustTokenPrivileges Error ', Z5)
         i = MessageBox(NULL, szBuf, ""C, MB_OK)
      end if
   end if

!MS$if defined (REBOOT) 
! Shut down the system, and reboot the system.
   if (ExitWindowsEx( EWX_REBOOT, 0 ) .eqv. .FALSE.) then
      write(szBuf, 300) GetLastError ()
300   FORMAT('Error ExitWindows Error ', Z)
      i = MessageBox(NULL, szBuf, NULL, MB_OK)
   end if
!MS$else
   ! Shut down the system, and force all applications closed.
   if (ExitWindowsEx(IOR(EWX_SHUTDOWN, EWX_FORCE), 0) .eqv. .FALSE.) then
      write(szBuf, 300) GetLastError ()
300   FORMAT('Error ExitWindows Error ', Z)
      i = MessageBox(NULL, szBuf, NULL_CHARACTER, MB_OK)
   end if
!MS$endif
end 

