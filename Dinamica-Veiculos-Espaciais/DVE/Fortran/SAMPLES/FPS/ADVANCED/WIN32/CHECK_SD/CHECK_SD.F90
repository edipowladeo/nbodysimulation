!******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples.
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved.
!*       This source code is only intended as a supplement to
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the
!*       Microsoft samples programs.
!******************************************************************************/
!
!****************************************************************************\
!*
!* MODULE:       check_sd.f90
!*
!*               In the Win32 .hlp file, if you click on Search, goto "Security
!*                 Overview", then choose from the list of topics under
!*                 Security Overview the sub-topic "Allowing Access", you'll
!*                 find the comment
!*
!*                 Note:  It is fine to write code like this that builds
!*                   security descriptors from scratch.  It is, however, a good
!*                   practice for people who write code that builds or
!*                   manipulates security descriptors to first write code that
!*                   explores the default security descriptors that Windows NT
!*                   places on objects.  For example, if Windows NT by default
!*                   includes in a DACL an ACE granting the Local Logon SID
!*                   certain access, it's good to know that, so that a decision
!*                   not to grant any access to the Local Logon SID would be a
!*                   conscious decision
!*
!* PURPOSE:      The comment in the .hlp file is accurate, however, for many
!*                 people this task of examining the SD is easier if there is
!*                 sample code to start from.  So, the purpose of this sample
!*                 is to assist people by providing sample code people can
!*                 start from as they examine SD(s).  This sample as is
!*                 examines the SD on files, and this code can be modified to
!*                 examine the SD on other objects
!*
!*               This sample is not a supported utility
!*
!* TO RUN:       Type Check_sd to check the SD on the \\.\A:  device
!*
!*               Type Check_sd d:\a.fil to check the SD on the d:\a.fil file.
!*                 In this case d:  must be formatted NTFS, because only NTFS
!*                 files have SD(s)
!*
!****************************************************************************/
!
!****************************************************************************\
!*  INCLUDES, DEFINES
!****************************************************************************/
use chksdinc
use msfwin
include 'check_sd.fi'


integer(4) SetPrivilegeInAccessToken [EXTERN]

external InitializeWellKnownSIDs

external DisplayHelp

integer*4               hProcess
integer*4               hAccessToken

character*20            lpszFullName 
character*(SZ_SD_BUF)   ucBuf
integer*4               dwSDLength
integer*4               dwSDLengthNeeded
integer*4               psdSD 
integer*4               dwErrorMode

integer*4   ret
include 'data.f90'

!**************************************************************************\
!*
!* This sample is not inside a Win32 service, however if this code were to be
!*   moved inside a Win32 service, the following defines and code that
!*   redirects stdout will be handy, because services cannot write to the
!*   screen
!*
!* You may wish to choose a different file name for the output file if you
!*   use this mechanism - note that the "w+" will destroy an existing file!
!*
!**************************************************************************/

ucBuf = ""C
dwSDLength = SZ_SD_BUF
psdSD      = LOC(ucBuf)
FileAccessMask                  = 1
ProcessAccessMask               = 2
WindowStationAccessMask         = 3
RegKeyAccessMask                = 4 
ServiceAccessMask               = 5 
DefDaclInAccessTokenAccessMsk   = 6 


if(1 == nargs()) then
    lpszFullName = DEFAULT_FILE_TO_CHECK
else if (nargs() == 2) then
        call GetArg(1, lpszFullName, istat)
        lpszFullName(istat+1:istat+1) = char(0)
else
    call DisplayHelp()
    stop 0

end if

!**************************************************************************
!*
!* Set up the well-known SID(s) in global variables, and enable the privilege
!*   needed in the access token to work with SACL(s)
!*
!**************************************************************************

call InitializeWellKnownSIDs()

if (SetPrivilegeInAccessToken() == 0) then
    call exit(1)
end if

!**************************************************************************
!*
!* This sample's primary purpose is to explore Security Descriptors.
!*   However, it is all too easy to over-focus on SD(s), while losing isght
!*   of the importance of Access Tokens.  So, we will now digress briefly to
!*   examine the access token of the current process
!*
!**************************************************************************

hProcess = GetCurrentProcess()
if (hProcess == 0) then
    call PERR("GetCurrentProcess")
    stop 1
end if

if (OpenProcessToken(hProcess,                                    &
                IOR(INT4(TOKEN_READ),TOKEN_QUERY_SOURCE),               &
                LOC(hAccessToken)) .EQV. .FALSE.) then
    call PERR("OpenProcessToken")
    stop 1
