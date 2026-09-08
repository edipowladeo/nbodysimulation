!****************************************************************************\
!*
!* FUNCTION: ExamineSD
!*
!****************************************************************************/

integer function ExamineSD(psdSD, kamKindOfMask)
!MS$ATTRIBUTES VALUE :: psdSD 
!MS$ATTRIBUTES VALUE :: kamKindOfMask 
use chksdinc
integer*4   psdSD
integer*4   kamKindOfMask

interface
integer*4 function ExamineACL (paclACL,lpszOldIndent, kamKindOfMask) 
!MS$ATTRIBUTES VALUE :: paclACL
!MS$ATTRIBUTES VALUE :: kamKindOfMask 
integer*4   paclACL 
character*(*)   lpszOldIndent
integer*4   kamKindOfMask 
end function ExamineACL


integer*4 function LookupSIDName(psidSID, lpszOldIndent)
!MS$ ATTRIBUTES VALUE :: psidSID
!MS$ATTRIBUTES REFERENCE :: lpszOldIndent
integer*4       psidSID 
character *(*)  lpszOldIndent
end function LookupSIDName
end interface

integer*4                        paclDACL
integer*4                        paclSACL
integer*4                        bHasDACL
integer*4                        bHasSACL
integer*4                        bDaclDefaulted
integer*4                        bSaclDefaulted
integer*4                        bOwnerDefaulted
integer*4                        bGroupDefaulted
integer*4                   psidOwner
integer*4                   psidGroup
integer*2                   sdcSDControl
integer*4                       dwSDRevision
integer*4                       dwSDLength

data    bHasDACL /0/, bHasSACL /0/, bDaclDefaulted /0/  
data    bSaclDefaulted /0/, bOwnerDefaulted /0/ 
data    bGroupDefaulted /0/

if (IsValidSecurityDescriptor(psdSD) .eqv. .FALSE.) then
    call PERR("IsValidSecurityDescriptor")
    ExamineSD = 0
    return
end if

dwSDLength = GetSecurityDescriptorLength(psdSD)
! Third parameter pointer to pointer
if (GetSecurityDescriptorDacl(psdSD,                              &
                            LOC(bHasDACL),                        &
                            LOC(paclDACL),                        &
                            LOC(bDaclDefaulted)) .EQV. .FALSE.) then
    call PERR("GetSecurityDescriptorDacl")
    ExamineSD = 0
    return
end if
! Third parameter pointer to pointer
if (GetSecurityDescriptorSacl(psdSD,                              &
                            LOC(bHasSACL),                        &
                            LOC(paclSACL),                        &
                            LOC(bSaclDefaulted)) .EQV. .FALSE.) then
    call PERR("GetSecurityDescriptorSacl")
    ExamineSD = 0
    return
end if
! 2nd parameter pointer to pointer
if (GetSecurityDescriptorOwner(psdSD,                             &
                            LOC(psidOwner),                       &
                            LOC(bOwnerDefaulted)) .EQV. .FALSE.) then
    call PERR("GetSecurityDescriptorOwner")
    ExamineSD = 0
    return
end if
! 2nd parameter pointer to pointer
if (GetSecurityDescriptorGroup(psdSD,                             &
                            LOC(psidGroup),                       &
                            LOC(bGroupDefaulted)) .EQV. .FALSE.) then
    call PERR("GetSecurityDescriptorGroup")
    ExamineSD = 0
    return
end if

if (GetSecurityDescriptorControl(psdSD,                           &
                            LOC(sdcSDControl),                    &
                            LOC(dwSDRevision)) .EQV. .FALSE.) then
    call PERR("GetSecurityDescriptorControl")
    ExamineSD = 0
    return
end if

write(*,100) dwSDLength,dwSDRevision
100   FORMAT(' SD is valid. SD is ',I5,' bytes long. SD revision is',I5)
     

select case (dwSDRevision)
    case      (SECURITY_DESCRIPTOR_REVISION1 )
        write(*,110) dwSDRevision
110   format (' SD revision is ',I5,' == SECURITY_DESCRIPTOR_REVISION1')

    case DEFAULT
        write(*,*) '! SD Revision is an IMPOSSIBLE SD revision!!! &
