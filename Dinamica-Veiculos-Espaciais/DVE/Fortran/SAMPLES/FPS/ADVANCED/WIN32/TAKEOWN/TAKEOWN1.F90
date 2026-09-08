integer*4 function AssertTakeOwnership(  TokenHandle)
!MS$ ATTRIBUTES VALUE :: TokenHandle
use msfwin
integer*4 TokenHandle
!//
!// This routine turns on SeTakeOwnershipPrivilege in the current
!// token.  Once that has been accomplished, we can open the file
!// for WRITE_OWNER even if we are denied that access by the ACL
!// on the file.

type (T_LARGE_INTEGER)  TakeOwnershipValue
integer*4 ret
character*100  lpszTempBuffer1, lpszTempBuffer2
type (T_TOKEN_PRIVILEGES)  TokenPriv
integer sizetokenpriv
!    //
!    // First, find out the value of TakeOwnershipPrivilege
!    //
 sizetokenpriv = 12 ! 4 dwords
 lpszTempBuffer1 = ""C
 lpszTempBuffer2 ="SeTakeOwnershipPrivilege"C
 ret = LookupPrivilegeValue(                                      &
            lpszTempBuffer1,                                             &
            lpszTempBuffer2,                     &
            LOC(TakeOwnershipValue)                               &
            )

if ( ret == 0 ) then

!        //
!        // This should not happen
!        //

!        printf("Unable to obtain value of TakeOwnership privilege\n");
!        printf("Error = %d\n",GetLastError());
!        printf("Exiting\n");
  write(*,*) 'Unable to obtain value of TakeOwnership Priviledge'
  AssertTakeOwnership = 0
  return
else
  write(*,*)'LookupPrivilegeValue succeeded' 
end if

!    //
!    // Set up the privilege set we will need
!    //

TokenPriv%PrivilegeCount = 1
TokenPriv%Privileges(1)%Luid = TakeOwnershipValue
TokenPriv%Privileges(1)%Attributes = SE_PRIVILEGE_ENABLED

ret = AdjustTokenPrivileges (       &
           TokenHandle,             &
           .FALSE.,                 &
           TokenPriv,               &
           sizetokenpriv,           &
           NULL_TOKEN_PRIVILEGES,   &
           NULL                     &
           )

if ( GetLastError() .NE.  ERROR_NO_ERROR ) then

  AssertTakeOwnership = 0

else 

  AssertTakeQwnership = 1
end if

end



integer*4 function VariableInitialization()
use takeinc
!//
!// Create some useful SIDs.
!//

logical(4)  bret


        
bret = AllocateAndInitializeSid(                                  &
            SepNtAuthority,                                       &
            INT1(2),                                              &
            SECURITY_BUILTIN_DOMAIN_RID,                          &
            DOMAIN_ALIAS_RID_ADMINS,                              &
            0,                                                    &
            0,                                                    &
            0,                                                    &
            0,                                                    &
            0,                                                    &
            0,                                                    &
            LOC(AliasAdminsSid)                                   &
            )

if (bret .eqv. .FALSE. ) then
    VariableInitialization = 0
    return
else
    write(*,*)'AllocateAndInitializeSid (NtAuthority) succeeded'
end if


bret = AllocateAndInitializeSid(                                  &
            SepWorldSidAuthority,                                 &
            INT1(1),                                              &
            SECURITY_WORLD_RID,                                   &
            0,                                                    &
            0,                                                    &
            0,                                                    &
            0,                                                    &
            0,                                                    &
            0,                                                    &
            0,                                                    &
            LOC(SeWorldSid)                                            &
            )


if ( bret .eqv. .FALSE.) then
    VariableInitialization = 0
    return
else
    write(*,*)'AllocateAndInitializeSid (WorldSidAuthority) succeeded'
end if

VariableInitialization = 1
return
end
