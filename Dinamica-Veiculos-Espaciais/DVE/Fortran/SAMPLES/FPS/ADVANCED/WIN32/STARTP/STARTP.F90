!******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*        See these sources for detailed information regarding the 
!*        Microsoft samples programs.
!\******************************************************************************/

!/********************************************************************
!* This program demonstrates various CreateProcess parameters,       *
!* including starting processes in a given priority class. This is   *
!* very similar to the "start" command but with added functionality. *
!*                                                                   *
!* This program demonstrates the use of the following Win32 APIs:    *
!*   CreateProcess, TerminateProcess.                                *
!*                                                                   *
!* This program also uses the following Win32 APIs:                  *
!*   WaitForSingleObject GetLastError.                               *
!*                                                                   *
!* Execution instructions:                                           *
!*   see the help() function or run the program without any          *
!*   parameters to see detailed execution info.                      *
!*                                                                   *
!* Possible enhancements:                                            *
!*   Handle cmd.exe internal commands                                *
!********************************************************************/
use msfwin

interface 
subroutine help ()
!MS$ATTRIBUTES STDCALL, ALIAS : '_help@0' :: help
end subroutine
end interface

integer                     argc, status, NEXT, res
character                   argv*50
character                   szArgs*512              ! new process arguments buffer & temp pointer 
character                   DirName*512             ! current DirName for new process
character                   szPgmName*(MAX_PATH)    ! name of the program 
logical(4)                  fSuccess                ! API return code
type(T_STARTUPINFO)         si                      ! used for CreateProcess 
type(T_PROCESS_INFORMATION) pi                      ! used for CreateProcess 

logical(4)                  bMoreParams     ! flag end of new process parameter processing 
logical(4)                  bWait           ! wait/no wait for new process to end 
integer                     dwResult        ! API return code 
integer                     dwCreate        ! new process creation flags 
integer                     bExtension      ! input filename have an explicit extension? 
integer                     SIZEOFSTARTUPINFO 
integer                     SIZESECURITYATTRIBUTES
integer                     i
character*5                 aExt(4)
type(T_SECURITY_ATTRIBUTES) sa, sb


integer SIZEOFSzArgs

data    (aExt(i), i=1,4) /".exe"C, ".com"C, ".bat"C, ".cmd"C /
data DirName /'0'/
dwCreate = CREATE_NEW_CONSOLE 