Perhaps a new revision was added...'
        ExamineSD = 0
        return
end select

if (IAND(SE_SELF_RELATIVE, sdcSDControl) .NE. 0) then
    write(*,*) 'SD is in self-relative format (all SDs returned by& 
the system are)'
end if

if (NULL == psidOwner) then
    write(*,*) 'SD''s Owner is NULL,so SE_OWNER_DEFAULTED is ignor&
ed'
else
    write(*,*) 'SD''s Owner is Not NULL'
    if (bOwnerDefaulted .NE. 0) then
        write(*,*) "SD's Owner-Defaulted flag is TRUE"
    else
        write(*,*) "SD's Owner-Defaulted flag is FALSE"
    end if
    if(LookupSIDName(psidOwner,NULL_CHARACTER) == 0) then
        call PERR("LookupSIDName failed")
    end if
end if

!**************************************************************************\
!*
!* The other use for psidGroup is for Macintosh client support
!*
!**************************************************************************/

if (NULL == psidGroup) then
    write(*,*) 'SD''s Group is NULL, so SE_GROUP_DEFAULTED is igno&
red'
    write(*,*) 'SD''s Group being NULL is typical, GROUP in SD(s) &
is mainly for POSIX compliance'
else
    if (bGroupDefaulted .NE. 0) then
        write(*,*) "SD's Group-Defaulted flag is TRUE"
    else
        write(*,*) "SD's Group-Defaulted flag is FALSE"
    end if
    if(LookupSIDName(psidGroup,NULL_CHARACTER) == 0) then
        call PERR("LookupSIDName failed")
    end if
end if

if (IAND(SE_DACL_PRESENT,sdcSDControl) .NE. 0) then
    write(*,*) "SD's DACL is Present"
    if (bDaclDefaulted .NE. 0) then
        write(*,*) "SD's DACL-Defaulted flag is TRUE"
    else
        write(*,*)"SD's DACL-Defaulted flag is FALSE"
    end if

    if (NULL == paclDACL) then
        write(*,*) "SD has a NULL DACL explicitly specified (allow&
s all access to Everyone)"
        write(*,*) '    This does not apply to this SD, but for   &
comparison,' 
        write(*,*) "    a non-NULL DACL pointer to a 0-length ACL &
allows  no access to   anyone"
    else if(ExamineACL(paclDACL, NULL_CHARACTER, kamKindOfMask) == 0)   &
                                                    then
        call PERR("ExamineACL failed")
    end if
else
    write(*,*) "SD's DACL is Not Present, so SE_DACL_DEFAULTED is &
ignored"
   write(*,*) "SD has no DACL at all (allows all access to Everyon&
e)"
end if


if(IAND(SE_SACL_PRESENT,sdcSDControl) .NE. 0) then
    write(*,*) "SD's SACL is Present"
    if (bSaclDefaulted .NE. 0) then
        write(*,*) "SD's SACL-Defaulted flag is TRUE"
    else
        write(*,*) "SD's SACL-Defaulted flag is FALSE"
    end if

    if (NULL == paclSACL) then
        write(*,*) "SD has a NULL SACL explicitly specified"
    else if(ExamineACL(paclSACL,NULL_CHARACTER,kamKindOfMask) == 0)   &
                                                    then
        call PERR("ExamineACL failed")
    end if
else
   write(*,*) 'SD''s SACL is Not Present, so SE_SACL_DEFAULTED is &
ignored'
   write(*,*) "SD has no SACL at all (or we did not request to see&
it)"
end if
end

!****************************************************************************
!*
!* FUNCTION: ExamineACL
!*
!****************************************************************************

integer*4 function ExamineACL (paclACL, lpszOldIndent, kamKindOfMask)
use chksdinc
integer*4                   paclACL              
character*(*)               lpszOldIndent
integer*4                   kamKindOfMask

external                        ExamineMask 
integer*4                       LookupSIDName [EXTERN]

