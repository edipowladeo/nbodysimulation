! ************************************************************************
! WriteTitle
! ************************************************************************
                            
subroutine WriteTitle( ThreadNum )
use msfwin
use bouncein

integer*4       ThreadNum
integer*4       lret
character*124   NThreadMsg


    if (ThreadNum .ne. 32) then 
        write (NThreadMsg, 100) ThreadNum
100     format ("Threads running :",I4, "  Press 'A' to start a thread,'Q' to quit.")
    else 
        write (NThreadMsg, 200) ThreadNum
200     format ("Threads running :",I4, "  Press 'Q' to quit." )
    end if
    lret = len_trim(NThreadMsg)
    NThreadMsg(lret+1:lret+1) = char(0)
    lret = SetConsoleTitle( NThreadMsg )
end 

!*************************************************************************
!ClearScreen
!*************************************************************************
subroutine ClearScreen()
use msfwin
use bouncein

integer*4      lret
integer        dummy
type (T_COORD)   Home 

   home%X = 0
   home%Y = 0
   NoOfCells = INT(csbiInfo%dwsize%X * csbiInfo%dwSize%y)
   lret = FillConsoleOutputCharacter( hConsoleOut, char(32), &
          INT(csbiInfo%dwSize%X * csbiInfo%dwSize%Y), Home, LOC(dummy) )
end 
        
