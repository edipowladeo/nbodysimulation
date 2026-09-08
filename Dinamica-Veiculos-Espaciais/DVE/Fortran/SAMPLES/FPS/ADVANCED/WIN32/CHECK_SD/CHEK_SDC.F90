!****************************************************************************\
!*
!* FUNCTION: SIDStringName
!*
!****************************************************************************/

integer*4 function SIDStringName(psidSID, lpszSIDStringName)
!MS$ ATTRIBUTES VALUE :: psidSID
use chksdinc
use msfwin
integer*4       psidSID
character*(*)   lpszSIDStringName

!**************************************************************************\
!*
!* Unfortunately there is no api to return the SID Revision, and the number
!*   of bytes in the Identifier Authority must be expressed as a define
!*   (since the == operator won't operate on structures so mempcy has to be
!*   used for the identifier authority compares)
!*
!**************************************************************************/

integer*4       dwNumSubAuthorities
integer*4       dwLen
integer*4       dwSubAuthorityI
integer*4       sidval
character*6     sidstring
integer(4)      ret
character*100   lpszTempBuffer
type (T_SID)      sidSID
character*100   lpszRevisionNumber

lpszTempBuffer = "S-"C
ret = lstrcpy (lpszSIDStringName, lpszTempBuffer)
ret = inttochar(SID_REVISION, sidstring, 10)
ret = lstrcat (lpszSIDStringName, sidstring)
lpszTempBuffer = "-"C
ret = lstrcat (lpszSIDStringName, lpszTempBuffer)
dwLen = lstrlen(lpszSIDStringName)
call CopyMemory (LOC(sidSID), psidSID, SIZEOFSID)

if (SID_REVISION .NE. sidSID%Revision) then
    lpszTempBuffer = "bad_revision=="C
    
    ret = lstrcat(lpszSIDStringName,lpszTempBuffer)
    
    ret = lstrlen(lpszSIDStringName)

    ret = inttochar(INT4(sidSID%Revision),lpszRevisionNumber,10)

    ret = lstrcat(lpszSIDStringName,lpszRevisionNumber)
    
    dwLen = dwLen + lstrlen(lpszSIDStringName)
end if

call CopyMemory(LOC(siaSidAuthority),                             &
                GetSidIdentifierAuthority(psidSID), 6)

if (0 == memcmp(LOC(siaSidAuthority), LOC(siaNullSidAuthority), &
                        BytesInIdentifierAuthority)) then
    lpszTempBuffer = "0"C
    
    ret = lstrcat(lpszSIDStringName,lpszTempBuffer)

    dwLen = dwLen + lstrlen(lpszSIDStringName)

else if (0 == memcmp(LOC(siaSidAuthority),                      &
    LOC(siaWorldSidAuthority), BytesInIdentifierAuthority)) then
    lpszTempBuffer = "1"C
    
    ret = lstrcat(lpszSIDStringName,lpszTempBuffer)    
    dwLen = dwlen + lstrlen(lpszSIDStringName)

else if (0 == memcmp(LOC(siaSidAuthority),                      &
 LOC(siaLocalSidAuthority), BytesInIdentifierAuthority)) then
    lpszTempBuffer = "2"C
    
    ret = lstrcat(lpszSIDStringName,lpszTempBuffer)
    dwLen = dwlen + lstrlen(lpszSIDStringName)

else if (0 == memcmp(LOC(siaSidAuthority),                      &
 LOC(siaCreatorSidAuthority), BytesInIdentifierAuthority)) then
    lpszTempBuffer = "3"C
    
    ret = lstrcat(lpszSIDStringName,lpszTempBuffer)
    
    dwLen = dwlen + lstrlen(lpszSIDStringName)

else if (0 == memcmp(LOC(siaSidAuthority),                      &
 LOC(siaNtAuthority), BytesInIdentifierAuthority)) then
    lpszTempBuffer = "5"C
    
    ret = lstrcat(lpszSIDStringName,lpszTempBuffer)
    
    dwLen = dwlen + lstrlen(lpszSIDStringName)

else
    lpszTempBuffer = "UnknownAuthority!"C
    
    ret = lstrcat(lpszSIDStringName,lpszTempBuffer)
    
    dwLen = dwlen + lstrlen(lpszSIDStringName)
end if

call CopyMemory(LOC(dwNumSubAuthorities),                         &
                    GetSidSubAuthorityCount(psidSID), 4 )