character*(SZ_INDENT_BUF)           ucIndentBuf
type (T_ACL_SIZE_INFORMATION)       asiAclSize
type (T_ACL_REVISION_INFORMATION)   ariAclRevision
integer*4                           dwBufLength
integer*4                           dwAcl_i
type (T_ACCESS_ALLOWED_ACE)         AllowedAce
integer*4                           paaAllowedAce
integer*4                           dwAceFlags
integer*4                           dwExtraBits
character*(SZ_INDENT_BUF)           ucIndentBitsBuf
character*100                       lpszTempBuffer
integer*4                           PtrVal

call ZeroMemory (LOC(ucIndentBuf), SZ_INDENT_BUF)

PtrVal = LOC(lpszOldIndent)
if (PtrVal .ne. 0) then
    ret = lstrcpy (ucIndentBuf, lpszOldIndent)
end if
lpszTempBuffer= "  "C
ret = lstrcat (ucIndentBuf, lpszTempBuffer)

if (IsValidAcl(LOC(paclACL)) .EQV. .FALSE.) then
    call PERR("IsValidAcl")
    ExamineACL = 0
    return
end if

dwBufLength = SIZEOFACLSIZEINFO

if (GetAclInformation(LOC(paclACL),                               &
                          LOC(asiAclSize),                        &
                          dwBufLength,                            &
                          AclSizeInformation) .EQV. .FALSE.) then
    call PERR("GetAclInformation")
    ExamineACL = 0
    return
end if

dwBufLength = SIZEOFACLREVISION

if (GetAclInformation(LOC(paclACL),                               &
                      LOC(ariAclRevision),                        &
                      dwBufLength,                                &
                      AclRevisionInformation) .EQV. .FALSE.) then
    call PERR("GetAclInformation")
    ExamineACL = 0
    return
end if

write(*, 200) ucIndentBuf, asiAclSize%AceCount,                   &
   asiAclSize%AclBytesInUse, asiAclSize%AclBytesFree
200   FORMAT(A25, 'ACL has', I5, '(ACEs)', I5, 'Bytes Used', I5, 'Bytes Free')

write(*,300) ucIndentBuf,ariAclRevision%AclRevision
300   FORMAT (A25, 'ACL revision is', I5, ' == ')

select case (ariAclRevision%AclRevision)
    case      (ACL_REVISION1 )
        write(*,*) "ACL_REVISION1"

    case      (ACL_REVISION2 )
        write(*,*) "ACL_REVISION2"

    case DEFAULT
        write(*, 400) ucIndentBuf
