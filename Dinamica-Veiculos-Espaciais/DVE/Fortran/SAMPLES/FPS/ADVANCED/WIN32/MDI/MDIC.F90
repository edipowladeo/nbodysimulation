
!/******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!\******************************************************************************/
!
!Subroutine vTest
!
subroutine vTest(pInfo)
use mdiinc
integer*4  pInfo
character*100  lpszTempBuffer

pInfo = pInfo

lpszTempBuffer = "Inside vTest()"C
call OutputDebugString(lpszTempBuffer)
end 