lpszTempBuffer = "-"C
do dwSubAuthorityI=0,  dwNumSubAuthorities -1 
    ret = lstrcat(lpszSIDStringName,lpszTempBuffer)
    call CopyMemory (LOC(sidval),                                 &
                GetSidSubAuthority(psidSID,dwSubAuthorityI), 4)
    ret = inttochar (sidval, sidstring, 10)
    
    !ret = lstrcat(lpszSIDStringName+dwLen, sidstring)
    ret = lstrcat(lpszSIDStringName,sidstring)
    dwLen = dwLen + lstrlen(sidstring) + 1
end do

SIDStringName = TRUE
return
end

!****************************************************************************
!*
!* FUNCTION: ExamineAccessToken
!*
!****************************************************************************

subroutine ExamineAccessToken(hAccessToken)
!MS$ ATTRIBUTES VALUE :: hAccessToken
use chksdinc
integer*4                       hAccessToken

character*(SZ_TOK_INFO_BUF)     ucTokInfoBuf  

integer*4                       ptuTokenUser         
integer*4                       ptgTokenGroups       
integer*4                       ptpTokenPrivileges   
integer*4                       ptoTokenOwner        
integer*4                       ptgTokenPrimaryGroup 
integer*4                       ptdTokenDefaultDacl  
integer*4                       ptsTokenSource       
integer*4                       pttTokenType         
integer*4                       psilSecurityImpersonationLevel 
integer*4                       ptsTokenStatistics   
character*(SZ_PRIV_INFO_BUF)    ucPrivInfoBuf

character*(SZ_INDENT_BUF)       ucIndentBitsBuf



! commented to remove warning:
hAccessToken = hAccessToken

ptuTokenUser         = LOC(ucTokInfoBuf)
ptgTokenGroups       = LOC(ucTokInfoBuf)
ptpTokenPrivileges   = LOC(ucTokInfoBuf)
ptoTokenOwner        = LOC(ucTokInfoBuf)
ptgTokenPrimaryGroup = LOC(ucTokInfoBuf)
ptdTokenDefaultDacl  = LOC(ucTokInfoBuf)
ptsTokenSource       = LOC(ucTokInfoBuf)
pttTokenType         = LOC(ucTokInfoBuf)
psilSecurityImpersonationLevel = LOC(ucTokInfoBuf)
ptsTokenStatistics   = LOC(ucTokInfoBuf)


call ZeroMemory (LOC(ucPrivInfoBuf), SZ_PRIV_INFO_BUF)
call ZeroMemory (LOC(ucIndentBitsBuf), SZ_INDENT_BUF)            

ucTokInfoBuf  = ""C
ptuTokenUser         = LOC(ucTokInfoBuf)
ret = lstrcpy(ucIndentBitsBuf , ""C)
ret = lstrcat(ucIndentBitsBuf,"                                  "C)

