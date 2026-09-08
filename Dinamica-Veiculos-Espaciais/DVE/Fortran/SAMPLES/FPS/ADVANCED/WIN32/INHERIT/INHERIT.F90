!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/

!/********************************************************************
!* This program is to demonstrate the use of anonymous pipes used as *
!* stdout and stderr replacements. One of two techniques can be      *
!* chose to do this: the SetStdHandle technique or the               *
!* STARTF_USESTDHANDLES technique. The SetStdHandle technique sets   *
!* the standard output handles to the pipe that we will read from,   *
!* which the child will inherit. The STARTF_USESTDHANDLES technique  *
!* passes the pipe handles to the child as standard handles via the  *
!* STARTUPINFO structure. The STARTF_USESTDHANDLES technique *must*  *
!* be used for "console-less" processes such as GUI applications or  *
!* detached processes.                                               *
!*                                                                   *
!* This program demonstrates the use of the following Win32 APIs:    *
!*   CreatePipe, CreateProcess.                                      *
!*                                                                   *
!* This program also uses the following Win32 APIs:                  *
!*   GetLastError, CreateFile, CloseHandle, CreateProcess, ReadFile, *
!*   WriteFile.                                                      *
!*                                                                   *
!*                                                                   *
!* Execution instructions:                                           *
!*                                                                   *
!*   inherit <trace file> <command to execute>                       *
!*   trace file is the name of the file where the stdout             *
!*     and stderr of command will be redirected                      *
!*                                                                   *
!*   command to execute can be either an external executable or an   *
!*     internal cmd.exe command.                                     *
!*                                                                   *
!*   Examples:                                                       *
!*                                                                   *
!*   inherit trace.txt chkdsk d:                                     *
!*   inherit trace.txt nmake /f foo.mak                              *
!*                                                                   *
!* Future enhancements:                                              *
!*   Open two separate pipes for stdout and stderr so that an app    *
!*   that closes one but not both of the standard handles will still *
!*   work; closing one or the other will close the write end of the  *
!*   pipe since both stdout and stderr are attached to the write     *
!*   end of the pipe. This will involve some re-working of the pipe  *
!*   read routine to handle both pipes, possibly asynchronously.     *
!********************************************************************/


!/* define USESTDHANDLES to use the new technique of passing the
!standard handles to the child process via the STARTUPINFO structure.
!This technique must be used for "console-less" parents such as GUI
!applications or detached applications. */
!MS$DEFINE USESTDHANDLES
use msfwin

!integer*4   USESTDHANDLES
character*64                    chReadBuffer !/*  pipe read buffer */
logical(4)                      bSuccess     !/* BOOL return code for APIs */
integer                         j
integer                         hOutFile            !/* handle to log file */
integer                         hReadPipe, hWritePipe, hWritePipe2  !/* handles to the anonymous pipe */
character*256                   szArgs               !/* child process argument buffer */
integer                         cchReadBuffer       !/* number of bytes read or to be written */
integer(4)                      argc
type (T_STARTUPINFO)            si
type (T_PROCESS_INFORMATION)    pi
type (T_SECURITY_ATTRIBUTES)    saPipe
integer*4                       stat
character*13                    buffer
integer*4                       indx
integer(4)                      SIZEOFSECURITY_ATTRIBUTES, SIZEOFSI
character*200                   lpszMessage
character,pointer :: CharPtr


SIZEOFSECURITY_ATTRIBUTES = 12
SIZEOFSI = 68
  !/* Check to make sure we are running on Windows NT */
