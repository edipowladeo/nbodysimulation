program child
!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/

!/* Standard output handle/standard error handle redirection test
!program */

!/* get the standard output handle and standard error handle and
!write a message to each */

use msfwin
integer     cBytesWritten
integer     hStdErr, hStdOut, hConout
logical(4)     fSuccess
character*38    stdErrMsg
character*38    stdOutMsg

stdErrMsg=" Hello from child to standard error!" // char(10)      &
            //""C
stdOutMsg="Hello from child to standard output!" // char(10)      &
            //""C
hConout = CreateFile("CONOUT$"C,                       &
                IOR(GENERIC_READ , GENERIC_WRITE),          &
                IOR(FILE_SHARE_READ , FILE_SHARE_WRITE),    &
                NULL_SECURITY_ATTRIBUTES, OPEN_EXISTING,                        &
                FILE_ATTRIBUTE_NORMAL, NULL)
if (hConout == -1) then
    call Beepqq(5000,500) !/* no reliable way of reporting errors to the console */
end if
              !/* if we can't open a console handle */
hStdErr = GetStdHandle(STD_ERROR_HANDLE)
if (hStdErr == INVALID_HANDLE_VALUE) then
    call myError(hConout, "GetStdHandle")
end if
hStdOut = GetStdHandle(STD_OUTPUT_HANDLE)
if (hStdOut == INVALID_HANDLE_VALUE) then
    call myError(hConout, "GetStdHandle")
end if
fSuccess = WriteFile(hStdErr, LOC(stdErrMsg), len(stdErrMsg),     &
                LOC(cBytesWritten), NULL_OVERLAPPED)
if (fSuccess .eqv. .FALSE.) then
    call myError(hConout, "WriteFile")
end if
fSuccess = WriteFile(hStdOut, LOC(stdOutMsg), len(stdOutMsg),     &
                    LOC(cBytesWritten), NULL_OVERLAPPED)
if (fSuccess .eqv. .FALSE.) then
    call myError(hConout, "WriteFile")
end if
ret = CloseHandle(hConout)
end


!/* This function opens up a handle to CONOUT$ so that we can be
!guaranteed to get error messages to the console even if the standard
!handles are redirected. */

subroutine myError(h, api)
use msfwin
integer         h
character*30    api
character       buf*512
logical*4       fSuccess
integer*4       cBytesWritten
integer*4       hConout

write(buf, 100) GetLastError(), api
100   FORMAT(' Error ', I5, 'from ', A )

fSuccess = WriteFile(h, LOC(buf), len(buf), LOC(cBytesWritten),   &
                    NULL_OVERLAPPED)
if (fSuccess .eqv. .FALSE.) then
    hConout = CreateFile("CONOUT$"C,                         &
                    IOR(GENERIC_READ , GENERIC_WRITE),            &
                    IOR(FILE_SHARE_READ , FILE_SHARE_WRITE),      &
                    NULL_SECURITY_ATTRIBUTES, OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,    &
                    NULL)
    write(buf, 100) GetLastError(), api
    fSuccess  = WriteFile(hConout, LOC(buf), len(buf),                  &
                    LOC(cBytesWritten), NULL_OVERLAPPED)
    fSuccess  = CloseHandle(hConout)
end if
return
end 


