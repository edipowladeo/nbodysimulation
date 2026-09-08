!****************************************************************************\
!*
!* FUNCTION: SetPrivilegeInAccessToken
!*
!****************************************************************************/

integer*4 function SetPrivilegeInAccessToken()
use chksdinc
integer*4           hProcess
integer*4           hAccessToken
type (T_LARGE_INTEGER)              luidPrivilegeLUID
type (T_TOKEN_PRIVILEGES)  tpTokenPrivilege

hProcess = GetCurrentProcess()
if (hProcess == 0) then
    call PERR("GetCurrentProcess")
    SetPrivilegeInAccessToken = 0
    return
end if

if (OpenProcessToken(hProcess,                                    &
                         IOR(TOKEN_ADJUST_PRIVILEGES,TOKEN_QUERY),&
                         LOC(hAccessToken)) .eqv. .FALSE.) then
    call PERR("OpenProcessToken")
    SetPrivilegeInAccessToken = 0
    return
end if

!**************************************************************************\
!*
!* Get LUID of SeSecurityPrivilege privilege
!*
!**************************************************************************/

if (LookupPrivilegeValue(NULL_CHARACTER,                                     &
                             "SeSecurityPrivilege"C,              &
                             LOC(luidPrivilegeLUID)) .EQV. .FALSE.) then
    call  PERR("LookupPrivilegeValue")
    write(*,*)
    write(*,*) "The above error means you need to log on as an Administrator"
    SetPrivilegeInAccessToken = 0
    return
end if

!**************************************************************************\
!*
!* Enable the SeSecurityPrivilege privilege using the LUID just
!*   obtained
!*
!**************************************************************************/

tpTokenPrivilege%PrivilegeCount = 1
tpTokenPrivilege%Privileges(1)%Luid = luidPrivilegeLUID
tpTokenPrivilege%Privileges(1)%Attributes = SE_PRIVILEGE_ENABLED

i = AdjustTokenPrivileges (hAccessToken,            &                
                          .FALSE.,                  &    ! Do not disable all            
                          tpTokenPrivilege,         &
                          SIZEOFTOKEN_PRIVILEGES,   &                
                          NULL_TOKEN_PRIVILEGES,                     &    ! Ignore previous info          
                          NULL)         ! Ignore previous info

if ( GetLastError() .NE. ERROR_NO_ERROR ) then
    call PERR("AdjustTokenPrivileges"C)
    SetPrivilegeInAccessToken = 0
    return
end if

SetPrivilegeInAccessToken = 1
return
end 

!****************************************************************************\
!*
!* FUNCTION: InitializeWellKnownSIDs
!*
!****************************************************************************/

subroutine InitializeWellKnownSIDs()
use chksdinc
use msfwin

integer*4 dwSidWith0SubAuthorities
integer*4 dwSidWith1SubAuthority
integer*4 dwSidWith2SubAuthorities
integer*4 dwSidWith3SubAuthorities
integer*4 dwSidWith4SubAuthorities
integer*4   sidval


!  These SID sizes need to be allocated

dwSidWith0SubAuthorities = GetSidLengthRequired( '0' )
dwSidWith1SubAuthority   = GetSidLengthRequired( '1' )
dwSidWith2SubAuthorities = GetSidLengthRequired( '2' )
dwSidWith3SubAuthorities = GetSidLengthRequired( '3' )
dwSidWith4SubAuthorities = GetSidLengthRequired( '4' )

!  Allocate and initialize the universal SIDs       

psidNullSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidWorldSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidLocalSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidCreatorOwnerSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidCreatorGroupSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)

ret = InitializeSid( psidNullSid, siaNullSidAuthority,  INT1(1))
ret = InitializeSid( psidWorldSid, siaWorldSidAuthority, INT1(1))
ret = InitializeSid( psidLocalSid, siaLocalSidAuthority, INT1(1))
ret = InitializeSid( psidCreatorOwnerSid, siaCreatorSidAuthority,INT1(1))
ret = InitializeSid( psidCreatorGroupSid, siaCreatorSidAuthority,INT1(1))
sidval = SECURITY_NULL_RID
i = GetSidSubAuthority( psidNullSid, 0 )
call CopyMemory(i, LOC(sidval), 4) 