NEXT = 2
SIZEOFSTARTUPINFO = 68
SIZEOFSzArgs = 512
SIZESECURITYATTRIBUTES = 12
bWait = .FALSE.
! Check to make sure we are working on Windows NT
if  (iand (GetVersion(), #80000000) .NE. 0) then
   res = MessageBox(NULL, &
            "Sorry, this application requires Windows NT.This application will now terminate."C,   &         
            "Error: Windows NT Required to Run"C, &
            MB_OK )
end if

! process all command-line parameters 
argc = NARGS()
if (argc < 2) then                       
    call help()
end if

res= lstrcpy (DirName(1:1),""C) !Initialize the path

call ZeroMemory (LOC (si), SIZEOFSTARTUPINFO) 
bMoreParams = .TRUE.
NEXT=1
do  while(bMoreParams .NEQV. .FALSE.)
    call GETARG(NEXT,argv,status) ! argv++ ; point to the first parameter 
    NEXT= NEXT +1
    if (status .NE. #FFFF) then
               argv(status+1:status+1)= char(0)
    end if
    if (status == -1) then ! if*argv is NULL we're missing the program name! 
        write (*,*) "Error: missing program name"
        call ExitProcess(1)
    end if
    if  ((argv(1:1) == '/') .OR. (argv(1:1) == '-')) then
        res= CharLower(argv)  
        select case (argv(2:2))!((*argv)[1])  letter after the '/' or '-' 
           case ('t')
                 si%lpTitle = LOC(argv(3:3)) !  /tTitle 
           case ('d')
             res= lstrcpy (DirName(1:1),argv(3:3)) ! /dPath 
           case ('h')
                 dwCreate = IOR(HIGH_PRIORITY_CLASS,dwCreate)! /h 
           case ('l')
                 dwCreate = IOR(IDLE_PRIORITY_CLASS,dwCreate)!  /l 
           case ('r')
           dwCreate = IOR(REALTIME_PRIORITY_CLASS,dwCreate)! /r 
           case ('m')
                select case (argv(3:3))
                       case ('i')
                            si%wShowWindow = SW_MINIMIZE       
                            si%dwFlags = IOR(STARTF_USESHOWWINDOW, si%dwFlags)
                       case ('a')
                            si%wShowWindow = SW_SHOWMAXIMIZED
                            si%dwFlags = IOR (STARTF_USESHOWWINDOW, si%dwFlags)
                       case DEFAULT
                      write (*,*) "Error: invalid switch - \",argv
                       call help()
                 end select  
            case ('?')
                call help() !  help() will terminate app 
            case ('w')  
                bWait = .TRUE. !   don't end until new process ends as well 
            case ('c') 
                dwCreate = IAND(NOT(CREATE_NEW_CONSOLE),dwCreate)!   turn off this bit 
            case ('n')
                dwCreate = IOR(DETACHED_PROCESS,dwCreate) !   start detached 
            case DEFAULT
                write (*,*) "Error: invalid switch - ",argv
                call help()
        end select
    else ! not a '-' or '/', must be the program name 
        bMoreParams = .FALSE.
    end if 
end do

res=  lstrcpy(szPgmName,argv) ! copy program name as first param 
bExtension = LOC(szPgmName)+ index(szPgmName, '.',.FALSE.) ! has an extension?
if (bExtension == LOC(szPgmName)) then
    bExtension= 0 
end if
if (bExtension == 0) then
    res= lstrcat(szPgmName,aExt(1)) ! first extension to try 
end if 
call zeromemory (LOC(szArgs), SIZEOFszArgs)
res= lstrcpy(szArgs, szPgmName) ! first arg: program name 

do while (status .NE. #FFFF) !status .NE. -1
     res=  lstrcat  (szArgs, " "C)
     call GETARG(NEXT,argv,status)
     NExt= Next +1
     if (status .NE. #FFFF) then
               argv(status+1:status+1)= char(0)
               res= lstrcat (szArgs,argv)
     end if
end do
si%cb= SIZEOFSTARTUPINFO
i=1

sa%nLength = SIZESECURITYATTRIBUTES
sa%lpSecurityDescriptor = NULL
sa%bInheritHandle = .true.


sb%nLength = SIZESECURITYATTRIBUTES
sb%lpSecurityDescriptor = NULL
sb%bInheritHandle = .true.

!ULLIFY(null_process_information)

fSucess = .FALSE. ! to enter into while loop
do  while (fSuccess .EQV. .FALSE.)                 ! actual loop is do-while loop
    fSuccess = CreateProcess(null_character,    &  ! image file name             
                 szArgs,                        &  ! command line (including program name)     
                 NULL_security_attributes,      &  ! security for process                                     
                 NULL_security_attributes,      &  ! security for main thread                
                 .FALSE.,                       &  ! new process inherits handles?          
                 dwCreate,                      &  ! creation flags                      
                 NULL,                          &  ! environment                             
                 null_character,                &  ! new current DirName               
                 si,                            &  ! STARTUPINFO structure                
                 pi)                               ! PROCESSINFORMATION structure 

    if (fSuccess .EQV. .FALSE.) then
        select case (GetLastError())              !  process common errors 
            case (ERROR_FILE_NOT_FOUND)
                if ((bExtension .NE. 0) .OR. (isha (i,-3) .NE. 0))then
                    write (*,*) "Error: program or batch file not found"
                    call ExitProcess(1)
                else
                    i=i+1
                    res= lstrcpy(szArgs, aExt(i))
                end if
            case (ERROR_DIRECTORY)
                write (*,*)("Error: bad starting directory")
                call ExitProcess(1)

            case (ERROR_PATH_NOT_FOUND)
                write (*,*) "Error: bad path"
                call ExitProcess(1)

            case DEFAULT
                 write (*,50) GetLastError()
50               format ('GetLastError=',A12,'CreateProcess')
                 call ExitProcess(1)
        end select
    end if
end do

!  close pipe handle - child's instance will be closed when terminates 
res= CloseHandle(pi%hThread)
if  (bWait .NEQV. .FALSE.) then !  wait /Wtime wait flag specified? 
                                !   object to wait for 
    dwResult = WaitForSingleObject(pi%hProcess, -1) !  timeout time 
    if (dwResult == -1) then
        write (*,150) GetLastError()
150     format ('GetLastError=',A12,'WaitForSingleObject')
    end if
end if 
res= CloseHandle(pi%hProcess) !  close process handle or it won't die 
end

