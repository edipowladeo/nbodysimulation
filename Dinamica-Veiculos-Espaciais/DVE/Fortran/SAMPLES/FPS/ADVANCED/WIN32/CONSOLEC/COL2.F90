!/************************************************************************\
!*
!* FUNCTION    : GetConsoleTextAttribute
!*
!* INPUTS      : hConsole - handle to an open console
!*
!* RETURNS     : Current text attributes WORD.
!*
!* GLOBAL VARS : None.
!*
!* LOCAL VARS  : csbi - Console screen buffer information structure
!*
!* COMMENTS    : Gets the previous console color attributes
!*
!\************************************************************************/
integer*2 function GetConsoleTextAttribute( hConsole )
use msfwin
use colorin
integer hConsole

type (T_CONSOLE_SCREEN_BUFFER_INFO)     csbi

   i =  GetConsoleScreenBufferInfo( hConsole, csbi)
   GetConsoleTextAttribute = csbi%wAttributes
end 
