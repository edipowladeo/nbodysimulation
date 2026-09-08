!************************************************************************
!                               BounceProc
!************************************************************************
subroutine BounceProc ( cMyID )                 
!MS$ATTRIBUTES REFERENCE :: cMyID
use msfwin
use bouncein

integer        cMyID
integer        getrandom[EXTERN]
character*1    MyCell, OldCell
integer*2      MyAttrib, OldAttrib
character*1    BlankCell
type(T_COORD)  Coords, Delta
type(T_COORD)  Old
integer        Dummy

             
! Generate update increments and initial display coordinates. 
! Here a function getchar(MyID) will be called which will return
! the character to which MyID points.

   old%x = 0
   old%y = 0
   BlankCell = ' '
   call seed( cMyID * 3 )
   Coords%X = INT2(getrandom( 0, csbiInfo%dwSize%X - 1 ))
   Coords%Y = INT2(getrandom( 0, csbiInfo%dwSize%Y - 1 ))
   Delta%X = INT2(getrandom( -3, 3 ))
   Delta%Y = INT2(getrandom( -3, 3 ))

!/* Set up "happy face" & generate color attribute from thread number.*/
   if( cMyID > 16) then
      MyCell = char(1)                 !/* outline face */
   else
      MyCell = char(2)                 !/* solid face */
   end if   

   MyAttrib =  IAND(cMyID , 16#0F)   !/* force black background */
   i1=1

   do while(i1 .eq. 1)
    ! Wait for display to be available, then lock it.
      itemp = hScreenMutex 
      iret = WaitForSingleObject( hScreenMutex, INFINITE )
      if (iret .eq. WAIT_FAILED) then 
         ierror = GetLastError()
      end if
      ! If we still occupy the old screen position, blank it out. 
      lret = ReadConsoleOutputCharacter(hConsoleOut, OldCell, 1,Old, loc(Dummy) )
      lret = ReadConsoleOutputAttribute(hConsoleOut, LOC(OldAttrib),1, Old, loc(Dummy)) 

      lret = WriteConsoleOutputCharacter(hConsoleOut,BlankCell,1,Old,loc(Dummy)) 

      !/* Draw new face, then clear screen lock */
      lret = WriteConsoleOutputCharacter( hConsoleOut, MyCell,1, Coords, loc(Dummy)) 
      lret = WriteConsoleOutputAttribute( hConsoleOut,LOC(MyAttrib),1, Coords, loc(Dummy)) 
      lret = ReleaseMutex( hScreenMutex )

      !/* Increment the coordinates for next placement of the block. */
      Old%X = Coords%X
      Old%Y = Coords%Y
      Coords%X = Coords%X + Delta%X
      Coords%Y = Coords%Y + Delta%Y
                         
    !/* If we are about to go off the screen, reverse direction */
      if ((Coords%X < 0) .OR.(Coords%X >= csbiInfo%dwSize%X)) then
         Delta%X = -Delta%X
         dummy = beep( 400, 50 )
      end if
      if((Coords%Y < 0) .OR.(Coords%Y > csbiInfo%dwSize%Y)) then
         Delta%Y = -Delta%Y
         dummy = beep( 600, 50 )
      end if
      if ((WaitForSingleObject( hRunMutex, INT4(75) ) .ne. WAIT_TIMEOUT )) then
         exit
      end if
      !/* Repeat while RunMutex is still taken. */
   end do 
end                             