end if

call ExamineAccessToken(hAccessToken)

!**************************************************************************
!*
!* Back to examining SD(s)
!*
!**************************************************************************
write(*,*) "Checking SD on ",lpszFullName

!**************************************************************************
!*
!* SetErrorMode so we don't get the error due to no floppy disk in the floppy
!*   drive
!*
!**************************************************************************

dwErrorMode = SetErrorMode(SEM_FAILCRITICALERRORS)


if (GetFileSecurity                                               &
         (lpszFullName,                                           &
          IOR( OWNER_SECURITY_INFORMATION,                        &
                               IOR(GROUP_SECURITY_INFORMATION,    &
                               IOR(DACL_SECURITY_INFORMATION,     &
                               SACL_SECURITY_INFORMATION))),      &
          psdSD,                                                  &
          dwSDLength,                                             &
          LOC(dwSDLengthNeeded)) .EQV. .FALSE.) then
    call PERR("GetFileSecurity")
    stop 1
end if

ret = SetErrorMode(dwErrorMode)

ipsidnullsid = psidnullsid
if(ExamineSD(psdSD, FileAccessMask) == 0) then
    call PERR("ExamineSD failed")
    stop 1
end if
psidnullsid = ipsidnullsid 
!**************************************************************************\
!*
!* The above code showed how to examine an SD on a file.  There are SDs on
!*   other objects that could be examined by the function ExamineSD (and the
!*   other functions it calls).  The following are one example call each of
!*   the other four api's that are used to retrieve the SD from each of the
!*   types of Win32 objects that can have an SD
!*
!* These calls will execute properly without any work on your part, however,
!*   some work on your part will be required to get the sample calls below to
!*   show the SD for the objects your program uses!  You would need to make
!*   copy of this sample in a new directory, and write the code to get a
!*   integer*4 to the object you're interested in, so you can pass that integer*4
!*   to the applicable api call below
!*
!* To insert the SD checking code into your own code you would do
!*   something like
!*
!* 1) Add the global variables above in your globals
!*
!* 2) Add the function prototypes above in your globals
!*
!* 3) Add the includes and PERR/PMSG macroes above to your code
!*
!* 4) Add all the functions defined below (except DisplayHelp and except
!*   ExamineAccessToken) to your code
!*
!* 5) Add a call sequence such as that in main() above that gets an
!*   SD and passes it to Examine SD.  Or add a call sequence such as
!*   one of those that follows that gets a integer*4, gets the SD on the
!*   object the integer*4 addresses, then calls ExamineSD
!*
!* 6) If you are examining a type SD not already listed in
!*   KINDS_OF_ACCESSMASKS_DECODED, then you will have to add the new type to
!*   KINDS_OF_ACCESSMASKS_DECODED, and add to ExamineMask() the necessary
!*   code to crack that type of SD's access mask bits into the defines
!*
!**************************************************************************/