if( IAND(GetVersion() , 16#80000000 ) .NE. 0) then
    lpszMessage = "Sorry, this application requires Windows NT.&
                  This application will now terminate."C 
    ret = MessageBox(NULL,                                        &
        lpszMessage,     &
        "Error: Windows NT Required to Run"C,  MB_OK )
end if
argc = nargs()
if (argc < 3) then
    write(*,*) "format: inherit <trace file> <command to execute>"
    write(*,*) "trace file is the name of the file where the stdout"
    write(*,*) "and stderr of command will be redirected"
    write(*,*) 
    write(*,*) "command to execute is command line of the function"
    write(*,*) "you wish to perform."
    write(*,*) 
    write(*,*) "Examples:"
    write(*,*) 
    write(*,*) "  inherit trace.txt chkdsk d:"
    write(*,*) "  inherit trace.txt nmake /f foo.mak"
    call exit (0)
end if

call getarg (1, buffer, stat)
!/* create the log file where we will save all output from child */ 
NULLIFY(NULL_SECURITY_ATTRIBUTES)
hOutFile = CreateFile(buffer,      &     !/* file to open */       
                GENERIC_WRITE,          &     !/* access mode */            
                FILE_SHARE_READ,        &     !/* share mode */             
                NULL_SECURITY_ATTRIBUTES,                   &     !/* security attributes */    
                CREATE_ALWAYS,          &     !/* creation flags - trash existing file */ 
                FILE_ATTRIBUTE_NORMAL,  &     !/* file attributes */   
                NULL)
if (hOutFile .NE. INVALID_HANDLE_VALUE) then
    call PERR(.TRUE., "CreateFile")
else
    call PERR(.FALSE., "CreateFile")
end if    

!/* set up the security attributes for the anonymous pipe */
saPipe%nLength = SIZEOFSECURITY_ATTRIBUTES
saPipe%lpSecurityDescriptor = NULL
!/* In order for the child to be able to write to the pipe, the handle */
!/* must be marked as inheritable by setting this flag: */
saPipe%bInheritHandle = .TRUE.

!/* create the pipe */
bSuccess = CreatePipe(       &                                     
            LOC(hReadPipe),  &   !/* read handle */                
            LOC(hWritePipe), &   !/* write handle */               
            saPipe,     &   !/* security descriptor */        
            0)                  !/* pipe buffer size */
call PERR(bSuccess, "CreatePipe")

  !/* Now we need to change the inheritable property for the readable
  !end of the pipe so that the child will not inherit that handle as
  !a "garbage" handle. This will keep us from having extra,
  !unclosable handles to the pipe. If your pipe will only be closed
  !when the child process terminates, this step may not be needed.
  !Alternatively, we could have opened the pipe with
  !saPipe.bInheritHandle = FALSE and changed the inherit property on
  !the *write* handle of the pipe to TRUE. */

bSuccess = DuplicateHandle(           &                            
                GetCurrentProcess(),  &    !/* source process */     
                hReadPipe,            &    !/* handle to duplicate */
                GetCurrentProcess(),  &    !/* destination process */ 
                NULL,                 &    !/* new handle - don't want one, change original handle */ 
                0,                    &    !/* new access flags - ignored since DUPLICATE_SAME_ACCESS */  
                .FALSE.,                &    !/* it's *not* inheritable */     
                DUPLICATE_SAME_ACCESS)
call PERR(bSuccess, "DuplicateHandle")
bSuccess = DuplicateHandle(GetCurrentProcess(),& !/* source process */
                        hWritePipe,            & !/* handle to duplicate */
                        GetCurrentProcess(),   & ! /* destination process */
                        LOC(hWritePipe2),      & !/* new handle, used as stderr by child */
                        0,                     & !/* new access flags - ignored since DUPLICATE_SAME_ACCESS */
                        .TRUE.,                & !/* it's inheritable */
                        DUPLICATE_SAME_ACCESS);
call PERR(bSuccess, "DuplicateHandle");

!$ if .not. defined (USESTDHANDLES)
  !/* If we're not using the STARTF_USESTDHANDLES flag, set the
  !standard output and error handles to the end of the pipe we want
  !the child to inherit. For this program, we don't want stdin
  !inherited so we'll also change the handle inheritance property of
  !standard in so that it is not inherited */

bSuccess = SetStdHandle(STD_OUTPUT_HANDLE, hWritePipe)
call PERR(bSuccess, "SetStdHandle")
bSuccess = SetStdHandle(STD_ERROR_HANDLE, hWritePipe2)
call PERR(bSuccess, "SetStdHandle")
bSuccess = DuplicateHandle(                &                       
            GetCurrentProcess(),           &     !/* source process */     
            GetStdHandle(STD_INPUT_HANDLE),&     !/* handle to duplicate */    
            GetCurrentProcess(),           &     !/* destination process */    
            NULL,                          &     !/* new handle - don't want one, change original handle */
            0,                             &     !/* new access flags - ignored since DUPLICATE_SAME_ACCESS */  
            .FALSE.,                         &     !/* it's *not* inheritable */             
            DUPLICATE_SAME_ACCESS)
call PERR(bSuccess, "DuplicateHandle")
!$ end if

!/* Set up the command-line buffer for the child */
call ZeroMemory (LOC(szArgs), len(szArgs))
call getarg (2, buffer, stat)
buffer(stat+1:stat+1) = char(0)
ret = lstrcpy(szArgs, buffer)
if (index (szArgs, ".") == NULL)  then !/* does it have a '.'? */
    ret = lstrcat(szArgs, ".exe"C)  !/* if not, assume it's an .exe */
end if

ret = lstrcat (szArgs," "C)
indx = index(szArgs, char(0))
do j = 3, argc-1 
    call getarg(j, buffer, stat)
    buffer (stat+1:stat+1) = char(0)
    do i = 0, stat
        szArgs(indx+i:indx+i) = buffer(i+1:i+1)
    end do
    szArgs(indx+i:indx+i) = char(20)
    szArgs(indx+i+1:indx+i+1) = char(0)
    indx = indx + stat
end do

!MS$ IF DEFINED (USESTDHANDLES)
!/* Set up the STARTUPINFO structure and spawn the child. If using
!the STARTF_USESTDHANDLES flag, be sure to set the CreateProcess
!fInheritHandles parameter too TRUE so that the file handles
!specified in the STARTUPINFO structure will be inheritied by the
!child. Note that we don't specify a standard input handle; the
!child will not inherit a valid input handle, so if it reads from
!stdin, it will encounter errors.

!We can close the returned child process handle and thread handle
!as we won't be needing them; you could, however, wait on the
!process handle to wait for the child process to end. */
  
call ZeroMemory (LOC(si), SIZEOFSI)
si%cb = SIZEOFSI
!$ if defined (USESTDHANDLES)
si%hStdOutput = hWritePipe
si%hStdError = hWritePipe2
si%dwFlags = STARTF_USESTDHANDLES
!MS$ELSE
!MS$ENDIF
NULLIFY(CharPtr)
bSuccess = CreateProcess(                   &                                     
                CharPtr,                    & !/* filename */                       
                szArgs,                     & !/* full command line for child */    
                NULL_SECURITY_ATTRIBUTES,   & !/* process security descriptor */    
                NULL_SECURITY_ATTRIBUTES,   & !/* thread security descriptor */     
                .TRUE.,                     & !/* inherit handles? Also use if STARTF_USESTDHANDLES */ 
                0,                          & !/* creation flags */                 
                NULL,                       & !/* inherited environment address */  
                CharPtr,                    & !/* startup dir NULL = start in current */ 
                si,                         & !/* pointer to startup info (input) */
                pi)                           !/* pointer to process info (output) */ 

call PERR(bSuccess, "CreateProcess")
ret = CloseHandle(pi%hThread)
ret = CloseHandle(pi%hProcess)

!/* We need to close our instance of the inheritable pipe write
!handle now that it's been inherited so that all open handles to
!the pipe are closed when the child process ends and closes its
!handles to the pipe. */

bSuccess = CloseHandle(hWritePipe)
call PERR(bSuccess, "CloseHandle")
bSuccess = CloseHandle(hWritePipe2)
call PERR(bSuccess, "CloseHandle")

!/* read from the pipe until we get an ERROR_BROKEN_PIPE */
do while (.TRUE.)
    bSuccess = ReadFile(                 &                         
                     hReadPipe,          &    !/* read handle */            
                     LOC(chReadBuffer),  &    !/* buffer for incoming data */             
                     len(chReadBuffer),  &    !/* number of bytes to read */                
                     LOC(cchReadBuffer), &    !/* number of bytes actually read */         
                     NULL_OVERLAPPED)                    !/* no overlapped reading */

    if ((bSuccess .EQV. .FALSE.)  .AND.                                  &
                (GetLastError() == ERROR_BROKEN_PIPE)) then
        exit  !/* child has died */
    end if
    call PERR(bSuccess, "ReadFile")
    if ((bSuccess .NEQV. .FALSE.) .AND. (cchReadBuffer .NE. 0)) then
    !/* write the data from the child to the file */
        bSuccess = WriteFile(       &                              
                hOutFile,           &   !/* write handle */               
                LOC(chReadBuffer),  &   !/* buffer to write */       
                cchReadBuffer,      &   !/* number of bytes to write */   
                LOC(cchReadBuffer), &   !/* number of bytes actually written */      
                NULL_OVERLAPPED)                   !/* no overlapped writing */
        call PERR(bSuccess, "WriteFile")

        !/* write buffer (of specified length) to console */
        write (*,*) chReadBuffer     
        call sleep(500)
        !printf("%.*s", cchReadBuffer, chReadBuffer)
    end if
end do
  !/* close the trace file, pipe handles */
ret = CloseHandle(hOutFile)
ret = CloseHandle(hReadPipe)
ret = 0
end


!/* Standard error macro for reporting API errors */
subroutine PERR(bSuccess, api) 
use msfwin
logical*4       bSuccess
character*(*)   api

    if (bSuccess .eqv. .FALSE.)  then
        write (*, 100) GetLastError(), api
100           format (' Error ', I5, ' from ', A)
    end if
end
