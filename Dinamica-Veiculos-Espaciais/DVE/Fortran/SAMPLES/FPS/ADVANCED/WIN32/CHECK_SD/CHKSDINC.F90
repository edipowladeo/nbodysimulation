module chksdinc
use msfwin
!****************************************************************************
!* GLOBAL VARIABLES AND TYPEDEFS
!****************************************************************************
character*9, parameter, public :: DEFAULT_FILE_TO_CHECK = "\\\\.\\A:"C

integer*4, parameter, public :: SZ_NAME_BUF = MAX_PATH

integer*4, parameter, public :: SZ_SD_BUF = 8096

integer*4, parameter, public :: REDIRECT_STDOUT = 0

character*17, parameter, public :: FILE_TO_REDIRECT_STDOUT_TO ="c:\\check_sd.out"C

integer*4, parameter, public :: CLUTTER_PROGRAM_OUTPUT = 1

integer*4, parameter, public :: SZ_INDENT_BUF = 80

integer*4, parameter, public :: STANDARD_RIGHTS_ALL_THE_BITS = #00FF0000

integer*4, parameter, public :: GENERIC_RIGHTS_ALL_THE_BITS  = #F0000000

integer*4, parameter, public :: SZ_ACCT_NAME_BUF = 60

integer*4, parameter, public :: SZ_DMN_NAME_BUF   = 60

integer*4, parameter, public :: SZ_SID_STRING_BUF = 150

integer*4, parameter, public :: BytesInIdentifierAuthority  = 6

integer*4, parameter, public :: SZ_TOK_INFO_BUF  = 2000

integer*4, parameter, public :: SIZEOFTOKEN_PRIVILEGES = 12

integer*4, parameter, public :: SZ_PRIV_INFO_BUF = 250 

integer*4, parameter, public :: SIZEOFSID = 12 

integer*4, parameter, public :: SIZEOFACLSIZEINFO = 12 

integer*4, parameter, public :: SIZEOFACLREVISION = 4 

! These hold the well-known SIDs
integer*4   FileAccessMask
integer*4   ProcessAccessMask
integer*4   WindowStationAccessMask
integer*4   RegKeyAccessMask
integer*4   ServiceAccessMask
integer*4   DefDaclInAccessTokenAccessMsk


integer*4 psidNullSid 
integer*4 psidWorldSid
integer*4 psidLocalSid
integer*4 psidCreatorOwnerSid 
integer*4 psidCreatorGroupSid 
integer*4 psidNtAuthoritySid 
integer*4 psidDialupSid 
integer*4 psidNetworkSid 
integer*4 psidBatchSid 
integer*4 psidInteractiveSid 
integer*4 psidLogonIdsSid ! But the X and Y values are bogus at first!!! (See below)
integer*4 psidServiceSid 
integer*4 psidLocalSystemSid 
integer*4 psidBuiltinDomainSid
type(T_SID_IDENTIFIER_AUTHORITY) siaSidAuthority
type(T_SID_IDENTIFIER_AUTHORITY) siaNullSidAuthority 
type(T_SID_IDENTIFIER_AUTHORITY) siaWorldSidAuthority 
type(T_SID_IDENTIFIER_AUTHORITY) siaLocalSidAuthority 
type(T_SID_IDENTIFIER_AUTHORITY) siaCreatorSidAuthority
type(T_SID_IDENTIFIER_AUTHORITY) siaNonUniqueAuthority
type(T_SID_IDENTIFIER_AUTHORITY) siaNtAuthority 

common /globdata/  psidNullSid , psidWorldSid, psidLocalSid,            &
 psidCreatorOwnerSid ,psidCreatorGroupSid ,psidNtAuthoritySid ,         &
 psidDialupSid ,psidNetworkSid ,psidBatchSid ,psidInteractiveSid ,      &
 psidLogonIdsSid,psidServiceSid ,psidLocalSystemSid ,                   &
psidBuiltinDomainSid, FileAccessMask, ProcessAccessMask,                &
WindowStationAccessMask, RegKeyAccessMask, ServiceAccessMask,           &
DefDaclInAccessTokenAccessMsk

end module chksdinc

