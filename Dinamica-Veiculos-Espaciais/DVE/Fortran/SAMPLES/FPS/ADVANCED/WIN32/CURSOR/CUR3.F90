!/****************************************************************************
!
!    FUNCTION: About(HWND, unsigned, WORD, LONG)
!
!    PURPOSE:  Processes messages for "About" dialog box
!
!    MESSAGES:
!
!        WM_INITDIALOG - initialize dialog box
!        WM_COMMAND    - Input received
!
!****************************************************************************/

integer function  About(hDlg, message, wParam, lParam)
!MS$ ATTRIBUTES STDCALL, ALIAS :'_About@16' :: About
use cursorin 

integer hDlg, message, wParam, lParam
lParam = lParam
   select case (message) 
      case (WM_INITDIALOG)
         About = .TRUE.

      case (WM_COMMAND)
        !// LOWORD added for portability
        if (LOWORD(wParam) == IDOK .OR. LOWORD(wParam) .eq. IDCANCEL) then
           i =  EndDialog(hDlg, 1)
           About = .TRUE.
        end if
   end select
   About = .FALSE.

end


!/****************************************************************************
!
!    FUNCTION: Sieve()
!
!    PURPOSE:  Example of time consuming process
!
!    COMMENTS:
!
!        Sieve of Eratosthenes, BYTE, Volume 8, Number 1, by Jim Gilbreath
!        and Gary Gilbreath.  Code changed to give correct results.
!
!        One could return the count, and after restoring the cursor, use
!        sprintf() to copy the information to a string which could then be
!        put up in a MessageBox().
!
!****************************************************************************/

integer function sieve()
use cursorin

integer  i, k
integer  iter, count

   do iter = 1, 20          !/* Does sieve NITER times */
      count = 0
      do i = 1, SIZEL          !/* Sets all flags TRUE    */
         flags(i) = .TRUE.
      end do

      do i = 2 ,8190 
         if (flags(i) .ne. 0) then                    !/* Found a prime?       */
            do k = i + i, 8190, i
               flags(k) = .FALSE.             !/* Cancelsits multiples */
            end do
            count = count + 1
         end if
      end do
   end do
   sieve = count
end

