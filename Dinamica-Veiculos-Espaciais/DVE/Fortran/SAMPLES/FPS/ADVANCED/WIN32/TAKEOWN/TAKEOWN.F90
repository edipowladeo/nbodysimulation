 
!******************************************************************************\
!*       This is a part of the Microsoft Source Code Samples. 
!*       Copyright (C) 1993 Microsoft Corporation.
!*       All rights reserved. 
!*       This source code is only intended as a supplement to 
!*       Microsoft Development Tools and/or WinHelp documentation.
!*       See these sources for detailed information regarding the 
!*       Microsoft samples programs.
!******************************************************************************/

!*++
!*
!*Module Name:
!
!*    Takeown.f90
!
!*Abstract:
!
!*    Implements a recovery scheme to give an Administrator access to a 
!*    file that has been denied to all.  
!
!*Environment:
!
!*    Must be run from an Administrator account in order to perform 
!*    reliably.  
!
!**/
use takeinc

interface
integer*4 function GetTokenHandle( Token)
integer(4)  Token
end function GetTokenHandle

integer*4 function AssertTakeOwnership (TokenHandle)
!MS$ ATTRIBUTES VALUE :: TokenHandle
integer(4)  TokenHandle
end function AssertTakeOwnership

end interface

integer*4 VariableInitialization [EXTERN]
 
integer*4                   Result
integer*4                   ret
type(T_SECURITY_DESCRIPTOR) SecurityDescriptor
integer*4                   TokenHandle 
character                   buffer*80
integer*2                   status
logical(4)                  bret

include 'data.f90'

!
! We expect a file...
!
argc = nargs()

if (argc <=  1) then

  write(*,*) 'Must specify a file name'
  write(*,*) 'Usage: takeown filename'
  call ExitProcess(1)

end if

call getarg ( 1, buffer, status )
if ( status == -1 ) then
    write (*,*) 'Error in argument1'
end if

ret = VariableInitialization()

if ( ret == 0 ) then
    write(*,*) 'Out of memory'
end if


ret = GetTokenHandle( LOC(TokenHandle) )

if ( ret == 0) then

!        //
!        // This should not happen
!        //

    write(*,*) 'Unable to obtain the handle to our token, exiting'
end if 


!    //
!    // Attempt to put a NULL Dacl on the object
!    //
!
!bret  = InitializeSecurityDescriptor(                             &
!                LOC(SecurityDescriptor),                          &
!                SECURITY_DESCRIPTOR_REVISION )
!
!
!bret = SetSecurityDescriptorDacl (     &
!            LOC(SecurityDescriptor),    &
!            .TRUE.,                     &
!            NULL_ACL,                   &
!            .FALSE.                     &
!            )
!
!
!
!if ( bret .eqv. .FALSE.) then
!   write(*,*)'SetSecurityDescriptor failed'
!   write(*,*)'exiting'
!end if
!
!bret = SetFileSecurity(                                         &
!            buffer,                                                &
!            DACL_SECURITY_INFORMATION,                          &
!            SecurityDescriptor                                 &
!            )
!
!if ( bret .eqv. .TRUE. ) then
!   write(*,*) 'Successful, protection removed'
!end if 

!
!    //
!    // That didn't work.
!    //

!     //
!    // Attempt to make Administrator the owner of the file.
!    //

 bret = SetSecurityDescriptorOwner (                               &
            SecurityDescriptor,                              &
            AliasAdminsSid,                                       &
            .FALSE.                                                 &
            )

if ( bret .eqv. .FALSE. ) then
   write(*,*) 'SetSecurityDescriptorOwner failed, lasterror = ', GetLastError()
   call exit
end if


bret = SetFileSecurity(                                            &
            buffer,                                          &
            OWNER_SECURITY_INFORMATION,                           &
            SecurityDescriptor                               &
            )

 if ( bret .eqv. .FALSE. ) then

!        //
!        // That didn't work either.
!        //
!   //
!       // Assert TakeOwnership privilege, then try again.  Note that
!        // since the privilege is only enabled for the duration of 
!        // this process, we don't have to worry about turning it off
!        // again.
!        //

    Result = AssertTakeOwnership( TokenHandle) 

    if ( Result == 0 ) then
        write(*,*)'Could not enable SeTakeOwnership privilege'
        write(*,*)'Log on as Administrator and try again'
        call exit()
    end if


    bret = SetFileSecurity(                 &
              buffer,                       &
              OWNER_SECURITY_INFORMATION,   &
              SecurityDescriptor            &
              )

     if ( bret .eqv. .FALSE. ) then

          write(*,*)'Unable to assign Administrator as owner'
          write(*,*)'Log on as Administrator and try again'
          call exit()
     end if

end if

!    //
!    // Try to put a benign DACL onto the file again
!    //

bret = SetFileSecurity(                                         &
           buffer,                                           &
           DACL_SECURITY_INFORMATION,                             &
           SecurityDescriptor                                &
           )

if ( bret .eqv. .FALSE. ) then

!        //
!        // This should not happen.
!        //

    write(*,*) GetLastError()
10  format('SetFileSecurity unexpectedly failed', I4)
else 
    write(*,*)'Successful, protection removed'
end if
end

integer*4 function GetTokenHandle( Token)
!!MS$ ATTRIBUTES VALUE :: Token
use takeinc
integer*4 Token

!//
!// This routine will open the current process and return
!// a handle to its token.
!//
!// These handles will be closed for us when the process
!// exits.
!//

integer*4   ProcessHandle
logical(4)  bret

ProcessHandle = OpenProcess( PROCESS_QUERY_INFORMATION, .FALSE., GetCurrentProcessId())

if ( ProcessHandle == NULL ) then

!        //
!        // This should not happen
!        //
    write(*,*) 'OpenProcess failed'
    GetTokenHandle = 0
    return
else
    write(*,*) 'OpenProcess succeeded'
end if


bret = OpenProcessToken (                                   &
            ProcessHandle,                                  &
            IOR(TOKEN_ADJUST_PRIVILEGES, TOKEN_QUERY),      &
            Token    & ! this is actually LOC(TokenHandle) passed from main    
            )

if ( bret .eqv. .FALSE. ) then

!        //
!        // This should not happen
!        //
    write(*,*) 'OpenProcessToken failed'
    GetTokenHandle = 0
    return
else
    write(*,*)'OpenProcessToken succeeded'
end if

GetTokenHandle = 1
return
end