!      if (CLUTTER_PROGRAM_OUTPUT .eq. 0) then
!          siSInfo = IOR( OWNER_SECURITY_INFORMATION,
!     +                               IOR(GROUP_SECURITY_INFORMATION,
!     +                               IOR(DACL_SECURITY_INFORMATION,
!     +                               SACL_SECURITY_INFORMATION)))
!
!          write(*,*)
!          write(*,*) "Checking SD on current process"
!
!          hProcess1 = GetCurrentProcess()
!          if (hProcess1 .eq. 0) then
!              call PERR("GetCurrentProcess")
!              stop 1
!          end if
!
!          dwSDLength = SZ_SD_BUF
!
!          if (GetKernelObjectSecurity
!     +           (hProcess1,
!     +            IOR( OWNER_SECURITY_INFORMATION,
!     +                                 IOR( GROUP_SECURITY_INFORMATION,
!     +                                  DACL_SECURITY_INFORMATION)),
!     +            psdSD,
!     +            dwSDLength,
!     +            LOC(dwSDLengthNeeded)) .eq. 0) then
!            call  PERR("GetKernelObjectSecurity")
!            stop 1
!          end if
!
!************************************************************************\
!*
!* It is important to close all integer*4s as soon as your code no longer
!*   needs them.  This conserves system resources.  In a sample such as
!*   this one, the practical effect is close to nil, since as soon as the
!*   sample exits (which only takes a few seconds, Windows NT destroys the
!*   process this sample was running in, which reclaims all resources
!*
!* However, in a program that creates many objects (such as threads), or
!*   where that program will be running for a long time, closing integer*4s as
!*   soon as the program no longer needs them can save significant
!*   resources
!*
!* It is a good coding practice to make a habit of closing integer*4s as soon
!*   as your code no longer needs the integer*4
!*
!************************************************************************/
!
!          i = CloseHandle(hProcess1)
!
!          if(ExamineSD(psdSD,ProcessAccessMask) .eq. 0) then
!            call PERR("ExamineSD failed")
!            stop 1
!          end if
!
!
!          write(*,*) 
!          write(*,*) 
!          write(*,*) "Checking SD on current Window-station"
!
!          hWindowStation = GetProcessWindowStation()
!          if (INVALID_HANDLE_VALUE .eq. hWindowStation) then
!              call PERR("GetProcessWindowStation")
!              stop 1
!          end if
!
!          dwSDLength = SZ_SD_BUF
!
!          if (GetUserObjectSecurity
!     +           (hWindowStation,
!     +            LOC(siSInfo),
!     +            psdSD,
!     +            dwSDLength,
!     +            LOC(dwSDLengthNeeded)) .eq. 0) then
!              call PERR("GetUserObjectSecurity")
!              stop 1
!          end if
!
!          i = CloseHandle(hWindowStation)
!
!          if(ExamineSD(psdSD,WindowStationAccessMask) .eq. 0) then
!              call PERR("ExamineSD failed")
!              stop 1
!          end if
!
!          write(*,*)
!          write(*,*)
!          write(*,*)'nChecking SD on registry key HKEY_LOCAL_MACHINE\\SY
!     +STEM\\CurrentControlSet'
!
!          if (ERROR_SUCCESS .ne. RegOpenKeyEx(HKEY_LOCAL_MACHINE,
!     +                                     "SYSTEM\\CurrentControlSet"C,
!     +                                       0,
!     +                                       KEY_READ,
!     +                                       LOC(hKey))) then
!              call PERR("RegOpenKeyEx")
!              stop 1
!          end if
!
!          dwSDLength = SZ_SD_BUF
!
!          if (ERROR_SUCCESS .ne. RegGetKeySecurity
!     +           (hKey,
!     +            IOR( OWNER_SECURITY_INFORMATION,
!     +                                  IOR(GROUP_SECURITY_INFORMATION,
!     +                                  DACL_SECURITY_INFORMATION)),
!     +            psdSD,
!     +            LOC(dwSDLength))) then
!              call PERR("RegGetKeySecurity")
!              stop 1
!          end if
!
!          i = RegCloseKey(hKey)
!
!          if(ExamineSD(psdSD,RegKeyAccessMask) .eq. 0) then
!              call PERR("ExamineSD failed")
!              stop 1
!          end if
!
!
!************************************************************************\
!*
!* Any service will do here, just be sure to pick one that is in the
!*   Service Control Manager's database, and use the service name, not the
!*   service's display name.  For example, ClipSrv is displayed as Clipbook
!*   in the Services Control Panel applet
!*
!************************************************************************/
!
!          write(*,*)
!          write(*,*)
!          write(*,*)"Checking SD on service Clipbook"
!
!          schSCManager = OpenSCManager(
!     +                         NULL,                 ! machine (NULL == local)
!     +                         NULL,                 ! database (NULL == default)
!     +                         SC_MANAGER_ALL_ACCESS ! access required
!     +                         )
!
!          if (schSCManager .eq. 0)   then
!              call PERR("OpenSCManager")
!              stop 1
!          end if
!
!          schService = OpenService(schSCManager,"ClipSrv"C,
!     +                            SERVICE_ALL_ACCESS)
!          if (schService .eq. 0) then
!              call PERR("OpenService")
!              stop 1
!          end if
!
!          i = CloseServiceHandle(schSCManager)
!
!          dwSDLength = SZ_SD_BUF
!
!          if (QueryServiceObjectSecurity
!     +           (schService,
!     +            IOR( OWNER_SECURITY_INFORMATION,
!     +                                  IOR(GROUP_SECURITY_INFORMATION,
!     +                                  DACL_SECURITY_INFORMATION)),
!     +            psdSD,
!     +            dwSDLength,
!     +            LOC(dwSDLengthNeeded)) .eq. 0) then
!              call PERR("QueryServiceObjectSecurity")
!              stop 1
!          end if
!
!          i = CloseServiceHandle(schService)
!
!          if(ExamineSD(psdSD,ServiceAccessMask) .eq. 0) then
!              call PERR("ExamineSD failed")
!              stop 1
!          end if
!      end if
!

end      