!      if (!I_DO_NOT_WANT_THIS_CODE_TO_CLUTTER_THIS_PROGRAM_S_OUTPUT) then
!        {
!          ticInfoClass   = TokenUser
!          dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!          if (!GetTokenInformation(hAccessToken,
!                                   ticInfoClass,
!                                   ucTokInfoBuf,
!                                   (integer*4)SZ_TOK_INFO_BUF,
!                                   &dwTokInfoBufSz))
!          call PERR("GetTokenInformation")
!            return
!          }
!
!          write("\nToken's User SID")
!          write("\n    (this is a SID that is used to compare to SIDs in DACL(s) and SACL(s)")
!
!          if(!LookupSIDName( (*ptuTokenUser).User.Sid,""))
!          call PERR("LookupSIDName failed")
!          }
!
!          write("\nToken's User SID Attributes == 0x%.8x",(*ptuTokenUser).User.Attributes)
!          write("\n    These should always be 0 - see \\mstools\\h\\winnt.h right after")
!          write("\n      the defines such as SE_GROUP_LOGON_ID - there are no user")
!          write("\n      attributes yet defined")
!
!
!
!          ticInfoClass   = TokenGroups
!          dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!          if (!GetTokenInformation(hAccessToken,
!                                   ticInfoClass,
!                                   ucTokInfoBuf,
!                                   (integer*4)SZ_TOK_INFO_BUF,
!                                   &dwTokInfoBufSz))
!          call PERR("GetTokenInformation")
!            return
!          }
!
!          write("\nToken groups (%d)",(*ptgTokenGroups).GroupCount)
!          write("\n    (these SID(s) also are used to compare to SIDs in DACL(s) and SACL(s)")
!
!          for (dwGroupI=0 dwGroupI<(*ptgTokenGroups).GroupCount dwGroupI++)
!          {
!            integer*4 dwAttributeBits = (*ptgTokenGroups).Groups[dwGroupI].Attributes
!            write("\n  Token group (%d)",dwGroupI)
!
!            if(!LookupSIDName( (*ptgTokenGroups).Groups[dwGroupI].Sid,"  "))
!            call PERR("LookupSIDName failed")
!            }
!            write("\n  Token's group (%d) attributes == 0x%.8x",dwGroupI,dwAttributeBits)
!
!            if (dwAttributeBits)
!            {
!              if (IAND(dwAttributeBits, SE_GROUP_MANDATORY         ) .eq. SE_GROUP_MANDATORY         ) then
!               write(*,*) ucIndentBitsBuf
!2000            FORMAT (A25, "0x00000001 SE_GROUP_MANDATORY         ")
!              end if
!              if (IAND(dwAttributeBits, SE_GROUP_ENABLED_BY_DEFAULT) .eq. .eq._GROUP_ENABLED_BY_DEFAULT) then
!               write(*,*) ucIndentBitsBuf
!2000            FORMAT (A25, "0x00000002 SE_GROUP_ENABLED_BY_DEFAULT")
!              end if
!              if (IAND(dwAttributeBits, SE_GROUP_ENABLED           ) .eq. SE_GROUP_ENABLED           ) then
!               write(*,*) ucIndentBitsBuf
!2000            FORMAT (A25, "0x00000004 SE_GROUP_ENABLED           ")
!              end if
!              if (IAND(dwAttributeBits, SE_GROUP_OWNER             ) .eq. SE_GROUP_OWNER             ) then
!               write(*,*) ucIndentBitsBuf
!2000            FORMAT (A25, "0x00000008 SE_GROUP_OWNER             ")
!              end if
!              if (IAND(dwAttributeBits, SE_GROUP_LOGON_ID          ) .eq. SE_GROUP_LOGON_ID          ) then
!               write(*,*) ucIndentBitsBuf
!2000            FORMAT (A25, "0xC0000000 SE_GROUP_LOGON_ID          ")
!              end if
!
!              dwExtraBits = dwAttributeBits & ( ~( SE_GROUP_MANDATORY
!                                                 | SE_GROUP_ENABLED_BY_DEFAULT
!                                                 | SE_GROUP_ENABLED
!                                                 | SE_GROUP_OWNER
!                                                 | SE_GROUP_LOGON_ID) )
!              if (0 .ne. dwExtraBits)
!              { write("\n          Extra attribute bits == 0x%.8x <-This is a problem, should be all 0s",dwExtraBits)
!              }
!            }
!          }
!
!
!
!          ticInfoClass   = TokenPrivileges
!          dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!          if (!GetTokenInformation(hAccessToken,
!                                   ticInfoClass,
!                                   ucTokInfoBuf,
!                                   (integer*4)SZ_TOK_INFO_BUF,
!                                   &dwTokInfoBufSz))
!          call PERR("GetTokenInformation")
!            return
!          }
!
!          write("\nToken privileges (%d)",(*ptpTokenPrivileges).PrivilegeCount)
!          write("\n  NOTE: Most token privileges are not enabled by default.")
!          write("\n    For example the privilege to reboot or logoff is not.")
!          write("\n    0x00000000 for attributes implies the privilege is not enabled.")
!          write("\n    Use care when enabling privileges.  Enable only those needed,")
!          write("\n      and leave them enabled only for as long as they are needed.")
!
!          for (dwPrivilegeI=0 dwPrivilegeI<(*ptpTokenPrivileges).PrivilegeCount dwPrivilegeI++)
!          {
!            LUID  luidTokenLuid   = (*ptpTokenPrivileges).Privileges[dwPrivilegeI].Luid
!            integer*4 dwAttributeBits = (*ptpTokenPrivileges).Privileges[dwPrivilegeI].Attributes
!
!            dwPrivInfoBufSz = SZ_PRIV_INFO_BUF
!
!            if (!LookupPrivilegeName(NULL,
!                                     (PLUID)&luidTokenLuid,
!                                     (LPTSTR)ucPrivInfoBuf,
!                                     (LPinteger*4)&dwPrivInfoBufSz))
!            call PERR("LookUpPrivilegeName")
!              return
!            }
!
!            write("\n  Token's privilege (%.2d) name       == %s",dwPrivilegeI,ucPrivInfoBuf)
!
!            write("\n  Token's privilege (%.2d) attributes == 0x%.8x",dwPrivilegeI,dwAttributeBits)
!
!            if (dwAttributeBits)
!            {
!              if (IAND(dwAttributeBits, SE_PRIVILEGE_ENABLED_BY_DEFAULT) .eq. .eq._PRIVILEGE_ENABLED_BY_DEFAULT) then
!               write(*,*) ucIndentBitsBuf
!2000            FORMAT (A25, "     0x00000001 SE_PRIVILEGE_ENABLED_BY_DEFAULT")
!              end if
!              if (IAND(dwAttributeBits, SE_PRIVILEGE_ENABLED           ) .eq. SE_PRIVILEGE_ENABLED           ) then
!               write(*,*) ucIndentBitsBuf
!2000            FORMAT (A25, "     0x00000002 SE_PRIVILEGE_ENABLED           ")
!              end if
!              if (IAND(dwAttributeBits, SE_PRIVILEGE_USED_FOR_ACCESS   ) .eq. SE_PRIVILEGE_USED_FOR_ACCESS   ) then
!               write(*,*) ucIndentBitsBuf
!2000            FORMAT (A25, "     0x80000000 SE_PRIVILEGE_USED_FOR_ACCESS   ")
!              end if
!
!              dwExtraBits = dwAttributeBits & ( ~( SE_PRIVILEGE_ENABLED_BY_DEFAULT
!                                                 | SE_PRIVILEGE_ENABLED
!                                                 | SE_PRIVILEGE_USED_FOR_ACCESS ) )
!              if (0 .ne. dwExtraBits)
!              { write("\n               Extra attribute bits == 0x%.8x <-This is a problem, should be all 0s",dwExtraBits)
!              }
!            }
!          }
!
!
!
!          ticInfoClass   = TokenOwner
!          dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!          if (!GetTokenInformation(hAccessToken,
!                                   ticInfoClass,
!                                   ucTokInfoBuf,
!                                   (integer*4)SZ_TOK_INFO_BUF,
!                                   &dwTokInfoBufSz))
!          call PERR("GetTokenInformation")
!            return
!          }
!
!          write("\nToken's default-owner-SID for created objects")
!          write("\n    (this is NOT a SID that is used to compare to SIDs in DACL(s) and SACL(s)")
!
!          if(!LookupSIDName((*ptoTokenOwner).Owner,""))
!          call PERR("LookupSIDName failed")
!          }
!
!
!
!          ticInfoClass   = TokenPrimaryGroup
!          dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!          if (!GetTokenInformation(hAccessToken,
!                                   ticInfoClass,
!                                   ucTokInfoBuf,
!                                   (integer*4)SZ_TOK_INFO_BUF,
!                                   &dwTokInfoBufSz))
!          call PERR("GetTokenInformation")
!            return
!          }
!
!          write("\nToken's Primary Group SID")
!          write("\n    (Current uses are Posix and Macintosh client support)")
!
!          if(!LookupSIDName((*ptgTokenPrimaryGroup).PrimaryGroup,""))
!          call PERR("LookupSIDName failed")
!          }
!
!
!
!          ticInfoClass   = TokenDefaultDacl
!          dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!          if (!GetTokenInformation(hAccessToken,
!                                   ticInfoClass,
!                                   ucTokInfoBuf,
!                                   (integer*4)SZ_TOK_INFO_BUF,
!                                   &dwTokInfoBufSz))
!          call PERR("GetTokenInformation")
!            return
!          }
!
!          if (NULL         .eq. (*ptdTokenDefaultDacl).DefaultDacl)
!          { write("\nToken has a NULL Default DACL explicitly specified (allows all access to")
!            write("\n    Everyone, only on objects that are created where the object's Dacl is")
!            write("\n    assigned by default from this default Dacl in this access token)")
!          }
!          else
!          { write("\nToken's default-DACL for created objects")
!            if(!ExamineACL((*ptdTokenDefaultDacl).DefaultDacl,NULL_CHARACTER,DefaultDaclInAccessTokenAccessMask))
!            call PERR("ExamineACL failed")
!            }
!          }
!
!
!
!          ticInfoClass   = TokenSource
!          dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!          if (!GetTokenInformation(hAccessToken,
!                                   ticInfoClass,
!                                   ucTokInfoBuf,
!                                   (integer*4)SZ_TOK_INFO_BUF,
!                                   &dwTokInfoBufSz))
!          call PERR("GetTokenInformation")
!            return
!          }
!
!          write("\nToken's Source")
!          write("\n  Source Name        == %.8s",(*ptsTokenSource).SourceName)
!          write("\n  Source Identifier  == 0x%.8x%.8x",
!             (*ptsTokenSource).SourceIdentifier.HighPart,
!             (*ptsTokenSource).SourceIdentifier.LowPart)
!
!
!
!          ticInfoClass   = TokenType
!          dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!          if (!GetTokenInformation(hAccessToken,
!                                   ticInfoClass,
!                                   ucTokInfoBuf,
!                                   (integer*4)SZ_TOK_INFO_BUF,
!                                   &dwTokInfoBufSz))
!          call PERR("GetTokenInformation")
!            return
!          }
!
!          switch (*pttTokenType)
!          { case  TokenPrimary       :
!              write("\nToken's Type is TokenPrimary")
!              break
!            case  TokenImpersonation :
!              write("\nToken's Type is TokenImpersonation")
!              write("\n    Hence the token's TokenImpersonationLevel can be examined")
!
!              ticInfoClass   = TokenImpersonationLevel
!              dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!              if (!GetTokenInformation(hAccessToken,
!                                       ticInfoClass,
!                                       ucTokInfoBuf,
!                                       (integer*4)SZ_TOK_INFO_BUF,
!                                       &dwTokInfoBufSz))
!              call PERR("GetTokenInformation")
!                return
!              }
!
!              switch (*psilSecurityImpersonationLevel)
!              { case                     SecurityAnonymous      :
!                  write("\n  Token is a SecurityAnonymous impersonation token")
!                  break
!                case                     SecurityIdentification :
!                  write("\n  Token is a SecurityIdentification impersonation token")
!                  break
!                case                     SecurityImpersonation  :
!                  write("\n  Token is a SecurityImpersonation impersonation token")
!                  break
!                case                     SecurityDelegation     :
!                  write("\n  Token is a SecurityDelegation impersonation token")
!                  break
!                default                   :
!                  write("\n  Token is an ILLEGAL KIND OF impersonation token!!! == 0x%.8x",*psilSecurityImpersonationLevel)
!                  break
!              }
!
!            default                  :
!              write("\nToken's Type is ILLEGAL!!! == 0x%.8x",*pttTokenType)
!              break
!          }
!
!
!
!          ticInfoClass   = TokenStatistics
!          dwTokInfoBufSz = SZ_TOK_INFO_BUF
!
!          if (!GetTokenInformation(hAccessToken,
!                                   ticInfoClass,
!                                   ucTokInfoBuf,
!                                   (integer*4)SZ_TOK_INFO_BUF,
!                                   &dwTokInfoBufSz))
!          call PERR("GetTokenInformation")
!            return
!          }
!
!          write("\nToken's Statistics")
!          write("\n  TokenId            == 0x%.8x%.8x",
!            (*ptsTokenStatistics).TokenId.HighPart,
!            (*ptsTokenStatistics).TokenId.LowPart)
!          write("\n  AuthenticationId   == 0x%.8x%.8x",
!            (*ptsTokenStatistics).AuthenticationId.HighPart,
!            (*ptsTokenStatistics).AuthenticationId.LowPart)
!          write("\n  ExpirationTime     == (not supported in this release of Windows NT)")
!          write("\n  TokenType          == See token type above")
!          write("\n  ImpersonationLevel == See impersonation level above (only if TokenType is not TokenPrimary)")
!          write("\n  DynamicCharged     == %ld",(*ptsTokenStatistics).DynamicCharged    )
!          write("\n  DynamicAvailable   == %ld",(*ptsTokenStatistics).DynamicAvailable  )
!          write("\n  GroupCount         == %d",(*ptsTokenStatistics).GroupCount        )
!          write("\n  PrivilegeCount     == %d",(*ptsTokenStatistics).PrivilegeCount    )
!          write("\n  ModifiedId         == 0x%.8x%.8x",
!            (*ptsTokenStatistics).ModifiedId.HighPart,
!            (*ptsTokenStatistics).ModifiedId.LowPart)
!
!
!
!          write("\n\n")
!
!        }
end
