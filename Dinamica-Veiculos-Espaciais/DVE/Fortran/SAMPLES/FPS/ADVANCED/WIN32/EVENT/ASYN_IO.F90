!/****************************************************************************\
!**   MODULE:  IO.F90                                                       **
!**                                                                         **
!**                                                                         **
!**   PURPOSE: Demonstrates the basic concepts envolved when using          **
!**            asynchronous IO. In particular the main advantage is your    **
!**            app more correctly thread can go about doing useful work     **
!**            while waiting for IO. The main disadvantage is you must keep **
!**            track of the file pointer.                                   **
!**                                                                         **
!**   INPUT: Both the File to read and File to write to must be entered     **
!**          on via the command line. Note the file to write to must be     **
!**          unique.                                                        **
!**                                                                         **
!**   FUNCTIONS:                                                            **
!**                                                                         **
!**       Do_BackgroundTask()                                               **
!**                                                                         **
!**                                                                         **
!**   COMMENTS: Reads a file asynchronously writes to another synchronously **
!**                                                                         **
!**                                                                         **
!\***************************************************************************/
program asyn_io
use asynioin
interface 
subroutine ErrorMsg (psz)
!MS$ATTRIBUTES VALUE :: psz
integer*4   psz
end subroutine
end interface
!***************************************************************************\
!**                                                                          **
!**  This block of code initalizes all the necessary variables needed to do **
!**  asynchronous IO. Specfically it opens the files and initializes the    **
!**  synchronization EVENT and OVERLAPPED structure needed to keep track    **
!**  of asynchronous file I/O                                               **
!**                                                                         **
!***************************************************************************/
  character Buffer*80, buffer1*80, buffer2*80 

   argc = nargs()
   if ( argc .ne. 3 ) then
      write (*,*)
      write (*,*) 'Usage: Event input_file output_file'  
      write (*,*)
      call ExitProcess(1)
   end if

   call getarg ( 1, buffer1, status )
   if ( status == -1 ) then
      write (*,*) "Error in argument1"C
   end if
   buffer1(13:13) = char (0)

   call getarg ( 2, buffer2, status )
   if ( status == -1 ) then
      write (*,*) "Error in argument2"C
   end if 
   buffer2(13:13) = char(0)
   
!/*
! * Open file which we will be copying. Note we are opening this
! * asynchronously.
! */

   hInfile = CreateFile (   buffer1                     &   !// File to read             
                           ,GENERIC_READ                &   !// Open file for reading only 
                           ,FILE_SHARE_READ             &   !// Allow others to read file
                           ,NULL_SECURITY_ATTRIBUTES    &   !// No security              
                           ,OPEN_EXISTING               &   !// Fail if file doesn't exit
                           ,FILE_FLAG_OVERLAPPED        &   !// Async I/o                
                           ,DEFAULT)


   if ( hInfile == IO_ERROR ) then
      buffer = "Error opening"C
      write (*,*)
      ilstr = lstrlen("Error Opening"C)
      ret = lstrcpy (buffer1,buffer)
      buffer1(ilstr+1:ilstr+1) = char(0)
      write (*,300)  buffer1, GetLastError() 
300   format (A, ' : return code = ', I2)
      write (*,*)
      call ExitProcess (1)
   end if

!
!Create the file to write to; here we have opened it for synchronous IO.
!

   hOutfile = CreateFile( buffer2               &   !// File to write to      
                     ,GENERIC_WRITE             &   !// Open file only to write to 
                     ,DEFAULT                   &   !// No sharing allowed    
                     ,NULL_SECURITY_ATTRIBUTES  &   !// No security           
                     ,CREATE_NEW                &   !// Fail if file exists   
                     ,FILE_ATTRIBUTE_NORMAL     &   !// No attributes         
                     ,DEFAULT)
   if ( hOutfile == IO_ERROR ) then
      buffer = "Error opening"
      call ErrorMsg ( LOC(buffer))
   end if


!/*
! * Create Synchronoizing Event
! */

   hEvent = CreateEvent( NULL_SECURITY_ATTRIBUTES   &   !// No security                          
                        ,.TRUE.                     &   !// Manual reset                         
                        ,.FALSE.                    &   !// Initially Event set to non-signaled state 
                        ,""C)                           !// No name                              
   if ( hEvent == 0 ) then
      buffer = "Error creating Event"C
      call ErrorMsg ( LOC(buffer))
   end if

!/*
! * Intialize OverLapped structure. We will be using an Event instead
! * of the file handle for synchronizing I/O. One reason to use a unique
! * event instead of the file handle would be a so multi-threaded app
! * would know which thread to unblock when the handle is set to the
! * signaled state.
! */

   call FillMemory (LOC(OverLaped), SIZEOFOVERLAPPED, 0 )
   OverLaped%hEvent = hEvent
   bSuccess = TRUE