sidval = SECURITY_WORLD_RID
i = GetSidSubAuthority( psidWorldSid, 0 )
call CopyMemory(i, LOC(sidval), 4) 

sidval = SECURITY_LOCAL_RID
i = GetSidSubAuthority( psidLocalSid, 0 )
call CopyMemory(i, LOC(sidval), 4)

sidval = SECURITY_CREATOR_OWNER_RID
i = GetSidSubAuthority( psidCreatorOwnerSid, 0 )
call CopyMemory(i, LOC(sidval), 4)

sidval = SECURITY_CREATOR_GROUP_RID
i = GetSidSubAuthority( psidCreatorGroupSid, 0 )
call CopyMemory(i, LOC(sidval), 4)

! Allocate and initialize the NT defined SIDs

psidNtAuthoritySid = LocalAlloc(LPTR, dwSidWith0SubAuthorities)
psidDialupSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidNetworkSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidBatchSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidInteractiveSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidLogonIdsSid = LocalAlloc(LPTR, dwSidWith3SubAuthorities)
psidServiceSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidLocalSystemSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)
psidBuiltinDomainSid = LocalAlloc(LPTR, dwSidWith1SubAuthority)

ret = InitializeSid( psidNtAuthoritySid,   siaNtAuthority, INT1(0))
ret = InitializeSid( psidDialupSid,        siaNtAuthority, INT1(1))
ret = InitializeSid( psidNetworkSid,       siaNtAuthority, INT1(1))
ret = InitializeSid( psidBatchSid,         siaNtAuthority, INT1(1))
ret = InitializeSid( psidInteractiveSid,   siaNtAuthority, INT1(1))
ret = InitializeSid( psidLogonIdsSid,      siaNtAuthority, INT1(3))
ret = InitializeSid( psidServiceSid,       siaNtAuthority, INT1(1))
ret = InitializeSid( psidLocalSystemSid,   siaNtAuthority, INT1(1))
ret = InitializeSid( psidBuiltinDomainSid, siaNtAuthority, INT1(1))

sidval = SECURITY_DIALUP_RID
i = GetSidSubAuthority( psidDialupSid,  0 )
call CopyMemory(i, LOC(sidval), 4)

sidval = SECURITY_NETWORK_RID
i = GetSidSubAuthority( psidNetworkSid,  0 )
call CopyMemory(i, LOC(sidval), 4)

sidval = SECURITY_BATCH_RID
i = GetSidSubAuthority( psidBatchSid,  0 )
call CopyMemory(i, LOC(sidval), 4)

sidval = SECURITY_INTERACTIVE_RID
i = GetSidSubAuthority( psidInteractiveSid,  0 )
call CopyMemory(i, LOC(sidval), 4)

sidval = SECURITY_LOGON_IDS_RID
i = GetSidSubAuthority( psidLogonIdsSid,  0 )
call CopyMemory(i, LOC(sidval), 4)

sidval = 0
i = GetSidSubAuthority( psidLogonIdsSid,  1 )
call CopyMemory(i, LOC(sidval), 4)

sidval = 0                                           
i = GetSidSubAuthority( psidLogonIdsSid,  2 )
call CopyMemory(i, LOC(sidval), 4)

sidval = SECURITY_SERVICE_RID
i = GetSidSubAuthority( psidServiceSid,  0 )
call CopyMemory(i, LOC(sidval), 4)

sidval = SECURITY_LOCAL_SYSTEM_RID                          
i = GetSidSubAuthority( psidLocalSystemSid,  0 )
call CopyMemory(i, LOC(sidval), 4)

sidval = SECURITY_BUILTIN_DOMAIN_RID
i = GetSidSubAuthority( psidBuiltinDomainSid,  0 )
call CopyMemory(i, LOC(sidval), 4)

end