400   FORMAT (A25, 'ACL Revision is an IMPOSSIBLE ACL revision!!! Perhap&
s a new revision was added...')
        ExamineACL = 0
        return
end select

do dwAcl_i = 0, asiAclSize%AceCount-1
    if (GetAce(LOC(paclACL),                                           &
                 dwAcl_i,                                         &
                 LOC(paaAllowedAce)) .EQV. .FALSE.) then
        ExamineACL = 0
        return
    end if                  
    call CopyMemory (LOC(AllowedAce), paaAllowedAce,              &
                            INT4(SIZEOFACCESS_ALLOWED_ACE))
    write(*,500) ucIndentBuf,dwAcl_i,AllowedAce%Header%AceSize
500   FORMAT  (A25, 'ACE ', I5, 'size  ', I5)

    dwAceFlags = AllowedAce%Header%AceFlags

    write(*,600) ucIndentBuf,dwAcl_i,dwAceFlags
600   FORMAT (A25, 'ACE ', I5, 'flags #', Z2)

    if (dwAceFlags .NE. 0) then
        ucIndentBitsBuf = ""C
        ucIndentBitsBuf = ucIndentBuf
        ucIndentBitsBuf = ucIndentBitsBuf // "            "C

        if (IAND(dwAceFlags,OBJECT_INHERIT_ACE) ==              &
            OBJECT_INHERIT_ACE) then
            write(*,*) ucIndentBitsBuf,                           &
                            '0x01 OBJECT_INHERIT_ACE   '
        end if
        if (IAND(dwAceFlags,CONTAINER_INHERIT_ACE) ==           &
            CONTAINER_INHERIT_ACE     ) then
            write(*,*) ucIndentBitsBuf,                           &
                            's0x02 CONTAINER_INHERIT_ACE '
        end if
        if (IAND(dwAceFlags,NO_PROPAGATE_INHERIT_ACE  ) ==      &
            NO_PROPAGATE_INHERIT_ACE  ) then
            write(*,*) ucIndentBitsBuf,                           &
                            '0x04 NO_PROPAGATE_INHERIT_ACE'
        end if
        if (IAND(dwAceFlags,INHERIT_ONLY_ACE) ==                &
            INHERIT_ONLY_ACE          ) then
            write(*,*) ucIndentBitsBuf,"0x08 INHERIT_ONLY_ACE "
        end if
        if (IAND(dwAceFlags,VALID_INHERIT_FLAGS) ==             &
            VALID_INHERIT_FLAGS       ) then
            write(*,*) ucIndentBitsBuf,"0x0F VALID_INHERIT_FLAGS"
        end if
        if (IAND(dwAceFlags,SUCCESSFUL_ACCESS_ACE_FLAG) ==      &
            SUCCESSFUL_ACCESS_ACE_FLAG) then
         write(*,*) ucIndentBitsBuf,"0x40 SUCCESSFUL_ACCESS_ACE_FL&
AG"
        end if
        if (IAND(dwAceFlags,FAILED_ACCESS_ACE_FLAG) ==          &
            FAILED_ACCESS_ACE_FLAG    ) then
            write(*,*) ucIndentBitsBuf,                           &
                            '0x80 FAILED_ACCESS_ACE_FLAG'
        end if

        dwExtraBits = IAND(dwAceFlags,(NOT( IOR(OBJECT_INHERIT_ACE&
                              , IOR(CONTAINER_INHERIT_ACE         &
                              ,IOR(NO_PROPAGATE_INHERIT_ACE       &
                              , IOR(INHERIT_ONLY_ACE              &
                              , IOR(VALID_INHERIT_FLAGS           &
                              ,IOR(SUCCESSFUL_ACCESS_ACE_FLAG     &
                             ,FAILED_ACCESS_ACE_FLAG)))))))))
        if (dwExtraBits .NE. 0) then
            write(*,700) ucIndentBuf,dwExtraBits
700   FORMAT(A25, 'Extra AceFlag bits  == #', Z8,                     &
 '<- This is a problem, should be all zeros')
        end if
    end if
                                      
    select case (INT4(AllowedAce%Header%AceType))
        case  (ACCESS_ALLOWED_ACE_TYPE)
            write(*,800) ucIndentBuf,dwAcl_i
800   FORMAT (A25,'ACE ', I5, 'is an ACCESS_ALLOWED_ACE_TYPE')

        case  (ACCESS_DENIED_ACE_TYPE)
            write(*,900) ucIndentBuf,dwAcl_i
900   FORMAT (A25,'ACE ', I5, 'is an ACCESS_DENIED_ACE_TYPE')

        case  (SYSTEM_AUDIT_ACE_TYPE)
            write(*,1000) ucIndentBuf,dwAcl_i
1000  FORMAT (A25,'ACE ', I5, 'is an SYSTEM_AUDIT_ACE_TYPE')

        case (SYSTEM_ALARM_ACE_TYPE)
            write(*,1100) ucIndentBuf,dwAcl_i
1100  FORMAT (A25,'ACE ', I5, 'is an SYSTEM_ALARM_ACE_TYPE')

        case DEFAULT
            write(*,1150) ucIndentBuf,dwAcl_i
1150  FORMAT (A25,'ACE ', I5, 'is an IMPOSSIBLE ACE_TYPE !!! Run debugge&
r, examine value')

            ExamineACL = 0
            return
      
    end select

    write(*,1200) ucIndentBuf,dwAcl_i,AllowedAce%Mask
1200  FORMAT (A25, 'ACE ', I5, 'mask               == 0x', Z8)

    call ExamineMask(AllowedAce%Mask, ucIndentBuf,           &
                                        kamKindOfMask)

    if(LookupSIDName(LOC(AllowedAce%SidStart), ucIndentBuf)       &
        == 0) then
        call PERR("LookupSIDName failed")
    end if
end do
end