!/***************************************************************************\
!**                                                                         **
!** This is the main function of this program. Here we loop until the file  **
!** has been copied. Notice that even though we are using asynchronous I/O  **
!** ReadFile() may still return sychronously if it can be done fast enough  **
!**                                                                         **
!\***************************************************************************/

   do while ( bSuccess .ne. 0 )
   !/*
   ! * Read file asynchronously
   ! */
      bSuccess = ReadFile (hInfile              &   !// Handle of file to read
                           ,LOC(buf)            &   !// Buffer to store input
                           ,SECTOR_SIZE         &   !// Number of bytes to read
                           ,LOC(cbBytesRead)    &   !// Number of bytes read. See note 
                                                    !// above in delcaration
                           ,OverLaped)              !// Used for asynchronous I/O

   !/*
   ! * Check whether ReadFile() has completed yet
   ! */      
      dwStatus = GetLastError ()
      if ((bSuccess == 0) .AND. (dwStatus == ERROR_IO_PENDING ) ) then
         write (*,*)
         write (*,*) 'IO Pending'     
!/*
! * Read not complete yet first execute the background task then check
! * to the if event "hEvent" set to the signaled state. If the event is
! * not set signaled state then loop through again - run the background
! * task and check the event.
! *
! */

         call Do_BackgroundTask ()
         dwSuccess = WaitForSingleObject(hEvent,RETURN_IMEDIATELY)
         if ( dwSuccess == WAIT_ERROR ) then
            buffer = "Error in WaitForSingleObject"C
            call ErrorMsg(LOC(buffer))
         else if ( dwSuccess == SCCESS ) then
            bSuccess = GetOverlappedResult(hInfile,OverLaped,&
                          LOC(cbBytesTransfered), .FALSE.)
            if ( bSuccess == 0 ) then
               buffer = "Error in GetOverLappedResult"C
               call ErrorMsg(LOC(buffer))
            else
              !// Read has completed now find out how many bytes have been read
               write (*,*)
               write (*,400) ( cbBytesTransfered )
               write (*,*)
400                  format (' Number of bytes transfered is ' I5)  
               OverLaped%Offset = OverLaped%Offset + cbBytesTransfered
               cbBytesRead = cbBytesTransfered
            end if
         else if ( dwSuccess == WAIT_TIMEOUT ) then
            call Do_BackgroundTask ()
         end if
 
!/*
! * ReadFile() read file synchronously; update Overlapped structure
! */                 
         else if ( (bSuccess .ne. 0)  .AND. (cbBytesRead .ne. 0) ) then
            write (*,*)
            write (*,200) ( cbBytesRead )
200         format (' Number of bytes transfered is ' , I5)
            write (*,*)
            OverLaped%Offset = OverLaped%Offset + cbBytesRead

!/*
! * ReadFile() has found the end of the file; exit loop
! */
         else if ( (bSuccess .ne. 1) .AND.  (cbBytesRead == 0) ) then
               dwStatus = GetLastError()
               if (dwStatus == ERROR_HANDLE_EOF) then       
               write (*,*) ' End of file read'
               write (*,*) 
               goto 100
               end if 
!/*                                 
! * An error occured while reading, print out status and exit loop.
! */
         else
            buffer = "Error reading to file"C
            call ErrorMsg (LOC(buffer))
         end if
!/*
! * Write to file synchronously
! */
         bSuccess = WriteFile (hOutfile                 &   !// Handle of file to write to
                                 ,LOC(buf)              &   !// Data to write to file   
                                 ,cbBytesRead           &   !// Number of bytes to write
                                 ,LOC(cbBytesWritten)   &   !// Number of bytes written 
                                 ,NULL_OVERLAPPED )         !// Only need for asynchonous output
         if ( bSuccess == 0 ) then
            buffer = "Error writing to file"C
            call ErrorMsg (LOC(buffer))
         end if

      end do   !// End of WHILE loop

100   ret = CloseHandle ( hInfile )        !// Close handle to input file
      ret = FlushFileBuffers ( hOutfile )  !// Make sure all data written to file first
      ret = CloseHandle ( hOutfile )       !// Close handle to output file
end program

                              
!/***************************************************************************\
!**                                                                         **
!**   FUNCTION: Do_BackgroundTask ()                                        **
!**                                                                         **
!**   PURPOSE: Works in the background while IO sytems                      **
!**                                                                         **
!**   COMMENTS:                                                             **
!**                                                                         **
!**      Currently this does nothing if I have the time I will come up      **
!**      with some silly task to keep the user entertained.                 **
!**                                                                         **
!**   INPUT: None                                                           **
!**                                                                         **
!**   OUTPUT: None                                                          **
!**                                                                         **
!\***************************************************************************/

subroutine  Do_BackgroundTask ()
   call sleepqq ( 5000 )
end 



subroutine  ErrorMsg (lpsz)
!MS$ATTRIBUTES VALUE::lpsz
use asynioin
integer*4       lpsz
character*25    Str
integer*4       lstr, ret
character*512   TempString


iret = ConvertFToCString(TempString,lpsz)

   write (*,*)
   lstr = lstrlen(TempString)
   ret = lstrcpy (Str,TempString)
   Str(lstr+1:lstr+1) = char(0)
   write (*,300)  Str, GetLastError() 
300   format (A, ' : return code = ', I2)
   write (*,*)
   call ExitProcess (1)
end




