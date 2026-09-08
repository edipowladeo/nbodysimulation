! **************************************************************************
!  This file is not guaranteed by Microsoft to be error free. Every effort
!  has been made to ensure proper data-types and declarations, but no
!  testing has been performed using this include file. Additionally, some
!  API's though listed, may not be compatible with the Microsoft Fortran
!  language.
! **************************************************************************
!MS$IF .NOT. DEFINED (MSFWINTY_ )
!MS$DEFINE MSFWINTY_  
                        
module msfwinty
!                               *****WINNT*****
! 
!     This module defines the 32-Bit Windows types and constants that are
!     defined by NT, but exposed through the Win32 API.
! 

character, pointer :: NULL_CHARACTER

integer, parameter, public :: ANYSIZE_ARRAY = 1       


integer, parameter, public :: APPLICATION_ERROR_MASK        =  #20000000
integer, parameter, public :: ERROR_SEVERITY_SUCCESS        =  #00000000
integer, parameter, public :: ERROR_SEVERITY_INFORMATIONAL  =  #40000000
integer, parameter, public :: ERROR_SEVERITY_WARNING        =  #80000000 
integer, parameter, public :: ERROR_SEVERITY_ERROR          =  #C0000000 

type T_LARGE_INTEGER
   integer LowPart
   integer HighPart
end type T_LARGE_INTEGER

! 
!   Doubly linked list structure.  Can be used as either a list head, or
!   as link words.
! 

type  T_LIST_ENTRY
  integer Flink 
  integer Blink 
end type  T_LIST_ENTRY

! 
!   Singly linked list structure. Can be used as either a list head, or
!   as link words.
! 

type  T_SINGLE_LIST_ENTRY
  integer Next 
end type  T_SINGLE_LIST_ENTRY

integer, parameter, public :: MINCHAR  =  #80        
integer, parameter, public :: MAXCHAR  =  #7f        
integer, parameter, public :: MINSHORT =  #8000      
integer, parameter, public :: MAXSHORT =  #7fff      
integer, parameter, public :: MINLONG  =  #80000000 
integer, parameter, public :: MAXLONG  =  #7fffffff  
integer, parameter, public :: MAXBYTE  =  #ff        
integer, parameter, public :: MAXWORD  =  #ffff      
integer, parameter, public :: MAXDWORD =  #FFFFFFFF

!//
!// Calculate the byte offset of a field in a structure of type type.
!//
! *************************************************************************
! The FIELD_OFFSET macro has been moved to MACRO.F90
! *************************************************************************


!//
!// Calculate the address of the base of the structure given its type, and an
!// address of a field within the structure.
!//
! *************************************************************************
! The CONTAINING_RECORD macro has been moved to MACRO.f90
!

! 
!  *  Language IDs.
!  *
!  *  The following two combinations of primary language ID and
!  *  sublanguage ID have special semantics:
!  *
!  *    Primary Language ID   Sublanguage ID      Result
!  *    -------------------   ---------------     ------------------------
!  *    LANG_NEUTRAL          SUBLANG_NEUTRAL     Language neutral
!  *    LANG_NEUTRAL          SUBLANG_DEFAULT     User default language
!  *    LANG_NEUTRAL          SUBLANG_SYS_DEFAULT System default language
!  
!


! 
!  *  Primary language IDs.
!  
!

integer, parameter, public :: LANG_NEUTRAL      =  #00

integer, parameter, public :: LANG_BULGARIAN    =  #02
integer, parameter, public :: LANG_CHINESE      =  #04
integer, parameter, public :: LANG_CROATIAN     = #1a
integer, parameter, public :: LANG_CZECH        =  #05
integer, parameter, public :: LANG_DANISH       =  #06
integer, parameter, public :: LANG_DUTCH        =  #13
integer, parameter, public :: LANG_ENGLISH      =  #09
integer, parameter, public :: LANG_FINNISH      =  #0b
integer, parameter, public :: LANG_FRENCH       =  #0c
integer, parameter, public :: LANG_GERMAN       =  #07
integer, parameter, public :: LANG_GREEK        =  #08
integer, parameter, public :: LANG_HUNGARIAN    =  #0e
integer, parameter, public :: LANG_ICELANDIC    =  #0f
integer, parameter, public :: LANG_ITALIAN      =  #10
integer, parameter, public :: LANG_JAPANESE     =  #11
integer, parameter, public :: LANG_KOREAN       =  #12
integer, parameter, public :: LANG_NORWEGIAN    =  #14
integer, parameter, public :: LANG_POLISH       =  #15
integer, parameter, public :: LANG_PORTUGUESE   =  #16
integer, parameter, public :: LANG_ROMANIAN     =  #18
integer, parameter, public :: LANG_RUSSIAN      =  #19
integer, parameter, public :: LANG_SLOVAK       =  #1b
integer, parameter, public :: LANG_SLOVENIAN    = #24
integer, parameter, public :: LANG_SPANISH      =  #0a
integer, parameter, public :: LANG_SWEDISH      =  #1d
integer, parameter, public :: LANG_TURKISH      =  #1f

! 
!  *  Sublanguage IDs.
!  *
!  *  The name immediately following SUBLANG_ dictates which primary
!  *  language ID that sublanguage ID can be combined with to form a
!  *  valid language ID.
!  
!

integer, parameter, public :: SUBLANG_NEUTRAL      =  #00 !  language neutral   
integer, parameter, public :: SUBLANG_DEFAULT      =  #01 !  user default   
integer, parameter, public :: SUBLANG_SYS_DEFAULT  =  #02 !  system default   

integer, parameter, public :: SUBLANG_CHINESE_TRADITIONAL = #01 ! Chinese (Traditional)   
integer, parameter, public :: SUBLANG_CHINESE_SIMPLIFIED  = #02 ! Chinese (Simplified)   
integer, parameter, public :: SUBLANG_CHINESE_HONGKONG    = #03 ! Chinese (Hong Kong) */
integer, parameter, public :: SUBLANG_CHINESE_SINGAPORE   = #04 ! Chinese (Singapore) */
integer, parameter, public :: SUBLANG_DUTCH           =  #01  !  Dutch   
integer, parameter, public :: SUBLANG_DUTCH_BELGIAN   =  #02  !  Dutch (Belgian)   
integer, parameter, public :: SUBLANG_ENGLISH_US   =  #01   !  English (USA)   
integer, parameter, public :: SUBLANG_ENGLISH_UK   =  #02   !  English (UK)   
integer, parameter, public :: SUBLANG_ENGLISH_AUS  =  #03   !  English (Australian)   
integer, parameter, public :: SUBLANG_ENGLISH_CAN  =  #04   !  English (Canadian)   
integer, parameter, public :: SUBLANG_ENGLISH_NZ   =  #05   !  English (New Zealand)   
integer, parameter, public :: SUBLANG_ENGLISH_EIRE =  #06   !  English (Irish)   
integer, parameter, public :: SUBLANG_FRENCH =  #01                 !  French   
integer, parameter, public :: SUBLANG_FRENCH_BELGIAN =  #02         !  French (Belgian)   
integer, parameter, public :: SUBLANG_FRENCH_CANADIAN =  #03        !  French (Canadian)   
integer, parameter, public :: SUBLANG_FRENCH_SWISS =  #04           !  French (Swiss)   
integer, parameter, public :: SUBLANG_GERMAN =  #01                 !  German   
integer, parameter, public :: SUBLANG_GERMAN_SWISS =  #02           !  German (Swiss)   
integer, parameter, public :: SUBLANG_GERMAN_AUSTRIAN =  #03        !  German (Austrian)   
integer, parameter, public :: SUBLANG_ITALIAN =  #01                !  Italian   
integer, parameter, public :: SUBLANG_ITALIAN_SWISS =  #02          !  Italian (Swiss)   
integer, parameter, public :: SUBLANG_NORWEGIAN_BOKMAL =  #01       !  Norwegian (Bokmal)   
integer, parameter, public :: SUBLANG_NORWEGIAN_NYNORSK =  #02      !  Norwegian (Nynorsk)   
integer, parameter, public :: SUBLANG_PORTUGUESE =  #02             !  Portuguese   
integer, parameter, public :: SUBLANG_PORTUGUESE_BRAZILIAN =  #01   !  Portuguese (Brazilian)   
integer, parameter, public :: SUBLANG_SPANISH =  #01                !  Spanish (Castilian)   
integer, parameter, public :: SUBLANG_SPANISH_MEXICAN =  #02        !  Spanish (Mexican)   
integer, parameter, public :: SUBLANG_SPANISH_MODERN =  #03         !  Spanish (Modern)   

! 
!  *  Sorting IDs.
!  *
!  
!

integer, parameter, public :: SORT_DEFAULT            =  #0     !  sorting default   
integer, parameter, public :: SORT_JAPANESE_UNICODE   =  #1     ! Japanese Unicode order */

integer, parameter, public :: SORT_CHINESE_BIG5       =  #0     ! Chinese BIG5 order */

integer, parameter, public :: SORT_KOREAN_KSC         =  #0     ! Korean KSC order */


! 
!  *  A language ID is a 16 bit value which is the combination of a
!  *  primary language ID and a secondary language ID.  The bits are
!  *  allocated as follows:
!  *
!  *       +-----------------------+-------------------------+
!  *       |     Sublanguage ID    |   Primary Language ID   |
!  *       +-----------------------+-------------------------+
!  *        15                   10 9                       0   bit
!  *
!  *
!  *  Language ID creation/extraction macros:
!  *
!  *    MAKELANGID    - construct language id from a primary language id and
!  *                    a sublanguage id.
!  *    PRIMARYLANGID - extract primary language id from a language id.
!  *    SUBLANGID     - extract sublanguage id from a language id.
!  
!
! ************************************************************************
! Macros MAKELANGID, PRIMARYLANGID and SUBLANGID have been moved to 
! MACRO.F90
! ************************************************************************

! 
!  *  A locale ID is a 32 bit value which is the combination of a
!  *  language ID, a sort ID, and a reserved area.  The bits are
!  *  allocated as follows:
!  *
!  *       +-------------+---------+-------------------------+
!  *       |   Reserved  | Sort ID |      Language ID        |
!  *       +-------------+---------+-------------------------+
!  *        31         20 19     16 15                      0   bit
!  *
!  *
!  *  Locale ID creation/extraction macros:
!  *
!  *    MAKELCID       - construct locale id from a language id and a sort id.
!  *    LANGIDFROMLCID - extract language id from a locale id.
!  *    SORTIDFROMLCID - extract sort id from a locale id.
!  
!

integer, parameter, public :: NLS_VALID_LOCALE_MASK =  #000fffff

!*************************************************************************
! Macros MAKELCID, LANGIDFROMLCID and SORTIDFROMLCID have been moved to 
! MACRO.F90
!*************************************************************************

!
!  *  Default System and User IDs for language and locale.
!  
!**********************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: LANG_SYSTEM_DEFAULT    = (MAKELANGID(LANG_NEUTRAL, SUBLANG_SYS_DEFAULT))
!integer, parameter, public :: LANG_USER_DEFAULT      = (MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT))

!integer, parameter, public :: LOCALE_SYSTEM_DEFAULT  = (MAKELCID(LANG_SYSTEM_DEFAULT, SORT_DEFAULT))
!integer, parameter, public :: LOCALE_USER_DEFAULT    = (MAKELCID(LANG_USER_DEFAULT, SORT_DEFAULT))
!**********************************************************************************


! lint -save -e767 
!
  
integer, parameter, public :: STATUS_WAIT_0                    = (#00000000)    
integer, parameter, public :: STATUS_ABANDONED_WAIT_0          = (#00000080)    
integer, parameter, public :: STATUS_USER_APC                  = (#000000C0)    
integer, parameter, public :: STATUS_TIMEOUT                   = (#00000102)    
integer, parameter, public :: STATUS_PENDING                   = (#00000103)    
integer, parameter, public :: STATUS_GUARD_PAGE_VIOLATION      = (#80000001)    
integer, parameter, public :: STATUS_DATATYPE_MISALIGNMENT     = (#80000002)    
integer, parameter, public :: STATUS_BREAKPOINT                = (#80000003)    
integer, parameter, public :: STATUS_SINGLE_STEP               = (#80000004)    
integer, parameter, public :: STATUS_ACCESS_VIOLATION          = (#C0000005)    
integer, parameter, public :: STATUS_IN_PAGE_ERROR             = (#C0000006)    
integer, parameter, public :: STATUS_NO_MEMORY                 = (#C0000017)    
integer, parameter, public :: STATUS_ILLEGAL_INSTRUCTION       = (#C000001D)    
integer, parameter, public :: STATUS_NONCONTINUABLE_EXCEPTION  = (#C0000025)    
integer, parameter, public :: STATUS_INVALID_DISPOSITION       = (#C0000026)    
integer, parameter, public :: STATUS_ARRAY_BOUNDS_EXCEEDED     = (#C000008C)    
integer, parameter, public :: STATUS_FLOAT_DENORMAL_OPERAND    = (#C000008D)    
integer, parameter, public :: STATUS_FLOAT_DIVIDE_BY_ZERO      = (#C000008E)    
integer, parameter, public :: STATUS_FLOAT_INEXACT_RESULT      = (#C000008F)    
integer, parameter, public :: STATUS_FLOAT_INVALID_OPERATION   = (#C0000090)    
integer, parameter, public :: STATUS_FLOAT_OVERFLOW            = (#C0000091)    
integer, parameter, public :: STATUS_FLOAT_STACK_CHECK         = (#C0000092)    
integer, parameter, public :: STATUS_FLOAT_UNDERFLOW           = (#C0000093)    
integer, parameter, public :: STATUS_INTEGER_DIVIDE_BY_ZERO    = (#C0000094)    
integer, parameter, public :: STATUS_INTEGER_OVERFLOW          = (#C0000095)    
integer, parameter, public :: STATUS_PRIVILEGED_INSTRUCTION    = (#C0000096)    
integer, parameter, public :: STATUS_STACK_OVERFLOW            = (#C00000FD)    
integer, parameter, public :: STATUS_CONTROL_C_EXIT            = (#C000013A)    
! lint -restore 
!
  
integer, parameter, public :: MAXIMUM_WAIT_OBJECTS = 64     !// Maximum number of wait objects

integer, parameter, public :: MAXIMUM_SUSPEND_COUNT = MAXCHAR !  Maximum times thread can be suspended


!MS$IF DEFINED (XEIGHTSIX_)

! 
!  Disable these two pramas that evaluate to "sti" "cli" on x86 so that driver
!  writers to not leave them inadvertantly in their code.
! 

! 
!   Define the size of the 80387 save area, which is in the context frame.
! 

integer, parameter, public :: SIZE_OF_80387_REGISTERS = 80

! 
!  The following flags control the contents of the T_CONTEXT structure.
! 

integer, parameter, public :: CONTEXT_i386 =  #00010000    !// this assumes that i386 and
integer, parameter, public :: CONTEXT_i486 =  #00010000    !// i486 have identical context records

! *************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: CONTEXT_CONTROL         = IOR(CONTEXT_i386, #00000001) !  SS:SP, CS:IP, FLAGS, BP
!integer, parameter, public :: CONTEXT_INTEGER         = IOR(CONTEXT_i386,  #00000002) !  AX, BX, CX, DX, SI, DI
!integer, parameter, public :: CONTEXT_SEGMENTS        = IOR(CONTEXT_i386,  #00000004) !  DS, ES, FS, GS
!integer, parameter, public :: CONTEXT_FLOATING_POINT  = IOR(CONTEXT_i386,  #00000008) !  387 state
!integer, parameter, public :: CONTEXT_DEBUG_REGISTERS = IOR(CONTEXT_i386,  #00000010) !  DB 0-3,6,7
! *************************************************************************

!integer, parameter, public :: CONTEXT_FULL = IOR(CONTEXT_CONTROL, IOR(CONTEXT_INTEGER,  CONTEXT_SEGMENTS))

type  T_FLOATING_SAVE_AREA
    integer ControlWord 
    integer StatusWord 
    integer TagWord 
    integer ErrorOffset 
    integer ErrorSelector 
    integer DataOffset 
    integer DataSelector 
    BYTE    RegisterArea (SIZE_OF_80387_REGISTERS)
    integer Cr0NpxState 
end type  T_FLOATING_SAVE_AREA


! 
!  Context Frame
! 
!   This frame has a several purposes: 1) it is used as an argument to
!   NtContinue, 2) is is used to constuct a call frame for APC delivery,
!   and 3) it is used in the user level thread creation routines.
! 
!   The layout of the record conforms to a standard call frame.
! 

type  T_CONTEXT
     ! 
     !  The flags values within this flag control the contents of
     !  a T_CONTEXT record.
     ! 
     !  If the context record is used as an input parameter, then
     !  for each portion of the context record controlled by a flag
     !  whose value is set, it is assumed that that portion of the
     !  context record contains valid context. If the context record
     !  is being used to modify a threads context, then only that
     !  portion of the threads context will be modified.
     ! 
     !  If the context record is used as an IN OUT parameter to capture
     !  the context of a thread, then only those portions of the thread's
     !  context corresponding to set flags will be returned.
     ! 
     !  The context record is never used as an OUT only parameter.
     ! 
    integer ContextFlags 
     ! 
     !  This section is specified/returned if CONTEXT_DEBUG_REGISTERS is
     !  set in ContextFlags.  Note that CONTEXT_DEBUG_REGISTERS is NOT
     !  included in CONTEXT_FULL.
     ! 
    integer Dr0 
    integer Dr1 
    integer Dr2 
    integer Dr3 
    integer Dr6 
    integer Dr7 
     ! 
     !  This section is specified/returned if the
     !  ContextFlags word contians the flag CONTEXT_FLOATING_POINT.
     ! 
    type (T_FLOATING_SAVE_AREA) FloatSave 
     ! 
     !  This section is specified/returned if the
     !  ContextFlags word contians the flag CONTEXT_SEGMENTS.
     ! 
    integer SegGs 
    integer SegFs 
    integer SegEs 
    integer SegDs 
     ! 
     !  This section is specified/returned if the
     !  ContextFlags word contians the flag CONTEXT_INTEGER.
     ! 
    integer Edi 
    integer Esi 
    integer Ebx 
    integer Edx 
    integer Ecx 
    integer Eax 
     ! 
     !  This section is specified/returned if the
     !  ContextFlags word contians the flag CONTEXT_CONTROL.
     ! 
    integer Ebp 
    integer Eip 
    integer SegCs 
     !  MUST BE SANITIZED
    integer EFlags 
              !  MUST BE SANITIZED
    integer Esp 
    integer SegSs 
end type  T_CONTEXT

!  begin_ntminiport

!MS$ENDIF !//_X86_

type T_LDT_ENTRY$HIGHWORD_BYTES
   BYTE  BaseMid
   BYTE  Flags1
   BYTE  Flags2
   BYTE  BaseHi
end type T_LDT_ENTRY$HIGHWORD_BYTES

type  T_LDT_ENTRY$HIGHWORD
   union
      map
         type (T_LDT_ENTRY$HIGHWORD_BYTES)  Bytes
      end map
      map
         integer(4)  Bits
      end map
   end union
end type T_LDT_ENTRY$HIGHWORD

type T_LDT_ENTRY
   integer*2 LimitLow 
   integer*2 BaseLow 
   type (T_LDT_ENTRY$HIGHWORD)  HighWord
end type T_LDT_ENTRY


integer, parameter, public :: EXCEPTION_NONCONTINUABLE      =  #1 !// Noncontinuable exception
integer, parameter, public :: EXCEPTION_MAXIMUM_PARAMETERS  = 15  !// maximum number of exception parameters

! 
!  Exception record definition.
! 

type  T_EXCEPTION_RECORD
     ! lint  -e18  */   !  Don't complain about different definitions
    integer ExceptionCode 
     ! lint  +e18  */   !  Resume checking for different definitions
    integer ExceptionFlags 
    integer ExceptionRecord 
    integer ExceptionAddress 
    integer NumberParameters 
    integer ExceptionInformation (EXCEPTION_MAXIMUM_PARAMETERS )
end type  T_EXCEPTION_RECORD


! 
!  Typedef for pointer returned by exception_info()
! 

type  T_EXCEPTION_POINTERS
    integer ExceptionRecord 
    integer ContextRecord 
end type  T_EXCEPTION_POINTERS

integer, parameter, public :: PROCESS_TERMINATE          =  #0001
integer, parameter, public :: PROCESS_CREATE_THREAD      =  #0002
integer, parameter, public :: PROCESS_VM_OPERATION       =  #0008
integer, parameter, public :: PROCESS_VM_READ            =  #0010
integer, parameter, public :: PROCESS_VM_WRITE           =  #0020
integer, parameter, public :: PROCESS_DUP_HANDLE         =  #0040
integer, parameter, public :: PROCESS_CREATE_PROCESS     =  #0080
integer, parameter, public :: PROCESS_SET_INFORMATION    =  #0200
integer, parameter, public :: PROCESS_QUERY_INFORMATION  =  #0400

! **************************************************************************
! This has been moved to STMT.F90
!
!integer, parameter, public :: PROCESS_ALL_ACCESS  = IOR(STANDARD_RIGHTS_REQUIRED, IOR(SYNCHRONIZE , #FFF))
! **************************************************************************

integer, parameter, public :: THREAD_TERMINATE              =  #0001  
integer, parameter, public :: THREAD_SUSPEND_RESUME         =  #0002  
integer, parameter, public :: THREAD_GET_CONTEXT            =  #0008  
integer, parameter, public :: THREAD_SET_CONTEXT            =  #0010  
integer, parameter, public :: THREAD_SET_INFORMATION        =  #0020
integer, parameter, public :: THREAD_QUERY_INFORMATION      =  #0040
integer, parameter, public :: THREAD_SET_THREAD_TOKEN       =  #0080
integer, parameter, public :: THREAD_IMPERSONATE            =  #0100
integer, parameter, public :: THREAD_DIRECT_IMPERSONATION   =  #0200
!  begin_ntddk

! **************************************************************************
! This has been moved to STMT.F90
!
!integer, parameter, public :: THREAD_ALL_ACCESS         = IOR(STANDARD_RIGHTS_REQUIRED, IOR( SYNCHRONIZE, #3FF))
! **************************************************************************

!  end_ntddk
integer, parameter, public :: TLS_MINIMUM_AVAILABLE = 64    
integer, parameter, public :: THREAD_BASE_PRIORITY_LOWRT = 15  !// value that gets a thread to LowRealtime-1
integer, parameter, public :: THREAD_BASE_PRIORITY_MAX = 2   !// maximum thread base priority boost
integer, parameter, public :: THREAD_BASE_PRIORITY_MIN = -2  !// minimum thread base priority boost
integer, parameter, public :: THREAD_BASE_PRIORITY_IDLE = -15 !// value that gets a thread to idle
integer, parameter, public :: EVENT_MODIFY_STATE =  #0002  

! **************************************************************************
! This has been moved to STMT.F90
!
!integer, parameter, public :: EVENT_ALL_ACCESS = IOR(STANDARD_RIGHTS_REQUIRED, IOR(SYNCHRONIZE,#3))
! **************************************************************************

integer, parameter, public :: MUTANT_QUERY_STATE =  #0001

! **************************************************************************
! This has been moved to STMT.F90
!
!integer, parameter, public :: MUTANT_ALL_ACCESS = IOR(STANDARD_RIGHTS_REQUIRED, IOR(SYNCHRONIZE, MUTANT_QUERY_STATE))
! **************************************************************************

integer, parameter, public :: SEMAPHORE_MODIFY_STATE =  #0002  

! **************************************************************************
! This has been moved to STMT.F90
!
!integer, parameter, public :: SEMAPHORE_ALL_ACCESS = IOR(STANDARD_RIGHTS_REQUIRED, IOR(SYNCHRONIZE,#3) )
! **************************************************************************

integer, parameter, public :: TIME_ZONE_ID_UNKNOWN = 0
integer, parameter, public :: TIME_ZONE_ID_STANDARD = 1
integer, parameter, public :: TIME_ZONE_ID_DAYLIGHT = 2

integer, parameter, public :: PROCESSOR_INTEL_386     = 386
integer, parameter, public :: PROCESSOR_INTEL_486     = 486
integer, parameter, public :: PROCESSOR_INTEL_PENTIUM = 586
integer, parameter, public :: PROCESSOR_INTEL_860     = 860

type  T_MEMORY_BASIC_INFORMATION
    integer BaseAddress 
    integer AllocationBase 
    integer AllocationProtect 
    integer RegionSize 
    integer State 
    integer Protect 
    integer Type 
end type  T_MEMORY_BASIC_INFORMATION

integer, parameter, public :: SECTION_QUERY        =  #0001
integer, parameter, public :: SECTION_MAP_WRITE    =  #0002
integer, parameter, public :: SECTION_MAP_READ     =  #0004
integer, parameter, public :: SECTION_MAP_EXECUTE  =  #0008
integer, parameter, public :: SECTION_EXTEND_SIZE  =  #0010

! **************************************************************************
! This has been moved to STMT.F90
!
!integer, parameter, public :: SECTION_ALL_ACCESS = IOR(STANDARD_RIGHTS_REQUIRED, &
!                           IOR(SECTION_QUERY,           &
!                           IOR(SECTION_MAP_WRITE,       &
!                           IOR(SECTION_MAP_READ,        &
!                           IOR(SECTION_MAP_EXECUTE,SECTION_EXTEND_SIZE)))))
! **************************************************************************

integer, parameter, public :: PAGE_NOACCESS           =  #01     
integer, parameter, public :: PAGE_READONLY           =  #02     
integer, parameter, public :: PAGE_READWRITE          =  #04     
integer, parameter, public :: PAGE_WRITECOPY          =  #08     
integer, parameter, public :: PAGE_EXECUTE            =  #10     
integer, parameter, public :: PAGE_EXECUTE_READ       =  #20     
integer, parameter, public :: PAGE_EXECUTE_READWRITE  =  #40     
integer, parameter, public :: PAGE_EXECUTE_WRITECOPY  =  #80     
integer, parameter, public :: PAGE_GUARD              =  #100     
integer, parameter, public :: PAGE_NOCACHE            =  #200     
integer, parameter, public :: MEM_COMMIT              =  #1000     
integer, parameter, public :: MEM_RESERVE             =  #2000     
integer, parameter, public :: MEM_DECOMMIT            =  #4000     
integer, parameter, public :: MEM_RELEASE             =  #8000     
integer, parameter, public :: MEM_FREE                =  #10000     
integer, parameter, public :: MEM_PRIVATE             =  #20000     
integer, parameter, public :: MEM_MAPPED              =  #40000     
integer, parameter, public :: MEM_TOP_DOWN            =  #100000     
integer, parameter, public :: SEC_FILE                =  #800000     
integer, parameter, public :: SEC_IMAGE               =  #1000000     
integer, parameter, public :: SEC_RESERVE             =  #4000000     
integer, parameter, public :: SEC_COMMIT              =  #80000000 
integer, parameter, public :: SEC_NOCACHE             =  #10000000     
integer, parameter, public :: MEM_IMAGE               = SEC_IMAGE

! 
!  Define access rights to files and directories
! 

! 
!  The FILE_READ_DATA and FILE_WRITE_DATA constants are also defined in
!  devioctl.h as FILE_READ_ACCESS and FILE_WRITE_ACCESS. The values for these
!  constants *MUST* always be in sync.
!  The values are redefined in devioctl.h because they must be available to
!  both DOS and NT.
! 

integer, parameter, public :: FILE_READ_DATA            = ( #0001 )    !  file & pipe
integer, parameter, public :: FILE_LIST_DIRECTORY       = ( #0001 )    !  directory

integer, parameter, public :: FILE_WRITE_DATA           = ( #0002 )    !  file & pipe
integer, parameter, public :: FILE_ADD_FILE             = ( #0002 )    !  directory

integer, parameter, public :: FILE_APPEND_DATA          = ( #0004 )    !  file
integer, parameter, public :: FILE_ADD_SUBDIRECTORY     = ( #0004 )    !  directory
integer, parameter, public :: FILE_CREATE_PIPE_INSTANCE = ( #0004 )    !  named pipe

integer, parameter, public :: FILE_READ_EA              = ( #0008 )    !  file & directory
integer, parameter, public :: FILE_READ_PROPERTIES      = FILE_READ_EA

integer, parameter, public :: FILE_WRITE_EA             = ( #0010 )    !  file & directory
integer, parameter, public :: FILE_WRITE_PROPERTIES     = FILE_WRITE_EA

integer, parameter, public :: FILE_EXECUTE              = ( #0020 )    !  file
integer, parameter, public :: FILE_TRAVERSE             = ( #0020 )    !  directory

integer, parameter, public :: FILE_DELETE_CHILD         = ( #0040 )    !  directory

integer, parameter, public :: FILE_READ_ATTRIBUTES      = ( #0080 )    !  all

integer, parameter, public :: FILE_WRITE_ATTRIBUTES     = ( #0100 )    !  all


! *************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: FILE_ALL_ACCESS = IOR(STANDARD_RIGHTS_REQUIRED, IOR(SYNCHRONIZE, #1FF))


!integer, parameter, public :: FILE_GENERIC_READ         = IOR(STANDARD_RIGHTS_READ,     &
!                                   IOR(FILE_READ_DATA,          &
!                                   IOR(FILE_READ_ATTRIBUTES,    &
!                                   IOR(FILE_READ_EA, SYNCHRONIZE))))


!integer, parameter, public :: FILE_GENERIC_WRITE        = IOR(STANDARD_RIGHTS_WRITE ,  &
!                                   IOR(FILE_WRITE_DATA,         &
!                                   IOR(FILE_WRITE_ATTRIBUTES,   &
!                                   IOR(FILE_WRITE_EA,           &
!                                   IOR(FILE_APPEND_DATA, SYNCHRONIZE)))))


!integer, parameter, public :: FILE_GENERIC_EXECUTE      = IOR(STANDARD_RIGHTS_EXECUTE, &
!                                   IOR(FILE_READ_ATTRIBUTES,            &
!                                   IOR(FILE_EXECUTE, SYNCHRONIZE)))

! *************************************************************************

integer, parameter, public :: FILE_SHARE_READ               =  #00000001  
integer, parameter, public :: FILE_SHARE_WRITE              =  #00000002  
integer, parameter, public :: FILE_ATTRIBUTE_READONLY       =  #00000001  
integer, parameter, public :: FILE_ATTRIBUTE_HIDDEN         =  #00000002  
integer, parameter, public :: FILE_ATTRIBUTE_SYSTEM         =  #00000004  
integer, parameter, public :: FILE_ATTRIBUTE_DIRECTORY      =  #00000010  
integer, parameter, public :: FILE_ATTRIBUTE_ARCHIVE        =  #00000020  
integer, parameter, public :: FILE_ATTRIBUTE_NORMAL         =  #00000080  
integer, parameter, public :: FILE_ATTRIBUTE_TEMPORARY      =  #00000100  
integer, parameter, public :: FILE_ATTRIBUTE_ATOMIC_WRITE   =  #00000200  
integer, parameter, public :: FILE_ATTRIBUTE_XACTION_WRITE  =  #00000400  
integer, parameter, public :: FILE_NOTIFY_CHANGE_FILE_NAME  =  #00000001   
integer, parameter, public :: FILE_NOTIFY_CHANGE_DIR_NAME   =  #00000002   
integer, parameter, public :: FILE_NOTIFY_CHANGE_ATTRIBUTES =  #00000004   
integer, parameter, public :: FILE_NOTIFY_CHANGE_SIZE       =  #00000008   
integer, parameter, public :: FILE_NOTIFY_CHANGE_LAST_WRITE =  #00000010   
integer, parameter, public :: FILE_NOTIFY_CHANGE_SECURITY   =  #00000100   
integer, parameter, public :: MAILSLOT_NO_MESSAGE           = (-1) 
integer, parameter, public :: MAILSLOT_WAIT_FOREVER         = (-1) 
integer, parameter, public :: FILE_CASE_SENSITIVE_SEARCH    =  #00000001  
integer, parameter, public :: FILE_CASE_PRESERVED_NAMES     =  #00000002  
integer, parameter, public :: FILE_UNICODE_ON_DISK          =  #00000004  
integer, parameter, public :: FILE_PERSISTENT_ACLS          =  #00000008  
integer, parameter, public :: FILE_FILE_COMPRESSION         =  #00000010  
integer, parameter, public :: FILE_VOLUME_IS_COMPRESSED     =  #00008000  

! *************************************************************************
! This has been moved to STMT.F90
!
!integer, parameter, public :: IO_COMPLETION_ALL_ACCESS = IOR(STANDARD_RIGHTS_REQUIRED, IOR(SYNCHRONIZE,#3) )
! *************************************************************************

integer, parameter, public :: DUPLICATE_CLOSE_SOURCE        =  #00000001  
integer, parameter, public :: DUPLICATE_SAME_ACCESS         =  #00000002  
! //////////////////////////////////////////////////////////////////////
!                                                                     //
!                              ACCESS MASK                            //
!                                                                     //
! //////////////////////////////////////////////////////////////////////

! 
!   Define the access mask as a longword sized structure divided up as
!   follows:
! 
!        3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
!        1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
!       +---------------+---------------+-------------------------------+
!       |G|G|G|G|Res'd|A| StandardRights|         SpecificRights        |
!       |R|W|E|A|     |S|               |                               |
!       +-+-------------+---------------+-------------------------------+
! 
!       typedef struct _ACCESS_MASK {
!           WORD   SpecificRights;
!           BYTE  StandardRights;
!           BYTE  AccessSystemAcl : 1;
!           BYTE  Reserved : 3;
!           BYTE  GenericAll : 1;
!           BYTE  GenericExecute : 1;
!           BYTE  GenericWrite : 1;
!           BYTE  GenericRead : 1;
!       } ACCESS_MASK;
!       typedef ACCESS_MASK *PACCESS_MASK;
! 
!   but to make life simple for programmer's we'll allow them to specify
!   a desired access mask by simply OR'ing together mulitple single rights
!   and treat an access mask as a DWORD.  For example
! 
!       DesiredAccess = DELETE | READ_CONTROL
! 
!   So we'll declare ACCESS_MASK as DWORD
! 

!  begin_ntddk begin_nthal

! //////////////////////////////////////////////////////////////////////
!                                                                     //
!                              ACCESS TYPES                           //
!                                                                     //
! //////////////////////////////////////////////////////////////////////


!  begin_ntddk begin_nthal begin_ntifs
! 
!   The following are masks for the predefined standard access types
! 

integer, parameter, public :: DELETE         =  #00010000
integer, parameter, public :: READ_CONTROL   =  #00020000
integer, parameter, public :: WRITE_DAC      =  #00040000
integer, parameter, public :: WRITE_OWNER    =  #00080000
integer, parameter, public :: SYNCHRONIZE    =  #00100000

integer, parameter, public :: STANDARD_RIGHTS_REQUIRED =  #000F0000

integer, parameter, public :: STANDARD_RIGHTS_READ    = (READ_CONTROL)
integer, parameter, public :: STANDARD_RIGHTS_WRITE   = (READ_CONTROL)
integer, parameter, public :: STANDARD_RIGHTS_EXECUTE = (READ_CONTROL)

integer, parameter, public :: STANDARD_RIGHTS_ALL =  #001F0000

integer, parameter, public :: SPECIFIC_RIGHTS_ALL =  #0000FFFF

! 
!  AccessSystemAcl access type
! 

integer, parameter, public :: ACCESS_SYSTEM_SECURITY =  #01000000

! 
!  MaximumAllowed access type
! 

integer, parameter, public :: MAXIMUM_ALLOWED =  #02000000

! 
!   These are the generic rights.
! 

integer, parameter, public :: GENERIC_READ      =   #80000000
integer, parameter, public :: GENERIC_WRITE     =  #40000000
integer, parameter, public :: GENERIC_EXECUTE   =  #20000000
integer, parameter, public :: GENERIC_ALL       =  #10000000


! 
!   Define the generic mapping array.  This is used to denote the
!   mapping of each generic access right to a specific access mask.
! 

type  T_GENERIC_MAPPING
    integer GenericRead 
    integer GenericWrite 
    integer GenericExecute 
    integer GenericAll 
end type  T_GENERIC_MAPPING



! //////////////////////////////////////////////////////////////////////
!                                                                     //
!                         T_LUID_AND_ATTRIBUTES                         //
!                                                                     //
! //////////////////////////////////////////////////////////////////////
! 
! 



type  T_LUID_AND_ATTRIBUTES
    type (T_LARGE_INTEGER) Luid 
    integer Attributes 
end type  T_LUID_AND_ATTRIBUTES


! //////////////////////////////////////////////////////////////////////
!                                                                     //
!               Security Id     (T_SID)                                 //
!                                                                     //
! //////////////////////////////////////////////////////////////////////
! 
! 
!  Pictorially the structure of an T_SID is as follows:
! 
!          1   1   1   1   1   1
!          5   4   3   2   1   0   9   8   7   6   5   4   3   2   1   0
!       +---------------------------------------------------------------+
!       |      SubAuthorityCount        |Reserved1 (SBZ)|   Revision    |
!       +---------------------------------------------------------------+
!       |                   IdentifierAuthority[0]                      |
!       +---------------------------------------------------------------+
!       |                   IdentifierAuthority[1]                      |
!       +---------------------------------------------------------------+
!       |                   IdentifierAuthority[2]                      |
!       +---------------------------------------------------------------+
!       |                                                               |
!       +- -  -  -  -  -  -  -  SubAuthority[]  -  -  -  -  -  -  -  - -+
!       |                                                               |
!       +---------------------------------------------------------------+
! 
! 

type  T_SID_IDENTIFIER_AUTHORITY
    BYTE Value (6 )
end type  T_SID_IDENTIFIER_AUTHORITY


type  T_SID
   BYTE                                 Revision 
   BYTE                                 SubAuthorityCount 
   type (T_SID_IDENTIFIER_AUTHORITY)    IdentifierAuthority 
   integer                              SubAuthority(ANYSIZE_ARRAY )
end type  T_SID


integer, parameter, public :: SID_REVISION = (1)    !// Current revision level
integer, parameter, public :: SID_MAX_SUB_AUTHORITIES = (15)
integer, parameter, public :: SID_RECOMMENDED_SUB_AUTHORITIES = (1)  !// Will change to around 6
                                                                     !  in a future release.

integer, parameter, public :: SidTypeUser  =  1
integer, parameter, public :: SidTypeGroup = 2
integer, parameter, public :: SidTypeDomain = 3
integer, parameter, public :: SidTypeAlias = 4
integer, parameter, public :: SidTypeWellKnownGroup = 5
integer, parameter, public :: SidTypeDeletedAccount = 6
integer, parameter, public :: SidTypeInvalid = 7
integer, parameter, public :: SidTypeUnknown = 8



type  T_SID_AND_ATTRIBUTES
    integer Sid 
    integer Attributes 
end type  T_SID_AND_ATTRIBUTES

type(T_SID_AND_ATTRIBUTES)   SID_AND_ATTRIBUTES_ARRAY(ANYSIZE_ARRAY)

! ///////////////////////////////////////////////////////////////////////////
!                                                                          //
!  Universal well-known SIDs                                               //
!                                                                          //
!      Null T_SID              S-1-0-0                                       //
!      World                 S-1-1-0                                       //
!      Local                 S-1-2-0                                       //
!      Creator Owner ID      S-1-3-0                                       //
!      Creator Group ID      S-1-3-1                                       //
!                                                                          //
!      (Non-unique IDs)      S-1-4                                         //
!                                                                          //
! ///////////////////////////////////////////////////////////////////////////

! **************************************************************************
! These have been moved to STMT.F90
!
!#define SECURITY_NULL_SID_AUTHORITY     {0,0,0,0,0,0}
!#define SECURITY_WORLD_SID_AUTHORITY    {0,0,0,0,0,1}
!#define SECURITY_LOCAL_SID_AUTHORITY    {0,0,0,0,0,2}
!#define SECURITY_CREATOR_SID_AUTHORITY  {0,0,0,0,0,3}
!#define SECURITY_NON_UNIQUE_AUTHORITY   {0,0,0,0,0,4}
integer(4)  SECURITY_NULL_SID_AUTHORITY(5)
integer(4)  SECURITY_WORLD_SID_AUTHORITY(5)
integer(4)  SECURITY__SID_AUTHORITY(5)
integer(4)  SECURITY_LOCAL_SID_AUTHORITY(5)
integer(4)  SECURITY_CREATOR_SID_AUTHORITY(5)
integer(4)  SECURITY_NON_UNIQUE_AUTHORITY(5)

! **************************************************************************

integer, parameter, public :: SECURITY_NULL_RID =  #00000000
integer, parameter, public :: SECURITY_WORLD_RID = #00000000
integer, parameter, public :: SECURITY_LOCAL_RID = #00000000

integer, parameter, public :: SECURITY_CREATOR_OWNER_RID =  #00000000
integer, parameter, public :: SECURITY_CREATOR_GROUP_RID =  #00000001




! ///////////////////////////////////////////////////////////////////////////
!                                                                          //
!  NT well-known SIDs                                                      //
!                                                                          //
!      NT Authority          S-1-5                                         //
!      Dialup                S-1-5-1                                       //
!                                                                          //
!      Network               S-1-5-2                                       //
!      Batch                 S-1-5-3                                       //
!      Interactive           S-1-5-4                                       //
!      Service               S-1-5-6                                       //
!      AnonymousLogon        S-1-5-7       (aka null logon session)        //
!                                                                          //
!      (Logon IDs)           S-1-5-5-X-Y                                   //
!                                                                          //
!      (NT non-unique IDs)   S-1-5-#15-...                                //
!                                                                          //
!      (Built-in domain)     s-1-5-#20                                    //
!                                                                          //
! ///////////////////////////////////////////////////////////////////////////

! **************************************************************************
! This has been moved to STMT.F90
!
!#define SECURITY_NT_AUTHORITY           {0,0,0,0,0,5}
integer(4)  SECURITY_NT_AUTHORITY(5)
! **************************************************************************

integer, parameter, public :: SECURITY_DIALUP_RID           =  #00000001
integer, parameter, public :: SECURITY_NETWORK_RID          =  #00000002
integer, parameter, public :: SECURITY_BATCH_RID            =  #00000003
integer, parameter, public :: SECURITY_INTERACTIVE_RID      =  #00000004
integer, parameter, public :: SECURITY_SERVICE_RID          =  #00000006
integer, parameter, public :: SECURITY_ANONYMOUS_LOGON_RID  =  #00000007

integer, parameter, public :: SECURITY_LOGON_IDS_RID        =  #00000005
integer, parameter, public :: SECURITY_LOGON_IDS_RID_COUNT  =  3

integer, parameter, public :: SECURITY_LOCAL_SYSTEM_RID     =  #00000012

integer, parameter, public :: SECURITY_NT_NON_UNIQUE        =  #00000015

integer, parameter, public :: SECURITY_BUILTIN_DOMAIN_RID   =  #00000020


! ///////////////////////////////////////////////////////////////////////////
!                                                                          //
!  well-known domain relative sub-authority values (RIDs)...               //
!                                                                          //
! ///////////////////////////////////////////////////////////////////////////

!  Well-known users ...

integer, parameter, public :: DOMAIN_USER_RID_ADMIN =  #000001F4
integer, parameter, public :: DOMAIN_USER_RID_GUEST =  #000001F5



!  well-known groups ...

integer, parameter, public :: DOMAIN_GROUP_RID_ADMINS = #00000200
integer, parameter, public :: DOMAIN_GROUP_RID_USERS  = #00000201
integer, parameter, public :: DOMAIN_GROUP_RID_GUESTS = #00000202




!  well-known aliases ...

integer, parameter, public :: DOMAIN_ALIAS_RID_ADMINS       = #00000220
integer, parameter, public :: DOMAIN_ALIAS_RID_USERS        = #00000221
integer, parameter, public :: DOMAIN_ALIAS_RID_GUESTS       = #00000222
integer, parameter, public :: DOMAIN_ALIAS_RID_POWER_USERS  = #00000223

integer, parameter, public :: DOMAIN_ALIAS_RID_ACCOUNT_OPS  = #00000224
integer, parameter, public :: DOMAIN_ALIAS_RID_SYSTEM_OPS   = #00000225
integer, parameter, public :: DOMAIN_ALIAS_RID_PRINT_OPS    = #00000226
integer, parameter, public :: DOMAIN_ALIAS_RID_BACKUP_OPS   = #00000227

integer, parameter, public :: DOMAIN_ALIAS_RID_REPLICATOR   = #00000228

! 
!  Allocate the System Luid.  The first 1000 LUIDs are reserved.
!  Use #999 here (#3E7 = 999)
! 
! *************************************************************************
! This has been moved to STMT.F90
!
integer(4)  SYSTEM_LUID(2)
!#define SYSTEM_LUID                     { #3E7, #0 }
! *************************************************************************



! //////////////////////////////////////////////////////////////////////
!                                                                     //
!                           User and Group related T_SID attributes     //
!                                                                     //
! //////////////////////////////////////////////////////////////////////

! 
!  Group attributes
! 

integer, parameter, public :: SE_GROUP_MANDATORY            =  #00000001
integer, parameter, public :: SE_GROUP_ENABLED_BY_DEFAULT   =  #00000002
integer, parameter, public :: SE_GROUP_ENABLED              =  #00000004
integer, parameter, public :: SE_GROUP_OWNER                =  #00000008
integer, parameter, public :: SE_GROUP_LOGON_ID             =  #C0000000

! 
!  User attributes
! 

!  (None yet defined.)


! //////////////////////////////////////////////////////////////////////
!                                                                     //
!                          T_ACL  and  ACE                              //
!                                                                     //
! //////////////////////////////////////////////////////////////////////

! 
!   Define an T_ACL and the ACE format.  The structure of an T_ACL header
!   followed by one or more ACEs.  Pictorally the structure of an T_ACL header
!   is as follows:
! 
!        3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
!        1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
!       +-------------------------------+---------------+---------------+
!       |            AclSize            |      Sbz1     |  AclRevision  |
!       +-------------------------------+---------------+---------------+
!       |              Sbz2             |           AceCount            |
!       +-------------------------------+-------------------------------+
! 
!   The current AclRevision is defined to be ACL_REVISION.
! 
!   AclSize is the size, in bytes, allocated for the T_ACL.  This includes
!   the T_ACL header, ACES, and remaining free space in the buffer.
! 
!   AceCount is the number of ACES in the T_ACL.
! 

!  begin_ntddk
!  This is the *current* T_ACL revision

integer, parameter, public :: ACL_REVISION = (2)

!  This is the history of T_ACL revisions.  Add a new one whenever
!  ACL_REVISION is updated

integer, parameter, public :: ACL_REVISION1 = (1)
integer, parameter, public :: ACL_REVISION2 = (2)

type  T_ACL
    BYTE AclRevision 
    BYTE Sbz1 
    integer(2) AclSize
    integer(2) AceCount 
    integer(2) Sbz2 
end type  T_ACL

type(T_ACL), pointer :: null_acl

!  end_ntddk

! 
!   The structure of an ACE is a common ace header followed by ace type
!   specific data.  Pictorally the structure of the common ace header is
!   as follows:
! 
!        3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
!        1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
!       +---------------+-------+-------+---------------+---------------+
!       |            AceSize            |    AceFlags   |     AceType   |
!       +---------------+-------+-------+---------------+---------------+
! 
!   AceType denotes the type of the ace, there are some predefined ace
!   types
! 
!   AceSize is the size, in bytes, of ace.
! 
!   AceFlags are the Ace flags for audit and inheritance, defined shortly.

type  T_ACE_HEADER
    BYTE AceType 
    BYTE AceFlags 
    integer(2) AceSize 
end type  T_ACE_HEADER

! 
!   The following are the predefined ace types that go into the AceType
!   field of an Ace header.
! 

integer, parameter, public :: ACCESS_ALLOWED_ACE_TYPE =  #0
integer, parameter, public :: ACCESS_DENIED_ACE_TYPE  =  #1
integer, parameter, public :: SYSTEM_AUDIT_ACE_TYPE   =  #2
integer, parameter, public :: SYSTEM_ALARM_ACE_TYPE   =  #3

! 
!   The following are the inherit flags that go into the AceFlags field
!   of an Ace header.
! 

integer, parameter, public :: OBJECT_INHERIT_ACE         =  #1
integer, parameter, public :: CONTAINER_INHERIT_ACE      =  #2
integer, parameter, public :: NO_PROPAGATE_INHERIT_ACE   =  #4
integer, parameter, public :: INHERIT_ONLY_ACE           =  #8
integer, parameter, public :: VALID_INHERIT_FLAGS        =  #F


!   The following are the currently defined ACE flags that go into the
!   AceFlags field of an ACE header.  Each ACE type has its own set of
!   AceFlags.
! 
!   SUCCESSFUL_ACCESS_ACE_FLAG - used only with system audit and alarm ACE
!   types to indicate that a message is generated for successful accesses.
! 
!   FAILED_ACCESS_ACE_FLAG - used only with system audit and alarm ACE types
!   to indicate that a message is generated for failed accesses.
! 

! 
!   SYSTEM_AUDIT and SYSTEM_ALARM AceFlags
! 
!   These control the signaling of audit and alarms for success or failure.
! 

integer, parameter, public :: SUCCESSFUL_ACCESS_ACE_FLAG =  #40
integer, parameter, public :: FAILED_ACCESS_ACE_FLAG     =  #80


! 
!   We'll define the structure of the predefined ACE types.  Pictorally
!   the structure of the predefined ACE's is as follows:
! 
!        3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
!        1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
!       +---------------+-------+-------+---------------+---------------+
!       |    AceFlags   | Resd  |Inherit|    AceSize    |     AceType   |
!       +---------------+-------+-------+---------------+---------------+
!       |                              Mask                             |
!       +---------------------------------------------------------------+
!       |                                                               |
!       +                                                               +
!       |                                                               |
!       +                              Sid                              +
!       |                                                               |
!       +                                                               +
!       |                                                               |
!       +---------------------------------------------------------------+
! 
!   Mask is the access mask associated with the ACE.  This is either the
!   access allowed, access denied, audit, or alarm mask.
! 
!   Sid is the Sid associated with the ACE.
! 

!   The following are the four predefined ACE types.

!   Examine the AceType field in the Header to determine
!   which structure is appropriate to use for casting.

type  T_ACCESS_ALLOWED_ACE
    type (T_ACE_HEADER) Header 
    integer Mask 
    integer SidStart 
end type  T_ACCESS_ALLOWED_ACE


type  T_ACCESS_DENIED_ACE
    type (T_ACE_HEADER) Header 
    integer Mask 
    integer SidStart 
end type  T_ACCESS_DENIED_ACE

type  T_SYSTEM_AUDIT_ACE
    type (T_ACE_HEADER) Header 
    integer Mask 
    integer SidStart 
end type  T_SYSTEM_AUDIT_ACE

type  T_SYSTEM_ALARM_ACE
    type (T_ACE_HEADER) Header 
    integer Mask 
    integer SidStart 
end type  T_SYSTEM_ALARM_ACE

! 
!   The following declarations are used for setting and querying information
!   about and T_ACL.  First are the various information classes available to
!   the user.
! 


integer, parameter, public :: AclRevisionInformation  = 1
integer, parameter, public :: AclSizeInformation      = 2


! 
!   This record is returned/sent if the user is requesting/setting the
!   AclRevisionInformation
! 

type  T_ACL_REVISION_INFORMATION
    integer AclRevision 
end type  T_ACL_REVISION_INFORMATION

! 
!   This record is returned if the user is requesting AclSizeInformation
! 

type  T_ACL_SIZE_INFORMATION
    integer AceCount 
    integer AclBytesInUse 
    integer AclBytesFree 
end type  T_ACL_SIZE_INFORMATION


! //////////////////////////////////////////////////////////////////////
!                                                                     //
!                              T_SECURITY_DESCRIPTOR                    //
!                                                                     //
! //////////////////////////////////////////////////////////////////////
! 
!   Define the Security Descriptor and related data types.
!   This is an opaque data structure.
! 

!  begin_ntddk
! 
!  Current security descriptor revision value
! 

integer, parameter, public :: SECURITY_DESCRIPTOR_REVISION  = (1)
integer, parameter, public :: SECURITY_DESCRIPTOR_REVISION1 = (1)

!  end_ntddk

! 
!  Minimum length, in bytes, needed to build a security descriptor
!  (NOTE: This must manually be kept consistent with the)
!  (sizeof(T_SECURITY_DESCRIPTOR)                         )
! 

integer, parameter, public :: SECURITY_DESCRIPTOR_MIN_LENGTH = (20)
integer, parameter, public :: SE_OWNER_DEFAULTED   =  #0001
integer, parameter, public :: SE_GROUP_DEFAULTED   =  #0002
integer, parameter, public :: SE_DACL_PRESENT      =  #0004
integer, parameter, public :: SE_DACL_DEFAULTED    =  #0008
integer, parameter, public :: SE_SACL_PRESENT      =  #0010
integer, parameter, public :: SE_SACL_DEFAULTED    =  #0020
integer, parameter, public :: SE_SELF_RELATIVE     =  #8000

! 
!   Where:
! 
!       SE_OWNER_DEFAULTED - This boolean flag, when set, indicates that the
!           T_SID pointed to by the Owner field was provided by a
!           defaulting mechanism rather than explicitly provided by the
!           original provider of the security descriptor.  This may
!           affect the treatment of the T_SID with respect to inheritence
!           of an owner.
! 
!       SE_GROUP_DEFAULTED - This boolean flag, when set, indicates that the
!           T_SID in the Group field was provided by a defaulting mechanism
!           rather than explicitly provided by the original provider of
!           the security descriptor.  This may affect the treatment of
!           the T_SID with respect to inheritence of a primary group.
! 
!       SE_DACL_PRESENT - This boolean flag, when set, indicates that the
!           security descriptor contains a discretionary T_ACL.  If this
!           flag is set and the Dacl field of the T_SECURITY_DESCRIPTOR is
!           null, then a null T_ACL is explicitly being specified.
! 
!       SE_DACL_DEFAULTED - This boolean flag, when set, indicates that the
!           T_ACL pointed to by the Dacl field was provided by a defaulting
!           mechanism rather than explicitly provided by the original
!           provider of the security descriptor.  This may affect the
!           treatment of the T_ACL with respect to inheritence of an T_ACL.
!           This flag is ignored if the DaclPresent flag is not set.
! 
!       SE_SACL_PRESENT - This boolean flag, when set,  indicates that the
!           security descriptor contains a system T_ACL pointed to by the
!           Sacl field.  If this flag is set and the Sacl field of the
!           T_SECURITY_DESCRIPTOR is null, then an empty (but present)
!           T_ACL is being specified.
! 
!       SE_SACL_DEFAULTED - This boolean flag, when set, indicates that the
!           T_ACL pointed to by the Sacl field was provided by a defaulting
!           mechanism rather than explicitly provided by the original
!           provider of the security descriptor.  This may affect the
!           treatment of the T_ACL with respect to inheritence of an T_ACL.
!           This flag is ignored if the SaclPresent flag is not set.
! 
!       SE_SELF_RELATIVE - This boolean flag, when set, indicates that the
!           security descriptor is in self-relative form.  In this form,
!           all fields of the security descriptor are contiguous in memory
!           and all pointer fields are expressed as offsets from the
!           beginning of the security descriptor.  This form is useful
!           for treating security descriptors as opaque data structures
!           for transmission in communication protocol or for storage on
!           secondary media.
! 
! 
! 
!  Pictorially the structure of a security descriptor is as follows:
! 
!        3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
!        1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
!       +---------------------------------------------------------------+
!       |            Control            |Reserved1 (SBZ)|   Revision    |
!       +---------------------------------------------------------------+
!       |                            Owner                              |
!       +---------------------------------------------------------------+
!       |                            Group                              |
!       +---------------------------------------------------------------+
!       |                            Sacl                               |
!       +---------------------------------------------------------------+
!       |                            Dacl                               |
!       +---------------------------------------------------------------+
! 
!  In general, this data structure should be treated opaquely to ensure future
!  compatibility.
! 
! 

type  T_SECURITY_DESCRIPTOR
   BYTE  Revision 
   BYTE  Sbz1 
   integer(2)  Control 
   integer Owner 
   integer Group 
   integer Sacl 
   integer Dacl 
end type  T_SECURITY_DESCRIPTOR

!  Where:
! 
!      Revision - Contains the revision level of the security
!          descriptor.  This allows this structure to be passed between
!          systems or stored on disk even though it is expected to
!          change in the future.
! 
!      Control - A set of flags which qualify the meaning of the
!          security descriptor or individual fields of the security
!          descriptor.
! 
!      Owner - is a pointer to an T_SID representing an object's owner.
!          If this field is null, then no owner T_SID is present in the
!          security descriptor.  If the security descriptor is in
!          self-relative form, then this field contains an offset to
!          the T_SID, rather than a pointer.
! 
!      Group - is a pointer to an T_SID representing an object's primary
!          group.  If this field is null, then no primary group T_SID is
!          present in the security descriptor.  If the security descriptor
!          is in self-relative form, then this field contains an offset to
!          the T_SID, rather than a pointer.
! 
!      Sacl - is a pointer to a system T_ACL.  This field value is only
!          valid if the DaclPresent control flag is set.  If the
!          SaclPresent flag is set and this field is null, then a null
!          T_ACL  is specified.  If the security descriptor is in
!          self-relative form, then this field contains an offset to
!          the T_ACL, rather than a pointer.
! 
!      Dacl - is a pointer to a discretionary T_ACL.  This field value is
!          only valid if the DaclPresent control flag is set.  If the
!          DaclPresent flag is set and this field is null, then a null
!          T_ACL (unconditionally granting access) is specified.  If the
!          security descriptor is in self-relative form, then this field
!          contains an offset to the T_ACL, rather than a pointer.
! 



! //////////////////////////////////////////////////////////////////////
!                                                                     //
!                Privilege Related Data Structures                    //
!                                                                     //
! //////////////////////////////////////////////////////////////////////


!  begin_ntddk begin_nthal
! 
!  Privilege attributes
! 

integer, parameter, public :: SE_PRIVILEGE_ENABLED_BY_DEFAULT  =  #00000001
integer, parameter, public :: SE_PRIVILEGE_ENABLED             =  #00000002
integer, parameter, public :: SE_PRIVILEGE_USED_FOR_ACCESS     =  #80000000 

! 
!  Privilege Set Control flags
! 

integer, parameter, public :: PRIVILEGE_SET_ALL_NECESSARY = (1)

! 
!   Privilege Set - This is defined for a privilege set of one.
!                   If more than one privilege is needed, then this structure
!                   will need to be allocated with more space.
! 
!   Note: don't change this structure without fixing the INITIAL_PRIVILEGE_SET
!   structure (defined in se.h)
! 

type  T_PRIVILEGE_SET
    integer PrivilegeCount 
    integer Control 
    type (T_LUID_AND_ATTRIBUTES) Privilege (ANYSIZE_ARRAY )
end type  T_PRIVILEGE_SET


! //////////////////////////////////////////////////////////////////////
!                                                                     //
!                NT Defined Privileges                                //
!                                                                     //
! //////////////////////////////////////////////////////////////////////

character*22, parameter, public :: SE_CREATE_TOKEN_NAME              = ("SeCreateTokenPrivilege")
character*29, parameter, public :: SE_ASSIGNPRIMARYTOKEN_NAME        = ("SeAssignPrimaryTokenPrivilege")
character*21, parameter, public :: SE_LOCK_MEMORY_NAME               = ("SeLockMemoryPrivilege")
character*24, parameter, public :: SE_INCREASE_QUOTA_NAME            = ("SeIncreaseQuotaPrivilege")
character*27, parameter, public :: SE_UNSOLICITED_INPUT_NAME         = ("SeUnsolicitedInputPrivilege")
character*14, parameter, public :: SE_TCB_NAME                       = ("SeTcbPrivilege")
character*19, parameter, public :: SE_SECURITY_NAME                  = ("SeSecurityPrivilege")
character*24, parameter, public :: SE_TAKE_OWNERSHIP_NAME            = ("SeTakeOwnershipPrivilege")
character*21, parameter, public :: SE_LOAD_DRIVER_NAME               = ("SeLoadDriverPrivilege")
character*24, parameter, public :: SE_SYSTEM_PROFILE_NAME            = ("SeSystemProfilePrivilege")
character*21, parameter, public :: SE_SYSTEMTIME_NAME                = ("SeSystemtimePrivilege")
character*31, parameter, public :: SE_PROF_SINGLE_PROCESS_NAME       = ("SeProfileSingleProcessPrivilege")
character*31, parameter, public :: SE_INC_BASE_PRIORITY_NAME         = ("SeIncreaseBasePriorityPrivilege")
character*25, parameter, public :: SE_CREATE_PAGEFILE_NAME           = ("SeCreatePagefilePrivilege")
character*26, parameter, public :: SE_CREATE_PERMANENT_NAME          = ("SeCreatePermanentPrivilege")
character*17, parameter, public :: SE_BACKUP_NAME                    = ("SeBackupPrivilege")
character*18, parameter, public :: SE_RESTORE_NAME                   = ("SeRestorePrivilege")
character*19, parameter, public :: SE_SHUTDOWN_NAME                  = ("SeShutdownPrivilege")
character*16, parameter, public :: SE_DEBUG_NAME                     = ("SeDebugPrivilege")
character*16, parameter, public :: SE_AUDIT_NAME                     = ("SeAuditPrivilege")
character*28, parameter, public :: SE_SYSTEM_ENVIRONMENT_NAME        = ("SeSystemEnvironmentPrivilege")
character*23, parameter, public :: SE_CHANGE_NOTIFY_NAME             = ("SeChangeNotifyPrivilege")
character*25, parameter, public :: SE_REMOTE_SHUTDOWN_NAME           = ("SeRemoteShutdownPrivilege")


! //////////////////////////////////////////////////////////////////
!                                                                 //
!            Security Quality Of Service                          //
!                                                                 //
!                                                                 //
! //////////////////////////////////////////////////////////////////

!  begin_ntddk begin_nthal
! 
!  Impersonation Level
! 
!  Impersonation level is represented by a pair of bits in Windows.
!  If a new impersonation level is added or lowest value is changed from
!  0 to something else, fix the Windows CreateFile call.
! 


integer, parameter, public :: SecurityAnonymous       = 0
integer, parameter, public :: SecurityIdentification  = 1
integer, parameter, public :: SecurityImpersonation   = 2
integer, parameter, public :: SecurityDelegation      = 3
    

integer, parameter, public :: SECURITY_MAX_IMPERSONATION_LVL = SecurityDelegation

integer, parameter, public :: DEFAULT_IMPERSONATION_LEVEL = SecurityImpersonation

!  end_nthal
! 
!  Security Tracking Mode
! 

logical, parameter, public :: SECURITY_DYNAMIC_TRACKING      = .TRUE.
logical, parameter, public :: SECURITY_STATIC_TRACKING       = .FALSE.


! 
!  Quality Of Service
! 

type  T_SECURITY_QUALITY_OF_SERVICE
    integer Length 
    integer ImpersonationLevel 
    integer ContextTrackingMode 
    logical(4) EffectiveOnly 
end type  T_SECURITY_QUALITY_OF_SERVICE


! 
!  Used to represent information related to a thread impersonation
! 

type  T_SE_IMPERSONATION_STATE
    integer Token 
    logical(4) CopyOnOpen 
    logical(4) EffectiveOnly 
    integer Level 
end type  T_SE_IMPERSONATION_STATE


! //////////////////////////////////////////////////////////////////
!                                                                 //
!            Token Object Definitions                             //
!                                                                 //
!                                                                 //
! //////////////////////////////////////////////////////////////////


! 
!  Token Specific Access Rights.
! 

integer, parameter, public :: TOKEN_ASSIGN_PRIMARY    =  #0001
integer, parameter, public :: TOKEN_DUPLICATE         =  #0002
integer, parameter, public :: TOKEN_IMPERSONATE       =  #0004
integer, parameter, public :: TOKEN_QUERY             =  #0008
integer, parameter, public :: TOKEN_QUERY_SOURCE      =  #0010
integer, parameter, public :: TOKEN_ADJUST_PRIVILEGES =  #0020
integer, parameter, public :: TOKEN_ADJUST_GROUPS     =  #0040
integer, parameter, public :: TOKEN_ADJUST_DEFAULT    =  #0080

! *************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: TOKEN_ALL_ACCESS = IOR(STANDARD_RIGHTS_REQUIRED, &
!                          IOR(TOKEN_ASSIGN_PRIMARY ,   &
!                          IOR(TOKEN_DUPLICATE      ,   &
!                          IOR(TOKEN_IMPERSONATE    ,   &
!                          IOR(TOKEN_QUERY          ,   &
!                          IOR(TOKEN_QUERY_SOURCE   ,   &
!                          IOR(TOKEN_ADJUST_PRIVILEGES  ,   &
!                          IOR(TOKEN_ADJUST_GROUPS  ,TOKEN_ADJUST_DEFAULT))))))))


!integer, parameter, public :: TOKEN_READ       = IOR(STANDARD_RIGHTS_READ , TOKEN_QUERY)


!integer, parameter, public :: TOKEN_WRITE      = IOR(STANDARD_RIGHTS_WRITE,    &                         
!                                IOR(TOKEN_ADJUST_PRIVILEGES, &
!                          IOR(TOKEN_ADJUST_GROUPS ,TOKEN_ADJUST_DEFAULT)))

! *************************************************************************

integer, parameter, public :: TOKEN_EXECUTE    = (STANDARD_RIGHTS_EXECUTE)


! 
!  Token Types
! 


integer, parameter, public :: TokenPrimary         = 1
integer, parameter, public :: TokenImpersonation   = 2
    


! 
!  Token Information Classes.
! 



integer, parameter, public :: TokenUser               = 1
integer, parameter, public :: TokenGroups             = 2
integer, parameter, public :: TokenPrivileges         = 3
integer, parameter, public :: TokenOwner              = 4
integer, parameter, public :: TokenPrimaryGroup       = 5
integer, parameter, public :: TokenDefaultDacl        = 6
integer, parameter, public :: TokenSource             = 7
integer, parameter, public :: TokenType               = 8
integer, parameter, public :: TokenImpersonationLevel = 9
integer, parameter, public :: TokenStatistics         = 10


! 
!  Token information class structures
! 

type  T_TOKEN_USER
    type (T_SID_AND_ATTRIBUTES) User 
end type  T_TOKEN_USER


type  T_TOKEN_GROUPS
    integer GroupCount 
    type (T_SID_AND_ATTRIBUTES) Groups (ANYSIZE_ARRAY )
end type  T_TOKEN_GROUPS


type  T_TOKEN_PRIVILEGES
    integer PrivilegeCount 
    type (T_LUID_AND_ATTRIBUTES) Privileges (ANYSIZE_ARRAY )
end type  T_TOKEN_PRIVILEGES

type(T_TOKEN_PRIVILEGES), pointer :: null_token_privileges


type  T_TOKEN_OWNER
    integer Owner 
end type  T_TOKEN_OWNER


type  T_TOKEN_PRIMARY_GROUP
    integer PrimaryGroup 
end type  T_TOKEN_PRIMARY_GROUP


type  T_TOKEN_DEFAULT_DACL
    integer DefaultDacl 
end type  T_TOKEN_DEFAULT_DACL



integer, parameter, public :: TOKEN_SOURCE_LENGTH = 8

type  T_TOKEN_SOURCE
    character SourceName (TOKEN_SOURCE_LENGTH )
    type (T_LARGE_INTEGER) SourceIdentifier 
end type  T_TOKEN_SOURCE


type  T_TOKEN_STATISTICS
    type (T_LARGE_INTEGER) TokenId 
    type (T_LARGE_INTEGER) AuthenticationId 
    type (T_LARGE_INTEGER) ExpirationTime 
    integer TokenType 
    integer ImpersonationLevel 
    integer DynamicCharged 
    integer DynamicAvailable 
    integer GroupCount 
    integer PrivilegeCount 
    type (T_LARGE_INTEGER) ModifiedId 
end type  T_TOKEN_STATISTICS


type  T_TOKEN_CONTROL
    type (T_LARGE_INTEGER) TokenId 
    type (T_LARGE_INTEGER) AuthenticationId 
    type (T_LARGE_INTEGER) ModifiedId 
    type (T_TOKEN_SOURCE) TokenSource 
end type  T_TOKEN_CONTROL



integer, parameter, public :: OWNER_SECURITY_INFORMATION = #00000001
integer, parameter, public :: GROUP_SECURITY_INFORMATION = #00000002
integer, parameter, public :: DACL_SECURITY_INFORMATION  = #00000004
integer, parameter, public :: SACL_SECURITY_INFORMATION  = #00000008


! 
!  Image Format
! 

integer, parameter, public :: IMAGE_DOS_SIGNATURE     =  #5A4D      !// MZ
integer, parameter, public :: IMAGE_OS2_SIGNATURE     =  #454E      !// NE
integer, parameter, public :: IMAGE_OS2_SIGNATURE_LE  =  #454C   !   // LE
integer, parameter, public :: IMAGE_NT_SIGNATURE      =  #00004550  !// PE00

type  T_IMAGE_DOS_HEADER                     !  DOS .EXE header
    integer(2) e_magic                     !  Magic number
    integer(2) e_cblp                      !  Bytes on last page of file
    integer(2) e_cp                        !  Pages in file
    integer(2) e_crlc                      !  Relocations
    integer(2) e_cparhdr                   !  Size of header in paragraphs
    integer(2) e_minalloc                  !  Minimum extra paragraphs needed
    integer(2) e_maxalloc                  !  Maximum extra paragraphs needed
    integer(2) e_ss                        !  Initial (relative) SS value
    integer(2) e_sp                        !  Initial SP value
    integer(2) e_csum                      !  Checksum
    integer(2) e_ip                        !  Initial IP value
    integer(2) e_cs                        !  Initial (relative) CS value
    integer(2) e_lfarlc                    !  File address of relocation table
    integer(2) e_ovno                      !  Overlay number
    integer(2) e_res  (4 )                 !  Reserved words
    integer(2) e_oemid                     !  OEM identifier (for e_oeminfo)
    integer(2) e_oeminfo                   !  OEM information; e_oemid specific
    integer(2) e_res2 (10 )                !  Reserved words
    integer(4) e_lfanew                    !  File address of new exe header
end type  T_IMAGE_DOS_HEADER

type  T_IMAGE_OS2_HEADER       !  OS/2 .EXE header
    integer(2) ne_magic                       !  Magic number
    character ne_ver                             !  Version number
    character ne_rev                             !  Revision number
    integer(2) ne_enttab                      !  Offset of Entry Table
    integer(2) ne_cbenttab                    !  Number of bytes in Entry Table
    integer ne_crc                               !  Checksum of whole file
    integer(2) ne_flags                       !  Flag word
    integer(2) ne_autodata                    !  Automatic data segment number
    integer(2) ne_heap                        !  Initial heap allocation
    integer(2) ne_stack                       !  Initial stack allocation
    integer(4) ne_csip                        !  Initial CS:IP setting
    integer(4) ne_sssp                        !  Initial SS:SP setting
    integer(2) ne_cseg                        !  Count of file segments
    integer(2) ne_cmod                        !  Entries in Module Reference Table
    integer(2) ne_cbnrestab                   !  Size of non-resident name table
    integer(2) ne_segtab                      !  Offset of Segment Table
    integer(2) ne_rsrctab                     !  Offset of Resource Table
    integer(2) ne_restab                      !  Offset of resident name table
    integer(2) ne_modtab                      !  Offset of Module Reference Table
    integer(2) ne_imptab                      !  Offset of Imported Names Table
    integer ne_nrestab                        !  Offset of Non-resident Names Table
    integer(2) ne_cmovent                     !  Count of movable entries
    integer(2) ne_align                       !  Segment alignment shift count
    integer(2) ne_cres                        !  Count of resource segments
    BYTE    ne_exetyp                         !  Target Operating system
    BYTE    ne_flagsothers                    !  Other .EXE flags
    integer(2) ne_pretthunks                  !  offset to return thunks
    integer(2) ne_psegrefbytes                !  offset to segment ref. bytes
    integer(2) ne_swaparea                    !  Minimum code swap area size
    integer(2) ne_expver                      !  Expected Windows version number
end type  T_IMAGE_OS2_HEADER

! 
!  File header format.
! 

type  T_IMAGE_FILE_HEADER
    integer(2)    Machine  
    integer(2)    NumberOfSections  
    integer       TimeDateStamp 
    integer       PointerToSymbolTable 
    integer       NumberOfSymbols 
    integer(2)    SizeOfOptionalHeader  
    integer(2)    Characteristics  
end type  T_IMAGE_FILE_HEADER

integer, parameter, public :: IMAGE_SIZEOF_FILE_HEADER = 20

integer, parameter, public :: IMAGE_FILE_RELOCS_STRIPPED    =  #0001  !// Relocation info stripped from file.
integer, parameter, public :: IMAGE_FILE_EXECUTABLE_IMAGE   =  #0002  !// File is executable  (i.e. no unresolved externel references).
integer, parameter, public :: IMAGE_FILE_LINE_NUMS_STRIPPED =  #0004 ! // Line nunbers stripped from file.
integer, parameter, public :: IMAGE_FILE_LOCAL_SYMS_STRIPPED =  #0008 ! // Local symbols stripped from file.
integer, parameter, public :: IMAGE_FILE_MINIMAL_OBJECT     =  #0010 ! // Reserved.
integer, parameter, public :: IMAGE_FILE_UPDATE_OBJECT      =  #0020  !// Reserved.
integer, parameter, public :: IMAGE_FILE_16BIT_MACHINE      =  #0040  !// 16 bit word machine.
integer, parameter, public :: IMAGE_FILE_BYTES_REVERSED_LO  =  #0080 ! // Bytes of machine word are reversed.
integer, parameter, public :: IMAGE_FILE_32BIT_MACHINE      =  #0100  !// 32 bit word machine.
integer, parameter, public :: IMAGE_FILE_DEBUG_STRIPPED     =  #0200 ! // Debugging info stripped from file in .DBG file
integer, parameter, public :: IMAGE_FILE_PATCH              =  #0400  !// Reserved.
integer, parameter, public :: IMAGE_FILE_SYSTEM             =  #1000 ! // System File.
integer, parameter, public :: IMAGE_FILE_DLL                =  #2000  !// File is a DLL.
integer, parameter, public :: IMAGE_FILE_BYTES_REVERSED_HI  =  #8000  !// Bytes of machine word are reversed.

integer, parameter, public :: IMAGE_FILE_MACHINE_UNKNOWN = 0
integer, parameter, public :: IMAGE_FILE_MACHINE_I386 =  #14c     !// Intel 386.
integer, parameter, public :: IMAGE_FILE_MACHINE_I860 =  #14d     !// Intel 860.

! 
!  Directory format.
! 

type  T_IMAGE_DATA_DIRECTORY
    integer VirtualAddress 
    integer Size 
end type  T_IMAGE_DATA_DIRECTORY

integer, parameter, public :: IMAGE_NUMOF_DIRECTORY_ENTRIES = 16

! 
!  Optional header format.
! 

type  T_IMAGE_OPTIONAL_HEADER

     ! 
     !  Standard fields.
     ! 
    integer(2)    Magic  
    BYTE          MajorLinkerVersion 
    BYTE          MinorLinkerVersion 
    integer       SizeOfCode 
    integer       SizeOfInitializedData 
    integer       SizeOfUninitializedData 
    integer       AddressOfEntryPoint 
    integer       BaseOfCode 
    integer       BaseOfData 
     ! 
     !  NT additional fields.
     ! 
    integer       ImageBase 
    integer       SectionAlignment 
    integer       FileAlignment 
    integer(2)    MajorOperatingSystemVersion  
    integer(2)    MajorOSVersion  
    integer(2)    MinorOperatingSystemVersion 
    integer(2)    MinorOSVersion  
    integer(2)    MajorImageVersion  
    integer(2)    MinorImageVersion  
    integer(2)    MajorSubsystemVersion  
    integer(2)    MinorSubsystemVersion  
    integer       Reserved1 
    integer       SizeOfImage 
    integer       SizeOfHeaders 
    integer       CheckSum 
    integer(2)    Subsystem  
    integer(2)    DllCharacteristics  
    integer       SizeOfStackReserve 
    integer       SizeOfStackCommit 
    integer       SizeOfHeapReserve 
    integer       SizeOfHeapCommit 
    integer       LoaderFlags 
    integer       NumberOfRvaAndSizes 
    type (T_IMAGE_DATA_DIRECTORY) DataDirectory (IMAGE_NUMOF_DIRECTORY_ENTRIES )
end type  T_IMAGE_OPTIONAL_HEADER

type T_IMAGE_ROM_OPTIONAL_HEADER  
    integer(2)    Magic
    BYTE          MajorLinkerVersion
    BYTE          MinorLinkerVersion
    integer(4)    SizeOfCode
    integer(4)    SizeOfInitializedData
    integer(4)    SizeOfUninitializedData
    integer(4)    AddressOfEntryPoint
    integer(4)    BaseOfCode
    integer(4)    BaseOfData
    integer(4)    BaseOfBss
    integer(4)    GprMask
    integer(4)    CprMask(4)
    integer(4)    GpValue
end type T_IMAGE_ROM_OPTIONAL_HEADER 


integer, parameter, public :: IMAGE_SIZEOF_ROM_OPTIONAL_HDR    = 56
integer, parameter, public :: IMAGE_SIZEOF_STD_OPTIONAL_HDR    = 28
integer, parameter, public :: IMAGE_SIZEOF_NT_OPTIONAL_HEADER  = 224
integer, parameter, public :: IMAGE_NT_OPTIONAL_HDR_MAGIC      = #10b
integer, parameter, public :: IMAGE_ROM_OPTIONAL_HDR_MAGIC     = #107


type  T_IMAGE_NT_HEADERS
    integer Signature 
    type (T_IMAGE_FILE_HEADER) FileHeader 
    type (T_IMAGE_OPTIONAL_HEADER) OptionalHeader 
end type  T_IMAGE_NT_HEADERS

type T_IMAGE_ROM_HEADERS
    type(T_IMAGE_FILE_HEADER)            FileHeader
    type(T_IMAGE_ROM_OPTIONAL_HEADER )    OptionalHeader
end type T_IMAGE_ROM_HEADERS


! **************************************************************************
! This macro has been moved to MACRO.F90
!
!IMAGE_FIRST_SECTION( ntheader ) 
! **************************************************************************


!  Subsystem Values

integer, parameter, public :: IMAGE_SUBSYSTEM_UNKNOWN       = 0  !// Unknown subsystem.
integer, parameter, public :: IMAGE_SUBSYSTEM_NATIVE        = 1  !// Image doesn't require a subsystem.
integer, parameter, public :: IMAGE_SUBSYSTEM_WINDOWS_GUI   = 2  ! // Image runs in the Windows GUI subsystem.
integer, parameter, public :: IMAGE_SUBSYSTEM_WINDOWS_CUI   = 3  !// Image runs in the Windows character subsystem.
integer, parameter, public :: IMAGE_SUBSYSTEM_OS2_CUI       = 5  !// image runs in the OS/2 character subsystem.
integer, parameter, public :: IMAGE_SUBSYSTEM_POSIX_CUI     = 7  ! // image run  in the Posix character subsystem.


!  Directory Entries

integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_EXPORT     = 0   ! Export Directory
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_IMPORT     = 1   ! Import Directory
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_RESOURCE   = 2   ! Resource Directory
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_EXCEPTION  = 3   ! Exception Directory
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_SECURITY   = 4   ! Security Directory
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_BASERELOC  = 5   ! Base Relocation Table
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_DEBUG      = 6   ! Debug Directory
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_COPYRIGHT  = 7   ! Description String
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_GLOBALPTR  = 8   ! Machine Value (MIPS GP)
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_TLS        = 9   ! TLS Directory
!integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG = 10   ! Load Configuration Directory
integer, parameter, public :: IMAGE_DIRECTORY_ENTRY_LOAD_CONF = 10   ! Load Configuration Directory


! 
!  Section header format.
! 

integer, parameter, public :: IMAGE_SIZEOF_SHORT_NAME = 8

type T_IMAGE_SECTION_HEADER$MISC
   union
      map
         integer(4)  PhysicalAddress
      end map
      map
         integer(4)  VirtualAddress
      end map
   end union
end type T_IMAGE_SECTION_HEADER$MISC



type T_IMAGE_SECTION_HEADER
   BYTE    Name(IMAGE_SIZEOF_SHORT_NAME )
   type (T_IMAGE_SECTION_HEADER$MISC)    Misc
   integer VirtualAddress
   integer SizeOfRawData
   integer PointerToRawData
   integer PointerToRelocations
   integer PointerToLinenumbers
   integer*2 NumberOfRelocations
   integer*2 NumberOfLinenumbers
   integer(4) Characteristics
end type T_IMAGE_SECTION_HEADER

integer, parameter, public :: IMAGE_SIZEOF_SECTION_HEADER = 40

integer, parameter, public :: IMAGE_SCN_TYPE_NO_PAD =  #00000008  ! Reserved.

integer, parameter, public :: IMAGE_SCN_CNT_CODE               =  #00000020  ! Section contains code.
integer, parameter, public :: IMAGE_SCN_CNT_INITIALIZED_DATA   =  #00000040  ! Section contains initialized data.
!integer, parameter, public :: IMAGE_SCN_CNT_UNINITIALIZED_DATA =  #00000080  ! Section contains uninitialized data.
integer, parameter, public :: IMAGE_SCN_CNT_UNINIT_DATA        =  #00000080  ! Section contains uninitialized data.

integer, parameter, public :: IMAGE_SCN_LNK_OTHER     =  #00000100  ! Reserved.
integer, parameter, public :: IMAGE_SCN_LNK_INFO      =  #00000200  ! Section contains comments or some other type of information.
integer, parameter, public :: IMAGE_SCN_LNK_OVERLAY   =  #00000400  ! Section contains an overlay.
integer, parameter, public :: IMAGE_SCN_LNK_REMOVE    =  #00000800  ! Section contents will not become part of image.
integer, parameter, public :: IMAGE_SCN_LNK_COMDAT    =  #00001000  ! Section contents comdat.

integer, parameter, public :: IMAGE_SCN_ALIGN_1BYTES  =  #00100000  !
integer, parameter, public :: IMAGE_SCN_ALIGN_2BYTES  =  #00200000  !
integer, parameter, public :: IMAGE_SCN_ALIGN_4BYTES  =  #00300000  !
integer, parameter, public :: IMAGE_SCN_ALIGN_8BYTES  =  #00400000  !
integer, parameter, public :: IMAGE_SCN_ALIGN_16BYTES =  #00500000  ! Default alignment if no others are specified.
integer, parameter, public :: IMAGE_SCN_ALIGN_32BYTES =  #00600000  !
integer, parameter, public :: IMAGE_SCN_ALIGN_64BYTES =  #00700000  !

integer, parameter, public :: IMAGE_SCN_MEM_DISCARDABLE  =  #02000000  ! Section can be discarded.
integer, parameter, public :: IMAGE_SCN_MEM_NOT_CACHED   =  #04000000  ! Section is not cachable.
integer, parameter, public :: IMAGE_SCN_MEM_NOT_PAGED    =  #08000000  ! Section is not pageable.
integer, parameter, public :: IMAGE_SCN_MEM_SHARED       =  #10000000  ! Section is shareable.
integer, parameter, public :: IMAGE_SCN_MEM_EXECUTE      =  #20000000  ! Section is executable.
integer, parameter, public :: IMAGE_SCN_MEM_READ         =  #40000000  ! Section is readable.
integer, parameter, public :: IMAGE_SCN_MEM_WRITE        =  #80000000 ! Section is writeable.

! 
!  Symbol format.
! 
type T_IMAGE_SYMBOL$NAME
   integer(4)  Short     ! if 0, use LongName
   integer(4)  Long      ! offset into string table
end type T_IMAGE_SYMBOL$NAME    

type T_IMAGE_SYMBOL$N
   union
      map
         BYTE  ShortName(8)
      end map

      map
         type (T_IMAGE_SYMBOL$NAME)    Name
      end map

      map
         integer(4)  LongName(2)
      end map
   end union
end type T_IMAGE_SYMBOL$N

type T_IMAGE_SYMBOL
   type (T_IMAGE_SYMBOL$N)   n
   integer(4) Value
   integer(2) SectionNumber
   integer(2) Type
   BYTE    StorageClass
   BYTE    NumberOfAuxSymbols
end type T_IMAGE_SYMBOL

integer, parameter, public :: IMAGE_SIZEOF_SYMBOL = 18

! 
!  Section values.
! 
!  Symbols have a section number of the section in which they are
!  defined. Otherwise, section numbers have the following meanings:
! 

integer(2), parameter, public :: IMAGE_SYM_UNDEFINED  = 0   !  Symbol is undefined or is common.
integer(2), parameter, public :: IMAGE_SYM_ABSOLUTE   = -1  !  Symbol is an absolute value.
integer(2), parameter, public :: IMAGE_SYM_DEBUG      = -2  !  Symbol is a special debug item.

! 
!  Type (fundamental) values.
! 

integer, parameter, public :: IMAGE_SYM_TYPE_NULL     = 0           ! no type.
integer, parameter, public :: IMAGE_SYM_TYPE_VOID     = 1           !
integer, parameter, public :: IMAGE_SYM_TYPE_CHAR     = 2           ! type character.
integer, parameter, public :: IMAGE_SYM_TYPE_SHORT    = 3           ! type short integer.
!integer, parameter, public :: IMAGE_SYM_TYPE_SHRT    = 3           ! type short integer.    
integer, parameter, public :: IMAGE_SYM_TYPE_INT      = 4           !
integer, parameter, public :: IMAGE_SYM_TYPE_LONG     = 5           !
integer, parameter, public :: IMAGE_SYM_TYPE_FLOAT    = 6           !
integer, parameter, public :: IMAGE_SYM_TYPE_DOUBLE   = 7           !
integer, parameter, public :: IMAGE_SYM_TYPE_STRUCT   = 8           !
integer, parameter, public :: IMAGE_SYM_TYPE_UNION    = 9           !
integer, parameter, public :: IMAGE_SYM_TYPE_ENUM     = 10          ! enumeration.
integer, parameter, public :: IMAGE_SYM_TYPE_MOE      = 11          ! member of enumeration.
integer, parameter, public :: IMAGE_SYM_TYPE_BYTE     = 12          !
!integer, parameter, public :: IMAGE_SYM_TYPE_BTE     = 12          !
integer, parameter, public :: IMAGE_SYM_TYPE_WORD     = 13          !
integer, parameter, public :: IMAGE_SYM_TYPE_UINT     = 14          !
integer, parameter, public :: IMAGE_SYM_TYPE_DWORD    = 15          !

! 
!  Type (derived) values.
! 

integer, parameter, public :: IMAGE_SYM_DTYPE_NULL       = 0  ! no derived type.
integer, parameter, public :: IMAGE_SYM_DTYPE_POINTER    = 1  ! pointer.
integer, parameter, public :: IMAGE_SYM_DTYPE_FUNCTION   = 2  ! function.
integer, parameter, public :: IMAGE_SYM_DTYPE_ARRAY      = 3  ! array.

! 
!  Storage classes.
! 

integer, parameter, public :: IMAGE_SYM_CLASS_END_OF_FCN_BYTE     = -1
integer, parameter, public :: IMAGE_SYM_CLASS_NULL                = 0
integer, parameter, public :: IMAGE_SYM_CLASS_AUTOMATIC           = 1
integer, parameter, public :: IMAGE_SYM_CLASS_EXTERNAL            = 2
integer, parameter, public :: IMAGE_SYM_CLASS_STATIC              = 3
integer, parameter, public :: IMAGE_SYM_CLASS_REGISTER            = 4
integer, parameter, public :: IMAGE_SYM_CLASS_EXTERNAL_DEF        = 5
integer, parameter, public :: IMAGE_SYM_CLASS_LABEL               = 6
integer, parameter, public :: IMAGE_SYM_CLASS_UNDEFINED_LABEL     = 7
!integer, parameter, public :: IMAGE_SYM_CLASS_MEMBER_OF_STRUCT   = 8
integer, parameter, public :: IMAGE_SYM_CLASS_MEM_OF_STRUCT       = 8
integer, parameter, public :: IMAGE_SYM_CLASS_ARGUMENT            = 9
integer, parameter, public :: IMAGE_SYM_CLASS_STRUCT_TAG          = 10
integer, parameter, public :: IMAGE_SYM_CLASS_MEMBER_OF_UNION     = 11
integer, parameter, public :: IMAGE_SYM_CLASS_UNION_TAG           = 12
integer, parameter, public :: IMAGE_SYM_CLASS_TYPE_DEFINITION     = 13
!integer, parameter, public :: IMAGE_SYM_CLASS_UNDEFINED_STATIC   = 14
integer, parameter, public :: IMAGE_SYM_CLASS_UNDEF_STATIC        = 14
integer, parameter, public :: IMAGE_SYM_CLASS_ENUM_TAG            = 15
integer, parameter, public :: IMAGE_SYM_CLASS_MEMBER_OF_ENUM      = 16
integer, parameter, public :: IMAGE_SYM_CLASS_REGISTER_PARAM      = 17
integer, parameter, public :: IMAGE_SYM_CLASS_BIT_FIELD           = 18
integer, parameter, public :: IMAGE_SYM_CLASS_BLOCK               = 100
integer, parameter, public :: IMAGE_SYM_CLASS_FUNCTION            = 101
integer, parameter, public :: IMAGE_SYM_CLASS_END_OF_STRUCT       = 102
integer, parameter, public :: IMAGE_SYM_CLASS_FILE                = 103
!  new
integer, parameter, public :: IMAGE_SYM_CLASS_SECTION             = 104
integer, parameter, public :: IMAGE_SYM_CLASS_WEAK_EXTERNAL       = 105

!  type packing constants

integer, parameter, public :: N_BTMASK = 017
integer, parameter, public :: N_TMASK  = 060
integer, parameter, public :: N_TMASK1 = 0300
integer, parameter, public :: N_TMASK2 = 0360
integer, parameter, public :: N_BTSHFT = 4
integer, parameter, public :: N_TSHIFT = 2

! *************************************************************************
! Macros BTYPE, ISPTR, ISFCN, ISARY, ISTAG, INCREF, DECREF have been moved 
! to MACRO.F90
!
! *************************************************************************
 
!  Auxiliary entry format.
! 
type T_IMAGE_AUX_SYMBOL$FCNARY$ARRAY
   integer*2 Dimension(4)
end type T_IMAGE_AUX_SYMBOL$FCNARY$ARRAY


type T_IMAGE_AUX_SYMBOL$FCNARY$FUNCTON
                                        !  if ISFCN, tag, or .bb
   integer PointerToLinenumber
   integer PointerToNextFunction
end type T_IMAGE_AUX_SYMBOL$FCNARY$FUNCTON

type T_IMAGE_AUX_SYMBOL$FCNARY
   union
      map
         type (T_IMAGE_AUX_SYMBOL$FCNARY$FUNCTON) Function
      end map
      map
         type (T_IMAGE_AUX_SYMBOL$FCNARY$ARRAY) Array
      end map
   end union
end type T_IMAGE_AUX_SYMBOL$FCNARY


type T_IMAGE_AUX_SYMBOL$SYM$MISC$LNSZ
   integer*2   Linenumber          !  declaration line number
   integer*2   Size                !  size of struct, union, or enum
end type T_IMAGE_AUX_SYMBOL$SYM$MISC$LNSZ


type T_IMAGE_AUX_SYMBOL$SYM$MISC
   union
      map
         type(T_IMAGE_AUX_SYMBOL$SYM$MISC$LNSZ) LnSz
      end map
      map
         integer TotalSize
      end map
   end union         
end type T_IMAGE_AUX_SYMBOL$SYM$MISC



type T_IMAGE_AUX_SYMBOL$SYM
   integer(4)   TagIndex              !  struct, union, or enum tag index
   type (T_IMAGE_AUX_SYMBOL$SYM$MISC)      Misc
   type (T_IMAGE_AUX_SYMBOL$FCNARY)   FcnAry
   integer*2   TvIndex                        !  tv index
end type T_IMAGE_AUX_SYMBOL$SYM




type T_IMAGE_AUX_SYMBOL$FILE
   BYTE Name(IMAGE_SIZEOF_SYMBOL)
end type T_IMAGE_AUX_SYMBOL$FILE



type T_IMAGE_AUX_SYMBOL$SECTION
        integer Length                         !  section length
        integer*2 NumberOfRelocations          !  number of relocation entries
        integer*2 NumberOfLinenumbers          !  number of line numbers
        integer CheckSum                       !  checksum for communal
        integer*2 Number                       !  section number to associate with
        BYTE Selection                    !  communal selection type
end type T_IMAGE_AUX_SYMBOL$SECTION



type T_IMAGE_AUX_SYMBOL
   union
      map
         type (T_IMAGE_AUX_SYMBOL$SYM) Sym
      end map
      map
         type (T_IMAGE_AUX_SYMBOL$FILE) File
      end map
      map   
         type (T_IMAGE_AUX_SYMBOL$SECTION) Section
      end map
   end union
end type T_IMAGE_AUX_SYMBOL

integer, parameter, public :: IMAGE_SIZEOF_AUX_SYMBOL = 18

! 
!  Communal selection types.
! 

!integer, parameter, public :: IMAGE_COMDAT_SELECT_NODUPLICATES = 1
integer, parameter, public :: IMAGE_COMDAT_SLCT_NODUPLICATES   = 1
integer, parameter, public :: IMAGE_COMDAT_SELECT_ANY          = 2
integer, parameter, public :: IMAGE_COMDAT_SELECT_SAME_SIZE    = 3
integer, parameter, public :: IMAGE_COMDAT_SELECT_EXACT_MATCH  = 4
integer, parameter, public :: IMAGE_COMDAT_SELECT_ASSOCIATIVE  = 5

!integer, parameter, public :: IMAGE_WEAK_EXTERN_SEARCH_NOLIBRARY = 1
integer, parameter, public :: IMAGE_WEAK_EXTEN_SRCH_NOLIBRARY = 1
!integer, parameter, public :: IMAGE_WEAK_EXTERN_SEARCH_LIBRARY = 2
integer, parameter, public :: IMAGE_WEAK_EXTRN_SRCH_LIBRARY = 2
integer, parameter, public :: IMAGE_WEAK_EXTERN_SEARCH_ALIAS   = 3


! 
!  Relocation format.
! 

type  T_IMAGE_RELOCATION
    integer VirtualAddress 
    integer SymbolTableIndex 
    integer(2) Type  
end type  T_IMAGE_RELOCATION

integer, parameter, public :: IMAGE_SIZEOF_RELOCATION = 10


! 
!  I386 relocation types.
! 

integer, parameter, public :: IMAGE_REL_I386_ABSOLUTE = 0           ! Reference is absolute, no relocation is necessary
integer, parameter, public :: IMAGE_REL_I386_DIR16    = 01          ! Direct 16-bit reference to the symbols virtual address
integer, parameter, public :: IMAGE_REL_I386_REL16    = 02          ! PC-relative 16-bit reference to the symbols virtual address
integer, parameter, public :: IMAGE_REL_I386_DIR32    = 06          ! Direct 32-bit reference to the symbols virtual address
integer, parameter, public :: IMAGE_REL_I386_DIR32NB  = 07          ! Direct 32-bit reference to the symbols virtual address, base not included
integer, parameter, public :: IMAGE_REL_I386_SEG12    = 011         ! Direct 16-bit reference to the segment-selector bits of a 32-bit virtual address
integer, parameter, public :: IMAGE_REL_I386_SECTION  = 012
integer, parameter, public :: IMAGE_REL_I386_SECREL   = 013
integer, parameter, public :: IMAGE_REL_I386_REL32    = 024         ! PC-relative 32-bit reference to the symbols virtual address


! 
!  Based relocation format.
! 

type  T_IMAGE_BASE_RELOCATION
   integer     VirtualAddress 
   integer     SizeOfBlock 
!  integer(2)  TypeOffset[1];
end type  T_IMAGE_BASE_RELOCATION

integer, parameter, public :: IMAGE_SIZEOF_BASE_RELOCATION = 8

! 
!  Based relocation types.
! 

integer, parameter, public :: IMAGE_REL_BASED_ABSOLUTE      = 0
integer, parameter, public :: IMAGE_REL_BASED_HIGH          = 1
integer, parameter, public :: IMAGE_REL_BASED_LOW           = 2
integer, parameter, public :: IMAGE_REL_BASED_HIGHLOW       = 3
integer, parameter, public :: IMAGE_REL_BASED_HIGHADJ       = 4

! 
!  Line number format.
! 

type T_IMAGE_LINENUMBER$TYPE
   union
      map 
         integer(4)  SymbolTableIndex  ! Symbol table index of function name if Linenumber is 0.
      end map                         
      map
         integer(4)  VirtualAddress   ! Virtual address of line number.
      end map
   end union
end type T_IMAGE_LINENUMBER$TYPE


type T_IMAGE_LINENUMBER

   type (T_IMAGE_LINENUMBER$TYPE) Type

   integer(2) Linenumber      !  Line number.
end type T_IMAGE_LINENUMBER

integer, parameter, public :: IMAGE_SIZEOF_LINENUMBER = 6

! 
!  Archive format.
! 

integer, parameter, public :: IMAGE_ARCHIVE_START_SIZE = 8

character*10, parameter, public :: IMAGE_ARCHIVE_START              = "!<arch>\n"
character*4,  parameter, public :: IMAGE_ARCHIVE_END                = "`\n"
character*3,  parameter, public :: IMAGE_ARCHIVE_PAD                = "\n"
character*17, parameter, public :: IMAGE_ARCHIVE_LINKER_MEMBER      = "/               "
character*17, parameter, public :: IMAGE_ARCHIVE_LONGNAMES_MEMBER   = "!               "

type  T_IMAGE_ARCHIVE_MEMBER_HEADER

    BYTE Name (16 )           !  File member name - `/' terminated.
    BYTE Date (12 )           !  File member date - decimal.
    BYTE UserID (6 )          !  File member user id - decimal.
    BYTE GroupID (6 )         !  File member group id - decimal.
    BYTE Mode (8 )            !  File member mode - octal.
    BYTE Size (10 )           !  File member size - decimal.
    BYTE EndHeader (2 )       !  String to end header.

end type  T_IMAGE_ARCHIVE_MEMBER_HEADER

integer, parameter, public :: IMAGE_SIZEOF_ARCHIVE_MEMBER_HDR = 60

! 
!  DLL support.
! 

! 
!  Export Format
! 

type  T_IMAGE_EXPORT_DIRECTORY
   integer Characteristics 
   integer TimeDateStamp 
   integer(2) MajorVersion
   integer(2) MinorVersion 
   integer Name 
   integer Base 
   integer NumberOfFunctions 
   integer NumberOfNames 
   integer AddressOfFunctions 
   integer AddressOfNames 
   integer AddressOfNameOrdinals 
end type  T_IMAGE_EXPORT_DIRECTORY

! 
!  Import Format
! 

type  T_IMAGE_IMPORT_BY_NAME
    integer(2) Hint 
    BYTE Name (1 )
end type  T_IMAGE_IMPORT_BY_NAME

type T_IMAGE_THUNK_DATA$U1
   union
      map 
         integer(4)  Function
      end map
      map
         integer(4)  Ordinal
      end map
      map
         integer(4)  AddressOfData
      end map
   end union
end type T_IMAGE_THUNK_DATA$U1

type T_IMAGE_THUNK_DATA

   type (T_IMAGE_THUNK_DATA$U1) u1

end type T_IMAGE_THUNK_DATA


integer, parameter, public :: IMAGE_ORDINAL_FLAG =  #80000000 
! *************************************************************************
! These have been moved to MACRO.F90
!
!#define IMAGE_SNAP_BY_ORDINAL(Ordinal) ((Ordinal & IMAGE_ORDINAL_FLAG) != 0)
!#define IMAGE_ORDINAL(Ordinal) (Ordinal & #ffff)
! *************************************************************************

type  T_IMAGE_IMPORT_DESCRIPTOR
    integer Characteristics 
    integer TimeDateStamp 
    integer ForwarderChain 
    integer Name 
    integer FirstThunk 
end type  T_IMAGE_IMPORT_DESCRIPTOR

! 
!  Thread Local Storage
! 


type  T_IMAGE_TLS_DIRECTORY
   integer StartAddressOfRawData 
   integer EndAddressOfRawData 
   integer AddressOfIndex 
   integer AddressOfCallBacks 
   integer SizeOfZeroFill 
   integer Characteristics 
end type  T_IMAGE_TLS_DIRECTORY


! 
!  Resource Format.
! 

! 
!  Resource directory consists of two counts, following by a variable length
!  array of directory entries.  The first count is the number of entries at
!  beginning of the array that have actual names associated with each entry.
!  The entries are in ascending order, case insensitive strings.  The second
!  count is the number of entries that immediately follow the named entries.
!  This second count identifies the number of entries that have 31-bit integer
!  Ids as their name.  These entries are also sorted in ascending order.
! 
!  This structure allows fast lookup by either name or number, but for any
!  given resource entry only one form of lookup is supported, not both.
!  This is consistant with the syntax of the .RC file and the .RES file.
! 

type  T_IMAGE_RESOURCE_DIRECTORY
    integer Characteristics 
    integer TimeDateStamp 
    integer(2) MajorVersion 
    integer(2) MinorVersion 
    integer(2) NumberOfNamedEntries 
    integer(2) NumberOfIdEntries 
 !  type(IMAGE_RESOURCE_DIRECTORY_ENTRY) DirectoryEntries
end type  T_IMAGE_RESOURCE_DIRECTORY


integer, parameter, public :: IMAGE_RESOURCE_NAME_IS_STRING =  #80000000 
!integer, parameter, public :: IMAGE_RESOURCE_DATA_IS_DIRECTORY =  #80000000 
integer, parameter, public :: IMAGE_RES_DATA_IS_DIRECTORY =  #80000000 

! 
!  Each directory contains the 32-bit Name of the entry and an offset,
!  relative to the beginning of the resource directory of the data associated
!  with this directory entry.  If the name of the entry is an actual text
!  string instead of an integer Id, then the high order bit of the name field
!  is set to one and the low order 31-bits are an offset, relative to the
!  beginning of the resource directory of the string, which is of type
!  IMAGE_RESOURCE_DIRECTORY_STRING.  Otherwise the high bit is clear and the
!  low-order 31-bits are the integer Id that identify this resource directory
!  entry. If the directory entry is yet another resource directory (i.e. a
!  subdirectory), then the high order bit of the offset field will be
!  set to indicate this.  Otherwise the high bit is clear and the offset
!  field points to a resource data entry.
! 

type  IMAGE_RESOURCE_DIRECTORY_ENTRY
    integer Name 
    integer OffsetToData 
end type  IMAGE_RESOURCE_DIRECTORY_ENTRY

! 
!  For resource directory entries that have actual string names, the Name
!  field of the directory entry points to an object of the following type.
!  All of these string objects are stored together after the last resource
!  directory entry and before the first resource data object.  This minimizes
!  the impact of these variable length objects on the alignment of the fixed
!  size directory entry objects.
! 

type  IMAGE_RESOURCE_DIRECTORY_STRING
    integer(2) Length 
    character NameString ( 1  )
end type  IMAGE_RESOURCE_DIRECTORY_STRING



! 
!  Each resource data entry describes a leaf node in the resource directory
!  tree.  It contains an offset, relative to the beginning of the resource
!  directory of the data for the resource, a size field that gives the number
!  of bytes of data at that offset, a CodePage that should be used when
!  decoding code point values within the resource data.  Typically for new
!  applications the code page would be the unicode code page.
! 

type  T_IMAGE_RESOURCE_DATA_ENTRY
    integer OffsetToData 
    integer Size 
    integer CodePage 
    integer Reserved 
end type  T_IMAGE_RESOURCE_DATA_ENTRY

! 
!  Load Configuration Directory Entry
! 

type  T_IMAGE_LOAD_CONFIG_DIRECTORY
    integer Characteristics 
    integer TimeDateStamp 
    integer(2) MajorVersion 
    integer(2) MinorVersion 
    integer GlobalFlagsClear 
    integer GlobalFlagsSet 
    integer CriticalSectionDefaultTimeout 
    integer DeCommitFreeBlockThreshold 
    integer DeCommitTotalFreeThreshold 
    integer(4) LockPrefixTable
    integer(4) MaximumAllocationSize
    integer(4) VirtualMemoryThreshold
    integer Reserved (5)
end type  T_IMAGE_LOAD_CONFIG_DIRECTORY


! 
!  Function table entry format for MIPS/ALPHA images.  Function table is
!  pointed to by the IMAGE_DIRECTORY_ENTRY_EXCEPTION directory entry.
!  This definition duplicates ones in ntmips.h and ntalpha.h for use
!  by portable image file mungers.
! 

type  T_IMAGE_RUNTIME_FUNCTION_ENTRY
    integer BeginAddress 
    integer EndAddress 
    integer ExceptionHandler 
    integer HandlerData 
    integer PrologEndAddress 
end type  T_IMAGE_RUNTIME_FUNCTION_ENTRY

! 
!  Debug Format
! 

type  T_IMAGE_DEBUG_DIRECTORY
    integer Characteristics 
    integer TimeDateStamp 
    integer(2) MajorVersion 
    integer(2) MinorVersion 
    integer Type 
    integer SizeOfData 
    integer AddressOfRawData 
    integer PointerToRawData 
end type  T_IMAGE_DEBUG_DIRECTORY

integer, parameter, public :: IMAGE_DEBUG_TYPE_UNKNOWN = 0
integer, parameter, public :: IMAGE_DEBUG_TYPE_COFF         = 1
integer, parameter, public :: IMAGE_DEBUG_TYPE_CODEVIEW     = 2
integer, parameter, public :: IMAGE_DEBUG_TYPE_FPO          = 3
integer, parameter, public :: IMAGE_DEBUG_TYPE_MISC         = 4
integer, parameter, public :: IMAGE_DEBUG_TYPE_EXCEPTION    = 5
integer, parameter, public :: IMAGE_DEBUG_TYPE_FIXUP        = 6
!integer, parameter, public :: IMAGE_DEBUG_TYPE_RESERVED6   = 7
!integer, parameter, public :: IMAGE_DEBUG_TYPE_RESERVED7   = 8
integer, parameter, public :: IMAGE_DEBUG_TYPE_OMAP_TO_SRC   =   7
integer, parameter, public :: IMAGE_DEBUG_TYPE_OMAP_FROM_SRC =   8

type  T_IMAGE_COFF_SYMBOLS_HEADER
    integer NumberOfSymbols 
    integer LvaToFirstSymbol 
    integer NumberOfLinenumbers 
    integer LvaToFirstLinenumber 
    integer RvaToFirstByteOfCode 
    integer RvaToLastByteOfCode 
    integer RvaToFirstByteOfData 
    integer RvaToLastByteOfData 
end type  T_IMAGE_COFF_SYMBOLS_HEADER

integer, parameter, public :: FRAME_FPO   = 0
integer, parameter, public :: FRAME_TRAP  = 1
integer, parameter, public :: FRAME_TSS   = 2

type  T_FPO_DATA
    integer ulOffStart               !  offset 1st byte of function code
    integer cbProcSize               !  # bytes in function
    integer cdwLocals                !  # bytes in locals/4
    integer*2 cdwParams              !  # bytes in params/4
    integer(2) Bits
! *************************************************************************
! These bits can be accessed using functions defined in BITSFUNC.F90
!    cbProlog  : 8 ;            !  # bytes in prolog
!    cbRegs    : 3 ;            !  # regs saved
!    fHasSEH   : 1 ;            !  TRUE if SEH in func
!    fUseBP    : 1 ;            !  TRUE if EBP has been allocated
!    reserved  : 1 ;            !  reserved for future use
!    cbFrame   : 2 ;            !  frame type
! *************************************************************************
end type  T_FPO_DATA

integer, parameter, public :: SIZEOF_RFPO_DATA = 16


integer, parameter, public :: IMAGE_DEBUG_MISC_EXENAME = 1

type  T_IMAGE_DEBUG_MISC
    integer    DataType                !  type of misc data, see defines
    integer    Length                  !  total length of record, rounded to four
                                       !  byte multiple.
    logical(4) Unicode                 !  TRUE if data is unicode string
    BYTE       Reserved (3)
    BYTE       Data (1)                !  Actual data
end type  T_IMAGE_DEBUG_MISC

!
! Function table extracted from MIPS/ALPHA images.  Does not contain
! information needed only for runtime support.  Just those fields for
! each entry needed by a debugger.
!

type T_IMAGE_FUNCTION_ENTRY 
    integer(4) StartingAddress
    integer(4) EndingAddress
    integer(4) EndOfPrologue
end type T_IMAGE_FUNCTION_ENTRY 

! 
!  Debugging information can be stripped from an image file and placed
!  in a separate .DBG file, whose file name part is the same as the
!  image file name part (e.g. symbols for CMD.EXE could be stripped
!  and placed in CMD.DBG).  This is indicated by the IMAGE_FILE_DEBUG_STRIPPED
!  flag in the Characteristics field of the file header.  The beginning of
!  the .DBG file contains the following structure which captures certain
!  information from the image file.  This allows a debug to proceed even if
!  the original image file is not accessable.  This header is followed by
!  zero of more T_IMAGE_SECTION_HEADER structures, followed by zero or more
!  T_IMAGE_DEBUG_DIRECTORY structures.  The latter structures and those in
!  the image file contain file offsets relative to the beginning of the
!  .DBG file.
! 
!  If symbols have been stripped from an image, the T_IMAGE_DEBUG_MISC structure
!  is left in the image file, but not mapped.  This allows a debugger to
!  compute the name of the .DBG file, from the name of the image in the
!  T_IMAGE_DEBUG_MISC structure.
! 

type  T_IMAGE_SEPARATE_DEBUG_HEADER
    integer(2) Signature 
    integer(2) Flags 
    integer(2) Machine 
    integer(2) Characteristics 
    integer    TimeDateStamp 
    integer    CheckSum 
    integer    ImageBase 
    integer    SizeOfImage 
    integer    NumberOfSections 
    integer    ExportedNamesSize 
    integer    DebugDirectorySize 
    integer    Reserved ( 3  )
end type  T_IMAGE_SEPARATE_DEBUG_HEADER

integer, parameter, public :: IMAGE_SEPARATE_DEBUG_SIGNATURE =  #4944


! 
!  End Image Format
! 

! 
!  for move macros
! 
integer, parameter, public :: HEAP_NO_SERIALIZE             =  #00000001      
integer, parameter, public :: HEAP_GROWABLE                 =  #00000002      
integer, parameter, public :: HEAP_GENERATE_EXCEPTIONS      =  #00000004      
integer, parameter, public :: HEAP_ZERO_MEMORY              =  #00000008      
integer, parameter, public :: HEAP_REALLOC_IN_PLACE_ONLY    =  #00000010      
integer, parameter, public :: HEAP_TAIL_CHECKING_ENABLED    =  #00000020      
integer, parameter, public :: HEAP_FREE_CHECKING_ENABLED    =  #00000040      
integer, parameter, public :: HEAP_DISABLE_COALESCE_ON_FREE =  #00000080      

integer, parameter, public :: COMPRESSION_FORMAT_NONE       =   #0000   
integer, parameter, public :: COMPRESSION_FORMAT_DEFAULT    =   #0001   
integer, parameter, public :: COMPRESSION_FORMAT_LZNT1      =   #0002   
integer, parameter, public :: COMPRESSION_ENGINE_STANDARD   =   #0000   
integer, parameter, public :: COMPRESSION_ENGINE_MAXIMUM    =   #0100   

type T_MESSAGE_RESOURCE_ENTRY
    integer(2)    Length
    integer(2)    Flags
    BYTE          Text(1)
end type T_MESSAGE_RESOURCE_ENTRY

type T_MESSAGE_RESOURCE_BLOCK
    integer(4)    LowId
    integer(4)    HighId
    integer(4)    OffsetToEntries
end type T_MESSAGE_RESOURCE_BLOCK

type T_MESSAGE_RESOURCE_DATA
    integer(4)    NumberOfBlocks
    type(T_MESSAGE_RESOURCE_BLOCK)    Blocks(1)
end type T_MESSAGE_RESOURCE_DATA


type  T_RTL_CRITICAL_SECTION
    integer    DebugInfo 
     ! 
     !   The following three fields control entering and exiting the critical
     !   section for the resource
     ! 
    integer    LockCount 
    integer    RecursionCount 
    integer    OwningThread     !  from the thread's ClientId->UniqueThread
    integer    LockSemaphore 
    integer    Reserved 
end type  T_RTL_CRITICAL_SECTION

type  T_RTL_CRITICAL_SECTION_DEBUG
    integer(2) Type 
    integer(2) CreatorBackTraceIndex 
    type(T_RTL_CRITICAL_SECTION)    CriticalSection 
    type (T_LIST_ENTRY) ProcessLocksList 
    integer    EntryCount 
    integer    ContentionCount 
    integer    Depth 
    integer    OwnerBackTrace ( 5  )
end type  T_RTL_CRITICAL_SECTION_DEBUG

integer, parameter, public :: RTL_CRITSECT_TYPE = 0
integer, parameter, public :: RTL_RESOURCE_TYPE = 1


integer, parameter, public :: DLL_PROCESS_ATTACH   = 1    
integer, parameter, public :: DLL_THREAD_ATTACH    = 2    
integer, parameter, public :: DLL_THREAD_DETACH    = 3    
integer, parameter, public :: DLL_PROCESS_DETACH   = 0    

! 
!  Defines for the READ flags for Eventlogging
! 
integer, parameter, public :: EVENTLOG_SEQUENTIAL_READ   = #0001
integer, parameter, public :: EVENTLOG_SEEK_READ         = #0002
integer, parameter, public :: EVENTLOG_FORWARDS_READ     = #0004
integer, parameter, public :: EVENTLOG_BACKWARDS_READ    = #0008

! 
!  The types of events that can be logged.
! 
integer, parameter, public :: EVENTLOG_SUCCESS           = #0000
integer, parameter, public :: EVENTLOG_ERROR_TYPE        = #0001
integer, parameter, public :: EVENTLOG_WARNING_TYPE      = #0002
integer, parameter, public :: EVENTLOG_INFORMATION_TYPE  = #0004
integer, parameter, public :: EVENTLOG_AUDIT_SUCCESS     = #0008
integer, parameter, public :: EVENTLOG_AUDIT_FAILURE     = #0010

! 
!  Defines for the WRITE flags used by Auditing for paired events
!  These are not implemented in Product 1
! 

integer, parameter, public :: EVENTLOG_START_PAIRED_EVENT      =  #0001
integer, parameter, public :: EVENTLOG_END_PAIRED_EVENT        =  #0002
integer, parameter, public :: EVENTLOG_END_ALL_PAIRED_EVENTS   =  #0004
integer, parameter, public :: EVENTLOG_PAIRED_EVENT_ACTIVE     =  #0008
integer, parameter, public :: EVENTLOG_PAIRED_EVENT_INACTIVE   =  #0010

! 
!  Structure that defines the header of the Eventlog record. This is the
!  fixed-sized portion before all the variable-length strings, binary
!  data and pad bytes.
! 
!  TimeGenerated is the time it was generated at the client.
!  TimeWritten is the time it was put into the log at the server end.
! 

type  T_EVENTLOGRECORD
    integer    Length          !  Length of full record
    integer    Reserved        !  Used by the service
    integer    RecordNumber    !  Absolute record number
    integer    TimeGenerated   !  Seconds since 1-1-1970
    integer    TimeWritten     !  Seconds since 1-1-1970
    integer    EventID 
    integer(2) EventType 
    integer(2) NumStrings  
    integer(2) EventCategory  
    integer(2) ReservedFlags   !  For use with paired events (auditing)
    integer    ClosingRecordNumber   !  For use with paired events (auditing)
    integer    StringOffset    !  Offset from beginning of record
    integer    UserSidLength 
    integer    UserSidOffset 
    integer    DataLength 
    integer    DataOffset      !  Offset from beginning of record
end type  T_EVENTLOGRECORD

integer, parameter, public :: DBG_CONTINUE                    = (#00010002) 
integer, parameter, public :: DBG_TERMINATE_THREAD            = (#40010003) 
integer, parameter, public :: DBG_TERMINATE_PROCESS           = (#40010004) 
integer, parameter, public :: DBG_CONTROL_C                   = (#40010005) 
integer, parameter, public :: DBG_CONTROL_BREAK               = (#40010008) 
integer, parameter, public :: DBG_EXCEPTION_NOT_HANDLED       = (#80010001) 
! 

!  begin_ntddk begin_nthal
! 
!  Registry Specific Access Rights.
! 

integer, parameter, public :: KEY_QUERY_VALUE         =  #00000001
integer, parameter, public :: KEY_SET_VALUE           =  #0002
integer, parameter, public :: KEY_CREATE_SUB_KEY      =  #0004
integer, parameter, public :: KEY_ENUMERATE_SUB_KEYS  =  #00000008
integer, parameter, public :: KEY_NOTIFY              =  #00000010
integer, parameter, public :: KEY_CREATE_LINK         =  #0020

! ************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: KEY_READ    = IAND(IOR(STANDARD_RIGHTS_READ, &
!                                  IOR(KEY_QUERY_VALUE, & 
!                                  IOR(KEY_ENUMERATE_SUB_KEYS, KEY_NOTIFY))), -1048577) !NOT(SYNCHRONIZE))


!integer, parameter, public :: KEY_WRITE  = (IAND(IOR(STANDARD_RIGHTS_WRITE , &
!                                  IOR(KEY_SET_VALUE, KEY_CREATE_SUB_KEY)), -1048577)) !NOT(SYNCHRONIZE)))

!integer, parameter, public :: KEY_EXECUTE             = (IAND(KEY_READ, -1048577)) !NOT(SYNCHRONIZE)))

!integer, parameter, public :: KEY_ALL_ACCESS          = (IAND(IOR(STANDARD_RIGHTS_ALL, &
!                                  IOR(KEY_QUERY_VALUE, & 
!                                  IOR(KEY_SET_VALUE , &
!                                  IOR(KEY_CREATE_SUB_KEY, &
!                                  IOR(KEY_ENUMERATE_SUB_KEYS, & 
!                                  IOR(KEY_NOTIFY , KEY_CREATE_LINK)))))), -1048577)) !NOT(SYNCHRONIZE)))
! ************************************************************************

! 
!  Open/Create Options
! 

integer, parameter, public :: REG_OPTION_RESERVED       =  #00000000   ! Parameter is reserved
integer, parameter, public :: REG_OPTION_NON_VOLATILE   =  #00000000   ! Key is preserved
                                                                       !  when system is rebooted
integer, parameter, public :: REG_OPTION_VOLATILE       =  #00000001   ! Key is not preserved
                                                                       !  when system is rebooted
integer, parameter, public :: REG_OPTION_CREATE_LINK    =  #00000002   ! Created key is a
                                                                       !  symbolic link
integer, parameter, public :: REG_OPTION_BACKUP_RESTORE =  #00000004   ! open for backup or restore
                                                                       !  special access rules
                                                                       !  privilege required
! ************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: REG_LEGAL_OPTION            =  &
!                IOR(REG_OPTION_RESERVED , &           
!                IOR( REG_OPTION_NON_VOLATILE , &        
!                IOR( REG_OPTION_VOLATILE     , &        
!                IOR( REG_OPTION_CREATE_LINK  ,  REG_OPTION_BACKUP_RESTORE))))
! ************************************************************************

! 
!  Key creation/open disposition
! 

integer, parameter, public :: REG_CREATED_NEW_KEY =  #00000001   ! New Registry Key created
integer, parameter, public :: REG_OPENED_EXISTING_KEY =  #00000002   ! Existing Key opened

! 
!  Key restore flags
! 

integer, parameter, public :: REG_WHOLE_HIVE_VOLATILE =  #00000001   ! Restore whole hive volatile
integer, parameter, public :: REG_REFRESH_HIVE =  #00000002   ! Unwind changes to last flush

!  end_ntddk end_nthal

! 
!  Notify filter values
! 
integer, parameter, public :: REG_NOTIFY_CHANGE_NAME        =  #00000001 ! Create or delete (child)
integer, parameter, public :: REG_NOTIFY_CHANGE_ATTRIBUTES  =  #00000002
integer, parameter, public :: REG_NOTIFY_CHANGE_LAST_SET    =  #00000004 ! time stamp
integer, parameter, public :: REG_NOTIFY_CHANGE_SECURITY    =  #00000008

! ************************************************************************
! These have been moved to STMT.F90
!integer, parameter, public :: REG_LEGAL_CHANGE_FILTER                 =  &
!                IOR(REG_NOTIFY_CHANGE_NAME      , &
!                IOR( REG_NOTIFY_CHANGE_ATTRIBUTES   , &  
!                IOR( REG_NOTIFY_CHANGE_LAST_SET    , REG_NOTIFY_CHANGE_SECURITY)))
! ************************************************************************

! 
! 
!  Predefined Value Types.
! 

integer, parameter, public :: REG_NONE                    = ( 0 )   !  No value type
integer, parameter, public :: REG_SZ                      = ( 1 )   !  Unicode nul terminated string
integer, parameter, public :: REG_EXPAND_SZ               = ( 2 )   !  Unicode nul terminated string
                                                                    !  (with environment variable references)
integer, parameter, public :: REG_BINARY                  = ( 3 )   !  Free form binary
integer, parameter, public :: REG_DWORD                   = ( 4 )   !  32-bit number
integer, parameter, public :: REG_DWORD_LITTLE_ENDIAN     = ( 4 )   !  32-bit number (same as REG_DWORD)
integer, parameter, public :: REG_DWORD_BIG_ENDIAN        = ( 5 )   !  32-bit number
integer, parameter, public :: REG_LINK                    = ( 6 )   !  Symbolic Link (unicode)
integer, parameter, public :: REG_MULTI_SZ                = ( 7 )   !  Multiple Unicode strings
integer, parameter, public :: REG_RESOURCE_LIST           = ( 8 )   !  Resource list in the resource map
integer, parameter, public :: REG_FULL_RESOURCE_DESCRIPTOR = ( 9 )  !  Resource list in the hardware description
integer, parameter, public :: REG_RESOURCE_REQUIREMENTS_LIST = ( 10 )

!  end_ntddk end_nthal
!  begin_ntddk begin_nthal
! 
!  Service Types (Bit Mask)
! 
integer, parameter, public :: SERVICE_KERNEL_DRIVER =  #00000001
integer, parameter, public :: SERVICE_FILE_SYSTEM_DRIVER =  #00000002
integer, parameter, public :: SERVICE_ADAPTER =  #00000004
integer, parameter, public :: SERVICE_RECOGNIZER_DRIVER =  #00000008

! ************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: SERVICE_DRIVER                 =  &
!                        IOR(SERVICE_KERNEL_DRIVER , &
!                        IOR(SERVICE_FILE_SYSTEM_DRIVER, SERVICE_RECOGNIZER_DRIVER))
! ************************************************************************

integer, parameter, public :: SERVICE_WIN32_OWN_PROCESS =  #00000010
integer, parameter, public :: SERVICE_WIN32_SHARE_PROCESS =  #00000020

! ************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: SERVICE_WIN32  = IOR(SERVICE_WIN32_OWN_PROCESS , SERVICE_WIN32_SHARE_PROCESS)
! ************************************************************************

integer, parameter, public :: SERVICE_INTERACTIVE_PROCESS = #00000100


! ************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: SERVICE_TYPE_ALL               =  &
!                                IOR(SERVICE_WIN32  , &
!                                IOR(SERVICE_ADAPTER,    SERVICE_DRIVER))
! ************************************************************************

! 
!  Start Type
! 

integer, parameter, public :: SERVICE_BOOT_START   =  #00000000
integer, parameter, public :: SERVICE_SYSTEM_START =  #00000001
integer, parameter, public :: SERVICE_AUTO_START   =  #00000002
integer, parameter, public :: SERVICE_DEMAND_START =  #00000003
integer, parameter, public :: SERVICE_DISABLED     =  #00000004

! 
!  Error control type
! 
integer, parameter, public :: SERVICE_ERROR_IGNORE    =  #00000000
integer, parameter, public :: SERVICE_ERROR_NORMAL    =  #00000001
integer, parameter, public :: SERVICE_ERROR_SEVERE    =  #00000002
integer, parameter, public :: SERVICE_ERROR_CRITICAL  =  #00000003

! 
! 
!  Define the registry driver node enumerations
! 


integer, parameter, public :: DriverType                =  SERVICE_KERNEL_DRIVER
integer, parameter, public :: FileSystemType            =  SERVICE_FILE_SYSTEM_DRIVER
integer, parameter, public :: Win32ServiceOwnProcess    =  SERVICE_WIN32_OWN_PROCESS
integer, parameter, public :: Win32ServiceShareProcess  =  SERVICE_WIN32_SHARE_PROCESS
integer, parameter, public :: AdapterType               =  SERVICE_ADAPTER
integer, parameter, public :: RecognizerType            =  SERVICE_RECOGNIZER_DRIVER


integer, parameter, public :: BootLoad     =  SERVICE_BOOT_START
integer, parameter, public :: SystemLoad   =  SERVICE_SYSTEM_START
integer, parameter, public :: AutoLoad     =  SERVICE_AUTO_START
integer, parameter, public :: DemandLoad   =  SERVICE_DEMAND_START
integer, parameter, public :: DisableLoad  =  SERVICE_DISABLED


integer, parameter, public :: IgnoreError    =  SERVICE_ERROR_IGNORE
integer, parameter, public :: NormalError    =  SERVICE_ERROR_NORMAL
integer, parameter, public :: SevereError    =  SERVICE_ERROR_SEVERE
integer, parameter, public :: CriticalError  =  SERVICE_ERROR_CRITICAL


! 
!  IOCTL_TAPE_ERASE definitions
! 

integer, parameter, public :: TAPE_ERASE_SHORT = 0
integer, parameter, public :: TAPE_ERASE_LONG = 1

type  T_TAPE_ERASE
    integer Type 
    logical(4) Immediate 
end type  T_TAPE_ERASE

! 
!  IOCTL_TAPE_PREPARE definitions
! 

integer, parameter, public :: TAPE_LOAD      = 0
integer, parameter, public :: TAPE_UNLOAD    = 1
integer, parameter, public :: TAPE_TENSION   = 2
integer, parameter, public :: TAPE_LOCK      = 3
integer, parameter, public :: TAPE_UNLOCK    = 4
integer, parameter, public :: TAPE_FORMAT    = 5

type  T_TAPE_PREPARE
    integer Operation 
    logical(4) Immediate 
end type  T_TAPE_PREPARE

! 
!  IOCTL_TAPE_WRITE_MARKS definitions
! 

integer, parameter, public :: TAPE_SETMARKS        = 0
integer, parameter, public :: TAPE_FILEMARKS       = 1
integer, parameter, public :: TAPE_SHORT_FILEMARKS = 2
integer, parameter, public :: TAPE_LONG_FILEMARKS  = 3

type  T_TAPE_WRITE_MARKS
    integer Type 
    integer Count 
    logical(4) Immediate 
end type  T_TAPE_WRITE_MARKS

! 
!  IOCTL_TAPE_GET_POSITION definitions
! 

integer, parameter, public :: TAPE_ABSOLUTE_POSITION        = 0
integer, parameter, public :: TAPE_LOGICAL_POSITION         = 1
integer, parameter, public :: TAPE_PSEUDO_LOGICAL_POSITION  = 2

type  T_TAPE_GET_POSITION
    integer Type 
    integer Partition 
    type (T_LARGE_INTEGER) Offset 
end type  T_TAPE_GET_POSITION

! 
!  IOCTL_TAPE_SET_POSITION definitions
! 

integer, parameter, public :: TAPE_REWIND                = 0
integer, parameter, public :: TAPE_ABSOLUTE_BLOCK        = 1
integer, parameter, public :: TAPE_LOGICAL_BLOCK         = 2
integer, parameter, public :: TAPE_PSEUDO_LOGICAL_BLOCK  = 3
integer, parameter, public :: TAPE_SPACE_END_OF_DATA     = 4
integer, parameter, public :: TAPE_SPACE_RELATIVE_BLOCKS = 5
integer, parameter, public :: TAPE_SPACE_FILEMARKS       = 6
integer, parameter, public :: TAPE_SPACE_SEQUENTIAL_FMKS = 7
integer, parameter, public :: TAPE_SPACE_SETMARKS        = 8
integer, parameter, public :: TAPE_SPACE_SEQUENTIAL_SMKS = 9

type  T_TAPE_SET_POSITION
    integer Method 
    integer Partition 
    type (T_LARGE_INTEGER) Offset 
    logical(4) Immediate 
end type  T_TAPE_SET_POSITION

! 
!  IOCTL_TAPE_GET_DRIVE_PARAMS definitions
! 

! 
!  Definitions for FeaturesLow parameter
! 

integer, parameter, public :: TAPE_DRIVE_FIXED     =  #00000001
integer, parameter, public :: TAPE_DRIVE_SELECT    =  #00000002
integer, parameter, public :: TAPE_DRIVE_INITIATOR =  #00000004

integer, parameter, public :: TAPE_DRIVE_ERASE_SHORT     =  #00000010
integer, parameter, public :: TAPE_DRIVE_ERASE_LONG      =  #00000020
integer, parameter, public :: TAPE_DRIVE_ERASE_BOP_ONLY  =  #00000040
integer, parameter, public :: TAPE_DRIVE_ERASE_IMMEDIATE =  #00000080

integer, parameter, public :: TAPE_DRIVE_TAPE_CAPACITY   =  #00000100
integer, parameter, public :: TAPE_DRIVE_TAPE_REMAINING  =  #00000200
integer, parameter, public :: TAPE_DRIVE_FIXED_BLOCK     =  #00000400
integer, parameter, public :: TAPE_DRIVE_VARIABLE_BLOCK  =  #00000800

integer, parameter, public :: TAPE_DRIVE_WRITE_PROTECT   =  #00001000
integer, parameter, public :: TAPE_DRIVE_EOT_WZ_SIZE     =  #00002000

integer, parameter, public :: TAPE_DRIVE_ECC          =  #00010000
integer, parameter, public :: TAPE_DRIVE_COMPRESSION  =  #00020000
integer, parameter, public :: TAPE_DRIVE_PADDING      =  #00040000
integer, parameter, public :: TAPE_DRIVE_REPORT_SMKS  =  #00080000

integer, parameter, public :: TAPE_DRIVE_GET_ABSOLUTE_BLK =  #00100000
integer, parameter, public :: TAPE_DRIVE_GET_LOGICAL_BLK =  #00200000
integer, parameter, public :: TAPE_DRIVE_SET_EOT_WZ_SIZE =  #00400000

integer, parameter, public :: TAPE_DRIVE_RESERVED_BIT =  #80000000 !don't use this bit!
!                                                     !can't be a low features bit!
!                                                     !reserved; high features only

! 
!  Definitions for FeaturesHigh parameter
! 

integer, parameter, public :: TAPE_DRIVE_LOAD_UNLOAD        =  #80000001
integer, parameter, public :: TAPE_DRIVE_TENSION            =  #80000002
integer, parameter, public :: TAPE_DRIVE_LOCK_UNLOCK        =  #80000004
integer, parameter, public :: TAPE_DRIVE_REWIND_IMMEDIATE   =  #80000008

integer, parameter, public :: TAPE_DRIVE_SET_BLOCK_SIZE  =  #80000010
integer, parameter, public :: TAPE_DRIVE_LOAD_UNLD_IMMED =  #80000020
integer, parameter, public :: TAPE_DRIVE_TENSION_IMMED   =  #80000040
integer, parameter, public :: TAPE_DRIVE_LOCK_UNLK_IMMED =  #80000080

integer, parameter, public :: TAPE_DRIVE_SET_ECC         =  #80000100
integer, parameter, public :: TAPE_DRIVE_SET_COMPRESSION =  #80000200
integer, parameter, public :: TAPE_DRIVE_SET_PADDING     =  #80000400
integer, parameter, public :: TAPE_DRIVE_SET_REPORT_SMKS =  #80000800

integer, parameter, public :: TAPE_DRIVE_ABSOLUTE_BLK    =  #80001000
integer, parameter, public :: TAPE_DRIVE_ABS_BLK_IMMED   =  #80002000
integer, parameter, public :: TAPE_DRIVE_LOGICAL_BLK     =  #80004000
integer, parameter, public :: TAPE_DRIVE_LOG_BLK_IMMED   =  #80008000

integer, parameter, public :: TAPE_DRIVE_END_OF_DATA     =  #80010000
integer, parameter, public :: TAPE_DRIVE_RELATIVE_BLKS   =  #80020000
integer, parameter, public :: TAPE_DRIVE_FILEMARKS       =  #80040000
integer, parameter, public :: TAPE_DRIVE_SEQUENTIAL_FMKS =  #80080000

integer, parameter, public :: TAPE_DRIVE_SETMARKS           =  #80100000
integer, parameter, public :: TAPE_DRIVE_SEQUENTIAL_SMKS    =  #80200000
integer, parameter, public :: TAPE_DRIVE_REVERSE_POSITION   = #80400000
integer, parameter, public :: TAPE_DRIVE_SPACE_IMMEDIATE    = #80800000

integer, parameter, public :: TAPE_DRIVE_WRITE_SETMARKS     =  #81000000
integer, parameter, public :: TAPE_DRIVE_WRITE_FILEMARKS    =  #82000000
integer, parameter, public :: TAPE_DRIVE_WRITE_SHORT_FMKS   =  #84000000
integer, parameter, public :: TAPE_DRIVE_WRITE_LONG_FMKS    =  #88000000

integer, parameter, public :: TAPE_DRIVE_WRITE_MARK_IMMED   =  #90000000
integer, parameter, public :: TAPE_DRIVE_FORMAT             =  #A0000000
integer, parameter, public :: TAPE_DRIVE_FORMAT_IMMEDIATE   =  #C0000000
integer, parameter, public :: TAPE_DRIVE_HIGH_FEATURES      =  #80000000 !mask for high features flag

type  T_TAPE_GET_DRIVE_PARAMETERS
    logical(4) ECC 
    logical(4) Compression 
    logical(4) DataPadding 
    logical(4) ReportSetmarks 
    integer DefaultBlockSize 
    integer MaximumBlockSize 
    integer MinimumBlockSize 
    integer MaximumPartitionCount 
    integer FeaturesLow 
    integer FeaturesHigh 
    integer EOTWarningZoneSize 
end type  T_TAPE_GET_DRIVE_PARAMETERS

! 
!  IOCTL_TAPE_SET_DRIVE_PARAMETERS definitions
! 

type  T_TAPE_SET_DRIVE_PARAMETERS
    logical(4) ECC 
    logical(4) Compression 
    logical(4) DataPadding 
    logical(4) ReportSetmarks 
    integer(4) EOTWarningZoneSize 
end type  T_TAPE_SET_DRIVE_PARAMETERS

! 
!  IOCTL_TAPE_GET_MEDIA_PARAMETERS definitions
! 

type  T_TAPE_GET_MEDIA_PARAMETERS
    type (T_LARGE_INTEGER) Capacity 
    type (T_LARGE_INTEGER) Remaining 
    integer BlockSize 
    integer PartitionCount 
    logical(4) WriteProtected 
end type  T_TAPE_GET_MEDIA_PARAMETERS

! 
!  IOCTL_TAPE_SET_MEDIA_PARAMETERS definitions
! 

type  T_TAPE_SET_MEDIA_PARAMETERS
    integer BlockSize 
end type  T_TAPE_SET_MEDIA_PARAMETERS

! 
!  IOCTL_TAPE_CREATE_PARTITION definitions
! 

integer, parameter, public :: TAPE_FIXED_PARTITIONS      = 0
integer, parameter, public :: TAPE_SELECT_PARTITIONS     = 1
integer, parameter, public :: TAPE_INITIATOR_PARTITIONS  = 2

type  T_TAPE_CREATE_PARTITION
    integer Method 
    integer Count 
    integer Size 
end type  T_TAPE_CREATE_PARTITION

!                                   ****WINDEF****
!**************************************************************************
!The following are defined in stmt.f90
!
!#define MAKEWORD(a, b)      ((WORD)(((BYTE)(a)) | ((WORD)((BYTE)(b))) << 8))
!#define MAKELONG(a, b)      ((LONG)(((WORD)(a)) | ((DWORD)((WORD)(b))) << 16))
!#define LOWORD(l)           ((WORD)(l))
!#define HIWORD(l)           ((WORD)(((DWORD)(l) >> 16) & 0xFFFF))
!#define LOBYTE(w)           ((BYTE)(w))
!#define HIBYTE(w)           ((BYTE)(((WORD)(w) >> 8) & 0xFF))
!***************************************************************************

integer, parameter, public :: NULL     = 0
integer, parameter, public :: MAX_PATH = 260
integer, parameter, public :: FALSE    = 0
integer, parameter, public :: TRUE     = 1

!   Types use for passing & returning polymorphic values   

integer, parameter, public :: HFILE_ERROR = -1

type  T_RECT
    integer left 
    integer top 
    integer right 
    integer bottom 
end type  T_RECT

type(T_RECT), pointer :: null_rect

type  T_RECTL
    integer left 
    integer top 
    integer right 
    integer bottom 
end type  T_RECTL

type  T_POINT
    integer x 
    integer y 
end type  T_POINT

type(T_POINT), pointer :: null_point

type  T_POINTL
    integer x 
    integer y 
end type  T_POINTL

type  T_SIZE
    integer cx 
    integer cy 
end type  T_SIZE


type  T_POINTS
    integer x
    integer y
end type  T_POINTS

!   mode selections for the device mode function   
integer, parameter, public :: DM_UPDATE   = 1
integer, parameter, public :: DM_COPY     = 2
integer, parameter, public :: DM_PROMPT   = 4
integer, parameter, public :: DM_MODIFY   = 8

integer, parameter, public :: DM_IN_BUFFER   = DM_MODIFY
integer, parameter, public :: DM_IN_PROMPT   = DM_PROMPT
integer, parameter, public :: DM_OUT_BUFFER  = DM_COPY
integer, parameter, public :: DM_OUT_DEFAULT = DM_UPDATE

!   device capabilities indices   
integer, parameter, public :: DC_FIELDS      = 1
integer, parameter, public :: DC_PAPERS      = 2
integer, parameter, public :: DC_PAPERSIZE   = 3
integer, parameter, public :: DC_MINEXTENT   = 4
integer, parameter, public :: DC_MAXEXTENT   = 5
integer, parameter, public :: DC_BINS        = 6
integer, parameter, public :: DC_DUPLEX      = 7
integer, parameter, public :: DC_SIZE        = 8
integer, parameter, public :: DC_EXTRA       = 9
integer, parameter, public :: DC_VERSION     = 10
integer, parameter, public :: DC_DRIVER      = 11
integer, parameter, public :: DC_BINNAMES    = 12
integer, parameter, public :: DC_ENUMRESOLUTIONS   = 13
integer, parameter, public :: DC_FILEDEPENDENCIES  = 14
integer, parameter, public :: DC_TRUETYPE    = 15
integer, parameter, public :: DC_PAPERNAMES  = 16
integer, parameter, public :: DC_ORIENTATION = 17
integer, parameter, public :: DC_COPIES      = 18


!                       ****WINERROR****

!
! 
!   Values are 32 bit values layed out as follows:
! 
!    3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
!    1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
!   +---+-+-+-----------------------+-------------------------------+
!   |Sev|C|R|     Facility          |               Code            |
!   +---+-+-+-----------------------+-------------------------------+
! 
!   where
! 
!       Sev - is the severity code
! 
!           00 - Success
!           01 - Informational
!           10 - Warning
!           11 - Error
! 
!       C - is the Customer code flag
! 
!       R - is a reserved bit
! 
!       Facility - is the facility code
! 
!       Code - is the facility's status code
! 
! 
!  Define the facility codes
! 
integer, parameter, public :: FACILITY_WINDOWS             =    8
integer, parameter, public :: FACILITY_STORAGE             =    3
integer, parameter, public :: FACILITY_RPC                 =    1
integer, parameter, public :: FACILITY_WIN32               =    7
integer, parameter, public :: FACILITY_CONTROL             =    10
integer, parameter, public :: FACILITY_NULL                =    0
integer, parameter, public :: FACILITY_ITF                 =    4
integer, parameter, public :: FACILITY_DISPATCH            =    2


! 
!  Define the severity codes
! 


! 
!  MessageId: ERROR_NO_ERROR
! 
!  MessageText:
! 
!   NO_ERROR
! 
integer, parameter, public :: ERROR_NO_ERROR = 0    ! ! dderror

! 
!  MessageId: ERROR_SUCCESS
! 
!  MessageText:
! 
!   The configuration registry database operation completed successfully.
! 
integer, parameter, public :: ERROR_SUCCESS = 0

! 
!  MessageId: ERROR_INVALID_FUNCTION
! 
!  MessageText:
! 
!   Incorrect function.
! 
integer, parameter, public :: ERROR_INVALID_FUNCTION = 1   !  ! dderror

! 
!  MessageId: ERROR_FILE_NOT_FOUND
! 
!  MessageText:
! 
!   The system cannot find the file specified.
! 
integer, parameter, public :: ERROR_FILE_NOT_FOUND = 2

! 
!  MessageId: ERROR_PATH_NOT_FOUND
! 
!  MessageText:
! 
!   The system cannot find the path specified.
! 
integer, parameter, public :: ERROR_PATH_NOT_FOUND = 3

! 
!  MessageId: ERROR_TOO_MANY_OPEN_FILES
! 
!  MessageText:
! 
!   The system cannot open the file.
! 
integer, parameter, public :: ERROR_TOO_MANY_OPEN_FILES = 4

! 
!  MessageId: ERROR_ACCESS_DENIED
! 
!  MessageText:
! 
!   Access is denied.
! 
integer, parameter, public :: ERROR_ACCESS_DENIED = 5

! 
!  MessageId: ERROR_INVALID_HANDLE
! 
!  MessageText:
! 
!   The handle is invalid.
! 
integer, parameter, public :: ERROR_INVALID_HANDLE = 6

! 
!  MessageId: ERROR_ARENA_TRASHED
! 
!  MessageText:
! 
!   The storage control blocks were destroyed.
! 
integer, parameter, public :: ERROR_ARENA_TRASHED = 7

! 
!  MessageId: ERROR_NOT_ENOUGH_MEMORY
! 
!  MessageText:
! 
!   Not enough storage is available to process this command.
! 
integer, parameter, public :: ERROR_NOT_ENOUGH_MEMORY = 8  !  ! dderror

! 
!  MessageId: ERROR_INVALID_BLOCK
! 
!  MessageText:
! 
!   The storage control block address is invalid.
! 
integer, parameter, public :: ERROR_INVALID_BLOCK = 9

! 
!  MessageId: ERROR_BAD_ENVIRONMENT
! 
!  MessageText:
! 
!   The environment is incorrect.
! 
integer, parameter, public :: ERROR_BAD_ENVIRONMENT = 10

! 
!  MessageId: ERROR_BAD_FORMAT
! 
!  MessageText:
! 
!   An attempt was made to load a program with an
!   incorrect format.
! 
integer, parameter, public :: ERROR_BAD_FORMAT = 11

! 
!  MessageId: ERROR_INVALID_ACCESS
! 
!  MessageText:
! 
!   The access code is invalid.
! 
integer, parameter, public :: ERROR_INVALID_ACCESS = 12

! 
!  MessageId: ERROR_INVALID_DATA
! 
!  MessageText:
! 
!   The data is invalid.
! 
integer, parameter, public :: ERROR_INVALID_DATA = 13

! 
!  MessageId: ERROR_OUTOFMEMORY
! 
!  MessageText:
! 
!   Not enough storage is available to complete this operation.
! 
integer, parameter, public :: ERROR_OUTOFMEMORY = 14

! 
!  MessageId: ERROR_INVALID_DRIVE
! 
!  MessageText:
! 
!   The system cannot find the drive specified.
! 
integer, parameter, public :: ERROR_INVALID_DRIVE = 15

! 
!  MessageId: ERROR_CURRENT_DIRECTORY
! 
!  MessageText:
! 
!   The directory cannot be removed.
! 
integer, parameter, public :: ERROR_CURRENT_DIRECTORY = 16

! 
!  MessageId: ERROR_NOT_SAME_DEVICE
! 
!  MessageText:
! 
!   The system cannot move the file
!   to a different disk drive.
! 
integer, parameter, public :: ERROR_NOT_SAME_DEVICE = 17

! 
!  MessageId: ERROR_NO_MORE_FILES
! 
!  MessageText:
! 
!   There are no more files.
! 
integer, parameter, public :: ERROR_NO_MORE_FILES = 18

! 
!  MessageId: ERROR_WRITE_PROTECT
! 
!  MessageText:
! 
!   The media is write protected.
! 
integer, parameter, public :: ERROR_WRITE_PROTECT = 19

! 
!  MessageId: ERROR_BAD_UNIT
! 
!  MessageText:
! 
!   The system cannot find the device specified.
! 
integer, parameter, public :: ERROR_BAD_UNIT = 20

! 
!  MessageId: ERROR_NOT_READY
! 
!  MessageText:
! 
!   The device is not ready.
! 
integer, parameter, public :: ERROR_NOT_READY = 21

! 
!  MessageId: ERROR_BAD_COMMAND
! 
!  MessageText:
! 
!   The device does not recognize the command.
! 
integer, parameter, public :: ERROR_BAD_COMMAND = 22

! 
!  MessageId: ERROR_CRC
! 
!  MessageText:
! 
!   Data error (cyclic redundancy check)
! 
integer, parameter, public :: ERROR_CRC = 23

! 
!  MessageId: ERROR_BAD_LENGTH
! 
!  MessageText:
! 
!   The program issued a command but the
!   command length is incorrect.
! 
integer, parameter, public :: ERROR_BAD_LENGTH = 24

! 
!  MessageId: ERROR_SEEK
! 
!  MessageText:
! 
!   The drive cannot locate a specific
!   area or track on the disk.
! 
integer, parameter, public :: ERROR_SEEK = 25

! 
!  MessageId: ERROR_NOT_DOS_DISK
! 
!  MessageText:
! 
!   The specified disk or diskette cannot be accessed.
! 
integer, parameter, public :: ERROR_NOT_DOS_DISK = 26

! 
!  MessageId: ERROR_SECTOR_NOT_FOUND
! 
!  MessageText:
! 
!   The drive cannot find the sector requested.
! 
integer, parameter, public :: ERROR_SECTOR_NOT_FOUND = 27

! 
!  MessageId: ERROR_OUT_OF_PAPER
! 
!  MessageText:
! 
!   The printer is out of paper.
! 
integer, parameter, public :: ERROR_OUT_OF_PAPER = 28

! 
!  MessageId: ERROR_WRITE_FAULT
! 
!  MessageText:
! 
!   The system cannot write to the specified device.
! 
integer, parameter, public :: ERROR_WRITE_FAULT = 29

! 
!  MessageId: ERROR_READ_FAULT
! 
!  MessageText:
! 
!   The system cannot read from the specified device.
! 
integer, parameter, public :: ERROR_READ_FAULT = 30

! 
!  MessageId: ERROR_GEN_FAILURE
! 
!  MessageText:
! 
!   A device attached to the system is not functioning.
! 
integer, parameter, public :: ERROR_GEN_FAILURE = 31

! 
!  MessageId: ERROR_SHARING_VIOLATION
! 
!  MessageText:
! 
!   The process cannot access the file because
!   it is being used by another process.
! 
integer, parameter, public :: ERROR_SHARING_VIOLATION = 32

! 
!  MessageId: ERROR_LOCK_VIOLATION
! 
!  MessageText:
! 
!   The process cannot access the file because
!   another process has locked a portion of the file.
! 
integer, parameter, public :: ERROR_LOCK_VIOLATION = 33

! 
!  MessageId: ERROR_WRONG_DISK
! 
!  MessageText:
! 
!   The wrong diskette is in the drive.
!   Insert %2 (Volume Serial Number: %3)
!   into drive %1.
! 
integer, parameter, public :: ERROR_WRONG_DISK = 34

! 
!  MessageId: ERROR_SHARING_BUFFER_EXCEEDED
! 
!  MessageText:
! 
!   Too many files opened for sharing.
! 
integer, parameter, public :: ERROR_SHARING_BUFFER_EXCEEDED = 36

! 
!  MessageId: ERROR_HANDLE_EOF
! 
!  MessageText:
! 
!   Reached end of file.
! 
integer, parameter, public :: ERROR_HANDLE_EOF = 38

! 
!  MessageId: ERROR_HANDLE_DISK_FULL
! 
!  MessageText:
! 
!   The disk is full.
! 
integer, parameter, public :: ERROR_HANDLE_DISK_FULL = 39

! 
!  MessageId: ERROR_NOT_SUPPORTED
! 
!  MessageText:
! 
!   The network request is not supported.
! 
integer, parameter, public :: ERROR_NOT_SUPPORTED = 50

! 
!  MessageId: ERROR_REM_NOT_LIST
! 
!  MessageText:
! 
!   The remote computer is not available.
! 
integer, parameter, public :: ERROR_REM_NOT_LIST = 51

! 
!  MessageId: ERROR_DUP_NAME
! 
!  MessageText:
! 
!   A duplicate name exists on the network.
! 
integer, parameter, public :: ERROR_DUP_NAME = 52

! 
!  MessageId: ERROR_BAD_NETPATH
! 
!  MessageText:
! 
!   The network path was not found.
! 
integer, parameter, public :: ERROR_BAD_NETPATH = 53

! 
!  MessageId: ERROR_NETWORK_BUSY
! 
!  MessageText:
! 
!   The network is busy.
! 
integer, parameter, public :: ERROR_NETWORK_BUSY = 54

! 
!  MessageId: ERROR_DEV_NOT_EXIST
! 
!  MessageText:
! 
!   The specified network resource or device is no longer
!   available.
! 
integer, parameter, public :: ERROR_DEV_NOT_EXIST = 55  !  ! dderror

! 
!  MessageId: ERROR_TOO_MANY_CMDS
! 
!  MessageText:
! 
!   The network BIOS command limit has been reached.
! 
integer, parameter, public :: ERROR_TOO_MANY_CMDS = 56

! 
!  MessageId: ERROR_ADAP_HDW_ERR
! 
!  MessageText:
! 
!   A network adapter hardware error occurred.
! 
integer, parameter, public :: ERROR_ADAP_HDW_ERR = 57

! 
!  MessageId: ERROR_BAD_NET_RESP
! 
!  MessageText:
! 
!   The specified server cannot perform the requested
!   operation.
! 
integer, parameter, public :: ERROR_BAD_NET_RESP = 58

! 
!  MessageId: ERROR_UNEXP_NET_ERR
! 
!  MessageText:
! 
!   An unexpected network error occurred.
! 
integer, parameter, public :: ERROR_UNEXP_NET_ERR = 59

! 
!  MessageId: ERROR_BAD_REM_ADAP
! 
!  MessageText:
! 
!   The remote adapter is not compatible.
! 
integer, parameter, public :: ERROR_BAD_REM_ADAP = 60

! 
!  MessageId: ERROR_PRINTQ_FULL
! 
!  MessageText:
! 
!   The printer queue is full.
! 
integer, parameter, public :: ERROR_PRINTQ_FULL = 61

! 
!  MessageId: ERROR_NO_SPOOL_SPACE
! 
!  MessageText:
! 
!   Space to store the file waiting to be printed is
!   not available on the server.
! 
integer, parameter, public :: ERROR_NO_SPOOL_SPACE = 62

! 
!  MessageId: ERROR_PRINT_CANCELLED
! 
!  MessageText:
! 
!   Your file waiting to be printed was deleted.
! 
integer, parameter, public :: ERROR_PRINT_CANCELLED = 63

! 
!  MessageId: ERROR_NETNAME_DELETED
! 
!  MessageText:
! 
!   The specified network name is no longer available.
! 
integer, parameter, public :: ERROR_NETNAME_DELETED = 64

! 
!  MessageId: ERROR_NETWORK_ACCESS_DENIED
! 
!  MessageText:
! 
!   Network access is denied.
! 
integer, parameter, public :: ERROR_NETWORK_ACCESS_DENIED = 65

! 
!  MessageId: ERROR_BAD_DEV_TYPE
! 
!  MessageText:
! 
!   The network resource type is not correct.
! 
integer, parameter, public :: ERROR_BAD_DEV_TYPE = 66

! 
!  MessageId: ERROR_BAD_NET_NAME
! 
!  MessageText:
! 
!   The network name cannot be found.
! 
integer, parameter, public :: ERROR_BAD_NET_NAME = 67

! 
!  MessageId: ERROR_TOO_MANY_NAMES
! 
!  MessageText:
! 
!   The name limit for the local computer network
!   adapter card was exceeded.
! 
integer, parameter, public :: ERROR_TOO_MANY_NAMES = 68

! 
!  MessageId: ERROR_TOO_MANY_SESS
! 
!  MessageText:
! 
!   The network BIOS session limit was exceeded.
! 
integer, parameter, public :: ERROR_TOO_MANY_SESS = 69

! 
!  MessageId: ERROR_SHARING_PAUSED
! 
!  MessageText:
! 
!   The remote server has been paused or is in the
!   process of being started.
! 
integer, parameter, public :: ERROR_SHARING_PAUSED = 70

! 
!  MessageId: ERROR_REQ_NOT_ACCEP
! 
!  MessageText:
! 
!   The network request was not accepted.
! 
integer, parameter, public :: ERROR_REQ_NOT_ACCEP = 71

! 
!  MessageId: ERROR_REDIR_PAUSED
! 
!  MessageText:
! 
!   The specified printer or disk device has been paused.
! 
integer, parameter, public :: ERROR_REDIR_PAUSED = 72

! 
!  MessageId: ERROR_FILE_EXISTS
! 
!  MessageText:
! 
!   The file exists.
! 
integer, parameter, public :: ERROR_FILE_EXISTS = 80

! 
!  MessageId: ERROR_CANNOT_MAKE
! 
!  MessageText:
! 
!   The directory or file cannot be created.
! 
integer, parameter, public :: ERROR_CANNOT_MAKE = 82

! 
!  MessageId: ERROR_FAIL_I24
! 
!  MessageText:
! 
!   Fail on INT 24
! 
integer, parameter, public :: ERROR_FAIL_I24 = 83

! 
!  MessageId: ERROR_OUT_OF_STRUCTURES
! 
!  MessageText:
! 
!   Storage to process this request is not available.
! 
integer, parameter, public :: ERROR_OUT_OF_STRUCTURES = 84

! 
!  MessageId: ERROR_ALREADY_ASSIGNED
! 
!  MessageText:
! 
!   The local device name is already in use.
! 
integer, parameter, public :: ERROR_ALREADY_ASSIGNED = 85

! 
!  MessageId: ERROR_INVALID_PASSWORD
! 
!  MessageText:
! 
!   The specified network password is not correct.
! 
integer, parameter, public :: ERROR_INVALID_PASSWORD = 86

! 
!  MessageId: ERROR_INVALID_PARAMETER
! 
!  MessageText:
! 
!   The parameter is incorrect.
! 
integer, parameter, public :: ERROR_INVALID_PARAMETER = 87  !  ! dderror

! 
!  MessageId: ERROR_NET_WRITE_FAULT
! 
!  MessageText:
! 
!   A write fault occurred on the network.
! 
integer, parameter, public :: ERROR_NET_WRITE_FAULT = 88

! 
!  MessageId: ERROR_NO_PROC_SLOTS
! 
!  MessageText:
! 
!   The system cannot start another process at
!   this time.
! 
integer, parameter, public :: ERROR_NO_PROC_SLOTS = 89

! 
!  MessageId: ERROR_TOO_MANY_SEMAPHORES
! 
!  MessageText:
! 
!   Cannot create another system semaphore.
! 
integer, parameter, public :: ERROR_TOO_MANY_SEMAPHORES = 100

! 
!  MessageId: ERROR_EXCL_SEM_ALREADY_OWNED
! 
!  MessageText:
! 
!   The exclusive semaphore is owned by another process.
! 
integer, parameter, public :: ERROR_EXCL_SEM_ALREADY_OWNED = 101

! 
!  MessageId: ERROR_SEM_IS_SET
! 
!  MessageText:
! 
!   The semaphore is set and cannot be closed.
! 
integer, parameter, public :: ERROR_SEM_IS_SET = 102

! 
!  MessageId: ERROR_TOO_MANY_SEM_REQUESTS
! 
!  MessageText:
! 
!   The semaphore cannot be set again.
! 
integer, parameter, public :: ERROR_TOO_MANY_SEM_REQUESTS = 103

! 
!  MessageId: ERROR_INVALID_AT_INTERRUPT_TIME
! 
!  MessageText:
! 
!   Cannot request exclusive semaphores at interrupt time.
! 
integer, parameter, public :: ERROR_INVALID_AT_INTERRUPT_TIME = 104

! 
!  MessageId: ERROR_SEM_OWNER_DIED
! 
!  MessageText:
! 
!   The previous ownership of this semaphore has ended.
! 
integer, parameter, public :: ERROR_SEM_OWNER_DIED = 105

! 
!  MessageId: ERROR_SEM_USER_LIMIT
! 
!  MessageText:
! 
!   Insert the diskette for drive %1.
! 
integer, parameter, public :: ERROR_SEM_USER_LIMIT = 106

! 
!  MessageId: ERROR_DISK_CHANGE
! 
!  MessageText:
! 
!   Program stopped because alternate diskette was not inserted.
! 
integer, parameter, public :: ERROR_DISK_CHANGE = 107

! 
!  MessageId: ERROR_DRIVE_LOCKED
! 
!  MessageText:
! 
!   The disk is in use or locked by
!   another process.
! 
integer, parameter, public :: ERROR_DRIVE_LOCKED = 108

! 
!  MessageId: ERROR_BROKEN_PIPE
! 
!  MessageText:
! 
!   The pipe has been ended.
! 
integer, parameter, public :: ERROR_BROKEN_PIPE = 109

! 
!  MessageId: ERROR_OPEN_FAILED
! 
!  MessageText:
! 
!   The system cannot open the
!   device or file specified.
! 
integer, parameter, public :: ERROR_OPEN_FAILED = 110

! 
!  MessageId: ERROR_BUFFER_OVERFLOW
! 
!  MessageText:
! 
!   The file name is too long.
! 
integer, parameter, public :: ERROR_BUFFER_OVERFLOW = 111

! 
!  MessageId: ERROR_DISK_FULL
! 
!  MessageText:
! 
!   There is not enough space on the disk.
! 
integer, parameter, public :: ERROR_DISK_FULL = 112

! 
!  MessageId: ERROR_NO_MORE_SEARCH_HANDLES
! 
!  MessageText:
! 
!   No more internal file identifiers available.
! 
integer, parameter, public :: ERROR_NO_MORE_SEARCH_HANDLES = 113

! 
!  MessageId: ERROR_INVALID_TARGET_HANDLE
! 
!  MessageText:
! 
!   The target internal file identifier is incorrect.
! 
integer, parameter, public :: ERROR_INVALID_TARGET_HANDLE = 114

! 
!  MessageId: ERROR_INVALID_CATEGORY
! 
!  MessageText:
! 
!   The IOCTL call made by the application program is
!   not correct.
! 
integer, parameter, public :: ERROR_INVALID_CATEGORY = 117

! 
!  MessageId: ERROR_INVALID_VERIFY_SWITCH
! 
!  MessageText:
! 
!   The verify-on-write switch parameter value is not
!   correct.
! 
integer, parameter, public :: ERROR_INVALID_VERIFY_SWITCH = 118

! 
!  MessageId: ERROR_BAD_DRIVER_LEVEL
! 
!  MessageText:
! 
!   The system does not support the command requested.
! 
integer, parameter, public :: ERROR_BAD_DRIVER_LEVEL = 119

! 
!  MessageId: ERROR_CALL_NOT_IMPLEMENTED
! 
!  MessageText:
! 
!   This function is only valid in Windows NT mode.
! 
integer, parameter, public :: ERROR_CALL_NOT_IMPLEMENTED = 120

! 
!  MessageId: ERROR_SEM_TIMEOUT
! 
!  MessageText:
! 
!   The semaphore timeout period has expired.
! 
integer, parameter, public :: ERROR_SEM_TIMEOUT = 121

! 
!  MessageId: ERROR_INSUFFICIENT_BUFFER
! 
!  MessageText:
! 
!   The data area passed to a system call is too
!   small.
! 
integer, parameter, public :: ERROR_INSUFFICIENT_BUFFER = 122  !  ! dderror

! 
!  MessageId: ERROR_INVALID_NAME
! 
!  MessageText:
! 
!   The filename, directory name, or volume label syntax is incorrect.
! 
integer, parameter, public :: ERROR_INVALID_NAME = 123

! 
!  MessageId: ERROR_INVALID_LEVEL
! 
!  MessageText:
! 
!   The system call level is not correct.
! 
integer, parameter, public :: ERROR_INVALID_LEVEL = 124

! 
!  MessageId: ERROR_NO_VOLUME_LABEL
! 
!  MessageText:
! 
!   The disk has no volume label.
! 
integer, parameter, public :: ERROR_NO_VOLUME_LABEL = 125

! 
!  MessageId: ERROR_MOD_NOT_FOUND
! 
!  MessageText:
! 
!   The specified module could not be found.
! 
integer, parameter, public :: ERROR_MOD_NOT_FOUND = 126

! 
!  MessageId: ERROR_PROC_NOT_FOUND
! 
!  MessageText:
! 
!   The specified procedure could not be found.
! 
integer, parameter, public :: ERROR_PROC_NOT_FOUND = 127

! 
!  MessageId: ERROR_WAIT_NO_CHILDREN
! 
!  MessageText:
! 
!   There are no child processes to wait for.
! 
integer, parameter, public :: ERROR_WAIT_NO_CHILDREN = 128

! 
!  MessageId: ERROR_CHILD_NOT_COMPLETE
! 
!  MessageText:
! 
!   The %1 application cannot be run in Windows NT mode.
! 
integer, parameter, public :: ERROR_CHILD_NOT_COMPLETE = 129

! 
!  MessageId: ERROR_DIRECT_ACCESS_HANDLE
! 
!  MessageText:
! 
!   Attempt to use a file handle to an open disk partition for an
!   operation other than raw disk I/O.
! 
integer, parameter, public :: ERROR_DIRECT_ACCESS_HANDLE = 130

! 
!  MessageId: ERROR_NEGATIVE_SEEK
! 
!  MessageText:
! 
!   An attempt was made to move the file pointer before the beginning of the file.
! 
integer, parameter, public :: ERROR_NEGATIVE_SEEK = 131

! 
!  MessageId: ERROR_SEEK_ON_DEVICE
! 
!  MessageText:
! 
!   The file pointer cannot be set on the specified device or file.
! 
integer, parameter, public :: ERROR_SEEK_ON_DEVICE = 132

! 
!  MessageId: ERROR_IS_JOIN_TARGET
! 
!  MessageText:
! 
!   A JOIN or SUBST command
!   cannot be used for a drive that
!   contains previously joined drives.
! 
integer, parameter, public :: ERROR_IS_JOIN_TARGET = 133

! 
!  MessageId: ERROR_IS_JOINED
! 
!  MessageText:
! 
!   An attempt was made to use a
!   JOIN or SUBST command on a drive that has
!   already been joined.
! 
integer, parameter, public :: ERROR_IS_JOINED = 134

! 
!  MessageId: ERROR_IS_SUBSTED
! 
!  MessageText:
! 
!   An attempt was made to use a
!   JOIN or SUBST command on a drive that has
!   already been substituted.
! 
integer, parameter, public :: ERROR_IS_SUBSTED = 135

! 
!  MessageId: ERROR_NOT_JOINED
! 
!  MessageText:
! 
!   The system tried to delete
!   the JOIN of a drive that is not joined.
! 
integer, parameter, public :: ERROR_NOT_JOINED = 136

! 
!  MessageId: ERROR_NOT_SUBSTED
! 
!  MessageText:
! 
!   The system tried to delete the
!   substitution of a drive that is not substituted.
! 
integer, parameter, public :: ERROR_NOT_SUBSTED = 137

! 
!  MessageId: ERROR_JOIN_TO_JOIN
! 
!  MessageText:
! 
!   The system tried to join a drive
!   to a directory on a joined drive.
! 
integer, parameter, public :: ERROR_JOIN_TO_JOIN = 138

! 
!  MessageId: ERROR_SUBST_TO_SUBST
! 
!  MessageText:
! 
!   The system tried to substitute a
!   drive to a directory on a substituted drive.
! 
integer, parameter, public :: ERROR_SUBST_TO_SUBST = 139

! 
!  MessageId: ERROR_JOIN_TO_SUBST
! 
!  MessageText:
! 
!   The system tried to join a drive to
!   a directory on a substituted drive.
! 
integer, parameter, public :: ERROR_JOIN_TO_SUBST = 140

! 
!  MessageId: ERROR_SUBST_TO_JOIN
! 
!  MessageText:
! 
!   The system tried to SUBST a drive
!   to a directory on a joined drive.
! 
integer, parameter, public :: ERROR_SUBST_TO_JOIN = 141

! 
!  MessageId: ERROR_BUSY_DRIVE
! 
!  MessageText:
! 
!   The system cannot perform a JOIN or SUBST at this time.
! 
integer, parameter, public :: ERROR_BUSY_DRIVE = 142

! 
!  MessageId: ERROR_SAME_DRIVE
! 
!  MessageText:
! 
!   The system cannot join or substitute a
!   drive to or for a directory on the same drive.
! 
integer, parameter, public :: ERROR_SAME_DRIVE = 143

! 
!  MessageId: ERROR_DIR_NOT_ROOT
! 
!  MessageText:
! 
!   The directory is not a subdirectory of the root directory.
! 
integer, parameter, public :: ERROR_DIR_NOT_ROOT = 144

! 
!  MessageId: ERROR_DIR_NOT_EMPTY
! 
!  MessageText:
! 
!   The directory is not empty.
! 
integer, parameter, public :: ERROR_DIR_NOT_EMPTY = 145

! 
!  MessageId: ERROR_IS_SUBST_PATH
! 
!  MessageText:
! 
!   The path specified is being used in
!   a substitute.
! 
integer, parameter, public :: ERROR_IS_SUBST_PATH = 146

! 
!  MessageId: ERROR_IS_JOIN_PATH
! 
!  MessageText:
! 
!   Not enough resources are available to
!   process this command.
! 
integer, parameter, public :: ERROR_IS_JOIN_PATH = 147

! 
!  MessageId: ERROR_PATH_BUSY
! 
!  MessageText:
! 
!   The path specified cannot be used at this time.
! 
integer, parameter, public :: ERROR_PATH_BUSY = 148

! 
!  MessageId: ERROR_IS_SUBST_TARGET
! 
!  MessageText:
! 
!   An attempt was made to join
!   or substitute a drive for which a directory
!   on the drive is the target of a previous
!   substitute.
! 
integer, parameter, public :: ERROR_IS_SUBST_TARGET = 149

! 
!  MessageId: ERROR_SYSTEM_TRACE
! 
!  MessageText:
! 
!   System trace information was not specified in your
!   CONFIG.SYS file, or tracing is disallowed.
! 
integer, parameter, public :: ERROR_SYSTEM_TRACE = 150

! 
!  MessageId: ERROR_INVALID_EVENT_COUNT
! 
!  MessageText:
! 
!   The number of specified semaphore events for
!   DosMuxSemWait is not correct.
! 
integer, parameter, public :: ERROR_INVALID_EVENT_COUNT = 151

! 
!  MessageId: ERROR_TOO_MANY_MUXWAITERS
! 
!  MessageText:
! 
!   DosMuxSemWait did not execute; too many semaphores
!   are already set.
! 
integer, parameter, public :: ERROR_TOO_MANY_MUXWAITERS = 152

! 
!  MessageId: ERROR_INVALID_LIST_FORMAT
! 
!  MessageText:
! 
!   The DosMuxSemWait list is not correct.
! 
integer, parameter, public :: ERROR_INVALID_LIST_FORMAT = 153

! 
!  MessageId: ERROR_LABEL_TOO_LONG
! 
!  MessageText:
! 
!   The volume label you entered exceeds the
!   11 character limit.  The first 11 characters were written
!   to disk.  Any characters that exceeded the 11 character limit
!   were automatically deleted.
! 
integer, parameter, public :: ERROR_LABEL_TOO_LONG = 154

! 
!  MessageId: ERROR_TOO_MANY_TCBS
! 
!  MessageText:
! 
!   Cannot create another thread.
! 
integer, parameter, public :: ERROR_TOO_MANY_TCBS = 155

! 
!  MessageId: ERROR_SIGNAL_REFUSED
! 
!  MessageText:
! 
!   The recipient process has refused the signal.
! 
integer, parameter, public :: ERROR_SIGNAL_REFUSED = 156

! 
!  MessageId: ERROR_DISCARDED
! 
!  MessageText:
! 
!   The segment is already discarded and cannot be locked.
! 
integer, parameter, public :: ERROR_DISCARDED = 157

! 
!  MessageId: ERROR_NOT_LOCKED
! 
!  MessageText:
! 
!   The segment is already unlocked.
! 
integer, parameter, public :: ERROR_NOT_LOCKED = 158

! 
!  MessageId: ERROR_BAD_THREADID_ADDR
! 
!  MessageText:
! 
!   The address for the thread ID is not correct.
! 
integer, parameter, public :: ERROR_BAD_THREADID_ADDR = 159

! 
!  MessageId: ERROR_BAD_ARGUMENTS
! 
!  MessageText:
! 
!   The argument string passed to DosExecPgm is not correct.
! 
integer, parameter, public :: ERROR_BAD_ARGUMENTS = 160

! 
!  MessageId: ERROR_BAD_PATHNAME
! 
!  MessageText:
! 
!   The specified path is invalid.
! 
integer, parameter, public :: ERROR_BAD_PATHNAME = 161

! 
!  MessageId: ERROR_SIGNAL_PENDING
! 
!  MessageText:
! 
!   A signal is already pending.
! 
integer, parameter, public :: ERROR_SIGNAL_PENDING = 162

! 
!  MessageId: ERROR_MAX_THRDS_REACHED
! 
!  MessageText:
! 
!   No more threads can be created in the system.
! 
integer, parameter, public :: ERROR_MAX_THRDS_REACHED = 164

! 
!  MessageId: ERROR_LOCK_FAILED
! 
!  MessageText:
! 
!   Unable to lock a region of a file.
! 
integer, parameter, public :: ERROR_LOCK_FAILED = 167

! 
!  MessageId: ERROR_BUSY
! 
!  MessageText:
! 
!   The requested resource is in use.
! 
integer, parameter, public :: ERROR_BUSY = 170

! 
!  MessageId: ERROR_CANCEL_VIOLATION
! 
!  MessageText:
! 
!   A lock request was not outstanding for the supplied cancel region.
! 
integer, parameter, public :: ERROR_CANCEL_VIOLATION = 173

! 
!  MessageId: ERROR_ATOMIC_LOCKS_NOT_SUPPORTED
! 
!  MessageText:
! 
!   The file system does not support atomic changes to the lock type.
! 
integer, parameter, public :: ERROR_ATOMIC_LOCKS_NOT_SUPPORTED = 174

! 
!  MessageId: ERROR_INVALID_SEGMENT_NUMBER
! 
!  MessageText:
! 
!   The system detected a segment number that was not correct.
! 
integer, parameter, public :: ERROR_INVALID_SEGMENT_NUMBER = 180

! 
!  MessageId: ERROR_INVALID_ORDINAL
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_INVALID_ORDINAL = 182

! 
!  MessageId: ERROR_ALREADY_EXISTS
! 
!  MessageText:
! 
!   Cannot create a file when that file already exists.
! 
integer, parameter, public :: ERROR_ALREADY_EXISTS = 183

! 
!  MessageId: ERROR_INVALID_FLAG_NUMBER
! 
!  MessageText:
! 
!   The flag passed is not correct.
! 
integer, parameter, public :: ERROR_INVALID_FLAG_NUMBER = 186

! 
!  MessageId: ERROR_SEM_NOT_FOUND
! 
!  MessageText:
! 
!   The specified system semaphore name was not found.
! 
integer, parameter, public :: ERROR_SEM_NOT_FOUND = 187

! 
!  MessageId: ERROR_INVALID_STARTING_CODESEG
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_INVALID_STARTING_CODESEG = 188

! 
!  MessageId: ERROR_INVALID_STACKSEG
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_INVALID_STACKSEG = 189

! 
!  MessageId: ERROR_INVALID_MODULETYPE
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_INVALID_MODULETYPE = 190

! 
!  MessageId: ERROR_INVALID_EXE_SIGNATURE
! 
!  MessageText:
! 
!   Cannot run %1 in Windows NT mode.
! 
integer, parameter, public :: ERROR_INVALID_EXE_SIGNATURE = 191

! 
!  MessageId: ERROR_EXE_MARKED_INVALID
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_EXE_MARKED_INVALID = 192

! 
!  MessageId: ERROR_BAD_EXE_FORMAT
! 
!  MessageText:
! 
!   %1 is not a valid Windows NT application.
! 
integer, parameter, public :: ERROR_BAD_EXE_FORMAT = 193

! 
!  MessageId: ERROR_ITERATED_DATA_EXCEEDS_64k
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_ITERATED_DATA_EXCEEDS_64k = 194

! 
!  MessageId: ERROR_INVALID_MINALLOCSIZE
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_INVALID_MINALLOCSIZE = 195

! 
!  MessageId: ERROR_DYNLINK_FROM_INVALID_RING
! 
!  MessageText:
! 
!   The operating system cannot run this
!   application program.
! 
integer, parameter, public :: ERROR_DYNLINK_FROM_INVALID_RING = 196

! 
!  MessageId: ERROR_IOPL_NOT_ENABLED
! 
!  MessageText:
! 
!   The operating system is not presently
!   configured to run this application.
! 
integer, parameter, public :: ERROR_IOPL_NOT_ENABLED = 197

! 
!  MessageId: ERROR_INVALID_SEGDPL
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_INVALID_SEGDPL = 198

! 
!  MessageId: ERROR_AUTODATASEG_EXCEEDS_64k
! 
!  MessageText:
! 
!   The operating system cannot run this
!   application program.
! 
integer, parameter, public :: ERROR_AUTODATASEG_EXCEEDS_64k = 199

! 
!  MessageId: ERROR_RING2SEG_MUST_BE_MOVABLE
! 
!  MessageText:
! 
!   The code segment cannot be greater than or equal to 64KB.
! 
integer, parameter, public :: ERROR_RING2SEG_MUST_BE_MOVABLE = 200

! 
!  MessageId: ERROR_RELOC_CHAIN_XEEDS_SEGLIM
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_RELOC_CHAIN_XEEDS_SEGLIM = 201

! 
!  MessageId: ERROR_INFLOOP_IN_RELOC_CHAIN
! 
!  MessageText:
! 
!   The operating system cannot run %1.
! 
integer, parameter, public :: ERROR_INFLOOP_IN_RELOC_CHAIN = 202

! 
!  MessageId: ERROR_ENVVAR_NOT_FOUND
! 
!  MessageText:
! 
!   The system could not find the environment
!   option that was entered.
! 
integer, parameter, public :: ERROR_ENVVAR_NOT_FOUND = 203

! 
!  MessageId: ERROR_NO_SIGNAL_SENT
! 
!  MessageText:
! 
!   No process in the command subtree has a
!   signal handler.
! 
integer, parameter, public :: ERROR_NO_SIGNAL_SENT = 205

! 
!  MessageId: ERROR_FILENAME_EXCED_RANGE
! 
!  MessageText:
! 
!   The filename or extension is too long.
! 
integer, parameter, public :: ERROR_FILENAME_EXCED_RANGE = 206

! 
!  MessageId: ERROR_RING2_STACK_IN_USE
! 
!  MessageText:
! 
!   The ring 2 stack is in use.
! 
integer, parameter, public :: ERROR_RING2_STACK_IN_USE = 207

! 
!  MessageId: ERROR_META_EXPANSION_TOO_LONG
! 
!  MessageText:
! 
!   The global filename characters, * or ?, are entered
!   incorrectly or too many global filename characters are specified.
! 
integer, parameter, public :: ERROR_META_EXPANSION_TOO_LONG = 208

! 
!  MessageId: ERROR_INVALID_SIGNAL_NUMBER
! 
!  MessageText:
! 
!   The signal being posted is not correct.
! 
integer, parameter, public :: ERROR_INVALID_SIGNAL_NUMBER = 209

! 
!  MessageId: ERROR_THREAD_1_INACTIVE
! 
!  MessageText:
! 
!   The signal handler cannot be set.
! 
integer, parameter, public :: ERROR_THREAD_1_INACTIVE = 210

! 
!  MessageId: ERROR_LOCKED
! 
!  MessageText:
! 
!   The segment is locked and cannot be reallocated.
! 
integer, parameter, public :: ERROR_LOCKED = 212

! 
!  MessageId: ERROR_TOO_MANY_MODULES
! 
!  MessageText:
! 
!   Too many dynamic link modules are attached to this
!   program or dynamic link module.
! 
integer, parameter, public :: ERROR_TOO_MANY_MODULES = 214

! 
!  MessageId: ERROR_NESTING_NOT_ALLOWED
! 
!  MessageText:
! 
!   Can't nest calls to LoadModule.
! 
integer, parameter, public :: ERROR_NESTING_NOT_ALLOWED = 215

! 
!  MessageId: ERROR_BAD_PIPE
! 
!  MessageText:
! 
!   The pipe state is invalid.
! 
integer, parameter, public :: ERROR_BAD_PIPE = 230

! 
!  MessageId: ERROR_PIPE_BUSY
! 
!  MessageText:
! 
!   All pipe instances are busy.
! 
integer, parameter, public :: ERROR_PIPE_BUSY = 231

! 
!  MessageId: ERROR_NO_DATA
! 
!  MessageText:
! 
!   The pipe is being closed.
! 
integer, parameter, public :: ERROR_NO_DATA = 232

! 
!  MessageId: ERROR_PIPE_NOT_CONNECTED
! 
!  MessageText:
! 
!   No process is on the other end of the pipe.
! 
integer, parameter, public :: ERROR_PIPE_NOT_CONNECTED = 233

! 
!  MessageId: ERROR_MORE_DATA
! 
!  MessageText:
! 
!   More data is available.
! 
integer, parameter, public :: ERROR_MORE_DATA = 234   ! ! dderror

! 
!  MessageId: ERROR_VC_DISCONNECTED
! 
!  MessageText:
! 
!   The session was cancelled.
! 
integer, parameter, public :: ERROR_VC_DISCONNECTED = 240

! 
!  MessageId: ERROR_INVALID_EA_NAME
! 
!  MessageText:
! 
!   The specified extended attribute name was invalid.
! 
integer, parameter, public :: ERROR_INVALID_EA_NAME = 254

! 
!  MessageId: ERROR_EA_LIST_INCONSISTENT
! 
!  MessageText:
! 
!   The extended attributes are inconsistent.
! 
integer, parameter, public :: ERROR_EA_LIST_INCONSISTENT = 255

! 
!  MessageId: ERROR_NO_MORE_ITEMS
! 
!  MessageText:
! 
!   No more data is available.
! 
integer, parameter, public :: ERROR_NO_MORE_ITEMS = 259

! 
!  MessageId: ERROR_CANNOT_COPY
! 
!  MessageText:
! 
!   The Copy API cannot be used.
! 
integer, parameter, public :: ERROR_CANNOT_COPY = 266

! 
!  MessageId: ERROR_DIRECTORY
! 
!  MessageText:
! 
!   The directory name is invalid.
! 
integer, parameter, public :: ERROR_DIRECTORY = 267

! 
!  MessageId: ERROR_EAS_DIDNT_FIT
! 
!  MessageText:
! 
!   The extended attributes did not fit in the buffer.
! 
integer, parameter, public :: ERROR_EAS_DIDNT_FIT = 275

! 
!  MessageId: ERROR_EA_FILE_CORRUPT
! 
!  MessageText:
! 
!   The extended attribute file on the mounted file system is corrupt.
! 
integer, parameter, public :: ERROR_EA_FILE_CORRUPT = 276

! 
!  MessageId: ERROR_EA_TABLE_FULL
! 
!  MessageText:
! 
!   The extended attribute table file is full.
! 
integer, parameter, public :: ERROR_EA_TABLE_FULL = 277

! 
!  MessageId: ERROR_INVALID_EA_HANDLE
! 
!  MessageText:
! 
!   The specified extended attribute handle is invalid.
! 
integer, parameter, public :: ERROR_INVALID_EA_HANDLE = 278

! 
!  MessageId: ERROR_EAS_NOT_SUPPORTED
! 
!  MessageText:
! 
!   The mounted file system does not support extended attributes.
! 
integer, parameter, public :: ERROR_EAS_NOT_SUPPORTED = 282

! 
!  MessageId: ERROR_NOT_OWNER
! 
!  MessageText:
! 
!   Attempt to release mutex not owned by caller.
! 
integer, parameter, public :: ERROR_NOT_OWNER = 288

! 
!  MessageId: ERROR_TOO_MANY_POSTS
! 
!  MessageText:
! 
!   Too many posts were made to a semaphore.
! 
integer, parameter, public :: ERROR_TOO_MANY_POSTS = 298

! 
!  MessageId: ERROR_MR_MID_NOT_FOUND
! 
!  MessageText:
! 
!   The system cannot find message for message number #%1
!   in message file for %2.
! 
integer, parameter, public :: ERROR_MR_MID_NOT_FOUND = 317

! 
!  MessageId: ERROR_INVALID_ADDRESS
! 
!  MessageText:
! 
!   Attempt to access invalid address.
! 
integer, parameter, public :: ERROR_INVALID_ADDRESS = 487

! 
!  MessageId: ERROR_ARITHMETIC_OVERFLOW
! 
!  MessageText:
! 
!   Arithmetic result exceeded 32 bits.
! 
integer, parameter, public :: ERROR_ARITHMETIC_OVERFLOW = 534

! 
!  MessageId: ERROR_PIPE_CONNECTED
! 
!  MessageText:
! 
!   There is a process on other end of the pipe.
! 
integer, parameter, public :: ERROR_PIPE_CONNECTED = 535

! 
!  MessageId: ERROR_PIPE_LISTENING
! 
!  MessageText:
! 
!   Waiting for a process to open the other end of the pipe.
! 
integer, parameter, public :: ERROR_PIPE_LISTENING = 536

! 
!  MessageId: ERROR_EA_ACCESS_DENIED
! 
!  MessageText:
! 
!   Access to the extended attribute was denied.
! 
integer, parameter, public :: ERROR_EA_ACCESS_DENIED = 994

! 
!  MessageId: ERROR_OPERATION_ABORTED
! 
!  MessageText:
! 
!   The I/O operation has been aborted because of either a thread exit
!   or an application request.
! 
integer, parameter, public :: ERROR_OPERATION_ABORTED = 995

! 
!  MessageId: ERROR_IO_INCOMPLETE
! 
!  MessageText:
! 
!   Overlapped I/O event is not in a signalled state.
! 
integer, parameter, public :: ERROR_IO_INCOMPLETE = 996

! 
!  MessageId: ERROR_IO_PENDING
! 
!  MessageText:
! 
!   Overlapped I/O operation is in progress.
! 
integer, parameter, public :: ERROR_IO_PENDING = 997  !  ! dderror

! 
!  MessageId: ERROR_NOACCESS
! 
!  MessageText:
! 
!   Invalid access to memory location.
! 
integer, parameter, public :: ERROR_NOACCESS = 998

! 
!  MessageId: ERROR_SWAPERROR
! 
!  MessageText:
! 
!   Error performing inpage operation.
! 
integer, parameter, public :: ERROR_SWAPERROR = 999

! 
!  MessageId: ERROR_STACK_OVERFLOW
! 
!  MessageText:
! 
!   Recursion too deep, stack overflowed.
! 
integer, parameter, public :: ERROR_STACK_OVERFLOW = 1001

! 
!  MessageId: ERROR_INVALID_MESSAGE
! 
!  MessageText:
! 
!   The window cannot act on the sent message.
! 
integer, parameter, public :: ERROR_INVALID_MESSAGE = 1002

! 
!  MessageId: ERROR_CAN_NOT_COMPLETE
! 
!  MessageText:
! 
!   Cannot complete this function.
! 
integer, parameter, public :: ERROR_CAN_NOT_COMPLETE = 1003

! 
!  MessageId: ERROR_INVALID_FLAGS
! 
!  MessageText:
! 
!   Invalid flags.
! 
integer, parameter, public :: ERROR_INVALID_FLAGS = 1004

! 
!  MessageId: ERROR_UNRECOGNIZED_VOLUME
! 
!  MessageText:
! 
!   The volume does not contain a recognized file system.
!   Please make sure that all required file system drivers are loaded and that the
!   volume is not corrupt.
! 
integer, parameter, public :: ERROR_UNRECOGNIZED_VOLUME = 1005

! 
!  MessageId: ERROR_FILE_INVALID
! 
!  MessageText:
! 
!   The volume for a file has been externally altered such that the
!   opened file is no longer valid.
! 
integer, parameter, public :: ERROR_FILE_INVALID = 1006

! 
!  MessageId: ERROR_FULLSCREEN_MODE
! 
!  MessageText:
! 
!   The requested operation cannot be performed in full-screen mode.
! 
integer, parameter, public :: ERROR_FULLSCREEN_MODE = 1007

! 
!  MessageId: ERROR_NO_TOKEN
! 
!  MessageText:
! 
!   An attempt was made to reference a token that does not exist.
! 
integer, parameter, public :: ERROR_NO_TOKEN = 1008

! 
!  MessageId: ERROR_BADDB
! 
!  MessageText:
! 
!   The configuration registry database is corrupt.
! 
integer, parameter, public :: ERROR_BADDB = 1009

! 
!  MessageId: ERROR_BADKEY
! 
!  MessageText:
! 
!   The configuration registry key is invalid.
! 
integer, parameter, public :: ERROR_BADKEY = 1010

! 
!  MessageId: ERROR_CANTOPEN
! 
!  MessageText:
! 
!   The configuration registry key could not be opened.
! 
integer, parameter, public :: ERROR_CANTOPEN = 1011

! 
!  MessageId: ERROR_CANTREAD
! 
!  MessageText:
! 
!   The configuration registry key could not be read.
! 
integer, parameter, public :: ERROR_CANTREAD = 1012

! 
!  MessageId: ERROR_CANTWRITE
! 
!  MessageText:
! 
!   The configuration registry key could not be written.
! 
integer, parameter, public :: ERROR_CANTWRITE = 1013

! 
!  MessageId: ERROR_REGISTRY_RECOVERED
! 
!  MessageText:
! 
!   One of the files in the Registry database had to be recovered
!   by use of a log or alternate copy.  The recovery was successful.
! 
integer, parameter, public :: ERROR_REGISTRY_RECOVERED = 1014

! 
!  MessageId: ERROR_REGISTRY_CORRUPT
! 
!  MessageText:
! 
!   The Registry is corrupt. The structure of one of the files that contains
!   Registry data is corrupt, or the system's image of the file in memory
!   is corrupt, or the file could not be recovered because the alternate
!   copy or log was absent or corrupt.
! 
integer, parameter, public :: ERROR_REGISTRY_CORRUPT = 1015

! 
!  MessageId: ERROR_REGISTRY_IO_FAILED
! 
!  MessageText:
! 
!   An I/O operation initiated by the Registry failed unrecoverably.
!   The Registry could not read in, or write out, or flush, one of the files
!   that contain the system's image of the Registry.
! 
integer, parameter, public :: ERROR_REGISTRY_IO_FAILED = 1016

! 
!  MessageId: ERROR_NOT_REGISTRY_FILE
! 
!  MessageText:
! 
!   The system has attempted to load or restore a file into the Registry, but the
!   specified file is not in a Registry file format.
! 
integer, parameter, public :: ERROR_NOT_REGISTRY_FILE = 1017

! 
!  MessageId: ERROR_KEY_DELETED
! 
!  MessageText:
! 
!   Illegal operation attempted on a Registry key which has been marked for deletion.
! 
integer, parameter, public :: ERROR_KEY_DELETED = 1018

! 
!  MessageId: ERROR_NO_LOG_SPACE
! 
!  MessageText:
! 
!   System could not allocate the required space in a Registry log.
! 
integer, parameter, public :: ERROR_NO_LOG_SPACE = 1019

! 
!  MessageId: ERROR_KEY_HAS_CHILDREN
! 
!  MessageText:
! 
!   Cannot create a symbolic link in a Registry key that already
!   has subkeys or values.
! 
integer, parameter, public :: ERROR_KEY_HAS_CHILDREN = 1020

! 
!  MessageId: ERROR_CHILD_MUST_BE_VOLATILE
! 
!  MessageText:
! 
!   Cannot create a stable subkey under a volatile parent key.
! 
integer, parameter, public :: ERROR_CHILD_MUST_BE_VOLATILE = 1021

! 
!  MessageId: ERROR_NOTIFY_ENUM_DIR
! 
!  MessageText:
! 
!   A notify change request is being completed and the information
!   is not being returned in the caller's buffer. The caller now
!   needs to enumerate the files to find the changes.
! 
integer, parameter, public :: ERROR_NOTIFY_ENUM_DIR = 1022

! 
!  MessageId: ERROR_DEPENDENT_SERVICES_RUNNING
! 
!  MessageText:
! 
!   A stop control has been sent to a service which other running services
!   are dependent on.
! 
integer, parameter, public :: ERROR_DEPENDENT_SERVICES_RUNNING = 1051

! 
!  MessageId: ERROR_INVALID_SERVICE_CONTROL
! 
!  MessageText:
! 
!   The requested control is not valid for this service
! 
integer, parameter, public :: ERROR_INVALID_SERVICE_CONTROL = 1052

! 
!  MessageId: ERROR_SERVICE_REQUEST_TIMEOUT
! 
!  MessageText:
! 
!   The service did not respond to the start or control request in a timely
!   fashion.
! 
integer, parameter, public :: ERROR_SERVICE_REQUEST_TIMEOUT = 1053

! 
!  MessageId: ERROR_SERVICE_NO_THREAD
! 
!  MessageText:
! 
!   A thread could not be created for the service.
! 
integer, parameter, public :: ERROR_SERVICE_NO_THREAD = 1054

! 
!  MessageId: ERROR_SERVICE_DATABASE_LOCKED
! 
!  MessageText:
! 
!   The service database is locked.
! 
integer, parameter, public :: ERROR_SERVICE_DATABASE_LOCKED = 1055

! 
!  MessageId: ERROR_SERVICE_ALREADY_RUNNING
! 
!  MessageText:
! 
!   An instance of the service is already running.
! 
integer, parameter, public :: ERROR_SERVICE_ALREADY_RUNNING = 1056

! 
!  MessageId: ERROR_INVALID_SERVICE_ACCOUNT
! 
!  MessageText:
! 
!   The account name is invalid or does not exist.
! 
integer, parameter, public :: ERROR_INVALID_SERVICE_ACCOUNT = 1057

! 
!  MessageId: ERROR_SERVICE_DISABLED
! 
!  MessageText:
! 
!   The specified service is disabled and cannot be started.
! 
integer, parameter, public :: ERROR_SERVICE_DISABLED = 1058

! 
!  MessageId: ERROR_CIRCULAR_DEPENDENCY
! 
!  MessageText:
! 
!   Circular service dependency was specified.
! 
integer, parameter, public :: ERROR_CIRCULAR_DEPENDENCY = 1059

! 
!  MessageId: ERROR_SERVICE_DOES_NOT_EXIST
! 
!  MessageText:
! 
!   The specified service does not exist as an installed service.
! 
integer, parameter, public :: ERROR_SERVICE_DOES_NOT_EXIST = 1060

! 
!  MessageId: ERROR_SERVICE_CANNOT_ACCEPT_CTRL
! 
!  MessageText:
! 
!   The service cannot accept control messages at this time.
! 
integer, parameter, public :: ERROR_SERVICE_CANNOT_ACCEPT_CTRL = 1061

! 
!  MessageId: ERROR_SERVICE_NOT_ACTIVE
! 
!  MessageText:
! 
!   The service has not been started.
! 
integer, parameter, public :: ERROR_SERVICE_NOT_ACTIVE = 1062

! 
!  MessageId: ERROR_FAILED_SERVICE_CONTROLLER_CONNECT
! 
!  MessageText:
! 
!   The service process could not connect to the service controller.
! 
integer, parameter, public :: ERROR_FAILED_SERVICE_CNTLR_CONNECT = 1063

! 
!  MessageId: ERROR_EXCEPTION_IN_SERVICE
! 
!  MessageText:
! 
!   An exception occurred in the service when handling the control request.
! 
integer, parameter, public :: ERROR_EXCEPTION_IN_SERVICE = 1064

! 
!  MessageId: ERROR_DATABASE_DOES_NOT_EXIST
! 
!  MessageText:
! 
!   The database specified does not exist.
! 
integer, parameter, public :: ERROR_DATABASE_DOES_NOT_EXIST = 1065

! 
!  MessageId: ERROR_SERVICE_SPECIFIC_ERROR
! 
!  MessageText:
! 
!   The service has returned a service-specific error code.
! 
integer, parameter, public :: ERROR_SERVICE_SPECIFIC_ERROR = 1066

! 
!  MessageId: ERROR_PROCESS_ABORTED
! 
!  MessageText:
! 
!   The process terminated unexpectedly.
! 
integer, parameter, public :: ERROR_PROCESS_ABORTED = 1067

! 
!  MessageId: ERROR_SERVICE_DEPENDENCY_FAIL
! 
!  MessageText:
! 
!   The dependency service or group failed to start.
! 
integer, parameter, public :: ERROR_SERVICE_DEPENDENCY_FAIL = 1068

! 
!  MessageId: ERROR_SERVICE_LOGON_FAILED
! 
!  MessageText:
! 
!   The service did not start due to a logon failure.
! 
integer, parameter, public :: ERROR_SERVICE_LOGON_FAILED = 1069

! 
!  MessageId: ERROR_SERVICE_START_HANG
! 
!  MessageText:
! 
!   After starting, the service hung in a start-pending state.
! 
integer, parameter, public :: ERROR_SERVICE_START_HANG = 1070

! 
!  MessageId: ERROR_INVALID_SERVICE_LOCK
! 
!  MessageText:
! 
!   The specified service database lock is invalid.
! 
integer, parameter, public :: ERROR_INVALID_SERVICE_LOCK = 1071

! 
!  MessageId: ERROR_SERVICE_MARKED_FOR_DELETE
! 
!  MessageText:
! 
!   The specified service has been marked for deletion.
! 
integer, parameter, public :: ERROR_SERVICE_MARKED_FOR_DELETE = 1072

! 
!  MessageId: ERROR_SERVICE_EXISTS
! 
!  MessageText:
! 
!   The specified service already exists.
! 
integer, parameter, public :: ERROR_SERVICE_EXISTS = 1073

! 
!  MessageId: ERROR_ALREADY_RUNNING_LKG
! 
!  MessageText:
! 
!   The system is currently running with the last-known-good configuration.
! 
integer, parameter, public :: ERROR_ALREADY_RUNNING_LKG = 1074

! 
!  MessageId: ERROR_SERVICE_DEPENDENCY_DELETED
! 
!  MessageText:
! 
!   The dependency service does not exist or has been marked for
!   deletion.
! 
integer, parameter, public :: ERROR_SERVICE_DEPENDENCY_DELETED = 1075

! 
!  MessageId: ERROR_BOOT_ALREADY_ACCEPTED
! 
!  MessageText:
! 
!   The current boot has already been accepted for use as the
!   last-known-good control set.
! 
integer, parameter, public :: ERROR_BOOT_ALREADY_ACCEPTED = 1076

! 
!  MessageId: ERROR_SERVICE_NEVER_STARTED
! 
!  MessageText:
! 
!   No attempts to start the service have been made since the last boot.
! 
integer, parameter, public :: ERROR_SERVICE_NEVER_STARTED = 1077

! 
!  MessageId: ERROR_DUPLICATE_SERVICE_NAME
! 
!  MessageText:
! 
!   The name is already in use as either a service name or a service display
!   name.
! 
integer, parameter, public :: ERROR_DUPLICATE_SERVICE_NAME = 1078

! 
!  MessageId: ERROR_END_OF_MEDIA
! 
!  MessageText:
! 
!   The physical end of the tape has been reached.
! 
integer, parameter, public :: ERROR_END_OF_MEDIA = 1100

! 
!  MessageId: ERROR_FILEMARK_DETECTED
! 
!  MessageText:
! 
!   A tape access reached a filemark.
! 
integer, parameter, public :: ERROR_FILEMARK_DETECTED = 1101

! 
!  MessageId: ERROR_BEGINNING_OF_MEDIA
! 
!  MessageText:
! 
!   Beginning of tape or partition was encountered.
! 
integer, parameter, public :: ERROR_BEGINNING_OF_MEDIA = 1102

! 
!  MessageId: ERROR_SETMARK_DETECTED
! 
!  MessageText:
! 
!   A tape access reached the end of a set of files.
! 
integer, parameter, public :: ERROR_SETMARK_DETECTED = 1103

! 
!  MessageId: ERROR_NO_DATA_DETECTED
! 
!  MessageText:
! 
!   No more data is on the tape.
! 
integer, parameter, public :: ERROR_NO_DATA_DETECTED = 1104

! 
!  MessageId: ERROR_PARTITION_FAILURE
! 
!  MessageText:
! 
!   Tape could not be partitioned.
! 
integer, parameter, public :: ERROR_PARTITION_FAILURE = 1105

! 
!  MessageId: ERROR_INVALID_BLOCK_LENGTH
! 
!  MessageText:
! 
!   When accessing a new tape of a multivolume partition, the current
!   blocksize is incorrect.
! 
integer, parameter, public :: ERROR_INVALID_BLOCK_LENGTH = 1106

! 
!  MessageId: ERROR_DEVICE_NOT_PARTITIONED
! 
!  MessageText:
! 
!   Tape partition information could not be found when loading a tape.
! 
integer, parameter, public :: ERROR_DEVICE_NOT_PARTITIONED = 1107

! 
!  MessageId: ERROR_UNABLE_TO_LOCK_MEDIA
! 
!  MessageText:
! 
!   Unable to lock the media eject mechanism.
! 
integer, parameter, public :: ERROR_UNABLE_TO_LOCK_MEDIA = 1108

! 
!  MessageId: ERROR_UNABLE_TO_UNLOAD_MEDIA
! 
!  MessageText:
! 
!   Unable to unload the media.
! 
integer, parameter, public :: ERROR_UNABLE_TO_UNLOAD_MEDIA = 1109

! 
!  MessageId: ERROR_MEDIA_CHANGED
! 
!  MessageText:
! 
!   Media in drive may have changed.
! 
integer, parameter, public :: ERROR_MEDIA_CHANGED = 1110

! 
!  MessageId: ERROR_BUS_RESET
! 
!  MessageText:
! 
!   The I/O bus was reset.
! 
integer, parameter, public :: ERROR_BUS_RESET = 1111

! 
!  MessageId: ERROR_NO_MEDIA_IN_DRIVE
! 
!  MessageText:
! 
!   No media in drive.
! 
integer, parameter, public :: ERROR_NO_MEDIA_IN_DRIVE = 1112

! 
!  MessageId: ERROR_NO_UNICODE_TRANSLATION
! 
!  MessageText:
! 
!   No mapping for the Unicode character exists in the target multi-byte code page.
! 
integer, parameter, public :: ERROR_NO_UNICODE_TRANSLATION = 1113

! 
!  MessageId: ERROR_DLL_INIT_FAILED
! 
!  MessageText:
! 
!   A dynamic link library (DLL) initialization routine failed.
! 
integer, parameter, public :: ERROR_DLL_INIT_FAILED = 1114

! 
!  MessageId: ERROR_SHUTDOWN_IN_PROGRESS
! 
!  MessageText:
! 
!   A system shutdown is in progress.
! 
integer, parameter, public :: ERROR_SHUTDOWN_IN_PROGRESS = 1115

! 
!  MessageId: ERROR_NO_SHUTDOWN_IN_PROGRESS
! 
!  MessageText:
! 
!   Unable to abort the system shutdown because no shutdown was in progress.
! 
integer, parameter, public :: ERROR_NO_SHUTDOWN_IN_PROGRESS = 1116

! 
!  MessageId: ERROR_IO_DEVICE
! 
!  MessageText:
! 
!   The request could not be performed because of an I/O device error.
! 
integer, parameter, public :: ERROR_IO_DEVICE = 1117

! 
!  MessageId: ERROR_SERIAL_NO_DEVICE
! 
!  MessageText:
! 
!   No serial device was successfully initialized.  The serial driver will unload.
! 
integer, parameter, public :: ERROR_SERIAL_NO_DEVICE = 1118

! 
!  MessageId: ERROR_IRQ_BUSY
! 
!  MessageText:
! 
!   Unable to open a device that was sharing an interrupt request (IRQ)
!   with other devices. At least one other device that uses that IRQ
!   was already opened.
! 
integer, parameter, public :: ERROR_IRQ_BUSY = 1119

! 
!  MessageId: ERROR_MORE_WRITES
! 
!  MessageText:
! 
!   A serial I/O operation was completed by another write to the serial port.
!   (The IOCTL_SERIAL_XOFF_COUNTER reached zero.)
! 
integer, parameter, public :: ERROR_MORE_WRITES = 1120

! 
!  MessageId: ERROR_COUNTER_TIMEOUT
! 
!  MessageText:
! 
!   A serial I/O operation completed because the time-out period expired.
!   (The IOCTL_SERIAL_XOFF_COUNTER did not reach zero.)
! 
integer, parameter, public :: ERROR_COUNTER_TIMEOUT = 1121

! 
!  MessageId: ERROR_FLOPPY_ID_MARK_NOT_FOUND
! 
!  MessageText:
! 
!   No ID address mark was found on the floppy disk.
! 
integer, parameter, public :: ERROR_FLOPPY_ID_MARK_NOT_FOUND = 1122

! 
!  MessageId: ERROR_FLOPPY_WRONG_CYLINDER
! 
!  MessageText:
! 
!   Mismatch between the floppy disk sector ID field and the floppy disk
!   controller track address.
! 
integer, parameter, public :: ERROR_FLOPPY_WRONG_CYLINDER = 1123

! 
!  MessageId: ERROR_FLOPPY_UNKNOWN_ERROR
! 
!  MessageText:
! 
!   The floppy disk controller reported an error that is not recognized
!   by the floppy disk driver.
! 
integer, parameter, public :: ERROR_FLOPPY_UNKNOWN_ERROR = 1124

! 
!  MessageId: ERROR_FLOPPY_BAD_REGISTERS
! 
!  MessageText:
! 
!   The floppy disk controller returned inconsistent results in its registers.
! 
integer, parameter, public :: ERROR_FLOPPY_BAD_REGISTERS = 1125

! 
!  MessageId: ERROR_DISK_RECALIBRATE_FAILED
! 
!  MessageText:
! 
!   While accessing the hard disk, a recalibrate operation failed, even after retries.
! 
integer, parameter, public :: ERROR_DISK_RECALIBRATE_FAILED = 1126

! 
!  MessageId: ERROR_DISK_OPERATION_FAILED
! 
!  MessageText:
! 
!   While accessing the hard disk, a disk operation failed even after retries.
! 
integer, parameter, public :: ERROR_DISK_OPERATION_FAILED = 1127

! 
!  MessageId: ERROR_DISK_RESET_FAILED
! 
!  MessageText:
! 
!   While accessing the hard disk, a disk controller reset was needed, but
!   even that failed.
! 
integer, parameter, public :: ERROR_DISK_RESET_FAILED = 1128

! 
!  MessageId: ERROR_EOM_OVERFLOW
! 
!  MessageText:
! 
!   Physical end of tape encountered.
! 
integer, parameter, public :: ERROR_EOM_OVERFLOW = 1129

! 
!  MessageId: ERROR_NOT_ENOUGH_SERVER_MEMORY
! 
!  MessageText:
! 
!   Not enough server storage is available to process this command.
! 
integer, parameter, public :: ERROR_NOT_ENOUGH_SERVER_MEMORY = 1130

! 
!  MessageId: ERROR_POSSIBLE_DEADLOCK
! 
!  MessageText:
! 
!   A potential deadlock condition has been detected.
! 
integer, parameter, public :: ERROR_POSSIBLE_DEADLOCK = 1131

! 
!  MessageId: ERROR_MAPPED_ALIGNMENT
! 
!  MessageText:
! 
!   The base address or the file offset specified does not have the proper
!   alignment.
! 
integer, parameter, public :: ERROR_MAPPED_ALIGNMENT = 1132




! !///////////////////////
!                        //
!  Winnet32 Status Codes //
!                        //
! /////////////////////////


! 
!  MessageId: ERROR_BAD_USERNAME
! 
!  MessageText:
! 
!   The specified username is invalid.
! 
integer, parameter, public :: ERROR_BAD_USERNAME = 2202

! 
!  MessageId: ERROR_NOT_CONNECTED
! 
!  MessageText:
! 
!   This network connection does not exist.
! 
integer, parameter, public :: ERROR_NOT_CONNECTED = 2250

! 
!  MessageId: ERROR_OPEN_FILES
! 
!  MessageText:
! 
!   This network connection has files open or requests pending.
! 
integer, parameter, public :: ERROR_OPEN_FILES = 2401

! 
!  MessageId: ERROR_DEVICE_IN_USE
! 
!  MessageText:
! 
!   The device is in use by an active process and cannot be disconnected.
! 
integer, parameter, public :: ERROR_DEVICE_IN_USE = 2404

! 
!  MessageId: ERROR_BAD_DEVICE
! 
!  MessageText:
! 
!   The specified device name is invalid.
! 
integer, parameter, public :: ERROR_BAD_DEVICE = 1200

! 
!  MessageId: ERROR_CONNECTION_UNAVAIL
! 
!  MessageText:
! 
!   The device is not currently connected but it is a remembered connection.
! 
integer, parameter, public :: ERROR_CONNECTION_UNAVAIL = 1201

! 
!  MessageId: ERROR_DEVICE_ALREADY_REMEMBERED
! 
!  MessageText:
! 
!   An attempt was made to remember a device that had previously been remembered.
! 
integer, parameter, public :: ERROR_DEVICE_ALREADY_REMEMBERED = 1202

! 
!  MessageId: ERROR_NO_NET_OR_BAD_PATH
! 
!  MessageText:
! 
!   No network provider accepted the given network path.
! 
integer, parameter, public :: ERROR_NO_NET_OR_BAD_PATH = 1203

! 
!  MessageId: ERROR_BAD_PROVIDER
! 
!  MessageText:
! 
!   The specified network provider name is invalid.
! 
integer, parameter, public :: ERROR_BAD_PROVIDER = 1204

! 
!  MessageId: ERROR_CANNOT_OPEN_PROFILE
! 
!  MessageText:
! 
!   Unable to open the network connection profile.
! 
integer, parameter, public :: ERROR_CANNOT_OPEN_PROFILE = 1205

! 
!  MessageId: ERROR_BAD_PROFILE
! 
!  MessageText:
! 
!   The network connection profile is corrupt.
! 
integer, parameter, public :: ERROR_BAD_PROFILE = 1206

! 
!  MessageId: ERROR_NOT_CONTAINER
! 
!  MessageText:
! 
!   Cannot enumerate a non-container.
! 
integer, parameter, public :: ERROR_NOT_CONTAINER = 1207

! 
!  MessageId: ERROR_EXTENDED_ERROR
! 
!  MessageText:
! 
!   An extended error has occurred.
! 
integer, parameter, public :: ERROR_EXTENDED_ERROR = 1208

! 
!  MessageId: ERROR_INVALID_GROUPNAME
! 
!  MessageText:
! 
!   The format of the specified group name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_GROUPNAME = 1209

! 
!  MessageId: ERROR_INVALID_COMPUTERNAME
! 
!  MessageText:
! 
!   The format of the specified computer name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_COMPUTERNAME = 1210

! 
!  MessageId: ERROR_INVALID_EVENTNAME
! 
!  MessageText:
! 
!   The format of the specified event name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_EVENTNAME = 1211

! 
!  MessageId: ERROR_INVALID_DOMAINNAME
! 
!  MessageText:
! 
!   The format of the specified domain name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_DOMAINNAME = 1212

! 
!  MessageId: ERROR_INVALID_SERVICENAME
! 
!  MessageText:
! 
!   The format of the specified service name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_SERVICENAME = 1213

! 
!  MessageId: ERROR_INVALID_NETNAME
! 
!  MessageText:
! 
!   The format of the specified network name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_NETNAME = 1214

! 
!  MessageId: ERROR_INVALID_SHARENAME
! 
!  MessageText:
! 
!   The format of the specified share name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_SHARENAME = 1215

! 
!  MessageId: ERROR_INVALID_PASSWORDNAME
! 
!  MessageText:
! 
!   The format of the specified password is invalid.
! 
integer, parameter, public :: ERROR_INVALID_PASSWORDNAME = 1216

! 
!  MessageId: ERROR_INVALID_MESSAGENAME
! 
!  MessageText:
! 
!   The format of the specified message name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_MESSAGENAME = 1217

! 
!  MessageId: ERROR_INVALID_MESSAGEDEST
! 
!  MessageText:
! 
!   The format of the specified message destination is invalid.
! 
integer, parameter, public :: ERROR_INVALID_MESSAGEDEST = 1218

! 
!  MessageId: ERROR_SESSION_CREDENTIAL_CONFLICT
! 
!  MessageText:
! 
!   The credentials supplied conflict with an existing set of credentials.
! 
integer, parameter, public :: ERROR_SESSION_CREDENTIAL_CONFLICT = 1219

! 
!  MessageId: ERROR_REMOTE_SESSION_LIMIT_EXCEEDED
! 
!  MessageText:
! 
!   An attempt was made to establish a session to a Lan Manager server, but there
!   are already too many sessions established to that server.
! 
integer, parameter, public :: ERROR_REMOTE_SESSION_LIMIT_EXCEEDED = 1220

! 
!  MessageId: ERROR_DUP_DOMAINNAME
! 
!  MessageText:
! 
!   The workgroup or domain name is already in use by another computer on the
!   network.
! 
integer, parameter, public :: ERROR_DUP_DOMAINNAME = 1221

! 
!  MessageId: ERROR_NO_NETWORK
! 
!  MessageText:
! 
!   The network is not present or not started.
! 
integer, parameter, public :: ERROR_NO_NETWORK = 1222

!
! MessageId: ERROR_CANCELLED
!
! MessageText:
!
!  The operation was cancelled by the user.
!
integer, parameter, public :: ERROR_CANCELLED                  =  1223

!
! MessageId: ERROR_USER_MAPPED_FILE
!
! MessageText:
!
!  The requested operation cannot be performed on a file with a user mapped section open.
!
integer, parameter, public :: ERROR_USER_MAPPED_FILE           =  1224

!
! MessageId: ERROR_CONNECTION_REFUSED
!
! MessageText:
!
!  The remote system refused the network connection.
!
integer, parameter, public :: ERROR_CONNECTION_REFUSED         =  1225

!
! MessageId: ERROR_GRACEFUL_DISCONNECT
!
! MessageText:
!
!  The network connection was gracefully closed.
!
integer, parameter, public :: ERROR_GRACEFUL_DISCONNECT        =  1226

!
! MessageId: ERROR_ADDRESS_ALREADY_ASSOCIATED
!
! MessageText:
!
!  The network transport endpoint already has an address associated with it.
!
integer, parameter, public :: ERROR_ADDRESS_ALREADY_ASSOCIATED =  1227

!
! MessageId: ERROR_ADDRESS_NOT_ASSOCIATED
!
! MessageText:
!
!  An address has not yet been associated with the network endpoint.
!
integer, parameter, public :: ERROR_ADDRESS_NOT_ASSOCIATED     =  1228

!
! MessageId: ERROR_CONNECTION_INVALID
!
! MessageText:
!
!  An operation was attempted on a non-existent network connection.
!
integer, parameter, public :: ERROR_CONNECTION_INVALID         =  1229

!
! MessageId: ERROR_CONNECTION_ACTIVE
!
! MessageText:
!
!  An invalid operation was attempted on an active network connection.
!
integer, parameter, public :: ERROR_CONNECTION_ACTIVE          =  1230

!
! MessageId: ERROR_NETWORK_UNREACHABLE
!
! MessageText:
!
!  The remote network is not reachable by the transport.
!
integer, parameter, public :: ERROR_NETWORK_UNREACHABLE        =  1231

!
! MessageId: ERROR_HOST_UNREACHABLE
!
! MessageText:
!
!  The remote system is not reachable by the transport.
!
integer, parameter, public :: ERROR_HOST_UNREACHABLE           =  1232

!
! MessageId: ERROR_PROTOCOL_UNREACHABLE
!
! MessageText:
!
!  The remote system does not support the transport protocol.
!
integer, parameter, public :: ERROR_PROTOCOL_UNREACHABLE       =  1233

!
! MessageId: ERROR_PORT_UNREACHABLE
!
! MessageText:
!
!  No service is operating at the destination network endpoint
!  on the remote system.
!
integer, parameter, public :: ERROR_PORT_UNREACHABLE           =  1234

!
! MessageId: ERROR_REQUEST_ABORTED
!
! MessageText:
!
!  The request was aborted.
!
integer, parameter, public :: ERROR_REQUEST_ABORTED            =  1235

!
! MessageId: ERROR_CONNECTION_ABORTED
!
! MessageText:
!
!  The network connection was aborted by the local system.
!
integer, parameter, public :: ERROR_CONNECTION_ABORTED         =  1236

!
! MessageId: ERROR_RETRY
!
! MessageText:
!
!  The operation could not be completed.  A retry should be performed.
!
integer, parameter, public :: ERROR_RETRY                      =  1237

!
! MessageId: ERROR_CONNECTION_COUNT_LIMIT
!
! MessageText:
!
!  A connection to the server could not be made because the limit on the number of
!  concurrent connections for this account has been reached.
!
integer, parameter, public :: ERROR_CONNECTION_COUNT_LIMIT     =  1238

!
! MessageId: ERROR_LOGIN_TIME_RESTRICTION
!
! MessageText:
!
!  Attempting to login during an unauthorized time of day for this account.
!
integer, parameter, public :: ERROR_LOGIN_TIME_RESTRICTION     =  1239

!
! MessageId: ERROR_LOGIN_WKSTA_RESTRICTION
!
! MessageText:
!
!  The account is not authorized to login from this station.
!
integer, parameter, public :: ERROR_LOGIN_WKSTA_RESTRICTION    =  1240

!
! MessageId: ERROR_INCORRECT_ADDRESS
!
! MessageText:
!
!  The network address could not be used for the operation requested.
!
integer, parameter, public :: ERROR_INCORRECT_ADDRESS          =  1241

!
! MessageId: ERROR_ALREADY_REGISTERED
!
! MessageText:
!
!  The service is already registered.
!
integer, parameter, public :: ERROR_ALREADY_REGISTERED         =  1242

!
! MessageId: ERROR_SERVICE_NOT_FOUND
!
! MessageText:
!
!  The specified service does not exist.
!
integer, parameter, public :: ERROR_SERVICE_NOT_FOUND          =  1243




! !!!!!!!!!!!!/
!                        !
!  Security Status Codes !
!                        !
! !!!!!!!!!!!!/


! 
!  MessageId: ERROR_NOT_ALL_ASSIGNED
! 
!  MessageText:
! 
!   Not all privileges referenced are assigned to the caller.
! 
integer, parameter, public :: ERROR_NOT_ALL_ASSIGNED = 1300

! 
!  MessageId: ERROR_SOME_NOT_MAPPED
! 
!  MessageText:
! 
!   Some mapping between account names and security IDs was not done.
! 
integer, parameter, public :: ERROR_SOME_NOT_MAPPED = 1301

! 
!  MessageId: ERROR_NO_QUOTAS_FOR_ACCOUNT
! 
!  MessageText:
! 
!   No system quota limits are specifically set for this account.
! 
integer, parameter, public :: ERROR_NO_QUOTAS_FOR_ACCOUNT = 1302

! 
!  MessageId: ERROR_LOCAL_USER_SESSION_KEY
! 
!  MessageText:
! 
!   No encryption key is available.  A well-known encryption key was returned.
! 
integer, parameter, public :: ERROR_LOCAL_USER_SESSION_KEY = 1303

! 
!  MessageId: ERROR_NULL_LM_PASSWORD
! 
!  MessageText:
! 
!   The NT password is too complex to be converted to a LAN Manager
!   password.  The LAN Manager password returned is a NULL string.
! 
integer, parameter, public :: ERROR_NULL_LM_PASSWORD = 1304

! 
!  MessageId: ERROR_UNKNOWN_REVISION
! 
!  MessageText:
! 
!   The revision level is unknown.
! 
integer, parameter, public :: ERROR_UNKNOWN_REVISION = 1305

! 
!  MessageId: ERROR_REVISION_MISMATCH
! 
!  MessageText:
! 
!   Indicates two revision levels are incompatible.
! 
integer, parameter, public :: ERROR_REVISION_MISMATCH = 1306

! 
!  MessageId: ERROR_INVALID_OWNER
! 
!  MessageText:
! 
!   This security ID may not be assigned as the owner of this object.
! 
integer, parameter, public :: ERROR_INVALID_OWNER = 1307

! 
!  MessageId: ERROR_INVALID_PRIMARY_GROUP
! 
!  MessageText:
! 
!   This security ID may not be assigned as the primary group of an object.
! 
integer, parameter, public :: ERROR_INVALID_PRIMARY_GROUP = 1308

! 
!  MessageId: ERROR_NO_IMPERSONATION_TOKEN
! 
!  MessageText:
! 
!   An attempt has been made to operate on an impersonation token
!   by a thread that is not currently impersonating a client.
! 
integer, parameter, public :: ERROR_NO_IMPERSONATION_TOKEN = 1309

! 
!  MessageId: ERROR_CANT_DISABLE_MANDATORY
! 
!  MessageText:
! 
!   The group may not be disabled.
! 
integer, parameter, public :: ERROR_CANT_DISABLE_MANDATORY = 1310

! 
!  MessageId: ERROR_NO_LOGON_SERVERS
! 
!  MessageText:
! 
!   There are currently no logon servers available to service the logon
!   request.
! 
integer, parameter, public :: ERROR_NO_LOGON_SERVERS = 1311

! 
!  MessageId: ERROR_NO_SUCH_LOGON_SESSION
! 
!  MessageText:
! 
!    A specified logon session does not exist.  It may already have
!    been terminated.
! 
integer, parameter, public :: ERROR_NO_SUCH_LOGON_SESSION = 1312

! 
!  MessageId: ERROR_NO_SUCH_PRIVILEGE
! 
!  MessageText:
! 
!    A specified privilege does not exist.
! 
integer, parameter, public :: ERROR_NO_SUCH_PRIVILEGE = 1313

! 
!  MessageId: ERROR_PRIVILEGE_NOT_HELD
! 
!  MessageText:
! 
!    A required privilege is not held by the client.
! 
integer, parameter, public :: ERROR_PRIVILEGE_NOT_HELD = 1314

! 
!  MessageId: ERROR_INVALID_ACCOUNT_NAME
! 
!  MessageText:
! 
!   The name provided is not a properly formed account name.
! 
integer, parameter, public :: ERROR_INVALID_ACCOUNT_NAME = 1315

! 
!  MessageId: ERROR_USER_EXISTS
! 
!  MessageText:
! 
!   The specified user already exists.
! 
integer, parameter, public :: ERROR_USER_EXISTS = 1316

! 
!  MessageId: ERROR_NO_SUCH_USER
! 
!  MessageText:
! 
!   The specified user does not exist.
! 
integer, parameter, public :: ERROR_NO_SUCH_USER = 1317

! 
!  MessageId: ERROR_GROUP_EXISTS
! 
!  MessageText:
! 
!   The specified group already exists.
! 
integer, parameter, public :: ERROR_GROUP_EXISTS = 1318

! 
!  MessageId: ERROR_NO_SUCH_GROUP
! 
!  MessageText:
! 
!   The specified group does not exist.
! 
integer, parameter, public :: ERROR_NO_SUCH_GROUP = 1319

! 
!  MessageId: ERROR_MEMBER_IN_GROUP
! 
!  MessageText:
! 
!   Either the specified user account is already a member of the specified
!   group, or the specified group cannot be deleted because it contains
!   a member.
! 
integer, parameter, public :: ERROR_MEMBER_IN_GROUP = 1320

! 
!  MessageId: ERROR_MEMBER_NOT_IN_GROUP
! 
!  MessageText:
! 
!   The specified user account is not a member of the specified group account.
! 
integer, parameter, public :: ERROR_MEMBER_NOT_IN_GROUP = 1321

! 
!  MessageId: ERROR_LAST_ADMIN
! 
!  MessageText:
! 
!   The last remaining administration account cannot be disabled
!   or deleted.
! 
integer, parameter, public :: ERROR_LAST_ADMIN = 1322

! 
!  MessageId: ERROR_WRONG_PASSWORD
! 
!  MessageText:
! 
!   Unable to update the password.  The value provided as the current
!   password is incorrect.
! 
integer, parameter, public :: ERROR_WRONG_PASSWORD = 1323

! 
!  MessageId: ERROR_ILL_FORMED_PASSWORD
! 
!  MessageText:
! 
!   Unable to update the password.  The value provided for the new password
!   contains values that are not allowed in passwords.
! 
integer, parameter, public :: ERROR_ILL_FORMED_PASSWORD = 1324

! 
!  MessageId: ERROR_PASSWORD_RESTRICTION
! 
!  MessageText:
! 
!   Unable to update the password because a password update rule has been
!   violated.
! 
integer, parameter, public :: ERROR_PASSWORD_RESTRICTION = 1325

! 
!  MessageId: ERROR_LOGON_FAILURE
! 
!  MessageText:
! 
!   Logon failure: unknown user name or bad password.
! 
integer, parameter, public :: ERROR_LOGON_FAILURE = 1326

! 
!  MessageId: ERROR_ACCOUNT_RESTRICTION
! 
!  MessageText:
! 
!   Logon failure: user account restriction.
! 
integer, parameter, public :: ERROR_ACCOUNT_RESTRICTION = 1327

! 
!  MessageId: ERROR_INVALID_LOGON_HOURS
! 
!  MessageText:
! 
!   Logon failure: account logon time restriction violation.
! 
integer, parameter, public :: ERROR_INVALID_LOGON_HOURS = 1328

! 
!  MessageId: ERROR_INVALID_WORKSTATION
! 
!  MessageText:
! 
!   Logon failure: user not allowed to log on to this computer.
! 
integer, parameter, public :: ERROR_INVALID_WORKSTATION = 1329

! 
!  MessageId: ERROR_PASSWORD_EXPIRED
! 
!  MessageText:
! 
!   Logon failure: the specified account password has expired.
! 
integer, parameter, public :: ERROR_PASSWORD_EXPIRED = 1330

! 
!  MessageId: ERROR_ACCOUNT_DISABLED
! 
!  MessageText:
! 
!   Logon failure: account currently disabled.
! 
integer, parameter, public :: ERROR_ACCOUNT_DISABLED = 1331

! 
!  MessageId: ERROR_NONE_MAPPED
! 
!  MessageText:
! 
!   No mapping between account names and security IDs was done.
! 
integer, parameter, public :: ERROR_NONE_MAPPED = 1332

! 
!  MessageId: ERROR_TOO_MANY_LUIDS_REQUESTED
! 
!  MessageText:
! 
!   Too many local user identifiers (LUIDs) were requested at one time.
! 
integer, parameter, public :: ERROR_TOO_MANY_LUIDS_REQUESTED = 1333

! 
!  MessageId: ERROR_LUIDS_EXHAUSTED
! 
!  MessageText:
! 
!   No more local user identifiers (LUIDs) are available.
! 
integer, parameter, public :: ERROR_LUIDS_EXHAUSTED = 1334

! 
!  MessageId: ERROR_INVALID_SUB_AUTHORITY
! 
!  MessageText:
! 
!   The subauthority part of a security ID is invalid for this particular use.
! 
integer, parameter, public :: ERROR_INVALID_SUB_AUTHORITY = 1335

! 
!  MessageId: ERROR_INVALID_ACL
! 
!  MessageText:
! 
!   The access control list (ACL) structure is invalid.
! 
integer, parameter, public :: ERROR_INVALID_ACL = 1336

! 
!  MessageId: ERROR_INVALID_SID
! 
!  MessageText:
! 
!   The security ID structure is invalid.
! 
integer, parameter, public :: ERROR_INVALID_SID = 1337

! 
!  MessageId: ERROR_INVALID_SECURITY_DESCR
! 
!  MessageText:
! 
!   The security descriptor structure is invalid.
! 
integer, parameter, public :: ERROR_INVALID_SECURITY_DESCR = 1338

! 
!  MessageId: ERROR_BAD_INHERITANCE_ACL
! 
!  MessageText:
! 
!   The inherited access control list (ACL) or access control entry (ACE)
!   could not be built.
! 
integer, parameter, public :: ERROR_BAD_INHERITANCE_ACL = 1340

! 
!  MessageId: ERROR_SERVER_DISABLED
! 
!  MessageText:
! 
!   The server is currently disabled.
! 
integer, parameter, public :: ERROR_SERVER_DISABLED = 1341

! 
!  MessageId: ERROR_SERVER_NOT_DISABLED
! 
!  MessageText:
! 
!   The server is currently enabled.
! 
integer, parameter, public :: ERROR_SERVER_NOT_DISABLED = 1342

! 
!  MessageId: ERROR_INVALID_ID_AUTHORITY
! 
!  MessageText:
! 
!   The value provided was an invalid value for an identifier authority.
! 
integer, parameter, public :: ERROR_INVALID_ID_AUTHORITY = 1343

! 
!  MessageId: ERROR_ALLOTTED_SPACE_EXCEEDED
! 
!  MessageText:
! 
!   No more memory is available for security information updates.
! 
integer, parameter, public :: ERROR_ALLOTTED_SPACE_EXCEEDED = 1344

! 
!  MessageId: ERROR_INVALID_GROUP_ATTRIBUTES
! 
!  MessageText:
! 
!   The specified attributes are invalid, or incompatible with the
!   attributes for the group as a whole.
! 
integer, parameter, public :: ERROR_INVALID_GROUP_ATTRIBUTES = 1345

! 
!  MessageId: ERROR_BAD_IMPERSONATION_LEVEL
! 
!  MessageText:
! 
!   Either a required impersonation level was not provided, or the
!   provided impersonation level is invalid.
! 
integer, parameter, public :: ERROR_BAD_IMPERSONATION_LEVEL = 1346

! 
!  MessageId: ERROR_CANT_OPEN_ANONYMOUS
! 
!  MessageText:
! 
!   Cannot open an anonymous level security token.
! 
integer, parameter, public :: ERROR_CANT_OPEN_ANONYMOUS = 1347

! 
!  MessageId: ERROR_BAD_VALIDATION_CLASS
! 
!  MessageText:
! 
!   The validation information class requested was invalid.
! 
integer, parameter, public :: ERROR_BAD_VALIDATION_CLASS = 1348

! 
!  MessageId: ERROR_BAD_TOKEN_TYPE
! 
!  MessageText:
! 
!   The type of the token is inappropriate for its attempted use.
! 
integer, parameter, public :: ERROR_BAD_TOKEN_TYPE = 1349

! 
!  MessageId: ERROR_NO_SECURITY_ON_OBJECT
! 
!  MessageText:
! 
!   Unable to perform a security operation on an object
!   which has no associated security.
! 
integer, parameter, public :: ERROR_NO_SECURITY_ON_OBJECT = 1350

! 
!  MessageId: ERROR_CANT_ACCESS_DOMAIN_INFO
! 
!  MessageText:
! 
!   Indicates a Windows NT Advanced Server could not be contacted or that
!   objects within the domain are protected such that necessary          
!   information could not be retrieved.                                  
! 
integer, parameter, public :: ERROR_CANT_ACCESS_DOMAIN_INFO = 1351

! 
!  MessageId: ERROR_INVALID_SERVER_STATE
! 
!  MessageText:
! 
!   The security account manager (SAM) or local security
!   authority (LSA) server was in the wrong state to perform
!   the security operation.
! 
integer, parameter, public :: ERROR_INVALID_SERVER_STATE = 1352

! 
!  MessageId: ERROR_INVALID_DOMAIN_STATE
! 
!  MessageText:
! 
!   The domain was in the wrong state to perform the security operation.
! 
integer, parameter, public :: ERROR_INVALID_DOMAIN_STATE = 1353

! 
!  MessageId: ERROR_INVALID_DOMAIN_ROLE
! 
!  MessageText:
! 
!   This operation is only allowed for the Primary Domain Controller of the domain.
! 
integer, parameter, public :: ERROR_INVALID_DOMAIN_ROLE = 1354

! 
!  MessageId: ERROR_NO_SUCH_DOMAIN
! 
!  MessageText:
! 
!   The specified domain did not exist.
! 
integer, parameter, public :: ERROR_NO_SUCH_DOMAIN = 1355

! 
!  MessageId: ERROR_DOMAIN_EXISTS
! 
!  MessageText:
! 
!   The specified domain already exists.
! 
integer, parameter, public :: ERROR_DOMAIN_EXISTS = 1356

! 
!  MessageId: ERROR_DOMAIN_LIMIT_EXCEEDED
! 
!  MessageText:
! 
!   An attempt was made to exceed the limit on the number of domains per server.
! 
integer, parameter, public :: ERROR_DOMAIN_LIMIT_EXCEEDED = 1357

! 
!  MessageId: ERROR_INTERNAL_DB_CORRUPTION
! 
!  MessageText:
! 
!   Unable to complete the requested operation because of either a
!   catastrophic media failure or a data structure corruption on the disk.
! 
integer, parameter, public :: ERROR_INTERNAL_DB_CORRUPTION = 1358

! 
!  MessageId: ERROR_INTERNAL_ERROR
! 
!  MessageText:
! 
!   The security account database contains an internal inconsistency.
! 
integer, parameter, public :: ERROR_INTERNAL_ERROR = 1359

! 
!  MessageId: ERROR_GENERIC_NOT_MAPPED
! 
!  MessageText:
! 
!   Generic access types were contained in an access mask which should
!   already be mapped to non-generic types.
! 
integer, parameter, public :: ERROR_GENERIC_NOT_MAPPED = 1360

! 
!  MessageId: ERROR_BAD_DESCRIPTOR_FORMAT
! 
!  MessageText:
! 
!   A security descriptor is not in the right format (absolute or self-relative).
! 
integer, parameter, public :: ERROR_BAD_DESCRIPTOR_FORMAT = 1361

! 
!  MessageId: ERROR_NOT_LOGON_PROCESS
! 
!  MessageText:
! 
!   The requested action is restricted for use by logon processes
!   only.  The calling process has not registered as a logon process.
! 
integer, parameter, public :: ERROR_NOT_LOGON_PROCESS = 1362

! 
!  MessageId: ERROR_LOGON_SESSION_EXISTS
! 
!  MessageText:
! 
!   Cannot start a new logon session with an ID that is already in use.
! 
integer, parameter, public :: ERROR_LOGON_SESSION_EXISTS = 1363

! 
!  MessageId: ERROR_NO_SUCH_PACKAGE
! 
!  MessageText:
! 
!   A specified authentication package is unknown.
! 
integer, parameter, public :: ERROR_NO_SUCH_PACKAGE = 1364

! 
!  MessageId: ERROR_BAD_LOGON_SESSION_STATE
! 
!  MessageText:
! 
!   The logon session is not in a state that is consistent with the
!   requested operation.
! 
integer, parameter, public :: ERROR_BAD_LOGON_SESSION_STATE = 1365

! 
!  MessageId: ERROR_LOGON_SESSION_COLLISION
! 
!  MessageText:
! 
!   The logon session ID is already in use.
! 
integer, parameter, public :: ERROR_LOGON_SESSION_COLLISION = 1366

! 
!  MessageId: ERROR_INVALID_LOGON_TYPE
! 
!  MessageText:
! 
!   A logon request contained an invalid logon type value.
! 
integer, parameter, public :: ERROR_INVALID_LOGON_TYPE = 1367

! 
!  MessageId: ERROR_CANNOT_IMPERSONATE
! 
!  MessageText:
! 
!   Unable to impersonate via a named pipe until data has been read
!   from that pipe.
! 
integer, parameter, public :: ERROR_CANNOT_IMPERSONATE = 1368

! 
!  MessageId: ERROR_RXACT_INVALID_STATE
! 
!  MessageText:
! 
!   The transaction state of a Registry subtree is incompatible with the
!   requested operation.
! 
integer, parameter, public :: ERROR_RXACT_INVALID_STATE = 1369

! 
!  MessageId: ERROR_RXACT_COMMIT_FAILURE
! 
!  MessageText:
! 
!   An internal security database corruption has been encountered.
! 
integer, parameter, public :: ERROR_RXACT_COMMIT_FAILURE = 1370

! 
!  MessageId: ERROR_SPECIAL_ACCOUNT
! 
!  MessageText:
! 
!   Cannot perform this operation on built-in accounts.
! 
integer, parameter, public :: ERROR_SPECIAL_ACCOUNT = 1371

! 
!  MessageId: ERROR_SPECIAL_GROUP
! 
!  MessageText:
! 
!   Cannot perform this operation on this built-in special group.
! 
integer, parameter, public :: ERROR_SPECIAL_GROUP = 1372

! 
!  MessageId: ERROR_SPECIAL_USER
! 
!  MessageText:
! 
!   Cannot perform this operation on this built-in special user.
! 
integer, parameter, public :: ERROR_SPECIAL_USER = 1373

! 
!  MessageId: ERROR_MEMBERS_PRIMARY_GROUP
! 
!  MessageText:
! 
!   The user cannot be removed from a group because the group
!   is currently the user's primary group.
! 
integer, parameter, public :: ERROR_MEMBERS_PRIMARY_GROUP = 1374

! 
!  MessageId: ERROR_TOKEN_ALREADY_IN_USE
! 
!  MessageText:
! 
!   The token is already in use as a primary token.
! 
integer, parameter, public :: ERROR_TOKEN_ALREADY_IN_USE = 1375

! 
!  MessageId: ERROR_NO_SUCH_ALIAS
! 
!  MessageText:
! 
!   The specified local group does not exist.
! 
integer, parameter, public :: ERROR_NO_SUCH_ALIAS = 1376

! 
!  MessageId: ERROR_MEMBER_NOT_IN_ALIAS
! 
!  MessageText:
! 
!   The specified account name is not a member of the local group.
! 
integer, parameter, public :: ERROR_MEMBER_NOT_IN_ALIAS = 1377

! 
!  MessageId: ERROR_MEMBER_IN_ALIAS
! 
!  MessageText:
! 
!   The specified account name is already a member of the local group.
! 
integer, parameter, public :: ERROR_MEMBER_IN_ALIAS = 1378

! 
!  MessageId: ERROR_ALIAS_EXISTS
! 
!  MessageText:
! 
!   The specified local group already exists.
! 
integer, parameter, public :: ERROR_ALIAS_EXISTS = 1379

! 
!  MessageId: ERROR_LOGON_NOT_GRANTED
! 
!  MessageText:
! 
!   Logon failure: the user has not been granted the requested
!   logon type at this computer.
! 
integer, parameter, public :: ERROR_LOGON_NOT_GRANTED = 1380

! 
!  MessageId: ERROR_TOO_MANY_SECRETS
! 
!  MessageText:
! 
!   The maximum number of secrets that may be stored in a single system has been
!   exceeded.
! 
integer, parameter, public :: ERROR_TOO_MANY_SECRETS = 1381

! 
!  MessageId: ERROR_SECRET_TOO_LONG
! 
!  MessageText:
! 
!   The length of a secret exceeds the maximum length allowed.
! 
integer, parameter, public :: ERROR_SECRET_TOO_LONG = 1382

! 
!  MessageId: ERROR_INTERNAL_DB_ERROR
! 
!  MessageText:
! 
!   The local security authority database contains an internal inconsistency.
! 
integer, parameter, public :: ERROR_INTERNAL_DB_ERROR = 1383

! 
!  MessageId: ERROR_TOO_MANY_CONTEXT_IDS
! 
!  MessageText:
! 
!   During a logon attempt, the user's security context accumulated too many
!   security IDs.
! 
integer, parameter, public :: ERROR_TOO_MANY_CONTEXT_IDS = 1384

! 
!  MessageId: ERROR_LOGON_TYPE_NOT_GRANTED
! 
!  MessageText:
! 
!   Logon failure: the user has not been granted the requested logon type
!   at this computer.
! 
integer, parameter, public :: ERROR_LOGON_TYPE_NOT_GRANTED = 1385

! 
!  MessageId: ERROR_NT_CROSS_ENCRYPTION_REQUIRED
! 
!  MessageText:
! 
!   A cross-encrypted password is necessary to change a user password.
! 
integer, parameter, public :: ERROR_NT_CROSS_ENCRYPTION_REQUIRED = 1386

! 
!  MessageId: ERROR_NO_SUCH_MEMBER
! 
!  MessageText:
! 
!   A new member could not be added to a local group because the member does
!   not exist.
! 
integer, parameter, public :: ERROR_NO_SUCH_MEMBER = 1387

! 
!  MessageId: ERROR_INVALID_MEMBER
! 
!  MessageText:
! 
!   A new member could not be added to a local group because the member has the
!   wrong account type.
! 
integer, parameter, public :: ERROR_INVALID_MEMBER = 1388

! 
!  MessageId: ERROR_TOO_MANY_SIDS
! 
!  MessageText:
! 
!   Too many security IDs have been specified.
! 
integer, parameter, public :: ERROR_TOO_MANY_SIDS = 1389

! 
!  MessageId: ERROR_LM_CROSS_ENCRYPTION_REQUIRED
! 
!  MessageText:
! 
!   A cross-encrypted password is necessary to change this user password.
! 
integer, parameter, public :: ERROR_LM_CROSS_ENCRYPTION_REQUIRED = 1390

! 
!  MessageId: ERROR_NO_INHERITANCE
! 
!  MessageText:
! 
!   Indicates an ACL contains no inheritable components
! 
integer, parameter, public :: ERROR_NO_INHERITANCE = 1391

! 
!  MessageId: ERROR_FILE_CORRUPT
! 
!  MessageText:
! 
!   The file or directory is corrupt and non-readable.
! 
integer, parameter, public :: ERROR_FILE_CORRUPT = 1392

! 
!  MessageId: ERROR_DISK_CORRUPT
! 
!  MessageText:
! 
!   The disk structure is corrupt and non-readable.
! 
integer, parameter, public :: ERROR_DISK_CORRUPT = 1393

! 
!  MessageId: ERROR_NO_USER_SESSION_KEY
! 
!  MessageText:
! 
!   There is no user session key for the specified logon session.
! 
integer, parameter, public :: ERROR_NO_USER_SESSION_KEY = 1394

!  End of security error codes



! !!!!!!!!!!!!/
!                        !
!  WinUser Error Codes   !
!                        !
! !!!!!!!!!!!!/


! 
!  MessageId: ERROR_INVALID_WINDOW_HANDLE
! 
!  MessageText:
! 
!   Invalid window handle.
! 
integer, parameter, public :: ERROR_INVALID_WINDOW_HANDLE = 1400

! 
!  MessageId: ERROR_INVALID_MENU_HANDLE
! 
!  MessageText:
! 
!   Invalid menu handle.
! 
integer, parameter, public :: ERROR_INVALID_MENU_HANDLE = 1401

! 
!  MessageId: ERROR_INVALID_CURSOR_HANDLE
! 
!  MessageText:
! 
!   Invalid cursor handle.
! 
integer, parameter, public :: ERROR_INVALID_CURSOR_HANDLE = 1402

! 
!  MessageId: ERROR_INVALID_ACCEL_HANDLE
! 
!  MessageText:
! 
!   Invalid accelerator table handle.
! 
integer, parameter, public :: ERROR_INVALID_ACCEL_HANDLE = 1403

! 
!  MessageId: ERROR_INVALID_HOOK_HANDLE
! 
!  MessageText:
! 
!   Invalid hook handle.
! 
integer, parameter, public :: ERROR_INVALID_HOOK_HANDLE = 1404

! 
!  MessageId: ERROR_INVALID_DWP_HANDLE
! 
!  MessageText:
! 
!   Invalid handle to a multiple-window position structure.
! 
integer, parameter, public :: ERROR_INVALID_DWP_HANDLE = 1405

! 
!  MessageId: ERROR_TLW_WITH_WSCHILD
! 
!  MessageText:
! 
!   Cannot create a top-level child window.
! 
integer, parameter, public :: ERROR_TLW_WITH_WSCHILD = 1406

! 
!  MessageId: ERROR_CANNOT_FIND_WND_CLASS
! 
!  MessageText:
! 
!   Cannot find window class.
! 
integer, parameter, public :: ERROR_CANNOT_FIND_WND_CLASS = 1407

! 
!  MessageId: ERROR_WINDOW_OF_OTHER_THREAD
! 
!  MessageText:
! 
!   Invalid window, belongs to other thread.
! 
integer, parameter, public :: ERROR_WINDOW_OF_OTHER_THREAD = 1408

! 
!  MessageId: ERROR_HOTKEY_ALREADY_REGISTERED
! 
!  MessageText:
! 
!   Hot key is already registered.
! 
integer, parameter, public :: ERROR_HOTKEY_ALREADY_REGISTERED = 1409

! 
!  MessageId: ERROR_CLASS_ALREADY_EXISTS
! 
!  MessageText:
! 
!   Class already exists.
! 
integer, parameter, public :: ERROR_CLASS_ALREADY_EXISTS = 1410

! 
!  MessageId: ERROR_CLASS_DOES_NOT_EXIST
! 
!  MessageText:
! 
!   Class does not exist.
! 
integer, parameter, public :: ERROR_CLASS_DOES_NOT_EXIST = 1411

! 
!  MessageId: ERROR_CLASS_HAS_WINDOWS
! 
!  MessageText:
! 
!   Class still has open windows.
! 
integer, parameter, public :: ERROR_CLASS_HAS_WINDOWS = 1412

! 
!  MessageId: ERROR_INVALID_INDEX
! 
!  MessageText:
! 
!   Invalid index.
! 
integer, parameter, public :: ERROR_INVALID_INDEX = 1413

! 
!  MessageId: ERROR_INVALID_ICON_HANDLE
! 
!  MessageText:
! 
!   Invalid icon handle.
! 
integer, parameter, public :: ERROR_INVALID_ICON_HANDLE = 1414

! 
!  MessageId: ERROR_PRIVATE_DIALOG_INDEX
! 
!  MessageText:
! 
!   Using private DIALOG window words.
! 
integer, parameter, public :: ERROR_PRIVATE_DIALOG_INDEX = 1415

! 
!  MessageId: ERROR_LISTBOX_ID_NOT_FOUND
! 
!  MessageText:
! 
!   The listbox identifier was not found.
! 
integer, parameter, public :: ERROR_LISTBOX_ID_NOT_FOUND = 1416

! 
!  MessageId: ERROR_NO_WILDCARD_CHARACTERS
! 
!  MessageText:
! 
!   No wildcards were found.
! 
integer, parameter, public :: ERROR_NO_WILDCARD_CHARACTERS = 1417

! 
!  MessageId: ERROR_CLIPBOARD_NOT_OPEN
! 
!  MessageText:
! 
!   Thread does not have a clipboard open.
! 
integer, parameter, public :: ERROR_CLIPBOARD_NOT_OPEN = 1418

! 
!  MessageId: ERROR_HOTKEY_NOT_REGISTERED
! 
!  MessageText:
! 
!   Hot key is not registered.
! 
integer, parameter, public :: ERROR_HOTKEY_NOT_REGISTERED = 1419

! 
!  MessageId: ERROR_WINDOW_NOT_DIALOG
! 
!  MessageText:
! 
!   The window is not a valid dialog window.
! 
integer, parameter, public :: ERROR_WINDOW_NOT_DIALOG = 1420

! 
!  MessageId: ERROR_CONTROL_ID_NOT_FOUND
! 
!  MessageText:
! 
!   Control ID not found.
! 
integer, parameter, public :: ERROR_CONTROL_ID_NOT_FOUND = 1421

! 
!  MessageId: ERROR_INVALID_COMBOBOX_MESSAGE
! 
!  MessageText:
! 
!   Invalid message for a combo box because it does not have an edit control.
! 
integer, parameter, public :: ERROR_INVALID_COMBOBOX_MESSAGE = 1422

! 
!  MessageId: ERROR_WINDOW_NOT_COMBOBOX
! 
!  MessageText:
! 
!   The window is not a combo box.
! 
integer, parameter, public :: ERROR_WINDOW_NOT_COMBOBOX = 1423

! 
!  MessageId: ERROR_INVALID_EDIT_HEIGHT
! 
!  MessageText:
! 
!   Height must be less than 256.
! 
integer, parameter, public :: ERROR_INVALID_EDIT_HEIGHT = 1424

! 
!  MessageId: ERROR_DC_NOT_FOUND
! 
!  MessageText:
! 
!   Invalid device context (DC) handle.
! 
integer, parameter, public :: ERROR_DC_NOT_FOUND = 1425

! 
!  MessageId: ERROR_INVALID_HOOK_FILTER
! 
!  MessageText:
! 
!   Invalid hook procedure type.
! 
integer, parameter, public :: ERROR_INVALID_HOOK_FILTER = 1426

! 
!  MessageId: ERROR_INVALID_FILTER_PROC
! 
!  MessageText:
! 
!   Invalid hook procedure.
! 
integer, parameter, public :: ERROR_INVALID_FILTER_PROC = 1427

! 
!  MessageId: ERROR_HOOK_NEEDS_HMOD
! 
!  MessageText:
! 
!   Cannot set non-local hook without a module handle.
! 
integer, parameter, public :: ERROR_HOOK_NEEDS_HMOD = 1428

! 
!  MessageId: ERROR_GLOBAL_ONLY_HOOK
! 
!  MessageText:
! 
!   This hook procedure can only be set globally.
! 
integer, parameter, public :: ERROR_GLOBAL_ONLY_HOOK = 1429

! 
!  MessageId: ERROR_JOURNAL_HOOK_SET
! 
!  MessageText:
! 
!   The journal hook procedure is already installed.
! 
integer, parameter, public :: ERROR_JOURNAL_HOOK_SET = 1430

! 
!  MessageId: ERROR_HOOK_NOT_INSTALLED
! 
!  MessageText:
! 
!   The hook procedure is not installed.
! 
integer, parameter, public :: ERROR_HOOK_NOT_INSTALLED = 1431

! 
!  MessageId: ERROR_INVALID_LB_MESSAGE
! 
!  MessageText:
! 
!   Invalid message for single-selection listbox.
! 
integer, parameter, public :: ERROR_INVALID_LB_MESSAGE = 1432

! 
!  MessageId: ERROR_SETCOUNT_ON_BAD_LB
! 
!  MessageText:
! 
!   LB_SETCOUNT sent to non-lazy listbox.
! 
integer, parameter, public :: ERROR_SETCOUNT_ON_BAD_LB = 1433

! 
!  MessageId: ERROR_LB_WITHOUT_TABSTOPS
! 
!  MessageText:
! 
!   This list box does not support tab stops.
! 
integer, parameter, public :: ERROR_LB_WITHOUT_TABSTOPS = 1434

! 
!  MessageId: ERROR_DESTROY_OBJECT_OF_OTHER_THREAD
! 
!  MessageText:
! 
!   Cannot destroy object created by another thread.
! 
integer, parameter, public :: ERROR_DESTROY_OBJECT_OF_OTHER_THREAD = 1435

! 
!  MessageId: ERROR_CHILD_WINDOW_MENU
! 
!  MessageText:
! 
!   Child windows cannot have menus.
! 
integer, parameter, public :: ERROR_CHILD_WINDOW_MENU = 1436

! 
!  MessageId: ERROR_NO_SYSTEM_MENU
! 
!  MessageText:
! 
!   The window does not have a system menu.
! 
integer, parameter, public :: ERROR_NO_SYSTEM_MENU = 1437

! 
!  MessageId: ERROR_INVALID_MSGBOX_STYLE
! 
!  MessageText:
! 
!   Invalid message box style.
! 
integer, parameter, public :: ERROR_INVALID_MSGBOX_STYLE = 1438

! 
!  MessageId: ERROR_INVALID_SPI_VALUE
! 
!  MessageText:
! 
!   Invalid system-wide (SPI_*) parameter.
! 
integer, parameter, public :: ERROR_INVALID_SPI_VALUE = 1439

! 
!  MessageId: ERROR_SCREEN_ALREADY_LOCKED
! 
!  MessageText:
! 
!   Screen already locked.
! 
integer, parameter, public :: ERROR_SCREEN_ALREADY_LOCKED = 1440

! 
!  MessageId: ERROR_HWNDS_HAVE_DIFF_PARENT
! 
!  MessageText:
! 
!   All handles to windows in a multiple-window position structure must
!   have the same parent.
! 
integer, parameter, public :: ERROR_HWNDS_HAVE_DIFF_PARENT = 1441

! 
!  MessageId: ERROR_NOT_CHILD_WINDOW
! 
!  MessageText:
! 
!   The window is not a child window.
! 
integer, parameter, public :: ERROR_NOT_CHILD_WINDOW = 1442

! 
!  MessageId: ERROR_INVALID_GW_COMMAND
! 
!  MessageText:
! 
!   Invalid GW_* command.
! 
integer, parameter, public :: ERROR_INVALID_GW_COMMAND = 1443

! 
!  MessageId: ERROR_INVALID_THREAD_ID
! 
!  MessageText:
! 
!   Invalid thread identifier.
! 
integer, parameter, public :: ERROR_INVALID_THREAD_ID = 1444

! 
!  MessageId: ERROR_NON_MDICHILD_WINDOW
! 
!  MessageText:
! 
!   Cannot process a message from a window that is not a multiple document
!   interface (MDI) window.
! 
integer, parameter, public :: ERROR_NON_MDICHILD_WINDOW = 1445

! 
!  MessageId: ERROR_POPUP_ALREADY_ACTIVE
! 
!  MessageText:
! 
!   Popup menu already active.
! 
integer, parameter, public :: ERROR_POPUP_ALREADY_ACTIVE = 1446

! 
!  MessageId: ERROR_NO_SCROLLBARS
! 
!  MessageText:
! 
!   The window does not have scroll bars.
! 
integer, parameter, public :: ERROR_NO_SCROLLBARS = 1447

! 
!  MessageId: ERROR_INVALID_SCROLLBAR_RANGE
! 
!  MessageText:
! 
!   Scroll bar range cannot be greater than #7FFF.
! 
integer, parameter, public :: ERROR_INVALID_SCROLLBAR_RANGE = 1448

! 
!  MessageId: ERROR_INVALID_SHOWWIN_COMMAND
! 
!  MessageText:
! 
!   Cannot show or remove the window in the way specified.
! 
integer, parameter, public :: ERROR_INVALID_SHOWWIN_COMMAND = 1449

!  End of WinUser error codes



! !!!!!!!!!!!!/
!                        !
!  Eventlog Status Codes !
!                        !
! !!!!!!!!!!!!/


! 
!  MessageId: ERROR_EVENTLOG_FILE_CORRUPT
! 
!  MessageText:
! 
!   The event log file is corrupt.
! 
integer, parameter, public :: ERROR_EVENTLOG_FILE_CORRUPT = 1500

! 
!  MessageId: ERROR_EVENTLOG_CANT_START
! 
!  MessageText:
! 
!   No event log file could be opened, so the event logging service did not start.
! 
integer, parameter, public :: ERROR_EVENTLOG_CANT_START = 1501

! 
!  MessageId: ERROR_LOG_FILE_FULL
! 
!  MessageText:
! 
!   The event log file is full.
! 
integer, parameter, public :: ERROR_LOG_FILE_FULL = 1502

! 
!  MessageId: ERROR_EVENTLOG_FILE_CHANGED
! 
!  MessageText:
! 
!   The event log file has changed between reads.
! 
integer, parameter, public :: ERROR_EVENTLOG_FILE_CHANGED = 1503

!  End of eventlog error codes



! !!!!!!!!!!!!/
!                        !
!    RPC Status Codes    !
!                        !
! !!!!!!!!!!!!/


! 
!  MessageId: ERROR_RPC_S_INVALID_STRING_BINDING
! 
!  MessageText:
! 
!   The string binding is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_STRING_BINDING = 1700

! 
!  MessageId: ERROR_RPC_S_WRONG_KIND_OF_BINDING
! 
!  MessageText:
! 
!   The binding handle is not the correct type.
! 
integer, parameter, public :: ERROR_RPC_S_WRONG_KIND_OF_BINDING = 1701

! 
!  MessageId: ERROR_RPC_S_INVALID_BINDING
! 
!  MessageText:
! 
!   The binding handle is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_BINDING = 1702

! 
!  MessageId: ERROR_RPC_S_PROTSEQ_NOT_SUPPORTED
! 
!  MessageText:
! 
!   The RPC protocol sequence is not supported.
! 
integer, parameter, public :: ERROR_RPC_S_PROTSEQ_NOT_SUPPORTED = 1703

! 
!  MessageId: ERROR_RPC_S_INVALID_RPC_PROTSEQ
! 
!  MessageText:
! 
!   The RPC protocol sequence is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_RPC_PROTSEQ = 1704

! 
!  MessageId: ERROR_RPC_S_INVALID_STRING_UUID
! 
!  MessageText:
! 
!   The string universal unique identifier (UUID) is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_STRING_UUID = 1705

! 
!  MessageId: ERROR_RPC_S_INVALID_ENDPOINT_FORMAT
! 
!  MessageText:
! 
!   The endpoint format is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_ENDPOINT_FORMAT = 1706

! 
!  MessageId: ERROR_RPC_S_INVALID_NET_ADDR
! 
!  MessageText:
! 
!   The network address is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_NET_ADDR = 1707

! 
!  MessageId: ERROR_RPC_S_NO_ENDPOINT_FOUND
! 
!  MessageText:
! 
!   No endpoint was found.
! 
integer, parameter, public :: ERROR_RPC_S_NO_ENDPOINT_FOUND = 1708

! 
!  MessageId: ERROR_RPC_S_INVALID_TIMEOUT
! 
!  MessageText:
! 
!   The timeout value is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_TIMEOUT = 1709

! 
!  MessageId: ERROR_RPC_S_OBJECT_NOT_FOUND
! 
!  MessageText:
! 
!   The object universal unique identifier (UUID) was not found.
! 
integer, parameter, public :: ERROR_RPC_S_OBJECT_NOT_FOUND = 1710

! 
!  MessageId: ERROR_RPC_S_ALREADY_REGISTERED
! 
!  MessageText:
! 
!   The object universal unique identifier (UUID) has already been registered.
! 
integer, parameter, public :: ERROR_RPC_S_ALREADY_REGISTERED = 1711

! 
!  MessageId: ERROR_RPC_S_TYPE_ALREADY_REGISTERED
! 
!  MessageText:
! 
!   The type universal unique identifier (UUID) has already been registered.
! 
integer, parameter, public :: ERROR_RPC_S_TYPE_ALREADY_REGISTERED = 1712

! 
!  MessageId: ERROR_RPC_S_ALREADY_LISTENING
! 
!  MessageText:
! 
!   The RPC server is already listening.
! 
integer, parameter, public :: ERROR_RPC_S_ALREADY_LISTENING = 1713

! 
!  MessageId: ERROR_RPC_S_NO_PROTSEQS_REGISTERED
! 
!  MessageText:
! 
!   No protocol sequences have been registered.
! 
integer, parameter, public :: ERROR_RPC_S_NO_PROTSEQS_REGISTERED = 1714

! 
!  MessageId: ERROR_RPC_S_NOT_LISTENING
! 
!  MessageText:
! 
!   The RPC server is not listening.
! 
integer, parameter, public :: ERROR_RPC_S_NOT_LISTENING = 1715

! 
!  MessageId: ERROR_RPC_S_UNKNOWN_MGR_TYPE
! 
!  MessageText:
! 
!   The manager type is unknown.
! 
integer, parameter, public :: ERROR_RPC_S_UNKNOWN_MGR_TYPE = 1716

! 
!  MessageId: ERROR_RPC_S_UNKNOWN_IF
! 
!  MessageText:
! 
!   The interface is unknown.
! 
integer, parameter, public :: ERROR_RPC_S_UNKNOWN_IF = 1717

! 
!  MessageId: ERROR_RPC_S_NO_BINDINGS
! 
!  MessageText:
! 
!   There are no bindings.
! 
integer, parameter, public :: ERROR_RPC_S_NO_BINDINGS = 1718

! 
!  MessageId: ERROR_RPC_S_NO_PROTSEQS
! 
!  MessageText:
! 
!   There are no protocol sequences.
! 
integer, parameter, public :: ERROR_RPC_S_NO_PROTSEQS = 1719

! 
!  MessageId: ERROR_RPC_S_CANT_CREATE_ENDPOINT
! 
!  MessageText:
! 
!   The endpoint cannot be created.
! 
integer, parameter, public :: ERROR_RPC_S_CANT_CREATE_ENDPOINT = 1720

! 
!  MessageId: ERROR_RPC_S_OUT_OF_RESOURCES
! 
!  MessageText:
! 
!   Not enough resources are available to complete this operation.
! 
integer, parameter, public :: ERROR_RPC_S_OUT_OF_RESOURCES = 1721

! 
!  MessageId: ERROR_RPC_S_SERVER_UNAVAILABLE
! 
!  MessageText:
! 
!   The RPC server is unavailable.
! 
integer, parameter, public :: ERROR_RPC_S_SERVER_UNAVAILABLE = 1722

! 
!  MessageId: ERROR_RPC_S_SERVER_TOO_BUSY
! 
!  MessageText:
! 
!   The RPC server is too busy to complete this operation.
! 
integer, parameter, public :: ERROR_RPC_S_SERVER_TOO_BUSY = 1723

! 
!  MessageId: ERROR_RPC_S_INVALID_NETWORK_OPTIONS
! 
!  MessageText:
! 
!   The network options are invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_NETWORK_OPTIONS = 1724

! 
!  MessageId: ERROR_RPC_S_NO_CALL_ACTIVE
! 
!  MessageText:
! 
!   There is not a remote procedure call active in this thread.
! 
integer, parameter, public :: ERROR_RPC_S_NO_CALL_ACTIVE = 1725

! 
!  MessageId: ERROR_RPC_S_CALL_FAILED
! 
!  MessageText:
! 
!   The remote procedure call failed.
! 
integer, parameter, public :: ERROR_RPC_S_CALL_FAILED = 1726

! 
!  MessageId: ERROR_RPC_S_CALL_FAILED_DNE
! 
!  MessageText:
! 
!   The remote procedure call failed and did not execute.
! 
integer, parameter, public :: ERROR_RPC_S_CALL_FAILED_DNE = 1727

! 
!  MessageId: ERROR_RPC_S_PROTOCOL_ERROR
! 
!  MessageText:
! 
!   A remote procedure call (RPC) protocol error occurred.
! 
integer, parameter, public :: ERROR_RPC_S_PROTOCOL_ERROR = 1728

! 
!  MessageId: ERROR_RPC_S_UNSUPPORTED_TRANS_SYN
! 
!  MessageText:
! 
!   The transfer syntax is not supported by the RPC server.
! 
integer, parameter, public :: ERROR_RPC_S_UNSUPPORTED_TRANS_SYN = 1730

! 
!  MessageId: ERROR_RPC_S_UNSUPPORTED_TYPE
! 
!  MessageText:
! 
!   The universal unique identifier (UUID) type is not supported.
! 
integer, parameter, public :: ERROR_RPC_S_UNSUPPORTED_TYPE = 1732

! 
!  MessageId: ERROR_RPC_S_INVALID_TAG
! 
!  MessageText:
! 
!   The tag is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_TAG = 1733

! 
!  MessageId: ERROR_RPC_S_INVALID_BOUND
! 
!  MessageText:
! 
!   The array bounds are invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_BOUND = 1734

! 
!  MessageId: ERROR_RPC_S_NO_ENTRY_NAME
! 
!  MessageText:
! 
!   The binding does not contain an entry name.
! 
integer, parameter, public :: ERROR_RPC_S_NO_ENTRY_NAME = 1735

! 
!  MessageId: ERROR_RPC_S_INVALID_NAME_SYNTAX
! 
!  MessageText:
! 
!   The name syntax is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_NAME_SYNTAX = 1736

! 
!  MessageId: ERROR_RPC_S_UNSUPPORTED_NAME_SYNTAX
! 
!  MessageText:
! 
!   The name syntax is not supported.
! 
integer, parameter, public :: ERROR_RPC_S_UNSUPPORTED_NAME_SYNTAX = 1737

! 
!  MessageId: ERROR_RPC_S_UUID_NO_ADDRESS
! 
!  MessageText:
! 
!   No network address is available to use to construct a universal
!   unique identifier (UUID).
! 
integer, parameter, public :: ERROR_RPC_S_UUID_NO_ADDRESS = 1739

! 
!  MessageId: ERROR_RPC_S_DUPLICATE_ENDPOINT
! 
!  MessageText:
! 
!   The endpoint is a duplicate.
! 
integer, parameter, public :: ERROR_RPC_S_DUPLICATE_ENDPOINT = 1740

! 
!  MessageId: ERROR_RPC_S_UNKNOWN_AUTHN_TYPE
! 
!  MessageText:
! 
!   The authentication type is unknown.
! 
integer, parameter, public :: ERROR_RPC_S_UNKNOWN_AUTHN_TYPE = 1741

! 
!  MessageId: ERROR_RPC_S_MAX_CALLS_TOO_SMALL
! 
!  MessageText:
! 
!   The maximum number of calls is too small.
! 
integer, parameter, public :: ERROR_RPC_S_MAX_CALLS_TOO_SMALL = 1742

! 
!  MessageId: ERROR_RPC_S_STRING_TOO_LONG
! 
!  MessageText:
! 
!   The string is too long.
! 
integer, parameter, public :: ERROR_RPC_S_STRING_TOO_LONG = 1743

! 
!  MessageId: ERROR_RPC_S_PROTSEQ_NOT_FOUND
! 
!  MessageText:
! 
!   The RPC protocol sequence was not found.
! 
integer, parameter, public :: ERROR_RPC_S_PROTSEQ_NOT_FOUND = 1744

! 
!  MessageId: ERROR_RPC_S_PROCNUM_OUT_OF_RANGE
! 
!  MessageText:
! 
!   The procedure number is out of range.
! 
integer, parameter, public :: ERROR_RPC_S_PROCNUM_OUT_OF_RANGE = 1745

! 
!  MessageId: ERROR_RPC_S_BINDING_HAS_NO_AUTH
! 
!  MessageText:
! 
!   The binding does not contain any authentication information.
! 
integer, parameter, public :: ERROR_RPC_S_BINDING_HAS_NO_AUTH = 1746

! 
!  MessageId: ERROR_RPC_S_UNKNOWN_AUTHN_SERVICE
! 
!  MessageText:
! 
!   The authentication service is unknown.
! 
integer, parameter, public :: ERROR_RPC_S_UNKNOWN_AUTHN_SERVICE = 1747

! 
!  MessageId: ERROR_RPC_S_UNKNOWN_AUTHN_LEVEL
! 
!  MessageText:
! 
!   The authentication level is unknown.
! 
integer, parameter, public :: ERROR_RPC_S_UNKNOWN_AUTHN_LEVEL = 1748

! 
!  MessageId: ERROR_RPC_S_INVALID_AUTH_IDENTITY
! 
!  MessageText:
! 
!   The security context is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_AUTH_IDENTITY = 1749

! 
!  MessageId: ERROR_RPC_S_UNKNOWN_AUTHZ_SERVICE
! 
!  MessageText:
! 
!   The authorization service is unknown.
! 
integer, parameter, public :: ERROR_RPC_S_UNKNOWN_AUTHZ_SERVICE = 1750

! 
!  MessageId: ERROR_EPT_S_INVALID_ENTRY
! 
!  MessageText:
! 
!   The entry is invalid.
! 
integer, parameter, public :: ERROR_EPT_S_INVALID_ENTRY = 1751

! 
!  MessageId: ERROR_EPT_S_CANT_PERFORM_OP
! 
!  MessageText:
! 
!   The server endpoint cannot perform the operation.
! 
integer, parameter, public :: ERROR_EPT_S_CANT_PERFORM_OP = 1752

! 
!  MessageId: ERROR_EPT_S_NOT_REGISTERED
! 
!  MessageText:
! 
!   There are no more endpoints available from the endpoint mapper.
! 
integer, parameter, public :: ERROR_EPT_S_NOT_REGISTERED = 1753

! 
!  MessageId: ERROR_RPC_S_NOTHING_TO_EXPORT
! 
!  MessageText:
! 
!   No interfaces have been exported.
! 
integer, parameter, public :: ERROR_RPC_S_NOTHING_TO_EXPORT = 1754

! 
!  MessageId: ERROR_RPC_S_INCOMPLETE_NAME
! 
!  MessageText:
! 
!   The entry name is incomplete.
! 
integer, parameter, public :: ERROR_RPC_S_INCOMPLETE_NAME = 1755

! 
!  MessageId: ERROR_RPC_S_INVALID_VERS_OPTION
! 
!  MessageText:
! 
!   The version option is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_VERS_OPTION = 1756

! 
!  MessageId: ERROR_RPC_S_NO_MORE_MEMBERS
! 
!  MessageText:
! 
!   There are no more members.
! 
integer, parameter, public :: ERROR_RPC_S_NO_MORE_MEMBERS = 1757

! 
!  MessageId: ERROR_RPC_S_NOT_ALL_OBJS_UNEXPORTED
! 
!  MessageText:
! 
!   There is nothing to unexport.
! 
integer, parameter, public :: ERROR_RPC_S_NOT_ALL_OBJS_UNEXPORTED = 1758

! 
!  MessageId: ERROR_RPC_S_INTERFACE_NOT_FOUND
! 
!  MessageText:
! 
!   The interface was not found.
! 
integer, parameter, public :: ERROR_RPC_S_INTERFACE_NOT_FOUND = 1759

! 
!  MessageId: ERROR_RPC_S_ENTRY_ALREADY_EXISTS
! 
!  MessageText:
! 
!   The entry already exists.
! 
integer, parameter, public :: ERROR_RPC_S_ENTRY_ALREADY_EXISTS = 1760

! 
!  MessageId: ERROR_RPC_S_ENTRY_NOT_FOUND
! 
!  MessageText:
! 
!   The entry is not found.
! 
integer, parameter, public :: ERROR_RPC_S_ENTRY_NOT_FOUND = 1761

! 
!  MessageId: ERROR_RPC_S_NAME_SERVICE_UNAVAILABLE
! 
!  MessageText:
! 
!   The name service is unavailable.
! 
integer, parameter, public :: ERROR_RPC_S_NAME_SERVICE_UNAVAILABLE = 1762

! 
!  MessageId: ERROR_RPC_S_INVALID_NAF_ID
! 
!  MessageText:
! 
!   The network address family is invalid.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_NAF_ID = 1763

! 
!  MessageId: ERROR_RPC_S_CANNOT_SUPPORT
! 
!  MessageText:
! 
!   The requested operation is not supported.
! 
integer, parameter, public :: ERROR_RPC_S_CANNOT_SUPPORT = 1764

! 
!  MessageId: ERROR_RPC_S_NO_CONTEXT_AVAILABLE
! 
!  MessageText:
! 
!   No security context is available to allow impersonation.
! 
integer, parameter, public :: ERROR_RPC_S_NO_CONTEXT_AVAILABLE = 1765

! 
!  MessageId: ERROR_RPC_S_INTERNAL_ERROR
! 
!  MessageText:
! 
!   An internal error occurred in a remote procedure call (RPC).
! 
integer, parameter, public :: ERROR_RPC_S_INTERNAL_ERROR = 1766

! 
!  MessageId: ERROR_RPC_S_ZERO_DIVIDE
! 
!  MessageText:
! 
!   The RPC server attempted an integer division by zero.
! 
integer, parameter, public :: ERROR_RPC_S_ZERO_DIVIDE = 1767

! 
!  MessageId: ERROR_RPC_S_ADDRESS_ERROR
! 
!  MessageText:
! 
!   An addressing error occurred in the RPC server.
! 
integer, parameter, public :: ERROR_RPC_S_ADDRESS_ERROR = 1768

! 
!  MessageId: ERROR_RPC_S_FP_DIV_ZERO
! 
!  MessageText:
! 
!   A floating-point operation at the RPC server caused a division by zero.
! 
integer, parameter, public :: ERROR_RPC_S_FP_DIV_ZERO = 1769

! 
!  MessageId: ERROR_RPC_S_FP_UNDERFLOW
! 
!  MessageText:
! 
!   A floating-point underflow occurred at the RPC server.
! 
integer, parameter, public :: ERROR_RPC_S_FP_UNDERFLOW = 1770

! 
!  MessageId: ERROR_RPC_S_FP_OVERFLOW
! 
!  MessageText:
! 
!   A floating-point overflow occurred at the RPC server.
! 
integer, parameter, public :: ERROR_RPC_S_FP_OVERFLOW = 1771

! 
!  MessageId: ERROR_RPC_X_NO_MORE_ENTRIES
! 
!  MessageText:
! 
!   The list of RPC servers available for the binding of auto handles
!   has been exhausted.
! 
integer, parameter, public :: ERROR_RPC_X_NO_MORE_ENTRIES = 1772

! 
!  MessageId: ERROR_RPC_X_SS_CHAR_TRANS_OPEN_FAIL
! 
!  MessageText:
! 
!   Unable to open the character translation table file.
! 
integer, parameter, public :: ERROR_RPC_X_SS_CHAR_TRANS_OPEN_FAIL = 1773

! 
!  MessageId: ERROR_RPC_X_SS_CHAR_TRANS_SHORT_FILE
! 
!  MessageText:
! 
!   The file containing the character translation table has fewer than
!   512 bytes.
! 
integer, parameter, public :: ERROR_RPC_X_SS_CHAR_TRANS_SHORT_FILE = 1774

! 
!  MessageId: ERROR_RPC_X_SS_IN_NULL_CONTEXT
! 
!  MessageText:
! 
!   A null context handle was passed from the client to the host during
!   a remote procedure call.
! 
integer, parameter, public :: ERROR_RPC_X_SS_IN_NULL_CONTEXT = 1775

! 
!  MessageId: ERROR_RPC_X_SS_CONTEXT_DAMAGED
! 
!  MessageText:
! 
!   The context handle changed during a remote procedure call.
! 
integer, parameter, public :: ERROR_RPC_X_SS_CONTEXT_DAMAGED = 1777

! 
!  MessageId: ERROR_RPC_X_SS_HANDLES_MISMATCH
! 
!  MessageText:
! 
!   The binding handles passed to a remote procedure call do not match.
! 
integer, parameter, public :: ERROR_RPC_X_SS_HANDLES_MISMATCH = 1778

! 
!  MessageId: ERROR_RPC_X_SS_CANNOT_GET_CALL_HANDLE
! 
!  MessageText:
! 
!   The stub is unable to get the remote procedure call handle.
! 
integer, parameter, public :: ERROR_RPC_X_SS_CANNOT_GET_CALL_HANDLE = 1779

! 
!  MessageId: ERROR_RPC_X_NULL_REF_POINTER
! 
!  MessageText:
! 
!   A null reference pointer was passed to the stub.
! 
integer, parameter, public :: ERROR_RPC_X_NULL_REF_POINTER = 1780

! 
!  MessageId: ERROR_RPC_X_ENUM_VALUE_OUT_OF_RANGE
! 
!  MessageText:
! 
!   The enumeration value is out of range.
! 
integer, parameter, public :: ERROR_RPC_X_ENUM_VALUE_OUT_OF_RANGE = 1781

! 
!  MessageId: ERROR_RPC_X_BYTE_COUNT_TOO_SMALL
! 
!  MessageText:
! 
!   The byte count is too small.
! 
integer, parameter, public :: ERROR_RPC_X_BYTE_COUNT_TOO_SMALL = 1782

! 
!  MessageId: ERROR_RPC_X_BAD_STUB_DATA
! 
!  MessageText:
! 
!   The stub received bad data.
! 
integer, parameter, public :: ERROR_RPC_X_BAD_STUB_DATA = 1783

! 
!  MessageId: ERROR_INVALID_USER_BUFFER
! 
!  MessageText:
! 
!   The supplied user buffer is not valid for the requested operation.
! 
integer, parameter, public :: ERROR_INVALID_USER_BUFFER = 1784

! 
!  MessageId: ERROR_UNRECOGNIZED_MEDIA
! 
!  MessageText:
! 
!   The disk media is not recognized.  It may not be formatted.
! 
integer, parameter, public :: ERROR_UNRECOGNIZED_MEDIA = 1785

! 
!  MessageId: ERROR_NO_TRUST_LSA_SECRET
! 
!  MessageText:
! 
!   The workstation does not have a trust secret.
! 
integer, parameter, public :: ERROR_NO_TRUST_LSA_SECRET = 1786

! 
!  MessageId: ERROR_NO_TRUST_SAM_ACCOUNT
! 
!  MessageText:
! 
!   The SAM database on the Windows NT Advanced Server does not have a computer
!   account for this workstation trust relationship.
! 
integer, parameter, public :: ERROR_NO_TRUST_SAM_ACCOUNT = 1787

! 
!  MessageId: ERROR_TRUSTED_DOMAIN_FAILURE
! 
!  MessageText:
! 
!   The trust relationship between the primary domain and the trusted
!   domain failed.
! 
integer, parameter, public :: ERROR_TRUSTED_DOMAIN_FAILURE = 1788

! 
!  MessageId: ERROR_TRUSTED_RELATIONSHIP_FAILURE
! 
!  MessageText:
! 
!   The trust relationship between this workstation and the primary
!   domain failed.
! 
integer, parameter, public :: ERROR_TRUSTED_RELATIONSHIP_FAILURE = 1789

! 
!  MessageId: ERROR_TRUST_FAILURE
! 
!  MessageText:
! 
!   The network logon failed.
! 
integer, parameter, public :: ERROR_TRUST_FAILURE = 1790

! 
!  MessageId: ERROR_RPC_S_CALL_IN_PROGRESS
! 
!  MessageText:
! 
!   A remote procedure call is already in progress for this thread.
! 
integer, parameter, public :: ERROR_RPC_S_CALL_IN_PROGRESS = 1791

! 
!  MessageId: ERROR_NETLOGON_NOT_STARTED
! 
!  MessageText:
! 
!   An attempt was made to logon, but the network logon service was not started.
! 
integer, parameter, public :: ERROR_NETLOGON_NOT_STARTED = 1792

! 
!  MessageId: ERROR_ACCOUNT_EXPIRED
! 
!  MessageText:
! 
!   The user's account has expired.
! 
integer, parameter, public :: ERROR_ACCOUNT_EXPIRED = 1793

! 
!  MessageId: ERROR_REDIRECTOR_HAS_OPEN_HANDLES
! 
!  MessageText:
! 
!   The redirector is in use and cannot be unloaded.
! 
integer, parameter, public :: ERROR_REDIRECTOR_HAS_OPEN_HANDLES = 1794

! 
!  MessageId: ERROR_PRINTER_DRIVER_ALREADY_INSTALLED
! 
!  MessageText:
! 
!   The specified printer driver is already installed.
! 
integer, parameter, public :: ERROR_PRINTER_DRV_ALREADY_INSTALLED = 1795

! 
!  MessageId: ERROR_UNKNOWN_PORT
! 
!  MessageText:
! 
!   The specified port is unknown.
! 
integer, parameter, public :: ERROR_UNKNOWN_PORT = 1796

! 
!  MessageId: ERROR_UNKNOWN_PRINTER_DRIVER
! 
!  MessageText:
! 
!   The printer driver is unknown.
! 
integer, parameter, public :: ERROR_UNKNOWN_PRINTER_DRIVER = 1797

! 
!  MessageId: ERROR_UNKNOWN_PRINTPROCESSOR
! 
!  MessageText:
! 
!   The print processor is unknown.
! 
integer, parameter, public :: ERROR_UNKNOWN_PRINTPROCESSOR = 1798

! 
!  MessageId: ERROR_INVALID_SEPARATOR_FILE
! 
!  MessageText:
! 
!   The specified separator file is invalid.
! 
integer, parameter, public :: ERROR_INVALID_SEPARATOR_FILE = 1799

! 
!  MessageId: ERROR_INVALID_PRIORITY
! 
!  MessageText:
! 
!   The specified priority is invalid.
! 
integer, parameter, public :: ERROR_INVALID_PRIORITY = 1800

! 
!  MessageId: ERROR_INVALID_PRINTER_NAME
! 
!  MessageText:
! 
!   The printer name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_PRINTER_NAME = 1801

! 
!  MessageId: ERROR_PRINTER_ALREADY_EXISTS
! 
!  MessageText:
! 
!   The printer already exists.
! 
integer, parameter, public :: ERROR_PRINTER_ALREADY_EXISTS = 1802

! 
!  MessageId: ERROR_INVALID_PRINTER_COMMAND
! 
!  MessageText:
! 
!   The printer command is invalid.
! 
integer, parameter, public :: ERROR_INVALID_PRINTER_COMMAND = 1803

! 
!  MessageId: ERROR_INVALID_DATATYPE
! 
!  MessageText:
! 
!   The specified datatype is invalid.
! 
integer, parameter, public :: ERROR_INVALID_DATATYPE = 1804

! 
!  MessageId: ERROR_INVALID_ENVIRONMENT
! 
!  MessageText:
! 
!   The Environment specified is invalid.
! 
integer, parameter, public :: ERROR_INVALID_ENVIRONMENT = 1805

! 
!  MessageId: ERROR_RPC_S_NO_MORE_BINDINGS
! 
!  MessageText:
! 
!   There are no more bindings.
! 
integer, parameter, public :: ERROR_RPC_S_NO_MORE_BINDINGS = 1806

! 
!  MessageId: ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT
! 
!  MessageText:
! 
!   The account used is an interdomain trust account.  Use your global user account or local user account to access this server.
! 
integer, parameter, public :: ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCT = 1807

! 
!  MessageId: ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT
! 
!  MessageText:
! 
!   The account used is a Computer Account.  Use your global user account or local user account to access this server.
! 
integer, parameter, public :: ERROR_NOLOGON_WORKSTATION_TRUST_ACCT = 1808

! 
!  MessageId: ERROR_NOLOGON_SERVER_TRUST_ACCOUNT
! 
!  MessageText:
! 
!   The account used is an server trust account.  Use your global user account or local user account to access this server.
! 
integer, parameter, public :: ERROR_NOLOGON_SERVER_TRUST_ACCOUNT = 1809

! 
!  MessageId: ERROR_DOMAIN_TRUST_INCONSISTENT
! 
!  MessageText:
! 
!   The name or security ID (SID) of the domain specified is inconsistent
!   with the trust information for that domain.
! 
integer, parameter, public :: ERROR_DOMAIN_TRUST_INCONSISTENT = 1810

! 
!  MessageId: ERROR_SERVER_HAS_OPEN_HANDLES
! 
!  MessageText:
! 
!   The server is in use and cannot be unloaded.
! 
integer, parameter, public :: ERROR_SERVER_HAS_OPEN_HANDLES = 1811

! 
!  MessageId: ERROR_RESOURCE_DATA_NOT_FOUND
! 
!  MessageText:
! 
!   The specified image file did not contain a resource section.
! 
integer, parameter, public :: ERROR_RESOURCE_DATA_NOT_FOUND = 1812

! 
!  MessageId: ERROR_RESOURCE_TYPE_NOT_FOUND
! 
!  MessageText:
! 
!   The specified resource type can not be found in the image file.
! 
integer, parameter, public :: ERROR_RESOURCE_TYPE_NOT_FOUND = 1813

! 
!  MessageId: ERROR_RESOURCE_NAME_NOT_FOUND
! 
!  MessageText:
! 
!   The specified resource name can not be found in the image file.
! 
integer, parameter, public :: ERROR_RESOURCE_NAME_NOT_FOUND = 1814

! 
!  MessageId: ERROR_RESOURCE_LANG_NOT_FOUND
! 
!  MessageText:
! 
!   The specified resource language ID cannot be found in the image file.
! 
integer, parameter, public :: ERROR_RESOURCE_LANG_NOT_FOUND = 1815

! 
!  MessageId: ERROR_NOT_ENOUGH_QUOTA
! 
!  MessageText:
! 
!   Not enough quota is available to process this command.
! 
integer, parameter, public :: ERROR_NOT_ENOUGH_QUOTA = 1816

! 
!  MessageId: ERROR_RPC_S_GROUP_MEMBER_NOT_FOUND
! 
!  MessageText:
! 
!   The group member was not found.
! 
integer, parameter, public :: ERROR_RPC_S_GROUP_MEMBER_NOT_FOUND = 1898

! 
!  MessageId: ERROR_EPT_S_CANT_CREATE
! 
!  MessageText:
! 
!   The endpoint mapper database could not be created.
! 
integer, parameter, public :: ERROR_EPT_S_CANT_CREATE = 1899

! 
!  MessageId: ERROR_RPC_S_INVALID_OBJECT
! 
!  MessageText:
! 
!   The object universal unique identifier (UUID) is the nil UUID.
! 
integer, parameter, public :: ERROR_RPC_S_INVALID_OBJECT = 1900

! 
!  MessageId: ERROR_INVALID_TIME
! 
!  MessageText:
! 
!   The specified time is invalid.
! 
integer, parameter, public :: ERROR_INVALID_TIME = 1901

! 
!  MessageId: ERROR_INVALID_FORM_NAME
! 
!  MessageText:
! 
!   The specified Form name is invalid.
! 
integer, parameter, public :: ERROR_INVALID_FORM_NAME = 1902

! 
!  MessageId: ERROR_INVALID_FORM_SIZE
! 
!  MessageText:
! 
!   The specified Form size is invalid
! 
integer, parameter, public :: ERROR_INVALID_FORM_SIZE = 1903

! 
!  MessageId: ERROR_ALREADY_WAITING
! 
!  MessageText:
! 
!   The specified Printer handle is already being waited on
! 
integer, parameter, public :: ERROR_ALREADY_WAITING = 1904

! 
!  MessageId: ERROR_PRINTER_DELETED
! 
!  MessageText:
! 
!   The specified Printer has been deleted
! 
integer, parameter, public :: ERROR_PRINTER_DELETED = 1905

! 
!  MessageId: ERROR_INVALID_PRINTER_STATE
! 
!  MessageText:
! 
!   The state of the Printer is invalid
! 
integer, parameter, public :: ERROR_INVALID_PRINTER_STATE = 1906

! 
!  MessageId: ERROR_NO_BROWSER_SERVERS_FOUND
! 
!  MessageText:
! 
!   The list of servers for this workgroup is not currently available
! 
integer, parameter, public :: ERROR_NO_BROWSER_SERVERS_FOUND = 6118

!
! MessageId: ERROR_INVALID_PIXEL_FORMAT
!
! MessageText:
!
!  The pixel format is invalid.
!
integer ,parameter, public :: ERROR_INVALID_PIXEL_FORMAT       = 2000

!
! MessageId: ERROR_BAD_DRIVER
!
! MessageText:
!
!  The specified driver is invalid.
!
integer, parameter, public :: ERROR_BAD_DRIVER                 = 2001

!
! MessageId: ERROR_INVALID_WINDOW_STYLE
!
! MessageText:
!
!  The window style or class attribute is invalid for this operation.
!
integer, parameter, public :: ERROR_INVALID_WINDOW_STYLE       = 2002

!
! MessageId: ERROR_METAFILE_NOT_SUPPORTED
!
! MessageText:
!
!  The requested metafile operation is not supported.
!
integer, parameter, public :: ERROR_METAFILE_NOT_SUPPORTED     = 2003

!
! MessageId: ERROR_TRANSFORM_NOT_SUPPORTED
!
! MessageText:
!
!  The requested transformation operation is not supported.
!
integer, parameter, public :: ERROR_TRANSFORM_NOT_SUPPORTED    = 2004

!
! MessageId: ERROR_CLIPPING_NOT_SUPPORTED
!
! MessageText:
!
!  The requested clipping operation is not supported.
!
integer, parameter, public :: ERROR_CLIPPING_NOT_SUPPORTED     = 2005

! End of OpenGL error codes



!!!!!!!!!!!!!!!!!!
!                                !
!     Win32 Spooler Error Codes  !
!                                !
!!!!!!!!!!!!!!!!!!
!
! MessageId: ERROR_UNKNOWN_PRINT_MONITOR
!
! MessageText:
!
!  The specified print monitor is unknown.
!
integer, parameter, public :: ERROR_UNKNOWN_PRINT_MONITOR      = 3000

!
! MessageId: ERROR_PRINTER_DRIVER_IN_USE
!
! MessageText:
!
!  The specified printer driver is currently in use.
!
integer, parameter, public :: ERROR_PRINTER_DRIVER_IN_USE      = 3001

!
! MessageId: ERROR_SPOOL_FILE_NOT_FOUND
!
! MessageText:
!
!  The spool file was not found.
!
integer, parameter, public :: ERROR_SPOOL_FILE_NOT_FOUND       = 3002

!
! MessageId: ERROR_SPL_NO_STARTDOC
!
! MessageText:
!
!  A StartDocPrinter call was not issued.
!
integer, parameter, public :: ERROR_SPL_NO_STARTDOC            = 3003

!
! MessageId: ERROR_SPL_NO_ADDJOB
!
! MessageText:
!
!  An AddJob call was not issued.
!
integer, parameter, public :: ERROR_SPL_NO_ADDJOB              = 3004

!
! MessageId: ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED
!
! MessageText:
!
!  The specified print processor has already been installed.
!
integer, parameter, public :: ERROR_PRINT_PROCESSOR_ALRDY_INSTALLED = 3005

!
! MessageId: ERROR_PRINT_MONITOR_ALREADY_INSTALLED
!
! MessageText:
!
!  The specified print monitor has already been installed.
!
integer, parameter, public :: ERROR_PRINT_MONITOR_ALREADY_INSTALLED = 3006

!!!!!!!!!!!!!!!!!!
!                                !
!     Wins Error Codes           !
!                                !
!!!!!!!!!!!!!!!!!!
!
! MessageId: ERROR_WINS_INTERNAL
!
! MessageText:
!
!  WINS encountered an error while processing the command.
!
integer, parameter, public :: ERROR_WINS_INTERNAL              = 4000

!
! MessageId: ERROR_CAN_NOT_DEL_LOCAL_WINS
!
! MessageText:
!
!  The local WINS can not be deleted.
!
integer, parameter, public :: ERROR_CAN_NOT_DEL_LOCAL_WINS     = 4001

!
! MessageId: ERROR_STATIC_INIT
!
! MessageText:
!
!  The importation from the file failed.
!
integer, parameter, public :: ERROR_STATIC_INIT                = 4002

!
! MessageId: ERROR_INC_BACKUP
!
! MessageText:
!
!  The backup Failed.  Was a full backup done before ?
!
integer, parameter, public :: ERROR_INC_BACKUP                 = 4003

!
! MessageId: ERROR_FULL_BACKUP
!
! MessageText:
!
!  The backup Failed.  Check the directory that you are backing the database to.
!
integer, parameter, public :: ERROR_FULL_BACKUP                = 4004

!
! MessageId: ERROR_REC_NON_EXISTENT
!
! MessageText:
!
!  The name does not exist in the WINS database.
!
integer, parameter, public :: ERROR_REC_NON_EXISTENT           = 4005

!
! MessageId: ERROR_RPL_NOT_ALLOWED
!
! MessageText:
!
!  Replication with a non-configured partner is not allowed.
!
integer, parameter, public :: ERROR_RPL_NOT_ALLOWED            = 4006

!!!!!!!!!!!!!!!!!!
!                                !
!     OLE Error Codes            !
!                                !
!!!!!!!!!!!!!!!!!!

!
! OLE error definitions and values
!
! The return value of OLE APIs and methods is an HRESULT.
! This is not a handle to anything, but is merely a 32-bit value
! with several fields encoded in the value.  The parts of an 
! HRESULT are shown below.  
!
! Many of the macros and functions below were orginally defined to 
! operate on SCODEs.  SCODEs are no longer used.  The macros are 
! still present for compatibility and easy porting of Win16 code.
! Newly written code should use the HRESULT macros and functions.
!

!
!  HRESULTs are 32 bit values layed out as follows:
!
!   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
!   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
!  +-+-+-+-+-+---------------------+-------------------------------+
!  |S|R|C|N|r|    Facility         |               Code            |
!  +-+-+-+-+-+---------------------+-------------------------------+
!
!  where
!
!      S - Severity - indicates success/fail
!
!          0 - Success
!          1 - Fail (COERROR)
!
!      R - reserved portion of the facility code, corresponds to NT's
!              second severity bit.
!
!      C - reserved portion of the facility code, corresponds to NT's
!              C field.
!
!      N - reserved portion of the facility code. Used to indicate a
!              mapped NT status value.
!
!      r - reserved portion of the facility code. Reserved for internal
!              use. Used to indicate HRESULT values that are not status
!              values, but are instead message ids for display strings.
!
!      Facility - is the facility code
!
!      Code - is the facility's status code
!

!
! Severity values
!

integer, parameter, public :: SEVERITY_SUCCESS    = 0
integer, parameter, public :: SEVERITY_ERROR      = 1


!
! Generic test for success on any status value (non-negative numbers
! indicate success).
!
!************************************************************************
!!Following are defined in macro.f90

!!#define SUCCEEDED(Status) ((HRESULT)(Status) >= 0)

!
! and the inverse
!

!!#define FAILED(Status) ((HRESULT)(Status)<0)


!
! Generic test for error on any status value.
!

!!#define IS_ERROR(Status) ((unsigned long)(Status) >> 31 == SEVERITY_ERROR)

!
! Return the code
!

!!#define HRESULT_CODE(hr)    ((hr) & #FFFF)
!!#define SCODE_CODE(sc)      ((sc) & #FFFF)

!
!  Return the facility
!

!!#define HRESULT_FACILITY(hr)  (((hr) >> 16) & #1fff)
!!#define SCODE_FACILITY(sc)    (((sc) >> 16) & #1fff)

!
!  Return the severity
!

!!#define HRESULT_SEVERITY(hr)  (((hr) >> 31) & #1)
!!#define SCODE_SEVERITY(sc)    (((sc) >> 31) & #1)

!
! Create an HRESULT value from component pieces
!

!!#define MAKE_HRESULT(sev,fac,code) \
!!    ((HRESULT) (((unsigned long)(sev)<<31) | ((unsigned long)(fac)<<16) | ((unsigned long)(code))) )
!!#define MAKE_SCODE(sev,fac,code) \
!!    ((SCODE) (((unsigned long)(sev)<<31) | ((unsigned long)(fac)<<16) | ((unsigned long)(code))) )


!
! Map a WIN32 error value into a HRESULT
! Note: This assumes that WIN32 errors fall in the range -32k to 32k.
!
! Define bits here so macros are guaranteed to work

integer, parameter, public :: FACILITY_NT_BIT                 = #10000000
!
!!#define HRESULT_FROM_WIN32(x)   (x ? ((HRESULT) (((x) & #0000FFFF) | (FACILITY_WIN32 << 16) | #80000000)) : 0 )
!
! Map an NT status value into a HRESULT
!
!!#define HRESULT_FROM_NT(x)      ((HRESULT) ((x) | FACILITY_NT_BIT))
! ****** OBSOLETE functions
! HRESULT functions
! As noted above, these functions are obsolete and should not be used.
! Extract the SCODE from a HRESULT
!!#define GetScode(hr) ((SCODE) (hr))
! Convert an SCODE into an HRESULT.
!!#define ResultFromScode(sc) ((HRESULT) (sc))
! PropagateResult is a noop
!!#define PropagateResult(hrPrevious, scBase) ((HRESULT) scBase)
!
!************************************************************************

! ---------------------- HRESULT value definitions -----------------
!
! HRESULT definitions
!
!
! Success codes
!
integer, parameter, public :: S_OK                                   = #00000000
integer, parameter, public :: S_FALSE                                = #00000001


integer, parameter, public :: NOERROR             = S_OK

!
! Error definitions follow
!

!
! Codes #4000-#40ff are reserved for OLE
!
!
! Error codes
!
!
! MessageId: E_UNEXPECTED
!
! MessageText:
!
!  Catastrophic failure
!
integer, parameter, public :: E_UNEXPECTED                     = #8000FFFF

!MS$IF DEFINED (WIN32)
!
! MessageId: E_NOTIMPL
!
! MessageText:
!
!  Not implemented
!
integer, parameter, public :: E_NOTIMPL                        = #80004001

!
! MessageId: E_OUTOFMEMORY
!
! MessageText:
!
!  Ran out of memory
!
integer, parameter, public :: E_OUTOFMEMORY                    = #8007000E

!
! MessageId: E_INVALIDARG
!
! MessageText:
!
!  One or more arguments are invalid
!
integer, parameter, public :: E_INVALIDARG                     = #80070057

!
! MessageId: E_NOINTERFACE
!
! MessageText:
!
!  No such interface supported
!
integer, parameter, public :: E_NOINTERFACE                    = #80004002

!
! MessageId: E_POINTER
!
! MessageText:
!
!  Invalid pointer
!
integer, parameter, public :: E_POINTER                        = #80004003

!
! MessageId: E_HANDLE
!
! MessageText:
!
!  Invalid handle
!
integer, parameter, public :: E_HANDLE                         = #80070006

!
! MessageId: E_ABORT
!
! MessageText:
!
!  Operation aborted
!
integer, parameter, public :: E_ABORT                          = #80004004

!
! MessageId: E_FAIL
!
! MessageText:
!
!  Unspecified error
!
integer, parameter, public :: E_FAIL                           = #80004005

!
! MessageId: E_ACCESSDENIED
!
! MessageText:
!
!  General access denied error
!
integer, parameter, public :: E_ACCESSDENIED                   = #80070005

!MS$ ELSE
!
! MessageId: E_NOTIMPL
!
! MessageText:
!
!  Not implemented
!
integer, parameter, public :: E_NOTIMPL                        = #80000001

!
! MessageId: E_OUTOFMEMORY
!
! MessageText:
!
!  Ran out of memory
!
integer, parameter, public :: E_OUTOFMEMORY                    = #80000002

!
! MessageId: E_INVALIDARG
!
! MessageText:
!
!  One or more arguments are invalid
!
integer, parameter, public :: E_INVALIDARG                     = #80000003

!
! MessageId: E_NOINTERFACE
!
! MessageText:
!
!  No such interface supported
!
integer, parameter, public :: E_NOINTERFACE                    = #80000004

!
! MessageId: E_POINTER
!
! MessageText:
!
!  Invalid pointer
!
integer, parameter, public :: E_POINTER                        = #80000005

!
! MessageId: E_HANDLE
!
! MessageText:
!
!  Invalid handle
!
integer, parameter, public :: E_HANDLE                         = #80000006

!
! MessageId: E_ABORT
!
! MessageText:
!
!  Operation aborted
!
integer, parameter, public :: E_ABORT                          = #80000007

!
! MessageId: E_FAIL
!
! MessageText:
!
!  Unspecified error
!
integer, parameter, public :: E_FAIL                           = #80000008

!
! MessageId: E_ACCESSDENIED
!
! MessageText:
!
!  General access denied error
!
integer, parameter, public :: E_ACCESSDENIED                   = #80000009

!MS$ ENDIF !WIN32
!
! MessageId: CO_E_INIT_TLS
!
! MessageText:
!
!  Thread local storage failure
!
integer, parameter, public :: CO_E_INIT_TLS                    = #80004006

!
! MessageId: CO_E_INIT_SHARED_ALLOCATOR
!
! MessageText:
!
!  Get shared memory allocator failure
!
integer, parameter, public :: CO_E_INIT_SHARED_ALLOCATOR       = #80004007

!
! MessageId: CO_E_INIT_MEMORY_ALLOCATOR
!
! MessageText:
!
!  Get memory allocator failure
!
integer, parameter, public :: CO_E_INIT_MEMORY_ALLOCATOR       = #80004008

!
! MessageId: CO_E_INIT_CLASS_CACHE
!
! MessageText:
!
!  Unable to initialize class cache
!
integer, parameter, public :: CO_E_INIT_CLASS_CACHE            = #80004009

!
! MessageId: CO_E_INIT_RPC_CHANNEL
!
! MessageText:
!
!  Unable to initialize RPC services
!
integer, parameter, public :: CO_E_INIT_RPC_CHANNEL            = #8000400A

!
! MessageId: CO_E_INIT_TLS_SET_CHANNEL_CONTROL
!
! MessageText:
!
!  Cannot set thread local storage channel control
!
integer, parameter, public :: CO_E_INIT_TLS_SET_CHNL_CONTROL = #8000400B

!
! MessageId: CO_E_INIT_TLS_CHANNEL_CONTROL
!
! MessageText:
!
!  Could not allocate thread local storage channel control
!
integer, parameter, public :: CO_E_INIT_TLS_CHNL_CONTROL    = #8000400C

!
! MessageId: CO_E_INIT_UNACCEPTED_USER_ALLOCATOR
!                                               
! MessageText:
!
!  The user supplied memory allocator is unacceptable
!
integer, parameter, public :: CO_E_INIT_UNACCEPTD_USR_ALLCTR = #8000400D

!
! MessageId: CO_E_INIT_SCM_MUTEX_EXISTS
!
! MessageText:
!
!  The OLE service mutex already exists
!
integer, parameter, public :: CO_E_INIT_SCM_MUTEX_EXISTS       = #8000400E

!
! MessageId: CO_E_INIT_SCM_FILE_MAPPING_EXISTS
!
! MessageText:
!
!  The OLE service file mapping already exists
!
integer, parameter, public :: CO_E_INITSCMFILE_MAPING_EXISTS = #8000400F

!
! MessageId: CO_E_INIT_SCM_MAP_VIEW_OF_FILE
!
! MessageText:
!
!  Unable to map view of file for OLE service
!
integer, parameter, public :: CO_E_INIT_SCM_MAP_VIEW_OF_FILE   = #80004010

!
! MessageId: CO_E_INIT_SCM_EXEC_FAILURE
!
! MessageText:
!
!  Failure attempting to launch OLE service
!
integer, parameter, public :: CO_E_INIT_SCM_EXEC_FAILURE       = #80004011

!
! MessageId: CO_E_INIT_ONLY_SINGLE_THREADED
!
! MessageText:
!
!  There was an attempt to call CoInitialize a second time while single threaded
!
integer, parameter, public :: CO_E_INIT_ONLY_SINGLE_THREADED   = #80004012


!
! Success codes
!
!integer, parameter, public :: S_OK                                   = #00000000
!integer, parameter, public :: S_FALSE                                = #00000001

! ******************
! FACILITY_ITF
! ******************

!
! Codes #0-#01ff are reserved for the OLE group of
! interfaces.
!


!
! Generic OLE errors that may be returned by many inerfaces
!

integer, parameter, public :: OLE_E_FIRST = #80040000
integer, parameter, public :: OLE_E_LAST  = #800400FF
integer, parameter, public :: OLE_S_FIRST = #00040000
integer, parameter, public :: OLE_S_LAST  = #000400FF

!
! Old OLE errors
!
!
! MessageId: OLE_E_OLEVERB
!
! MessageText:
!
!  Invalid OLEVERB structure
!
integer, parameter, public :: OLE_E_OLEVERB                    = #80040000

!
! MessageId: OLE_E_ADVF
!
! MessageText:
!
!  Invalid advise flags
!
integer, parameter, public :: OLE_E_ADVF                       = #80040001

!
! MessageId: OLE_E_ENUM_NOMORE
!
! MessageText:
!
!  Can't enumerate any more, because the associated data is missing
!
integer, parameter, public :: OLE_E_ENUM_NOMORE                = #80040002

!
! MessageId: OLE_E_ADVISENOTSUPPORTED
!
! MessageText:
!
!  This implementation doesn't take advises
!
integer, parameter, public :: OLE_E_ADVISENOTSUPPORTED         = #80040003

!
! MessageId: OLE_E_NOCONNECTION
!
! MessageText:
!
!  There is no connection for this connection ID
!
integer, parameter, public :: OLE_E_NOCONNECTION               = #80040004

!
! MessageId: OLE_E_NOTRUNNING
!
! MessageText:
!
!  Need to run the object to perform this operation
!
integer, parameter, public :: OLE_E_NOTRUNNING                 = #80040005

!
! MessageId: OLE_E_NOCACHE
!
! MessageText:
!
!  There is no cache to operate on
!
integer, parameter, public :: OLE_E_NOCACHE                    = #80040006

!
! MessageId: OLE_E_BLANK
!
! MessageText:
!
!  Uninitialized object
!
integer, parameter, public :: OLE_E_BLANK                      = #80040007

!
! MessageId: OLE_E_CLASSDIFF
!
! MessageText:
!
!  Linked object's source class has changed
!
integer, parameter, public :: OLE_E_CLASSDIFF                  = #80040008

!
! MessageId: OLE_E_CANT_GETMONIKER
!
! MessageText:
!
!  Not able to get the moniker of the object
!
integer, parameter, public :: OLE_E_CANT_GETMONIKER            = #80040009

!
! MessageId: OLE_E_CANT_BINDTOSOURCE
!
! MessageText:
!
!  Not able to bind to the source
!
integer, parameter, public :: OLE_E_CANT_BINDTOSOURCE          = #8004000A

!
! MessageId: OLE_E_STATIC
!
! MessageText:
!
!  Object is static; operation not allowed
!
integer, parameter, public :: OLE_E_STATIC                     = #8004000B

!
! MessageId: OLE_E_PROMPTSAVECANCELLED
!
! MessageText:
!
!  User cancelled out of save dialog
!
integer, parameter, public :: OLE_E_PROMPTSAVECANCELLED        = #8004000C

!
! MessageId: OLE_E_INVALIDRECT
!
! MessageText:
!
!  Invalid rectangle
!
integer, parameter, public :: OLE_E_INVALIDRECT                = #8004000D

!
! MessageId: OLE_E_WRONGCOMPOBJ
!
! MessageText:
!
!  compobj.dll is too old for the ole2.dll initialized
!
integer, parameter, public :: OLE_E_WRONGCOMPOBJ               = #8004000E

!
! MessageId: OLE_E_INVALIDHWND
!
! MessageText:
!
!  Invalid window handle
!
integer, parameter, public :: OLE_E_INVALIDHWND                = #8004000F

!
! MessageId: OLE_E_NOT_INPLACEACTIVE
!
! MessageText:
!
!  Object is not in any of the inplace active states
!
integer, parameter, public :: OLE_E_NOT_INPLACEACTIVE          = #80040010

!
! MessageId: OLE_E_CANTCONVERT
!
! MessageText:
!
!  Not able to convert object
!
integer, parameter, public :: OLE_E_CANTCONVERT                = #80040011

!
! MessageId: OLE_E_NOSTORAGE
!
! MessageText:
!
!  Not able to perform the operation because object is not given storage yet
!  
!
integer, parameter, public :: OLE_E_NOSTORAGE                  = #80040012

!
! MessageId: DV_E_FORMATETC
!
! MessageText:
!
!  Invalid FORMATETC structure
!
integer, parameter, public :: DV_E_FORMATETC                   = #80040064

!
! MessageId: DV_E_DVTARGETDEVICE
!
! MessageText:
!
!  Invalid DVTARGETDEVICE structure
!
integer, parameter, public :: DV_E_DVTARGETDEVICE              = #80040065

!
! MessageId: DV_E_STGMEDIUM
!
! MessageText:
!
!  Invalid STDGMEDIUM structure
!
integer, parameter, public :: DV_E_STGMEDIUM                   = #80040066

!
! MessageId: DV_E_STATDATA
!
! MessageText:
!
!  Invalid STATDATA structure
!
integer, parameter, public :: DV_E_STATDATA                    = #80040067

!
! MessageId: DV_E_LINDEX
!
! MessageText:
!
!  Invalid lindex
!
integer, parameter, public :: DV_E_LINDEX                      = #80040068

!
! MessageId: DV_E_TYMED
!
! MessageText:
!
!  Invalid tymed
!
integer, parameter, public :: DV_E_TYMED                       = #80040069

!
! MessageId: DV_E_CLIPFORMAT
!
! MessageText:
!
!  Invalid clipboard format
!
integer, parameter, public :: DV_E_CLIPFORMAT                  = #8004006A

!
! MessageId: DV_E_DVASPECT
!
! MessageText:
!
!  Invalid aspect(s)
!
integer, parameter, public :: DV_E_DVASPECT                    = #8004006B

!
! MessageId: DV_E_DVTARGETDEVICE_SIZE
!
! MessageText:
!
!  tdSize parameter of the DVTARGETDEVICE structure is invalid
!
integer, parameter, public :: DV_E_DVTARGETDEVICE_SIZE         = #8004006C

!
! MessageId: DV_E_NOIVIEWOBJECT
!
! MessageText:
!
!  Object doesn't support IViewObject interface
!
integer, parameter, public :: DV_E_NOIVIEWOBJECT               = #8004006D

integer, parameter, public :: DRAGDROP_E_FIRST                 = #80040100
integer, parameter, public :: DRAGDROP_E_LAST                  = #8004010F
integer, parameter, public :: DRAGDROP_S_FIRST                 = #00040100
integer, parameter, public :: DRAGDROP_S_LAST                  = #0004010F
!
! MessageId: DRAGDROP_E_NOTREGISTERED
!
! MessageText:
!
!  Trying to revoke a drop target that has not been registered
!
integer, parameter, public :: DRAGDROP_E_NOTREGISTERED         = #80040100

!
! MessageId: DRAGDROP_E_ALREADYREGISTERED
!
! MessageText:
!
!  This window has already been registered as a drop target
!
integer, parameter, public :: DRAGDROP_E_ALREADYREGISTERED     = #80040101

!
! MessageId: DRAGDROP_E_INVALIDHWND
!
! MessageText:
!
!  Invalid window handle
!
integer, parameter, public :: DRAGDROP_E_INVALIDHWND           = #80040102

integer, parameter, public :: CLASSFACTORY_E_FIRST             = #80040110
integer, parameter, public :: CLASSFACTORY_E_LAST              = #8004011F
integer, parameter, public :: CLASSFACTORY_S_FIRST             = #00040110
integer, parameter, public :: CLASSFACTORY_S_LAST              = #0004011F
!
! MessageId: CLASS_E_NOAGGREGATION
!
! MessageText:
!
!  Class does not support aggregation (or class object is remote)
!
integer, parameter, public :: CLASS_E_NOAGGREGATION            = #80040110

!
! MessageId: CLASS_E_CLASSNOTAVAILABLE
!
! MessageText:
!
!  ClassFactory cannot supply requested class
!
integer, parameter, public :: CLASS_E_CLASSNOTAVAILABLE        = #80040111

integer, parameter, public :: MARSHAL_E_FIRST  = #80040120
integer, parameter, public :: MARSHAL_E_LAST   = #8004012F
integer, parameter, public :: MARSHAL_S_FIRST  = #00040120
integer, parameter, public :: MARSHAL_S_LAST   = #0004012F
integer, parameter, public :: DATA_E_FIRST     = #80040130
integer, parameter, public :: DATA_E_LAST      = #8004013F
integer, parameter, public :: DATA_S_FIRST     = #00040130
integer, parameter, public :: DATA_S_LAST      = #0004013F
integer, parameter, public :: VIEW_E_FIRST     = #80040140
integer, parameter, public :: VIEW_E_LAST      = #8004014F
integer, parameter, public :: VIEW_S_FIRST     = #00040140
integer, parameter, public :: VIEW_S_LAST      = #0004014F
!
! MessageId: VIEW_E_DRAW
!
! MessageText:
!
!  Error drawing view
!
integer, parameter, public :: VIEW_E_DRAW       = #80040140

integer, parameter, public :: REGDB_E_FIRST     = #80040150
integer, parameter, public :: REGDB_E_LAST      = #8004015F
integer, parameter, public :: REGDB_S_FIRST     = #00040150
integer, parameter, public :: REGDB_S_LAST      = #0004015F
!
! MessageId: REGDB_E_READREGDB
!
! MessageText:
!
!  Could not read key from registry
!
integer, parameter, public :: REGDB_E_READREGDB                = #80040150

!
! MessageId: REGDB_E_WRITEREGDB
!
! MessageText:
!
!  Could not write key to registry
!
integer, parameter, public :: REGDB_E_WRITEREGDB               = #80040151

!
! MessageId: REGDB_E_KEYMISSING
!
! MessageText:
!
!  Could not find the key in the registry
!
integer, parameter, public :: REGDB_E_KEYMISSING               = #80040152

!
! MessageId: REGDB_E_INVALIDVALUE
!
! MessageText:
!
!  Invalid value for registry
!
integer, parameter, public :: REGDB_E_INVALIDVALUE             = #80040153

!
! MessageId: REGDB_E_CLASSNOTREG
!
! MessageText:
!
!  Class not registered
!
integer, parameter, public :: REGDB_E_CLASSNOTREG              = #80040154

!
! MessageId: REGDB_E_IIDNOTREG
!
! MessageText:
!
!  Interface not registered
!
integer, parameter, public :: REGDB_E_IIDNOTREG = #80040155

integer, parameter, public :: CACHE_E_FIRST     = #80040170
integer, parameter, public :: CACHE_E_LAST      = #8004017F
integer, parameter, public :: CACHE_S_FIRST     = #00040170
integer, parameter, public :: CACHE_S_LAST      = #0004017F
!
! MessageId: CACHE_E_NOCACHE_UPDATED
!
! MessageText:
!
!  Cache not updated
!
integer, parameter, public :: CACHE_E_NOCACHE_UPDATED          = #80040170

integer, parameter, public :: OLEOBJ_E_FIRST                   = #80040180
integer, parameter, public :: OLEOBJ_E_LAST                    = #8004018F
integer, parameter, public :: OLEOBJ_S_FIRST                   = #00040180
integer, parameter, public :: OLEOBJ_S_LAST                    = #0004018F
!
! MessageId: OLEOBJ_E_NOVERBS
!
! MessageText:
!
!  No verbs for OLE object
!
integer, parameter, public :: OLEOBJ_E_NOVERBS                 = #80040180

!
! MessageId: OLEOBJ_E_INVALIDVERB
!
! MessageText:
!
!  Invalid verb for OLE object
!
integer, parameter, public :: OLEOBJ_E_INVALIDVERB   = #80040181

integer, parameter, public :: CLIENTSITE_E_FIRST     = #80040190
integer, parameter, public :: CLIENTSITE_E_LAST      = #8004019F
integer, parameter, public :: CLIENTSITE_S_FIRST     = #00040190
integer, parameter, public :: CLIENTSITE_S_LAST      = #0004019F
!
! MessageId: INPLACE_E_NOTUNDOABLE
!
! MessageText:
!
!  Undo is not available
!
integer, parameter, public :: INPLACE_E_NOTUNDOABLE            = #800401A0

!
! MessageId: INPLACE_E_NOTOOLSPACE
!
! MessageText:
!
!  Space for tools is not available
!
integer, parameter, public :: INPLACE_E_NOTOOLSPACE   = #800401A1

integer, parameter, public :: INPLACE_E_FIRST         = #800401A0
integer, parameter, public :: INPLACE_E_LAST          = #800401AF
integer, parameter, public :: INPLACE_S_FIRST         = #000401A0
integer, parameter, public :: INPLACE_S_LAST          = #000401AF
integer, parameter, public :: ENUM_E_FIRST            = #800401B0
integer, parameter, public :: ENUM_E_LAST             = #800401BF
integer, parameter, public :: ENUM_S_FIRST            = #000401B0
integer, parameter, public :: ENUM_S_LAST             = #000401BF
integer, parameter, public :: CONVERT10_E_FIRST       = #800401C0
integer, parameter, public :: CONVERT10_E_LAST        = #800401CF
integer, parameter, public :: CONVERT10_S_FIRST       = #000401C0
integer, parameter, public :: CONVERT10_S_LAST        = #000401CF
!
! MessageId: CONVERT10_E_OLESTREAM_GET
!
! MessageText:
!
!  OLESTREAM Get method failed
!
integer, parameter, public :: CONVERT10_E_OLESTREAM_GET        = #800401C0

!
! MessageId: CONVERT10_E_OLESTREAM_PUT
!
! MessageText:
!
!  OLESTREAM Put method failed
!
integer, parameter, public :: CONVERT10_E_OLESTREAM_PUT        = #800401C1

!
! MessageId: CONVERT10_E_OLESTREAM_FMT
!
! MessageText:
!
!  Contents of the OLESTREAM not in correct format
!
integer, parameter, public :: CONVERT10_E_OLESTREAM_FMT        = #800401C2

!
! MessageId: CONVERT10_E_OLESTREAM_BITMAP_TO_DIB
!
! MessageText:
!
!  There was an error in a Windows GDI call while converting the bitmap to a DIB
!
integer, parameter, public :: CONVERT10_E_OLESTREAM_BMPTODIB = #800401C3

!
! MessageId: CONVERT10_E_STG_FMT
!
! MessageText:
!
!  Contents of the IStorage not in correct format
!
integer, parameter, public :: CONVERT10_E_STG_FMT              = #800401C4

!
! MessageId: CONVERT10_E_STG_NO_STD_STREAM
!
! MessageText:
!
!  Contents of IStorage is missing one of the standard streams
!
integer, parameter, public :: CONVERT10_E_STG_NO_STD_STREAM    = #800401C5

!
! MessageId: CONVERT10_E_STG_DIB_TO_BITMAP
!
! MessageText:
!
!  There was an error in a Windows GDI call while converting the DIB to a bitmap.
!  
!
integer, parameter, public :: CONVERT10_E_STG_DIB_TO_BITMAP    = #800401C6

integer, parameter, public :: CLIPBRD_E_FIRST                  = #800401D0
integer, parameter, public :: CLIPBRD_E_LAST                   = #800401DF
integer, parameter, public :: CLIPBRD_S_FIRST                  = #000401D0
integer, parameter, public :: CLIPBRD_S_LAST                   = #000401DF
!
! MessageId: CLIPBRD_E_CANT_OPEN
!
! MessageText:
!
!  OpenClipboard Failed
!
integer, parameter, public :: CLIPBRD_E_CANT_OPEN              = #800401D0

!
! MessageId: CLIPBRD_E_CANT_EMPTY
!
! MessageText:
!
!  EmptyClipboard Failed
!
integer, parameter, public :: CLIPBRD_E_CANT_EMPTY             = #800401D1

!
! MessageId: CLIPBRD_E_CANT_SET
!
! MessageText:
!
!  SetClipboard Failed
!
integer, parameter, public :: CLIPBRD_E_CANT_SET               = #800401D2

!
! MessageId: CLIPBRD_E_BAD_DATA
!
! MessageText:
!
!  Data on clipboard is invalid
!
integer, parameter, public :: CLIPBRD_E_BAD_DATA               = #800401D3

!
! MessageId: CLIPBRD_E_CANT_CLOSE
!
! MessageText:
!
!  CloseClipboard Failed
!
integer, parameter, public :: CLIPBRD_E_CANT_CLOSE = #800401D4

integer, parameter, public :: MK_E_FIRST           = #800401E0
integer, parameter, public :: MK_E_LAST            = #800401EF
integer, parameter, public :: MK_S_FIRST           = #000401E0
integer, parameter, public :: MK_S_LAST            = #000401EF
!
! MessageId: MK_E_CONNECTMANUALLY
!
! MessageText:
!
!  Moniker needs to be connected manually
!
integer, parameter, public :: MK_E_CONNECTMANUALLY             = #800401E0

!
! MessageId: MK_E_EXCEEDEDDEADLINE
!
! MessageText:
!
!  Operation exceeded deadline
!
integer, parameter, public :: MK_E_EXCEEDEDDEADLINE            = #800401E1

!
! MessageId: MK_E_NEEDGENERIC
!
! MessageText:
!
!  Moniker needs to be generic
!
integer, parameter, public :: MK_E_NEEDGENERIC                 = #800401E2

!
! MessageId: MK_E_UNAVAILABLE
!
! MessageText:
!
!  Operation unavailable
!
integer, parameter, public :: MK_E_UNAVAILABLE                 = #800401E3

!
! MessageId: MK_E_SYNTAX
!
! MessageText:
!
!  Invalid syntax
!
integer, parameter, public :: MK_E_SYNTAX                      = #800401E4

!
! MessageId: MK_E_NOOBJECT
!
! MessageText:
!
!  No object for moniker
!
integer, parameter, public :: MK_E_NOOBJECT                    = #800401E5

!
! MessageId: MK_E_INVALIDEXTENSION
!
! MessageText:
!
!  Bad extension for file
!
integer, parameter, public :: MK_E_INVALIDEXTENSION            = #800401E6

!
! MessageId: MK_E_INTERMEDIATEINTERFACENOTSUPPORTED
!
! MessageText:
!
!  Intermediate operation failed
!
integer, parameter, public :: MK_E_INTERMEDIATE_IF_NOT_SPRTD = #800401E7

!
! MessageId: MK_E_NOTBINDABLE
!
! MessageText:
!
!  Moniker is not bindable
!
integer, parameter, public :: MK_E_NOTBINDABLE                 = #800401E8

!
! MessageId: MK_E_NOTBOUND
!
! MessageText:
!
!  Moniker is not bound
!
integer, parameter, public :: MK_E_NOTBOUND                    = #800401E9

!
! MessageId: MK_E_CANTOPENFILE
!
! MessageText:
!
!  Moniker cannot open file
!
integer, parameter, public :: MK_E_CANTOPENFILE                = #800401EA

!
! MessageId: MK_E_MUSTBOTHERUSER
!
! MessageText:
!
!  User input required for operation to succeed
!
integer, parameter, public :: MK_E_MUSTBOTHERUSER              = #800401EB

!
! MessageId: MK_E_NOINVERSE
!
! MessageText:
!
!  Moniker class has no inverse
!
integer, parameter, public :: MK_E_NOINVERSE                   = #800401EC

!
! MessageId: MK_E_NOSTORAGE
!
! MessageText:
!
!  Moniker does not refer to storage
!
integer, parameter, public :: MK_E_NOSTORAGE                   = #800401ED

!
! MessageId: MK_E_NOPREFIX
!
! MessageText:
!
!  No common prefix
!
integer, parameter, public :: MK_E_NOPREFIX                    = #800401EE

!
! MessageId: MK_E_ENUMERATION_FAILED
!
! MessageText:
!
!  Moniker could not be enumerated
!
integer, parameter, public :: MK_E_ENUMERATION_FAILED    = #800401EF

integer, parameter, public :: CO_E_FIRST                 = #800401F0
integer, parameter, public :: CO_E_LAST                  = #800401FF
integer, parameter, public :: CO_S_FIRST                 = #000401F0
integer, parameter, public :: CO_S_LAST                  = #000401FF
!
! MessageId: CO_E_NOTINITIALIZED
!
! MessageText:
!
!  CoInitialize has not been called.
!
integer, parameter, public :: CO_E_NOTINITIALIZED              = #800401F0

!
! MessageId: CO_E_ALREADYINITIALIZED
!
! MessageText:
!
!  CoInitialize has already been called.
!
integer, parameter, public :: CO_E_ALREADYINITIALIZED          = #800401F1

!
! MessageId: CO_E_CANTDETERMINECLASS
!
! MessageText:
!
!  Class of object cannot be determined
!
integer, parameter, public :: CO_E_CANTDETERMINECLASS          = #800401F2

!
! MessageId: CO_E_CLASSSTRING
!
! MessageText:
!
!  Invalid class string
!
integer, parameter, public :: CO_E_CLASSSTRING                 = #800401F3

!
! MessageId: CO_E_IIDSTRING
!
! MessageText:
!
!  Invalid interface string
!
integer, parameter, public :: CO_E_IIDSTRING                   = #800401F4

!
! MessageId: CO_E_APPNOTFOUND
!
! MessageText:
!
!  Application not found
!
integer, parameter, public :: CO_E_APPNOTFOUND                 = #800401F5

!
! MessageId: CO_E_APPSINGLEUSE
!
! MessageText:
!
!  Application cannot be run more than once
!
integer, parameter, public :: CO_E_APPSINGLEUSE                = #800401F6

!
! MessageId: CO_E_ERRORINAPP
!
! MessageText:
!
!  Some error in application program
!
integer, parameter, public :: CO_E_ERRORINAPP                  = #800401F7

!
! MessageId: CO_E_DLLNOTFOUND
!
! MessageText:
!
!  DLL for class not found
!
integer, parameter, public :: CO_E_DLLNOTFOUND                 = #800401F8

!
! MessageId: CO_E_ERRORINDLL
!
! MessageText:
!
!  Error in the DLL
!
integer, parameter, public :: CO_E_ERRORINDLL                  = #800401F9

!
! MessageId: CO_E_WRONGOSFORAPP
!
! MessageText:
!
!  Wrong OS or OS version for application
!
integer, parameter, public :: CO_E_WRONGOSFORAPP               = #800401FA

!
! MessageId: CO_E_OBJNOTREG
!
! MessageText:
!
!  Object is not registered
!
integer, parameter, public :: CO_E_OBJNOTREG                   = #800401FB

!
! MessageId: CO_E_OBJISREG
!
! MessageText:
!
!  Object is already registered
!
integer, parameter, public :: CO_E_OBJISREG                    = #800401FC

!
! MessageId: CO_E_OBJNOTCONNECTED
!
! MessageText:
!
!  Object is not connected to server
!
integer, parameter, public :: CO_E_OBJNOTCONNECTED             = #800401FD

!
! MessageId: CO_E_APPDIDNTREG
!
! MessageText:
!
!  Application was launched but it didn't register a class factory
!
integer, parameter, public :: CO_E_APPDIDNTREG                 = #800401FE

!
! MessageId: CO_E_RELEASED
!
! MessageText:
!
!  Object has been released
!
integer, parameter, public :: CO_E_RELEASED                    = #800401FF

!
! Old OLE Success Codes
!
!
! MessageId: OLE_S_USEREG
!
! MessageText:
!
!  Use the registry database to provide the requested information
!
integer, parameter, public :: OLE_S_USEREG                     = #00040000

!
! MessageId: OLE_S_STATIC
!
! MessageText:
!
!  Success, but static
!
integer, parameter, public :: OLE_S_STATIC                     = #00040001

!
! MessageId: OLE_S_MAC_CLIPFORMAT
!
! MessageText:
!
!  Macintosh clipboard format
!
integer, parameter, public :: OLE_S_MAC_CLIPFORMAT             = #00040002

!
! MessageId: DRAGDROP_S_DROP
!
! MessageText:
!
!  Successful drop took place
!
integer, parameter, public :: DRAGDROP_S_DROP                  = #00040100

!
! MessageId: DRAGDROP_S_CANCEL
!
! MessageText:
!
!  Drag-drop operation canceled
!
integer, parameter, public :: DRAGDROP_S_CANCEL                = #00040101

!
! MessageId: DRAGDROP_S_USEDEFAULTCURSORS
!
! MessageText:
!
!  Use the default cursor
!
integer, parameter, public :: DRAGDROP_S_USEDEFAULTCURSORS     = #00040102

!
! MessageId: DATA_S_SAMEFORMATETC
!
! MessageText:
!
!  Data has same FORMATETC
!
integer, parameter, public :: DATA_S_SAMEFORMATETC             = #00040130

!
! MessageId: VIEW_S_ALREADY_FROZEN
!
! MessageText:
!
!  View is already frozen
!
integer, parameter, public :: VIEW_S_ALREADY_FROZEN            = #00040140

!
! MessageId: CACHE_S_FORMATETC_NOTSUPPORTED
!
! MessageText:
!
!  FORMATETC not supported
!
integer, parameter, public :: CACHE_S_FORMATETC_NOTSUPPORTED   = #00040170

!
! MessageId: CACHE_S_SAMECACHE
!
! MessageText:
!
!  Same cache
!
integer, parameter, public :: CACHE_S_SAMECACHE                = #00040171

!
! MessageId: CACHE_S_SOMECACHES_NOTUPDATED
!
! MessageText:
!
!  Some cache(s) not updated
!
integer, parameter, public :: CACHE_S_SOMECACHES_NOTUPDATED    = #00040172

!
! MessageId: OLEOBJ_S_INVALIDVERB
!
! MessageText:
!
!  Invalid verb for OLE object
!
integer, parameter, public :: OLEOBJ_S_INVALIDVERB             = #00040180

!
! MessageId: OLEOBJ_S_CANNOT_DOVERB_NOW
!
! MessageText:
!
!  Verb number is valid but verb cannot be done now
!
integer, parameter, public :: OLEOBJ_S_CANNOT_DOVERB_NOW       = #00040181

!
! MessageId: OLEOBJ_S_INVALIDHWND
!
! MessageText:
!
!  Invalid window handle passed
!
integer, parameter, public :: OLEOBJ_S_INVALIDHWND             = #00040182

!
! MessageId: INPLACE_S_TRUNCATED
!
! MessageText:
!
!  Message is too long; some of it had to be truncated before displaying
!
integer, parameter, public :: INPLACE_S_TRUNCATED              = #000401A0

!
! MessageId: CONVERT10_S_NO_PRESENTATION
!
! MessageText:
!
!  Unable to convert OLESTREAM to IStorage
!
integer, parameter, public :: CONVERT10_S_NO_PRESENTATION      = #000401C0

!
! MessageId: MK_S_REDUCED_TO_SELF
!
! MessageText:
!
!  Moniker reduced to itself
!
integer, parameter, public :: MK_S_REDUCED_TO_SELF             = #000401E2

!
! MessageId: MK_S_ME
!
! MessageText:
!
!  Common prefix is this moniker
!
integer, parameter, public :: MK_S_ME                          = #000401E4

!
! MessageId: MK_S_HIM
!
! MessageText:
!
!  Common prefix is input moniker
!
integer, parameter, public :: MK_S_HIM                         = #000401E5

!
! MessageId: MK_S_US
!
! MessageText:
!
!  Common prefix is both monikers
!
integer, parameter, public :: MK_S_US                          = #000401E6

!
! MessageId: MK_S_MONIKERALREADYREGISTERED
!
! MessageText:
!
!  Moniker is already registered in running object table
!
integer, parameter, public :: MK_S_MONIKERALREADYREGISTERED    = #000401E7

! ******************
! FACILITY_WINDOWS
! ******************
!
! Codes #0-#01ff are reserved for the OLE group of
! interfaces.
!
!
! MessageId: CO_E_CLASS_CREATE_FAILED
!
! MessageText:
!
!  Attempt to create a class object failed
!
integer, parameter, public :: CO_E_CLASS_CREATE_FAILED         = #80080001

!
! MessageId: CO_E_SCM_ERROR
!
! MessageText:
!
!  OLE service could not bind object
!
integer, parameter, public :: CO_E_SCM_ERROR                   = #80080002

!
! MessageId: CO_E_SCM_RPC_FAILURE
!
! MessageText:
!
!  RPC communication failed with OLE service
!
integer, parameter, public :: CO_E_SCM_RPC_FAILURE             = #80080003

!
! MessageId: CO_E_BAD_PATH
!
! MessageText:
!
!  Bad path to object
!
integer, parameter, public :: CO_E_BAD_PATH                    = #80080004

!
! MessageId: CO_E_SERVER_EXEC_FAILURE
!
! MessageText:
!
!  Server execution failed
!
integer, parameter, public :: CO_E_SERVER_EXEC_FAILURE         = #80080005

!
! MessageId: CO_E_OBJSRV_RPC_FAILURE
!
! MessageText:
!
!  OLE service could not communicate with the object server
!
integer, parameter, public :: CO_E_OBJSRV_RPC_FAILURE          = #80080006

!
! MessageId: MK_E_NO_NORMALIZED
!
! MessageText:
!
!  Moniker path could not be normalized
!
integer, parameter, public :: MK_E_NO_NORMALIZED               = #80080007

!
! MessageId: CO_E_SERVER_STOPPING
!
! MessageText:
!
!  Object server is stopping when OLE service contacts it
!
integer, parameter, public :: CO_E_SERVER_STOPPING             = #80080008

!
! MessageId: MEM_E_INVALID_ROOT
!
! MessageText:
!
!  An invalid root block pointer was specified
!
integer, parameter, public :: MEM_E_INVALID_ROOT               = #80080009

!
! MessageId: MEM_E_INVALID_LINK
!
! MessageText:
!
!  An allocation chain contained an invalid link pointer
!
integer, parameter, public :: MEM_E_INVALID_LINK               = #80080010

!
! MessageId: MEM_E_INVALID_SIZE
!
! MessageText:
!
!  The requested allocation size was too large
!
integer, parameter, public :: MEM_E_INVALID_SIZE               = #80080011

! ******************
! FACILITY_DISPATCH
! ******************
!
! MessageId: DISP_E_UNKNOWNINTERFACE
!
! MessageText:
!
!  Unknown interface.
!
integer, parameter, public :: DISP_E_UNKNOWNINTERFACE          = #80020001

!
! MessageId: DISP_E_MEMBERNOTFOUND
!
! MessageText:
!
!  Member not found.
!
integer, parameter, public :: DISP_E_MEMBERNOTFOUND            = #80020003

!
! MessageId: DISP_E_PARAMNOTFOUND
!
! MessageText:
!
!  Parameter not found.
!
integer, parameter, public :: DISP_E_PARAMNOTFOUND             = #80020004

!
! MessageId: DISP_E_TYPEMISMATCH
!
! MessageText:
!
!  Type mismatch.
!
integer, parameter, public :: DISP_E_TYPEMISMATCH              = #80020005

!
! MessageId: DISP_E_UNKNOWNNAME
!
! MessageText:
!
!  Unknown name.
!
integer, parameter, public :: DISP_E_UNKNOWNNAME               = #80020006

!
! MessageId: DISP_E_NONAMEDARGS
!
! MessageText:
!
!  No named arguments.
!
integer, parameter, public :: DISP_E_NONAMEDARGS               = #80020007

!
! MessageId: DISP_E_BADVARTYPE
!
! MessageText:
!
!  Bad variable type.
!
integer, parameter, public :: DISP_E_BADVARTYPE                = #80020008

!
! MessageId: DISP_E_EXCEPTION
!
! MessageText:
!
!  Exception occurred.
!
integer, parameter, public :: DISP_E_EXCEPTION                 = #80020009

!
! MessageId: DISP_E_OVERFLOW
!
! MessageText:
!
!  Out of present range.
!
integer, parameter, public :: DISP_E_OVERFLOW                  = #8002000A

!
! MessageId: DISP_E_BADINDEX
!
! MessageText:
!
!  Invalid index.
!
integer, parameter, public :: DISP_E_BADINDEX                  = #8002000B

!
! MessageId: DISP_E_UNKNOWNLCID
!
! MessageText:
!
!  Unknown language.
!
integer, parameter, public :: DISP_E_UNKNOWNLCID               = #8002000C

!
! MessageId: DISP_E_ARRAYISLOCKED
!
! MessageText:
!
!  Memory is locked.
!
integer, parameter, public :: DISP_E_ARRAYISLOCKED             = #8002000D

!
! MessageId: DISP_E_BADPARAMCOUNT
!
! MessageText:
!
!  Invalid number of parameters.
!
integer, parameter, public :: DISP_E_BADPARAMCOUNT             = #8002000E

!
! MessageId: DISP_E_PARAMNOTOPTIONAL
!
! MessageText:
!
!  Parameter not optional.
!
integer, parameter, public :: DISP_E_PARAMNOTOPTIONAL          = #8002000F

!
! MessageId: DISP_E_BADCALLEE
!
! MessageText:
!
!  Invalid callee.
!
integer, parameter, public :: DISP_E_BADCALLEE                 = #80020010

!
! MessageId: DISP_E_NOTACOLLECTION
!
! MessageText:
!
!  Does not support a collection.
!
integer, parameter, public :: DISP_E_NOTACOLLECTION            = #80020011

!
! MessageId: TYPE_E_BUFFERTOOSMALL
!
! MessageText:
!
!  Buffer too small.
!
integer, parameter, public :: TYPE_E_BUFFERTOOSMALL            = #80028016

!
! MessageId: TYPE_E_INVDATAREAD
!
! MessageText:
!
!  Old format or invalid type library.
!
integer, parameter, public :: TYPE_E_INVDATAREAD               = #80028018

!
! MessageId: TYPE_E_UNSUPFORMAT
!
! MessageText:
!
!  Old format or invalid type library.
!
integer, parameter, public :: TYPE_E_UNSUPFORMAT               = #80028019

!
! MessageId: TYPE_E_REGISTRYACCESS
!
! MessageText:
!
!  Error accessing the OLE registry.
!
integer, parameter, public :: TYPE_E_REGISTRYACCESS            = #8002801C

!
! MessageId: TYPE_E_LIBNOTREGISTERED
!
! MessageText:
!
!  Library not registered.
!
integer, parameter, public :: TYPE_E_LIBNOTREGISTERED          = #8002801D

!
! MessageId: TYPE_E_UNDEFINEDTYPE
!
! MessageText:
!
!  Bound to unknown type.
!
integer, parameter, public :: TYPE_E_UNDEFINEDTYPE             = #80028027

!
! MessageId: TYPE_E_QUALIFIEDNAMEDISALLOWED
!
! MessageText:
!
!  Qualified name disallowed.
!
integer, parameter, public :: TYPE_E_QUALIFIEDNAMEDISALLOWED   = #80028028

!
! MessageId: TYPE_E_INVALIDSTATE
!
! MessageText:
!
!  Invalid forward reference, or reference to uncompiled type.
!
integer, parameter, public :: TYPE_E_INVALIDSTATE              = #80028029

!
! MessageId: TYPE_E_WRONGTYPEKIND
!
! MessageText:
!
!  Type mismatch.
!
integer, parameter, public :: TYPE_E_WRONGTYPEKIND             = #8002802A

!
! MessageId: TYPE_E_ELEMENTNOTFOUND
!
! MessageText:
!
!  Element not found.
!
integer, parameter, public :: TYPE_E_ELEMENTNOTFOUND           = #8002802B

!
! MessageId: TYPE_E_AMBIGUOUSNAME
!
! MessageText:
!
!  Ambiguous name.
!
integer, parameter, public :: TYPE_E_AMBIGUOUSNAME             = #8002802C

!
! MessageId: TYPE_E_NAMECONFLICT
!
! MessageText:
!
!  Name already exists in the library.
!
integer, parameter, public :: TYPE_E_NAMECONFLICT              = #8002802D

!
! MessageId: TYPE_E_UNKNOWNLCID
!
! MessageText:
!
!  Unknown LCID.
!
integer, parameter, public :: TYPE_E_UNKNOWNLCID               = #8002802E

!
! MessageId: TYPE_E_DLLFUNCTIONNOTFOUND
!
! MessageText:
!
!  Function not defined in specified DLL.
!
integer, parameter, public :: TYPE_E_DLLFUNCTIONNOTFOUND       = #8002802F

!
! MessageId: TYPE_E_BADMODULEKIND
!
! MessageText:
!
!  Wrong module kind for the operation.
!
integer, parameter, public :: TYPE_E_BADMODULEKIND             = #800288BD

!
! MessageId: TYPE_E_SIZETOOBIG
!
! MessageText:
!
!  Size may not exceed 64K.
!
integer, parameter, public :: TYPE_E_SIZETOOBIG                = #800288C5

!
! MessageId: TYPE_E_DUPLICATEID
!
! MessageText:
!
!  Duplicate ID in inheritance hierarchy.
!
integer, parameter, public :: TYPE_E_DUPLICATEID               = #800288C6

!
! MessageId: TYPE_E_INVALIDID
!
! MessageText:
!
!  Incorrect inheritance depth in standard OLE hmember.
!
integer, parameter, public :: TYPE_E_INVALIDID                 = #800288CF

!
! MessageId: TYPE_E_TYPEMISMATCH
!
! MessageText:
!
!  Type mismatch.
!
integer, parameter, public :: TYPE_E_TYPEMISMATCH              = #80028CA0

!
! MessageId: TYPE_E_OUTOFBOUNDS
!
! MessageText:
!
!  Invalid number of arguments.
!
integer, parameter, public :: TYPE_E_OUTOFBOUNDS               = #80028CA1

!
! MessageId: TYPE_E_IOERROR
!
! MessageText:
!
!  I/O Error.
!
integer, parameter, public :: TYPE_E_IOERROR                   = #80028CA2

!
! MessageId: TYPE_E_CANTCREATETMPFILE
!
! MessageText:
!
!  Error creating unique tmp file.
!
integer, parameter, public :: TYPE_E_CANTCREATETMPFILE         = #80028CA3

!
! MessageId: TYPE_E_CANTLOADLIBRARY
!
! MessageText:
!
!  Error loading type library/DLL.
!
integer, parameter, public :: TYPE_E_CANTLOADLIBRARY           = #80029C4A

!
! MessageId: TYPE_E_INCONSISTENTPROPFUNCS
!
! MessageText:
!
!  Inconsistent property functions.
!
integer, parameter, public :: TYPE_E_INCONSISTENTPROPFUNCS     = #80029C83

!
! MessageId: TYPE_E_CIRCULARTYPE
!
! MessageText:
!
!  Circular dependency between types/modules.
!
integer, parameter, public :: TYPE_E_CIRCULARTYPE              = #80029C84

! ******************
! FACILITY_STORAGE
! ******************
!
! MessageId: STG_E_INVALIDFUNCTION
!
! MessageText:
!
!  Unable to perform requested operation.
!
integer, parameter, public :: STG_E_INVALIDFUNCTION            = #80030001

!
! MessageId: STG_E_FILENOTFOUND
!
! MessageText:
!
!  %s could not be found.
!
integer, parameter, public :: STG_E_FILENOTFOUND               = #80030002

!
! MessageId: STG_E_PATHNOTFOUND
!
! MessageText:
!
!  The path %s could not be found.
!
integer, parameter, public :: STG_E_PATHNOTFOUND               = #80030003

!
! MessageId: STG_E_TOOMANYOPENFILES
!
! MessageText:
!
!  There are insufficient resources to open another file.
!
integer, parameter, public :: STG_E_TOOMANYOPENFILES           = #80030004

!
! MessageId: STG_E_ACCESSDENIED
!
! MessageText:
!
!  Access Denied.
!
integer, parameter, public :: STG_E_ACCESSDENIED               = #80030005

!
! MessageId: STG_E_INVALIDHANDLE
!
! MessageText:
!
!  Attempted an operation on an invalid object.
!
integer, parameter, public :: STG_E_INVALIDHANDLE              = #80030006

!
! MessageId: STG_E_INSUFFICIENTMEMORY
!
! MessageText:
!
!  There is insufficient memory available to complete operation.
!
integer, parameter, public :: STG_E_INSUFFICIENTMEMORY         = #80030008

!
! MessageId: STG_E_INVALIDPOINTER
!
! MessageText:
!
!  Invalid pointer error.
!
integer, parameter, public :: STG_E_INVALIDPOINTER             = #80030009

!
! MessageId: STG_E_NOMOREFILES
!
! MessageText:
!
!  There are no more entries to return.
!
integer, parameter, public :: STG_E_NOMOREFILES                = #80030012

!
! MessageId: STG_E_DISKISWRITEPROTECTED
!
! MessageText:
!
!  Disk is write-protected.
!
integer, parameter, public :: STG_E_DISKISWRITEPROTECTED       = #80030013

!
! MessageId: STG_E_SEEKERROR
!
! MessageText:
!
!  An error occurred during a seek operation.
!
integer, parameter, public :: STG_E_SEEKERROR                  = #80030019

!
! MessageId: STG_E_WRITEFAULT
!
! MessageText:
!
!  A disk error occurred during a write operation.
!
integer, parameter, public :: STG_E_WRITEFAULT                 = #8003001D

!
! MessageId: STG_E_READFAULT
!
! MessageText:
!
!  A disk error occurred during a read operation.
!
integer, parameter, public :: STG_E_READFAULT                  = #8003001E

!
! MessageId: STG_E_SHAREVIOLATION
!
! MessageText:
!
!  A share violation has occurred.
!
integer, parameter, public :: STG_E_SHAREVIOLATION             = #80030020

!
! MessageId: STG_E_LOCKVIOLATION
!
! MessageText:
!
!  A lock violation has occurred.
!
integer, parameter, public :: STG_E_LOCKVIOLATION              = #80030021

!
! MessageId: STG_E_FILEALREADYEXISTS
!
! MessageText:
!
!  %s already exists.
!
integer, parameter, public :: STG_E_FILEALREADYEXISTS          = #80030050

!
! MessageId: STG_E_INVALIDPARAMETER
!
! MessageText:
!
!  Invalid parameter error.
!
integer, parameter, public :: STG_E_INVALIDPARAMETER           = #80030057

!
! MessageId: STG_E_MEDIUMFULL
!
! MessageText:
!
!  There is insufficient disk space to complete operation.
!
integer, parameter, public :: STG_E_MEDIUMFULL                 = #80030070

!
! MessageId: STG_E_ABNORMALAPIEXIT
!
! MessageText:
!
!  An API call exited abnormally.
!
integer, parameter, public :: STG_E_ABNORMALAPIEXIT            = #800300FA

!
! MessageId: STG_E_INVALIDHEADER
!
! MessageText:
!
!  The file %s is not a valid compound file.
!
integer, parameter, public :: STG_E_INVALIDHEADER              = #800300FB

!
! MessageId: STG_E_INVALIDNAME
!
! MessageText:
!
!  The name %s is not valid.
!
integer, parameter, public :: STG_E_INVALIDNAME                = #800300FC

!
! MessageId: STG_E_UNKNOWN
!
! MessageText:
!
!  An unexpected error occurred.
!
integer, parameter, public :: STG_E_UNKNOWN                    = #800300FD

!
! MessageId: STG_E_UNIMPLEMENTEDFUNCTION
!
! MessageText:
!
!  That function is not implemented.
!
integer, parameter, public :: STG_E_UNIMPLEMENTEDFUNCTION      = #800300FE

!
! MessageId: STG_E_INVALIDFLAG
!
! MessageText:
!
!  Invalid flag error.
!
integer, parameter, public :: STG_E_INVALIDFLAG                = #800300FF

!
! MessageId: STG_E_INUSE
!
! MessageText:
!
!  Attempted to use an object that is busy.
!
integer, parameter, public :: STG_E_INUSE                      = #80030100

!
! MessageId: STG_E_NOTCURRENT
!
! MessageText:
!
!  The storage has been changed since the last commit.
!
integer, parameter, public :: STG_E_NOTCURRENT                 = #80030101

!
! MessageId: STG_E_REVERTED
!
! MessageText:
!
!  Attempted to use an object that has ceased to exist.
!
integer, parameter, public :: STG_E_REVERTED                   = #80030102

!
! MessageId: STG_E_CANTSAVE
!
! MessageText:
!
!  Can't save.
!
integer, parameter, public :: STG_E_CANTSAVE                   = #80030103

!
! MessageId: STG_E_OLDFORMAT
!
! MessageText:
!
!  The compound file %s was produced with an incompatible version of storage.
!
integer, parameter, public :: STG_E_OLDFORMAT                  = #80030104

!
! MessageId: STG_E_OLDDLL
!
! MessageText:
!
!  The compound file %s was produced with a newer version of storage.
!
integer, parameter, public :: STG_E_OLDDLL                     = #80030105

!
! MessageId: STG_E_SHAREREQUIRED
!
! MessageText:
!
!  Share.exe or equivalent is required for operation.
!
integer, parameter, public :: STG_E_SHAREREQUIRED              = #80030106

!
! MessageId: STG_E_NOTFILEBASEDSTORAGE
!
! MessageText:
!
!  Illegal operation called on non-file based storage.
!
integer, parameter, public :: STG_E_NOTFILEBASEDSTORAGE        = #80030107

!
! MessageId: STG_E_EXTANTMARSHALLINGS
!
! MessageText:
!
!  Illegal operation called on object with extant marshallings.
!
integer, parameter, public :: STG_E_EXTANTMARSHALLINGS         = #80030108

!
! MessageId: STG_S_CONVERTED
!
! MessageText:
!
!  The underlying file was converted to compound file format.
!
integer, parameter, public :: STG_S_CONVERTED                  = #00030200

! ******************
! FACILITY_RPC
! ******************
!
! Codes #0-#11 are propogated from 16 bit OLE.
!
!
! MessageId: RPC_E_CALL_REJECTED
!
! MessageText:
!
!  Call was rejected by callee.
!
integer, parameter, public :: RPC_E_CALL_REJECTED              = #80010001

!
! MessageId: RPC_E_CALL_CANCELED
!
! MessageText:
!
!  Call was canceled by the message filter.
!
integer, parameter, public :: RPC_E_CALL_CANCELED              = #80010002

!
! MessageId: RPC_E_CANTPOST_INSENDCALL
!
! MessageText:
!
!  The caller is dispatching an intertask SendMessage call and
!  cannot call out via PostMessage.
!
integer, parameter, public :: RPC_E_CANTPOST_INSENDCALL        = #80010003

!
! MessageId: RPC_E_CANTCALLOUT_INASYNCCALL
!
! MessageText:
!
!  The caller is dispatching an asynchronous call and cannot
!  make an outgoing call on behalf of this call.
!
integer, parameter, public :: RPC_E_CANTCALLOUT_INASYNCCALL    = #80010004

!
! MessageId: RPC_E_CANTCALLOUT_INEXTERNALCALL
!
! MessageText:
!
!  It is illegal to call out while inside message filter.
!
integer, parameter, public :: RPC_E_CANTCALLOUT_INEXTCALL = #80010005

!
! MessageId: RPC_E_CONNECTION_TERMINATED
!
! MessageText:
!
!  The connection terminated or is in a bogus state
!  and cannot be used any more. Other connections
!  are still valid.
!
integer, parameter, public :: RPC_E_CONNECTION_TERMINATED      = #80010006

!
! MessageId: RPC_E_SERVER_DIED
!
! MessageText:
!
!  The callee (server [not server application]) is not available
!  and disappeared; all connections are invalid.  The call may
!  have executed.
!
integer, parameter, public :: RPC_E_SERVER_DIED                = #80010007

!
! MessageId: RPC_E_CLIENT_DIED
!
! MessageText:
!
!  The caller (client) disappeared while the callee (server) was
!  processing a call.
!
integer, parameter, public :: RPC_E_CLIENT_DIED                = #80010008

!
! MessageId: RPC_E_INVALID_DATAPACKET
!
! MessageText:
!
!  The data packet with the marshalled parameter data is incorrect.
!
integer, parameter, public :: RPC_E_INVALID_DATAPACKET         = #80010009

!
! MessageId: RPC_E_CANTTRANSMIT_CALL
!
! MessageText:
!
!  The call was not transmitted properly; the message queue
!  was full and was not emptied after yielding.
!
integer, parameter, public :: RPC_E_CANTTRANSMIT_CALL          = #8001000A

!
! MessageId: RPC_E_CLIENT_CANTMARSHAL_DATA
!
! MessageText:
!
!  The client (caller) cannot marshall the parameter data - low memory, etc.
!
integer, parameter, public :: RPC_E_CLIENT_CANTMARSHAL_DATA    = #8001000B

!
! MessageId: RPC_E_CLIENT_CANTUNMARSHAL_DATA
!
! MessageText:
!
!  The client (caller) cannot unmarshall the return data - low memory, etc.
!
integer, parameter, public :: RPC_E_CLIENT_CANTUNMARSHAL_DATA  = #8001000C

!
! MessageId: RPC_E_SERVER_CANTMARSHAL_DATA
!
! MessageText:
!
!  The server (callee) cannot marshall the return data - low memory, etc.
!
integer, parameter, public :: RPC_E_SERVER_CANTMARSHAL_DATA    = #8001000D

!
! MessageId: RPC_E_SERVER_CANTUNMARSHAL_DATA
!
! MessageText:
!
!  The server (callee) cannot unmarshall the parameter data - low memory, etc.
!
integer, parameter, public :: RPC_E_SERVER_CANTUNMARSHAL_DATA  = #8001000E

!
! MessageId: RPC_E_INVALID_DATA
!
! MessageText:
!
!  Received data is invalid; could be server or client data.
!
integer, parameter, public :: RPC_E_INVALID_DATA               = #8001000F

!
! MessageId: RPC_E_INVALID_PARAMETER
!
! MessageText:
!
!  A particular parameter is invalid and cannot be (un)marshalled.
!
integer, parameter, public :: RPC_E_INVALID_PARAMETER          = #80010010

!
! MessageId: RPC_E_CANTCALLOUT_AGAIN
!
! MessageText:
!
!  There is no second outgoing call on same channel in DDE conversation.
!
integer, parameter, public :: RPC_E_CANTCALLOUT_AGAIN          = #80010011

!
! MessageId: RPC_E_SERVER_DIED_DNE
!
! MessageText:
!
!  The callee (server [not server application]) is not available
!  and disappeared; all connections are invalid.  The call did not execute.
!
integer, parameter, public :: RPC_E_SERVER_DIED_DNE            = #80010012

!
! MessageId: RPC_E_SYS_CALL_FAILED
!
! MessageText:
!
!  System call failed.
!
integer, parameter, public :: RPC_E_SYS_CALL_FAILED            = #80010100

!
! MessageId: RPC_E_OUT_OF_RESOURCES
!
! MessageText:
!
!  Could not allocate some required resource (memory, events, ...)
!
integer, parameter, public :: RPC_E_OUT_OF_RESOURCES           = #80010101

!
! MessageId: RPC_E_ATTEMPTED_MULTITHREAD
!
! MessageText:
!
!  Attempted to make calls on more than one thread in single threaded mode.
!
integer, parameter, public :: RPC_E_ATTEMPTED_MULTITHREAD      = #80010102

!
! MessageId: RPC_E_NOT_REGISTERED
!
! MessageText:
!
!  The requested interface is not registered on the server object.
!
integer, parameter, public :: RPC_E_NOT_REGISTERED             = #80010103

!
! MessageId: RPC_E_FAULT
!
! MessageText:
!
!  RPC could not call the server or could not return the results of calling the server.
!
integer, parameter, public :: RPC_E_FAULT                      = #80010104

!
! MessageId: RPC_E_SERVERFAULT
!
! MessageText:
!
!  The server threw an exception.
!
integer, parameter, public :: RPC_E_SERVERFAULT                = #80010105

!
! MessageId: RPC_E_CHANGED_MODE
!
! MessageText:
!
!  Cannot change thread mode after it is set.
!
integer, parameter, public :: RPC_E_CHANGED_MODE               = #80010106

!
! MessageId: RPC_E_INVALIDMETHOD
!
! MessageText:
!
!  The method called does not exist on the server.
!
integer, parameter, public :: RPC_E_INVALIDMETHOD              = #80010107

!
! MessageId: RPC_E_DISCONNECTED
!
! MessageText:
!
!  The object invoked has disconnected from its clients.
!
integer, parameter, public :: RPC_E_DISCONNECTED               = #80010108

!
! MessageId: RPC_E_RETRY
!
! MessageText:
!
!  The object invoked chose not to process the call now.  Try again later.
!
integer, parameter, public :: RPC_E_RETRY                      = #80010109

!
! MessageId: RPC_E_SERVERCALL_RETRYLATER
!
! MessageText:
!
!  The message filter indicated that the application is busy.
!
integer, parameter, public :: RPC_E_SERVERCALL_RETRYLATER      = #8001010A

!
! MessageId: RPC_E_SERVERCALL_REJECTED
!
! MessageText:
!
!  The message filter rejected the call.
!
integer, parameter, public :: RPC_E_SERVERCALL_REJECTED        = #8001010B

!
! MessageId: RPC_E_INVALID_CALLDATA
!
! MessageText:
!
!  A call control interfaces was called with invalid data.
!
integer, parameter, public :: RPC_E_INVALID_CALLDATA           = #8001010C

!
! MessageId: RPC_E_CANTCALLOUT_ININPUTSYNCCALL
!
! MessageText:
!
!  An outgoing call cannot be made since the application is dispatching an input-synchronous call.
!
integer, parameter, public :: RPC_E_CANTCALLOUT_INIPSYNCCALL = #8001010D

!
! MessageId: RPC_E_WRONG_THREAD
!
! MessageText:
!
!  The application called an interface that was marshalled for a different thread.
!
integer, parameter, public :: RPC_E_WRONG_THREAD               = #8001010E

!
! MessageId: RPC_E_THREAD_NOT_INIT
!
! MessageText:
!
!  CoInitialize has not been called on the current thread.
!
integer, parameter, public :: RPC_E_THREAD_NOT_INIT            = #8001010F

!
! MessageId: RPC_E_UNEXPECTED
!
! MessageText:
!
!  An internal error occurred.
!
integer, parameter, public :: RPC_E_UNEXPECTED                 = #8001FFFF


!                       ******WINBASE********
! 
!  * Compatability macros
!  
!

!#define DefineHandleTable(w)            ((w),TRUE)
!#define LimitEmsPages(dw)
!#define SetSwapAreaSize(w)              (w)
!#define LockSegment(w)                  GlobalFix((HANDLE)(w))
!#define UnlockSegment(w)                GlobalUnfix((HANDLE)(w))
!#define GetCurrentTime()                GetTickCount()

!#define Yield()

integer, parameter, public :: INVALID_HANDLE_VALUE = -1
integer, parameter, public :: INVALID_FILE_SIZE    = #FFFFFFFF

integer, parameter, public :: FILE_BEGIN     =  0
integer, parameter, public :: FILE_CURRENT   =  1
integer, parameter, public :: FILE_END       =  2

integer, parameter, public :: TIME_ZONE_ID_INVALID = -1 ! 0xFFFFFFFF

integer, parameter, public :: WAIT_FAILED           =  -1 ! 0xFFFFFFFF
integer, parameter, public :: WAIT_OBJECT_0         = ((STATUS_WAIT_0 ) + 0 )

integer, parameter, public :: WAIT_ABANDONED       = ((STATUS_ABANDONED_WAIT_0 ) + 0 )
integer, parameter, public :: WAIT_ABANDONED_0     = ((STATUS_ABANDONED_WAIT_0 ) + 0 )

integer, parameter, public :: WAIT_TIMEOUT                          = STATUS_TIMEOUT
integer, parameter, public :: WAIT_IO_COMPLETION                    = STATUS_USER_APC
integer, parameter, public :: STILL_ACTIVE                          = STATUS_PENDING
integer, parameter, public :: EXCEPTION_ACCESS_VIOLATION            = STATUS_ACCESS_VIOLATION
integer, parameter, public :: EXCEPTION_DATATYPE_MISALIGNMENT       = STATUS_DATATYPE_MISALIGNMENT
integer, parameter, public :: EXCEPTION_BREAKPOINT                  = STATUS_BREAKPOINT
integer, parameter, public :: EXCEPTION_SINGLE_STEP                 = STATUS_SINGLE_STEP
integer, parameter, public :: EXCEPTION_ARRAY_BOUNDS_EXCEEDED       = STATUS_ARRAY_BOUNDS_EXCEEDED
integer, parameter, public :: EXCEPTION_FLT_DENORMAL_OPERAND        = STATUS_FLOAT_DENORMAL_OPERAND
integer, parameter, public :: EXCEPTION_FLT_DIVIDE_BY_ZERO          = STATUS_FLOAT_DIVIDE_BY_ZERO
integer, parameter, public :: EXCEPTION_FLT_INEXACT_RESULT          = STATUS_FLOAT_INEXACT_RESULT
integer, parameter, public :: EXCEPTION_FLT_INVALID_OPERATION       = STATUS_FLOAT_INVALID_OPERATION
integer, parameter, public :: EXCEPTION_FLT_OVERFLOW                = STATUS_FLOAT_OVERFLOW
integer, parameter, public :: EXCEPTION_FLT_STACK_CHECK             = STATUS_FLOAT_STACK_CHECK
integer, parameter, public :: EXCEPTION_FLT_UNDERFLOW               = STATUS_FLOAT_UNDERFLOW
integer, parameter, public :: EXCEPTION_INT_DIVIDE_BY_ZERO          = STATUS_INTEGER_DIVIDE_BY_ZERO
integer, parameter, public :: EXCEPTION_INT_OVERFLOW                = STATUS_INTEGER_OVERFLOW
integer, parameter, public :: EXCEPTION_PRIV_INSTRUCTION            = STATUS_PRIVILEGED_INSTRUCTION
integer, parameter, public :: EXCEPTION_IN_PAGE_ERROR               = STATUS_IN_PAGE_ERROR
integer, parameter, public :: EXCEPTION_ILLEGAL_INSTRUCTION         = STATUS_ILLEGAL_INSTRUCTION
integer, parameter, public :: EXCEPTION_NONCONTINUABLE_EXCPTN       = STATUS_NONCONTINUABLE_EXCEPTION
integer, parameter, public :: EXCEPTION_STACK_OVERFLOW              = STATUS_STACK_OVERFLOW
integer, parameter, public :: EXCEPTION_INVALID_DISPOSITION         = STATUS_INVALID_DISPOSITION
! **************************************************************************
! This has been moved to STMT.F90
!
!integer, parameter, public :: EXCEPTION_GUARD_PAGE    = STATUS_GUARD_PAGE_VIOLATION
! **************************************************************************
integer, parameter, public :: CONTROL_C_EXIT          = STATUS_CONTROL_C_EXIT

! 
!  File creation flags must start at the high end since they
!  are combined with the attributes
! 

integer, parameter, public :: FILE_FLAG_WRITE_THROUGH    =  #80000000
integer, parameter, public :: FILE_FLAG_OVERLAPPED       =  #40000000
integer, parameter, public :: FILE_FLAG_NO_BUFFERING     =  #20000000
integer, parameter, public :: FILE_FLAG_RANDOM_ACCESS    =  #10000000
integer, parameter, public :: FILE_FLAG_SEQUENTIAL_SCAN  =  #08000000
integer, parameter, public :: FILE_FLAG_DELETE_ON_CLOSE  =  #04000000
integer, parameter, public :: FILE_FLAG_BACKUP_SEMANTICS =  #02000000
integer, parameter, public :: FILE_FLAG_POSIX_SEMANTICS  =  #01000000

integer, parameter, public :: CREATE_NEW        = 1
integer, parameter, public :: CREATE_ALWAYS     = 2
integer, parameter, public :: OPEN_EXISTING     = 3
integer, parameter, public :: OPEN_ALWAYS       = 4
integer, parameter, public :: TRUNCATE_EXISTING = 5

! 
!  Define the NamedPipe definitions
! 


! 
!  Define the dwOpenMode values for CreateNamedPipe
! 

integer, parameter, public :: PIPE_ACCESS_INBOUND  =  #00000001
integer, parameter, public :: PIPE_ACCESS_OUTBOUND =  #00000002
integer, parameter, public :: PIPE_ACCESS_DUPLEX   =  #00000003

! 
!  Define the Named Pipe End flags for GetNamedPipeInfo
! 

integer, parameter, public :: PIPE_CLIENT_END =  #00000000
integer, parameter, public :: PIPE_SERVER_END =  #00000001

! 
!  Define the dwPipeMode values for CreateNamedPipe
! 

integer, parameter, public :: PIPE_WAIT               =  #00000000
integer, parameter, public :: PIPE_NOWAIT             =  #00000001
integer, parameter, public :: PIPE_READMODE_BYTE      =  #00000000
integer, parameter, public :: PIPE_READMODE_MESSAGE   =  #00000002
integer, parameter, public :: PIPE_TYPE_BYTE          =  #00000000
integer, parameter, public :: PIPE_TYPE_MESSAGE       =  #00000004

! 
!  Define the well known values for CreateNamedPipe nMaxInstances
! 

integer, parameter, public :: PIPE_UNLIMITED_INSTANCES = 255

! 
!  Define the Security Quality of Service bits to be passed
!  into CreateFile
! ************************************************************************
! These definitions have been moved to STMT.F90  
!
!integer, parameter, public :: SECURITY_ANONYMOUS          = ISHIFT( SecurityAnonymous, 16 )
!integer, parameter, public :: SECURITY_IDENTIFICATION     = ISHIFT( SecurityIdentification, 16 )
!integer, parameter, public :: SECURITY_IMPERSONATION      = ISHIFT( SecurityImpersonation, 16 )
!integer, parameter, public :: SECURITY_DELEGATION         = ISHIFT( SecurityDelegation, 16 )
! ************************************************************************

integer, parameter, public :: SECURITY_CONTEXT_TRACKING  =  #00040000
integer, parameter, public :: SECURITY_EFFECTIVE_ONLY    =  #00080000

integer, parameter, public :: SECURITY_SQOS_PRESENT      =  #00100000
integer, parameter, public :: SECURITY_VALID_SQOS_FLAGS  =  #001F0000

! 
!   File structures
! 

type  T_OVERLAPPED
    integer Internal 
    integer InternalHigh 
    integer Offset 
    integer OffsetHigh 
    integer hEvent 
end type  T_OVERLAPPED

type(T_OVERLAPPED), pointer :: null_overlapped

type  T_SECURITY_ATTRIBUTES
    integer(4)    nLength 
    integer(4)    lpSecurityDescriptor 
    logical(4)    bInheritHandle 
end type  T_SECURITY_ATTRIBUTES

type(T_SECURITY_ATTRIBUTES), pointer :: null_security_attributes

type  T_PROCESS_INFORMATION
    integer hProcess 
    integer hThread 
    integer dwProcessId 
    integer dwThreadId 
end type  T_PROCESS_INFORMATION

type(T_PROCESS_INFORMATION), pointer :: null_process_information

! 
!   File System time stamps are represented with the following structure:
! 

type  T_FILETIME
    integer dwLowDateTime 
    integer dwHighDateTime 
end type  T_FILETIME

type(T_FILETIME), pointer :: null_filetime

! 
!  System time is represented with the following structure:
! 

!MS$PACK:1
type  T_SYSTEMTIME
   integer(2)  wYear 
   integer(2)  wMonth 
   integer(2)  wDayOfWeek 
   integer(2)  wDay 
   integer(2)  wHour 
   integer(2)  wMinute 
   integer(2)  wSecond 
   integer(2)  wMilliseconds 
end type  T_SYSTEMTIME
!MS$PACK:

integer, parameter, public :: MUTEX_MODIFY_STATE = MUTANT_QUERY_STATE
! ************************************************************************
! This definition has been moved to STMT.F90
!
!integer, parameter, public :: MUTEX_ALL_ACCESS = MUTANT_ALL_ACCESS
! ************************************************************************

! 
!  Serial provider type.
! 

integer, parameter, public :: SP_SERIALCOMM    =  #00000001

! 
!  Provider SubTypes
! 

integer, parameter, public :: PST_UNSPECIFIED      = ( #00000000)
integer, parameter, public :: PST_RS232            = ( #00000001)
integer, parameter, public :: PST_PARALLELPORT     = ( #00000002)
integer, parameter, public :: PST_RS422            = ( #00000003)
integer, parameter, public :: PST_RS423            = ( #00000004)
integer, parameter, public :: PST_RS449            = ( #00000005)
integer, parameter, public :: PST_MODEM            = ( #00000006)
integer, parameter, public :: PST_FAX              = ( #00000021)
integer, parameter, public :: PST_SCANNER          = ( #00000022)
integer, parameter, public :: PST_NETWORK_BRIDGE   = ( #00000100)
integer, parameter, public :: PST_LAT              = ( #00000101)
integer, parameter, public :: PST_TCPIP_TELNET     = ( #00000102)
integer, parameter, public :: PST_X25              = ( #00000103)


! 
!  Provider capabilities flags.
! 

integer, parameter, public :: PCF_DTRDSR        = ( #0001)
integer, parameter, public :: PCF_RTSCTS        = ( #0002)
integer, parameter, public :: PCF_RLSD          = ( #0004)
integer, parameter, public :: PCF_PARITY_CHECK  = ( #0008)
integer, parameter, public :: PCF_XONXOFF       = ( #0010)
integer, parameter, public :: PCF_SETXCHAR      = ( #0020)
integer, parameter, public :: PCF_TOTALTIMEOUTS = ( #0040)
integer, parameter, public :: PCF_INTTIMEOUTS   = ( #0080)
integer, parameter, public :: PCF_SPECIALCHARS  = ( #0100)
integer, parameter, public :: PCF_16BITMODE     = ( #0200)

! 
!  Comm provider settable parameters.
! 

integer, parameter, public :: SP_PARITY         = ( #0001)
integer, parameter, public :: SP_BAUD           = ( #0002)
integer, parameter, public :: SP_DATABITS       = ( #0004)
integer, parameter, public :: SP_STOPBITS       = ( #0008)
integer, parameter, public :: SP_HANDSHAKING    = ( #0010)
integer, parameter, public :: SP_PARITY_CHECK   = ( #0020)
integer, parameter, public :: SP_RLSD           = ( #0040)

! 
!  Settable baud rates in the provider.
! 

integer, parameter, public :: BAUD_075          = ( #00000001)
integer, parameter, public :: BAUD_110          = ( #00000002)
integer, parameter, public :: BAUD_134_5        = ( #00000004)
integer, parameter, public :: BAUD_150          = ( #00000008)
integer, parameter, public :: BAUD_300          = ( #00000010)
integer, parameter, public :: BAUD_600          = ( #00000020)
integer, parameter, public :: BAUD_1200         = ( #00000040)
integer, parameter, public :: BAUD_1800         = ( #00000080)
integer, parameter, public :: BAUD_2400         = ( #00000100)
integer, parameter, public :: BAUD_4800         = ( #00000200)
integer, parameter, public :: BAUD_7200         = ( #00000400)
integer, parameter, public :: BAUD_9600         = ( #00000800)
integer, parameter, public :: BAUD_14400        = ( #00001000)
integer, parameter, public :: BAUD_19200        = ( #00002000)
integer, parameter, public :: BAUD_38400        = ( #00004000)
integer, parameter, public :: BAUD_56K          = ( #00008000)
integer, parameter, public :: BAUD_128K         = ( #00010000)
integer, parameter, public :: BAUD_115200       = ( #00020000)
integer, parameter, public :: BAUD_57600        = ( #00040000)
integer, parameter, public :: BAUD_USER         = ( #10000000)

! 
!  Settable Data Bits
! 

integer(2), parameter, public :: DATABITS_5        = (#0001)
integer(2), parameter, public :: DATABITS_6        = (#0002)
integer(2), parameter, public :: DATABITS_7        = (#0004)
integer(2), parameter, public :: DATABITS_8        = (#0008)
integer(2), parameter, public :: DATABITS_16       = (#0010)
integer(2), parameter, public :: DATABITS_16X      = (#0020)

! 
!  Settable Stop and Parity bits.
! 

integer(2), parameter, public :: STOPBITS_10       = (#0001)
integer(2), parameter, public :: STOPBITS_15       = (#0002)
integer(2), parameter, public :: STOPBITS_20       = (#0004)
integer(2), parameter, public :: PARITY_NONE       = (#0100)
integer(2), parameter, public :: PARITY_ODD        = (#0200)
integer(2), parameter, public :: PARITY_EVEN       = (#0400)
integer(2), parameter, public :: PARITY_MARK       = (#0800)
integer(2), parameter, public :: PARITY_SPACE      = (#1000)


type  T_COMSTAT
   integer(4)  Bits
! ************************************************************************
! These bits can be accessed using functions defined in BITSFUNC.F90
!
!    fCtsHold  : 1 
!    fDsrHold  : 1 
!    fRlsdHold : 1 
!    fXoffHold : 1 
!    fXoffSent : 1 
!    fEof      : 1 
!    fTxim     : 1 
!    fReserved : 25 
! ************************************************************************

    integer cbInQue 
    integer cbOutQue 
end type  T_COMSTAT

! 
!  DTR Control Flow Values.
! 
integer, parameter, public :: DTR_CONTROL_DISABLE     =  #00
integer, parameter, public :: DTR_CONTROL_ENABLE      =  #01
integer, parameter, public :: DTR_CONTROL_HANDSHAKE   =  #02

! 
!  RTS Control Flow Values
! 
integer, parameter, public :: RTS_CONTROL_DISABLE     =  #00
integer, parameter, public :: RTS_CONTROL_ENABLE      =  #01
integer, parameter, public :: RTS_CONTROL_HANDSHAKE   =  #02
integer, parameter, public :: RTS_CONTROL_TOGGLE      =  #03

type  T_DCB
    integer DCBlength               !  sizeof(T_DCB)                       
    integer BaudRate                !  Baudrate at which running         
    integer(4) Bits
! ************************************************************************
! These bits can be accessed using functions defined in BITSFUNC.F90
!
!    fBinary : 1             !  Binary Mode (skip EOF check)      
!    fParity : 1             !  Enable parity checking            
!    fOutxCtsFlow :1         !  CTS handshaking on output         
!    fOutxDsrFlow :1         !  DSR handshaking on output         
!    fDtrControl :2          !  DTR Flow control                  
!    fDsrSensitivity :1      !  DSR Sensitivity                
!    fTXContinueOnXoff : 1   !  Continue TX when Xoff sent   
!    fOutX : 1               !  Enable output X-ON/X-OFF          
!    fInX : 1                !  Enable input X-ON/X-OFF           
!    fErrorChar : 1          !  Enable Err Replacement            
!    fNull : 1               !  Enable Null stripping             
!    fRtsControl :2          !  Rts Flow control                  
!    fAbortOnError :1        !  Abort all reads and writes on Error   
!    fDummy2 :17             !  Reserved                          
! ************************************************************************
    integer(2) wReserved     !  Not currently used                
    integer(2) XonLim        !  Transmit X-ON threshold           
    integer(2) XoffLim       !  Transmit X-OFF threshold          
    BYTE       ByteSize      !  Number of bits/byte, 4-8          
    BYTE       Parity        !  0-4=None,Odd,Even,Mark,Space      
    BYTE       StopBits      !  0,1,2 = 1, 1.5, 2                 
    character*1 XonChar      !  Tx and Rx X-ON character          
    character*1 XoffChar     !  Tx and Rx X-OFF character         
    character*1 ErrorChar    !  Error replacement char            
    character*1 EofChar      !  End of Input character            
    character*1 EvtChar      !  Recieved Event character          
    integer(2) wReserved1   
end type  T_DCB

TYPE  T_COMMTIMEOUTS
    integer ReadIntervalTimeout            !  Maximum time between read chars.   
    integer ReadTotalTimeoutMultiplier     !  Multiplier of characters.          
    integer ReadTotalTimeoutConstant       !  Constant in milliseconds.          
    integer WriteTotalTimeoutMultiplier    !  Multiplier of characters.          
    integer WriteTotalTimeoutConstant      !  Constant in milliseconds.          
END TYPE  T_COMMTIMEOUTS

type  T_SYSTEM_INFO
    integer dwOemId 
    integer dwPageSize 
    integer lpMinimumApplicationAddress 
    integer lpMaximumApplicationAddress 
    integer dwActiveProcessorMask 
    integer dwNumberOfProcessors 
    integer dwProcessorType 
    integer dwAllocationGranularity 
    integer dwReserved 
end type  T_SYSTEM_INFO


!   Global Memory Flags   
integer, parameter, public :: GMEM_FIXED           =  #0000
integer, parameter, public :: GMEM_MOVEABLE        =  #0002
integer, parameter, public :: GMEM_NOCOMPACT       =  #0010
integer, parameter, public :: GMEM_NODISCARD       =  #0020
integer, parameter, public :: GMEM_ZEROINIT        =  #0040
integer, parameter, public :: GMEM_MODIFY          =  #0080
integer, parameter, public :: GMEM_DISCARDABLE     =  #0100
integer, parameter, public :: GMEM_NOT_BANKED      =  #1000
integer, parameter, public :: GMEM_SHARE           =  #2000
integer, parameter, public :: GMEM_DDESHARE        =  #2000
integer, parameter, public :: GMEM_NOTIFY          =  #4000
integer, parameter, public :: GMEM_LOWER           = GMEM_NOT_BANKED
integer, parameter, public :: GMEM_VALID_FLAGS     =  #7F72
integer, parameter, public :: GMEM_INVALID_HANDLE  =  #8000

! ***********************************************************************
! These definition have been moved to STMT.F90
!
!integer, parameter, public :: GHND  = IOR(GMEM_MOVEABLE, GMEM_ZEROINIT)
!integer, parameter, public :: GPTR  = IOR(GMEM_FIXED, GMEM_ZEROINIT)
! ***********************************************************************

!   Flags returned by GlobalFlags (in addition to GMEM_DISCARDABLE)   
integer, parameter, public :: GMEM_DISCARDED =  #4000
integer, parameter, public :: GMEM_LOCKCOUNT =  #00FF

type  T_MEMORYSTATUS
    integer dwLength 
    integer dwMemoryLoad 
    integer dwTotalPhys 
    integer dwAvailPhys 
    integer dwTotalPageFile 
    integer dwAvailPageFile 
    integer dwTotalVirtual 
    integer dwAvailVirtual 
end type  T_MEMORYSTATUS

!   Local Memory Flags   
integer, parameter, public :: LMEM_FIXED =  #0000
integer, parameter, public :: LMEM_MOVEABLE        =  #0002
integer, parameter, public :: LMEM_NOCOMPACT       =  #0010
integer, parameter, public :: LMEM_NODISCARD       =  #0020
integer, parameter, public :: LMEM_ZEROINIT        =  #0040
integer, parameter, public :: LMEM_MODIFY          =  #0080
integer, parameter, public :: LMEM_DISCARDABLE     =  #0F00
integer, parameter, public :: LMEM_VALID_FLAGS     =  #0F72
integer, parameter, public :: LMEM_INVALID_HANDLE  =  #8000

! ************************************************************************
! These definitions have been moved to STMT.F90
!
!integer, parameter, public :: LHND  = IOR(LMEM_MOVEABLE, LMEM_ZEROINIT)
!integer, parameter, public :: LPTR  = IOR(LMEM_FIXED, LMEM_ZEROINIT)
! ************************************************************************

integer, parameter, public :: NONZEROLHND = (LMEM_MOVEABLE)
integer, parameter, public :: NONZEROLPTR = (LMEM_FIXED)


!   Flags returned by LocalFlags (in addition to LMEM_DISCARDABLE)   
integer, parameter, public :: LMEM_DISCARDED =  #4000
integer, parameter, public :: LMEM_LOCKCOUNT =  #00FF

! 
!  dwCreationFlag values
! 

integer, parameter, public :: DEBUG_PROCESS           =  #00000001
integer, parameter, public :: DEBUG_ONLY_THIS_PROCESS =  #00000002

integer, parameter, public :: CREATE_SUSPENDED        =  #00000004

integer, parameter, public :: DETACHED_PROCESS        =  #00000008

integer, parameter, public :: CREATE_NEW_CONSOLE      =  #00000010

integer, parameter, public :: NORMAL_PRIORITY_CLASS   =  #00000020
integer, parameter, public :: IDLE_PRIORITY_CLASS     =  #00000040
integer, parameter, public :: HIGH_PRIORITY_CLASS     =  #00000080
integer, parameter, public :: REALTIME_PRIORITY_CLASS =  #00000100

integer, parameter, public :: CREATE_NEW_PROCESS_GROUP   = #00000200

integer, parameter, public :: CREATE_SEPARATE_WOW_VDM    = #00000800

integer, parameter, public :: CREATE_DEFAULT_ERROR_MODE  = #04000000
integer, parameter, public :: CREATE_NO_WINDOW        =  #08000000


integer, parameter, public :: THREAD_PRIORITY_LOWEST = THREAD_BASE_PRIORITY_MIN
integer, parameter, public :: THREAD_PRIORITY_BELOW_NORMAL    = (THREAD_PRIORITY_LOWEST+1)
integer, parameter, public :: THREAD_PRIORITY_NORMAL = 0
integer, parameter, public :: THREAD_PRIORITY_HIGHEST = THREAD_BASE_PRIORITY_MAX
integer, parameter, public :: THREAD_PRIORITY_ABOVE_NORMAL    = (THREAD_PRIORITY_HIGHEST-1)
integer, parameter, public :: THREAD_PRIORITY_ERROR_RETURN    = (MAXLONG)

integer, parameter, public :: THREAD_PRIORITY_TIME_CRITICAL = THREAD_BASE_PRIORITY_LOWRT
integer, parameter, public :: THREAD_PRIORITY_IDLE = THREAD_BASE_PRIORITY_IDLE

! 
!  Debug APIs
! 
integer, parameter, public :: EXCEPTION_DEBUG_EVENT      = 1
integer, parameter, public :: CREATE_THREAD_DEBUG_EVENT  = 2
integer, parameter, public :: CREATE_PROCESS_DEBUG_EVENT = 3
integer, parameter, public :: EXIT_THREAD_DEBUG_EVENT    = 4
integer, parameter, public :: EXIT_PROCESS_DEBUG_EVENT   = 5
integer, parameter, public :: LOAD_DLL_DEBUG_EVENT       = 6
integer, parameter, public :: UNLOAD_DLL_DEBUG_EVENT     = 7
integer, parameter, public :: OUTPUT_DEBUG_STRING_EVENT  = 8
integer, parameter, public :: RIP_EVENT                  = 9

type  T_EXCEPTION_DEBUG_INFO
    type (T_EXCEPTION_RECORD) ExceptionRecord 
    integer dwFirstChance 
end type  T_EXCEPTION_DEBUG_INFO

type  T_CREATE_THREAD_DEBUG_INFO
    integer hThread 
    integer lpThreadLocalBase 
    integer lpStartAddress 
end type  T_CREATE_THREAD_DEBUG_INFO

type  T_CREATE_PROCESS_DEBUG_INFO
    integer hFile 
    integer hProcess 
    integer hThread 
    integer lpBaseOfImage 
    integer dwDebugInfoFileOffset 
    integer nDebugInfoSize 
    integer lpThreadLocalBase 
    integer lpStartAddress 
    integer lpImageName 
    integer(2) fUnicode 
end type  T_CREATE_PROCESS_DEBUG_INFO

type  T_EXIT_THREAD_DEBUG_INFO
    integer dwExitCode 
end type  T_EXIT_THREAD_DEBUG_INFO

type  T_EXIT_PROCESS_DEBUG_INFO
    integer dwExitCode 
end type  T_EXIT_PROCESS_DEBUG_INFO

type  T_LOAD_DLL_DEBUG_INFO
    integer hFile 
    integer lpBaseOfDll 
    integer dwDebugInfoFileOffset 
    integer nDebugInfoSize 
    integer lpImageName 
    integer(2) fUnicode 
end type  T_LOAD_DLL_DEBUG_INFO

type  T_UNLOAD_DLL_DEBUG_INFO
    integer lpBaseOfDll 
end type  T_UNLOAD_DLL_DEBUG_INFO

type  T_OUTPUT_DEBUG_STRING_INFO
    integer lpDebugStringData 
    integer(2) fUnicode 
    integer(2) nDebugStringLength 
end type  T_OUTPUT_DEBUG_STRING_INFO

type  T_RIP_INFO
    integer dwError 
    integer dwType 
end type  T_RIP_INFO

type T_DEBUG_EVENT$U
   union
      map
         type(T_EXCEPTION_DEBUG_INFO)    Exception
      end map

      map
         type(T_CREATE_THREAD_DEBUG_INFO)   CreateThread
      end map

      map
         type(T_CREATE_PROCESS_DEBUG_INFO)  CreateProcessInfo
      end map

      map
         type(T_EXIT_THREAD_DEBUG_INFO)  ExitThread
      end map

      map
         type(T_EXIT_THREAD_DEBUG_INFO)  ExitProcess
      end map

      map
         type(T_LOAD_DLL_DEBUG_INFO)  LoadDll
      end map

      map
         type(T_UNLOAD_DLL_DEBUG_INFO)   UnloadDll
      end map

      map
         type(T_OUTPUT_DEBUG_STRING_INFO)   DebugString
      end map

      map
         type(T_RIP_INFO)    RipInfo
      end map

   end union
end type T_DEBUG_EVENT$U

type T_DEBUG_EVENT
    integer                 dwDebugEventCode 
    integer                 dwProcessId 
    integer                 dwThreadId 
    type (T_DEBUG_EVENT$U)  u
end type T_DEBUG_EVENT


integer, parameter, public :: DRIVE_UNKNOWN     = 0
integer, parameter, public :: DRIVE_NO_ROOT_DIR = 1
integer, parameter, public :: DRIVE_REMOVABLE   = 2
integer, parameter, public :: DRIVE_FIXED       = 3
integer, parameter, public :: DRIVE_REMOTE      = 4
integer, parameter, public :: DRIVE_CDROM       = 5
integer, parameter, public :: DRIVE_RAMDISK     = 6


integer, parameter, public :: FILE_TYPE_UNKNOWN =  #0000
integer, parameter, public :: FILE_TYPE_DISK    =  #0001
integer, parameter, public :: FILE_TYPE_CHAR    =  #0002
integer, parameter, public :: FILE_TYPE_PIPE    =  #0003
integer, parameter, public :: FILE_TYPE_REMOTE  =  #8000


integer, parameter, public :: STD_INPUT_HANDLE  = -10
integer, parameter, public :: STD_OUTPUT_HANDLE = -11
integer, parameter, public :: STD_ERROR_HANDLE  = -12

integer, parameter, public :: NOPARITY    = 0
integer, parameter, public :: ODDPARITY   = 1
integer, parameter, public :: EVENPARITY  = 2
integer, parameter, public :: MARKPARITY  = 3
integer, parameter, public :: SPACEPARITY = 4

integer, parameter, public :: ONESTOPBIT     = 0
integer, parameter, public :: ONE5STOPBITS   = 1
integer, parameter, public :: TWOSTOPBITS    = 2

integer, parameter, public :: IGNORE   = 0         ! Ignore signal
integer, parameter, public :: INFINITE = #FFFFFFFF ! Infinite timeout

! 
!  Baud rates at which the communication device operates
! 

integer, parameter, public :: CBR_110     = 110
integer, parameter, public :: CBR_300     = 300
integer, parameter, public :: CBR_600     = 600
integer, parameter, public :: CBR_1200    = 1200
integer, parameter, public :: CBR_2400    = 2400
integer, parameter, public :: CBR_4800    = 4800
integer, parameter, public :: CBR_9600    = 9600
integer, parameter, public :: CBR_14400   = 14400
integer, parameter, public :: CBR_19200   = 19200
integer, parameter, public :: CBR_38400   = 38400
integer, parameter, public :: CBR_56000   = 56000
integer, parameter, public :: CBR_57600   = 57600
integer, parameter, public :: CBR_115200  = 115200
integer, parameter, public :: CBR_128000  = 128000
integer, parameter, public :: CBR_256000  = 256000

! 
!  Error Flags
! 

integer, parameter, public :: CE_RXOVER   =  #0001  ! Receive Queue overflow
integer, parameter, public :: CE_OVERRUN  =  #0002  ! Receive Overrun Error
integer, parameter, public :: CE_RXPARITY =  #0004  ! Receive Parity Error
integer, parameter, public :: CE_FRAME    =  #0008  ! Receive Framing error
integer, parameter, public :: CE_BREAK    =  #0010  ! Break Detected
integer, parameter, public :: CE_TXFULL   =  #0100  ! TX Queue is full
integer, parameter, public :: CE_PTO      =  #0200  ! LPTx Timeout
integer, parameter, public :: CE_IOE      =  #0400  ! LPTx I/O Error
integer, parameter, public :: CE_DNS      =  #0800  ! LPTx Device not selected
integer, parameter, public :: CE_OOP      =  #1000  ! LPTx Out-Of-Paper
integer, parameter, public :: CE_MODE     =  #8000  ! Requested mode unsupported

integer, parameter, public :: IE_BADID    = (-1)    ! Invalid or unsupported id
integer, parameter, public :: IE_OPEN     = (-2)    ! Device Already Open
integer, parameter, public :: IE_NOPEN    = (-3)    ! Device Not Open
integer, parameter, public :: IE_MEMORY   = (-4)    ! Unable to allocate queues
integer, parameter, public :: IE_DEFAULT  = (-5)    ! Error in default parameters
integer, parameter, public :: IE_HARDWARE = (-10)   ! Hardware Not Present
integer, parameter, public :: IE_BYTESIZE = (-11)   ! Illegal Byte Size
integer, parameter, public :: IE_BAUDRATE = (-12)   ! Unsupported BaudRate

! 
!  Events
! 

integer, parameter, public :: EV_RXCHAR   =  #0001  ! Any Character received
integer, parameter, public :: EV_RXFLAG   =  #0002  ! Received certain character
integer, parameter, public :: EV_TXEMPTY  =  #0004  ! Transmitt Queue Empty
integer, parameter, public :: EV_CTS      =  #0008  ! CTS changed state
integer, parameter, public :: EV_DSR      =  #0010  ! DSR changed state
integer, parameter, public :: EV_RLSD     =  #0020  ! RLSD changed state
integer, parameter, public :: EV_BREAK    =  #0040  ! BREAK received
integer, parameter, public :: EV_ERR      =  #0080  ! Line status error occurred
integer, parameter, public :: EV_RING     =  #0100  ! Ring signal detected
integer, parameter, public :: EV_PERR     =  #0200  ! Printer error occured
integer, parameter, public :: EV_RX80FULL =  #0400  ! Receive buffer is 80 percent full
integer, parameter, public :: EV_EVENT1   =  #0800  ! Provider specific event 1
integer, parameter, public :: EV_EVENT2   =  #1000  ! Provider specific event 2

! 
!  Escape Functions
! 

integer, parameter, public :: SETXOFF  = 1       ! Simulate XOFF received
integer, parameter, public :: SETXON   = 2       ! Simulate XON received
integer, parameter, public :: SETRTS   = 3       ! Set RTS high
integer, parameter, public :: CLRRTS   = 4       ! Set RTS low
integer, parameter, public :: SETDTR   = 5       ! Set DTR high
integer, parameter, public :: CLRDTR   = 6       ! Set DTR low
integer, parameter, public :: RESETDEV = 7       ! Reset device if possible
integer, parameter, public :: SETBREAK = 8       ! Set the device break line.
integer, parameter, public :: CLRBREAK = 9       ! Clear the device break line.

! 
!  PURGE function flags.
! 
integer, parameter, public :: PURGE_TXABORT =  #0001  ! Kill the pending/current writes to the comm port.
integer, parameter, public :: PURGE_RXABORT =  #0002  ! Kill the pending/current reads to the comm port.
integer, parameter, public :: PURGE_TXCLEAR =  #0004  ! Kill the transmit queue if there.
integer, parameter, public :: PURGE_RXCLEAR =  #0008  ! Kill the typeahead buffer if there.

integer, parameter, public :: LPTx  =  #80    ! Set if ID is for LPT device

! 
!  Modem Status Flags
! 
integer, parameter, public :: MS_CTS_ON   =  #0010
integer, parameter, public :: MS_DSR_ON   =  #0020
integer, parameter, public :: MS_RING_ON  =  #0040
integer, parameter, public :: MS_RLSD_ON  =  #0080

! 
!  WaitSoundState() Constants
! 

integer, parameter, public :: S_QUEUEEMPTY = 0
integer, parameter, public :: S_THRESHOLD = 1
integer, parameter, public :: S_ALLTHRESHOLD = 2

! 
!  Accent Modes
! 

integer, parameter, public :: S_NORMAL    = 0
integer, parameter, public :: S_LEGATO    = 1
integer, parameter, public :: S_STACCATO  = 2

! 
!  SetSoundNoise() Sources
! 

integer, parameter, public :: S_PERIOD512    = 0     ! Freq = N/512 high pitch, less coarse hiss
integer, parameter, public :: S_PERIOD1024   = 1     ! Freq = N/1024
integer, parameter, public :: S_PERIOD2048   = 2     ! Freq = N/2048 low pitch, more coarse hiss
integer, parameter, public :: S_PERIODVOICE  = 3     ! Source is frequency from voice channel (3)
integer, parameter, public :: S_WHITE512     = 4     ! Freq = N/512 high pitch, less coarse hiss
integer, parameter, public :: S_WHITE1024    = 5     ! Freq = N/1024
integer, parameter, public :: S_WHITE2048    = 6     ! Freq = N/2048 low pitch, more coarse hiss
integer, parameter, public :: S_WHITEVOICE   = 7     ! Source is frequency from voice channel (3)

integer, parameter, public :: S_SERDVNA   = (-1)  ! Device not available
integer, parameter, public :: S_SEROFM    = (-2)  ! Out of memory
integer, parameter, public :: S_SERMACT   = (-3)  ! Music active
integer, parameter, public :: S_SERQFUL   = (-4)  ! Queue full
integer, parameter, public :: S_SERBDNT   = (-5)  ! Invalid note
integer, parameter, public :: S_SERDLN    = (-6)  ! Invalid note length
integer, parameter, public :: S_SERDCC    = (-7)  ! Invalid note count
integer, parameter, public :: S_SERDTP    = (-8)  ! Invalid tempo
integer, parameter, public :: S_SERDVL    = (-9)  ! Invalid volume
integer, parameter, public :: S_SERDMD    = (-10) ! Invalid mode
integer, parameter, public :: S_SERDSH    = (-11) ! Invalid shape
integer, parameter, public :: S_SERDPT    = (-12) ! Invalid pitch
integer, parameter, public :: S_SERDFQ    = (-13) ! Invalid frequency
integer, parameter, public :: S_SERDDR    = (-14) ! Invalid duration
integer, parameter, public :: S_SERDSR    = (-15) ! Invalid source
integer, parameter, public :: S_SERDST    = (-16) ! Invalid state

integer, parameter, public :: NMPWAIT_WAIT_FOREVER       = #ffffffff
integer, parameter, public :: NMPWAIT_NOWAIT             =  #00000001
integer, parameter, public :: NMPWAIT_USE_DEFAULT_WAIT   =  #00000000

integer, parameter, public :: FS_CASE_IS_PRESERVED       = FILE_CASE_PRESERVED_NAMES
integer, parameter, public :: FS_CASE_SENSITIVE          = FILE_CASE_SENSITIVE_SEARCH
integer, parameter, public :: FS_UNICODE_STORED_ON_DISK  = FILE_UNICODE_ON_DISK
integer, parameter, public :: FS_PERSISTENT_ACLS         = FILE_PERSISTENT_ACLS

! **************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: FS_VOL_IS_COMPRESSED       = FILE_VOLUME_IS_COMPRESSED
!integer, parameter, public :: FS_FILE_COMPRESSION        = FILE_FILE_COMPRESSION
! **************************************************************************

integer, parameter, public :: FILE_MAP_COPY  = SECTION_QUERY
integer, parameter, public :: FILE_MAP_WRITE = SECTION_MAP_WRITE
integer, parameter, public :: FILE_MAP_READ  = SECTION_MAP_READ
! ************************************************************************
! This has been moved to STMT.F90
!
!integer, parameter, public :: FILE_MAP_ALL_ACCESS = SECTION_ALL_ACCESS
! ************************************************************************

integer, parameter, public :: OF_READ              =  #00000000
integer, parameter, public :: OF_WRITE             =  #00000001
integer, parameter, public :: OF_READWRITE         =  #00000002
integer, parameter, public :: OF_SHARE_COMPAT      =  #00000000
integer, parameter, public :: OF_SHARE_EXCLUSIVE   =  #00000010
integer, parameter, public :: OF_SHARE_DENY_WRITE  =  #00000020
integer, parameter, public :: OF_SHARE_DENY_READ   =  #00000030
integer, parameter, public :: OF_SHARE_DENY_NONE   =  #00000040
integer, parameter, public :: OF_PARSE             =  #00000100
integer, parameter, public :: OF_DELETE            =  #00000200
integer, parameter, public :: OF_VERIFY            =  #00000400
integer, parameter, public :: OF_CANCEL            =  #00000800
integer, parameter, public :: OF_CREATE            =  #00001000
integer, parameter, public :: OF_PROMPT            =  #00002000
integer, parameter, public :: OF_EXIST             =  #00004000
integer, parameter, public :: OF_REOPEN            =  #00008000

integer, parameter, public :: OFS_MAXPATHNAME = 128

type  T_OFSTRUCT
    BYTE       cBytes 
    BYTE       fFixedDisk 
    integer(2) nErrCode 
    integer(2) Reserved1 
    integer(2) Reserved2 
    character  szPathName (OFS_MAXPATHNAME )
end type  T_OFSTRUCT

integer, parameter, public :: MAXINTATOM =  #C000
! *************************************************************************
! This macro has been moved to MACREO.F90
!
!#define MAKEINTATOM(i)  (LPTSTR)( ((WORD)(i)))
! *************************************************************************

integer, parameter, public :: INVALID_ATOM = 0

type T_PROCESS_HEAP_ENTRY$BLOCK
    integer(4) hMem
    integer(4) dwReserved(3)
end type T_PROCESS_HEAP_ENTRY$BLOCK

type T_PROCESS_HEAP_ENTRY$REGION
   integer(4)  dwCommittedSize
   integer(4)  dwUnCommittedSize
   integer(4)  lpFirstBlock
   integer(4)  lpLastBlock
end type T_PROCESS_HEAP_ENTRY$REGION


type T_PROCESS_HEAP_ENTRY 
   integer(4)  lpData
   integer(4)  cbData
   BYTE        cbOverhead
   BYTE        iRegionIndex
   integer(2)  wFlags
   union 
      map
         type (T_PROCESS_HEAP_ENTRY$BLOCK)  Block
      end map
      
      map
         type (T_PROCESS_HEAP_ENTRY$REGION) Region
      end map
   end union      
end type T_PROCESS_HEAP_ENTRY

integer(4), parameter, public :: PROCESS_HEAP_REGION             = #0001
integer(4), parameter, public :: PROCESS_HEAP_UNCOMMITTED_RANGE  = #0002
integer(4), parameter, public :: PROCESS_HEAP_ENTRY_BUSY         = #0004
integer(4), parameter, public :: PROCESS_HEAP_ENTRY_MOVEABLE     = #0010
integer(4), parameter, public :: PROCESS_HEAP_ENTRY_DDESHARE     = #0020

! GetBinaryType return values.

integer(4), parameter, public :: SCS_32BIT_BINARY    = 0
integer(4), parameter, public :: SCS_DOS_BINARY      = 1
integer(4), parameter, public :: SCS_WOW_BINARY      = 2
integer(4), parameter, public :: SCS_PIF_BINARY      = 3
integer(4), parameter, public :: SCS_POSIX_BINARY    = 4
integer(4), parameter, public :: SCS_OS216_BINARY    = 5

integer, parameter, public :: SEM_FAILCRITICALERRORS     =  #0001
integer, parameter, public :: SEM_NOGPFAULTERRORBOX      =  #0002
integer, parameter, public :: SEM_NOALIGNMENTFAULTEXCEPT =  #0004
integer, parameter, public :: SEM_NOOPENFILEERRORBOX     =  #8000

integer, parameter, public :: LOCKFILE_FAIL_IMMEDIATELY  =  #00000001
integer, parameter, public :: LOCKFILE_EXCLUSIVE_LOCK    =  #00000002



type  T_BY_HANDLE_FILE_INFORMATION
    integer dwFileAttributes 
    type (T_FILETIME) ftCreationTime 
    type (T_FILETIME) ftLastAccessTime 
    type (T_FILETIME) ftLastWriteTime 
    integer dwVolumeSerialNumber 
    integer nFileSizeHigh 
    integer nFileSizeLow 
    integer nNumberOfLinks 
    integer nFileIndexHigh 
    integer nFileIndexLow 
end type  T_BY_HANDLE_FILE_INFORMATION


integer, parameter, public :: HANDLE_FLAG_INHERIT            = #00000001
integer, parameter, public :: HANDLE_FLAG_PROTECT_FROM_CLOSE = #00000002

integer, parameter, public :: HINSTANCE_ERROR = 32

integer, parameter, public :: GET_TAPE_MEDIA_INFORMATION = 0
integer, parameter, public :: GET_TAPE_DRIVE_INFORMATION = 1

integer, parameter, public :: SET_TAPE_MEDIA_INFORMATION = 0
integer, parameter, public :: SET_TAPE_DRIVE_INFORMATION = 1

integer, parameter, public :: FORMAT_MESSAGE_ALLOCATE_BUFFER   =  #00000100
integer, parameter, public :: FORMAT_MESSAGE_IGNORE_INSERTS    =  #00000200
integer, parameter, public :: FORMAT_MESSAGE_FROM_STRING       =  #00000400
integer, parameter, public :: FORMAT_MESSAGE_FROM_HMODULE      =  #00000800
integer, parameter, public :: FORMAT_MESSAGE_FROM_SYSTEM       =  #00001000
integer, parameter, public :: FORMAT_MESSAGE_ARGUMENT_ARRAY    =  #00002000
integer, parameter, public :: FORMAT_MESSAGE_MAX_WIDTH_MASK    =  #000000FF


integer, parameter, public :: TLS_OUT_OF_INDEXES  = #FFFFFFFF

! 
!   Stream Ids
! 

integer, parameter, public :: BACKUP_INVALID          = #00000000
integer, parameter, public :: BACKUP_DATA             = #00000001
integer, parameter, public :: BACKUP_EA_DATA          = #00000002
integer, parameter, public :: BACKUP_SECURITY_DATA    = #00000003
integer, parameter, public :: BACKUP_ALTERNATE_DATA   = #00000004
integer, parameter, public :: BACKUP_LINK             = #00000005
integer, parameter, public :: BACKUP_PROPERTY_DATA    = #00000006

! 
!   Stream Attributes
! 

integer, parameter, public :: STREAM_NORMAL_ATTRIBUTE    = #00000000
integer, parameter, public :: STREAM_MODIFIED_WHEN_READ  = #00000001
integer, parameter, public :: STREAM_CONTAINS_SECURITY   = #00000002
integer, parameter, public :: STREAM_CONTAINS_PROPERTIES = #00000004

! 
!  Dual Mode API below this line. Dual Mode Structures also included.
! 

integer, parameter, public :: STARTF_USESHOWWINDOW    =  #00000001
integer, parameter, public :: STARTF_USESIZE          =  #00000002
integer, parameter, public :: STARTF_USEPOSITION      =  #00000004
integer, parameter, public :: STARTF_USECOUNTCHARS    =  #00000008
integer, parameter, public :: STARTF_USEFILLATTRIBUTE =  #00000010
integer, parameter, public :: STARTF_RUNFULLSCREEN    =  #00000020  ! ignored for non-x86 platforms
integer, parameter, public :: STARTF_FORCEONFEEDBACK  =  #00000040
integer, parameter, public :: STARTF_FORCEOFFFEEDBACK =  #00000080
integer, parameter, public :: STARTF_USESTDHANDLES    =  #00000100

type  T_STARTUPINFO
    integer cb 
    integer lpReserved 
    integer lpDesktop 
    integer lpTitle 
    integer dwX 
    integer dwY 
    integer dwXSize 
    integer dwYSize 
    integer dwXCountChars 
    integer dwYCountChars 
    integer dwFillAttribute 
    integer dwFlags 
    integer(2) wShowWindow 
    integer(2) cbReserved2 
    integer lpReserved2 
    integer hStdInput 
    integer hStdOutput 
    integer hStdError 
end type  T_STARTUPINFO

type(T_STARTUPINFO), pointer :: null_startupinfo

integer, parameter, public :: SHUTDOWN_NORETRY =  #00000001

type  T_WIN32_FIND_DATA
    integer(4)       dwFileAttributes 
    type (T_FILETIME)  ftCreationTime 
    type (T_FILETIME)  ftLastAccessTime 
    type (T_FILETIME)  ftLastWriteTime 
    integer(4)       nFileSizeHigh 
    integer(4)       nFileSizeLow 
    integer(4)       dwReserved0 
    integer(4)       dwReserved1 
    character        cFileName ( MAX_PATH  )
    character        cAlternateFileName ( 14  )
end type  T_WIN32_FIND_DATA


integer, parameter, public :: DONT_RESOLVE_DLL_REFERENCES   =  #00000001
integer, parameter, public :: LOAD_LIBRARY_AS_DATAFILE      = #00000002
integer, parameter, public :: LOAD_WITH_ALTERED_SEARCH_PATH = #00000008

integer, parameter, public :: DDD_RAW_TARGET_PATH        =  #00000001
integer, parameter, public :: DDD_REMOVE_DEFINITION      =  #00000002
integer, parameter, public :: DDD_EXACT_MATCH_ON_REMOVE  =  #00000004

integer, parameter, public :: MOVEFILE_REPLACE_EXISTING     =  #00000001
integer, parameter, public :: MOVEFILE_COPY_ALLOWED         =  #00000002
integer, parameter, public :: MOVEFILE_DELAY_UNTIL_REBOOT   =  #00000004

integer, parameter, public :: MAX_COMPUTERNAME_LENGTH = 15

type T_OSVERSIONINFO
   integer(4)  dwOSVersionInfoSize
   integer(4)  dwMajorVersion
   integer(4)  dwMinorVersion
   integer(4)  dwBuildNumber
   integer(4)  dwPlatformId
   character   szCSDVersion(128)       ! Maintenance string for PSS usage
end type T_OSVERSIONINFO

!
! dwPlatformId defines:
!

integer, parameter, public :: VER_PLATFORM_WIN32s     =    0
integer, parameter, public :: VER_PLATFORM_WIN32_NT   =    2


!  DOS and OS/2 Compatible Error Code definitions returned by the Win32 Base
!  API functions.
! 


!   Abnormal termination codes   

integer, parameter, public :: TC_NORMAL   = 0
integer, parameter, public :: TC_HARDERR  = 1
integer, parameter, public :: TC_GP_TRAP  = 2
integer, parameter, public :: TC_SIGNAL   = 3


!               ******WINGDI******
!   Binary raster ops   
integer, parameter, public :: R2_BLACK                   = 1   !   0         
integer, parameter, public :: R2_NOTMERGEPEN             = 2   !  DPon       
integer, parameter, public :: R2_MASKNOTPEN              = 3   !  DPna       
integer, parameter, public :: R2_NOTCOPYPEN              = 4   !  PN         
integer, parameter, public :: R2_MASKPENNOT              = 5   !  PDna       
integer, parameter, public :: R2_NOT                     = 6   !  Dn         
integer, parameter, public :: R2_XORPEN                  = 7   !  DPx        
integer, parameter, public :: R2_NOTMASKPEN              = 8   !  DPan       
integer, parameter, public :: R2_MASKPEN                 = 9   !  DPa        
integer, parameter, public :: R2_NOTXORPEN               = 10  !  DPxn       
integer, parameter, public :: R2_NOP                     = 11  !  D          
integer, parameter, public :: R2_MERGENOTPEN             = 12  !  DPno       
integer, parameter, public :: R2_COPYPEN                 = 13  !  P          
integer, parameter, public :: R2_MERGEPENNOT             = 14  !  PDno       
integer, parameter, public :: R2_MERGEPEN                = 15  !  DPo        
integer, parameter, public :: R2_WHITE                   = 16  !   1         
integer, parameter, public :: R2_LAST                    = 16

!   Ternary raster operations   
integer, parameter, public :: SRCCOPY             = #00CC0020 !   dest = source                     
integer, parameter, public :: SRCPAINT            = #00EE0086 !   dest = source OR dest             
integer, parameter, public :: SRCAND              = #008800C6 !   dest = source AND dest            
integer, parameter, public :: SRCINVERT           = #00660046 !   dest = source XOR dest            
integer, parameter, public :: SRCERASE            = #00440328 !   dest = source AND (NOT dest )     
integer, parameter, public :: NOTSRCCOPY          = #00330008 !   dest = (NOT source)               
integer, parameter, public :: NOTSRCERASE         = #001100A6 !   dest = (NOT src) AND (NOT dest)   
integer, parameter, public :: MERGECOPY           = #00C000CA !   dest = (source AND pattern)       
integer, parameter, public :: MERGEPAINT          = #00BB0226 !   dest = (NOT source) OR dest       
integer, parameter, public :: PATCOPY             = #00F00021 !   dest = pattern                    
integer, parameter, public :: PATPAINT            = #00FB0A09 !   dest = DPSnoo                     
integer, parameter, public :: PATINVERT           = #005A0049 !   dest = pattern XOR dest           
integer, parameter, public :: DSTINVERT           = #00550009 !   dest = (NOT dest)                 
integer, parameter, public :: BLACKNESS           = #00000042 !   dest = BLACK                      
integer, parameter, public :: WHITENESS           = #00FF0062 !   dest = WHITE                      


integer, parameter, public :: GDI_ERROR = #FFFFFFFF !-1
integer, parameter, public :: HGDI_ERROR = #FFFFFFFF 

!   Region Flags   
integer, parameter, public :: ERROR             = 0
integer, parameter, public :: NULLREGION        = 1
integer, parameter, public :: SIMPLEREGION      = 2
integer, parameter, public :: COMPLEXREGION     = 3
integer, parameter, public :: RGN_ERROR         = ERROR

!   CombineRgn() Styles   
integer, parameter, public :: RGN_AND           = 1
integer, parameter, public :: RGN_OR            = 2
integer, parameter, public :: RGN_XOR           = 3
integer, parameter, public :: RGN_DIFF          = 4
integer, parameter, public :: RGN_COPY          = 5
integer, parameter, public :: RGN_MIN           = RGN_AND
integer, parameter, public :: RGN_MAX           = RGN_COPY

!   StretchBlt() Modes   
integer, parameter, public :: BLACKONWHITE      = 1
integer, parameter, public :: WHITEONBLACK      = 2
integer, parameter, public :: COLORONCOLOR      = 3
integer, parameter, public :: HALFTONE          = 4
integer, parameter, public :: MAXSTRETCHBLTMODE = 4

!   PolyFill() Modes   
integer, parameter, public :: ALTERNATE         = 1
integer, parameter, public :: WINDING           = 2
integer, parameter, public :: POLYFILL_LAST     = 2

!   Text Alignment Options   
integer, parameter, public :: TA_NOUPDATECP     = 0
integer, parameter, public :: TA_UPDATECP       = 1

integer, parameter, public :: TA_LEFT           = 0
integer, parameter, public :: TA_RIGHT          = 2
integer, parameter, public :: TA_CENTER         = 6

integer, parameter, public :: TA_TOP            = 0
integer, parameter, public :: TA_BOTTOM         = 8
integer, parameter, public :: TA_BASELINE       = 24
integer, parameter, public :: TA_MASK           = (TA_BASELINE+TA_CENTER+TA_UPDATECP)

integer, parameter, public :: VTA_BASELINE      = TA_BASELINE
integer, parameter, public :: VTA_LEFT          = TA_BOTTOM
integer, parameter, public :: VTA_RIGHT         = TA_TOP
integer, parameter, public :: VTA_CENTER        = TA_CENTER
integer, parameter, public :: VTA_BOTTOM        = TA_RIGHT
integer, parameter, public :: VTA_TOP           = TA_LEFT


integer, parameter, public :: ETO_GRAYED        = 1
integer, parameter, public :: ETO_OPAQUE        = 2
integer, parameter, public :: ETO_CLIPPED       = 4

integer, parameter, public :: ASPECT_FILTERING  =  #0001

!   Bounds Accumulation APIs   

integer, parameter, public :: DCB_RESET         =  #0001
integer, parameter, public :: DCB_ACCUMULATE    =  #0002
integer, parameter, public :: DCB_DIRTY         =  DCB_ACCUMULATE
integer, parameter, public :: DCB_ENABLE        =  #0004
integer, parameter, public :: DCB_DISABLE       =  #0008


!   Metafile Functions   
integer, parameter, public :: META_SETBKCOLOR            =  #0201
integer, parameter, public :: META_SETBKMODE             =  #0102
integer, parameter, public :: META_SETMAPMODE            =  #0103
integer, parameter, public :: META_SETROP2               =  #0104
integer, parameter, public :: META_SETRELABS             =  #0105
integer, parameter, public :: META_SETPOLYFILLMODE       =  #0106
integer, parameter, public :: META_SETSTRETCHBLTMODE     =  #0107
integer, parameter, public :: META_SETTEXTCHAREXTRA      =  #0108
integer, parameter, public :: META_SETTEXTCOLOR          =  #0209
integer, parameter, public :: META_SETTEXTJUSTIFICATION  =  #020A
integer, parameter, public :: META_SETWINDOWORG          =  #020B
integer, parameter, public :: META_SETWINDOWEXT          =  #020C
integer, parameter, public :: META_SETVIEWPORTORG        =  #020D
integer, parameter, public :: META_SETVIEWPORTEXT        =  #020E
integer, parameter, public :: META_OFFSETWINDOWORG       =  #020F
integer, parameter, public :: META_SCALEWINDOWEXT        =  #0410
integer, parameter, public :: META_OFFSETVIEWPORTORG     =  #0211
integer, parameter, public :: META_SCALEVIEWPORTEXT      =  #0412
integer, parameter, public :: META_LINETO                =  #0213
integer, parameter, public :: META_MOVETO                =  #0214
integer, parameter, public :: META_EXCLUDECLIPRECT       =  #0415
integer, parameter, public :: META_INTERSECTCLIPRECT     =  #0416
integer, parameter, public :: META_ARC                   =  #0817
integer, parameter, public :: META_ELLIPSE               =  #0418
integer, parameter, public :: META_FLOODFILL             =  #0419
integer, parameter, public :: META_PIE                   =  #081A
integer, parameter, public :: META_RECTANGLE             =  #041B
integer, parameter, public :: META_ROUNDRECT             =  #061C
integer, parameter, public :: META_PATBLT                =  #061D
integer, parameter, public :: META_SAVEDC                =  #001E
integer, parameter, public :: META_SETPIXEL              =  #041F
integer, parameter, public :: META_OFFSETCLIPRGN         =  #0220
integer, parameter, public :: META_TEXTOUT               =  #0521
integer, parameter, public :: META_BITBLT                =  #0922
integer, parameter, public :: META_STRETCHBLT            =  #0B23
integer, parameter, public :: META_POLYGON               =  #0324
integer, parameter, public :: META_POLYLINE              =  #0325
integer, parameter, public :: META_ESCAPE                =  #0626
integer, parameter, public :: META_RESTOREDC             =  #0127
integer, parameter, public :: META_FILLREGION            =  #0228
integer, parameter, public :: META_FRAMEREGION           =  #0429
integer, parameter, public :: META_INVERTREGION          =  #012A
integer, parameter, public :: META_PAINTREGION           =  #012B
integer, parameter, public :: META_SELECTCLIPREGION      =  #012C
integer, parameter, public :: META_SELECTOBJECT          =  #012D
integer, parameter, public :: META_SETTEXTALIGN          =  #012E
integer, parameter, public :: META_CHORD                 =  #0830
integer, parameter, public :: META_SETMAPPERFLAGS        =  #0231
integer, parameter, public :: META_EXTTEXTOUT            =  #0a32
integer, parameter, public :: META_SETDIBTODEV           =  #0d33
integer, parameter, public :: META_SELECTPALETTE         =  #0234
integer, parameter, public :: META_REALIZEPALETTE        =  #0035
integer, parameter, public :: META_ANIMATEPALETTE        =  #0436
integer, parameter, public :: META_SETPALENTRIES         =  #0037
integer, parameter, public :: META_POLYPOLYGON           =  #0538
integer, parameter, public :: META_RESIZEPALETTE         =  #0139
integer, parameter, public :: META_DIBBITBLT             =  #0940
integer, parameter, public :: META_DIBSTRETCHBLT         =  #0b41
integer, parameter, public :: META_DIBCREATEPATTERNBRUSH =  #0142
integer, parameter, public :: META_STRETCHDIB            =  #0f43
integer, parameter, public :: META_EXTFLOODFILL          =  #0548
integer, parameter, public :: META_DELETEOBJECT          =  #01f0
integer, parameter, public :: META_CREATEPALETTE         =  #00f7
integer, parameter, public :: META_CREATEPATTERNBRUSH    =  #01F9
integer, parameter, public :: META_CREATEPENINDIRECT     =  #02FA
integer, parameter, public :: META_CREATEFONTINDIRECT    =  #02FB
integer, parameter, public :: META_CREATEBRUSHINDIRECT   =  #02FC
integer, parameter, public :: META_CREATEREGION          =  #06FF


!   GDI Escapes   
integer, parameter, public :: NEWFRAME          = 1
integer, parameter, public :: F90ABORTDOC       = 2
integer, parameter, public :: NEXTBAND          = 3
integer, parameter, public :: SETCOLORTABLE     = 4
integer, parameter, public :: GETCOLORTABLE     = 5
integer, parameter, public :: FLUSHOUTPUT       = 6
integer, parameter, public :: DRAFTMODE         = 7
integer, parameter, public :: QUERYESCSUPPORT   = 8
integer, parameter, public :: F90SETABORTPROC   = 9
integer, parameter, public :: F90STARTDOC       = 10
integer, parameter, public :: F90ENDDOC         = 11
integer, parameter, public :: GETPHYSPAGESIZE   = 12
integer, parameter, public :: GETPRINTINGOFFSET = 13
integer, parameter, public :: GETSCALINGFACTOR  = 14
integer, parameter, public :: MFCOMMENT         = 15
integer, parameter, public :: GETPENWIDTH       = 16
integer, parameter, public :: SETCOPYCOUNT      = 17
integer, parameter, public :: SELECTPAPERSOURCE = 18
integer, parameter, public :: DEVICEDATA        = 19
integer, parameter, public :: PASSTHROUGH       = 19
integer, parameter, public :: GETTECHNOLGY      = 20
integer, parameter, public :: GETTECHNOLOGY     = 20
integer, parameter, public :: SETLINECAP        = 21
integer, parameter, public :: SETLINEJOIN       = 22
integer, parameter, public :: F90SETMITERLIMIT  = 23
integer, parameter, public :: BANDINFO          = 24
integer, parameter, public :: DRAWPATTERNRECT   = 25
integer, parameter, public :: GETVECTORPENSIZE  = 26
integer, parameter, public :: GETVECTORBRUSHSIZE = 27
integer, parameter, public :: ENABLEDUPLEX      = 28
integer, parameter, public :: GETSETPAPERBINS   = 29
integer, parameter, public :: GETSETPRINTORIENT = 30
integer, parameter, public :: ENUMPAPERBINS     = 31
integer, parameter, public :: SETDIBSCALING     = 32
integer, parameter, public :: EPSPRINTING       = 33
integer, parameter, public :: ENUMPAPERMETRICS  = 34
integer, parameter, public :: GETSETPAPERMETRICS = 35
integer, parameter, public :: POSTSCRIPT_DATA   = 37
integer, parameter, public :: POSTSCRIPT_IGNORE = 38
integer, parameter, public :: MOUSETRAILS       = 39
integer, parameter, public :: GETDEVICEUNITS    = 42

integer, parameter, public :: GETEXTENDEDTEXTMETRICS    = 256
integer, parameter, public :: GETEXTENTTABLE            = 257
integer, parameter, public :: GETPAIRKERNTABLE          = 258
integer, parameter, public :: GETTRACKKERNTABLE         = 259
integer, parameter, public :: F90EXTTEXTOUT             = 512
integer, parameter, public :: GETFACENAME               = 513
integer, parameter, public :: DOWNLOADFACE              = 514
integer, parameter, public :: ENABLERELATIVEWIDTHS      = 768
integer, parameter, public :: ENABLEPAIRKERNING         = 769
integer, parameter, public :: SETKERNTRACK              = 770
integer, parameter, public :: SETALLJUSTVALUES          = 771
integer, parameter, public :: SETCHARSET                = 772

integer, parameter, public :: F90STRETCHBLT             = 2048
integer, parameter, public :: GETSETSCREENPARAMS        = 3072
integer, parameter, public :: BEGIN_PATH                = 4096
integer, parameter, public :: CLIP_TO_PATH              = 4097
integer, parameter, public :: END_PATH                  = 4098
integer, parameter, public :: EXT_DEVICE_CAPS           = 4099
integer, parameter, public :: RESTORE_CTM               = 4100
integer, parameter, public :: SAVE_CTM                  = 4101
integer, parameter, public :: SET_ARC_DIRECTION         = 4102
integer, parameter, public :: SET_BACKGROUND_COLOR      = 4103
integer, parameter, public :: SET_POLY_MODE             = 4104
integer, parameter, public :: SET_SCREEN_ANGLE          = 4105
integer, parameter, public :: SET_SPREAD                = 4106
integer, parameter, public :: TRANSFORM_CTM             = 4107
integer, parameter, public :: SET_CLIP_BOX              = 4108
integer, parameter, public :: SET_BOUNDS                = 4109
integer, parameter, public :: SET_MIRROR_MODE           = 4110
integer, parameter, public :: OPENCHANNEL               = 4110
integer, parameter, public :: DOWNLOADHEADER            = 4111
integer, parameter, public :: CLOSECHANNEL              = 4112
integer, parameter, public :: POSTSCRIPT_PASSTHROUGH    = 4115
integer, parameter, public :: ENCAPSULATED_POSTSCRIPT   = 4116

!    Flag Returned From QUERYDIBSUPPORT 
integer, parameter, public :: QDI_SETDIBITS         = 1
integer, parameter, public :: QDI_GETDIBITS         = 2
integer, parameter, public :: QDI_DIBTOSCREEN   = 3
integer, parameter, public :: QDI_STRETCHDIB        = 8

!   Spooler Error Codes   
integer, parameter, public :: SP_NOTREPORTED    =  #4000
integer, parameter, public :: SP_ERROR          = (-1)
integer, parameter, public :: SP_APPABORT       = (-2)
integer, parameter, public :: SP_USERABORT      = (-3)
integer, parameter, public :: SP_OUTOFDISK      = (-4)
integer, parameter, public :: SP_OUTOFMEMORY    = (-5)

integer, parameter, public :: PR_JOBSTATUS      =  #0000

!   Object Definitions for EnumObjects()   
integer, parameter, public :: OBJ_PEN           = 1
integer, parameter, public :: OBJ_BRUSH         = 2
integer, parameter, public :: OBJ_DC            = 3
integer, parameter, public :: OBJ_METADC        = 4
integer, parameter, public :: OBJ_PAL           = 5
integer, parameter, public :: OBJ_FONT          = 6
integer, parameter, public :: OBJ_BITMAP        = 7
integer, parameter, public :: OBJ_REGION        = 8
integer, parameter, public :: OBJ_METAFILE      = 9
integer, parameter, public :: OBJ_MEMDC         = 10
integer, parameter, public :: OBJ_EXTPEN        = 11
integer, parameter, public :: OBJ_ENHMETADC     = 12
integer, parameter, public :: OBJ_ENHMETAFILE   = 13

!   xform stuff   
integer, parameter, public :: MWT_IDENTITY      = 1
integer, parameter, public :: MWT_LEFTMULTIPLY  = 2
integer, parameter, public :: MWT_RIGHTMULTIPLY = 3

integer, parameter, public :: MWT_MIN = MWT_IDENTITY
integer, parameter, public :: MWT_MAX = MWT_RIGHTMULTIPLY

type  T_XFORM                                      
    real eM11 
    real eM12 
    real eM21 
    real eM22 
    real eDx 
    real eDy 
end type  T_XFORM

!   Bitmap Header Definition   
!MS$PACK:1
type  T_BITMAP
    integer bmType 
    integer bmWidth 
    integer bmHeight 
    integer bmWidthBytes 
    integer*2 bmPlanes 
    integer*2 bmBitsPixel 
    integer bmBits 
end type  T_BITMAP
!MS$PACK:

type  T_RGBTRIPLE
    byte rgbtBlue 
    byte rgbtGreen 
    byte rgbtRed 
end type  T_RGBTRIPLE

type  T_RGBQUAD
    byte rgbBlue 
    byte rgbGreen 
    byte rgbRed 
    byte rgbReserved 
end type  T_RGBQUAD

!   structures for defining DIBs   
type  T_BITMAPCOREHEADER
    integer bcSize                   !  used to get to color table   
   integer*2 bcWidth 
   integer*2 bcHeight 
   integer*2 bcPlanes 
   integer*2 bcBitCount 
end type  T_BITMAPCOREHEADER


type  T_BITMAPINFOHEADER
    integer(4)  biSize 
    integer(4)  biWidth 
    integer(4)  biHeight 
    integer(2)  biPlanes 
    integer(2)  biBitCount 
    integer(4)  biCompression 
    integer(4)  biSizeImage 
    integer(4)  biXPelsPerMeter 
    integer(4)  biYPelsPerMeter 
    integer(4)  biClrUsed 
    integer(4)  biClrImportant 
end type  T_BITMAPINFOHEADER

!   constants for the biCompression field   
integer, parameter, public :: BI_RGB            = 0
integer, parameter, public :: BI_RLE8           = 1
integer, parameter, public :: BI_RLE4           = 2
integer, parameter, public :: BI_BITFIELDS      = 3

type  T_BITMAPINFO
    type (T_BITMAPINFOHEADER) bmiHeader 
    type (T_RGBQUAD) bmiColors (1 )
end type  T_BITMAPINFO

type  T_BITMAPCOREINFO
    type (T_BITMAPCOREHEADER) bmciHeader 
    type (T_RGBTRIPLE) bmciColors (1 )
end type  T_BITMAPCOREINFO

!MS$PACK:1
type  T_BITMAPFILEHEADER
    integer*2   bfType 
    integer     bfSize 
    integer*2   bfReserved1 
    integer*2   bfReserved2 
    integer     bfOffBits 
end type  T_BITMAPFILEHEADER

!MS$PACK:

!   Clipboard Metafile Picture Structure   
type  T_HANDLETABLE
    integer objectHandle (1 )
end type  T_HANDLETABLE

type  T_METARECORD
    integer    rdSize 
    integer*2  rdFunction 
    integer*2  rdParm (1 )
end type  T_METARECORD

type  T_METAFILEPICT
    integer mm 
    integer xExt 
    integer yExt 
    integer hMF 
end type  T_METAFILEPICT

type  T_METAHEADER
    integer*2  mtType 
    integer*2  mtHeaderSize 
    integer*2  mtVersion 
    integer    mtSize 
    integer*2  mtNoObjects 
    integer    mtMaxRecord 
    integer*2  mtNoParameters 
end type  T_METAHEADER

!   Enhanced Metafile structures   
type  T_ENHMETARECORD
    integer iType                !  Record type EMR_XXX
    integer nSize                !  Record size in bytes
    integer dParm (1 )            !  Parameters
end type  T_ENHMETARECORD

type  T_ENHMETAHEADER
    integer iType                !  Record type EMR_HEADER
    integer nSize                !  Record size in bytes.  This may be greater
                                 !  than the sizeof(T_ENHMETAHEADER).
    type (T_RECTL)  rclBounds      !  Inclusive-inclusive bounds in device units
    type (T_RECTL)  rclFrame       !  Inclusive-inclusive Picture Frame of metafile in .01 mm units
    integer       dSignature     !  Signature.  Must be ENHMETA_SIGNATURE.
    integer       nVersion       !  Version number
    integer       nBytes         !  Size of the metafile in bytes
    integer       nRecords       !  Number of records in the metafile
    integer*2     nHandles       !  Number of handles in the handle table
                                 !  Handle index zero is reserved.
    integer*2     sReserved      !  Reserved.  Must be zero.
    integer       nDescription   !  Number of chars in the unicode description string
                                 !  This is 0 if there is no description string
    integer       offDescription !  Offset to the metafile description record.
                                 !  This is 0 if there is no description string
    integer       nPalEntries    !  Number of entries in the metafile palette.
    type (T_SIZE)   szlDevice      !  Size of the reference device in pels
    type (T_SIZE)   szlMillimeters !  Size of the reference device in millimeters
end type  T_ENHMETAHEADER


!   tmPitchAndFamily flags   
integer, parameter, public :: TMPF_FIXED_PITCH  =  #01
integer, parameter, public :: TMPF_VECTOR       =  #02
integer, parameter, public :: TMPF_DEVICE       =  #08
integer, parameter, public :: TMPF_TRUETYPE     =  #04

type  T_TEXTMETRIC
    integer tmHeight 
    integer tmAscent 
    integer tmDescent 
    integer tmInternalLeading 
    integer tmExternalLeading 
    integer tmAveCharWidth 
    integer tmMaxCharWidth 
    integer tmWeight 
    integer tmOverhang 
    integer tmDigitizedAspectX 
    integer tmDigitizedAspectY 
    byte    tmFirstChar 
    byte    tmLastChar 
    byte    tmDefaultChar 
    byte    tmBreakChar 
    byte    tmItalic 
    byte    tmUnderlined 
    byte    tmStruckOut 
    byte    tmPitchAndFamily 
    byte    tmCharSet 
end type  T_TEXTMETRIC


!   ntmFlags field flags   
integer, parameter, public :: NTM_REGULAR       =  #00000040
integer, parameter, public :: NTM_BOLD          =  #00000020
integer, parameter, public :: NTM_ITALIC        =  #00000001

type  T_NEWTEXTMETRIC
    integer tmHeight 
    integer tmAscent 
    integer tmDescent 
    integer tmInternalLeading 
    integer tmExternalLeading 
    integer tmAveCharWidth 
    integer tmMaxCharWidth 
    integer tmWeight 
    integer tmOverhang 
    integer tmDigitizedAspectX 
    integer tmDigitizedAspectY 
    byte    tmFirstChar 
    byte    tmLastChar 
    byte    tmDefaultChar 
    byte    tmBreakChar 
    byte    tmItalic 
    byte    tmUnderlined 
    byte    tmStruckOut 
    byte    tmPitchAndFamily 
    byte    tmCharSet 
    integer ntmFlags 
    integer ntmSizeEM 
    integer ntmCellHeight 
    integer ntmAvgWidth 
end type  T_NEWTEXTMETRIC

!   GDI Logical Objects:   

!   Pel Array   
type  T_PELARRAY
    integer paXCount 
    integer paYCount 
    integer paXExt 
    integer paYExt 
    byte paRGBs 
end type  T_PELARRAY

!   Logical Brush (or Pattern)   
type  T_LOGBRUSH
    integer lbStyle 
    integer lbColor 
    integer lbHatch 
end type  T_LOGBRUSH


!   Logical Pen   
type  T_LOGPEN
    integer lopnStyle 
    type (T_POINT) lopnWidth 
    integer lopnColor 
end type  T_LOGPEN

type  T_EXTLOGPEN
    integer elpPenStyle 
    integer elpWidth 
    integer elpBrushStyle 
    integer elpColor 
    integer elpHatch 
    integer elpNumEntries 
    integer elpStyleEntry (1 )
end type  T_EXTLOGPEN

type  T_PALETTEENTRY
    byte peRed 
    byte peGreen 
    byte peBlue 
    byte peFlags 
end type  T_PALETTEENTRY

type  (T_PALETTEENTRY), pointer :: null_paletteentry

!   Logical Palette   
type  T_LOGPALETTE
    integer*2 palVersion 
    integer*2 palNumEntries  
    type (T_PALETTEENTRY) palPalEntry (1 )
end type  T_LOGPALETTE

!   Logical Font   
integer, parameter, public :: LF_FACESIZE = 32

type  T_LOGFONT
    integer lfHeight 
    integer lfWidth 
    integer lfEscapement 
    integer lfOrientation 
    integer lfWeight 
    byte lfItalic 
    byte lfUnderline 
    byte lfStrikeOut 
    byte lfCharSet 
    byte lfOutPrecision 
    byte lfClipPrecision 
    byte lfQuality 
    byte lfPitchAndFamily 
    byte lfFaceName (LF_FACESIZE )
end type  T_LOGFONT

integer, parameter, public :: LF_FULLFACESIZE = 64

!   Structure passed to FONTENUMPROC   
type  T_ENUMLOGFONT
    type (T_LOGFONT) elfLogFont 
    byte elfFullName (LF_FULLFACESIZE )
    byte elfStyle (LF_FACESIZE )
end type  T_ENUMLOGFONT

integer, parameter, public :: OUT_DEFAULT_PRECIS        = 0
integer, parameter, public :: OUT_STRING_PRECIS         = 1
integer, parameter, public :: OUT_CHARACTER_PRECIS      = 2
integer, parameter, public :: OUT_STROKE_PRECIS         = 3
integer, parameter, public :: OUT_TT_PRECIS             = 4
integer, parameter, public :: OUT_DEVICE_PRECIS         = 5
integer, parameter, public :: OUT_RASTER_PRECIS         = 6
integer, parameter, public :: OUT_TT_ONLY_PRECIS        = 7
integer, parameter, public :: OUT_OUTLINE_PRECIS        = 8
integer, parameter, public :: CLIP_DEFAULT_PRECIS       = 0
integer, parameter, public :: CLIP_CHARACTER_PRECIS     = 1
integer, parameter, public :: CLIP_STROKE_PRECIS        = 2
integer, parameter, public :: CLIP_MASK                 =  #f

integer, parameter, public :: DEFAULT_QUALITY   = 0
integer, parameter, public :: DRAFT_QUALITY     = 1
integer, parameter, public :: PROOF_QUALITY     = 2

integer, parameter, public :: DEFAULT_PITCH     = 0
integer, parameter, public :: FIXED_PITCH       = 1
integer, parameter, public :: VARIABLE_PITCH    = 2

integer, parameter, public :: ANSI_CHARSET              = 0
integer, parameter, public :: DEFAULT_CHARSET           = 1
integer, parameter, public :: SYMBOL_CHARSET            = 2
integer, parameter, public :: SHIFTJIS_CHARSET          = 128
integer, parameter, public :: HANGEUL_CHARSET           = 129
integer, parameter, public :: CHINESEBIG5_CHARSET       = 136
integer, parameter, public :: OEM_CHARSET               = 255

!   Font Families   
!****************************************************************************
!These Definitions have been moved to stmt.f90
!
!integer, parameter, public :: FF_DONTCARE = ISHL(0,4)  !  Don't care or don't know.   
!integer, parameter, public :: FF_ROMAN = ISHL(1,4)  !  Variable stroke width, serifed.   
!                                    !   Times Roman, Century Schoolbook, etc.   
!integer, parameter, public :: FF_SWISS = ISHL(2,4)  !  Variable stroke width, sans-serifed.   
!                                    !   Helvetica, Swiss, etc.   
!integer, parameter, public :: FF_MODERN = ISHL(3,4)  !  Constant stroke width, serifed or sans-serifed.   
!                                    !   Pica, Elite, Courier, etc.   
!integer, parameter, public :: FF_SCRIPT = ISHL(4,4)  !  Cursive, etc.   
!integer, parameter, public :: FF_DECORATIVE = ISHL(5,4)  !  Old English, etc.   
!****************************************************************************

!   Font Weights   
integer, parameter, public :: FW_DONTCARE               = 0
integer, parameter, public :: FW_THIN                   = 100
integer, parameter, public :: FW_EXTRALIGHT             = 200
integer, parameter, public :: FW_LIGHT                  = 300
integer, parameter, public :: FW_NORMAL                 = 400
integer, parameter, public :: FW_MEDIUM                 = 500
integer, parameter, public :: FW_SEMIBOLD               = 600
integer, parameter, public :: FW_BOLD                   = 700
integer, parameter, public :: FW_EXTRABOLD              = 800
integer, parameter, public :: FW_HEAVY                  = 900

integer, parameter, public :: FW_ULTRALIGHT             = FW_EXTRALIGHT
integer, parameter, public :: FW_REGULAR                = FW_NORMAL
integer, parameter, public :: FW_DEMIBOLD               = FW_SEMIBOLD
integer, parameter, public :: FW_ULTRABOLD              = FW_EXTRABOLD
integer, parameter, public :: FW_BLACK                  = FW_HEAVY

integer, parameter, public :: PANOSE_COUNT              = 10
integer, parameter, public :: PAN_FAMILYTYPE_INDEX      = 0
integer, parameter, public :: PAN_SERIFSTYLE_INDEX      = 1
integer, parameter, public :: PAN_WEIGHT_INDEX          = 2
integer, parameter, public :: PAN_PROPORTION_INDEX      = 3
integer, parameter, public :: PAN_CONTRAST_INDEX        = 4
integer, parameter, public :: PAN_STROKEVARIATION_INDEX = 5
integer, parameter, public :: PAN_ARMSTYLE_INDEX        = 6
integer, parameter, public :: PAN_LETTERFORM_INDEX      = 7
integer, parameter, public :: PAN_MIDLINE_INDEX         = 8
integer, parameter, public :: PAN_XHEIGHT_INDEX         = 9

integer, parameter, public :: PAN_CULTURE_LATIN         = 0

type  T_PANOSE
    byte bFamilyType 
    byte bSerifStyle 
    byte bWeight 
    byte bProportion 
    byte bContrast 
    byte bStrokeVariation 
    byte bArmStyle 
    byte bLetterform 
    byte bMidline 
    byte bXHeight 
end type  T_PANOSE

integer, parameter, public :: PAN_ANY           = 0 !  Any                              
integer, parameter, public :: PAN_NO_FIT        = 1 !  No Fit                           

integer, parameter, public :: PAN_FAMILY_TEXT_DISPLAY   = 2 !  Text and Display                 
integer, parameter, public :: PAN_FAMILY_SCRIPT         = 3 !  Script                           
integer, parameter, public :: PAN_FAMILY_DECORATIVE     = 4 !  Decorative                       
integer, parameter, public :: PAN_FAMILY_PICTORIAL      = 5 !  Pictorial                        

integer, parameter, public :: PAN_SERIF_COVE            = 2 !  Cove                             
integer, parameter, public :: PAN_SERIF_OBTUSE_COVE     = 3 !  Obtuse Cove                      
integer, parameter, public :: PAN_SERIF_SQUARE_COVE     = 4 !  Square Cove                      
integer, parameter, public :: PAN_SERIF_OBTUSE_SQUARE_COVE = 5 !  Obtuse Square Cove               
integer, parameter, public :: PAN_SERIF_SQUARE          = 6 !  Square                           
integer, parameter, public :: PAN_SERIF_THIN            = 7 !  Thin                             
integer, parameter, public :: PAN_SERIF_BONE            = 8 !  Bone                             
integer, parameter, public :: PAN_SERIF_EXAGGERATED     = 9 !  Exaggerated                      
integer, parameter, public :: PAN_SERIF_TRIANGLE        = 10 !  Triangle                         
integer, parameter, public :: PAN_SERIF_NORMAL_SANS     = 11 !  Normal Sans                      
integer, parameter, public :: PAN_SERIF_OBTUSE_SANS     = 12 !  Obtuse Sans                      
integer, parameter, public :: PAN_SERIF_PERP_SANS       = 13 !  Prep Sans                        
integer, parameter, public :: PAN_SERIF_FLARED          = 14 !  Flared                           
integer, parameter, public :: PAN_SERIF_ROUNDED         = 15 !  Rounded                          

integer, parameter, public :: PAN_WEIGHT_VERY_LIGHT     = 2 !  Very Light                       
integer, parameter, public :: PAN_WEIGHT_LIGHT          = 3 !  Light                            
integer, parameter, public :: PAN_WEIGHT_THIN           = 4 !  Thin                             
integer, parameter, public :: PAN_WEIGHT_BOOK           = 5 !  Book                             
integer, parameter, public :: PAN_WEIGHT_MEDIUM         = 6 !  Medium                           
integer, parameter, public :: PAN_WEIGHT_DEMI           = 7 !  Demi                             
integer, parameter, public :: PAN_WEIGHT_BOLD           = 8 !  Bold                             
integer, parameter, public :: PAN_WEIGHT_HEAVY          = 9 !  Heavy                            
integer, parameter, public :: PAN_WEIGHT_BLACK          = 10 !  Black                            
integer, parameter, public :: PAN_WEIGHT_NORD           = 11 !  Nord                             

integer, parameter, public :: PAN_PROP_OLD_STYLE        = 2 !  Old Style                        
integer, parameter, public :: PAN_PROP_MODERN           = 3 !  Modern                           
integer, parameter, public :: PAN_PROP_EVEN_WIDTH       = 4 !  Even Width                       
integer, parameter, public :: PAN_PROP_EXPANDED         = 5 !  Expanded                         
integer, parameter, public :: PAN_PROP_CONDENSED        = 6 !  Condensed                        
integer, parameter, public :: PAN_PROP_VERY_EXPANDED    = 7 !  Very Expanded                    
integer, parameter, public :: PAN_PROP_VERY_CONDENSED   = 8 !  Very Condensed                   
integer, parameter, public :: PAN_PROP_MONOSPACED       = 9 !  Monospaced                       

integer, parameter, public :: PAN_CONTRAST_NONE         = 2 !  None                             
integer, parameter, public :: PAN_CONTRAST_VERY_LOW     = 3 !  Very Low                         
integer, parameter, public :: PAN_CONTRAST_LOW          = 4 !  Low                              
integer, parameter, public :: PAN_CONTRAST_MEDIUM_LOW   = 5 !  Medium Low                       
integer, parameter, public :: PAN_CONTRAST_MEDIUM       = 6 !  Medium                           
integer, parameter, public :: PAN_CONTRAST_MEDIUM_HIGH  = 7 !  Mediim High                      
integer, parameter, public :: PAN_CONTRAST_HIGH         = 8 !  High                             
integer, parameter, public :: PAN_CONTRAST_VERY_HIGH    = 9 !  Very High                        

integer, parameter, public :: PAN_STROKE_GRADUAL_DIAG   = 2 !  Gradual/Diagonal                 
integer, parameter, public :: PAN_STROKE_GRADUAL_TRAN   = 3 !  Gradual/Transitional             
integer, parameter, public :: PAN_STROKE_GRADUAL_VERT   = 4 !  Gradual/Vertical                 
integer, parameter, public :: PAN_STROKE_GRADUAL_HORZ   = 5 !  Gradual/Horizontal               
integer, parameter, public :: PAN_STROKE_RAPID_VERT     = 6 !  Rapid/Vertical                   
integer, parameter, public :: PAN_STROKE_RAPID_HORZ     = 7 !  Rapid/Horizontal                 
integer, parameter, public :: PAN_STROKE_INSTANT_VERT   = 8 !  Instant/Vertical                 

integer, parameter, public :: PAN_STRAIGHT_ARMS_HORZ           = 2 !  Straight Arms/Horizontal         
integer, parameter, public :: PAN_STRAIGHT_ARMS_WEDGE          = 3 !  Straight Arms/Wedge              
integer, parameter, public :: PAN_STRAIGHT_ARMS_VERT           = 4 !  Straight Arms/Vertical           
integer, parameter, public :: PAN_STRAIGHT_ARMS_SINGLE_SERIF   = 5 !  Straight Arms/Single-Serif       
integer, parameter, public :: PAN_STRAIGHT_ARMS_DOUBLE_SERIF   = 6 !  Straight Arms/Double-Serif       
integer, parameter, public :: PAN_BENT_ARMS_HORZ               = 7 !  Non-Straight Arms/Horizontal     
integer, parameter, public :: PAN_BENT_ARMS_WEDGE              = 8 !  Non-Straight Arms/Wedge          
integer, parameter, public :: PAN_BENT_ARMS_VERT               = 9 !  Non-Straight Arms/Vertical       
integer, parameter, public :: PAN_BENT_ARMS_SINGLE_SERIF       = 10 !  Non-Straight Arms/Single-Serif   
integer, parameter, public :: PAN_BENT_ARMS_DOUBLE_SERIF       = 11 !  Non-Straight Arms/Double-Serif   

integer, parameter, public :: PAN_LETT_NORMAL_CONTACT          = 2 !  Normal/Contact                   
integer, parameter, public :: PAN_LETT_NORMAL_WEIGHTED         = 3 !  Normal/Weighted                  
integer, parameter, public :: PAN_LETT_NORMAL_BOXED            = 4 !  Normal/Boxed                     
integer, parameter, public :: PAN_LETT_NORMAL_FLATTENED        = 5 !  Normal/Flattened                 
integer, parameter, public :: PAN_LETT_NORMAL_ROUNDED          = 6 !  Normal/Rounded                   
integer, parameter, public :: PAN_LETT_NORMAL_OFF_CENTER       = 7 !  Normal/Off Center                
integer, parameter, public :: PAN_LETT_NORMAL_SQUARE           = 8 !  Normal/Square                    
integer, parameter, public :: PAN_LETT_OBLIQUE_CONTACT         = 9 !  Oblique/Contact                  
integer, parameter, public :: PAN_LETT_OBLIQUE_WEIGHTED        = 10 !  Oblique/Weighted                 
integer, parameter, public :: PAN_LETT_OBLIQUE_BOXED           = 11 !  Oblique/Boxed                    
integer, parameter, public :: PAN_LETT_OBLIQUE_FLATTENED       = 12 !  Oblique/Flattened                
integer, parameter, public :: PAN_LETT_OBLIQUE_ROUNDED         = 13 !  Oblique/Rounded                  
integer, parameter, public :: PAN_LETT_OBLIQUE_OFF_CENTER      = 14 !  Oblique/Off Center               
integer, parameter, public :: PAN_LETT_OBLIQUE_SQUARE          = 15 !  Oblique/Square                   

integer, parameter, public :: PAN_MIDLINE_STANDARD_TRIMMED     = 2 !  Standard/Trimmed                 
integer, parameter, public :: PAN_MIDLINE_STANDARD_POINTED     = 3 !  Standard/Pointed                 
integer, parameter, public :: PAN_MIDLINE_STANDARD_SERIFED     = 4 !  Standard/Serifed                 
integer, parameter, public :: PAN_MIDLINE_HIGH_TRIMMED         = 5 !  High/Trimmed                     
integer, parameter, public :: PAN_MIDLINE_HIGH_POINTED         = 6 !  High/Pointed                     
integer, parameter, public :: PAN_MIDLINE_HIGH_SERIFED         = 7 !  High/Serifed                     
integer, parameter, public :: PAN_MIDLINE_CONSTANT_TRIMMED     = 8 !  Constant/Trimmed                 
integer, parameter, public :: PAN_MIDLINE_CONSTANT_POINTED     = 9 !  Constant/Pointed                 
integer, parameter, public :: PAN_MIDLINE_CONSTANT_SERIFED     = 10 !  Constant/Serifed                 
integer, parameter, public :: PAN_MIDLINE_LOW_TRIMMED          = 11 !  Low/Trimmed                      
integer, parameter, public :: PAN_MIDLINE_LOW_POINTED          = 12 !  Low/Pointed                      
integer, parameter, public :: PAN_MIDLINE_LOW_SERIFED          = 13 !  Low/Serifed                      

integer, parameter, public :: PAN_XHEIGHT_CONSTANT_SMALL       = 2 !  Constant/Small                   
integer, parameter, public :: PAN_XHEIGHT_CONSTANT_STD         = 3 !  Constant/Standard                
integer, parameter, public :: PAN_XHEIGHT_CONSTANT_LARGE       = 4 !  Constant/Large                   
integer, parameter, public :: PAN_XHEIGHT_DUCKING_SMALL        = 5 !  Ducking/Small                    
integer, parameter, public :: PAN_XHEIGHT_DUCKING_STD          = 6 !  Ducking/Standard                 
integer, parameter, public :: PAN_XHEIGHT_DUCKING_LARGE        = 7 !  Ducking/Large                    


integer, parameter, public :: ELF_VENDOR_SIZE = 4

!   The extended logical font         
!   An extension of the T_ENUMLOGFONT   

type  T_EXTLOGFONT
    type (T_LOGFONT)   elfLogFont 
    character        elfFullName (LF_FULLFACESIZE )
    character        elfStyle (LF_FACESIZE )
    integer          elfVersion       !  0 for the first release of NT   
    integer          elfStyleSize 
    integer          elfMatch 
    integer          elfReserved 
    byte             elfVendorId (ELF_VENDOR_SIZE )
    integer          elfCulture       !  0 for Latin                     
    type (T_PANOSE)    elfPanose 
end type  T_EXTLOGFONT

integer, parameter, public :: ELF_VERSION       = 0
integer, parameter, public :: ELF_CULTURE_LATIN = 0

!   EnumFonts Masks   
integer, parameter, public :: RASTER_FONTTYPE   =  #0001
integer, parameter, public :: DEVICE_FONTTYPE   =  #002
integer, parameter, public :: TRUETYPE_FONTTYPE =  #004


!   palette entry flags   

integer, parameter, public :: PC_RESERVED    =  #01    !  palette index used for animation   
integer, parameter, public :: PC_EXPLICIT    =  #02    !  palette index is explicit to device   
integer, parameter, public :: PC_NOCOLLAPSE  =  #04    !  do not match color to system palette   


!   Background Modes   
integer, parameter, public :: TRANSPARENT = 1
integer, parameter, public :: OPAQUE      = 2
integer, parameter, public :: BKMODE_LAST = 2

!   Graphics Modes   

integer, parameter, public :: GM_COMPATIBLE  = 1
integer, parameter, public :: GM_ADVANCED    = 2
integer, parameter, public :: GM_LAST        = 2

!   PolyDraw and GetPath point types   
integer, parameter, public :: PT_CLOSEFIGURE =  #01
integer, parameter, public :: PT_LINETO      =  #02
integer, parameter, public :: PT_BEZIERTO    =  #04
integer, parameter, public :: PT_MOVETO      =  #06

!   Mapping Modes   
integer, parameter, public :: MM_TEXT        = 1
integer, parameter, public :: MM_LOMETRIC    = 2
integer, parameter, public :: MM_HIMETRIC    = 3
integer, parameter, public :: MM_LOENGLISH   = 4
integer, parameter, public :: MM_HIENGLISH   = 5
integer, parameter, public :: MM_TWIPS       = 6
integer, parameter, public :: MM_ISOTROPIC   = 7
integer, parameter, public :: MM_ANISOTROPIC = 8

!   Min and Max Mapping Mode values   
integer, parameter, public :: MM_MIN         = MM_TEXT
integer, parameter, public :: MM_MAX         = MM_ANISOTROPIC
integer, parameter, public :: MM_MAX_FIXEDSCALE = MM_TWIPS

!   Coordinate Modes   
integer, parameter, public :: ABSOLUTE = 1
integer, parameter, public :: RELATIVE = 2
                                              
!   Stock Logical Objects   
integer, parameter, public :: WHITE_BRUSH           = 0
integer, parameter, public :: LTGRAY_BRUSH          = 1
integer, parameter, public :: GRAY_BRUSH            = 2
integer, parameter, public :: DKGRAY_BRUSH          = 3
integer, parameter, public :: BLACK_BRUSH           = 4
integer, parameter, public :: NULL_BRUSH            = 5
integer, parameter, public :: HOLLOW_BRUSH          = NULL_BRUSH
integer, parameter, public :: WHITE_PEN             = 6
integer, parameter, public :: BLACK_PEN             = 7
integer, parameter, public :: NULL_PEN              = 8
integer, parameter, public :: OEM_FIXED_FONT        = 10
integer, parameter, public :: ANSI_FIXED_FONT       = 11
integer, parameter, public :: ANSI_VAR_FONT         = 12
integer, parameter, public :: SYSTEM_FONT           = 13
integer, parameter, public :: DEVICE_DEFAULT_FONT   = 14
integer, parameter, public :: DEFAULT_PALETTE       = 15
integer, parameter, public :: SYSTEM_FIXED_FONT     = 16
integer, parameter, public :: STOCK_LAST            = 16

integer, parameter, public :: CLR_INVALID           =  #FFFFFFFF

!   Brush Styles   
integer, parameter, public :: BS_SOLID          = 0
integer, parameter, public :: BS_NULL           = 1
integer, parameter, public :: BS_HOLLOW         = BS_NULL
integer, parameter, public :: BS_HATCHED        = 2
integer, parameter, public :: BS_PATTERN        = 3
integer, parameter, public :: BS_INDEXED        = 4
integer, parameter, public :: BS_DIBPATTERN     = 5
integer, parameter, public :: BS_DIBPATTERNPT   = 6
integer, parameter, public :: BS_PATTERN8X8     = 7
integer, parameter, public :: BS_DIBPATTERN8X8  = 8

!   Hatch Styles   
integer, parameter, public :: HS_HORIZONTAL         = 0       !  -----   
integer, parameter, public :: HS_VERTICAL           = 1       !  |||||   
integer, parameter, public :: HS_FDIAGONAL          = 2       !  \\\\\   
integer, parameter, public :: HS_BDIAGONAL          = 3       !  /////   
integer, parameter, public :: HS_CROSS              = 4       !  +++++   
integer, parameter, public :: HS_DIAGCROSS          = 5       !  xxxxx   
integer, parameter, public :: HS_FDIAGONAL1         = 6
integer, parameter, public :: HS_BDIAGONAL1         = 7
integer, parameter, public :: HS_SOLID              = 8
integer, parameter, public :: HS_DENSE1             = 9
integer, parameter, public :: HS_DENSE2             = 10
integer, parameter, public :: HS_DENSE3             = 11
integer, parameter, public :: HS_DENSE4             = 12
integer, parameter, public :: HS_DENSE5             = 13
integer, parameter, public :: HS_DENSE6             = 14
integer, parameter, public :: HS_DENSE7             = 15
integer, parameter, public :: HS_DENSE8             = 16
integer, parameter, public :: HS_NOSHADE            = 17
integer, parameter, public :: HS_HALFTONE           = 18
integer, parameter, public :: HS_SOLIDCLR           = 19
integer, parameter, public :: HS_DITHEREDCLR        = 20
integer, parameter, public :: HS_SOLIDTEXTCLR       = 21
integer, parameter, public :: HS_DITHEREDTEXTCLR    = 22
integer, parameter, public :: HS_SOLIDBKCLR         = 23
integer, parameter, public :: HS_DITHEREDBKCLR      = 24
integer, parameter, public :: HS_API_MAX            = 25

!   Pen Styles   
integer, parameter, public :: PS_SOLID          = 0
integer, parameter, public :: PS_DASH           = 1       !  -------    
integer, parameter, public :: PS_DOT            = 2       !  .......    
integer, parameter, public :: PS_DASHDOT        = 3       !  _._._._    
integer, parameter, public :: PS_DASHDOTDOT     = 4       !  _.._.._    
integer, parameter, public :: PS_NULL           = 5
integer, parameter, public :: PS_INSIDEFRAME    = 6
integer, parameter, public :: PS_USERSTYLE      = 7
integer, parameter, public :: PS_ALTERNATE      = 8
integer, parameter, public :: PS_STYLE_MASK     =  #0000000F

integer, parameter, public :: PS_ENDCAP_ROUND   =  #00000000
integer, parameter, public :: PS_ENDCAP_SQUARE  =  #00000100
integer, parameter, public :: PS_ENDCAP_FLAT    =  #00000200
integer, parameter, public :: PS_ENDCAP_MASK    =  #00000F00

integer, parameter, public :: PS_JOIN_ROUND =  #00000000
integer, parameter, public :: PS_JOIN_BEVEL =  #00001000
integer, parameter, public :: PS_JOIN_MITER =  #00002000
integer, parameter, public :: PS_JOIN_MASK  =  #0000F000

integer, parameter, public :: PS_COSMETIC   =  #00000000
integer, parameter, public :: PS_GEOMETRIC  =  #00010000
integer, parameter, public :: PS_TYPE_MASK  =  #000F0000

integer, parameter, public :: AD_COUNTERCLOCKWISE   = 1
integer, parameter, public :: AD_CLOCKWISE          = 2

!   Device Parameters for GetDeviceCaps()   
integer, parameter, public :: DRIVERVERSION  = 0     !  Device driver version                      
integer, parameter, public :: TECHNOLOGY     = 2     !  Device classification                      
integer, parameter, public :: HORZSIZE       = 4     !  Horizontal size in millimeters             
integer, parameter, public :: VERTSIZE       = 6     !  Vertical size in millimeters               
integer, parameter, public :: HORZRES        = 8     !  Horizontal width in pixels                 
integer, parameter, public :: VERTRES        = 10    !  Vertical width in pixels                   
integer, parameter, public :: BITSPIXEL      = 12    !  Number of bits per pixel                   
integer, parameter, public :: PLANES         = 14    !  Number of planes                           
integer, parameter, public :: NUMBRUSHES     = 16    !  Number of brushes the device has           
integer, parameter, public :: NUMPENS        = 18    !  Number of pens the device has              
integer, parameter, public :: NUMMARKERS     = 20    !  Number of markers the device has           
integer, parameter, public :: NUMFONTS       = 22    !  Number of fonts the device has             
integer, parameter, public :: NUMCOLORS      = 24    !  Number of colors the device supports       
integer, parameter, public :: PDEVICESIZE    = 26    !  Size required for device descriptor        
integer, parameter, public :: CURVECAPS      = 28    !  Curve capabilities                         
integer, parameter, public :: LINECAPS       = 30    !  Line capabilities                          
integer, parameter, public :: POLYGONALCAPS  = 32    !  Polygonal capabilities                     
integer, parameter, public :: TEXTCAPS       = 34    !  Text capabilities                          
integer, parameter, public :: CLIPCAPS       = 36    !  Clipping capabilities                      
integer, parameter, public :: RASTERCAPS     = 38    !  Bitblt capabilities                        
integer, parameter, public :: ASPECTX        = 40    !  Length of the X leg                        
integer, parameter, public :: ASPECTY        = 42    !  Length of the Y leg                        
integer, parameter, public :: ASPECTXY       = 44    !  Length of the hypotenuse                   

integer, parameter, public :: LOGPIXELSX    = 88    !  Logical pixels/inch in X                   
integer, parameter, public :: LOGPIXELSY    = 90    !  Logical pixels/inch in Y                   

integer, parameter, public :: SIZEPALETTE   = 104    !  Number of entries in physical palette      
integer, parameter, public :: NUMRESERVED   = 106    !  Number of reserved entries in palette      
integer, parameter, public :: COLORRES      = 108    !  Actual color resolution                    


!  Printing related DeviceCaps. These replace the appropriate Escapes

integer, parameter, public :: PHYSICALWIDTH     = 110 !// Physical Width in device units
integer, parameter, public :: PHYSICALHEIGHT    = 111 !// Physical Height in device units
integer, parameter, public :: PHYSICALOFFSETX   = 112 !// Physical Printable Area x margin
integer, parameter, public :: PHYSICALOFFSETY   = 113 !// Physical Printable Area y margin
integer, parameter, public :: SCALINGFACTORX    =  114 !// Scaling factor x
integer, parameter, public :: SCALINGFACTORY    = 115 !// Scaling factor y

!   Device Capability Masks:   

!   Device Technologies   
integer, parameter, public :: DT_PLOTTER     = 0   !  Vector plotter                     
integer, parameter, public :: DT_RASDISPLAY  = 1   !  Raster display                     
integer, parameter, public :: DT_RASPRINTER  = 2   !  Raster printer                     
integer, parameter, public :: DT_RASCAMERA   = 3   !  Raster camera                      
integer, parameter, public :: DT_CHARSTREAM  = 4   !  Character-stream, PLP              
integer, parameter, public :: DT_METAFILE    = 5   !  Metafile, VDM                      
integer, parameter, public :: DT_DISPFILE    = 6   !  Display-file                       

!   Curve Capabilities   
integer, parameter, public :: CC_NONE     = 0   !  Curves not supported               
integer, parameter, public :: CC_CIRCLES  = 1   !  Can do circles                     
integer, parameter, public :: CC_PIE      = 2   !  Can do pie wedges                  
integer, parameter, public :: CC_CHORD    = 4   !  Can do chord arcs                  
integer, parameter, public :: CC_ELLIPSES = 8   !  Can do ellipese                    
integer, parameter, public :: CC_WIDE     = 16  !  Can do wide lines                  
integer, parameter, public :: CC_STYLED   = 32  !  Can do styled lines                
integer, parameter, public :: CC_WIDESTYLED = 64  !  Can do wide styled lines           
integer, parameter, public :: CC_INTERIORS = 128 !  Can do interiors                   
integer, parameter, public :: CC_ROUNDRECT = 256 !                                     

!   Line Capabilities   
integer, parameter, public :: LC_NONE        = 0   !  Lines not supported                
integer, parameter, public :: LC_POLYLINE    = 2   !  Can do polylines                   
integer, parameter, public :: LC_MARKER      = 4   !  Can do markers                     
integer, parameter, public :: LC_POLYMARKER  = 8   !  Can do polymarkers                 
integer, parameter, public :: LC_WIDE        = 16  !  Can do wide lines                  
integer, parameter, public :: LC_STYLED      = 32  !  Can do styled lines                
integer, parameter, public :: LC_WIDESTYLED  = 64  !  Can do wide styled lines           
integer, parameter, public :: LC_INTERIORS   = 128 !  Can do interiors                   

!   Polygonal Capabilities   
integer, parameter, public :: PC_NONE        = 0   !  Polygonals not supported           
integer, parameter, public :: PC_POLYGON     = 1   !  Can do polygons                    
integer, parameter, public :: PC_RECTANGLE   = 2   !  Can do rectangles                  
integer, parameter, public :: PC_WINDPOLYGON = 4   !  Can do winding polygons            
integer, parameter, public :: PC_TRAPEZOID   = 4   !  Can do trapezoids                  
integer, parameter, public :: PC_SCANLINE    = 8   !  Can do scanlines                   
integer, parameter, public :: PC_WIDE        = 16  !  Can do wide borders                
integer, parameter, public :: PC_STYLED      = 32  !  Can do styled borders              
integer, parameter, public :: PC_WIDESTYLED  = 64  !  Can do wide styled borders         
integer, parameter, public :: PC_INTERIORS   = 128 !  Can do interiors                   

!   Polygonal Capabilities   
integer, parameter, public :: CP_NONE        = 0   !  No clipping of output              
integer, parameter, public :: CP_RECTANGLE   = 1   !  Output clipped to rects            
integer, parameter, public :: CP_REGION      = 2   !                                     

!   Text Capabilities   
integer, parameter, public :: TC_OP_CHARACTER   =  #00000001  !  Can do OutputPrecision   CHARACTER        
integer, parameter, public :: TC_OP_STROKE      =  #00000002  !  Can do OutputPrecision   STROKE           
integer, parameter, public :: TC_CP_STROKE      =  #00000004  !  Can do ClipPrecision     STROKE           
integer, parameter, public :: TC_CR_90          =  #00000008  !  Can do CharRotAbility    90               
integer, parameter, public :: TC_CR_ANY         =  #00000010  !  Can do CharRotAbility    ANY              
integer, parameter, public :: TC_SF_X_YINDEP    =  #00000020  !  Can do ScaleFreedom      X_YINDEPENDENT   
integer, parameter, public :: TC_SA_DOUBLE      =  #00000040  !  Can do ScaleAbility      DOUBLE           
integer, parameter, public :: TC_SA_INTEGER     =  #00000080  !  Can do ScaleAbility      INTEGER          
integer, parameter, public :: TC_SA_CONTIN      =  #00000100  !  Can do ScaleAbility      CONTINUOUS       
integer, parameter, public :: TC_EA_DOUBLE      =  #00000200  !  Can do EmboldenAbility   DOUBLE           
integer, parameter, public :: TC_IA_ABLE        =  #00000400  !  Can do ItalisizeAbility  ABLE             
integer, parameter, public :: TC_UA_ABLE        =  #00000800  !  Can do UnderlineAbility  ABLE             
integer, parameter, public :: TC_SO_ABLE        =  #00001000  !  Can do StrikeOutAbility  ABLE             
integer, parameter, public :: TC_RA_ABLE        =  #00002000  !  Can do RasterFontAble    ABLE             
integer, parameter, public :: TC_VA_ABLE        =  #00004000  !  Can do VectorFontAble    ABLE             
integer, parameter, public :: TC_RESERVED       =  #00008000
integer, parameter, public :: TC_SCROLLBLT      =  #00010000  !  do text scroll with blt                   


!   Raster Capabilities   
integer, parameter, public :: RC_BITBLT         = 1       !  Can do standard BLT.               
integer, parameter, public :: RC_BANDING        = 2       !  Device requires banding support    
integer, parameter, public :: RC_SCALING        = 4       !  Device requires scaling support    
integer, parameter, public :: RC_BITMAP64       = 8       !  Device can support >64K bitmap     
integer, parameter, public :: RC_GDI20_OUTPUT   = #0010      !  has 2.0 output calls           
integer, parameter, public :: RC_GDI20_STATE    = #0020
integer, parameter, public :: RC_SAVEBITMAP     = #0040
integer, parameter, public :: RC_DI_BITMAP      = #0080      !  supports DIB to memory         
integer, parameter, public :: RC_PALETTE        = #0100      !  supports a palette             
integer, parameter, public :: RC_DIBTODEV       = #0200      !  supports DIBitsToDevice        
integer, parameter, public :: RC_BIGFONT        = #0400      !  supports >64K fonts            
integer, parameter, public :: RC_STRETCHBLT     = #0800      !  supports StretchBlt            
integer, parameter, public :: RC_FLOODFILL      = #1000      !  supports FloodFill             
integer, parameter, public :: RC_STRETCHDIB     = #2000      !  supports StretchDIBits         
integer, parameter, public :: RC_OP_DX_OUTPUT   = #4000
integer, parameter, public :: RC_DEVBITS        = #8000

!   DIB color table identifiers   

integer, parameter, public :: DIB_RGB_COLORS = 0 !  color table in RGBs   
integer, parameter, public :: DIB_PAL_COLORS = 1 !  color table in palette indices   
integer, parameter, public :: DIB_PAL_INDICES = 2 !  No color table indices into surf palette   
integer, parameter, public :: DIB_PAL_PHYSINDICES = 2 !  No color table indices into surf palette   
integer, parameter, public :: DIB_PAL_LOGINDICES = 4 !  No color table indices into DC palette   

!   constants for Ge  SetSystemPaletteUse() */

integer, parameter, public :: SYSPAL_ERROR = 0
integer, parameter, public :: SYSPAL_STATIC = 1
integer, parameter, public :: SYSPAL_NOSTATIC = 2

!   constants for CreateDIBitmap   
integer, parameter, public :: CBM_CREATEDIB =  #02   !  create DIB bitmap   
integer, parameter, public :: CBM_INIT =  #04   !  initialize bitmap   

!   ExtFloodFill style flags   
integer, parameter, public :: FLOODFILLBORDER = 0
integer, parameter, public :: FLOODFILLSURFACE = 1

!   size of a device name string   
integer, parameter, public :: CCHDEVICENAME = 32

!   size of a form name string   
integer, parameter, public :: CCHFORMNAME = 32

type  T_DEVMODE
    byte dmDeviceName (CCHDEVICENAME )
    integer*2 dmSpecVersion 
    integer*2 dmDriverVersion 
    integer*2 dmSize 
    integer*2 dmDriverExtra 
    integer*2 dmFields 
    integer*2 dmOrientation 
    integer*2 dmPaperSize 
    integer*2 dmPaperLength 
    integer*2 dmPaperWidth 
    integer*2 dmScale 
    integer*2 dmCopies 
    integer*2 dmDefaultSource 
    integer*2 dmPrintQuality 
    integer*2 dmColor 
    integer*2 dmDuplex 
    integer*2 dmYResolution 
    integer*2 dmTTOption 
    integer*2 dmCollate 
    byte      dmFormName (CCHFORMNAME )
    integer*2 dmUnusedPadding 
    integer dmBitsPerPel 
    integer dmPelsWidth 
    integer dmPelsHeight 
    integer dmDisplayFlags 
    integer dmDisplayFrequency 
end type  T_DEVMODE

!   current version of specification   
integer, parameter, public :: DM_SPECVERSION =  #320

!   field selection bits   
integer, parameter, public :: DM_ORIENTATION       =  #0000001
integer, parameter, public :: DM_PAPERSIZE         =  #0000002
integer, parameter, public :: DM_PAPERLENGTH       =  #0000004
integer, parameter, public :: DM_PAPERWIDTH        =  #0000008
integer, parameter, public :: DM_SCALE             =  #0000010
integer, parameter, public :: DM_COPIES            =  #0000100
integer, parameter, public :: DM_DEFAULTSOURCE     =  #0000200
integer, parameter, public :: DM_PRINTQUALITY      =  #0000400
integer, parameter, public :: DM_COLOR             =  #0000800
integer, parameter, public :: DM_DUPLEX            =  #0001000
integer, parameter, public :: DM_YRESOLUTION       =  #0002000
integer, parameter, public :: DM_TTOPTION          =  #0004000
integer, parameter, public :: DM_COLLATE           =  #0008000
integer, parameter, public :: DM_FORMNAME          =  #0010000

!   orientation selections   
integer, parameter, public :: DMORIENT_PORTRAIT = 1
integer, parameter, public :: DMORIENT_LANDSCAPE = 2

!   paper selections   
integer, parameter, public :: DMPAPER_LETTER       = 1           !  Letter 8 1/2 x 11 in                 
integer, parameter, public :: DMPAPER_FIRST        = DMPAPER_LETTER
integer, parameter, public :: DMPAPER_LETTERSMALL  = 2           !  Letter Small 8 1/2 x 11 in           
integer, parameter, public :: DMPAPER_TABLOID      = 3           !  Tabloid 11 x 17 in                   
integer, parameter, public :: DMPAPER_LEDGER       = 4           !  Ledger 17 x 11 in                    
integer, parameter, public :: DMPAPER_LEGAL        = 5           !  Legal 8 1/2 x 14 in                  
integer, parameter, public :: DMPAPER_STATEMENT    = 6           !  Statement 5 1/2 x 8 1/2 in           
integer, parameter, public :: DMPAPER_EXECUTIVE    = 7           !  Executive 7 1/4 x 10 1/2 in          
integer, parameter, public :: DMPAPER_A3           = 8           !  A3 297 x 420 mm                      
integer, parameter, public :: DMPAPER_A4           = 9           !  A4 210 x 297 mm                      
integer, parameter, public :: DMPAPER_A4SMALL      = 10          !  A4 Small 210 x 297 mm                
integer, parameter, public :: DMPAPER_A5           = 11          !  A5 148 x 210 mm                      
integer, parameter, public :: DMPAPER_B4           = 12          !  B4 250 x 354                         
integer, parameter, public :: DMPAPER_B5           = 13          !  B5 182 x 257 mm                      
integer, parameter, public :: DMPAPER_FOLIO        = 14          !  Folio 8 1/2 x 13 in                  
integer, parameter, public :: DMPAPER_QUARTO       = 15          !  Quarto 215 x 275 mm                  
integer, parameter, public :: DMPAPER_10X14        =  #16          !  1  14 in                             
integer, parameter, public :: DMPAPER_11X17        = 17          !  11x17 in                             
integer, parameter, public :: DMPAPER_NOTE         = 18          !  Note 8 1/2 x 11 in                   
integer, parameter, public :: DMPAPER_ENV_9        = 19          !  Envelope #9 3 7/8 x 8 7/8            
integer, parameter, public :: DMPAPER_ENV_10       = 20          !  Envelope #10 4 1/8 x 9 1/2           
integer, parameter, public :: DMPAPER_ENV_11       = 21          !  Envelope #11 4 1/2 x 10 3/8          
integer, parameter, public :: DMPAPER_ENV_12       = 22          !  Envelope #12 4 \276 x 11             
integer, parameter, public :: DMPAPER_ENV_14       = 23          !  Envelope #14 5 x 11 1/2              
integer, parameter, public :: DMPAPER_CSHEET       = 24          !  C size sheet                         
integer, parameter, public :: DMPAPER_DSHEET       = 25          !  D size sheet                         
integer, parameter, public :: DMPAPER_ESHEET       = 26          !  E size sheet                         
integer, parameter, public :: DMPAPER_ENV_DL       = 27          !  Envelope DL 110 x 220mm              
integer, parameter, public :: DMPAPER_ENV_C5       = 28          !  Envelope C5 162 x 229 mm             
integer, parameter, public :: DMPAPER_ENV_C3       = 29          !  Envelope C3  324 x 458 mm            
integer, parameter, public :: DMPAPER_ENV_C4       = 30          !  Envelope C4  229 x 324 mm            
integer, parameter, public :: DMPAPER_ENV_C6       = 31          !  Envelope C6  114 x 162 mm            
integer, parameter, public :: DMPAPER_ENV_C65      = 32          !  Envelope C65 114 x 229 mm            
integer, parameter, public :: DMPAPER_ENV_B4       = 33          !  Envelope B4  250 x 353 mm            
integer, parameter, public :: DMPAPER_ENV_B5       = 34          !  Envelope B5  176 x 250 mm            
integer, parameter, public :: DMPAPER_ENV_B6       = 35          !  Envelope B6  176 x 125 mm            
integer, parameter, public :: DMPAPER_ENV_ITALY    = 36          !  Envelope 110 x 230 mm                
integer, parameter, public :: DMPAPER_ENV_MONARCH  = 37          !  Envelope Monarch 3.875 x 7.5 in      
integer, parameter, public :: DMPAPER_ENV_PERSONAL = 38         !  6 3/4 Envelope 3 5/8 x 6 1/2 in      
integer, parameter, public :: DMPAPER_FANFOLD_US   = 39          !  US Std Fanfold 14 7/8 x 11 in        
integer, parameter, public :: DMPAPER_FANFOLD_STD_GERMAN = 40  !  German Std Fanfold 8 1/2 x 12 in     
integer, parameter, public :: DMPAPER_FANFOLD_LGL_GERMAN = 41  !  German Legal Fanfold 8 1/2 x 13 in   

integer, parameter, public :: DMPAPER_LAST = DMPAPER_FANFOLD_LGL_GERMAN

integer, parameter, public :: DMPAPER_USER = 256

!   bin selections   
integer, parameter, public :: DMBIN_UPPER = 1
integer, parameter, public :: DMBIN_FIRST = DMBIN_UPPER
integer, parameter, public :: DMBIN_ONLYONE = 1
integer, parameter, public :: DMBIN_LOWER = 2
integer, parameter, public :: DMBIN_MIDDLE = 3
integer, parameter, public :: DMBIN_MANUAL = 4
integer, parameter, public :: DMBIN_ENVELOPE = 5
integer, parameter, public :: DMBIN_ENVMANUAL = 6
integer, parameter, public :: DMBIN_AUTO = 7
integer, parameter, public :: DMBIN_TRACTOR = 8
integer, parameter, public :: DMBIN_SMALLFMT = 9
integer, parameter, public :: DMBIN_LARGEFMT = 10
integer, parameter, public :: DMBIN_LARGECAPACITY = 11
integer, parameter, public :: DMBIN_CASSETTE = 14
integer, parameter, public :: DMBIN_LAST = DMBIN_CASSETTE

integer, parameter, public :: DMBIN_USER = 256     !  device specific bins start here   

!   print qualities   
integer, parameter, public :: DMRES_DRAFT = (-1)
integer, parameter, public :: DMRES_LOW = (-2)
integer, parameter, public :: DMRES_MEDIUM = (-3)
integer, parameter, public :: DMRES_HIGH = (-4)

!   color enabl  disable for color printers */
integer, parameter, public :: DMCOLOR_MONOCHROME = 1
integer, parameter, public :: DMCOLOR_COLOR = 2

!   duplex enable   
integer, parameter, public :: DMDUP_SIMPLEX = 1
integer, parameter, public :: DMDUP_VERTICAL = 2
integer, parameter, public :: DMDUP_HORIZONTAL = 3

!   TrueType options   
integer, parameter, public :: DMTT_BITMAP = 1       !  print TT fonts as graphics   
integer, parameter, public :: DMTT_DOWNLOAD = 2       !  download TT fonts as soft fonts   
integer, parameter, public :: DMTT_SUBDEV = 3       !  substitute device fonts for TT fonts   

!   Collation selections   
integer, parameter, public :: DMCOLLATE_FALSE = 0
integer, parameter, public :: DMCOLLATE_TRUE = 1

!   T_DEVMODE dmDisplayFlags flags   

integer, parameter, public :: DM_GRAYSCALE =  #00000001
integer, parameter, public :: DM_INTERLACED =  #00000002

!   GetRegionDat  ExtCreateRegion */

integer, parameter, public :: RDH_RECTANGLES = 1

type  T_RGNDATAHEADER
    integer dwSize 
    integer iType 
    integer nCount 
    integer nRgnSize 
    type (T_RECT) rcBound 
end type  T_RGNDATAHEADER

type  T_RGNDATA
    type (T_RGNDATAHEADER) rdh 
    character Buffer (1 )
end type  T_RGNDATA


type  T_ABC
    integer abcA 
    integer abcB 
    integer abcC 
end type  T_ABC

type  T_ABCFLOAT
    real abcfA 
    real abcfB 
    real abcfC 
end type  T_ABCFLOAT

type  T_OUTLINETEXTMETRIC
    integer otmSize 
    type (T_TEXTMETRIC) otmTextMetrics 
    byte otmFiller 
    type (T_PANOSE) otmPanoseNumber 
    integer otmfsSelection 
    integer otmfsType 
    integer otmsCharSlopeRise 
    integer otmsCharSlopeRun 
    integer otmItalicAngle 
    integer otmEMSquare 
    integer otmAscent 
    integer otmDescent 
    integer otmLineGap 
    integer otmsCapEmHeight 
    integer otmsXHeight 
    type (T_RECT) otmrcFontBox 
    integer otmMacAscent 
    integer otmMacDescent 
    integer otmMacLineGap 
    integer otmusMinimumPPEM 
    type (T_POINT) otmptSubscriptSize 
    type (T_POINT) otmptSubscriptOffset 
    type (T_POINT) otmptSuperscriptSize 
    type (T_POINT) otmptSuperscriptOffset 
    integer otmsStrikeoutSize 
    integer otmsStrikeoutPosition 
    integer otmsUnderscoreSize 
    integer otmsUnderscorePosition 
    integer(4) otmpFamilyName 
    integer(4) otmpFaceName 
    integer(4) otmpStyleName 
    integer(4) otmpFullName 
end type  T_OUTLINETEXTMETRIC

type  T_POLYTEXT
    integer x 
    integer y 
    integer n 
    integer lpstr 
    integer uiFlags 
    type (T_RECT) rcl 
    integer pdx 
end type  T_POLYTEXT


type  T_FIXED
    integer*2 fract 
    integer*2 value 
end type  T_FIXED


type  T_MAT2
     type (T_FIXED) eM11 
     type (T_FIXED) eM12 
     type (T_FIXED) eM21 
     type (T_FIXED) eM22 
end type  T_MAT2

type  T_GLYPHMETRICS
    integer         gmBlackBoxX 
    integer         gmBlackBoxY 
    type (T_POINT)  gmptGlyphOrigin 
    integer*2       gmCellIncX 
    integer*2       gmCellIncY 
end type  T_GLYPHMETRICS

!   GetGlyphOutline constants

integer, parameter, public :: GGO_METRICS = 0
integer, parameter, public :: GGO_BITMAP = 1
integer, parameter, public :: GGO_NATIVE = 2

integer, parameter, public :: TT_POLYGON_TYPE = 24

integer, parameter, public :: TT_PRIM_LINE = 1
integer, parameter, public :: TT_PRIM_QSPLINE = 2

type  T_POINTFX
    type (T_FIXED) x 
    type (T_FIXED) y 
end type  T_POINTFX

type  T_TTPOLYCURVE
    integer*2 wType 
    integer*2 cpfx 
    type (T_POINTFX) apfx (1 )
end type  T_TTPOLYCURVE

type  T_TTPOLYGONHEADER
    integer cb 
    integer dwType 
    type (T_POINTFX) pfxStart 
end type  T_TTPOLYGONHEADER

type  T_RASTERIZER_STATUS
    integer*2 nSize 
    integer*2 wFlags 
    integer*2 nLanguageID 
end type  T_RASTERIZER_STATUS

!   bits defined in wFlags of T_RASTERIZER_STATUS   
integer, parameter, public :: TT_AVAILABLE =  #0001
integer, parameter, public :: TT_ENABLED =  #0002

type T_PIXELFORMATDESCRIPTOR
    integer(2)  nSize
    integer(2)  nVersion
    integer(4)  dwFlags;
    BYTE  iPixelType
    BYTE  cColorBits
    BYTE  cRedBits
    BYTE  cRedShift
    BYTE  cGreenBits
    BYTE  cGreenShift
    BYTE  cBlueBits
    BYTE  cBlueShift
    BYTE  cAlphaBits
    BYTE  cAlphaShift
    BYTE  cAccumBits
    BYTE  cAccumRedBits
    BYTE  cAccumGreenBits
    BYTE  cAccumBlueBits
    BYTE  cAccumAlphaBits
    BYTE  cDepthBits
    BYTE  cStencilBits
    BYTE  cAuxBuffers
    BYTE  iLayerType
    BYTE  bReserved
    integer dwLayerMask
    integer dwVisibleMask
    integer dwDamageMask
end type T_PIXELFORMATDESCRIPTOR

!       Pixel Types
integer, parameter, public :: PFD_TYPE_RGBA             = 0
integer, parameter, public :: PFD_TYPE_COLORINDEX   = 1

!       Layer Types
integer, parameter, public :: PFD_MAIN_PLANE = 0
integer, parameter, public :: PFD_OVERLAY_PLANE = 1
integer, parameter, public :: PFD_UNDERLAY_PLANE = -1

!       T_PIXELFORMATDESCRIPTOR  flags
integer, parameter, public :: PFD_DOUBLEBUFFER         =    #00000001
integer, parameter, public :: PFD_STEREO               =    #00000002
integer, parameter, public :: PFD_DRAW_TO_WINDOW       =    #00000004
integer, parameter, public :: PFD_DRAW_TO_BITMAP       =    #00000008
integer, parameter, public :: PFD_SUPPORT_GDI          =    #00000010
integer, parameter, public :: PFD_SUPPORT_OPENGL       =    #00000020
integer, parameter, public :: PFD_GENERIC_FORMAT       =    #00000040
integer, parameter, public :: PFD_NEED_PALETTE         =    #00000080
integer, parameter, public :: PFD_NEED_SYSTEM_PALETTE  =    #00000100

! T_PIXELFORMATDESCRIPTOR flags for use in ChoosePixelFormat Only
integer, parameter, public :: PFD_DOUBLEBUFFER_DONTCARE=    #40000000
integer, parameter, public :: PFD_STEREO_DONTCARE      =    #80000000


!   mode selections for the device mode function   
! These have already been defined
!integer, parameter, public :: DM_UPDATE  = 1
!integer, parameter, public :: DM_COPY    = 2
!integer, parameter, public :: DM_PROMPT  = 4
!integer, parameter, public :: DM_MODIFY  = 8
!
!integer, parameter, public :: DM_IN_BUFFER     = DM_MODIFY
!integer, parameter, public :: DM_IN_PROMPT     = DM_PROMPT
!integer, parameter, public :: DM_OUT_BUFFER    = DM_COPY
!integer, parameter, public :: DM_OUT_DEFAULT   = DM_UPDATE
!
!!   device capabilities indices   
!integer, parameter, public :: DC_FIELDS     = 1
!integer, parameter, public :: DC_PAPERS     = 2
!integer, parameter, public :: DC_PAPERSIZE  = 3
!integer, parameter, public :: DC_MINEXTENT  = 4
!integer, parameter, public :: DC_MAXEXTENT  = 5
!integer, parameter, public :: DC_BINS       = 6
!integer, parameter, public :: DC_DUPLEX     = 7
!integer, parameter, public :: DC_SIZE       = 8
!integer, parameter, public :: DC_EXTRA      = 9
!integer, parameter, public :: DC_VERSION    = 10
!integer, parameter, public :: DC_DRIVER     = 11
!integer, parameter, public :: DC_BINNAMES   = 12
!integer, parameter, public :: DC_ENUMRESOLUTIONS = 13
!integer, parameter, public :: DC_FILEDEPENDENCIES = 14
!integer, parameter, public :: DC_TRUETYPE   = 15
!integer, parameter, public :: DC_PAPERNAMES = 16
!integer, parameter, public :: DC_ORIENTATION = 17
!integer, parameter, public :: DC_COPIES     = 18
!
!!   bit fields of the return value (DWORD) for DC_TRUETYPE   
integer, parameter, public :: DCTT_BITMAP    =  #0000001
integer, parameter, public :: DCTT_DOWNLOAD  =  #0000002
integer, parameter, public :: DCTT_SUBDEV    =  #0000004


!   new GDI   

type T_DIBSECTION
    type (T_BITMAP)             dsBm
    type (T_BITMAPINFOHEADER)   dsBmih
    integer                     dsBitfields(3)
    integer                     dshSection
    integer                     dsOffset
end type T_DIBSECTION


!   Flags value for T_COLORADJUSTMENT   
integer, parameter, public :: CA_NEGATIVE =  #0001
integer, parameter, public :: CA_LOG_FILTER =  #0002

!   IlluminantIndex values   
integer, parameter, public :: ILLUMINANT_DEVICE_DEFAULT = 0
integer, parameter, public :: ILLUMINANT_A = 1
integer, parameter, public :: ILLUMINANT_B = 2
integer, parameter, public :: ILLUMINANT_C = 3
integer, parameter, public :: ILLUMINANT_D50 = 4
integer, parameter, public :: ILLUMINANT_D55 = 5
integer, parameter, public :: ILLUMINANT_D65 = 6
integer, parameter, public :: ILLUMINANT_D75 = 7
integer, parameter, public :: ILLUMINANT_F2 = 8
integer, parameter, public :: ILLUMINANT_MAX_INDEX = ILLUMINANT_F2

integer, parameter, public :: ILLUMINANT_TUNGSTEN = ILLUMINANT_A
integer, parameter, public :: ILLUMINANT_DAYLIGHT = ILLUMINANT_C
integer, parameter, public :: ILLUMINANT_FLUORESCENT = ILLUMINANT_F2
integer, parameter, public :: ILLUMINANT_NTSC = ILLUMINANT_C

!   Min and max for RedGamma, GreenGamma, BlueGamma   
integer*2, parameter, public :: RGB_GAMMA_MIN               =  02500
integer*2, parameter, public :: RGB_GAMMA_MAX                = 65000

!   Min and max for ReferenceBlack and ReferenceWhite   
integer*2, parameter, public :: REFERENCE_WHITE_MIN          = 6000
integer*2, parameter, public :: REFERENCE_WHITE_MAX          = 10000
integer*2, parameter, public :: REFERENCE_BLACK_MIN          = 0
integer*2, parameter, public :: REFERENCE_BLACK_MAX          = 4000

!   Min and max for Contrast, Brightness, Colorfulness, RedGreenTint   
integer*2, parameter, public :: COLOR_ADJ_MIN                = -100
integer*2, parameter, public :: COLOR_ADJ_MAX                = 100

type  T_COLORADJUSTMENT
    integer*2 caSize  
    integer*2 caFlags  
    integer*2 caIlluminantIndex  
    integer*2 caRedGamma  
    integer*2 caGreenGamma  
    integer*2 caBlueGamma  
    integer*2 caReferenceBlack  
    integer*2 caReferenceWhite  
    integer*2 caContrast  
    integer*2 caBrightness  
    integer*2 caColorfulness  
    integer*2 caRedGreenTint  
end type  T_COLORADJUSTMENT

type  T_DOCINFO
    integer cbSize 
    integer lpszDocName 
    integer lpszOutput 
end type  T_DOCINFO


integer, parameter, public :: FONTMAPPER_MAX = 10

type  T_KERNINGPAIR
   integer*2 wFirst 
   integer*2 wSecond  
   integer iKernAmount 
end type  T_KERNINGPAIR



!  Enhanced metafile constants.

integer, parameter, public :: ENHMETA_SIGNATURE =  #464D4520

!  Stock object flag used in the object handle index in the enhanced
!  metafile records.
!  E.g. The object handle index (META_STOCK_OBJECT | BLACK_BRUSH)
!  represents the stock object BLACK_BRUSH.

integer, parameter, public :: ENHMETA_STOCK_OBJECT =  #80000000

!  Enhanced metafile record types.

integer, parameter, public :: EMR_HEADER                    = 1
integer, parameter, public :: EMR_POLYBEZIER                = 2
integer, parameter, public :: EMR_POLYGON                   = 3
integer, parameter, public :: EMR_POLYLINE                  = 4
integer, parameter, public :: EMR_POLYBEZIERTO              = 5
integer, parameter, public :: EMR_POLYLINETO                = 6
integer, parameter, public :: EMR_POLYPOLYLINE              = 7
integer, parameter, public :: EMR_POLYPOLYGON               = 8
integer, parameter, public :: EMR_SETWINDOWEXTEX            = 9
integer, parameter, public :: EMR_SETWINDOWORGEX            = 10
integer, parameter, public :: EMR_SETVIEWPORTEXTEX          = 11
integer, parameter, public :: EMR_SETVIEWPORTORGEX          = 12
integer, parameter, public :: EMR_SETBRUSHORGEX             = 13
integer, parameter, public :: EMR_EOF                       = 14
integer, parameter, public :: EMR_SETPIXELV                 = 15
integer, parameter, public :: EMR_SETMAPPERFLAGS            = 16
integer, parameter, public :: EMR_SETMAPMODE                = 17
integer, parameter, public :: EMR_SETBKMODE                 = 18
integer, parameter, public :: EMR_SETPOLYFILLMODE           = 19
integer, parameter, public :: EMR_SETROP2                   = 20
integer, parameter, public :: EMR_SETSTRETCHBLTMODE         = 21
integer, parameter, public :: EMR_SETTEXTALIGN              = 22
integer, parameter, public :: EMR_SETCOLORADJUSTMENT        = 23
integer, parameter, public :: EMR_SETTEXTCOLOR              = 24
integer, parameter, public :: EMR_SETBKCOLOR                = 25
integer, parameter, public :: EMR_OFFSETCLIPRGN             = 26
integer, parameter, public :: EMR_MOVETOEX                  = 27
integer, parameter, public :: EMR_SETMETARGN                = 28
integer, parameter, public :: EMR_EXCLUDECLIPRECT           = 29
integer, parameter, public :: EMR_INTERSECTCLIPRECT         = 30
integer, parameter, public :: EMR_SCALEVIEWPORTEXTEX        = 31
integer, parameter, public :: EMR_SCALEWINDOWEXTEX          = 32
integer, parameter, public :: EMR_SAVEDC                    = 33
integer, parameter, public :: EMR_RESTOREDC                 = 34
integer, parameter, public :: EMR_SETWORLDTRANSFORM         = 35
integer, parameter, public :: EMR_MODIFYWORLDTRANSFORM      = 36
integer, parameter, public :: EMR_SELECTOBJECT              = 37
integer, parameter, public :: EMR_CREATEPEN                 = 38
integer, parameter, public :: EMR_CREATEBRUSHINDIRECT       = 39
integer, parameter, public :: EMR_DELETEOBJECT              = 40
integer, parameter, public :: EMR_ANGLEARC                  = 41
integer, parameter, public :: EMR_ELLIPSE                   = 42
integer, parameter, public :: EMR_RECTANGLE                 = 43
integer, parameter, public :: EMR_ROUNDRECT                 = 44
integer, parameter, public :: EMR_ARC                       = 45
integer, parameter, public :: EMR_CHORD                     = 46
integer, parameter, public :: EMR_PIE                       = 47
integer, parameter, public :: EMR_SELECTPALETTE             = 48
integer, parameter, public :: EMR_CREATEPALETTE             = 49
integer, parameter, public :: EMR_SETPALETTEENTRIES         = 50
integer, parameter, public :: EMR_RESIZEPALETTE             = 51
integer, parameter, public :: EMR_REALIZEPALETTE            = 52
integer, parameter, public :: EMR_EXTFLOODFILL              = 53
integer, parameter, public :: EMR_LINETO                    = 54
integer, parameter, public :: EMR_ARCTO                     = 55
integer, parameter, public :: EMR_POLYDRAW                  = 56
integer, parameter, public :: EMR_SETARCDIRECTION           = 57
integer, parameter, public :: EMR_SETMITERLIMIT             = 58
integer, parameter, public :: EMR_BEGINPATH                 = 59
integer, parameter, public :: EMR_ENDPATH                   = 60
integer, parameter, public :: EMR_CLOSEFIGURE               = 61
integer, parameter, public :: EMR_FILLPATH                  = 62
integer, parameter, public :: EMR_STROKEANDFILLPATH         = 63
integer, parameter, public :: EMR_STROKEPATH                = 64
integer, parameter, public :: EMR_FLATTENPATH               = 65
integer, parameter, public :: EMR_WIDENPATH                 = 66
integer, parameter, public :: EMR_SELECTCLIPPATH            = 67
integer, parameter, public :: EMR_ABORTPATH                 = 68

integer, parameter, public :: EMR_GDICOMMENT                = 70
integer, parameter, public :: EMR_FILLRGN                   = 71
integer, parameter, public :: EMR_FRAMERGN                  = 72
integer, parameter, public :: EMR_INVERTRGN                 = 73
integer, parameter, public :: EMR_PAINTRGN                  = 74
integer, parameter, public :: EMR_EXTSELECTCLIPRGN          = 75
integer, parameter, public :: EMR_BITBLT                    = 76
integer, parameter, public :: EMR_STRETCHBLT                = 77
integer, parameter, public :: EMR_MASKBLT                   = 78
integer, parameter, public :: EMR_PLGBLT                    = 79
integer, parameter, public :: EMR_SETDIBITSTODEVICE         = 80
integer, parameter, public :: EMR_STRETCHDIBITS             = 81
integer, parameter, public :: EMR_EXTCREATEFONTINDIRECTW    = 82
integer, parameter, public :: EMR_EXTTEXTOUTA               = 83
integer, parameter, public :: EMR_EXTTEXTOUTW               = 84
integer, parameter, public :: EMR_POLYBEZIER16              = 85
integer, parameter, public :: EMR_POLYGON16                 = 86
integer, parameter, public :: EMR_POLYLINE16                = 87
integer, parameter, public :: EMR_POLYBEZIERTO16            = 88
integer, parameter, public :: EMR_POLYLINETO16              = 89
integer, parameter, public :: EMR_POLYPOLYLINE16            = 90
integer, parameter, public :: EMR_POLYPOLYGON16             = 91
integer, parameter, public :: EMR_POLYDRAW16                = 92
integer, parameter, public :: EMR_CREATEMONOBRUSH           = 93
integer, parameter, public :: EMR_CREATEDIBPATTERNBRUSHPT   = 94
integer, parameter, public :: EMR_EXTCREATEPEN              = 95
integer, parameter, public :: EMR_POLYTEXTOUTA              = 96
integer, parameter, public :: EMR_POLYTEXTOUTW              = 97

integer, parameter, public :: EMR_MIN = 1
integer, parameter, public :: EMR_MAX = 97

!  Base record type for the enhanced metafile.

type  T_EMR
    integer iType                !  Enhanced metafile record type
    integer nSize                !  Length of the record in bytes.
                                 !  This must be a multiple of 4.
end type  T_EMR

!  Base text record type for the enhanced metafile.

type  T_EMRTEXT
    type (T_POINTL) ptlReference 
    integer nChars 
    integer offString            !  Offset to the string
    integer fOptions 
    type (T_RECTL) rcl 
    integer offDx                !  Offset to the inter-character spacing array.
                                 !  This is always given.
end type  T_EMRTEXT

!  Record structures for the enhanced metafile.

type  T_EMRSETMITERLIMIT
    type (T_EMR) emrf 
    real eMiterLimit 
end type  T_EMRSETMITERLIMIT

type  T_EMRRESTOREDC
    type (T_EMR) emrf 
    integer iRelative           !  Specifies a relative instance
end type  T_EMRRESTOREDC

type  T_EMRSETARCDIRECTION
    type (T_EMR) emrf 
    integer iArcDirection        !  Specifies the arc direction in the
                                 !  advanced graphics mode.
end type  T_EMRSETARCDIRECTION

type  T_EMRSETMAPPERFLAGS
    type (T_EMR) emrf 
    integer dwFlags 
end type  T_EMRSETMAPPERFLAGS

type  T_EMRSELECTPALETTE
    type (T_EMR) emrf 
    integer ihPal                !  Palette handle index, background mode only
end type  T_EMRSELECTPALETTE

type  T_EMRRESIZEPALETTE
    type (T_EMR) emrf 
    integer ihPal               !  Palette handle index
    integer cEntries 
end type  T_EMRRESIZEPALETTE

type  T_EMRSETPALETTEENTRIES
    type (T_EMR) emrf 
    integer ihPal               !  Palette handle index
    integer iStart 
    integer cEntries 
    type (T_PALETTEENTRY) aPalEntries (1 ) !  The peFlags fields do not contain any flags
end type  T_EMRSETPALETTEENTRIES

type  T_EMRSETCOLORADJUSTMENT
    type (T_EMR) emrf 
    type (T_COLORADJUSTMENT) ColorAdjustmentf 
end type  T_EMRSETCOLORADJUSTMENT

type  T_EMRGDICOMMENT
    type (T_EMR) emrf 
    integer cbData              !  Size of data in bytes
    character Data (1 )
end type  T_EMRGDICOMMENT

type  T_EMREOF
    type (T_EMR) emrf 
    integer nPalEntries          !  Number of palette entries
    integer offPalEntries        !  Offset to the palette entries
    integer nSizeLast            !  Same as nSize and must be the last DWORD
                                 !  of the record.  The palette entries,
                                 !  if exist, precede this field.
end type  T_EMREOF

type  T_EMROFFSETCLIPRGN
    type (T_EMR) emrf 
    type (T_POINTL) ptlOffset 
end type  T_EMROFFSETCLIPRGN

type  T_EMRSETWORLDTRANSFORM
    type (T_EMR) emrf 
    type (T_XFORM) xformf 
end type  T_EMRSETWORLDTRANSFORM

type  T_EMRMODIFYWORLDTRANSFORM
    type (T_EMR) emrf 
    type (T_XFORM) xformf 
    integer iMode 
end type  T_EMRMODIFYWORLDTRANSFORM

type  T_EMRSETPIXELV
    type (T_EMR) emrf 
    type (T_POINTL) ptlPixel 
    integer crColor 
end type  T_EMRSETPIXELV

type  T_EMREXTFLOODFILL
    type (T_EMR) emrf 
    type (T_POINTL) ptlStart 
    integer crColor 
    integer iMode 
end type  T_EMREXTFLOODFILL

type  T_EMRROUNDRECT
    type (T_EMR) emrf 
    type (T_RECTL) rclBox              !  Inclusive-inclusive bounding rectangle
    type (T_SIZE) szlCorner 
end type  T_EMRROUNDRECT

type  T_EMRANGLEARC
    type (T_EMR) emrf 
    type (T_POINTL) ptlCenter 
    integer nRadius 
    real eStartAngle 
    real eSweepAngle 
end type  T_EMRANGLEARC

type  T_EMRPOLYDRAW16
    type (T_EMR) emrf 
    type (T_RECTL) rclBounds           !  Inclusive-inclusive bounds in device units
    integer cpts                     !  Number of points
    type (T_POINTS) apts (1 )          !  Array of points
    character abTypes (1 )           !  Array of point types
end type  T_EMRPOLYDRAW16

type  T_EMRFILLRGN
    type (T_EMR) emrf 
    type (T_RECTL) rclBounds           !  Inclusive-inclusive bounds in device units
    integer cbRgnData                !  Size of region data in bytes
    integer ihBrush                  !  Brush handle index
    character RgnData (1 )
end type  T_EMRFILLRGN

type  T_EMRFRAMERGN
    type (T_EMR) emrf 
    type (T_RECTL) rclBounds            !  Inclusive-inclusive bounds in device units
    integer cbRgnData                 !  Size of region data in bytes
    integer ihBrush                     !  Brush handle index
    type (T_SIZE) szlStroke 
    character RgnData (1 )
end type  T_EMRFRAMERGN

type  T_EMREXTSELECTCLIPRGN
    type (T_EMR) emrf 
    integer cbRgnData            !  Size of region data in bytes
    integer iMode 
    character RgnData (1 )
end type  T_EMREXTSELECTCLIPRGN

type  T_EMRBITBLT
    type (T_EMR) emrf 
    type (T_RECTL) rclBounds           !  Inclusive-inclusive bounds in device units
    integer xDest 
    integer yDest 
    integer cxDest 
    integer cyDest 
    integer dwRop 
    integer xSrc 
    integer ySrc 
    type (T_XFORM) xformSrc            !  Source DC transform
    integer crBkColorSrc         !  Source DC BkColor in RGB
    integer iUsageSrc            !  Source bitmap info color table usage
                                 !  (DIB_RGB_COLORS)
    integer offBmiSrc            !  Offset to the source T_BITMAPINFO structure
    integer cbBmiSrc             !  Size of the source T_BITMAPINFO structure
    integer offBitsSrc           !  Offset to the source bitmap bits
    integer cbBitsSrc            !  Size of the source bitmap bits
end type  T_EMRBITBLT

type  T_EMRSTRETCHBLT
    type (T_EMR) emrf 
    type (T_RECTL) rclBounds            !  Inclusive-inclusive bounds in device units
    integer xDest 
    integer yDest 
    integer cxDest 
    integer cyDest 
    integer dwRop 
    integer xSrc 
    integer ySrc 
    type (T_XFORM) xformSrc             !  Source DC transform
    integer crBkColorSrc              !  Source DC BkColor in RGB
    integer iUsageSrc            !  Source bitmap info color table usage
                                 !  (DIB_RGB_COLORS)
    integer offBmiSrc            !  Offset to the source T_BITMAPINFO structure
    integer cbBmiSrc             !  Size of the source T_BITMAPINFO structure
    integer offBitsSrc           !  Offset to the source bitmap bits
    integer cbBitsSrc            !  Size of the source bitmap bits
    integer cxSrc 
    integer cySrc 
end type  T_EMRSTRETCHBLT

type  T_EMRMASKBLT
    type (T_EMR) emrf 
    type (T_RECTL) rclBounds            !  Inclusive-inclusive bounds in device units
    integer xDest 
    integer yDest 
    integer cxDest 
    integer cyDest 
    integer dwRop 
    integer xSrc 
    integer ySrc 
    type (T_XFORM) xformSrc             !  Source DC transform
    integer crBkColorSrc        !  Source DC BkColor in RGB
    integer iUsageSrc           !  Source bitmap info color table usage
                                !  (DIB_RGB_COLORS)
    integer offBmiSrc           !  Offset to the source T_BITMAPINFO structure
    integer cbBmiSrc            !  Size of the source T_BITMAPINFO structure
    integer offBitsSrc          !  Offset to the source bitmap bits
    integer cbBitsSrc           !  Size of the source bitmap bits
    integer xMask 
    integer yMask 
    integer iUsageMask           !  Mask bitmap info color table usage
    integer offBmiMask           !  Offset to the mask T_BITMAPINFO structure if any
    integer cbBmiMask             !  Size of the mask T_BITMAPINFO structure if any
    integer offBitsMask         !  Offset to the mask bitmap bits if any
    integer cbBitsMask           !  Size of the mask bitmap bits if any
end type  T_EMRMASKBLT

type  T_EMRPLGBLT
    type (T_EMR) emrf 
    type (T_RECTL) rclBounds       !  Inclusive-inclusive bounds in device units
    type (T_POINTL) aptlDest (3 )
    integer xSrc 
    integer ySrc 
    integer cxSrc 
    integer cySrc 
    type (T_XFORM) xformSrc              !  Source DC transform
    integer crBkColorSrc               !  Source DC BkColor in RGB
    integer iUsageSrc                  !  Source bitmap info color table usage
                                       !  (DIB_RGB_COLORS)
    integer offBmiSrc                  !  Offset to the source T_BITMAPINFO structure
    integer cbBmiSrc                   !  Size of the source T_BITMAPINFO structure
    integer offBitsSrc                 !  Offset to the source bitmap bits
    integer cbBitsSrc                  !  Size of the source bitmap bits
    integer xMask 
    integer yMask 
    integer iUsageMask                 !  Mask bitmap info color table usage
    integer offBmiMask                 !  Offset to the mask T_BITMAPINFO structure if any
    integer cbBmiMask                  !  Size of the mask T_BITMAPINFO structure if any
    integer offBitsMask                !  Offset to the mask bitmap bits if any
    integer cbBitsMask                 !  Size of the mask bitmap bits if any
end type  T_EMRPLGBLT

type  T_EMRSETDIBITSTODEVICE
    type (T_EMR) emrf 
    type (T_RECTL) rclBounds            !  Inclusive-inclusive bounds in device units
    integer xDest 
    integer yDest 
    integer xSrc 
    integer ySrc 
    integer cxSrc 
    integer cySrc 
    integer offBmiSrc            !  Offset to the source T_BITMAPINFO structure
    integer cbBmiSrc             !  Size of the source T_BITMAPINFO structure
    integer offBitsSrc           !  Offset to the source bitmap bits
    integer cbBitsSrc            !  Size of the source bitmap bits
    integer iUsageSrc            !  Source bitmap info color table usage
    integer iStartScan
    integer cScans 
end type  T_EMRSETDIBITSTODEVICE

type  T_EMRSTRETCHDIBITS
    type (T_EMR) emrf 
    type (T_RECTL) rclBounds            !  Inclusive-inclusive bounds in device units
    integer xDest 
    integer yDest 
    integer xSrc 
    integer ySrc 
    integer cxSrc 
    integer cySrc 
    integer offBmiSrc            !  Offset to the source T_BITMAPINFO structure
    integer cbBmiSrc             !  Size of the source T_BITMAPINFO structure
    integer offBitsSrc           !  Offset to the source bitmap bits
    integer cbBitsSrc            !  Size of the source bitmap bits
    integer iUsageSrc            !  Source bitmap info color table usage
    integer dwRop 
    integer cxDest 
    integer cyDest 
end type  T_EMRSTRETCHDIBITS

type  T_EMRCREATEPALETTE
    type (T_EMR) emrf 
    integer ihPal                !  Palette handle index
    type (T_LOGPALETTE) lgpl              !  The peFlags fields in the palette entries
                                 !  do not contain any flags
end type  T_EMRCREATEPALETTE

type  T_EMRCREATEPEN
    type (T_EMR) emrf 
    integer ihPen                !  Pen handle index
    type (T_LOGPEN) lopn 
end type  T_EMRCREATEPEN

type  T_EMREXTCREATEPEN
    type (T_EMR) emrf 
    integer ihPen                !  Pen handle index
    integer offBmi               !  Offset to the T_BITMAPINFO structure if any
    integer cbBmi                !  Size of the T_BITMAPINFO structure if any
                                 !  The bitmap info is followed by the bitmap
                                 !  bits to form a packed DIB.
    integer offBits              !  Offset to the brush bitmap bits if any
    integer cbBits               !  Size of the brush bitmap bits if any
    type (T_EXTLOGPEN) elp                !  The extended pen with the style array.
end type  T_EMREXTCREATEPEN

type  T_EMRCREATEBRUSHINDIRECT
     type (T_EMR) emrf 
     integer ihBrush              !  Brush handle index
     type (T_LOGBRUSH) lb                  !  The style must be BS_SOLID, BS_HOLLOW,
                                 !  BS_NULL or BS_HATCHED.
end type  T_EMRCREATEBRUSHINDIRECT

type  EMRCREATEMONOBRUSH
    type (T_EMR) emrf 
    integer ihBrush              !  Brush handle index
    integer iUsage               !  Bitmap info color table usage
    integer offBmi               !  Offset to the T_BITMAPINFO structure
    integer cbBmi                !  Size of the T_BITMAPINFO structure
    integer offBits              !  Offset to the bitmap bits
    integer cbBits               !  Size of the bitmap bits
end type  EMRCREATEMONOBRUSH

type  T_EMRCREATEDIBPATTERNBRUSHPT
    type (T_EMR) emrf 
    integer ihBrush              !  Brush handle index
    integer iUsage               !  Bitmap info color table usage
    integer offBmi               !  Offset to the T_BITMAPINFO structure
    integer cbBmi                !  Size of the T_BITMAPINFO structure
                                 !  The bitmap info is followed by the bitmap
                                 !  bits to form a packed DIB.
    integer offBits              !  Offset to the bitmap bits
    integer cbBits               !  Size of the bitmap bits
end type  T_EMRCREATEDIBPATTERNBRUSHPT

type T_EMRFORMAT
    integer dSignature;         ! Format signature, e.g. ENHMETA_SIGNATURE.
    integer nVersion;           ! Format version number.
    integer cbData;             ! Size of data in bytes.
    integer offData;            ! Offset to data from GDICOMMENT_IDENTIFIER.
                                ! It must begin at a DWORD offset.
end type T_EMRFORMAT

integer, parameter, public ::  GDICOMMENT_IDENTIFIER         =  #43494447
integer, parameter, public ::  GDICOMMENT_WINDOWS_METAFILE   =  #80000001
integer, parameter, public ::  GDICOMMENT_BEGINGROUP         =  #00000002
integer, parameter, public ::  GDICOMMENT_ENDGROUP           =  #00000003
integer, parameter, public ::  GDICOMMENT_MULTIFORMATS       =  #40000004
integer, parameter, public ::  EPS_SIGNATURE                 =  #46535045




!               *****WINUSER******

!MS$IF .NOT. DEFINED (WINVER)
integer, parameter, public :: WINVER =  #030A      !  version 3.1   
!MS$ENDIF !/* !WINVER */

! 
!  * Predefined Resource Types
!***************************************************************************
!Defined in  stmt.f90
!
!$DEFINE   RT_CURSOR           = MAKEINTRESOURCE(1)
!$DEFINE   RT_BITMAP           = MAKEINTRESOURCE(2)
!$DEFINE   RT_ICON             = MAKEINTRESOURCE(3)
!$DEFINE   RT_MENU             = MAKEINTRESOURCE(4)
!$DEFINE   RT_DIALOG           = MAKEINTRESOURCE(5)
!$DEFINE   RT_STRING           = MAKEINTRESOURCE(6)
!$DEFINE   RT_FONTDIR          = MAKEINTRESOURCE(7)
!$DEFINE   RT_FONT             = MAKEINTRESOURCE(8)
!$DEFINE   RT_ACCELERATOR      = MAKEINTRESOURCE(9)
!$DEFINE   RT_RCDATA           = MAKEINTRESOURCE(10)
!MAKEINTRESOURCE(x) = x+x
!RT_CURSOR           = MAKEINTRESOURCE(1)
!integer, parameter, public :: RT_BITMAP           = MAKEINTRESOURCE(2)
!integer, parameter, public :: RT_ICON             = MAKEINTRESOURCE(3)
!integer, parameter, public :: RT_MENU             = MAKEINTRESOURCE(4)
!integer, parameter, public :: RT_DIALOG           = MAKEINTRESOURCE(5)
!integer, parameter, public :: RT_STRING           = MAKEINTRESOURCE(6)
!integer, parameter, public :: RT_FONTDIR          = MAKEINTRESOURCE(7)
!integer, parameter, public :: RT_FONT             = MAKEINTRESOURCE(8)
!integer, parameter, public :: RT_ACCELERATOR      = MAKEINTRESOURCE(9)
!integer, parameter, public :: RT_RCDATA           = MAKEINTRESOURCE(10)
!integer, parameter, public :: RT_MESSAGETABLE     = MAKEINTRESOURCE(11)
!integer, parameter, public :: RT_MESSAGETABLE     = MAKEINTRESOURCE(11)
!*************************************************************************

integer, parameter, public :: DIFFERENCE = 11
!*************************************************************************
!Defined in Stmt.f90
!
!$DEFINE RT_GROUP_CURSOR     = MAKEINTRESOURCE(RT_CURSOR + DIFFERENCE)
!$DEFINE  RT_GROUP_ICON       = MAKEINTRESOURCE(RT_ICON + DIFFERENCE)
!$DEFINE  RT_VERSION          = MAKEINTRESOURCE(16)
!$DEFINE  RT_DLGINCLUDE       = MAKEINTRESOURCE(17)
!integer, parameter, public :: RT_GROUP_CURSOR     = MAKEINTRESOURCE(RT_CURSOR + DIFFERENCE)
!integer, parameter, public :: RT_GROUP_ICON       = MAKEINTRESOURCE(RT_ICON + DIFFERENCE)
!integer, parameter, public :: RT_VERSION          = MAKEINTRESOURCE(16)
!integer, parameter, public :: RT_DLGINCLUDE       = MAKEINTRESOURCE(17)
!*************************************************************************

!  * Scroll Bar Constants

integer, parameter, public :: SB_HORZ = 0
integer, parameter, public :: SB_VERT = 1
integer, parameter, public :: SB_CTL = 2
integer, parameter, public :: SB_BOTH = 3

! 
!  * Scroll Bar Commands
!  
!

integer, parameter, public :: SB_LINEUP         = 0
integer, parameter, public :: SB_LINELEFT       = 0
integer, parameter, public :: SB_LINEDOWN       = 1
integer, parameter, public :: SB_LINERIGHT      = 1
integer, parameter, public :: SB_PAGEUP         = 2
integer, parameter, public :: SB_PAGELEFT       = 2
integer, parameter, public :: SB_PAGEDOWN       = 3
integer, parameter, public :: SB_PAGERIGHT      = 3
integer, parameter, public :: SB_THUMBPOSITION  = 4
integer, parameter, public :: SB_THUMBTRACK     = 5
integer, parameter, public :: SB_TOP            = 6
integer, parameter, public :: SB_LEFT           = 6
integer, parameter, public :: SB_BOTTOM         = 7
integer, parameter, public :: SB_RIGHT          = 7
integer, parameter, public :: SB_ENDSCROLL      = 8


! 
!  * ShowWindow() Commands
!  

integer, parameter, public :: SW_HIDE               = 0
integer, parameter, public :: SW_SHOWNORMAL         = 1
integer, parameter, public :: SW_NORMAL             = 1
integer, parameter, public :: SW_SHOWMINIMIZED      = 2
integer, parameter, public :: SW_SHOWMAXIMIZED      = 3
integer, parameter, public :: SW_MAXIMIZE           = 3
integer, parameter, public :: SW_SHOWNOACTIVATE     = 4
integer, parameter, public :: SW_SHOW               = 5
integer, parameter, public :: SW_MINIMIZE           = 6
integer, parameter, public :: SW_SHOWMINNOACTIVE    = 7
integer, parameter, public :: SW_SHOWNA             = 8
integer, parameter, public :: SW_RESTORE            = 9
integer, parameter, public :: SW_SHOWDEFAULT        = 10
integer, parameter, public :: SW_MAX                = 10

! 
!  * Old ShowWindow() Commands
!  
!

integer, parameter, public :: HIDE_WINDOW           = 0
integer, parameter, public :: SHOW_OPENWINDOW       = 1
integer, parameter, public :: SHOW_ICONWINDOW       = 2
integer, parameter, public :: SHOW_FULLSCREEN       = 3
integer, parameter, public :: SHOW_OPENNOACTIVATE   = 4

! 
!  * Identifiers for the WM_SHOWWINDOW message
!  
!

integer, parameter, public :: SW_PARENTCLOSING  = 1
integer, parameter, public :: SW_OTHERZOOM      = 2
integer, parameter, public :: SW_PARENTOPENING  = 3
integer, parameter, public :: SW_OTHERUNZOOM    = 4


! 
!  * WM_KEYUP/DOWN/CHAR HIWORD(lParam) flags
!  
!

integer, parameter, public :: KF_EXTENDED   =  #0100
integer, parameter, public :: KF_DLGMODE    =  #0800
integer, parameter, public :: KF_MENUMODE   =  #1000
integer, parameter, public :: KF_ALTDOWN    =  #2000
integer, parameter, public :: KF_REPEAT     =  #4000
integer, parameter, public :: KF_UP         =  #8000


! 
!  * Virtual Keys, Standard Set      
!  
!

integer, parameter, public :: VK_LBUTTON    =  #01
integer, parameter, public :: VK_RBUTTON    =  #02
integer, parameter, public :: VK_CANCEL     =  #03
integer, parameter, public :: VK_MBUTTON    =  #04    !  NOT contiguous with L & RBUTTON   
integer, parameter, public :: VK_BACK       =  #08
integer, parameter, public :: VK_TAB        =  #09
integer, parameter, public :: VK_CLEAR      =  #0C
integer, parameter, public :: VK_RETURN     =  #0D
integer, parameter, public :: VK_SHIFT      =  #10
integer, parameter, public :: VK_CONTROL    =  #11
integer, parameter, public :: VK_MENU       =  #12
integer, parameter, public :: VK_PAUSE      =  #13
integer, parameter, public :: VK_CAPITAL    =  #14
integer, parameter, public :: VK_ESCAPE     =  #1B
integer, parameter, public :: VK_SPACE      =  #20
integer, parameter, public :: VK_PRIOR      =  #21
integer, parameter, public :: VK_NEXT       =  #22
integer, parameter, public :: VK_END        =  #23
integer, parameter, public :: VK_HOME       =  #24
integer, parameter, public :: VK_LEFT       =  #25
integer, parameter, public :: VK_UP         =  #26
integer, parameter, public :: VK_RIGHT      =  #27
integer, parameter, public :: VK_DOWN       =  #28
integer, parameter, public :: VK_SELECT     =  #29
integer, parameter, public :: VK_PRINT      =  #2A
integer, parameter, public :: VK_EXECUTE    =  #2B
integer, parameter, public :: VK_SNAPSHOT   =  #2C
integer, parameter, public :: VK_INSERT     =  #2D
integer, parameter, public :: VK_DELETE     =  #2E
integer, parameter, public :: VK_HELP       =  #2F

!   VK_0 thru VK_9 are the same as ASCII '0' thru '9' (0x30 - 0x39)   
!   VK_A thru VK_Z are the same as ASCII 'A' thru 'Z' (0x41 - 0x5A)   

integer, parameter, public :: VK_NUMPAD0    =  #60
integer, parameter, public :: VK_NUMPAD1    =  #61
integer, parameter, public :: VK_NUMPAD2    =  #62
integer, parameter, public :: VK_NUMPAD3    =  #63
integer, parameter, public :: VK_NUMPAD4    =  #64
integer, parameter, public :: VK_NUMPAD5    =  #65
integer, parameter, public :: VK_NUMPAD6    =  #66
integer, parameter, public :: VK_NUMPAD7    =  #67
integer, parameter, public :: VK_NUMPAD8    =  #68
integer, parameter, public :: VK_NUMPAD9    =  #69
integer, parameter, public :: VK_MULTIPLY   =  #6A
integer, parameter, public :: VK_ADD        =  #6B
integer, parameter, public :: VK_SEPARATOR  =  #6C
integer, parameter, public :: VK_SUBTRACT   =  #6D
integer, parameter, public :: VK_DECIMAL    =  #6E
integer, parameter, public :: VK_DIVIDE     =  #6F
integer, parameter, public :: VK_F1 =  #70
integer, parameter, public :: VK_F2 =  #71
integer, parameter, public :: VK_F3 =  #72
integer, parameter, public :: VK_F4 =  #73
integer, parameter, public :: VK_F5 =  #74
integer, parameter, public :: VK_F6 =  #75
integer, parameter, public :: VK_F7 =  #76
integer, parameter, public :: VK_F8 =  #77
integer, parameter, public :: VK_F9 =  #78
integer, parameter, public :: VK_F10 =  #79
integer, parameter, public :: VK_F11 =  #7A
integer, parameter, public :: VK_F12 =  #7B
integer, parameter, public :: VK_F13 =  #7C
integer, parameter, public :: VK_F14 =  #7D
integer, parameter, public :: VK_F15 =  #7E
integer, parameter, public :: VK_F16 =  #7F
integer, parameter, public :: VK_F17 =  #80
integer, parameter, public :: VK_F18 =  #81
integer, parameter, public :: VK_F19 =  #82
integer, parameter, public :: VK_F20 =  #83
integer, parameter, public :: VK_F21 =  #84
integer, parameter, public :: VK_F22 =  #85
integer, parameter, public :: VK_F23 =  #86
integer, parameter, public :: VK_F24 =  #87
integer, parameter, public :: VK_NUMLOCK =  #90
integer, parameter, public :: VK_SCROLL =  #91

! 
!  * VK_L* & VK_R* - left and right Alt, Ctrl and Shift virtual keys.
!  * Used only as parameters to GetAsyncKeyState() and GetKeyState().
!  * No other API or message will distinguish left and right keys in this way.
!
integer, parameter, public :: VK_LSHIFT     =  #A0
integer, parameter, public :: VK_RSHIFT     =  #A1
integer, parameter, public :: VK_LCONTROL   =  #A2
integer, parameter, public :: VK_RCONTROL   =  #A3
integer, parameter, public :: VK_LMENU      =  #A4
integer, parameter, public :: VK_RMENU      =  #A5
integer, parameter, public :: VK_ATTN       =  #F6
integer, parameter, public :: VK_CRSEL      =  #F7
integer, parameter, public :: VK_EXSEL      =  #F8
integer, parameter, public :: VK_EREOF      =  #F9
integer, parameter, public :: VK_PLAY       =  #FA
integer, parameter, public :: VK_ZOOM       =  #FB
integer, parameter, public :: VK_NONAME     =  #FC
integer, parameter, public :: VK_PA1        =  #FD
integer, parameter, public :: VK_OEM_CLEAR  =  #FE

! 
!  * SetWindowsHook() codes
!  

integer, parameter, public :: WH_MIN                = (-1)
integer, parameter, public :: WH_MSGFILTER          = (-1)
integer, parameter, public :: WH_JOURNALRECORD      = 0
integer, parameter, public :: WH_JOURNALPLAYBACK    = 1
integer, parameter, public :: WH_KEYBOARD           = 2
integer, parameter, public :: WH_GETMESSAGE         = 3
integer, parameter, public :: WH_CALLWNDPROC        = 4
integer, parameter, public :: WH_CBT                = 5
integer, parameter, public :: WH_SYSMSGFILTER       = 6
integer, parameter, public :: WH_MOUSE              = 7
integer, parameter, public :: WH_HARDWARE           = 8
integer, parameter, public :: WH_DEBUG              = 9
integer, parameter, public :: WH_SHELL              = 10
integer, parameter, public :: WH_FOREGROUNDIDLE     = 11
integer, parameter, public :: WH_MAX                = 11

! 
!  * Hook Codes
!

integer, parameter, public :: HC_ACTION         = 0
integer, parameter, public :: HC_GETNEXT        = 1
integer, parameter, public :: HC_SKIP           = 2
integer, parameter, public :: HC_NOREMOVE       = 3
integer, parameter, public :: HC_NOREM          = HC_NOREMOVE
integer, parameter, public :: HC_SYSMODALON     = 4
integer, parameter, public :: HC_SYSMODALOFF    = 5

! 
!  * CBT Hook Codes
!  

integer, parameter, public :: HCBT_MOVESIZE     = 0
integer, parameter, public :: HCBT_MINMAX       = 1
integer, parameter, public :: HCBT_QS           = 2
integer, parameter, public :: HCBT_CREATEWND    = 3
integer, parameter, public :: HCBT_DESTROYWND   = 4
integer, parameter, public :: HCBT_ACTIVATE     = 5
integer, parameter, public :: HCBT_CLICKSKIPPED = 6
integer, parameter, public :: HCBT_KEYSKIPPED   = 7
integer, parameter, public :: HCBT_SYSCOMMAND   = 8
integer, parameter, public :: HCBT_SETFOCUS     = 9

! 
!  * HCBT_CREATEWND parameters pointed to by lParam
!

type  T_CBT_CREATEWND
    integer lpcs 
    integer hwndInsertAfter 
end type  T_CBT_CREATEWND

! 
!  * HCBT_CREATEWND parameters pointed to by lParam
!  
type T_CBT_CREATEWNDW 
    integer     lpcs;
    integer(2)  hwndInsertAfter;
end type T_CBT_CREATEWNDW

! 
!  * HCBT_ACTIVATE structure pointed to by lParam
!  

type  T_CBTACTIVATESTRUCT
    integer     fMouse 
    integer     hWndActive 
end type  T_CBTACTIVATESTRUCT

! 
!  * WH_MSGFILTER Filter Proc Codes
!  

integer, parameter, public :: MSGF_DIALOGBOX    = 0
integer, parameter, public :: MSGF_MESSAGEBOX   = 1
integer, parameter, public :: MSGF_MENU         = 2
integer, parameter, public :: MSGF_MOVE         = 3
integer, parameter, public :: MSGF_SIZE         = 4
integer, parameter, public :: MSGF_SCROLLBAR    = 5
integer, parameter, public :: MSGF_NEXTWINDOW   = 6
integer, parameter, public :: MSGF_MAINLOOP     = 8
integer, parameter, public :: MSGF_MAX          = 8
integer, parameter, public :: MSGF_USER         = 4096

! 
!  * Shell support
!

integer, parameter, public :: HSHELL_WINDOWCREATED          = 1
integer, parameter, public :: HSHELL_WINDOWDESTROYED        = 2
integer, parameter, public :: HSHELL_ACTIVATESHELLWINDOW    = 3

! 
!  * Message Structure used in Journaling
!

type  T_EVENTMSG
    integer     message 
    integer     paramL 
    integer     paramH 
    integer     time 
    integer     hwnd 
end type  T_EVENTMSG


! Cannot convert, skipping
!
! 
!  * Message structure used by WH_CALLWNDPROC
!  
!

type  T_CWPSTRUCT
    integer     lParam 
    integer(2)  wParam 
    integer(2)  message 
    integer(2)  hwnd 
end type  T_CWPSTRUCT

! 
!  * Structure used by WH_DEBUG
!  

type  T_DEBUGHOOKINFO
    integer idThread 
    integer reserved 
    integer lParam 
    integer(2) wParam 
    integer(2) code 
end type  T_DEBUGHOOKINFO

type  T_MOUSEHOOKSTRUCT
    type (T_POINT) pt 
    integer(2)  hwnd 
    integer(2)  wHitTestCode 
    integer     dwExtraInfo 
end type  T_MOUSEHOOKSTRUCT

! 
!  * Keyboard Layout API
!  

integer, parameter, public :: HKL_PREV = 0
integer, parameter, public :: HKL_NEXT = 1

integer, parameter, public :: KLF_ACTIVATE          =  #00000001
integer, parameter, public :: KLF_SUBSTITUTE_OK     =  #00000002
integer, parameter, public :: KLF_UNLOADPREVIOUS    =  #00000004
integer, parameter, public :: KLF_REORDER           =  #00000008
! 
!  * Size of KeyboardLayoutName (number of characters), including nul terminator
!  
integer, parameter, public :: KL_NAMELENGTH = 9

! 
!  * Desktop-specific access flags
!

integer, parameter, public :: DESKTOP_READOBJECTS       =  #0001
integer, parameter, public :: DESKTOP_CREATEWINDOW      =  #0002
integer, parameter, public :: DESKTOP_CREATEMENU        =  #0004
integer, parameter, public :: DESKTOP_HOOKCONTROL       =  #0008
integer, parameter, public :: DESKTOP_JOURNALRECORD     =  #0010
integer, parameter, public :: DESKTOP_JOURNALPLAYBACK   =  #0020
integer, parameter, public :: DESKTOP_ENUMERATE         =  #0040
integer, parameter, public :: DESKTOP_WRITEOBJECTS      =  #0080

! 
!  * Windowstation-specific access flags
!

integer, parameter, public :: WINSTA_ENUMDESKTOPS       =  #0001
integer, parameter, public :: WINSTA_READATTRIBUTES     =  #0002
integer, parameter, public :: WINSTA_ACCESSCLIPBOARD    =  #0004
integer, parameter, public :: WINSTA_CREATEDESKTOP      =  #0008
integer, parameter, public :: WINSTA_WRITEATTRIBUTES    =  #0010
integer, parameter, public :: WINSTA_ACCESSGLOBALATOMS  =  #0020
integer, parameter, public :: WINSTA_EXITWINDOWS        =  #0040
integer, parameter, public :: WINSTA_ENUMERATE          =  #0100
integer, parameter, public :: WINSTA_READSCREEN         =  #0200

type  T_WNDCLASS
    integer         style 
    integer         lpfnWndProc 
    integer         cbClsExtra 
    integer         cbWndExtra 
    integer         hInstance 
    integer         hIcon 
    integer         hCursor 
    integer         hbrBackground 
    integer         lpszMenuName 
    integer         lpszClassName 
end type  T_WNDCLASS

! 
!  * Message structure
!

type  T_MSG
    integer         hwnd 
    integer         message 
    integer         wParam 
    integer         lParam 
    integer         time 
    type (T_POINT)  pt 
end type  T_MSG

! 
!  * Window field offsets for GetWindowLong()
!

integer, parameter, public :: GWL_WNDPROC       = (-4)
integer, parameter, public :: GWL_HINSTANCE     = (-6)
integer, parameter, public :: GWL_HWNDPARENT    = (-8)
integer, parameter, public :: GWL_STYLE         = (-16)
integer, parameter, public :: GWL_EXSTYLE       = (-20)
integer, parameter, public :: GWL_USERDATA      = (-21)
integer, parameter, public :: GWL_ID            = (-12)

! 
!  * Class field offsets for GetClassLong()
!

integer, parameter, public :: GCL_MENUNAME      = (-8)
integer, parameter, public :: GCL_HBRBACKGROUND = (-10)
integer, parameter, public :: GCL_HCURSOR       = (-12)
integer, parameter, public :: GCL_HICON         = (-14)
integer, parameter, public :: GCL_HMODULE       = (-16)
integer, parameter, public :: GCL_CBWNDEXTRA    = (-18)
integer, parameter, public :: GCL_CBCLSEXTRA    = (-20)
integer, parameter, public :: GCL_WNDPROC       = (-24)
integer, parameter, public :: GCL_STYLE         = (-26)
integer, parameter, public :: GCW_ATOM          = (-32)

! 
!  * Window Messages
!
integer, parameter, public :: WM_NULL       =  #0000
integer, parameter, public :: WM_CREATE     =  #0001
integer, parameter, public :: WM_DESTROY    =  #0002
integer, parameter, public :: WM_MOVE       =  #0003
integer, parameter, public :: WM_SIZE       =  #0005
integer, parameter, public :: WM_ACTIVATE   =  #0006

! 
!  * WM_ACTIVATE state values
!

integer, parameter, public :: WA_INACTIVE           =  0
integer, parameter, public :: WA_ACTIVE             =  1
integer, parameter, public :: WA_CLICKACTIVE        =  2
integer, parameter, public :: WM_SETFOCUS           =  #0007
integer, parameter, public :: WM_KILLFOCUS          =  #0008
integer, parameter, public :: WM_ENABLE             =  #000A
integer, parameter, public :: WM_SETREDRAW          =  #000B
integer, parameter, public :: WM_SETTEXT            =  #000C
integer, parameter, public :: WM_GETTEXT            =  #000D
integer, parameter, public :: WM_GETTEXTLENGTH      =  #000E
integer, parameter, public :: WM_PAINT              =  #000F
integer, parameter, public :: WM_CLOSE              =  #0010
integer, parameter, public :: WM_QUERYENDSESSION    =  #0011
integer, parameter, public :: WM_QUIT               =  #0012
integer, parameter, public :: WM_QUERYOPEN          =  #0013
integer, parameter, public :: WM_ERASEBKGND         =  #0014
integer, parameter, public :: WM_SYSCOLORCHANGE     =  #0015
integer, parameter, public :: WM_ENDSESSION         =  #0016
integer, parameter, public :: WM_SHOWWINDOW         =  #0018
integer, parameter, public :: WM_WININICHANGE       =  #001A
integer, parameter, public :: WM_DEVMODECHANGE      =  #001B
integer, parameter, public :: WM_ACTIVATEAPP        =  #001C
integer, parameter, public :: WM_FONTCHANGE         =  #001D
integer, parameter, public :: WM_TIMECHANGE         =  #001E
integer, parameter, public :: WM_CANCELMODE         =  #001F
integer, parameter, public :: WM_SETCURSOR          =  #0020
integer, parameter, public :: WM_MOUSEACTIVATE      =  #0021
integer, parameter, public :: WM_CHILDACTIVATE      =  #0022
integer, parameter, public :: WM_QUEUESYNC          =  #0023
integer, parameter, public :: WM_GETMINMAXINFO      =  #0024
! 
!  * Struct pointed to by WM_GETMINMAXINFO lParam
!

type  T_MINMAXINFO
    type (T_POINT) ptReserved 
    type (T_POINT) ptMaxSize 
    type (T_POINT) ptMaxPosition 
    type (T_POINT) ptMinTrackSize 
    type (T_POINT) ptMaxTrackSize 
end type  T_MINMAXINFO

integer, parameter, public :: WM_PAINTICON              =  #0026
integer, parameter, public :: WM_ICONERASEBKGND         =  #0027
integer, parameter, public :: WM_NEXTDLGCTL             =  #0028
integer, parameter, public :: WM_SPOOLERSTATUS          =  #002A
integer, parameter, public :: WM_DRAWITEM               =  #002B
integer, parameter, public :: WM_MEASUREITEM            =  #002C
integer, parameter, public :: WM_DELETEITEM             =  #002D
integer, parameter, public :: WM_VKEYTOITEM             =  #002E
integer, parameter, public :: WM_CHARTOITEM             =  #002F
integer, parameter, public :: WM_SETFONT                =  #0030
integer, parameter, public :: WM_GETFONT                =  #0031
integer, parameter, public :: WM_SETHOTKEY              =  #0032
integer, parameter, public :: WM_GETHOTKEY              =  #0033
integer, parameter, public :: WM_QUERYDRAGICON          =  #0037
integer, parameter, public :: WM_COMPAREITEM            =  #0039
integer, parameter, public :: WM_COMPACTING             =  #0041
integer, parameter, public :: WM_OTHERWINDOWCREATED     =  #0042  !  no longer suported   
integer, parameter, public :: WM_OTHERWINDOWDESTROYED   =  #0043  !  no longer suported   
integer, parameter, public :: WM_COMMNOTIFY             =  #0044  !  no longer suported   
integer, parameter, public :: WM_WINDOWPOSCHANGING      =  #0046
integer, parameter, public :: WM_WINDOWPOSCHANGED       =  #0047

integer, parameter, public :: WM_POWER =  #0048
! 
!  * wParam for WM_POWER window message and DRV_POWER driver notification
!

integer, parameter, public :: PWR_OK = 1
integer, parameter, public :: PWR_FAIL = (-1)
integer, parameter, public :: PWR_SUSPENDREQUEST = 1
integer, parameter, public :: PWR_SUSPENDRESUME = 2
integer, parameter, public :: PWR_CRITICALRESUME = 3

integer, parameter, public :: WM_COPYDATA =  #004A
integer, parameter, public :: WM_CANCELJOURNAL =  #004B
! 
!  * lParam of WM_COPYDATA message points to...
!  

type  T_COPYDATASTRUCT
    integer dwData 
    integer cbData 
    integer lpData 
end type  T_COPYDATASTRUCT

integer, parameter, public :: WM_NCCREATE           =  #0081
integer, parameter, public :: WM_NCDESTROY          =  #0082
integer, parameter, public :: WM_NCCALCSIZE         =  #0083
integer, parameter, public :: WM_NCHITTEST          =  #0084
integer, parameter, public :: WM_NCPAINT            =  #0085
integer, parameter, public :: WM_NCACTIVATE         =  #0086
integer, parameter, public :: WM_GETDLGCODE         =  #0087
integer, parameter, public :: WM_NCMOUSEMOVE        =  #00A0
integer, parameter, public :: WM_NCLBUTTONDOWN      =  #00A1
integer, parameter, public :: WM_NCLBUTTONUP        =  #00A2
integer, parameter, public :: WM_NCLBUTTONDBLCLK    =  #00A3
integer, parameter, public :: WM_NCRBUTTONDOWN      =  #00A4
integer, parameter, public :: WM_NCRBUTTONUP        =  #00A5
integer, parameter, public :: WM_NCRBUTTONDBLCLK    =  #00A6
integer, parameter, public :: WM_NCMBUTTONDOWN      =  #00A7
integer, parameter, public :: WM_NCMBUTTONUP        =  #00A8
integer, parameter, public :: WM_NCMBUTTONDBLCLK    =  #00A9

integer, parameter, public :: WM_KEYFIRST =  #0100
integer, parameter, public :: WM_KEYDOWN =  #0100
integer, parameter, public :: WM_KEYUP =  #0101
integer, parameter, public :: WM_CHAR =  #0102
integer, parameter, public :: WM_DEADCHAR =  #0103
integer, parameter, public :: WM_SYSKEYDOWN =  #0104
integer, parameter, public :: WM_SYSKEYUP =  #0105
integer, parameter, public :: WM_SYSCHAR =  #0106
integer, parameter, public :: WM_SYSDEADCHAR =  #0107
integer, parameter, public :: WM_KEYLAST =  #0108
integer, parameter, public :: WM_INITDIALOG =  #0110
integer, parameter, public :: WM_COMMAND =  #0111
integer, parameter, public :: WM_SYSCOMMAND =  #0112
integer, parameter, public :: WM_TIMER =  #0113
integer, parameter, public :: WM_HSCROLL =  #0114
integer, parameter, public :: WM_VSCROLL =  #0115
integer, parameter, public :: WM_INITMENU =  #0116
integer, parameter, public :: WM_INITMENUPOPUP =  #0117
integer, parameter, public :: WM_MENUSELECT =  #011F
integer, parameter, public :: WM_MENUCHAR =  #0120
integer, parameter, public :: WM_ENTERIDLE =  #0121

integer, parameter, public :: WM_CTLCOLORMSGBOX     =  #0132
integer, parameter, public :: WM_CTLCOLOREDIT       =  #0133
integer, parameter, public :: WM_CTLCOLORLISTBOX    =  #0134
integer, parameter, public :: WM_CTLCOLORBTN        =  #0135
integer, parameter, public :: WM_CTLCOLORDLG        =  #0136
integer, parameter, public :: WM_CTLCOLORSCROLLBAR  =  #0137
integer, parameter, public :: WM_CTLCOLORSTATIC     =  #0138

integer, parameter, public :: WM_MOUSEFIRST =  #0200
integer, parameter, public :: WM_MOUSEMOVE =  #0200
integer, parameter, public :: WM_LBUTTONDOWN =  #0201
integer, parameter, public :: WM_LBUTTONUP =  #0202
integer, parameter, public :: WM_LBUTTONDBLCLK =  #0203
integer, parameter, public :: WM_RBUTTONDOWN =  #0204
integer, parameter, public :: WM_RBUTTONUP =  #0205
integer, parameter, public :: WM_RBUTTONDBLCLK =  #0206
integer, parameter, public :: WM_MBUTTONDOWN =  #0207
integer, parameter, public :: WM_MBUTTONUP =  #0208
integer, parameter, public :: WM_MBUTTONDBLCLK =  #0209
integer, parameter, public :: WM_MOUSELAST =  #0209

integer, parameter, public :: WM_PARENTNOTIFY =  #0210
integer, parameter, public :: WM_ENTERMENULOOP =  #0211
integer, parameter, public :: WM_EXITMENULOOP =  #0212
integer, parameter, public :: WM_MDICREATE =  #0220
integer, parameter, public :: WM_MDIDESTROY =  #0221
integer, parameter, public :: WM_MDIACTIVATE =  #0222
integer, parameter, public :: WM_MDIRESTORE =  #0223
integer, parameter, public :: WM_MDINEXT =  #0224
integer, parameter, public :: WM_MDIMAXIMIZE =  #0225
integer, parameter, public :: WM_MDITILE =  #0226
integer, parameter, public :: WM_MDICASCADE =  #0227
integer, parameter, public :: WM_MDIICONARRANGE =  #0228
integer, parameter, public :: WM_MDIGETACTIVE =  #0229
integer, parameter, public :: WM_MDISETMENU =  #0230
integer, parameter, public :: WM_DROPFILES =  #0233
integer, parameter, public :: WM_MDIREFRESHMENU =  #0234


integer, parameter, public :: WM_CUT =  #0300
integer, parameter, public :: WM_COPY =  #0301
integer, parameter, public :: WM_PASTE =  #0302
integer, parameter, public :: WM_CLEAR =  #0303
integer, parameter, public :: WM_UNDO =  #0304
integer, parameter, public :: WM_RENDERFORMAT =  #0305
integer, parameter, public :: WM_RENDERALLFORMATS =  #0306
integer, parameter, public :: WM_DESTROYCLIPBOARD =  #0307
integer, parameter, public :: WM_DRAWCLIPBOARD =  #0308
integer, parameter, public :: WM_PAINTCLIPBOARD =  #0309
integer, parameter, public :: WM_VSCROLLCLIPBOARD =  #030A
integer, parameter, public :: WM_SIZECLIPBOARD =  #030B
integer, parameter, public :: WM_ASKCBFORMATNAME =  #030C
integer, parameter, public :: WM_CHANGECBCHAIN =  #030D
integer, parameter, public :: WM_HSCROLLCLIPBOARD =  #030E
integer, parameter, public :: WM_QUERYNEWPALETTE =  #030F
integer, parameter, public :: WM_PALETTEISCHANGING =  #0310
integer, parameter, public :: WM_PALETTECHANGED =  #0311
integer, parameter, public :: WM_HOTKEY =  #0312

integer, parameter, public :: WM_PENWINFIRST =  #0380
integer, parameter, public :: WM_PENWINLAST =  #038F


! 
!   NOTE: All Message Numbers below 0x0400 are RESERVED.
!  
!   Private Window Messages Start Here:
!  
integer, parameter, public :: WM_USER =  #0400

! 
!  * WM_SYNCTASK Commands
!  

integer, parameter, public :: ST_BEGINSWP = 0
integer, parameter, public :: ST_ENDSWP = 1

! 
!  * WM_NCHITTEST and T_MOUSEHOOKSTRUCT Mouse Position Codes
!  

integer, parameter, public :: HTERROR = (-2)
integer, parameter, public :: HTTRANSPARENT = (-1)
integer, parameter, public :: HTNOWHERE = 0
integer, parameter, public :: HTCLIENT = 1
integer, parameter, public :: HTCAPTION = 2
integer, parameter, public :: HTSYSMENU = 3
integer, parameter, public :: HTGROWBOX = 4
integer, parameter, public :: HTSIZE = HTGROWBOX
integer, parameter, public :: HTMENU = 5
integer, parameter, public :: HTHSCROLL = 6
integer, parameter, public :: HTVSCROLL = 7
integer, parameter, public :: HTMINBUTTON = 8
integer, parameter, public :: HTMAXBUTTON = 9
integer, parameter, public :: HTLEFT = 10
integer, parameter, public :: HTRIGHT = 11
integer, parameter, public :: HTTOP = 12
integer, parameter, public :: HTTOPLEFT = 13
integer, parameter, public :: HTTOPRIGHT = 14
integer, parameter, public :: HTBOTTOM = 15
integer, parameter, public :: HTBOTTOMLEFT = 16
integer, parameter, public :: HTBOTTOMRIGHT = 17
integer, parameter, public :: HTBORDER = 18
integer, parameter, public :: HTREDUCE = HTMINBUTTON
integer, parameter, public :: HTZOOM = HTMAXBUTTON
integer, parameter, public :: HTSIZEFIRST = HTLEFT
integer, parameter, public :: HTSIZELAST = HTBOTTOMRIGHT

! 
!  * SendMessageTimeout values
!

integer, parameter, public :: SMTO_NORMAL =  #0000
integer, parameter, public :: SMTO_BLOCK =  #0001
integer, parameter, public :: SMTO_ABORTIFHUNG =  #0002

! 
!  * WM_MOUSEACTIVATE Return Codes
!  

integer, parameter, public :: MA_ACTIVATE = 1
integer, parameter, public :: MA_ACTIVATEANDEAT = 2
integer, parameter, public :: MA_NOACTIVATE = 3
integer, parameter, public :: MA_NOACTIVATEANDEAT = 4



! 
!  * WM_SIZE message wParam values
!

integer, parameter, public :: SIZE_RESTORED = 0
integer, parameter, public :: SIZE_MINIMIZED = 1
integer, parameter, public :: SIZE_MAXIMIZED = 2
integer, parameter, public :: SIZE_MAXSHOW = 3
integer, parameter, public :: SIZE_MAXHIDE = 4

! 
!  * Obsolete constant names
!  

integer, parameter, public :: SIZENORMAL = SIZE_RESTORED
integer, parameter, public :: SIZEICONIC = SIZE_MINIMIZED
integer, parameter, public :: SIZEFULLSCREEN = SIZE_MAXIMIZED
integer, parameter, public :: SIZEZOOMSHOW = SIZE_MAXSHOW
integer, parameter, public :: SIZEZOOMHIDE = SIZE_MAXHIDE

! 
!  * WM_WINDOWPOSCHANGING/CHANGED struct pointed to by lParam
!

type  T_WINDOWPOS
    integer(2)      hwnd 
    integer(2)      hwndInsertAfter 
    integer         x 
    integer         y 
    integer         cx 
    integer         cy 
    integer         flags 
end type  T_WINDOWPOS

! 
!  * WM_NCCALCSIZE parameter structure
!

type  T_NCCALCSIZE_PARAMS
    type (T_RECT) rgrc (3 )
    integer lppos 
end type  T_NCCALCSIZE_PARAMS

! 
!  * WM_NCCALCSIZE "window valid rect" return values
!

integer, parameter, public :: WVR_ALIGNTOP      =  #0010
integer, parameter, public :: WVR_ALIGNLEFT     =  #0020
integer, parameter, public :: WVR_ALIGNBOTTOM   =  #0040
integer, parameter, public :: WVR_ALIGNRIGHT    =  #0080
integer, parameter, public :: WVR_HREDRAW       =  #0100
integer, parameter, public :: WVR_VREDRAW       =  #0200
integer, parameter, public :: WVR_VALIDRECTS    =  #0400

! 
!  * Key State Masks for Mouse Messages
!

integer, parameter, public :: MK_LBUTTON    =  #0001
integer, parameter, public :: MK_RBUTTON    =  #0002
integer, parameter, public :: MK_SHIFT      =  #0004
integer, parameter, public :: MK_CONTROL    =  #0008
integer, parameter, public :: MK_MBUTTON    =  #0010

! 
!  * Window Styles
!

!MS$IF .NOT. DEFINED(NOWINSTYLES)

integer, parameter, public :: WS_OVERLAPPED =  #00000000
integer, parameter, public :: WS_POPUP =  #80000000 !-2147483647  
integer, parameter, public :: WS_CHILD =  #40000000
integer, parameter, public :: WS_MINIMIZE =  #20000000
integer, parameter, public :: WS_VISIBLE =  #10000000
integer, parameter, public :: WS_DISABLED =  #08000000
integer, parameter, public :: WS_CLIPSIBLINGS =  #04000000
integer, parameter, public :: WS_CLIPCHILDREN =  #02000000
integer, parameter, public :: WS_MAXIMIZE =  #01000000
integer, parameter, public :: WS_CAPTION =  #00C00000     !  WS_BORDER | WS_DLGFRAME    
integer, parameter, public :: WS_BORDER =  #00800000
integer, parameter, public :: WS_DLGFRAME =  #00400000
integer, parameter, public :: WS_VSCROLL =  #00200000
integer, parameter, public :: WS_HSCROLL =  #00100000
integer, parameter, public :: WS_SYSMENU =  #00080000
integer, parameter, public :: WS_THICKFRAME =  #00040000
integer, parameter, public :: WS_GROUP =  #00020000
integer, parameter, public :: WS_TABSTOP =  #00010000

integer, parameter, public :: WS_MINIMIZEBOX =  #00020000
integer, parameter, public :: WS_MAXIMIZEBOX =  #00010000

integer, parameter, public :: WS_TILED      = WS_OVERLAPPED
integer, parameter, public :: WS_ICONIC     = WS_MINIMIZE
integer, parameter, public :: WS_SIZEBOX    = WS_THICKFRAME

! 
!  * Common Window Styles, Some Of them go into stmt.f90 as statement 
!   functions
!

integer, parameter, public :: WS_CHILDWINDOW      = WS_CHILD

! 
!  * Extended Window Styles
!

integer, parameter, public :: WS_EX_DLGMODALFRAME =  #00000001
integer, parameter, public :: WS_EX_NOPARENTNOTIFY =  #00000004
integer, parameter, public :: WS_EX_TOPMOST =  #00000008
integer, parameter, public :: WS_EX_ACCEPTFILES =  #00000010
integer, parameter, public :: WS_EX_TRANSPARENT =  #00000020

! 
!  * Class styles
!

integer, parameter, public :: CS_VREDRAW =  #0001
integer, parameter, public :: CS_HREDRAW =  #0002
integer, parameter, public :: CS_KEYCVTWINDOW =  #0004
integer, parameter, public :: CS_DBLCLKS =  #0008
integer, parameter, public :: CS_OWNDC =  #0020
integer, parameter, public :: CS_CLASSDC =  #0040
integer, parameter, public :: CS_PARENTDC =  #0080
integer, parameter, public :: CS_NOKEYCVT =  #0100
integer, parameter, public :: CS_NOCLOSE =  #0200
integer, parameter, public :: CS_SAVEBITS =  #0800
integer, parameter, public :: CS_BYTEALIGNCLIENT =  #1000
integer, parameter, public :: CS_BYTEALIGNWINDOW =  #2000
integer, parameter, public :: CS_GLOBALCLASS =  #4000

!MS$ENDIF ! /*NOWINSTYLES*/

! 
!  * Predefined Clipboard Formats
!

integer, parameter, public :: CF_TEXT = 1
integer, parameter, public :: CF_BITMAP = 2
integer, parameter, public :: CF_METAFILEPICT = 3
integer, parameter, public :: CF_SYLK = 4
integer, parameter, public :: CF_DIF = 5
integer, parameter, public :: CF_TIFF = 6
integer, parameter, public :: CF_OEMTEXT = 7
integer, parameter, public :: CF_DIB = 8
integer, parameter, public :: CF_PALETTE = 9
integer, parameter, public :: CF_PENDATA = 10
integer, parameter, public :: CF_RIFF = 11
integer, parameter, public :: CF_WAVE = 12
integer, parameter, public :: CF_UNICODETEXT = 13
integer, parameter, public :: CF_ENHMETAFILE = 14
integer, parameter, public :: CF_OWNERDISPLAY =  #0080
integer, parameter, public :: CF_DSPTEXT =  #0081
integer, parameter, public :: CF_DSPBITMAP =  #0082
integer, parameter, public :: CF_DSPMETAFILEPICT =  #0083
integer, parameter, public :: CF_DSPENHMETAFILE =  #008E

! 
!  * "Private" formats don't get GlobalFree()'d
!  
!

integer, parameter, public :: CF_PRIVATEFIRST =  #0200
integer, parameter, public :: CF_PRIVATELAST =  #02FF

! 
!  * "GDIOBJ" formats do get DeleteObject()'d
!  
!

integer, parameter, public :: CF_GDIOBJFIRST =  #0300
integer, parameter, public :: CF_GDIOBJLAST =  #03FF


! 
!  * Defines for the fVirt field of the Accelerator table structure.
!  
!

integer, parameter, public :: FVIRTKEY  = 1          !   Assumed to be == TRUE   
integer, parameter, public :: FNOINVERT =  #02
integer, parameter, public :: FSHIFT    =  #04
integer, parameter, public :: FCONTROL  =  #08
integer, parameter, public :: FALT      =  #10

type  T_ACCEL
    BYTE    fVirt                !  Also called the flags field   
    integer*2 key 
    integer*2 cmd 
end type  T_ACCEL

type  T_PAINTSTRUCT
    integer     hdc 
    logical(4)  fErase 
    type (T_RECT) rcPaint 
    logical(4)  fRestore 
    logical(4)  fIncUpdate 
    BYTE        rgbReserved (32 )
end type  T_PAINTSTRUCT

type  T_CREATESTRUCT
    integer lpCreateParams 
    integer hInstance 
    integer hMenu 
    integer hwndParent 
    integer cy 
    integer cx 
    integer y 
    integer x 
    integer style 
    integer lpszName 
    integer lpszClass 
    integer dwExStyle 
end type  T_CREATESTRUCT


type  T_WINDOWPLACEMENT
    integer length 
    integer flags 
    integer showCmd 
    type (T_POINT) ptMinPosition 
    type (T_POINT) ptMaxPosition 
    type (T_RECT) rcNormalPosition 
end type  T_WINDOWPLACEMENT

integer, parameter, public :: WPF_SETMINPOSITION        =  #0001
integer, parameter, public :: WPF_RESTORETOMAXIMIZED    =  #0002

! 
!  * Owner draw control types
!  
!

integer, parameter, public :: ODT_MENU      = 1
integer, parameter, public :: ODT_LISTBOX   = 2
integer, parameter, public :: ODT_COMBOBOX  = 3
integer, parameter, public :: ODT_BUTTON    = 4

! 
!  * Owner draw actions
!  

integer, parameter, public :: ODA_DRAWENTIRE    =  #0001
integer, parameter, public :: ODA_SELECT        =  #0002
integer, parameter, public :: ODA_FOCUS         =  #0004

! 
!  * Owner draw state
!

integer, parameter, public :: ODS_SELECTED  =  #0001
integer, parameter, public :: ODS_GRAYED    =  #0002
integer, parameter, public :: ODS_DISABLED  =  #0004
integer, parameter, public :: ODS_CHECKED   =  #0008
integer, parameter, public :: ODS_FOCUS     =  #0010

! 
!  * T_MEASUREITEMSTRUCT for ownerdraw
!  

type  T_MEASUREITEMSTRUCT
    integer CtlType 
    integer CtlID 
    integer itemID 
    integer itemWidth 
    integer itemHeight 
    integer itemData 
end type  T_MEASUREITEMSTRUCT


! 
!  * T_DRAWITEMSTRUCT for ownerdraw
!  

type  T_DRAWITEMSTRUCT
    integer CtlType 
    integer CtlID 
    integer itemID 
    integer itemAction 
    integer itemState 
    integer hwndItem 
    integer hDC 
    type (T_RECT) rcItem 
    integer itemData 
end type  T_DRAWITEMSTRUCT

! 
!  * T_DELETEITEMSTRUCT for ownerdraw
!  
!

type  T_DELETEITEMSTRUCT
    integer CtlType 
    integer CtlID 
    integer itemID 
    integer hwndItem 
    integer itemData 
end type  T_DELETEITEMSTRUCT

! 
!  * COMPAREITEMSTUCT for ownerdraw sorting
!

type  T_COMPAREITEMSTRUCT
    integer CtlType 
    integer CtlID 
    integer hwndItem 
    integer itemID1 
    integer itemData1 
    integer itemID2 
    integer itemData2 
    integer dwLocaleId 
end type  T_COMPAREITEMSTRUCT

! 
!  * PeekMessage() Options
!  
!

integer, parameter, public :: PM_NOREMOVE   =  #0000
integer, parameter, public :: PM_REMOVE     =  #0001
integer, parameter, public :: PM_NOYIELD    =  #0002

integer, parameter, public :: MOD_ALT           =  #0001
integer, parameter, public :: MOD_CONTROL       =  #0002
integer, parameter, public :: MOD_SHIFT         =  #0004
integer, parameter, public :: IDHOT_SNAPWINDOW  = (-1)    !  SHIFT-PRINTSCRN    
integer, parameter, public :: IDHOT_SNAPDESKTOP = (-2)    !  PRINTSCRN          

integer, parameter, public :: EWX_LOGOFF    = 0
integer, parameter, public :: EWX_SHUTDOWN  = 1
integer, parameter, public :: EWX_REBOOT    = 2
integer, parameter, public :: EWX_FORCE     = 4
integer, parameter, public :: EWX_POWEROFF  = 8



!#define ExitWindows(dwReserved, Code) ExitWindowsEx(EWX_LOGOFF, 0xFFFFFFFF)
! 
!  * Special HWND value for use with PostMessage() and SendMessage()
!

integer, parameter, public :: HWND_BROADCAST  = #ffff

integer, parameter, public :: CW_USEDEFAULT       = #80000000 !-2147483647 

! 
!  * Special value for CreateWindow, et al.
!

integer, parameter, public :: HWND_DESKTOP        = 0

! 
!  * SetWindowPos Flags
!  

integer, parameter, public :: SWP_NOSIZE =  #0001
integer, parameter, public :: SWP_NOMOVE =  #0002
integer, parameter, public :: SWP_NOZORDER =  #0004
integer, parameter, public :: SWP_NOREDRAW =  #0008
integer, parameter, public :: SWP_NOACTIVATE =  #0010
integer, parameter, public :: SWP_FRAMECHANGED =  #0020  !  The frame changed: send WM_NCCALCSIZE   
integer, parameter, public :: SWP_SHOWWINDOW =  #0040
integer, parameter, public :: SWP_HIDEWINDOW =  #0080
integer, parameter, public :: SWP_NOCOPYBITS =  #0100
integer, parameter, public :: SWP_NOOWNERZORDER =  #0200  !  Don't do owner Z ordering   
integer, parameter, public :: SWP_DRAWFRAME = SWP_FRAMECHANGED
integer, parameter, public :: SWP_NOREPOSITION = SWP_NOOWNERZORDER

integer, parameter, public :: HWND_TOP        = 0
integer, parameter, public :: HWND_BOTTOM     = 1
integer, parameter, public :: HWND_TOPMOST    = -1
integer, parameter, public :: HWND_NOTOPMOST  = -2
! 
!  * WARNING:
!  * The following structures must NOT be DWORD padded because they are
!  * followed by strings, etc that do not have to be DWORD aligned.
!  

type  T_DLGTEMPLATE
   integer style 
   integer dwExtendedStyle 
   integer*2 cdit 
   integer*2 x 
   integer*2 y 
   integer*2 cx 
   integer*2 cy 
end type  T_DLGTEMPLATE
! 
!  * Dialog item template (dit)
!

type  T_DLGITEMTEMPLATE
    integer style 
    integer dwExtendedStyle 
    integer*2 x 
    integer*2 y 
    integer*2 cx 
    integer*2 cy 
    integer*2 id 
end type  T_DLGITEMTEMPLATE

! 
!  * Window extra byted needed for private dialog classes.
!  

integer, parameter, public :: DLGWINDOWEXTRA = 30

integer, parameter, public :: KEYEVENTF_EXTENDEDKEY     =  #0001
integer, parameter, public :: KEYEVENTF_KEYUP           =  #0002
integer, parameter, public :: MOUSEEVENTF_MOVE          =  #0001 !  mouse move   
integer, parameter, public :: MOUSEEVENTF_LEFTDOWN      =  #0002 !  left button down   
integer, parameter, public :: MOUSEEVENTF_LEFTUP        =  #0004 !  left button up   
integer, parameter, public :: MOUSEEVENTF_RIGHTDOWN     =  #0008 !  right button down   
integer, parameter, public :: MOUSEEVENTF_RIGHTUP       =  #0010 !  right button up   
integer, parameter, public :: MOUSEEVENTF_MIDDLEDOWN    =  #0020 !  middle button down   
integer, parameter, public :: MOUSEEVENTF_MIDDLEUP      =  #0040 !  middle button up   
integer, parameter, public :: MOUSEEVENTF_ABSOLUTE      =  #8000 !  absolute move   

! 
!  * Queue status flags for GetQueueStatus() and MsgWaitForMultipleObjects()
!

integer, parameter, public :: QS_KEY            =  #01
integer, parameter, public :: QS_MOUSEMOVE      =  #02
integer, parameter, public :: QS_MOUSEBUTTON    =  #04
integer, parameter, public :: QS_POSTMESSAGE    =  #08
integer, parameter, public :: QS_TIMER          =  #10
integer, parameter, public :: QS_PAINT          =  #20
integer, parameter, public :: QS_SENDMESSAGE    =  #40
integer, parameter, public :: QS_HOTKEY         =  #80

! 
!  * GetSystemMetrics() codes
!  
!

integer, parameter, public :: SM_CXSCREEN           = 0
integer, parameter, public :: SM_CYSCREEN           = 1
integer, parameter, public :: SM_CXVSCROLL          = 2
integer, parameter, public :: SM_CYHSCROLL          = 3
integer, parameter, public :: SM_CYCAPTION          = 4
integer, parameter, public :: SM_CXBORDER           = 5
integer, parameter, public :: SM_CYBORDER           = 6
integer, parameter, public :: SM_CXDLGFRAME         = 7
integer, parameter, public :: SM_CYDLGFRAME         = 8
integer, parameter, public :: SM_CYVTHUMB           = 9
integer, parameter, public :: SM_CXHTHUMB           = 10
integer, parameter, public :: SM_CXICON             = 11
integer, parameter, public :: SM_CYICON             = 12
integer, parameter, public :: SM_CXCURSOR           = 13
integer, parameter, public :: SM_CYCURSOR           = 14
integer, parameter, public :: SM_CYMENU             = 15
integer, parameter, public :: SM_CXFULLSCREEN       = 16
integer, parameter, public :: SM_CYFULLSCREEN       = 17
integer, parameter, public :: SM_CYKANJIWINDOW      = 18
integer, parameter, public :: SM_MOUSEPRESENT       = 19
integer, parameter, public :: SM_CYVSCROLL          = 20
integer, parameter, public :: SM_CXHSCROLL          = 21
integer, parameter, public :: SM_DEBUG              = 22
integer, parameter, public :: SM_SWAPBUTTON         = 23
integer, parameter, public :: SM_RESERVED1          = 24
integer, parameter, public :: SM_RESERVED2          = 25
integer, parameter, public :: SM_RESERVED3          = 26
integer, parameter, public :: SM_RESERVED4          = 27
integer, parameter, public :: SM_CXMIN              = 28
integer, parameter, public :: SM_CYMIN              = 29
integer, parameter, public :: SM_CXSIZE             = 30
integer, parameter, public :: SM_CYSIZE             = 31
integer, parameter, public :: SM_CXFRAME            = 32
integer, parameter, public :: SM_CYFRAME            = 33
integer, parameter, public :: SM_CXMINTRACK         = 34
integer, parameter, public :: SM_CYMINTRACK         = 35
integer, parameter, public :: SM_CXDOUBLECLK        = 36
integer, parameter, public :: SM_CYDOUBLECLK        = 37
integer, parameter, public :: SM_CXICONSPACING      = 38
integer, parameter, public :: SM_CYICONSPACING      = 39
integer, parameter, public :: SM_MENUDROPALIGNMENT  = 40
integer, parameter, public :: SM_PENWINDOWS         = 41
integer, parameter, public :: SM_DBCSENABLED        = 42
integer, parameter, public :: SM_CMOUSEBUTTONS      = 43
integer, parameter, public :: SM_CMETRICS           = 44

! 
!  * Flags for TrackPopupMenu
!  
!
!MS$ IF .NOT. DEFINED(NOMENUS)

integer, parameter, public :: TPM_LEFTBUTTON    =  #0000
integer, parameter, public :: TPM_RIGHTBUTTON   =  #0002
integer, parameter, public :: TPM_LEFTALIGN     =  #0000
integer, parameter, public :: TPM_CENTERALIGN   =  #0004
integer, parameter, public :: TPM_RIGHTALIGN    =  #0008

!MS$ENDIF !/* !NOMENUS */


!MS$IF .NOT. DEFINED (NODRAWTEXT)

! 
!  * DrawText() Format Flags
!  
!

integer, parameter, public :: DT_TOP                =  #0000
integer, parameter, public :: DT_LEFT               =  #0000
integer, parameter, public :: DT_CENTER             =  #0001
integer, parameter, public :: DT_RIGHT              =  #0002
integer, parameter, public :: DT_VCENTER            =  #0004
integer, parameter, public :: DT_BOTTOM             =  #0008
integer, parameter, public :: DT_WORDBREAK          =  #0010
integer, parameter, public :: DT_SINGLELINE         =  #0020
integer, parameter, public :: DT_EXPANDTABS         =  #0040
integer, parameter, public :: DT_TABSTOP            =  #0080
integer, parameter, public :: DT_NOCLIP             =  #0100
integer, parameter, public :: DT_EXTERNALLEADING    =  #0200
integer, parameter, public :: DT_CALCRECT           =  #0400
integer, parameter, public :: DT_NOPREFIX           =  #0800
integer, parameter, public :: DT_INTERNAL           =  #1000

!MS$ENDIF ! NODRAWTEXT


! 
!  * GetDCEx() flags
!

integer, parameter, public :: DCX_WINDOW            =  #00000001
integer, parameter, public :: DCX_CACHE             =  #00000002
integer, parameter, public :: DCX_NORESETATTRS      =  #00000004
integer, parameter, public :: DCX_CLIPCHILDREN      =  #00000008
integer, parameter, public :: DCX_CLIPSIBLINGS      =  #00000010
integer, parameter, public :: DCX_PARENTCLIP        =  #00000020
integer, parameter, public :: DCX_EXCLUDERGN        =  #00000040
integer, parameter, public :: DCX_INTERSECTRGN      =  #00000080
integer, parameter, public :: DCX_EXCLUDEUPDATE     =  #00000100
integer, parameter, public :: DCX_INTERSECTUPDATE   =  #00000200
integer, parameter, public :: DCX_LOCKWINDOWUPDATE  =  #00000400
integer, parameter, public :: DCX_NORECOMPUTE       =  #00100000
integer, parameter, public :: DCX_VALIDATE          =  #00200000

! 
!  * RedrawWindow() flags
!

integer, parameter, public :: RDW_INVALIDATE    =  #0001
integer, parameter, public :: RDW_INTERNALPAINT =  #0002
integer, parameter, public :: RDW_ERASE         =  #0004

integer, parameter, public :: RDW_VALIDATE          =  #0008
integer, parameter, public :: RDW_NOINTERNALPAINT   =  #0010
integer, parameter, public :: RDW_NOERASE           =  #0020

integer, parameter, public :: RDW_NOCHILDREN    =  #0040
integer, parameter, public :: RDW_ALLCHILDREN   =  #0080

integer, parameter, public :: RDW_UPDATENOW =  #0100
integer, parameter, public :: RDW_ERASENOW  =  #0200

integer, parameter, public :: RDW_FRAME     =  #0400
integer, parameter, public :: RDW_NOFRAME   =  #0800

integer, parameter, public :: SW_SCROLLCHILDREN =  #0001  !  Scroll children within *lprcScroll.   
integer, parameter, public :: SW_INVALIDATE     =  #0002  !  Invalidate after scrolling   
integer, parameter, public :: SW_ERASE          =  #0004  !  If SW_INVALIDATE, don't send WM_ERASEBACKGROUND   

! 
!  * EnableScrollBar() flags
!  

integer, parameter, public :: ESB_ENABLE_BOTH   =  #0000
integer, parameter, public :: ESB_DISABLE_BOTH  =  #0003

integer, parameter, public :: ESB_DISABLE_LEFT  =  #0001
integer, parameter, public :: ESB_DISABLE_RIGHT =  #0002

integer, parameter, public :: ESB_DISABLE_UP    =  #0001
integer, parameter, public :: ESB_DISABLE_DOWN  =  #0002

integer, parameter, public :: ESB_DISABLE_LTUP  = ESB_DISABLE_LEFT
integer, parameter, public :: ESB_DISABLE_RTDN  = ESB_DISABLE_RIGHT

! 
!  * MessageBox() Flags
!  
!

integer, parameter, public :: MB_OK                 =  #00000000
integer, parameter, public :: MB_OKCANCEL           =  #00000001
integer, parameter, public :: MB_ABORTRETRYIGNORE   =  #00000002
integer, parameter, public :: MB_YESNOCANCEL        =  #00000003
integer, parameter, public :: MB_YESNO              =  #00000004
integer, parameter, public :: MB_RETRYCANCEL        =  #00000005

integer, parameter, public :: MB_ICONHAND           =  #00000010
integer, parameter, public :: MB_ICONQUESTION       =  #00000020
integer, parameter, public :: MB_ICONEXCLAMATION    =  #00000030
integer, parameter, public :: MB_ICONASTERISK       =  #00000040

integer, parameter, public :: MB_ICONINFORMATION    = MB_ICONASTERISK
integer, parameter, public :: MB_ICONSTOP           = MB_ICONHAND

integer, parameter, public :: MB_DEFBUTTON1         =  #00000000
integer, parameter, public :: MB_DEFBUTTON2         =  #00000100
integer, parameter, public :: MB_DEFBUTTON3         =  #00000200

integer, parameter, public :: MB_APPLMODAL          =  #00000000
integer, parameter, public :: MB_SYSTEMMODAL        =  #00001000
integer, parameter, public :: MB_TASKMODAL          =  #00002000

integer, parameter, public :: MB_NOFOCUS                =  #00008000
integer, parameter, public :: MB_SETFOREGROUND          =  #00010000
integer, parameter, public :: MB_DEFAULT_DESKTOP_ONLY   =  #00020000

integer, parameter, public :: MB_TYPEMASK   =  #0000000F
integer, parameter, public :: MB_ICONMASK   =  #000000F0
integer, parameter, public :: MB_DEFMASK    =  #00000F00
integer, parameter, public :: MB_MODEMASK   =  #00003000
integer, parameter, public :: MB_MISCMASK   =  #0000C000


! 
!  * Color Types
!  

integer, parameter, public :: CTLCOLOR_MSGBOX = 0
integer, parameter, public :: CTLCOLOR_EDIT = 1
integer, parameter, public :: CTLCOLOR_LISTBOX = 2
integer, parameter, public :: CTLCOLOR_BTN = 3
integer, parameter, public :: CTLCOLOR_DLG = 4
integer, parameter, public :: CTLCOLOR_SCROLLBAR = 5
integer, parameter, public :: CTLCOLOR_STATIC = 6
integer, parameter, public :: CTLCOLOR_MAX = 8     !  three bits max   

integer, parameter, public :: COLOR_SCROLLBAR = 0
integer, parameter, public :: COLOR_BACKGROUND = 1
integer, parameter, public :: COLOR_ACTIVECAPTION = 2
integer, parameter, public :: COLOR_INACTIVECAPTION = 3
integer, parameter, public :: COLOR_MENU = 4
integer, parameter, public :: COLOR_WINDOW = 5
integer, parameter, public :: COLOR_WINDOWFRAME = 6
integer, parameter, public :: COLOR_MENUTEXT = 7
integer, parameter, public :: COLOR_WINDOWTEXT = 8
integer, parameter, public :: COLOR_CAPTIONTEXT = 9
integer, parameter, public :: COLOR_ACTIVEBORDER = 10
integer, parameter, public :: COLOR_INACTIVEBORDER = 11
integer, parameter, public :: COLOR_APPWORKSPACE = 12
integer, parameter, public :: COLOR_HIGHLIGHT = 13
integer, parameter, public :: COLOR_HIGHLIGHTTEXT = 14
integer, parameter, public :: COLOR_BTNFACE = 15
integer, parameter, public :: COLOR_BTNSHADOW = 16
integer, parameter, public :: COLOR_GRAYTEXT = 17
integer, parameter, public :: COLOR_BTNTEXT = 18
integer, parameter, public :: COLOR_INACTIVECAPTIONTEXT = 19
integer, parameter, public :: COLOR_BTNHIGHLIGHT = 20

!#define GetNextWindow(hWnd, wCmd) GetWindow(hWnd, wCmd)
!#define GetSysModalWindow() (NULL)
!#define SetSysModalWindow(hWnd) (NULL)

!#define GetWindowTask(hWnd) \
!        ((HANDLE)GetWindowThreadProcessId(hWnd, NULL))

! 
!  * GetWindow() Constants
!

integer, parameter, public :: GW_HWNDFIRST = 0
integer, parameter, public :: GW_HWNDLAST = 1
integer, parameter, public :: GW_HWNDNEXT = 2
integer, parameter, public :: GW_HWNDPREV = 3
integer, parameter, public :: GW_OWNER = 4
integer, parameter, public :: GW_CHILD = 5
integer, parameter, public :: GW_MAX = 5



!  * Menu flags for Add/Check/EnableMenuItem()

integer, parameter, public :: MF_INSERT =  #00000000
integer, parameter, public :: MF_CHANGE =  #00000080
integer, parameter, public :: MF_APPEND =  #00000100
integer, parameter, public :: MF_DELETE =  #00000200
integer, parameter, public :: MF_REMOVE =  #00001000

integer, parameter, public :: MF_BYCOMMAND =  #00000000
integer, parameter, public :: MF_BYPOSITION =  #00000400

integer, parameter, public :: MF_SEPARATOR =  #00000800

integer, parameter, public :: MF_ENABLED =  #00000000
integer, parameter, public :: MF_GRAYED =  #00000001
integer, parameter, public :: MF_DISABLED =  #00000002

integer, parameter, public :: MF_UNCHECKED =  #00000000
integer, parameter, public :: MF_CHECKED =  #00000008
integer, parameter, public :: MF_USECHECKBITMAPS =  #00000200

integer, parameter, public :: MF_STRING =  #00000000
integer, parameter, public :: MF_BITMAP =  #00000004
integer, parameter, public :: MF_OWNERDRAW =  #00000100

integer, parameter, public :: MF_POPUP =  #00000010
integer, parameter, public :: MF_MENUBARBREAK =  #00000020
integer, parameter, public :: MF_MENUBREAK =  #00000040

integer, parameter, public :: MF_UNHILITE =  #00000000
integer, parameter, public :: MF_HILITE =  #00000080

integer, parameter, public :: MF_SYSMENU =  #00002000
integer, parameter, public :: MF_HELP =  #00004000
integer, parameter, public :: MF_MOUSESELECT =  #00008000


! 
!  * Menu item resource format
!  
!

type  T_MENUITEMTEMPLATEHEADER
    integer(2) versionNumber
    integer(2) offset 
end type  T_MENUITEMTEMPLATEHEADER

type  T_MENUITEMTEMPLATE
    integer(2) mtOption 
    integer(2) mtID 
    integer(2) mtString (1 )
end type  T_MENUITEMTEMPLATE

integer, parameter, public :: MF_END =  #00000080
! 
!  * System Menu Command Values
!  

integer, parameter, public :: SC_SIZE =  #F000
integer, parameter, public :: SC_MOVE =  #F010
integer, parameter, public :: SC_MINIMIZE =  #F020
integer, parameter, public :: SC_MAXIMIZE =  #F030
integer, parameter, public :: SC_NEXTWINDOW =  #F040
integer, parameter, public :: SC_PREVWINDOW =  #F050
integer, parameter, public :: SC_CLOSE =  #F060
integer, parameter, public :: SC_VSCROLL =  #F070
integer, parameter, public :: SC_HSCROLL =  #F080
integer, parameter, public :: SC_MOUSEMENU =  #F090
integer, parameter, public :: SC_KEYMENU =  #F100
integer, parameter, public :: SC_ARRANGE =  #F110
integer, parameter, public :: SC_RESTORE =  #F120
integer, parameter, public :: SC_TASKLIST =  #F130
integer, parameter, public :: SC_SCREENSAVE =  #F140
integer, parameter, public :: SC_HOTKEY =  #F150

! 
!  * Obsolete names
!

integer, parameter, public :: SC_ICON = SC_MINIMIZE
integer, parameter, public :: SC_ZOOM = SC_MAXIMIZE

!#define CopyCursor(pcur) ((HCURSOR)CopyIcon((HICON)(pcur)))

! 
!  * Standard Cursor IDs
!  

!$DEFINE  IDC_ARROW           = MAKEINTRESOURCE(32512)
!$DEFINE   IDC_IBEAM           = MAKEINTRESOURCE(32513)
!$DEFINE   IDC_WAIT            = MAKEINTRESOURCE(32514)
!$DEFINE   IDC_CROSS           = MAKEINTRESOURCE(32515)
!$DEFINE   IDC_UPARROW         = MAKEINTRESOURCE(32516)
!$DEFINE   IDC_SIZE            = MAKEINTRESOURCE(32640)
!$DEFINE   IDC_ICON            = MAKEINTRESOURCE(32641)
!$DEFINE   IDC_SIZENWSE        = MAKEINTRESOURCE(32642)
!$DEFINE   IDC_SIZENESW        = MAKEINTRESOURCE(32643)
!$DEFINE   IDC_SIZEWE          = MAKEINTRESOURCE(32644)
!$DEFINE   IDC_SIZENS          = MAKEINTRESOURCE(32645)
!$DEFINE   IDC_SIZEALL         = MAKEINTRESOURCE(32646) !  not in win3.1   
!$DEFINE   IDC_NO              = MAKEINTRESOURCE(32648) !  not in win3.1   
!$DEFINE   IDC_APPSTARTING     = MAKEINTRESOURCE(32650) !  not in win3.1   
!integer, parameter, public :: IDC_ARROW           = MAKEINTRESOURCE(32512)
!integer, parameter, public :: IDC_IBEAM           = MAKEINTRESOURCE(32513)
!integer, parameter, public :: IDC_WAIT            = MAKEINTRESOURCE(32514)
!integer, parameter, public :: IDC_CROSS           = MAKEINTRESOURCE(32515)
!integer, parameter, public :: IDC_UPARROW         = MAKEINTRESOURCE(32516)
!integer, parameter, public :: IDC_SIZE            = MAKEINTRESOURCE(32640)
!integer, parameter, public :: IDC_ICON            = MAKEINTRESOURCE(32641)
!integer, parameter, public :: IDC_SIZENWSE        = MAKEINTRESOURCE(32642)
!integer, parameter, public :: IDC_SIZENESW        = MAKEINTRESOURCE(32643)
!integer, parameter, public :: IDC_SIZEWE          = MAKEINTRESOURCE(32644)
!integer, parameter, public :: IDC_SIZENS          = MAKEINTRESOURCE(32645)
!integer, parameter, public :: IDC_SIZEALL         = MAKEINTRESOURCE(32646) !  not in win3.1   
!integer, parameter, public :: IDC_NO              = MAKEINTRESOURCE(32648) !  not in win3.1   
!integer, parameter, public :: IDC_APPSTARTING     = MAKEINTRESOURCE(32650) !  not in win3.1   

type  T_ICONINFO
    logical(4) fIcon 
    integer xHotspot 
    integer yHotspot 
    integer hbmMask 
    integer hbmColor 
end type  T_ICONINFO

!MS$IF DEFINED (OEMRESOURCE)

! 
!  * OEM Resource Ordinal Numbers
!

integer, parameter, public :: OBM_CLOSE = 32754
integer, parameter, public :: OBM_UPARROW = 32753
integer, parameter, public :: OBM_DNARROW = 32752
integer, parameter, public :: OBM_RGARROW = 32751
integer, parameter, public :: OBM_LFARROW = 32750
integer, parameter, public :: OBM_REDUCE = 32749
integer, parameter, public :: OBM_ZOOM = 32748
integer, parameter, public :: OBM_RESTORE = 32747
integer, parameter, public :: OBM_REDUCED = 32746
integer, parameter, public :: OBM_ZOOMD = 32745
integer, parameter, public :: OBM_RESTORED = 32744
integer, parameter, public :: OBM_UPARROWD = 32743
integer, parameter, public :: OBM_DNARROWD = 32742
integer, parameter, public :: OBM_RGARROWD = 32741
integer, parameter, public :: OBM_LFARROWD = 32740
integer, parameter, public :: OBM_MNARROW = 32739
integer, parameter, public :: OBM_COMBO = 32738
integer, parameter, public :: OBM_UPARROWI = 32737
integer, parameter, public :: OBM_DNARROWI = 32736
integer, parameter, public :: OBM_RGARROWI = 32735
integer, parameter, public :: OBM_LFARROWI = 32734

integer, parameter, public :: OBM_OLD_CLOSE = 32767
integer, parameter, public :: OBM_SIZE = 32766
integer, parameter, public :: OBM_OLD_UPARROW = 32765
integer, parameter, public :: OBM_OLD_DNARROW = 32764
integer, parameter, public :: OBM_OLD_RGARROW = 32763
integer, parameter, public :: OBM_OLD_LFARROW = 32762
integer, parameter, public :: OBM_BTSIZE = 32761
integer, parameter, public :: OBM_CHECK = 32760
integer, parameter, public :: OBM_CHECKBOXES = 32759
integer, parameter, public :: OBM_BTNCORNERS = 32758
integer, parameter, public :: OBM_OLD_REDUCE = 32757
integer, parameter, public :: OBM_OLD_ZOOM = 32756
integer, parameter, public :: OBM_OLD_RESTORE = 32755

integer, parameter, public :: OCR_NORMAL = 32512
integer, parameter, public :: OCR_IBEAM = 32513
integer, parameter, public :: OCR_WAIT = 32514
integer, parameter, public :: OCR_CROSS = 32515
integer, parameter, public :: OCR_UP = 32516
integer, parameter, public :: OCR_SIZE = 32640
integer, parameter, public :: OCR_ICON = 32641
integer, parameter, public :: OCR_SIZENWSE = 32642
integer, parameter, public :: OCR_SIZENESW = 32643
integer, parameter, public :: OCR_SIZEWE = 32644
integer, parameter, public :: OCR_SIZENS = 32645
integer, parameter, public :: OCR_SIZEALL = 32646
integer, parameter, public :: OCR_ICOCUR = 32647
integer, parameter, public :: OCR_NO = 32648 ! not in win3.1   

integer, parameter, public :: OIC_SAMPLE = 32512
integer, parameter, public :: OIC_HAND = 32513
integer, parameter, public :: OIC_QUES = 32514
integer, parameter, public :: OIC_BANG = 32515
integer, parameter, public :: OIC_NOTE = 32516

!MS$ENDIF ! /* OEMRESOURCE */


integer, parameter, public :: ORD_LANGDRIVER = 1     !  The ordinal number for the entry point of
                                !** language drivers.


! 
!  * Standard Icon IDs
!  
!

!$DEFINE IDI_APPLICATION   = MAKEINTRESOURCE(32512)
!$DEFINE  IDI_HAND          = MAKEINTRESOURCE(32513)
!$DEFINE  IDI_QUESTION      = MAKEINTRESOURCE(32514)
!$DEFINE  IDI_EXCLAMATION   = MAKEINTRESOURCE(32515)
!$DEFINE  IDI_ASTERISK      = MAKEINTRESOURCE(32516)
!integer, parameter, public :: IDI_APPLICATION   = MAKEINTRESOURCE(32512)
!integer, parameter, public :: IDI_HAND          = MAKEINTRESOURCE(32513)
!integer, parameter, public :: IDI_QUESTION      = MAKEINTRESOURCE(32514)
!integer, parameter, public :: IDI_EXCLAMATION   = MAKEINTRESOURCE(32515)
!integer, parameter, public :: IDI_ASTERISK      = MAKEINTRESOURCE(32516)

! 
!  * Dialog Box Command IDs
!  

integer, parameter, public :: IDOK = 1
integer, parameter, public :: IDCANCEL = 2
integer, parameter, public :: IDABORT = 3
integer, parameter, public :: IDRETRY = 4
integer, parameter, public :: IDIGNORE = 5
integer, parameter, public :: IDYES = 6
integer, parameter, public :: IDNO = 7
integer, parameter, public :: IDCLOSE = 8
integer, parameter, public :: IDHELP = 9
! 
!  * Control Manager Structures and Definitions
!  

! 
!  * Edit Control Styles
!  

integer, parameter, public :: ES_LEFT =  #0000
integer, parameter, public :: ES_CENTER =  #0001
integer, parameter, public :: ES_RIGHT =  #0002
integer, parameter, public :: ES_MULTILINE =  #0004
integer, parameter, public :: ES_UPPERCASE =  #0008
integer, parameter, public :: ES_LOWERCASE =  #0010
integer, parameter, public :: ES_PASSWORD =  #0020
integer, parameter, public :: ES_AUTOVSCROLL =  #0040
integer, parameter, public :: ES_AUTOHSCROLL =  #0080
integer, parameter, public :: ES_NOHIDESEL =  #0100
integer, parameter, public :: ES_OEMCONVERT =  #0400
integer, parameter, public :: ES_READONLY =  #0800
integer, parameter, public :: ES_WANTRETURN =  #1000



! 
!  * Edit Control Notification Codes
!  
!

integer, parameter, public :: EN_SETFOCUS =  #0100
integer, parameter, public :: EN_KILLFOCUS =  #0200
integer, parameter, public :: EN_CHANGE =  #0300
integer, parameter, public :: EN_UPDATE =  #0400
integer, parameter, public :: EN_ERRSPACE =  #0500
integer, parameter, public :: EN_MAXTEXT =  #0501
integer, parameter, public :: EN_HSCROLL =  #0601
integer, parameter, public :: EN_VSCROLL =  #0602


! 
!  * Edit Control Messages
!  
!

integer, parameter, public :: EM_GETSEL =  #00B0
integer, parameter, public :: EM_SETSEL =  #00B1
integer, parameter, public :: EM_GETRECT =  #00B2
integer, parameter, public :: EM_SETRECT =  #00B3
integer, parameter, public :: EM_SETRECTNP =  #00B4
integer, parameter, public :: EM_SCROLL =  #00B5
integer, parameter, public :: EM_LINESCROLL =  #00B6
integer, parameter, public :: EM_SCROLLCARET =  #00B7
integer, parameter, public :: EM_GETMODIFY =  #00B8
integer, parameter, public :: EM_SETMODIFY =  #00B9
integer, parameter, public :: EM_GETLINECOUNT =  #00BA
integer, parameter, public :: EM_LINEINDEX =  #00BB
integer, parameter, public :: EM_SETHANDLE =  #00BC
integer, parameter, public :: EM_GETHANDLE =  #00BD
integer, parameter, public :: EM_GETTHUMB =  #00BE
integer, parameter, public :: EM_LINELENGTH =  #00C1
integer, parameter, public :: EM_REPLACESEL =  #00C2
integer, parameter, public :: EM_GETLINE =  #00C4
integer, parameter, public :: EM_LIMITTEXT =  #00C5
integer, parameter, public :: EM_CANUNDO =  #00C6
integer, parameter, public :: EM_UNDO =  #00C7
integer, parameter, public :: EM_FMTLINES =  #00C8
integer, parameter, public :: EM_LINEFROMCHAR =  #00C9
integer, parameter, public :: EM_SETTABSTOPS =  #00CB
integer, parameter, public :: EM_SETPASSWORDCHAR =  #00CC
integer, parameter, public :: EM_EMPTYUNDOBUFFER =  #00CD
integer, parameter, public :: EM_GETFIRSTVISIBLELINE =  #00CE
integer, parameter, public :: EM_SETREADONLY =  #00CF
integer, parameter, public :: EM_SETWORDBREAKPROC =  #00D0
integer, parameter, public :: EM_GETWORDBREAKPROC =  #00D1
integer, parameter, public :: EM_GETPASSWORDCHAR =  #00D2


! 
!  * EDITWORDBREAKPROC code values
!  
!

integer, parameter, public :: WB_LEFT = 0
integer, parameter, public :: WB_RIGHT = 1
integer, parameter, public :: WB_ISDELIMITER = 2

! 
!  * Button Control Styles
!  
!

integer, parameter, public :: BS_PUSHBUTTON =  #00
integer, parameter, public :: BS_DEFPUSHBUTTON =  #01
integer, parameter, public :: BS_CHECKBOX =  #02
integer, parameter, public :: BS_AUTOCHECKBOX =  #03
integer, parameter, public :: BS_RADIOBUTTON =  #04
integer, parameter, public :: BS_3STATE =  #05
integer, parameter, public :: BS_AUTO3STATE =  #06
integer, parameter, public :: BS_GROUPBOX =  #07
integer, parameter, public :: BS_USERBUTTON =  #08
integer, parameter, public :: BS_AUTORADIOBUTTON =  #09
integer, parameter, public :: BS_OWNERDRAW =  #0B
integer, parameter, public :: BS_LEFTTEXT =  #20


! 
!  * User Button Notification Codes
!  
!

integer, parameter, public :: BN_CLICKED = 0
integer, parameter, public :: BN_PAINT = 1
integer, parameter, public :: BN_HILITE = 2
integer, parameter, public :: BN_UNHILITE = 3
integer, parameter, public :: BN_DISABLE = 4
integer, parameter, public :: BN_DOUBLECLICKED = 5

! 
!  * Button Control Messages
!  
!

integer, parameter, public :: BM_GETCHECK =  #00F0
integer, parameter, public :: BM_SETCHECK =  #00F1
integer, parameter, public :: BM_GETSTATE =  #00F2
integer, parameter, public :: BM_SETSTATE =  #00F3
integer, parameter, public :: BM_SETSTYLE =  #00F4

! 
!  * Static Control Constants
!  
!

integer, parameter, public :: SS_LEFT =  #00
integer, parameter, public :: SS_CENTER =  #01
integer, parameter, public :: SS_RIGHT =  #02
integer, parameter, public :: SS_ICON =  #03
integer, parameter, public :: SS_BLACKRECT =  #04
integer, parameter, public :: SS_GRAYRECT =  #05
integer, parameter, public :: SS_WHITERECT =  #06
integer, parameter, public :: SS_BLACKFRAME =  #07
integer, parameter, public :: SS_GRAYFRAME =  #08
integer, parameter, public :: SS_WHITEFRAME =  #09
integer, parameter, public :: SS_USERITEM =  #0A
integer, parameter, public :: SS_SIMPLE =  #0B
integer, parameter, public :: SS_LEFTNOWORDWRAP =  #0C
integer, parameter, public :: SS_NOPREFIX =  #80    !  Don't do "&" character translation   

! 
!  * Static Control Mesages
!  
!

integer, parameter, public :: STM_SETICON =  #170
integer, parameter, public :: STM_GETICON =  #171
integer, parameter, public :: STM_MSGMAX =  #172

! 
!  * Dialog window class
!  
!


!$DEFINE WC_DIALOG       = MAKEINTATOM(#8002)
!integer, parameter, public :: WC_DIALOG       = MAKEINTATOM(#8002)

! 
!  * Get/SetWindowWord/Long offsets for use with WC_DIALOG windows
!  
!

integer, parameter, public :: DWL_MSGRESULT = 0
integer, parameter, public :: DWL_DLGPROC = 4
integer, parameter, public :: DWL_USER = 8

! 
!  * DlgDirList, DlgDirListComboBox flags values
!

integer, parameter, public :: DDL_READWRITE =  #0000
integer, parameter, public :: DDL_READONLY =  #0001
integer, parameter, public :: DDL_HIDDEN =  #0002
integer, parameter, public :: DDL_SYSTEM =  #0004
integer, parameter, public :: DDL_DIRECTORY =  #0010
integer, parameter, public :: DDL_ARCHIVE =  #0020

integer, parameter, public :: DDL_POSTMSGS =  #2000
integer, parameter, public :: DDL_DRIVES =  #4000
integer, parameter, public :: DDL_EXCLUSIVE =  #8000

! 
!  * Dialog Styles
!

integer, parameter, public :: DS_ABSALIGN =  #01
integer, parameter, public :: DS_SYSMODAL =  #02
integer, parameter, public :: DS_LOCALEDIT =  #20   !  Edit items get Local storage.   
integer, parameter, public :: DS_SETFONT =  #40   !  User specified font for Dlg controls   
integer, parameter, public :: DS_MODALFRAME =  #80   !  Can be combined with WS_CAPTION    
integer, parameter, public :: DS_NOIDLEMSG =  #100  !  WM_ENTERIDLE message will not be sent   
integer, parameter, public :: DS_SETFOREGROUND =  #200  !  not in win3.1   

integer, parameter, public :: DM_GETDEFID         = (WM_USER+0)
integer, parameter, public :: DM_SETDEFID         = (WM_USER+1)

! 
!  * Returned in HIWORD() of DM_GETDEFID result if msg is supported
!  

integer, parameter, public :: DC_HASDEFID =  #534B
! 
!  * Dialog Codes
!  

integer, parameter, public :: DLGC_WANTARROWS =  #0001      !  Control wants arrow keys           
integer, parameter, public :: DLGC_WANTTAB =  #0002      !  Control wants tab keys             
integer, parameter, public :: DLGC_WANTALLKEYS =  #0004      !  Control wants all keys             
integer, parameter, public :: DLGC_WANTMESSAGE =  #0004      !  Pass message to control            
integer, parameter, public :: DLGC_HASSETSEL =  #0008      !  Understands EM_SETSEL message      
integer, parameter, public :: DLGC_DEFPUSHBUTTON =  #0010      !  Default pushbutton                 
integer, parameter, public :: DLGC_UNDEFPUSHBUTTON =  #0020     !  Non-default pushbutton             
integer, parameter, public :: DLGC_RADIOBUTTON =  #0040      !  Radio button                       
integer, parameter, public :: DLGC_WANTCHARS =  #0080      !  Want WM_CHAR messages              
integer, parameter, public :: DLGC_STATIC =  #0100      !  Static item: don't include         
integer, parameter, public :: DLGC_BUTTON =  #2000      !  Button item: can be checked        
integer, parameter, public :: LB_CTLCODE = 0

! 
!  * Listbox Return Values
!

integer, parameter, public :: LB_OKAY = 0
integer, parameter, public :: LB_ERR = (-1)
integer, parameter, public :: LB_ERRSPACE = (-2)

! 
! **  The idStaticPath parameter to DlgDirList can have the following values
! **  ORed if the list box should show other details of the files along with
! **  the name of the files;
! 
!

! 
!  * Listbox Notification Codes
!  
!

integer, parameter, public :: LBN_ERRSPACE = (-2)
integer, parameter, public :: LBN_SELCHANGE = 1
integer, parameter, public :: LBN_DBLCLK = 2
integer, parameter, public :: LBN_SELCANCEL = 3
integer, parameter, public :: LBN_SETFOCUS = 4
integer, parameter, public :: LBN_KILLFOCUS = 5

! 
!  * Listbox messages
!

integer, parameter, public :: LB_ADDSTRING =  #0180
integer, parameter, public :: LB_INSERTSTRING =  #0181
integer, parameter, public :: LB_DELETESTRING =  #0182
integer, parameter, public :: LB_SELITEMRANGEEX =  #0183
integer, parameter, public :: LB_RESETCONTENT =  #0184
integer, parameter, public :: LB_SETSEL =  #0185
integer, parameter, public :: LB_SETCURSEL =  #0186
integer, parameter, public :: LB_GETSEL =  #0187
integer, parameter, public :: LB_GETCURSEL =  #0188
integer, parameter, public :: LB_GETTEXT =  #0189
integer, parameter, public :: LB_GETTEXTLEN =  #018A
integer, parameter, public :: LB_GETCOUNT =  #018B
integer, parameter, public :: LB_SELECTSTRING =  #018C
integer, parameter, public :: LB_DIR =  #018D
integer, parameter, public :: LB_GETTOPINDEX =  #018E
integer, parameter, public :: LB_FINDSTRING =  #018F
integer, parameter, public :: LB_GETSELCOUNT =  #0190
integer, parameter, public :: LB_GETSELITEMS =  #0191
integer, parameter, public :: LB_SETTABSTOPS =  #0192
integer, parameter, public :: LB_GETHORIZONTALEXTENT =  #0193
integer, parameter, public :: LB_SETHORIZONTALEXTENT =  #0194
integer, parameter, public :: LB_SETCOLUMNWIDTH =  #0195
integer, parameter, public :: LB_ADDFILE =  #0196
integer, parameter, public :: LB_SETTOPINDEX =  #0197
integer, parameter, public :: LB_GETITEMRECT =  #0198
integer, parameter, public :: LB_GETITEMDATA =  #0199
integer, parameter, public :: LB_SETITEMDATA =  #019A
integer, parameter, public :: LB_SELITEMRANGE =  #019B
integer, parameter, public :: LB_SETANCHORINDEX =  #019C
integer, parameter, public :: LB_GETANCHORINDEX =  #019D
integer, parameter, public :: LB_SETCARETINDEX =  #019E
integer, parameter, public :: LB_GETCARETINDEX =  #019F
integer, parameter, public :: LB_SETITEMHEIGHT =  #01A0
integer, parameter, public :: LB_GETITEMHEIGHT =  #01A1
integer, parameter, public :: LB_FINDSTRINGEXACT =  #01A2
integer, parameter, public :: LB_SETLOCALE =  #01A5
integer, parameter, public :: LB_GETLOCALE =  #01A6
integer, parameter, public :: LB_SETCOUNT =  #01A7
integer, parameter, public :: LB_MSGMAX =  #01A8

! 
!  * Listbox Styles
!  

integer, parameter, public :: LBS_NOTIFY =  #0001
integer, parameter, public :: LBS_SORT =  #0002
integer, parameter, public :: LBS_NOREDRAW =  #0004
integer, parameter, public :: LBS_MULTIPLESEL =  #0008
integer, parameter, public :: LBS_OWNERDRAWFIXED =  #0010
integer, parameter, public :: LBS_OWNERDRAWVARIABLE =  #0020
integer, parameter, public :: LBS_HASSTRINGS =  #0040
integer, parameter, public :: LBS_USETABSTOPS =  #0080
integer, parameter, public :: LBS_NOINTEGRALHEIGHT =  #0100
integer, parameter, public :: LBS_MULTICOLUMN =  #0200
integer, parameter, public :: LBS_WANTKEYBOARDINPUT =  #0400
integer, parameter, public :: LBS_EXTENDEDSEL =  #0800
integer, parameter, public :: LBS_DISABLENOSCROLL =  #1000
integer, parameter, public :: LBS_NODATA =  #2000

! 
!  * Combo Box return Values
!

integer, parameter, public :: CB_OKAY = 0
integer, parameter, public :: CB_ERR = (-1)
integer, parameter, public :: CB_ERRSPACE = (-2)

! 
!  * Combo Box Notification Codes
!

integer, parameter, public :: CBN_ERRSPACE = (-1)
integer, parameter, public :: CBN_SELCHANGE = 1
integer, parameter, public :: CBN_DBLCLK = 2
integer, parameter, public :: CBN_SETFOCUS = 3
integer, parameter, public :: CBN_KILLFOCUS = 4
integer, parameter, public :: CBN_EDITCHANGE = 5
integer, parameter, public :: CBN_EDITUPDATE = 6
integer, parameter, public :: CBN_DROPDOWN = 7
integer, parameter, public :: CBN_CLOSEUP = 8
integer, parameter, public :: CBN_SELENDOK = 9
integer, parameter, public :: CBN_SELENDCANCEL = 10

! 
!  * Combo Box styles
!

!MS$IF .NOT. DEFINED (NOWINSTYLES)

integer, parameter, public :: CBS_SIMPLE =  #0001
integer, parameter, public :: CBS_DROPDOWN =  #0002
integer, parameter, public :: CBS_DROPDOWNLIST =  #0003
integer, parameter, public :: CBS_OWNERDRAWFIXED =  #0010
integer, parameter, public :: CBS_OWNERDRAWVARIABLE =  #0020
integer, parameter, public :: CBS_AUTOHSCROLL =  #0040
integer, parameter, public :: CBS_OEMCONVERT =  #0080
integer, parameter, public :: CBS_SORT =  #0100
integer, parameter, public :: CBS_HASSTRINGS =  #0200
integer, parameter, public :: CBS_NOINTEGRALHEIGHT =  #0400
integer, parameter, public :: CBS_DISABLENOSCROLL =  #0800

!MS$ENDIF ! NOWINSTYLES


! 
!  * Combo Box messages
!
!MS$IF .NOT. DEFINED (NOWINMESSAGES)

integer, parameter, public :: CB_GETEDITSEL =  #0140
integer, parameter, public :: CB_LIMITTEXT =  #0141
integer, parameter, public :: CB_SETEDITSEL =  #0142
integer, parameter, public :: CB_ADDSTRING =  #0143
integer, parameter, public :: CB_DELETESTRING =  #0144
integer, parameter, public :: CB_DIR =  #0145
integer, parameter, public :: CB_GETCOUNT =  #0146
integer, parameter, public :: CB_GETCURSEL =  #0147
integer, parameter, public :: CB_GETLBTEXT =  #0148
integer, parameter, public :: CB_GETLBTEXTLEN =  #0149
integer, parameter, public :: CB_INSERTSTRING =  #014A
integer, parameter, public :: CB_RESETCONTENT =  #014B
integer, parameter, public :: CB_FINDSTRING =  #014C
integer, parameter, public :: CB_SELECTSTRING =  #014D
integer, parameter, public :: CB_SETCURSEL =  #014E
integer, parameter, public :: CB_SHOWDROPDOWN =  #014F
integer, parameter, public :: CB_GETITEMDATA =  #0150
integer, parameter, public :: CB_SETITEMDATA =  #0151
integer, parameter, public :: CB_GETDROPPEDCONTROLRECT =  #0152
integer, parameter, public :: CB_SETITEMHEIGHT =  #0153
integer, parameter, public :: CB_GETITEMHEIGHT =  #0154
integer, parameter, public :: CB_SETEXTENDEDUI =  #0155
integer, parameter, public :: CB_GETEXTENDEDUI =  #0156
integer, parameter, public :: CB_GETDROPPEDSTATE =  #0157
integer, parameter, public :: CB_FINDSTRINGEXACT =  #0158
integer, parameter, public :: CB_SETLOCALE =  #0159
integer, parameter, public :: CB_GETLOCALE =  #015a
integer, parameter, public :: CB_MSGMAX =  #015b
!MS$ENDIF ! /* NOWINMESSAGES */


! 
!  * Scroll Bar Styles
!  
!

integer, parameter, public :: SBS_HORZ =  #0000
integer, parameter, public :: SBS_VERT =  #0001
integer, parameter, public :: SBS_TOPALIGN =  #0002
integer, parameter, public :: SBS_LEFTALIGN =  #0002
integer, parameter, public :: SBS_BOTTOMALIGN =  #0004
integer, parameter, public :: SBS_RIGHTALIGN =  #0004
integer, parameter, public :: SBS_SIZEBOXTOPLEFTALIGN =  #0002
integer, parameter, public :: SBS_SIZEBOXBOTTOMRIGHTALIGN =  #0004
integer, parameter, public :: SBS_SIZEBOX =  #0008

! 
!  * Scroll bar messages
!  
!

integer, parameter, public :: SBM_SETPOS =  #00E0 ! not in win3.1   
integer, parameter, public :: SBM_GETPOS =  #00E1 ! not in win3.1   
integer, parameter, public :: SBM_SETRANGE =  #00E2 ! not in win3.1   
integer, parameter, public :: SBM_SETRANGEREDRAW =  #00E6 ! not in win3.1   
integer, parameter, public :: SBM_GETRANGE =  #00E3 ! not in win3.1   
integer, parameter, public :: SBM_ENABLE_ARROWS =  #00E4 ! not in win3.1   

! 
!  * MDI client style bits
!

integer, parameter, public :: MDIS_ALLCHILDSTYLES =  #0001

! 
!  * wParam Flags for WM_MDITILE and WM_MDICASCADE messages.
!

integer, parameter, public :: MDITILE_VERTICAL =  #0000 ! not in win3.1   
integer, parameter, public :: MDITILE_HORIZONTAL =  #0001 ! not in win3.1   
integer, parameter, public :: MDITILE_SKIPDISABLED =  #0002 ! not in win3.1   

type  T_MDICREATESTRUCT
    integer szClass 
    integer szTitle 
    integer hOwner 
    integer x 
    integer y 
    integer cx 
    integer cy 
    integer style 
    integer lParam          !  app-defined stuff   
end type  T_MDICREATESTRUCT


type  T_CLIENTCREATESTRUCT
    integer hWindowMenu 
    integer idFirstChild 
end type  T_CLIENTCREATESTRUCT


!  Help support 


type  T_MULTIKEYHELP
    integer mkSize 
    character mkKeylist 
    character szKeyphrase (1 )
end type  T_MULTIKEYHELP


type  T_HELPWININFO
    integer wStructSize 
    integer x 
    integer y 
    integer dx 
    integer dy 
    integer wMax 
    character rgchMember (2 )
end type  T_HELPWININFO


! 
!  * Commands to pass to WinHelp()
!  
!

integer, parameter, public :: HELP_CONTEXT =  #0001  !  Display topic in ulTopic   
integer, parameter, public :: HELP_QUIT =  #0002  !  Terminate help   
integer, parameter, public :: HELP_INDEX =  #0003  !  Display index   
integer, parameter, public :: HELP_CONTENTS =  #0003
integer, parameter, public :: HELP_HELPONHELP =  #0004  !  Display help on using help   
integer, parameter, public :: HELP_SETINDEX =  #0005  !  Set current Index for multi index help   
integer, parameter, public :: HELP_SETCONTENTS =  #0005
integer, parameter, public :: HELP_CONTEXTPOPUP =  #0008
integer, parameter, public :: HELP_FORCEFILE =  #0009
integer, parameter, public :: HELP_KEY =  #0101  !  Display topic for keyword in offabData   
integer, parameter, public :: HELP_COMMAND =  #0102
integer, parameter, public :: HELP_PARTIALKEY =  #0105
integer, parameter, public :: HELP_MULTIKEY =  #0201
integer, parameter, public :: HELP_SETWINPOS =  #0203

! 
!  * Parameter for SystemParametersInfo()
!
integer, parameter, public :: SPI_GETBEEP                = 1
integer, parameter, public :: SPI_SETBEEP                = 2
integer, parameter, public :: SPI_GETMOUSE               = 3
integer, parameter, public :: SPI_SETMOUSE               = 4
integer, parameter, public :: SPI_GETBORDER              = 5
integer, parameter, public :: SPI_SETBORDER              = 6
integer, parameter, public :: SPI_GETKEYBOARDSPEED       = 10
integer, parameter, public :: SPI_SETKEYBOARDSPEED       = 11
integer, parameter, public :: SPI_LANGDRIVER             = 12
integer, parameter, public :: SPI_ICONHORIZONTALSPACING  = 13
integer, parameter, public :: SPI_GETSCREENSAVETIMEOUT   = 14
integer, parameter, public :: SPI_SETSCREENSAVETIMEOUT   = 15
integer, parameter, public :: SPI_GETSCREENSAVEACTIVE    = 16
integer, parameter, public :: SPI_SETSCREENSAVEACTIVE    = 17
integer, parameter, public :: SPI_GETGRIDGRANULARITY     = 18
integer, parameter, public :: SPI_SETGRIDGRANULARITY     = 19
integer, parameter, public :: SPI_SETDESKWALLPAPER       = 20
integer, parameter, public :: SPI_SETDESKPATTERN         = 21
integer, parameter, public :: SPI_GETKEYBOARDDELAY       = 22
integer, parameter, public :: SPI_SETKEYBOARDDELAY       = 23
integer, parameter, public :: SPI_ICONVERTICALSPACING    = 24
integer, parameter, public :: SPI_GETICONTITLEWRAP       = 25
integer, parameter, public :: SPI_SETICONTITLEWRAP       = 26
integer, parameter, public :: SPI_GETMENUDROPALIGNMENT   = 27
integer, parameter, public :: SPI_SETMENUDROPALIGNMENT   = 28
integer, parameter, public :: SPI_SETDOUBLECLKWIDTH      = 29
integer, parameter, public :: SPI_SETDOUBLECLKHEIGHT     = 30
integer, parameter, public :: SPI_GETICONTITLELOGFONT    = 31
integer, parameter, public :: SPI_SETDOUBLECLICKTIME     = 32
integer, parameter, public :: SPI_SETMOUSEBUTTONSWAP     = 33
integer, parameter, public :: SPI_SETICONTITLELOGFONT    = 34
integer, parameter, public :: SPI_GETFASTTASKSWITCH      = 35
integer, parameter, public :: SPI_SETFASTTASKSWITCH      = 36
integer, parameter, public :: SPI_GETFILTERKEYS          =  50
integer, parameter, public :: SPI_SETFILTERKEYS          =  51
integer, parameter, public :: SPI_GETTOGGLEKEYS          =  52
integer, parameter, public :: SPI_SETTOGGLEKEYS          =  53
integer, parameter, public :: SPI_GETMOUSEKEYS           =  54
integer, parameter, public :: SPI_SETMOUSEKEYS           =  55
integer, parameter, public :: SPI_GETSHOWSOUNDS          =  56
integer, parameter, public :: SPI_SETSHOWSOUNDS          =  57
integer, parameter, public :: SPI_GETSTICKYKEYS          =  58
integer, parameter, public :: SPI_SETSTICKYKEYS          =  59
integer, parameter, public :: SPI_GETACCESSTIMEOUT       =  60
integer, parameter, public :: SPI_SETACCESSTIMEOUT       =  61
integer, parameter, public :: SPI_GETSOUNDSENTRY         =  64
integer, parameter, public :: SPI_SETSOUNDSENTRY         =  65

! 
!  * Flags
!  

integer, parameter, public :: SPIF_UPDATEINIFILE =  #0001
integer, parameter, public :: SPIF_SENDWININICHANGE =  #0002



type T_FILTERKEYS
    integer(4) cbSize
    integer(4) dwFlags
    integer(4) iWaitMSec            ! Acceptance Dela
    integer(4) iDelayMSec           ! Delay Until Repea
    integer(4) iRepeatMSec          ! Repeat Rat
    integer(4) iBounceMSec          ! Debounce Tim
end type T_FILTERKEYS

!
!T_FILTERKEYS dwFlags field
!
integer ,parameter , public :: FKF_FILTERKEYSON    = #00000001
integer ,parameter , public :: FKF_AVAILABLE       = #00000002
integer ,parameter , public :: FKF_HOTKEYACTIVE    = #00000004
integer ,parameter , public :: FKF_CONFIRMHOTKEY   = #00000008
integer ,parameter , public :: FKF_HOTKEYSOUND     = #00000010
integer ,parameter , public :: FKF_INDICATOR       = #00000020
integer ,parameter , public :: FKF_CLICKON         = #00000040

type T_STICKYKEYS
    integer cbSize
    integer dwFlags
end type T_STICKYKEYS

! 
! T_STICKYKEYS dwFlags field
! 
integer ,parameter , public :: SKF_STICKYKEYSON    = #00000001
integer ,parameter , public :: SKF_AVAILABLE       = #00000002
integer ,parameter , public :: SKF_HOTKEYACTIVE    = #00000004
integer ,parameter , public :: SKF_CONFIRMHOTKEY   = #00000008
integer ,parameter , public :: SKF_HOTKEYSOUND     = #00000010
integer ,parameter , public :: SKF_INDICATOR       = #00000020
integer ,parameter , public :: SKF_AUDIBLEFEEDBACK = #00000040
integer ,parameter , public :: SKF_TRISTATE        = #00000080
integer ,parameter , public :: SKF_TWOKEYSOFF      = #00000100

type T_MOUSEKEYS
    integer cbSize
    integer dwFlags
    integer iMaxSpeed
    integer iTimeToMaxSpeed
    integer iCtrlSpeed
    integer dwReserved1
    integer dwReserved2
end type T_MOUSEKEYS

! 
! T_MOUSEKEYS dwFlags field
! 
integer ,parameter , public :: MKF_MOUSEKEYSON     = #00000001
integer ,parameter , public :: MKF_AVAILABLE       = #00000002
integer ,parameter , public :: MKF_HOTKEYACTIVE    = #00000004
integer ,parameter , public :: MKF_CONFIRMHOTKEY   = #00000008
integer ,parameter , public :: MKF_HOTKEYSOUND     = #00000010
integer ,parameter , public :: MKF_INDICATOR       = #00000020
integer ,parameter , public :: MKF_MODIFIERS       = #00000040
integer ,parameter , public :: MKF_REPLACENUMBERS  = #00000080

type T_ACCESSTIMEOUT
    integer cbSize
    integer dwFlags
    integer iTimeOutMSec
end type T_ACCESSTIMEOUT 

! 
! T_ACCESSTIMEOUT dwFlags field
! 
integer ,parameter , public :: ATF_TIMEOUTON       = #00000001
integer ,parameter , public :: ATF_ONOFFFEEDBACK   = #00000002

! 
! Define SoundSentry window flash parameters
! 
integer ,parameter , public :: SSWF_NONE     = 0
integer ,parameter , public :: SSWF_TITLE    = 1
integer ,parameter , public :: SSWF_WINDOW   = 2
integer ,parameter , public :: SSWF_DISPLAY  = 3
integer ,parameter , public :: SSWF_CUSTOM   = 4

type T_SOUNDSENTRY
    integer cbSize
    integer dwFlags
    integer iFSTextEffect
    integer iFSTextEffectMSec
    integer iFSTextEffectColorBits
    integer iFSGrafEffect
    integer iFSGrafEffectMSec
    integer iFSGrafEffectColor
    integer iWindowsEffect
    integer iWindowsEffectMSec
    integer lpszWindowsEffectDLL
    integer iWindowsEffectOrdinal
end type  T_SOUNDSENTRY

!
!T_SOUNDSENTRY dwFlags field
!
integer ,parameter , public :: SSF_SOUNDSENTRYON   = #00000001
integer ,parameter , public :: SSF_AVAILABLE       = #00000002
integer ,parameter , public :: SSF_INDICATOR       = #00000004

type T_TOGGLEKEYS
    integer cbSize
    integer dwFlags
end type T_TOGGLEKEYS

!
!T_TOGGLEKEYS dwFlags field
!
integer , parameter , public :: TKF_TOGGLEKEYSON    = #00000001
integer , parameter , public :: TKF_AVAILABLE       = #00000002
integer , parameter , public :: TKF_HOTKEYACTIVE    = #00000004
integer , parameter , public :: TKF_CONFIRMHOTKEY   = #00000008
integer , parameter , public :: TKF_HOTKEYSOUND     = #00000010
integer , parameter , public :: TKF_INDICATOR       = #00000020

! 
! SetLastErrorEx() types.
! 

integer , parameter , public :: SLE_ERROR       = #00000001
integer , parameter , public :: SLE_MINORERROR  = #00000002
integer , parameter , public :: SLE_WARNING     = #00000003


!                       *****WINCON*****
type  T_COORD
    integer(2) X 
    integer(2) Y 
end type  T_COORD

type  T_SMALL_RECT
    integer(2) Left 
    integer(2) Top 
    integer(2) Right 
    integer(2) Bottom 
end type  T_SMALL_RECT

type T_KEY_EVENT_RECORD
   logical(4)  bKeyDown 
   integer(2)  wRepeatCount 
   integer(2)  wVirtualKeyCode 
   integer(2)  wVirtualScanCode 
   character   AsciiChar
   integer(4)  dwControlKeyState;
end type T_KEY_EVENT_RECORD



! 
!  ControlKeyState flags
! 

integer, parameter, public :: RIGHT_ALT_PRESSED    =  #0001 ! // the right alt key is pressed.
integer, parameter, public :: LEFT_ALT_PRESSED     =  #0002 ! // the left alt key is pressed.
integer, parameter, public :: RIGHT_CTRL_PRESSED   =  #0004 ! // the right ctrl key is pressed.
integer, parameter, public :: LEFT_CTRL_PRESSED    =  #0008 ! // the left ctrl key is pressed.
integer, parameter, public :: SHIFT_PRESSED        =  #0010 ! // the shift key is pressed.
integer, parameter, public :: NUMLOCK_ON           =  #0020 ! // the numlock light is on.
integer, parameter, public :: SCROLLLOCK_ON        =  #0040 ! // the scrolllock light is on.
integer, parameter, public :: CAPSLOCK_ON          =  #0080 ! // the capslock light is on.
integer, parameter, public :: ENHANCED_KEY         =  #0100 ! // the key is enhanced.

type  T_MOUSE_EVENT_RECORD
    type (T_COORD)  dwMousePosition 
    integer(4)    dwButtonState 
    integer(4)    dwControlKeyState 
    integer(4)    dwEventFlags 
end type  T_MOUSE_EVENT_RECORD

! 
!  ButtonState flags
! 

integer, parameter, public :: FROM_LEFT_1ST_BUTTON_PRESSED  =  #0001
integer, parameter, public :: RIGHTMOST_BUTTON_PRESSED      =  #0002
integer, parameter, public :: FROM_LEFT_2ND_BUTTON_PRESSED  =  #0004
integer, parameter, public :: FROM_LEFT_3RD_BUTTON_PRESSED  =  #0008
integer, parameter, public :: FROM_LEFT_4TH_BUTTON_PRESSED  =  #0010

! 
!  EventFlags
! 

integer, parameter, public :: MOUSE_MOVED    =  #0001
integer, parameter, public :: DOUBLE_CLICK   =  #0002


type  T_WINDOW_BUFFER_SIZE_RECORD
    type (T_COORD) dwSize 
end type  T_WINDOW_BUFFER_SIZE_RECORD

type  T_MENU_EVENT_RECORD
    integer dwCommandId 
end type  T_MENU_EVENT_RECORD

type  T_FOCUS_EVENT_RECORD
    logical(4) bSetFocus 
end type  T_FOCUS_EVENT_RECORD

type  T_INPUT_RECORD$EVENT
   union
      map
         type(T_KEY_EVENT_RECORD)  KeyEvent
      end map

      map
         type(T_MOUSE_EVENT_RECORD)   MouseEvent
      end map

      map
         type(T_WINDOW_BUFFER_SIZE_RECORD)  WindowBufferSizeEvent
      end map

      map
         type(T_MENU_EVENT_RECORD)    MenuEvent
      end map

      map
         type(T_FOCUS_EVENT_RECORD)   FocusEvent
      end map

   end union
end type  T_INPUT_RECORD$EVENT



type  T_INPUT_RECORD
   integer(2) EventType
   type (T_INPUT_RECORD$EVENT)  Event
end type T_INPUT_RECORD

! 
!   EventType flags:
! 

integer, parameter, public :: KEY_EVENT                 =  #0001 ! // Event contains key event record
integer, parameter, public :: MOUSE_EVENT               =  #0002 ! // Event contains mouse event record
integer, parameter, public :: WINDOW_BUFFER_SIZE_EVENT  =  #0004 ! // Event contains window change event record
integer, parameter, public :: MENU_EVENT                =  #0008 ! // Event contains menu event record
integer, parameter, public :: FOCUS_EVENT               =  #0010 ! // event contains focus change

type  T_CHAR_INFO
   character   AsciiChar
   integer(2)  Attributes
end type T_CHAR_INFO

! 
!  Attributes flags:
! 

integer, parameter, public :: FOREGROUND_BLUE      =  #0001 ! // text color contains blue.
integer, parameter, public :: FOREGROUND_GREEN     =  #0002 ! // text color contains green.
integer, parameter, public :: FOREGROUND_RED       =  #0004 ! // text color contains red.
integer, parameter, public :: FOREGROUND_INTENSITY =  #0008 ! // text color is intensified.
integer, parameter, public :: BACKGROUND_BLUE      =  #0010 ! // background color contains blue.
integer, parameter, public :: BACKGROUND_GREEN     =  #0020 ! // background color contains green.
integer, parameter, public :: BACKGROUND_RED       =  #0040 ! // background color contains red.
integer, parameter, public :: BACKGROUND_INTENSITY =  #0080 ! // background color is intensified.


type  T_CONSOLE_SCREEN_BUFFER_INFO
    type (T_COORD)        dwSize 
    type (T_COORD)        dwCursorPosition 
    integer(2)          wAttributes 
    type (T_SMALL_RECT)   srWindow 
    type (T_COORD)        dwMaximumWindowSize 
end type  T_CONSOLE_SCREEN_BUFFER_INFO

type  T_CONSOLE_CURSOR_INFO
   integer(4)  dwSize 
   logical(4)  bVisible 
end type  T_CONSOLE_CURSOR_INFO
 
! 
!  typedef for ctrl-c handler routines
! 


integer, parameter, public :: CTRL_C_EVENT      = 0
integer, parameter, public :: CTRL_BREAK_EVENT  = 1
integer, parameter, public :: CTRL_CLOSE_EVENT  = 2
!  3 is reserved!
!  4 is reserved!
integer, parameter, public :: CTRL_LOGOFF_EVENT     = 5
integer, parameter, public :: CTRL_SHUTDOWN_EVENT   = 6

! 
!   Input Mode flags:
! 

integer, parameter, public :: ENABLE_PROCESSED_INPUT  =  #0001
integer, parameter, public :: ENABLE_LINE_INPUT       =  #0002
integer, parameter, public :: ENABLE_ECHO_INPUT       =  #0004
integer, parameter, public :: ENABLE_WINDOW_INPUT     =  #0008
integer, parameter, public :: ENABLE_MOUSE_INPUT      =  #0010

! 
!  Output Mode flags:
! 

integer, parameter, public :: ENABLE_PROCESSED_OUTPUT   = #0001
integer, parameter, public :: ENABLE_WRAP_AT_EOL_OUTPUT = #0002

integer, parameter, public :: CONSOLE_TEXTMODE_BUFFER   = 1

!                       ****WINNETWK*****

! 
!  RESOURCE ENUMERATION
! 

integer, parameter, public :: RESOURCE_CONNECTED   =  #00000001
integer, parameter, public :: RESOURCE_GLOBALNET   =  #00000002
integer, parameter, public :: RESOURCE_REMEMBERED  =  #00000003
integer, parameter, public :: RESOURCETYPE_ANY     =  #00000000
integer, parameter, public :: RESOURCETYPE_DISK    =  #00000001
integer, parameter, public :: RESOURCETYPE_PRINT   =  #00000002
integer, parameter, public :: RESOURCETYPE_UNKNOWN =  #FFFFFFFF

integer, parameter, public :: RESOURCEUSAGE_CONNECTABLE  =  #00000001
integer, parameter, public :: RESOURCEUSAGE_CONTAINER    =  #00000002
integer, parameter, public :: RESOURCEUSAGE_RESERVED     =  #80000000

integer, parameter, public :: RESOURCEDISPLAYTYPE_GENERIC   =  #00000000
integer, parameter, public :: RESOURCEDISPLAYTYPE_DOMAIN    =  #00000001
integer, parameter, public :: RESOURCEDISPLAYTYPE_SERVER    =  #00000002
integer, parameter, public :: RESOURCEDISPLAYTYPE_SHARE     =  #00000003
integer, parameter, public :: RESOURCEDISPLAYTYPE_FILE      =  #00000004
integer, parameter, public :: RESOURCEDISPLAYTYPE_GROUP     =  #00000005
integer, parameter, public :: RESOURCEDISPLAYTYPE_TREE      =  #0000000A

integer, parameter, public :: UNIVERSAL_NAME_INFO_LEVEL     = #00000001
integer, parameter, public :: REMOTE_NAME_INFO_LEVEL        = #00000002

type T_UNIVERSAL_NAME_INFO
   integer lpUniversalName
end type T_UNIVERSAL_NAME_INFO

type T_REMOTE_NAME_INFO 
   integer lpUniversalName
   integer lpConnectionName
   integer lpRemainingPath
end type T_REMOTE_NAME_INFO

type T_NETRESOURCE
    integer dwScope 
    integer dwType 
    integer dwDisplayType 
    integer dwUsage 
    integer lpLocalName 
    integer lpRemoteName 
    integer lpComment  
    integer lpProvider 
end type T_NETRESOURCE

 
!   CONNECTIONS
integer, parameter, public :: NETPROPERTY_PERSISTENT       = 1

!dwAddFlags

integer, parameter, public :: CONNECT_UPDATE_PROFILE  =  #00000001
integer, parameter, public :: CONNECT_UPDATE_RECENT   =  #00000002
integer, parameter, public :: CONNECT_TEMPORARY       =  #00000004
integer, parameter, public :: CONNECT_INTERACTIVE     =  #00000008
integer, parameter, public :: CONNECT_PROMPT          =  #00000010
integer, parameter, public :: CONNECT_NEED_DRIVE      =  #00000020


!   STATUS CODES
!   This section is provided for backward compatibility.  Use of the ERROR_*
!   codes is preferred.  The WN_* error codes may not be available in future
!   releases.

!  General   

integer, parameter, public :: WN_SUCCESS        =  ERROR_NO_ERROR
integer, parameter, public :: WN_NOT_SUPPORTED  =  ERROR_NOT_SUPPORTED
integer, parameter, public :: WN_NET_ERROR      =  ERROR_UNEXP_NET_ERR
integer, parameter, public :: WN_MORE_DATA      =  ERROR_MORE_DATA
integer, parameter, public :: WN_BAD_POINTER    =  ERROR_INVALID_ADDRESS
integer, parameter, public :: WN_BAD_VALUE      =  ERROR_INVALID_PARAMETER
integer, parameter, public :: WN_BAD_PASSWORD   =  ERROR_INVALID_PASSWORD
integer, parameter, public :: WN_ACCESS_DENIED  =  ERROR_ACCESS_DENIED
integer, parameter, public :: WN_FUNCTION_BUSY  =  ERROR_BUSY
integer, parameter, public :: WN_WINDOWS_ERROR  =  ERROR_UNEXP_NET_ERR
integer, parameter, public :: WN_BAD_USER       =  ERROR_BAD_USERNAME
integer, parameter, public :: WN_OUT_OF_MEMORY  =  ERROR_NOT_ENOUGH_MEMORY
integer, parameter, public :: WN_NO_NETWORK     =  ERROR_NO_NETWORK
integer, parameter, public :: WN_EXTENDED_ERROR =  ERROR_EXTENDED_ERROR

!  Connection

integer, parameter, public :: WN_NOT_CONNECTED        =  ERROR_NOT_CONNECTED
integer, parameter, public :: WN_OPEN_FILES           =  ERROR_OPEN_FILES
integer, parameter, public :: WN_DEVICE_IN_USE        =  ERROR_DEVICE_IN_USE
integer, parameter, public :: WN_BAD_NETNAME          =  ERROR_BAD_NET_NAME
integer, parameter, public :: WN_BAD_LOCALNAME        =  ERROR_BAD_DEVICE
integer, parameter, public :: WN_ALREADY_CONNECTED    =  ERROR_ALREADY_ASSIGNED
integer, parameter, public :: WN_DEVICE_ERROR         =  ERROR_GEN_FAILURE
integer, parameter, public :: WN_CONNECTION_CLOSED    =  ERROR_CONNECTION_UNAVAIL
integer, parameter, public :: WN_NO_NET_OR_BAD_PATH   =  ERROR_NO_NET_OR_BAD_PATH
integer, parameter, public :: WN_BAD_PROVIDER         =  ERROR_BAD_PROVIDER
integer, parameter, public :: WN_CANNOT_OPEN_PROFILE  =  ERROR_CANNOT_OPEN_PROFILE
integer, parameter, public :: WN_BAD_PROFILE          =  ERROR_BAD_PROFILE
integer, parameter, public :: WN_CANCEL               =  ERROR_CANCELLED 
integer, parameter, public :: WNRETRY                 =  ERROR_RETRY 


!  Enumeration

integer, parameter, public :: WN_BAD_HANDLE           =  ERROR_INVALID_HANDLE
integer, parameter, public :: WN_NO_MORE_ENTRIES      =  ERROR_NO_MORE_ITEMS
integer, parameter, public :: WN_NOT_CONTAINER        =  ERROR_NOT_CONTAINER
integer, parameter, public :: WN_NO_ERROR             =  ERROR_NO_ERROR


!                       *****COMMDLG******

type  T_OPENFILENAME
   integer lStructSize 
   integer hwndOwner 
   integer hInstance 
   integer lpstrFilter 
   integer lpstrCustomFilter 
   integer nMaxCustFilter 
   integer nFilterIndex 
   integer lpstrFile 
   integer nMaxFile 
   integer lpstrFileTitle 
   integer nMaxFileTitle 
   integer lpstrInitialDir 
   integer lpstrTitle 
   integer Flags 
   integer(2)  nFileOffset
   integer(2)  nFileExtension
   integer lpstrDefExt 
   integer lCustData 
   integer lpfnHook 
   integer lpTemplateName 
end type  T_OPENFILENAME

integer, parameter, public :: OFN_READONLY                     = #00000001
integer, parameter, public :: OFN_OVERWRITEPROMPT              = #00000002
integer, parameter, public :: OFN_HIDEREADONLY                 = #00000004
integer, parameter, public :: OFN_NOCHANGEDIR                  = #00000008
integer, parameter, public :: OFN_SHOWHELP                     = #00000010
integer, parameter, public :: OFN_ENABLEHOOK                   = #00000020
integer, parameter, public :: OFN_ENABLETEMPLATE               = #00000040
integer, parameter, public :: OFN_ENABLETEMPLATEHANDLE         = #00000080
integer, parameter, public :: OFN_NOVALIDATE                   = #00000100
integer, parameter, public :: OFN_ALLOWMULTISELECT             = #00000200
integer, parameter, public :: OFN_EXTENSIONDIFFERENT           = #00000400
integer, parameter, public :: OFN_PATHMUSTEXIST                = #00000800
integer, parameter, public :: OFN_FILEMUSTEXIST                = #00001000
integer, parameter, public :: OFN_CREATEPROMPT                 = #00002000
integer, parameter, public :: OFN_SHAREAWARE                   = #00004000
integer, parameter, public :: OFN_NOREADONLYRETURN             = #00008000
integer, parameter, public :: OFN_NOTESTFILECREATE             = #00010000
integer, parameter, public :: OFN_NONETWORKBUTTON              = #00020000
integer, parameter, public :: OFN_NOLONGNAMES                  = #00040000

!  Return values for the registered message sent to the hook function
!  when a sharing violation occurs.  OFN_SHAREFALLTHROUGH allows the
!  filename to be accepted, OFN_SHARENOWARN rejects the name but puts
!  up no warning (returned when the app has already put up a warning
!  message), and OFN_SHAREWARN puts up the default warning message
!  for sharing violations.
! 
!  Note:  Undefined return values map to OFN_SHAREWARN, but are
!         reserved for future use.

integer, parameter, public :: OFN_SHAREFALLTHROUGH  = 2
integer, parameter, public :: OFN_SHARENOWARN       = 1
integer, parameter, public :: OFN_SHAREWARN         = 0


type  T_CHOOSECOLOR
   integer lStructSize 
   integer hwndOwner 
   integer hInstance 
   integer rgbResult 
   integer lpCustColors 
   integer Flags 
   integer lCustData 
   integer lpfnHook 
   integer lpTemplateName 
end type  T_CHOOSECOLOR


integer, parameter, public :: CC_RGBINIT               = #00000001
integer, parameter, public :: CC_FULLOPEN              = #00000002
integer, parameter, public :: CC_PREVENTFULLOPEN       = #00000004
integer, parameter, public :: CC_SHOWHELP              = #00000008
integer, parameter, public :: CC_ENABLEHOOK            = #00000010
integer, parameter, public :: CC_ENABLETEMPLATE        = #00000020
integer, parameter, public :: CC_ENABLETEMPLATEHANDLE  = #00000040


type  T_FINDREPLACE
    integer lStructSize         !  size of this struct 0x20
    integer hwndOwner       !  handle to owner's window
    integer hInstance       !  instance handle of.EXE that
                                !    contains cust. dlg. template
    integer Flags               !  one or more of the FR_??
    integer lpstrFindWhat       !  ptr. to search string
    integer lpstrReplaceWith    !  ptr. to replace string
    integer(2)  wFindWhatLen    !  size of find buffer
    integer(2)  wReplaceWithLen !  size of replace buffer
    integer lCustData       !  data passed to hook fn.
    integer lpfnHook        !  ptr. to hook fn. or NULL
    integer lpTemplateName      !  custom template name
end type  T_FINDREPLACE


integer, parameter, public :: FR_DOWN                   =  #00000001
integer, parameter, public :: FR_WHOLEWORD              =  #00000002
integer, parameter, public :: FR_MATCHCASE              =  #00000004
integer, parameter, public :: FR_FINDNEXT               =  #00000008
integer, parameter, public :: FR_REPLACE                =  #00000010
integer, parameter, public :: FR_REPLACEALL             =  #00000020
integer, parameter, public :: FR_DIALOGTERM             =  #00000040
integer, parameter, public :: FR_SHOWHELP               =  #00000080
integer, parameter, public :: FR_ENABLEHOOK             =  #00000100
integer, parameter, public :: FR_ENABLETEMPLATE         =  #00000200
integer, parameter, public :: FR_NOUPDOWN               =  #00000400
integer, parameter, public :: FR_NOMATCHCASE            =  #00000800
integer, parameter, public :: FR_NOWHOLEWORD            =  #00001000
integer, parameter, public :: FR_ENABLETEMPLATEHANDLE   =  #00002000
integer, parameter, public :: FR_HIDEUPDOWN             =  #00004000
integer, parameter, public :: FR_HIDEMATCHCASE          =  #00008000
integer, parameter, public :: FR_HIDEWHOLEWORD          =  #00010000



type  T_CHOOSEFONT
    integer lStructSize 
    integer hwndOwner           !  caller's window handle
    integer hDC                 !  printer DC/IC or NULL
    integer lpLogFont           !  ptr. to a T_LOGFONT struct
    integer iPointSize          !  10 * size in points of selected font
    integer Flags               !  enum. type flags
    integer rgbColors           !  returned text color
    integer lCustData           !  data passed to hook fn.
    integer lpfnHook            !  ptr. to hook function
    integer lpTemplateName      !  custom template name
    integer hInstance           !  instance handle of.EXE that
                                !    contains cust. dlg. template
    integer lpszStyle           !  return the style field here
                                !  must be LF_FACESIZE or bigger
    integer(2)  nFontType       !  same value reported to the EnumFonts
                                !    call back with the extra FONTTYPE_
                                !    bits added
    integer(2)  MISSING_ALIGNMENT
    integer nSizeMin            !  minimum pt size allowed &
    integer nSizeMax            !  max pt size allowed if
                                !    CF_LIMITSIZE is used
end type  T_CHOOSEFONT

integer, parameter, public :: CF_SCREENFONTS            =  #00000001
integer, parameter, public :: CF_PRINTERFONTS           =  #00000002
integer, parameter, public :: CF_SHOWHELP               =  #00000004
integer, parameter, public :: CF_ENABLEHOOK             =  #00000008
integer, parameter, public :: CF_ENABLETEMPLATE         =  #00000010
integer, parameter, public :: CF_ENABLETEMPLATEHANDLE   =  #00000020
integer, parameter, public :: CF_INITTOLOGFONTSTRUCT    =  #00000040
integer, parameter, public :: CF_USESTYLE               =  #00000080
integer, parameter, public :: CF_EFFECTS                =  #00000100
integer, parameter, public :: CF_APPLY                  =  #00000200
integer, parameter, public :: CF_ANSIONLY               =  #00000400
integer, parameter, public :: CF_NOVECTORFONTS          =  #00000800
integer, parameter, public :: CF_NOOEMFONTS             =  CF_NOVECTORFONTS
integer, parameter, public :: CF_NOSIMULATIONS          =  #00001000
integer, parameter, public :: CF_LIMITSIZE              =  #00002000
integer, parameter, public :: CF_FIXEDPITCHONLY         =  #00004000
integer, parameter, public :: CF_WYSIWYG                =  #00008000 ! must also have CF_SCREENFONTS & CF_PRINTERFONTS
integer, parameter, public :: CF_FORCEFONTEXIST         =  #00010000
integer, parameter, public :: CF_SCALABLEONLY           =  #00020000
integer, parameter, public :: CF_TTONLY                 =  #00040000
integer, parameter, public :: CF_NOFACESEL              =  #00080000
integer, parameter, public :: CF_NOSTYLESEL             =  #00100000
integer, parameter, public :: CF_NOSIZESEL              =  #00200000

!  these are extra nFontType bits that are added to what is returned to the
!  EnumFonts callback routine

integer, parameter, public :: SIMULATED_FONTTYPE        =  #8000
integer, parameter, public :: PRINTER_FONTTYPE          =  #4000
integer, parameter, public :: SCREEN_FONTTYPE           =  #2000
integer, parameter, public :: BOLD_FONTTYPE             =  #0100
integer, parameter, public :: ITALIC_FONTTYPE           =  #0200
integer, parameter, public :: REGULAR_FONTTYPE          =  #0400

integer, parameter, public :: WM_CHOOSEFONT_GETLOGFONT  = (WM_USER + 1)

!  strings used to obtain unique window message for communication
!  between dialog and caller

character*27, parameter, public :: LBSELCHSTRING    = "commdlg_LBSelChangedNotify"C
character*23, parameter, public :: SHAREVISTRING    = "commdlg_ShareViolation"C
character*19, parameter, public :: FILEOKSTRING     = "commdlg_FileNameOK"C
character*16, parameter, public :: COLOROKSTRING    = "commdlg_ColorOK"C
character*20, parameter, public :: SETRGBSTRING     = "commdlg_SetRGBColor"C
character*13, parameter, public :: HELPMSGSTRING    = "commdlg_help"C
character*20, parameter, public :: FINDMSGSTRING    = "commdlg_FindReplace"C

!  HIWORD values for lParam of commdlg_LBSelChangeNotify message
integer, parameter, public :: CD_LBSELNOITEMS   = -1
integer, parameter, public :: CD_LBSELCHANGE    = 0
integer, parameter, public :: CD_LBSELSUB       = 1
integer, parameter, public :: CD_LBSELADD       = 2


type  T_PRINTDLG
   integer lStructSize 
   integer hwndOwner 
   integer hDevMode 
   integer hDevNames 
   integer hDC 
   integer Flags 
   integer(2)  nFromPage 
   integer(2)  nToPage  
   integer(2)  nMinPage  
   integer(2)  nMaxPage  
   integer(2)  nCopies  
   integer hInstance 
   integer lCustData 
   integer lpfnPrintHook 
   integer lpfnSetupHook 
   integer lpPrintTemplateName 
   integer lpSetupTemplateName 
   integer hPrintTemplate 
   integer hSetupTemplate 
end type  T_PRINTDLG

integer, parameter, public :: PD_ALLPAGES                   = #00000000
integer, parameter, public :: PD_SELECTION                  = #00000001
integer, parameter, public :: PD_PAGENUMS                   = #00000002
integer, parameter, public :: PD_NOSELECTION                = #00000004
integer, parameter, public :: PD_NOPAGENUMS                 = #00000008
integer, parameter, public :: PD_COLLATE                    = #00000010
integer, parameter, public :: PD_PRINTTOFILE                = #00000020
integer, parameter, public :: PD_PRINTSETUP                 = #00000040
integer, parameter, public :: PD_NOWARNING                  = #00000080
integer, parameter, public :: PD_RETURNDC                   = #00000100
integer, parameter, public :: PD_RETURNIC                   = #00000200
integer, parameter, public :: PD_RETURNDEFAULT              = #00000400
integer, parameter, public :: PD_SHOWHELP                   = #00000800
integer, parameter, public :: PD_ENABLEPRINTHOOK            = #00001000
integer, parameter, public :: PD_ENABLESETUPHOOK            = #00002000
integer, parameter, public :: PD_ENABLEPRINTTEMPLATE        = #00004000
integer, parameter, public :: PD_ENABLESETUPTEMPLATE        = #00008000
integer, parameter, public :: PD_ENABLEPRINTTEMPLATEHANDLE  = #00010000
integer, parameter, public :: PD_ENABLESETUPTEMPLATEHANDLE  = #00020000
integer, parameter, public :: PD_USEDEVMODECOPIES           = #00040000
integer, parameter, public :: PD_DISABLEPRINTTOFILE         = #00080000
integer, parameter, public :: PD_HIDEPRINTTOFILE            = #00100000
integer, parameter, public :: PD_NONETWORKBUTTON            = #00200000

type  T_DEVNAMES
   integer(2)  wDriverOffset  
   integer(2)  wDeviceOffset  
   integer(2)  wOutputOffset  
   integer(2)  wDefault  
end type  T_DEVNAMES

integer, parameter, public :: DN_DEFAULTPRN =  #0001


!                       ******WINREG******


!  Requested Key access mask type.
!  Type definitions.
! 

! 
!  Reserved Key Handles.
! 
integer, parameter, public :: HKEY_CLASSES_ROOT           =  #80000000 
integer, parameter, public :: HKEY_CURRENT_USER           =  #80000001 
integer, parameter, public :: HKEY_LOCAL_MACHINE          =  #80000002 
integer, parameter, public :: HKEY_USERS                  =  #80000003 
integer, parameter, public :: HKEY_PERFORMANCE_DATA       =  #80000004 

! 
!  Default values for parameters that do not exist in the Win 3.1
!  compatible APIs.
! 
integer, parameter, public :: WIN31_CLASS = 0


!                       *****CDERR*****

integer , parameter, public :: CDERR_DIALOGFAILURE   =  #FFFF

integer , parameter, public :: CDERR_GENERALCODES    =  #0000
integer , parameter, public :: CDERR_STRUCTSIZE      =  #0001
integer , parameter, public :: CDERR_INITIALIZATION  =  #0002
integer , parameter, public :: CDERR_NOTEMPLATE      =  #0003
integer , parameter, public :: CDERR_NOHINSTANCE     =  #0004
integer , parameter, public :: CDERR_LOADSTRFAILURE  =  #0005
integer , parameter, public :: CDERR_FINDRESFAILURE  =  #0006
integer , parameter, public :: CDERR_LOADRESFAILURE  =  #0007
integer , parameter, public :: CDERR_LOCKRESFAILURE  =  #0008
integer , parameter, public :: CDERR_MEMALLOCFAILURE =  #0009
integer , parameter, public :: CDERR_MEMLOCKFAILURE  =  #000A
integer , parameter, public :: CDERR_NOHOOK          =  #000B
integer , parameter, public :: CDERR_REGISTERMSGFAIL =  #000C

integer , parameter, public :: PDERR_PRINTERCODES    =  #1000
integer , parameter, public :: PDERR_SETUPFAILURE    =  #1001
integer , parameter, public :: PDERR_PARSEFAILURE    =  #1002
integer , parameter, public :: PDERR_RETDEFFAILURE   =  #1003
integer , parameter, public :: PDERR_LOADDRVFAILURE  =  #1004
integer , parameter, public :: PDERR_GETDEVMODEFAIL  =  #1005
integer , parameter, public :: PDERR_INITFAILURE     =  #1006
integer , parameter, public :: PDERR_NODEVICES       =  #1007
integer , parameter, public :: PDERR_NODEFAULTPRN    =  #1008
integer , parameter, public :: PDERR_DNDMMISMATCH    =  #1009
integer , parameter, public :: PDERR_CREATEICFAILURE =  #100A
integer , parameter, public :: PDERR_PRINTERNOTFOUND =  #100B
integer , parameter, public :: PDERR_DEFAULTDIFFERENT=  #100C

integer , parameter, public :: CFERR_CHOOSEFONTCODES =  #2000
integer , parameter, public :: CFERR_NOFONTS         =  #2001
integer , parameter, public :: CFERR_MAXLESSTHANMIN  =  #2002

integer , parameter, public :: FNERR_FILENAMECODES   =  #3000
integer , parameter, public :: FNERR_SUBCLASSFAILURE =  #3001
integer , parameter, public :: FNERR_INVALIDFILENAME =  #3002
integer , parameter, public :: FNERR_BUFFERTOOSMALL  =  #3003

integer , parameter, public :: FRERR_FINDREPLACECODES=  #4000
integer , parameter, public :: FRERR_BUFFERLENGTHZERO=  #4001

integer , parameter, public :: CCERR_CHOOSECOLORCODES=  #5000

!                       ******DDE*******

!   DDE window messages   

integer, parameter, public :: WM_DDE_FIRST      =  #03E0
integer, parameter, public :: WM_DDE_INITIATE   = (WM_DDE_FIRST)
integer, parameter, public :: WM_DDE_TERMINATE  = (WM_DDE_FIRST+1)
integer, parameter, public :: WM_DDE_ADVISE     = (WM_DDE_FIRST+2)
integer, parameter, public :: WM_DDE_UNADVISE   = (WM_DDE_FIRST+3)
integer, parameter, public :: WM_DDE_ACK        = (WM_DDE_FIRST+4)
integer, parameter, public :: WM_DDE_DATA       = (WM_DDE_FIRST+5)
integer, parameter, public :: WM_DDE_REQUEST    = (WM_DDE_FIRST+6)
integer, parameter, public :: WM_DDE_POKE       = (WM_DDE_FIRST+7)
integer, parameter, public :: WM_DDE_EXECUTE    = (WM_DDE_FIRST+8)
integer, parameter, public :: WM_DDE_LAST       = (WM_DDE_FIRST+8)

! ----------------------------------------------------------------------------
! |       T_DDEACK structure
! |
! | Structure of wStatus (LOWORD(lParam)) in WM_DDE_ACK message
! |       sent in response to a WM_DDE_DATA, WM_DDE_REQUEST, WM_DDE_POKE,
! |       WM_DDE_ADVISE, or WM_DDE_UNADVISE message.
! |
! ----------------------------------------------------------------------------
!


type  T_DDEACK
   integer(2)  Bits
! *************************************************************************
! These bits can be accessed using functions defined in BITSFUNC.F90
!       unsigned  short  bAppReturnCode :8 
!       reserved :6 
!       fBusy :1 
!       fAck :1 ;
! *************************************************************************
end type  T_DDEACK


! ----------------------------------------------------------------------------
! |       T_DDEADVISE structure
! |
! | WM_DDE_ADVISE parameter structure for hOptions (LOWORD(lParam))
! |
! ----------------------------------------------------------------------------
!


type  T_DDEADVISE
   integer(2)  Bits
! *************************************************************************
! These bits can be accessed using functions defined in BITSFUNC.F90
!        unsigned  short  reserved :14 
!        fDeferUpd :1 
!         fAckReq :1 ;
! *************************************************************************
    integer*2 cfFormat 
end type  T_DDEADVISE


! ----------------------------------------------------------------------------
! |       T_DDEDATA structure
! |
! |       WM_DDE_DATA parameter structure for hData (LOWORD(lParam)).
! |       The actual size of this structure depends on the size of
! |       the Value array.
! |
! ----------------------------------------------------------------------------
!


type  T_DDEDATA
   integer(2)  Bits
! *************************************************************************
! These bits can be accessed using functions defined in BITSFUNC.F90
!       unsigned  short  unused :12 
!       fResponse :1 
!       fRelease :1 
!       reserved :1 
!       fAckReq :1 ;
! *************************************************************************
    integer*2 cfFormat 
    BYTE  Value (1 )
end type  T_DDEDATA


! ----------------------------------------------------------------------------
! | T_DDEPOKE structure
! |
! | WM_DDE_POKE parameter structure for hData (LOWORD(lParam)).
! |       The actual size of this structure depends on the size of
! |       the Value array.
! |
! ----------------------------------------------------------------------------
!


type  T_DDEPOKE
   integer(2)  Bits
! *************************************************************************
! These bits can be accessed using functions defined in BITSFUNC.F90
!     nused :13    !  Earlier versions of DDE.H incorrectly 12 unused bits.                         
!      fRelease :1 
!      fReserved :2 ;
! *************************************************************************
    integer*2 cfFormat 
    BYTE  Value (1 )
       !  This member was named rgb[1] in previous   
       !  versions of DDE.H                          
end type  T_DDEPOKE

! ----------------------------------------------------------------------------
! The following typedef's were used in previous versions of the Windows SDK.
! They are still valid.  The above typedef's define exactly the same structures
! as those below.  The above typedef names are recommended, however, as they
! are more meaningful.
! 
! Note that the T_DDEPOKE structure typedef'ed in earlier versions of DDE.H did
! not correctly define the bit positions.
! ----------------------------------------------------------------------------
!


type  T_DDELN
   integer(2)  Bits
! *************************************************************************
! These bits can be accessed using functions defined in BITSFUNC.F90
!       unused :13 
!       fRelease :1 
!       fDeferUpd :1 
!         fAckReq :1 ;
! *************************************************************************
    integer*2 cfFormat 
end type  T_DDELN

type  T_DDEUP
   integer(2)  Bits
! *************************************************************************
! These bits can be accessed using functions defined in BITSFUNC.F90
!                 unused :12 
!                 fAck :1 
!                 fRelease :1 
!                 fReserved :1 
!                 fAckReq :1 ;
! *************************************************************************
    integer*2 cfFormat 
    BYTE  rgb (1 )

end type  T_DDEUP

!                       ******DDEML******

!   Public types  

!The following structure is for use with XTYP_WILDCONNECT processing.   

type  T_HSZPAIR
    integer hszSvc 
    integer hszTopic 
end type  T_HSZPAIR

!  The following structure is used by DdeConnect() and DdeConnectList() and
!    by XTYP_CONNECT and XTYP_WILDCONNECT callbacks. 
!
type  T_CONVCONTEXT
    integer cb                                  !  set to sizeof(T_CONVCONTEXT)   
    integer wFlags                              !  none currently defined.   
    integer wCountryID                          !  country code for topic/item strings used.   
    integer iCodePage                           !  codepage used for topic/item strings.   
    integer dwLangID                            !  language ID for topic/item strings.   
    integer dwSecurity                          !  Private security code.   
    type (T_SECURITY_QUALITY_OF_SERVICE) qos    !  client side's quality of service   
end type  T_CONVCONTEXT

!   The following structure is used by DdeQueryConvInfo():   
type  T_CONVINFO
    integer cb                      !  sizeof(T_CONVINFO)    
    integer hUser                   !  user specified field    
    integer hConvPartner            !  hConv on other end or 0 if non-ddemgr partner    
    integer hszSvcPartner           !  app name of partner if obtainable    
    integer hszServiceReq           !  AppName requested for connection    
    integer hszTopic                !  Topic name for conversation    
    integer hszItem                 !  transaction item name or NULL if quiescent    
    integer wFmt                    !  transaction format or NULL if quiescent    
    integer wType                   !  XTYP_ for current transaction    
    integer wStatus                 !  ST_ constant for current conversation    
    integer wConvst                 !  XST_ constant for current transaction    
    integer wLastError              !  last transaction error.    
    integer hConvList               !  parent hConvList if this conversation is in a list   
    type (T_CONVCONTEXT) ConvCtxt   !  conversation context   
    integer hwnd                    !  window handle for this conversation   
    integer hwndPartner             !  partner window handle for this conversation   
end type  T_CONVINFO

!    ** conversation states (usState) *****/

integer, parameter, public :: XST_NULL           = 0  !  quiescent states   
integer, parameter, public :: XST_INCOMPLETE     = 1
integer, parameter, public :: XST_CONNECTED      = 2
integer, parameter, public :: XST_INIT1          = 3  !  mid-initiation states   
integer, parameter, public :: XST_INIT2          = 4
integer, parameter, public :: XST_REQSENT        = 5  !  active conversation states   
integer, parameter, public :: XST_DATARCVD       = 6
integer, parameter, public :: XST_POKESENT       = 7
integer, parameter, public :: XST_POKEACKRCVD    = 8
integer, parameter, public :: XST_EXECSENT       = 9
integer, parameter, public :: XST_EXECACKRCVD    = 10
integer, parameter, public :: XST_ADVSENT        = 11
integer, parameter, public :: XST_UNADVSENT      = 12
integer, parameter, public :: XST_ADVACKRCVD     = 13
integer, parameter, public :: XST_UNADVACKRCVD   = 14
integer, parameter, public :: XST_ADVDATASENT    = 15
integer, parameter, public :: XST_ADVDATAACKRCVD = 16

!   used in LOWORD(dwData1) of XTYP_ADVREQ callbacks...   
integer, parameter, public :: CADV_LATEACK =  #FFFF

!    ** conversation status bits (fsStatus) *****/

integer, parameter, public :: ST_CONNECTED   =  #0001
integer, parameter, public :: ST_ADVISE      =  #0002
integer, parameter, public :: ST_ISLOCAL     =  #0004
integer, parameter, public :: ST_BLOCKED     =  #0008
integer, parameter, public :: ST_CLIENT      =  #0010
integer, parameter, public :: ST_TERMINATED  =  #0020
integer, parameter, public :: ST_INLIST      =  #0040
integer, parameter, public :: ST_BLOCKNEXT   =  #0080
integer, parameter, public :: ST_ISSELF      =  #0100


!   DDE constants for wStatus field   

integer, parameter, public :: DDE_FACK          =  #8000
integer, parameter, public :: DDE_FBUSY         =  #4000
integer, parameter, public :: DDE_FDEFERUPD     =  #4000
integer, parameter, public :: DDE_FACKREQ       =  #8000
integer, parameter, public :: DDE_FRELEASE      =  #2000
integer, parameter, public :: DDE_FREQUESTED    =  #1000
integer, parameter, public :: DDE_FAPPSTATUS    =  #00ff
integer, parameter, public :: DDE_FNOTPROCESSED =  #0000

! **************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: DDE_FACKRESERVED = ( NOT (IOR (DDE_FACK,  &
!                                                 IOR(DDE_FBUSY, DDE_FAPPSTATUS))))
!integer, parameter, public :: DDE_FADVRESERVED = ( NOT (IOR (DDE_FACKREQ,DDE_FDEFERUPD)))
!integer, parameter, public :: DDE_FADTRESERVED = ( NOT (IOR (DDE_FACKREQ,  &
!                                                 IOR(DDE_FRELEASE, DDE_FREQUESTED))))
!integer, parameter, public :: DDE_FPOKRESERVED = ( NOT (DDE_FRELEASE))
! **************************************************************************

!    ** message filter hook types *****/

integer, parameter, public :: MSGF_DDEMGR =  #8001

!    ** codepage constants ****/

integer, parameter, public :: CP_WINANSI     = 1004    !  default codepage for windows & old DDE convs.   
integer, parameter, public :: CP_WINUNICODE  = 1200

!    ** transaction types *****/

integer, parameter, public :: XTYPF_NOBLOCK         =  #0002  !  CBR_BLOCK will not work   
integer, parameter, public :: XTYPF_NODATA          =  #0004  !  DDE_FDEFERUPD   
integer, parameter, public :: XTYPF_ACKREQ          =  #0008  !  DDE_FACKREQ   

integer, parameter, public :: XCLASS_MASK           =  #FC00
integer, parameter, public :: XCLASS_BOOL           =  #1000
integer, parameter, public :: XCLASS_DATA           =  #2000
integer, parameter, public :: XCLASS_FLAGS          =  #4000
integer, parameter, public :: XCLASS_NOTIFICATION   =  #8000

! **************************************************************************
! These have been moved to STMT.F90
!
!integer, parameter, public :: XTYP_ERROR =  IOR(#0000, IOR(XCLASS_NOTIFICATION,XTYPF_NOBLOCK))
!integer, parameter, public :: XTYP_ADVDATA = IOR(#0010 , XCLASS_FLAGS)
!integer, parameter, public :: XTYP_ADVREQ =  IOR(#0020, IOR(XCLASS_DATA,XTYPF_NOBLOCK))
!integer, parameter, public :: XTYP_ADVSTART =  IOR(#0030, XCLASS_BOOL)
!integer, parameter, public :: XTYP_ADVSTOP =  IOR(#0040,XCLASS_NOTIFICATION)
!integer, parameter, public :: XTYP_EXECUTE =  IOR(#0050, XCLASS_FLAGS)
!integer, parameter, public :: XTYP_CONNECT =  IOR(#0060, IOR(XCLASS_BOOL, XTYPF_NOBLOCK))
!integer, parameter, public :: XTYP_CONNECT_CONFIRM =  IOR(#0070 , IOR( XCLASS_NOTIFICATION, XTYPF_NOBLOCK))
!integer, parameter, public :: XTYP_XACT_COMPLETE = IOR(#0080 ,XCLASS_NOTIFICATION  )
!integer, parameter, public :: XTYP_POKE =  IOR(#0090 , XCLASS_FLAGS )
!integer, parameter, public :: XTYP_REGISTER =  IOR(#00A0, IOR(XCLASS_NOTIFICATION , XTYPF_NOBLOCK))
!integer, parameter, public :: XTYP_REQUEST =  IOR(#00B0, XCLASS_DATA )
!integer, parameter, public :: XTYP_DISCONNECT =  IOR(#00C0, IOR(XCLASS_NOTIFICATION , XTYPF_NOBLOCK))
!integer, parameter, public :: XTYP_UNREGISTER =  IOR(#00D0, IOR(XCLASS_NOTIFICATION , XTYPF_NOBLOCK))
!integer, parameter, public :: XTYP_WILDCONNECT =  IOR(#00E0, IOR(XCLASS_DATA, XTYPF_NOBLOCK))
! **************************************************************************

integer, parameter, public :: XTYP_MASK     = #00F0
integer, parameter, public :: XTYP_SHIFT    = 4  !  shift to turn XTYP_ into an index   

!    ** Timeout constants *****/


integer, parameter, public :: TIMEOUT_ASYNC =  #FFFFFFFF

!    ** Transaction ID constants *****/

integer, parameter, public :: QID_SYNC =  #FFFFFFFF

!    *** public strings used in DDE ******/

character*7,  parameter, public :: SZDDESYS_TOPIC         = "System"C
character*7,  parameter, public :: SZDDESYS_ITEM_TOPICS   = "Topics"C
character*9,  parameter, public :: SZDDESYS_ITEM_SYSITEMS = "SysItems"C
character*14, parameter, public :: SZDDESYS_ITEM_RTNMSG   = "ReturnMessage"C
character*7,  parameter, public :: SZDDESYS_ITEM_STATUS   = "Status"C
character*8,  parameter, public :: SZDDESYS_ITEM_FORMATS  = "Formats"C
character*5,  parameter, public :: SZDDESYS_ITEM_HELP     = "Help"C
character*14, parameter, public :: SZDDE_ITEM_ITEMLIST    = "TopicItemList"C

integer, parameter, public :: CBR_BLOCK =  #FFFFFFFF

!  * Callback filter flags for use with standard apps.

integer, parameter, public :: CBF_FAIL_SELFCONNECTIONS          =  #00001000
integer, parameter, public :: CBF_FAIL_CONNECTIONS              =  #00002000
integer, parameter, public :: CBF_FAIL_ADVISES                  =  #00004000
integer, parameter, public :: CBF_FAIL_EXECUTES                 =  #00008000
integer, parameter, public :: CBF_FAIL_POKES                    =  #00010000
integer, parameter, public :: CBF_FAIL_REQUESTS                 =  #00020000
integer, parameter, public :: CBF_FAIL_ALLSVRXACTIONS           =  #0003f000

integer, parameter, public :: CBF_SKIP_CONNECT_CONFIRMS         =  #00040000
integer, parameter, public :: CBF_SKIP_REGISTRATIONS            =  #00080000
integer, parameter, public :: CBF_SKIP_UNREGISTRATIONS          =  #00100000
integer, parameter, public :: CBF_SKIP_DISCONNECTS              =  #00200000
integer, parameter, public :: CBF_SKIP_ALLNOTIFICATIONS         =  #003c0000

!  * Application command flags

integer, parameter, public :: APPCMD_CLIENTONLY     =  #00000010
integer, parameter, public :: APPCMD_FILTERINITS    =  #00000020
integer, parameter, public :: APPCMD_MASK           =  #00000FF0

!  * Application classification flags

integer, parameter, public :: APPCLASS_STANDARD =  #00000000
integer, parameter, public :: APPCLASS_MASK     =  #0000000F

integer, parameter, public :: EC_ENABLEALL      = 0
integer, parameter, public :: EC_ENABLEONE      = ST_BLOCKNEXT
integer, parameter, public :: EC_DISABLE        = ST_BLOCKED
integer, parameter, public :: EC_QUERYWAITING   = 2

integer, parameter, public :: DMLERR_NO_ERROR            =  0       !  must be 0   
integer, parameter, public :: DMLERR_FIRST               =  #4000
integer, parameter, public :: DMLERR_ADVACKTIMEOUT       =  #4000
integer, parameter, public :: DMLERR_BUSY                =  #4001
integer, parameter, public :: DMLERR_DATAACKTIMEOUT      =  #4002
integer, parameter, public :: DMLERR_DLL_NOT_INITIALIZED =  #4003
integer, parameter, public :: DMLERR_DLL_USAGE           =  #4004
integer, parameter, public :: DMLERR_EXECACKTIMEOUT      =  #4005
integer, parameter, public :: DMLERR_INVALIDPARAMETER    =  #4006
integer, parameter, public :: DMLERR_LOW_MEMORY          =  #4007
integer, parameter, public :: DMLERR_MEMORY_ERROR        =  #4008
integer, parameter, public :: DMLERR_NOTPROCESSED        =  #4009
integer, parameter, public :: DMLERR_NO_CONV_ESTABLISHED =  #400a
integer, parameter, public :: DMLERR_POKEACKTIMEOUT      =  #400b
integer, parameter, public :: DMLERR_POSTMSG_FAILED      =  #400c
integer, parameter, public :: DMLERR_REENTRANCY          =  #400d
integer, parameter, public :: DMLERR_SERVER_DIED         =  #400e
integer, parameter, public :: DMLERR_SYS_ERROR           =  #400f
integer, parameter, public :: DMLERR_UNADVACKTIMEOUT     =  #4010
integer, parameter, public :: DMLERR_UNFOUND_QUEUE_ID    =  #4011

integer, parameter, public :: DMLERR_LAST                =  #4011


!  * DDEML public debugging header file info

type  T_DDEML_MSG_HOOK_DATA     !  new for NT
    integer uiLo              !  unpacked lo and hi parts of lParam
    integer uiHi 
    integer cbData         !  amount of data in message, if any. May be > than 32 bytes.
    integer Data (8 )         !  data peeking by DDESPY is limited to 32 bytes.
end type  T_DDEML_MSG_HOOK_DATA


type  T_MONMSGSTRUCT
    integer cb 
    integer hwndTo 
    integer dwTime 
    integer hTask 
    integer wMsg 
    integer wParam 
    integer lParam 
    type (T_DDEML_MSG_HOOK_DATA) dmhd         !  new for NT
end type  T_MONMSGSTRUCT

type  T_MONCBSTRUCT
    integer cb 
    integer dwTime 
    integer hTask 
    integer dwRet 
    integer wType 
    integer wFmt 
    integer hConv 
    integer hsz1 
    integer hsz2 
    integer hData 
    integer dwData1 
    integer dwData2 
    type (T_CONVCONTEXT) cc    !  new for NT for XTYP_CONNECT callbacks
    integer cbData           !  new for NT for data peeking
    integer Data (8 )        !  new for NT for data peeking
end type  T_MONCBSTRUCT

type  T_MONHSZSTRUCT
    integer    cb 
    logical(4) fsAction     !  MH_ value   
    integer    dwTime 
    integer    hsz 
    integer    hTask 
    character*1 str (1 )
end type  T_MONHSZSTRUCT

integer, parameter, public :: MH_CREATE   = 1
integer, parameter, public :: MH_KEEP     = 2
integer, parameter, public :: MH_DELETE   = 3
integer, parameter, public :: MH_CLEANUP  = 4

type  T_MONERRSTRUCT
    integer cb 
    integer wLastError 
    integer dwTime 
    integer hTask 
end type  T_MONERRSTRUCT

type  T_MONLINKSTRUCT
    integer    cb 
    integer    dwTime 
    integer    hTask 
    logical(4) fEstablished 
    logical(4) fNoData 
    integer hszSvc 
    integer hszTopic 
    integer hszItem 
    integer wFmt 
    logical(4) fServer 
    integer hConvServer 
    integer hConvClient 
end type  T_MONLINKSTRUCT

type  T_MONCONVSTRUCT
    integer    cb 
    logical(4) fConnect 
    integer    dwTime 
    integer    hTask 
    integer    hszSvc 
    integer    hszTopic 
    integer    hConvClient         !  Globally unique value != apps local hConv
    integer    hConvServer         !  Globally unique value != apps local hConv
end type  T_MONCONVSTRUCT

integer, parameter, public :: MAX_MONITORS      = 4
integer, parameter, public :: APPCLASS_MONITOR  =  #00000001

! **************************************************************************
! This gas been moved to STMT.F90
!
!integer, parameter, public :: XTYP_MONITOR =  IOR(#00F0, IOR(XCLASS_NOTIFICATION, XTYPF_NOBLOCK))
! **************************************************************************

!  * Callback filter flags for use with MONITOR apps - 0 implies no monitor
!  * callbacks.

integer, parameter, public :: MF_HSZ_INFO    =  #01000000
integer, parameter, public :: MF_SENDMSGS    =  #02000000
integer, parameter, public :: MF_POSTMSGS    =  #04000000
integer, parameter, public :: MF_CALLBACKS   =  #08000000
integer, parameter, public :: MF_ERRORS      =  #10000000
integer, parameter, public :: MF_LINKS       =  #20000000
integer, parameter, public :: MF_CONV        =  #40000000
integer, parameter, public :: MF_MASK        =  #FF000000
integer, parameter, public :: HDATA_APPOWNED =  #0001

!                       *****DLGS*******

integer, parameter, public :: ctlFirst  =  #0400
integer, parameter, public :: ctlLast   =  #04ff
!   Push buttons   
integer, parameter, public :: psh1      =  #0400
integer, parameter, public :: psh2      =  #0401
integer, parameter, public :: psh3      =  #0402
integer, parameter, public :: psh4      =  #0403
integer, parameter, public :: psh5      =  #0404
integer, parameter, public :: psh6      =  #0405
integer, parameter, public :: psh7      =  #0406
integer, parameter, public :: psh8      =  #0407
integer, parameter, public :: psh9      =  #0408
integer, parameter, public :: psh10     =  #0409
integer, parameter, public :: psh11     =  #040a
integer, parameter, public :: psh12     =  #040b
integer, parameter, public :: psh13     =  #040c
integer, parameter, public :: psh14     =  #040d
integer, parameter, public :: psh15     =  #040e
integer, parameter, public :: pshHelp   = psh15
integer, parameter, public :: psh16     =  #040f
!   Checkboxes   
integer, parameter, public :: chx1  =  #0410
integer, parameter, public :: chx2  =  #0411
integer, parameter, public :: chx3  =  #0412
integer, parameter, public :: chx4  =  #0413
integer, parameter, public :: chx5  =  #0414
integer, parameter, public :: chx6  =  #0415
integer, parameter, public :: chx7  =  #0416
integer, parameter, public :: chx8  =  #0417
integer, parameter, public :: chx9  =  #0418
integer, parameter, public :: chx10 =  #0419
integer, parameter, public :: chx11 =  #041a
integer, parameter, public :: chx12 =  #041b
integer, parameter, public :: chx13 =  #041c
integer, parameter, public :: chx14 =  #041d
integer, parameter, public :: chx15 =  #041e
integer, parameter, public :: chx16 =  #041d
    !   Radio buttons   
integer, parameter, public :: rad1  =  #0420
integer, parameter, public :: rad2  =  #0421
integer, parameter, public :: rad3  =  #0422
integer, parameter, public :: rad4  =  #0423
integer, parameter, public :: rad5  =  #0424
integer, parameter, public :: rad6  =  #0425
integer, parameter, public :: rad7  =  #0426
integer, parameter, public :: rad8  =  #0427
integer, parameter, public :: rad9  =  #0428
integer, parameter, public :: rad10 =  #0429
integer, parameter, public :: rad11 =  #042a
integer, parameter, public :: rad12 =  #042b
integer, parameter, public :: rad13 =  #042c
integer, parameter, public :: rad14 =  #042d
integer, parameter, public :: rad15 =  #042e
integer, parameter, public :: rad16 =  #042f
    !   Groups, frames, rectangles, and icons   
integer, parameter, public :: grp1 =  #0430
integer, parameter, public :: grp2 =  #0431
integer, parameter, public :: grp3 =  #0432
integer, parameter, public :: grp4 =  #0433
integer, parameter, public :: frm1 =  #0434
integer, parameter, public :: frm2 =  #0435
integer, parameter, public :: frm3 =  #0436
integer, parameter, public :: frm4 =  #0437
integer, parameter, public :: rct1 =  #0438
integer, parameter, public :: rct2 =  #0439
integer, parameter, public :: rct3 =  #043a
integer, parameter, public :: rct4 =  #043b
integer, parameter, public :: ico1 =  #043c
integer, parameter, public :: ico2 =  #043d
integer, parameter, public :: ico3 =  #043e
integer, parameter, public :: ico4 =  #043f
    !   Static text   
integer, parameter, public :: stc1  =  #0440
integer, parameter, public :: stc2  =  #0441
integer, parameter, public :: stc3  =  #0442
integer, parameter, public :: stc4  =  #0443
integer, parameter, public :: stc5  =  #0444
integer, parameter, public :: stc6  =  #0445
integer, parameter, public :: stc7  =  #0446
integer, parameter, public :: stc8  =  #0447
integer, parameter, public :: stc9  =  #0448
integer, parameter, public :: stc10 =  #0449
integer, parameter, public :: stc11 =  #044a
integer, parameter, public :: stc12 =  #044b
integer, parameter, public :: stc13 =  #044c
integer, parameter, public :: stc14 =  #044d
integer, parameter, public :: stc15 =  #044e
integer, parameter, public :: stc16 =  #044f
integer, parameter, public :: stc17 =  #0450
integer, parameter, public :: stc18 =  #0451
integer, parameter, public :: stc19 =  #0452
integer, parameter, public :: stc20 =  #0453
integer, parameter, public :: stc21 =  #0454
integer, parameter, public :: stc22 =  #0455
integer, parameter, public :: stc23 =  #0456
integer, parameter, public :: stc24 =  #0457
integer, parameter, public :: stc25 =  #0458
integer, parameter, public :: stc26 =  #0459
integer, parameter, public :: stc27 =  #045a
integer, parameter, public :: stc28 =  #045b
integer, parameter, public :: stc29 =  #045c
integer, parameter, public :: stc30 =  #045d
integer, parameter, public :: stc31 =  #045e
integer, parameter, public :: stc32 =  #045f
    !   Listboxes   
integer, parameter, public :: lst1  =  #0460
integer, parameter, public :: lst2  =  #0461
integer, parameter, public :: lst3  =  #0462
integer, parameter, public :: lst4  =  #0463
integer, parameter, public :: lst5  =  #0464
integer, parameter, public :: lst6  =  #0465
integer, parameter, public :: lst7  =  #0466
integer, parameter, public :: lst8  =  #0467
integer, parameter, public :: lst9  =  #0468
integer, parameter, public :: lst10 =  #0469
integer, parameter, public :: lst11 =  #046a
integer, parameter, public :: lst12 =  #046b
integer, parameter, public :: lst13 =  #046c
integer, parameter, public :: lst14 =  #046d
integer, parameter, public :: lst15 =  #046e
integer, parameter, public :: lst16 =  #046f
    !   Combo boxes   
integer, parameter, public :: cmb1  =  #0470
integer, parameter, public :: cmb2  =  #0471
integer, parameter, public :: cmb3  =  #0472
integer, parameter, public :: cmb4  =  #0473
integer, parameter, public :: cmb5  =  #0474
integer, parameter, public :: cmb6  =  #0475
integer, parameter, public :: cmb7  =  #0476
integer, parameter, public :: cmb8  =  #0477
integer, parameter, public :: cmb9  =  #0478
integer, parameter, public :: cmb10 =  #0479
integer, parameter, public :: cmb11 =  #047a
integer, parameter, public :: cmb12 =  #047b
integer, parameter, public :: cmb13 =  #047c
integer, parameter, public :: cmb14 =  #047d
integer, parameter, public :: cmb15 =  #047e
integer, parameter, public :: cmb16 =  #047f
    !   Edit controls   
integer, parameter, public :: edt1  =  #0480
integer, parameter, public :: edt2  =  #0481
integer, parameter, public :: edt3  =  #0482
integer, parameter, public :: edt4  =  #0483
integer, parameter, public :: edt5  =  #0484
integer, parameter, public :: edt6  =  #0485
integer, parameter, public :: edt7  =  #0486
integer, parameter, public :: edt8  =  #0487
integer, parameter, public :: edt9  =  #0488
integer, parameter, public :: edt10 =  #0489
integer, parameter, public :: edt11 =  #048a
integer, parameter, public :: edt12 =  #048b
integer, parameter, public :: edt13 =  #048c
integer, parameter, public :: edt14 =  #048d
integer, parameter, public :: edt15 =  #048e
integer, parameter, public :: edt16 =  #048f
    !   Scroll bars   
integer, parameter, public :: scr1  =  #0490
integer, parameter, public :: scr2  =  #0491
integer, parameter, public :: scr3  =  #0492
integer, parameter, public :: scr4  =  #0493
integer, parameter, public :: scr5  =  #0494
integer, parameter, public :: scr6  =  #0495
integer, parameter, public :: scr7  =  #0496
integer, parameter, public :: scr8  =  #0497

integer, parameter, public :: FILEOPENORD       = 1536
integer, parameter, public :: MULTIFILEOPENORD  = 1537
integer, parameter, public :: PRINTDLGORD       = 1538
integer, parameter, public :: PRNSETUPDLGORD    = 1539
integer, parameter, public :: FINDDLGORD        = 1540
integer, parameter, public :: REPLACEDLGORD     = 1541
integer, parameter, public :: FONTDLGORD        = 1542
integer, parameter, public :: FORMATDLGORD31    = 1543
integer, parameter, public :: FORMATDLGORD30    = 1544

!  ----Types------------------------------------------------------------------  

type T_CRGB            ! RGB Color 
    BYTE    bRed
    BYTE    bGreen
    BYTE    bBlue
    BYTE    bExtra
end type T_CRGB           


!                       ****LZEXPAND****

!
! Error Return Codes
!

integer , parameter, public :: LZERROR_BADINHANDLE  = (-1)!* invalid input handle */
integer , parameter, public :: LZERROR_BADOUTHANDLE = (-2)!* invalid output handle */
integer , parameter, public :: LZERROR_READ         = (-3)!* corrupt compressed file format */
integer , parameter, public :: LZERROR_WRITE        = (-4)!* out of space for output file */
integer , parameter, public :: LZERROR_GLOBALLOC    = (-5)!* insufficient memory for LZFile struct */
integer , parameter, public :: LZERROR_GLOBLOCK     = (-6)!* bad global handle */
integer , parameter, public :: LZERROR_BADVALUE     = (-7)!* input parameter out of acceptable range*/
integer , parameter, public :: LZERROR_UNKNOWNALG   = (-8)!* compression algorithm not recognized */


!                       *******NB30******

!  ***************************************************************
!  *                                                             *
!  *              Data structure templates                       *
!  *                                                             *
!  ***************************************************************

integer, parameter, public :: NCBNAMSZ = 16    !  absolute length of a net name                  
integer, parameter, public :: MAX_LANA = 72    !  lana's in range 0 to MAX_LANA                  

!  * Network Control Block
type  T_NCB
    character ncb_command               !  command code                     
    character ncb_retcode               !  return code                      
    character ncb_lsn                   !  local session number             
    character ncb_num                   !  number of our network name       
    integer ncb_buffer                  !  address of message buffer        
    integer*2 ncb_length                !  size of message buffer           
    character ncb_callname (NCBNAMSZ )  !  blank-padded name of remote      
    character ncb_name (NCBNAMSZ )      !  our blank-padded netname         
    character ncb_rto                   !  rcv timeout/retry count          
    character ncb_sto                   !  send timeout/sys timeout         
    integer ncb_post                    !  POST routine address          
    character ncb_lana_num              !  lana (adapter) number            
    character ncb_cmd_cplt              !  0xff => commmand pending         
    character ncb_reserve (10 )         !  reserved, used by BIOS           
    integer ncb_event                   !  HANDLE to Win32 event which      
                                        !  will be set to the signalled     
                                        !  state when an ASYNCH command     
                                        !  completes                        
end type  T_NCB

!  *  Structure returned to the T_NCB command NCBASTAT is T_ADAPTER_STATUS followed
!  *  by an array of T_NAME_BUFFER structures.

type  T_ADAPTER_STATUS
    character adapter_address (6)
    character rev_major 
    character reserved0 
    character adapter_type 
    character rev_minor 
    integer*2 duration 
    integer*2 frmr_recv 
    integer*2 frmr_xmit 
    integer*2 iframe_recv_err 
    integer*2 xmit_aborts 
    integer xmit_success 
    integer recv_success 
    integer*2 iframe_xmit_err 
    integer*2 recv_buff_unavail 
    integer*2 t1_timeouts 
    integer*2 ti_timeouts 
    integer   reserved1 
    integer*2 free_ncbs 
    integer*2 max_cfg_ncbs 
    integer*2 max_ncbs 
    integer*2 xmit_buf_unavail 
    integer*2 max_dgram_size 
    integer*2 pending_sess 
    integer*2 max_cfg_sess 
    integer*2 max_sess 
    integer*2 max_sess_pkt_size 
    integer*2 name_count 
end type  T_ADAPTER_STATUS

type  T_NAME_BUFFER
    character name (NCBNAMSZ )
    character name_num 
    character name_flags 
end type  T_NAME_BUFFER

!   values for name_flags bits.

integer, parameter, public :: NAME_FLAGS_MASK   = #87
integer, parameter, public :: GROUP_NAME        = #80
integer, parameter, public :: UNIQUE_NAME       = #00
integer, parameter, public :: REGISTERING       = #00
integer, parameter, public :: REGISTERED        = #04
integer, parameter, public :: DEREGISTERED      = #05
integer, parameter, public :: DUPLICATE         = #06
integer, parameter, public :: DUPLICATE_DEREG   = #07

!  Structure returned to the T_NCB command NCBSSTAT is T_SESSION_HEADER followed
!  by an array of T_SESSION_BUFFER structures. If the NCB_NAME starts with an
!  asterisk then an array of these structures is returned containing the
!  status for all names.

type  T_SESSION_HEADER
    character sess_name 
    character num_sess 
    character rcv_dg_outstanding 
    character rcv_any_outstanding 
end type  T_SESSION_HEADER

type  T_SESSION_BUFFER
    character lsn 
    character state 
    character local_name (NCBNAMSZ )
    character remote_name (NCBNAMSZ )
    character rcvs_outstanding 
    character sends_outstanding 
end type  T_SESSION_BUFFER

!   Values for state

integer, parameter, public :: LISTEN_OUTSTANDING    = #01
integer, parameter, public :: CALL_PENDING          = #02
integer, parameter, public :: SESSION_ESTABLISHED   = #03
integer, parameter, public :: HANGUP_PENDING        = #04
integer, parameter, public :: HANGUP_COMPLETE       = #05
integer, parameter, public :: SESSION_ABORTED       = #06

! 
!  *  Structure returned to the T_NCB command NCBENUM.
!  *
!  *  On a system containing lana's 0, 2 and 3, a structure with
!  *  length =3, lana[0]=0, lana[1]=2 and lana[2]=3 will be returned.

type  T_LANA_ENUM
    character length           !   Number of valid entries in lana[]
    character lana (MAX_LANA )
end type  T_LANA_ENUM

!  *  Structure returned to the T_NCB command NCBFINDNAME is T_FIND_NAME_HEADER followed
!  *  by an array of FIND_NAME_BUFFER structures.

type  T_FIND_NAME_HEADER
    integer*2 node_count 
    character reserved 
    character unique_group 
end type  T_FIND_NAME_HEADER

type  FIND_NAME_BUFFER
    character length 
    character access_control 
    character frame_control 
    character destination_addr (6 )
    character source_addr (6 )
    character routing_info (18 )
end type  FIND_NAME_BUFFER

!  *  Structure provided with NCBACTION. The purpose of NCBACTION is to provide
!  *  transport specific extensions to netbios.

type  T_ACTION_HEADER
    integer transport_id 
    integer*2 action_code 
    integer*2 reserved 
end type  T_ACTION_HEADER

!   Values for transport_id

character*5, parameter, public :: ALL_TRANSPORTS = "M\0\0\0"
character*5, parameter, public :: MS_NBF         = "MNBF"


! ***************************************************************
! *                                                             *
! *              Special values and constants                   *
! *                                                             *
! ***************************************************************


!  *      T_NCB Command codes

integer, parameter, public :: NCBCALL       = #10            !  T_NCB CALL                             
integer, parameter, public :: NCBLISTEN     = #11            !  T_NCB LISTEN                           
integer, parameter, public :: NCBHANGUP     = #12            !  T_NCB HANG UP                          
integer, parameter, public :: NCBSEND       = #14            !  T_NCB SEND                             
integer, parameter, public :: NCBRECV       = #15            !  T_NCB RECEIVE                          
integer, parameter, public :: NCBRECVANY    = #16            !  T_NCB RECEIVE ANY                      
integer, parameter, public :: NCBCHAINSEND  = #17            !  T_NCB CHAIN SEND                       
integer, parameter, public :: NCBDGSEND     = #20            !  T_NCB SEND DATAGRAM                    
integer, parameter, public :: NCBDGRECV     = #21            !  T_NCB RECEIVE DATAGRAM                 
integer, parameter, public :: NCBDGSENDBC   = #22            !  T_NCB SEND BROADCAST DATAGRAM          
integer, parameter, public :: NCBDGRECVBC   = #23            !  T_NCB RECEIVE BROADCAST DATAGRAM       
integer, parameter, public :: NCBADDNAME    = #30            !  T_NCB ADD NAME                         
integer, parameter, public :: NCBDELNAME    = #31            !  T_NCB DELETE NAME                      
integer, parameter, public :: NCBRESET      = #32            !  T_NCB RESET                            
integer, parameter, public :: NCBASTAT      = #33            !  T_NCB ADAPTER STATUS                   
integer, parameter, public :: NCBSSTAT      = #34            !  T_NCB SESSION STATUS                   
integer, parameter, public :: NCBCANCEL     = #35            !  T_NCB CANCEL                           
integer, parameter, public :: NCBADDGRNAME  = #36            !  T_NCB ADD GROUP NAME                   
integer, parameter, public :: NCBENUM       = #37            !  T_NCB ENUMERATE LANA NUMBERS           
integer, parameter, public :: NCBUNLINK     = #70            !  T_NCB UNLINK                           
integer, parameter, public :: NCBSENDNA     = #71            !  T_NCB SEND NO ACK                      
integer, parameter, public :: NCBCHAINSENDNA= #72            !  T_NCB CHAIN SEND NO ACK                
integer, parameter, public :: NCBLANSTALERT = #73            !  T_NCB LAN STATUS ALERT                 
integer, parameter, public :: NCBACTION     = #77            !  T_NCB ACTION                           
integer, parameter, public :: NCBFINDNAME   = #78            !  T_NCB FIND NAME                        
integer, parameter, public :: NCBTRACE      = #79            !  T_NCB TRACE                            


integer, parameter, public :: ASYNCH =       #80            !  high bit set == asynchronous         

!  *      T_NCB Return codes

integer, parameter, public :: NRC_GOODRET =  #00    !  good return                                  
                                !   also returned when ASYNCH request accepted   
integer, parameter, public :: NRC_BUFLEN     =   #01    !  illegal buffer length                        
integer, parameter, public :: NRC_ILLCMD     =   #03    !  illegal command                              
integer, parameter, public :: NRC_CMDTMO     =   #05    !  command timed out                            
integer, parameter, public :: NRC_INCOMP     =   #06    !  message incomplete, issue another command    
integer, parameter, public :: NRC_BADDR      =   #07    !  illegal buffer address                       
integer, parameter, public :: NRC_SNUMOUT    =   #08    !  session number out of range                  
integer, parameter, public :: NRC_NORES      =   #09    !  no resource available                        
integer, parameter, public :: NRC_SCLOSED    =   #0a    !  session closed                               
integer, parameter, public :: NRC_CMDCAN     =   #0b    !  command cancelled                            
integer, parameter, public :: NRC_DUPNAME    =   #0d    !  duplicate name                               
integer, parameter, public :: NRC_NAMTFUL    =   #0e    !  name table full                              
integer, parameter, public :: NRC_ACTSES     =   #0f    !  no deletions, name has active sessions       
integer, parameter, public :: NRC_LOCTFUL    =   #11    !  local session table full                     
integer, parameter, public :: NRC_REMTFUL    =   #12    !  remote session table full                    
integer, parameter, public :: NRC_ILLNN      =   #13    !  illegal name number                          
integer, parameter, public :: NRC_NOCALL     =   #14    !  no callname                                  
integer, parameter, public :: NRC_NOWILD     =   #15    !  cannot put * in NCB_NAME                     
integer, parameter, public :: NRC_INUSE      =   #16    !  name in use on remote adapter                
integer, parameter, public :: NRC_NAMERR     =   #17    !  name deleted                                 
integer, parameter, public :: NRC_SABORT     =   #18    !  session ended abnormally                     
integer, parameter, public :: NRC_NAMCONF    =   #19    !  name conflict detected                       
integer, parameter, public :: NRC_IFBUSY     =   #21    !  interface busy, IRET before retrying         
integer, parameter, public :: NRC_TOOMANY    =   #22    !  too many commands outstanding, retry later   
integer, parameter, public :: NRC_BRIDGE     =   #23    !  ncb_lana_num field invalid                   
integer, parameter, public :: NRC_CANOCCR    =   #24    !  command completed while cancel occurring     
integer, parameter, public :: NRC_CANCEL     =   #26    !  command not valid to cancel                  
integer, parameter, public :: NRC_DUPENV     =   #30    !  name defined by anther local process         
integer, parameter, public :: NRC_ENVNOTDEF  =   #34    !  environment undefined. RESET required        
integer, parameter, public :: NRC_OSRESNOTAV =   #35    !  required OS resources exhausted              
integer, parameter, public :: NRC_MAXAPPS    =   #36    !  max number of applications exceeded          
integer, parameter, public :: NRC_NOSAPS     =   #37    !  no saps available for netbios                
integer, parameter, public :: NRC_NORESOURCES=   #38    !  requested resources are not available        
integer, parameter, public :: NRC_INVADDRESS =   #39    !  invalid ncb address or length > segment      
integer, parameter, public :: NRC_INVDDID    =   #3B    !  invalid T_NCB DDID                             
integer, parameter, public :: NRC_LOCKFAIL   =   #3C    !  lock of user area failed                     
integer, parameter, public :: NRC_OPENERR    =   #3f    !  NETBIOS not loaded                           
integer, parameter, public :: NRC_SYSTEM     =   #40    !  system error                                 

integer, parameter, public :: NRC_PENDING =  #ff    !  asynchronous command is not yet finished     


!                       ****SCRNSAVE****

integer, parameter, public :: MAXFILELEN        = 13
integer, parameter, public :: TITLEBARNAMELEN   = 40
integer, parameter, public :: APPNAMEBUFFERLEN  = 40
integer, parameter, public :: BUFFLEN           = 255

!   The following globals are defined in scrnsave.lib   
integer     hMainInstance
integer     hMainWindow
character   szName(TITLEBARNAMELEN)
character   szAppName(APPNAMEBUFFERLEN)
character   szIniFile(MAXFILELEN)
character   szScreenSaver(22)
character   szHelpFile(MAXFILELEN)
character   szNoHelpMemory(BUFFLEN)
integer     MyHelpMessage

!  MANDATORY string required in .RC file 
!  This string should contain a less than 25 char name/description of the
!  screen saver.  This string is what will be seen by the user in the Control
!  Panel's Desktop applet screen saver listbox.

integer, parameter, public :: IDS_DESCRIPTION = 1

!  Icon resource ID.
!  *
!  * This should be the first icon used and must have this resource number.
!  * This is needed as the first icon in the file will be grabbed
!  
!

integer, parameter, public :: ID_APP                = 100
integer, parameter, public :: DLG_SCRNSAVECONFIGURE = 2003

integer, parameter, public :: idsIsPassword     = 1000
integer, parameter, public :: idsIniFile        = 1001
integer, parameter, public :: idsScreenSaver    = 1002
integer, parameter, public :: idsPassword       = 1003
integer, parameter, public :: idsDifferentPW    = 1004
integer, parameter, public :: idsChangePW       = 1005
integer, parameter, public :: idsBadOldPW       = 1006
integer, parameter, public :: idsAppName        = 1007
integer, parameter, public :: idsNoHelpMemory   = 1008
integer, parameter, public :: idsHelpFile       = 1009


!                       ****SHELLAPI*****

!   error values for ShellExecute() beyond the regular WinExec() codes   
integer, parameter, public :: SE_ERR_SHARE              = 26
integer, parameter, public :: SE_ERR_ASSOCINCOMPLETE    = 27
integer, parameter, public :: SE_ERR_DDETIMEOUT         = 28
integer, parameter, public :: SE_ERR_DDEFAIL            = 29
integer, parameter, public :: SE_ERR_DDEBUSY            = 30
integer, parameter, public :: SE_ERR_NOASSOC            = 31



!                                   *****WINVER******
!/* ----- Symbols ----- */
integer*4   ,parameter ,public :: VS_VERSION_INFO         =  1
integer*4   ,parameter, public :: VS_USER_DEFINED         =  100 

!/* ----- VS_VERSION.dwFileFlags ----- */
integer*4   ,parameter, public :: VS_FFI_SIGNATURE        =  #FEEF04BD 
integer*4   ,parameter, public :: VS_FFI_STRUCVERSION     =  #00010000 
integer*4   ,parameter, public :: VS_FFI_FILEFLAGSMASK    =  #0000003F 

!/* ----- VS_VERSION.dwFileFlags ----- */
integer*4   ,parameter, public :: VS_FF_DEBUG             =  #00000001 
integer*4   ,parameter, public :: VS_FF_PRERELEASE        =  #00000002 
integer*4   ,parameter, public :: VS_FF_PATCHED           =  #00000004 
integer*4   ,parameter, public :: VS_FF_PRIVATEBUILD      =  #00000008 
integer*4   ,parameter, public :: VS_FF_INFOINFERRED      =  #00000010 
integer*4   ,parameter, public :: VS_FF_SPECIALBUILD      =  #00000020 

!/* ----- VS_VERSION.dwFileOS ----- */
integer*4   ,parameter, public :: VOS_UNKNOWN             =  #00000000 
integer*4   ,parameter, public :: VOS_DOS                 =  #00010000 
integer*4   ,parameter, public :: VOS_OS216               =  #00020000 
integer*4   ,parameter, public :: VOS_OS232               =  #00030000 
integer*4   ,parameter, public :: VOS_NT                  =  #00040000 

integer*4   ,parameter, public :: VOS__BASE               =  #00000000 
integer*4   ,parameter, public :: VOS__WINDOWS16          =  #00000001 
integer*4   ,parameter, public :: VOS__PM16               =  #00000002 
integer*4   ,parameter, public :: VOS__PM32               =  #00000003 
integer*4   ,parameter, public :: VOS__WINDOWS32          =  #00000004 

integer*4   ,parameter, public :: VOS_DOS_WINDOWS16       =  #00010001 
integer*4   ,parameter, public :: VOS_DOS_WINDOWS32       =  #00010004 
integer*4   ,parameter, public :: VOS_OS216_PM16          =  #00020002 
integer*4   ,parameter, public :: VOS_OS232_PM32          =  #00030003 
integer*4   ,parameter, public :: VOS_NT_WINDOWS32        =  #00040004 

!/* ----- VS_VERSION.dwFileType ----- */
integer*4   ,parameter, public :: VFT_UNKNOWN             =  #00000000 
integer*4   ,parameter, public :: VFT_APP                 =  #00000001 
integer*4   ,parameter, public :: VFT_DLL                 =  #00000002 
integer*4   ,parameter, public :: VFT_DRV                 =  #00000003 
integer*4   ,parameter, public :: VFT_FONT                =  #00000004 
integer*4   ,parameter, public :: VFT_VXD                 =  #00000005 
integer*4   ,parameter, public :: VFT_STATIC_LIB          =  #00000007 

!/* ----- VS_VERSION.dwFileSubtype for VFT_WINDOWS_DRV ----- */
integer*4   ,parameter, public :: VFT2_UNKNOWN            =  #00000000 
integer*4   ,parameter, public :: VFT2_DRV_PRINTER        =  #00000001 
integer*4   ,parameter, public :: VFT2_DRV_KEYBOARD       =  #00000002 
integer*4   ,parameter, public :: VFT2_DRV_LANGUAGE       =  #00000003 
integer*4   ,parameter, public :: VFT2_DRV_DISPLAY        =  #00000004 
integer*4   ,parameter, public :: VFT2_DRV_MOUSE          =  #00000005 
integer*4   ,parameter, public :: VFT2_DRV_NETWORK        =  #00000006 
integer*4   ,parameter, public :: VFT2_DRV_SYSTEM         =  #00000007 
integer*4   ,parameter, public :: VFT2_DRV_INSTALLABLE    =  #00000008 
integer*4   ,parameter, public :: VFT2_DRV_SOUND          =  #00000009 
integer*4   ,parameter, public :: VFT2_DRV_COMM           =  #0000000A 

!/* ----- VS_VERSION.dwFileSubtype for VFT_WINDOWS_FONT ----- */
integer*4   ,parameter, public :: VFT2_FONT_RASTER        =  #00000001 
integer*4   ,parameter, public :: VFT2_FONT_VECTOR        =  #00000002 
integer*4   ,parameter, public :: VFT2_FONT_TRUETYPE      =  #00000003 

!/* ----- VerFindFile() flags ----- */
integer*4   ,parameter, public :: VFFF_ISSHAREDFILE       =  #0001 

integer*4   ,parameter, public :: VFF_CURNEDEST           =  #0001 
integer*4   ,parameter, public :: VFF_FILEINUSE           =  #0002 
integer*4   ,parameter, public :: VFF_BUFFTOOSMALL        =  #0004 

!/* ----- VerInstallFile() flags ----- */
integer*4   ,parameter, public :: VIFF_FORCEINSTALL       =  #0001 
integer*4   ,parameter, public :: VIFF_DONTDELETEOLD      =  #0002 

integer*4   ,parameter, public :: VIF_TEMPFILE            =  #00000001 
integer*4   ,parameter, public :: VIF_MISMATCH            =  #00000002 
integer*4   ,parameter, public :: VIF_SRCOLD              =  #00000004 

integer*4   ,parameter, public :: VIF_DIFFLANG            =  #00000008 
integer*4   ,parameter, public :: VIF_DIFFCODEPG          =  #00000010 
integer*4   ,parameter, public :: VIF_DIFFTYPE            =  #00000020 

integer*4   ,parameter, public :: VIF_WRITEPROT           =  #00000040 
integer*4   ,parameter, public :: VIF_FILEINUSE           =  #00000080 
integer*4   ,parameter, public :: VIF_OUTOFSPACE          =  #00000100 
integer*4   ,parameter, public :: VIF_ACCESSVIOLATION     =  #00000200 
integer*4   ,parameter, public :: VIF_SHARINGVIOLATION    =  #00000400 
integer*4   ,parameter, public :: VIF_CANNOTCREATE        =  #00000800 
integer*4   ,parameter, public :: VIF_CANNOTDELETE        =  #00001000 
integer*4   ,parameter, public :: VIF_CANNOTRENAME        =  #00002000 
integer*4   ,parameter, public :: VIF_CANNOTDELETECUR     =  #00004000 
integer*4   ,parameter, public :: VIF_OUTOFMEMORY         =  #00008000 

integer*4   ,parameter, public :: VIF_CANNOTREADSRC       =  #00010000 
integer*4   ,parameter, public :: VIF_CANNOTREADDST       =  #00020000 

integer*4   ,parameter, public :: VIF_BUFFTOOSMALL        =  #00040000 


!/* ----- Types and structures ----- */

type T_VS_FIXEDFILEINFO
   integer*4   dwSignature            !/* e.g. #feef04bd */
   integer*4   dwStrucVersion         !/* e.g. #00000042 = "0.42" */
   integer*4   dwFileVersionMS        !/* e.g. #00030075 = "3.75" */
   integer*4   dwFileVersionLS        !/* e.g. #00000031 = "0.31" */
   integer*4   dwProductVersionMS     !/* e.g. #00030010 = "3.10" */
   integer*4   dwProductVersionLS     !/* e.g. #00000031 = "0.31" */
   integer*4   dwFileFlagsMask        !/* = #3F for version "0.42" */
   integer*4   dwFileFlags            !/* e.g. VFF_DEBUG | VFF_PRERELEASE */
   integer*4   dwFileOS               !/* e.g. VOS_DOS_WINDOWS16 */
   integer*4   dwFileType             !/* e.g. VFT_DRIVER */
   integer*4   dwFileSubtype          !/* e.g. VFT2_DRV_KEYBOARD */
   integer*4   dwFileDateMS           !/* e.g. 0 */
   integer*4   dwFileDateLS           !/* e.g. 0 */
end type T_VS_FIXEDFILEINFO


!                                   *****WINIOCTL*****

!  begin_ntddk begin_nthal
! 
!  Define the various device type values.  Note that values used by Microsoft
!  Corporation are in the range 0-32767, and 32768-65535 are reserved for use
!  by customers.
! 

integer, parameter, public :: FILE_DEVICE_BEEP                  =  #00000001
integer, parameter, public :: FILE_DEVICE_CD_ROM                =  #00000002
integer, parameter, public :: FILE_DEVICE_CD_ROM_FILE_SYSTEM    =  #00000003
integer, parameter, public :: FILE_DEVICE_CONTROLLER            =  #00000004
integer, parameter, public :: FILE_DEVICE_DATALINK              =  #00000005
integer, parameter, public :: FILE_DEVICE_DFS                   =  #00000006
integer, parameter, public :: FILE_DEVICE_DISK                  =  #00000007
integer, parameter, public :: FILE_DEVICE_DISK_FILE_SYSTEM      =  #00000008
integer, parameter, public :: FILE_DEVICE_FILE_SYSTEM           =  #00000009
integer, parameter, public :: FILE_DEVICE_INPORT_PORT           =  #0000000a
integer, parameter, public :: FILE_DEVICE_KEYBOARD              =  #0000000b
integer, parameter, public :: FILE_DEVICE_MAILSLOT              =  #0000000c
integer, parameter, public :: FILE_DEVICE_MIDI_IN               =  #0000000d
integer, parameter, public :: FILE_DEVICE_MIDI_OUT              =  #0000000e
integer, parameter, public :: FILE_DEVICE_MOUSE                 =  #0000000f
integer, parameter, public :: FILE_DEVICE_MULTI_UNC_PROVIDER    =  #00000010
integer, parameter, public :: FILE_DEVICE_NAMED_PIPE            =  #00000011
integer, parameter, public :: FILE_DEVICE_NETWORK               =  #00000012
integer, parameter, public :: FILE_DEVICE_NETWORK_BROWSER       =  #00000013
integer, parameter, public :: FILE_DEVICE_NETWORK_FILE_SYSTEM   =  #00000014
integer, parameter, public :: FILE_DEVICE_NULL                  =  #00000015
integer, parameter, public :: FILE_DEVICE_PARALLEL_PORT         =  #00000016
integer, parameter, public :: FILE_DEVICE_PHYSICAL_NETCARD      =  #00000017
integer, parameter, public :: FILE_DEVICE_PRINTER               =  #00000018
integer, parameter, public :: FILE_DEVICE_SCANNER               =  #00000019
integer, parameter, public :: FILE_DEVICE_SERIAL_MOUSE_PORT     =  #0000001a
integer, parameter, public :: FILE_DEVICE_SERIAL_PORT           =  #0000001b
integer, parameter, public :: FILE_DEVICE_SCREEN                =  #0000001c
integer, parameter, public :: FILE_DEVICE_SOUND                 =  #0000001d
integer, parameter, public :: FILE_DEVICE_STREAMS               =  #0000001e
integer, parameter, public :: FILE_DEVICE_TAPE                  =  #0000001f
integer, parameter, public :: FILE_DEVICE_TAPE_FILE_SYSTEM      =  #00000020
integer, parameter, public :: FILE_DEVICE_TRANSPORT             =  #00000021
integer, parameter, public :: FILE_DEVICE_UNKNOWN               =  #00000022
integer, parameter, public :: FILE_DEVICE_VIDEO                 =  #00000023
integer, parameter, public :: FILE_DEVICE_VIRTUAL_DISK          =  #00000024
integer, parameter, public :: FILE_DEVICE_WAVE_IN               =  #00000025
integer, parameter, public :: FILE_DEVICE_WAVE_OUT              =  #00000026
integer, parameter, public :: FILE_DEVICE_8042_PORT             =  #00000027
integer, parameter, public :: FILE_DEVICE_NETWORK_REDIRECTOR    =  #00000028

! 
!  Define the method codes for how buffers are passed for I/O and FS controls
! 

integer, parameter, public :: METHOD_BUFFERED   = 0
integer, parameter, public :: METHOD_IN_DIRECT  = 1
integer, parameter, public :: METHOD_OUT_DIRECT = 2
integer, parameter, public :: METHOD_NEITHER    = 3

! 
!  Define the access check value for any access
! 
! 
!  The FILE_READ_ACCESS and FILE_WRITE_ACCESS constants are also defined in
!  ntioapi.h as FILE_READ_DATA and FILE_WRITE_DATA. The values for these
!  constants *MUST* always be in sync.
! 


integer, parameter, public :: FILE_ANY_ACCESS   = 0
integer, parameter, public :: FILE_READ_ACCESS  = #0001     !  file  pipe
integer, parameter, public :: FILE_WRITE_ACCESS = #0002    !  file  pipe

!  end_ntddk end_nthal


integer, parameter, public :: PARTITION_ENTRY_UNUSED    =  #00      !// Entry unused
integer, parameter, public :: PARTITION_FAT_12          =  #01      !// 12-bit FAT entries
integer, parameter, public :: PARTITION_XENIX_1         =  #02     ! // Xenix
integer, parameter, public :: PARTITION_XENIX_2         =  #03     ! // Xenix
integer, parameter, public :: PARTITION_FAT_16          =  #04      !// 16-bit FAT entries
integer, parameter, public :: PARTITION_EXTENDED        =  #05    !  // Extended partition entry
integer, parameter, public :: PARTITION_HUGE            =  #06      !// Huge partition MS-DOS V4
integer, parameter, public :: PARTITION_IFS             =  #07      !// IFS Partition
integer, parameter, public :: PARTITION_UNIX            =  #63     ! // Unix

integer, parameter, public :: VALID_NTFT =  #C0      !// NTFT uses high order bits


! 
!  The high bit of the partition type code indicates that a partition
!  is part of an NTFT mirror or striped array.
! 

integer, parameter, public :: PARTITION_NTFT =  #80   !  // NTFT partition

! 
!  Define the media types supported by the driver.
! 


integer, parameter, public :: Unknown               = 0     !  Format is unknown
integer, parameter, public :: F5_1Pt2_512           = 1     !  5.25", 1.2MB,  512 bytes/sector
integer, parameter, public :: F3_1Pt44_512          = 2     !  3.5",  1.44MB, 512 bytes/sector
integer, parameter, public :: F3_2Pt88_512          = 3     !  3.5",  2.88MB, 512 bytes/sector
integer, parameter, public :: F3_20Pt8_512          = 4     !  3.5",  20.8MB, 512 bytes/sector
integer, parameter, public :: F3_720_512            = 5     !  3.5",  720KB,  512 bytes/sector
integer, parameter, public :: F5_360_512            = 6     !  5.25", 360KB,  512 bytes/sector
integer, parameter, public :: F5_320_512            = 7     !  5.25", 320KB,  512 bytes/sector
integer, parameter, public :: F5_320_1024           = 8     !  5.25", 320KB,  1024 bytes/sector
integer, parameter, public :: F5_180_512            = 9     !  5.25", 180KB,  512 bytes/sector
integer, parameter, public :: F5_160_512            = 10    !  5.25", 160KB,  512 bytes/sector
integer, parameter, public :: RemovableMedia        = 11    !  Removable media other than floppy
integer, parameter, public :: FixedMedia            = 12    !  Fixed hard disk media


! 
!  Define the input buffer structure for the driver, when
!  it is called with IOCTL_DISK_FORMAT_TRACKS.
! 

type  T_FORMAT_PARAMETERS
   integer MediaType 
   integer StartCylinderNumber 
   integer EndCylinderNumber 
   integer StartHeadNumber 
   integer EndHeadNumber 
end type  T_FORMAT_PARAMETERS

! 
!  Define the BAD_TRACK_NUMBER type. An array of elements of this type is
!  returned by the driver on IOCTL_DISK_FORMAT_TRACKS requests, to indicate
!  what tracks were bad during formatting. The length of that array is
!  reported in the `Information' field of the I/O Status Block.
! 


! 
!  The following structure is returned on an IOCTL_DISK_GET_DRIVE_GEOMETRY
!  request and an array of them is returned on an IOCTL_DISK_GET_MEDIA_TYPES
!  request.
! 

type  T_DISK_GEOMETRY
    type (T_LARGE_INTEGER) Cylinders 
    integer MediaType 
    integer TracksPerCylinder 
    integer SectorsPerTrack 
    integer BytesPerSector 
end type  T_DISK_GEOMETRY

! 
!  The following structure is returned on an IOCTL_DISK_GET_PARTITION_INFO
!  and an IOCTL_DISK_GET_DRIVE_LAYOUT request.  It is also used in a request
!  to change the drive layout, IOCTL_DISK_SET_DRIVE_LAYOUT.
! 

type  T_PARTITION_INFORMATION
    type (T_LARGE_INTEGER) StartingOffset 
    type (T_LARGE_INTEGER) PartitionLength 
    type (T_LARGE_INTEGER) HiddenSectors 
    BYTE    PartitionType 
    logical(4) BootIndicator 
    logical(4) RecognizedPartition 
    logical(4) RewritePartition 
end type  T_PARTITION_INFORMATION

! 
!  The following structure is used to change the partition type of a
!  specified disk partition using an IOCTL_DISK_SET_PARTITION_INFO
!  request.
! 

type  T_SET_PARTITION_INFORMATION
    BYTE PartitionType 
end type  T_SET_PARTITION_INFORMATION

! 
!  The following structures is returned on an IOCTL_DISK_GET_DRIVE_LAYOUT
!  request and given as input to an IOCTL_DISK_SET_DRIVE_LAYOUT request.
! 

type  DRIVE_LAYOUT_INFORMATION
    integer PartitionCount 
    integer Signature 
    type (T_PARTITION_INFORMATION) PartitionEntry (1 )
end type  DRIVE_LAYOUT_INFORMATION

! 
!  The following structure is passed in on an IOCTL_DISK_VERIFY request.
!  The offset and length parameters are both given in bytes.
! 

type  T_VERIFY_INFORMATION
    type (T_LARGE_INTEGER) StartingOffset 
    integer Length 
end type  T_VERIFY_INFORMATION

! 
!  The following structure is passed in on an IOCTL_DISK_REASSIGN_BLOCKS
!  request.
! 

type  T_REASSIGN_BLOCKS
    integer(2) Reserved 
    integer(2) Count 
    integer BlockNumber (1 )
end type  T_REASSIGN_BLOCKS

! 
!  The following structure is exchanged on an IOCTL_DISK_GET_PERFORMANCE
!  request.
! 

type  T_DISK_PERFORMANCE
        type (T_LARGE_INTEGER) BytesRead 
        type (T_LARGE_INTEGER) BytesWritten 
        type (T_LARGE_INTEGER) ReadTime 
        type (T_LARGE_INTEGER) WriteTime 
        integer ReadCount 
        integer WriteCount 
        integer QueueDepth 
end type  T_DISK_PERFORMANCE

! 
!  IOCTL_DISK_MEDIA_REMOVAL disables the mechanism
!  on a SCSI device that ejects media. This function
!  may or may not be supported on SCSI devices that
!  support removable media.
! 
!  TRUE means prevent media from being removed.
!  FALSE means allow media removal.
! 

type  T_PREVENT_MEDIA_REMOVAL
    logical(4) PreventMediaRemoval 
end type  T_PREVENT_MEDIA_REMOVAL

type T_DISK_RECORD 
    integer(4) ByteOffset
    integer(4) StartTime
    integer(4) EndTime
    integer(4) VirtualAddress
    integer(4) NumberOfBytes
    byte    DeviceNumber
    logical(4) ReadRequest
end type T_DISK_RECORD

type T_DISK_LOGGING 
    byte Function;
    integer(4) BufferAddress;
    integer(4) BufferSize;
end type T_DISK_LOGGING

integer, parameter, public :: DISK_LOGGING_START    = 0
integer, parameter, public :: DISK_LOGGING_STOP     = 1
integer, parameter, public :: DISK_LOGGING_DUMP     = 2
integer, parameter, public :: DISK_BINNING          = 3

!Bin Types
integer, parameter, public :: RequestSize = 0
integer, parameter, public :: RequestLocation = 1

!Bin Ranges 
type T_BIN_RANGE 
    integer(4) StartValue
    integer(4) Length
end type T_BIN_RANGE  

! Bin Definitions

type T_PERF_BIN
    integer(4) NumberOfBins
    integer(4) TypeOfBin
    type (T_BIN_RANGE) BinsRanges(2)
end type T_PERF_BIN

! Bin Count

type T_BIN_COUNT 
    type (T_BIN_RANGE) BinRange
    integer(4) BinCount
end type T_BIN_COUNT

! Bin Results
type T_BIN_RESULTS
    integer(4) NumberOfBins
    type (T_BIN_COUNT) BinCounts(1)
end type T_BIN_RESULTS

! 
!  The following values follow the escape designator in the
!  data stream if the LSRMST_INSERT mode has been turned on.
! 
integer, parameter, public :: SERIAL_LSRMST_ESCAPE     = #00

! 
!  Following this value is the contents of the line status
!  register, and then the character in the RX hardware when
!  the line status register was encountered.
! 
integer, parameter, public :: SERIAL_LSRMST_LSR_DATA   = #01

! 
!  Following this value is the contents of the line status
!  register.  No error character follows
! 
integer, parameter, public :: SERIAL_LSRMST_LSR_NODATA = #02

! 
!  Following this value is the contents of the modem status
!  register.
! 
integer, parameter, public :: SERIAL_LSRMST_MST    = #03
integer, parameter, public :: IOCTL_DISK_BASE      = #00000007 !FILE_DEVICE_DISK



!                               *****WINNLS******

! **************************************************************************
! * Constants
! *
! * Define all constants for the NLS component here.
! **************************************************************************
!

!  *  String Length Maximums.
integer, parameter, public :: MAX_LEADBYTES     = 12             !  5 ranges, 2 bytes ea., 0 term.   
integer, parameter, public :: MAX_DEFAULTCHAR   = 2              !  single or double byte   
 
!  *  MBCS and Unicode Translation Flags.

integer, parameter, public :: MB_PRECOMPOSED    =  #00000001     !  use precomposed chars   
integer, parameter, public :: MB_COMPOSITE      =  #00000002     !  use composite chars   
integer, parameter, public :: MB_USEGLYPHCHARS  =  #00000004     !  use glyph chars, not ctrl chars   

integer, parameter, public :: WC_DEFAULTCHECK   =  #00000100     !  check for default char   
integer, parameter, public :: WC_COMPOSITECHECK =  #00000200     !  convert composite to precomposed   
integer, parameter, public :: WC_DISCARDNS      =  #00000010     !  discard non-spacing chars   
integer, parameter, public :: WC_SEPCHARS       =  #00000020     !  generate separate chars   
integer, parameter, public :: WC_DEFAULTCHAR    =  #00000040     !  replace w/ default char   

!  *  Character Type Flags.

integer, parameter, public :: CT_CTYPE1 =  #00000001     !  ctype 1 information   
integer, parameter, public :: CT_CTYPE2 =  #00000002     !  ctype 2 information   
integer, parameter, public :: CT_CTYPE3 =  #00000004     !  ctype 3 information   

!  *  CType 1 Flag Bits.

integer, parameter, public :: C1_UPPER  =  #0001         !  upper case   
integer, parameter, public :: C1_LOWER  =  #0002         !  lower case   
integer, parameter, public :: C1_DIGIT  =  #0004         !  decimal digits   
integer, parameter, public :: C1_SPACE  =  #0008         !  spacing characters   
integer, parameter, public :: C1_PUNCT  =  #0010         !  punctuation characters   
integer, parameter, public :: C1_CNTRL  =  #0020         !  control characters   
integer, parameter, public :: C1_BLANK  =  #0040         !  blank characters   
integer, parameter, public :: C1_XDIGIT =  #0080         !  other digits   
integer, parameter, public :: C1_ALPHA  =  #0100         !  any letter   

!  *  CType 2 Flag Bits.

integer, parameter, public :: C2_LEFTTORIGHT       =  #0001         !  left to right   
integer, parameter, public :: C2_RIGHTTOLEFT       =  #0002         !  right to left   
integer, parameter, public :: C2_EUROPENUMBER      =  #0003         !  European number, digit   
integer, parameter, public :: C2_EUROPESEPARATOR   =  #0004         !  European numeric separator   
integer, parameter, public :: C2_EUROPETERMINATOR  =  #0005         !  European numeric terminator   
integer, parameter, public :: C2_ARABICNUMBER      =  #0006         !  Arabic number   
integer, parameter, public :: C2_COMMONSEPARATOR   =  #0007         !  common numeric separator   

integer, parameter, public :: C2_BLOCKSEPARATOR    =  #0008         !  block separator   
integer, parameter, public :: C2_SEGMENTSEPARATOR  =  #0009         !  segment separator   
integer, parameter, public :: C2_WHITESPACE        =  #000A         !  white space   
integer, parameter, public :: C2_OTHERNEUTRAL      =  #000B         !  other neutrals   

integer, parameter, public :: C2_NOTAPPLICABLE     =  #0000         !  no implicit directionality   

!  *  CType 3 Flag Bits.

integer, parameter, public :: C3_NONSPACING     =  #0001         !  nonspacing character   
integer, parameter, public :: C3_DIACRITIC      =  #0002         !  diacritic mark   
integer, parameter, public :: C3_VOWELMARK      =  #0004         !  vowel mark   
integer, parameter, public :: C3_SYMBOL         =  #0008         !  symbols   

integer, parameter, public :: C3_NOTAPPLICABLE  =  #0000         !  ctype 3 is not applicable   

!  *  String Flags.

integer, parameter, public :: NORM_IGNORECASE      =  #00000001     !  ignore case   
integer, parameter, public :: NORM_IGNORENONSPACE  =  #00000002     !  ignore nonspacing chars   
integer, parameter, public :: NORM_IGNORESYMBOLS   =  #00000004     !  ignore symbols   

!  *  Locale Independent Mapping Flags.

integer, parameter, public :: MAP_FOLDCZONE        =  #00000010     !  fold compatibility zone chars   
integer, parameter, public :: MAP_PRECOMPOSED      =  #00000020     !  convert to precomposed chars   
integer, parameter, public :: MAP_COMPOSITE        =  #00000040     !  convert to composite chars   
integer, parameter, public :: MAP_FOLDDIGITS       =  #00000080     !  all digits to ASCII 0-9   

!  *  Locale Dependent Mapping Flags.

integer, parameter, public :: LCMAP_LOWERCASE   =  #00000100     !  lower case letters   
integer, parameter, public :: LCMAP_UPPERCASE   =  #00000200     !  upper case letters   
integer, parameter, public :: LCMAP_SORTKEY     =  #00000400     !  WC sort key (normalize)   
integer, parameter, public :: LCMAP_BYTEREV     =  #00000800     !  byte reversal   


!  *  Sorting Flags.
!  *
!  *    WORD Sort:    culturally correct sort
!  *                  hyphen and apostrophe are special cased
!  *                  example: "coop" and "co-op" will sort together in a list
!  *
!  *                        co_op     <-------  underscore (symbol)
!  *                        coat
!  *                        comb
!  *                        coop
!  *                        co-op     <-------  hyphen (punctuation)
!  *                        cork
!  *                        went
!  *                        were
!  *                        we're     <-------  apostrophe (punctuation)
!  *
!  *
!  *    STRING Sort:  hyphen and apostrophe will sort with all other symbols
!  *
!  *                        co-op     <-------  hyphen (punctuation)
!  *                        co_op     <-------  underscore (symbol)
!  *                        coat
!  *                        comb
!  *                        coop
!  *                        cork
!  *                        we're     <-------  apostrophe (punctuation)
!  *                        went
!  *                        were
!  
!

integer, parameter, public :: SORT_STRINGSORT =  #00001000     !  use string sort method   

! 
!  *  Code Page Default Values.
!  
!
integer, parameter, public :: CP_ACP   = 0              !  default to ANSI code page   
integer, parameter, public :: CP_OEMCP = 1              !  default to OEM  code page   

! 
!  *  Country Codes.
!  
!
integer, parameter, public :: CTRY_DEFAULT          = 0
integer, parameter, public :: CTRY_AUSTRALIA        = 61      !  Australia   
integer, parameter, public :: CTRY_AUSTRIA          = 43      !  Austria   
integer, parameter, public :: CTRY_BELGIUM          = 32      !  Belgium   
integer, parameter, public :: CTRY_BRAZIL           = 55      !  Brazil   
integer, parameter, public :: CTRY_CANADA           = 2       !  Canada   
integer, parameter, public :: CTRY_DENMARK          = 45      !  Denmark   
integer, parameter, public :: CTRY_FINLAND          = 358     !  Finland   
integer, parameter, public :: CTRY_FRANCE           = 33      !  France   
integer, parameter, public :: CTRY_GERMANY          = 49      !  Germany   
integer, parameter, public :: CTRY_ICELAND          = 354     !  Iceland   
integer, parameter, public :: CTRY_IRELAND          = 353     !  Ireland   
integer, parameter, public :: CTRY_ITALY            = 39      !  Italy   
integer, parameter, public :: CTRY_JAPAN            = 81      !  Japan   
integer, parameter, public :: CTRY_MEXICO           = 52      !  Mexico   
integer, parameter, public :: CTRY_NETHERLANDS      = 31      !  Netherlands   
integer, parameter, public :: CTRY_NEW_ZEALAND      = 64      !  New Zealand   
integer, parameter, public :: CTRY_NORWAY           = 47      !  Norway   
integer, parameter, public :: CTRY_PORTUGAL         = 351     !  Portugal   
integer, parameter, public :: CTRY_PRCHINA          = 86      !  PR China   
integer, parameter, public :: CTRY_SOUTH_KOREA      = 82      !  South Korea   
integer, parameter, public :: CTRY_SPAIN            = 34      !  Spain   
integer, parameter, public :: CTRY_SWEDEN           = 46      !  Sweden   
integer, parameter, public :: CTRY_SWITZERLAND      = 41      !  Switzerland   
integer, parameter, public :: CTRY_TAIWAN           = 886     !  Taiwan   
integer, parameter, public :: CTRY_UNITED_KINGDOM   = 44      !  United Kingdom   
integer, parameter, public :: CTRY_UNITED_STATES    = 1       !  United States   

! 
!  *  Locale Types.
!  *
!  *  These types are used for the GetLocaleInfoW NLS API routine.
!  *
!  *  LOCALE_NOUSEROVERRIDE is also used in GetTimeFormatW and GetDateFormatW.
!  
!

integer, parameter, public :: LOCALE_NOUSEROVERRIDE             =  #80000000  !-2147483647  
integer, parameter, public :: LOCALE_ILANGUAGE                  =  #00000001  !  language id   
integer, parameter, public :: LOCALE_SLANGUAGE                  =  #00000002  !  localized name of language   
integer, parameter, public :: LOCALE_SENGLANGUAGE               =  #00001001  !  English name of language   
integer, parameter, public :: LOCALE_SABBREVLANGNAME            =  #00000003  !  abbreviated language name   
integer, parameter, public :: LOCALE_SNATIVELANGNAME            =  #00000004  !  native name of language   
integer, parameter, public :: LOCALE_ICOUNTRY                   =  #00000005  !  country code   
integer, parameter, public :: LOCALE_SCOUNTRY                   =  #00000006  !  localized name of country     
integer, parameter, public :: LOCALE_SENGCOUNTRY                =  #00001002  !  English name of country     
integer, parameter, public :: LOCALE_SABBREVCTRYNAME            =  #00000007  !  abbreviated country name   
integer, parameter, public :: LOCALE_SNATIVECTRYNAME            =  #00000008  !  native name of country     
integer, parameter, public :: LOCALE_IDEFAULTLANGUAGE           =  #00000009  !  default language id   
integer, parameter, public :: LOCALE_IDEFAULTCOUNTRY            =  #0000000A  !  default country code   
integer, parameter, public :: LOCALE_IDEFAULTCODEPAGE           =  #0000000B  !  default code page   
integer, parameter, public :: LOCALE_SLIST                      =  #0000000C  !  list item separator   
integer, parameter, public :: LOCALE_IMEASURE                   =  #0000000D  !  0 = metric, 1 = US   
integer, parameter, public :: LOCALE_SDECIMAL                   =  #0000000E  !  decimal separator   
integer, parameter, public :: LOCALE_STHOUSAND                  =  #0000000F  !  thousand separator   
integer, parameter, public :: LOCALE_SGROUPING                  =  #00000010  !  digit grouping   
integer, parameter, public :: LOCALE_IDIGITS                    =  #00000011  !  number of fractional digits   
integer, parameter, public :: LOCALE_ILZERO                     =  #00000012  !  leading zeros for decimal   
integer, parameter, public :: LOCALE_SNATIVEDIGITS              =  #00000013  !  native ascii 0-9   
integer, parameter, public :: LOCALE_SCURRENCY                  =  #00000014  !  local monetary symbol   
integer, parameter, public :: LOCALE_SINTLSYMBOL                =  #00000015  !  intl monetary symbol   
integer, parameter, public :: LOCALE_SMONDECIMALSEP             =  #00000016  !  monetary decimal separator   
integer, parameter, public :: LOCALE_SMONTHOUSANDSEP            =  #00000017  !  monetary thousand separator   
integer, parameter, public :: LOCALE_SMONGROUPING               =  #00000018  !  monetary grouping   
integer, parameter, public :: LOCALE_ICURRDIGITS                =  #00000019  !  # local monetary digits   
integer, parameter, public :: LOCALE_IINTLCURRDIGITS            =  #0000001A  !  # intl monetary digits   
integer, parameter, public :: LOCALE_ICURRENCY                  =  #0000001B  !  positive currency mode   
integer, parameter, public :: LOCALE_INEGCURR                   =  #0000001C  !  negative currency mode   
integer, parameter, public :: LOCALE_SDATE                      =  #0000001D  !  date separator   
integer, parameter, public :: LOCALE_STIME                      =  #0000001E  !  time separator   
integer, parameter, public :: LOCALE_SSHORTDATE                 =  #0000001F  !  short date format string   
integer, parameter, public :: LOCALE_SLONGDATE                  =  #00000020  !  long date format string   
integer, parameter, public :: LOCALE_STIMEFORMAT                =  #00001003  !  time format string   
integer, parameter, public :: LOCALE_IDATE                      =  #00000021  !  short date format ordering   
integer, parameter, public :: LOCALE_ILDATE                     =  #00000022  !  long date format ordering   
integer, parameter, public :: LOCALE_ITIME                      =  #00000023  !  time format specifier   
integer, parameter, public :: LOCALE_ICENTURY                   =  #00000024  !  century format specifier   
integer, parameter, public :: LOCALE_ITLZERO                    =  #00000025  !  leading zeros in time field   
integer, parameter, public :: LOCALE_IDAYLZERO                  =  #00000026  !  leading zeros in day field   
integer, parameter, public :: LOCALE_IMONLZERO                  =  #00000027  !  leading zeros in month field   
integer, parameter, public :: LOCALE_S1159                      =  #00000028  !  AM designator   
integer, parameter, public :: LOCALE_S2359                      =  #00000029  !  PM designator   
integer, parameter, public :: LOCALE_SDAYNAME1                  =  #0000002A  !  long name for Monday   
integer, parameter, public :: LOCALE_SDAYNAME2                  =  #0000002B  !  long name for Tuesday   
integer, parameter, public :: LOCALE_SDAYNAME3                  =  #0000002C  !  long name for Wednesday   
integer, parameter, public :: LOCALE_SDAYNAME4                  =  #0000002D  !  long name for Thursday   
integer, parameter, public :: LOCALE_SDAYNAME5                  =  #0000002E  !  long name for Friday   
integer, parameter, public :: LOCALE_SDAYNAME6                  =  #0000002F  !  long name for Saturday   
integer, parameter, public :: LOCALE_SDAYNAME7                  =  #00000030  !  long name for Sunday   
integer, parameter, public :: LOCALE_SABBREVDAYNAME1            =  #00000031  !  abbreviated name for Monday      
integer, parameter, public :: LOCALE_SABBREVDAYNAME2            =  #00000032  !  abbreviated name for Tuesday     
integer, parameter, public :: LOCALE_SABBREVDAYNAME3            =  #00000033  !  abbreviated name for Wednesday   
integer, parameter, public :: LOCALE_SABBREVDAYNAME4            =  #00000034  !  abbreviated name for Thursday    
integer, parameter, public :: LOCALE_SABBREVDAYNAME5            =  #00000035  !  abbreviated name for Friday      
integer, parameter, public :: LOCALE_SABBREVDAYNAME6            =  #00000036  !  abbreviated name for Saturday    
integer, parameter, public :: LOCALE_SABBREVDAYNAME7            =  #00000037  !  abbreviated name for Sunday      
integer, parameter, public :: LOCALE_SMONTHNAME1                =  #00000038  !  long name for January   
integer, parameter, public :: LOCALE_SMONTHNAME2                =  #00000039  !  long name for February   
integer, parameter, public :: LOCALE_SMONTHNAME3                =  #0000003A  !  long name for March   
integer, parameter, public :: LOCALE_SMONTHNAME4                =  #0000003B  !  long name for April   
integer, parameter, public :: LOCALE_SMONTHNAME5                =  #0000003C  !  long name for May   
integer, parameter, public :: LOCALE_SMONTHNAME6                =  #0000003D  !  long name for June   
integer, parameter, public :: LOCALE_SMONTHNAME7                =  #0000003E  !  long name for July   
integer, parameter, public :: LOCALE_SMONTHNAME8                =  #0000003F  !  long name for August   
integer, parameter, public :: LOCALE_SMONTHNAME9                =  #00000040  !  long name for September   
integer, parameter, public :: LOCALE_SMONTHNAME10               =  #00000041  !  long name for October   
integer, parameter, public :: LOCALE_SMONTHNAME11               =  #00000042  !  long name for November   
integer, parameter, public :: LOCALE_SMONTHNAME12               =  #00000043  !  long name for December   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME1          =  #00000044  !  abbreviated name for January   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME2          =  #00000045  !  abbreviated name for February   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME3          =  #00000046  !  abbreviated name for March   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME4          =  #00000047  !  abbreviated name for April   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME5          =  #00000048  !  abbreviated name for May   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME6          =  #00000049  !  abbreviated name for June   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME7          =  #0000004A  !  abbreviated name for July   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME8          =  #0000004B  !  abbreviated name for August   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME9          =  #0000004C  !  abbreviated name for September   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME10         =  #0000004D  !  abbreviated name for October   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME11         =  #0000004E  !  abbreviated name for November   
integer, parameter, public :: LOCALE_SABBREVMONTHNAME12         =  #0000004F  !  abbreviated name for December   
integer, parameter, public :: LOCALE_SPOSITIVESIGN              =  #00000050  !  positive sign   
integer, parameter, public :: LOCALE_SNEGATIVESIGN              =  #00000051  !  negative sign   
integer, parameter, public :: LOCALE_IPOSSIGNPOSN               =  #00000052  !  positive sign position   
integer, parameter, public :: LOCALE_INEGSIGNPOSN               =  #00000053  !  negative sign position   
integer, parameter, public :: LOCALE_IPOSSYMPRECEDES            =  #00000054  !  mon sym precedes pos amt   
integer, parameter, public :: LOCALE_IPOSSEPBYSPACE             =  #00000055  !  mon sym sep by space from pos amt    
integer, parameter, public :: LOCALE_INEGSYMPRECEDES            =  #00000056  !  mon sym precedes neg amt   
integer, parameter, public :: LOCALE_INEGSEPBYSPACE             =  #00000057  !  mon sym sep by space from neg amt   


! 
!  *  Time Flags for GetTimeFormatW.
!  
!

integer, parameter, public :: TIME_NOMINUTESORSECONDS           =  #00000001  !  do not use minutes or seconds   
integer, parameter, public :: TIME_NOSECONDS                    =  #00000002  !  do not use seconds   
integer, parameter, public :: TIME_NOTIMEMARKER                 =  #00000004  !  do not use time marker   
integer, parameter, public :: TIME_FORCE24HOURFORMAT            =  #00000008  !  always use 24 hour format   


! 
!  *  Date Flags for GetDateFormatW.
!  
!

integer, parameter, public :: DATE_SHORTDATE =  #00000001  !  use short date picture   
integer, parameter, public :: DATE_LONGDATE  =  #00000002  !  use long date picture   

! **************************************************************************\
! * Typedefs
! *
! * Define all types for the NLS component here.
! \**************************************************************************

!  *  Locale type constant
! 
!  *  CP Info.
!  

type  T_CPINFO
    integer MaxCharSize                         !  max length (bytes) of a char   
    BYTE    DefaultChar (MAX_DEFAULTCHAR )    !  default character   
    BYTE    LeadByte (MAX_LEADBYTES )         !  lead byte ranges   
end type  T_CPINFO

! *
! *  Number format.
! *

type T_NUMBERFMT
   integer(4)    NumDigits                 ! number of decimal digits 
   integer(4)    LeadingZero               ! if leading zero in decimal fields 
   integer(4)    Grouping                  ! group size left of decimal 
   integer(4)    lpDecimalSep              ! ptr to decimal separator string 
   integer(4)    lpThousandSep             ! ptr to thousand separator string 
   integer(4)    NegativeOrder             ! negative number ordering 
end type T_NUMBERFMT


!
!  Currency format.
!

type T_CURRENCYFMT
   integer(4)    NumDigits                 ! number of decimal digits 
   integer(4)    LeadingZero               ! if leading zero in decimal fields 
   integer(4)    Grouping                  ! group size left of decimal 
   integer(4)    lpDecimalSep              ! ptr to decimal separator string 
   integer(4)    lpThousandSep             ! ptr to thousand separator string 
   integer(4)    NegativeOrder             ! negative currency ordering 
   integer(4)    PositiveOrder             ! positive currency ordering 
   integer(4)    lpCurrencySymbol          ! ptr to currency symbol string 
end type T_CURRENCYFMT




!                               *****WINPERF******


! Abstract:
! 
!     Header file for the Performance Monitor data.
! 
!     This file contains the definitions of the data structures returned
!     by the Configuration Registry in response to a request for
!     performance data.  This file is used by both the Configuration
!     Registry and the Performance Monitor to define their interface.
!     The complete interface is described here, except for the name
!     of the node to query in the registry.  It is
! 
!                    HKEY_PERFORMANCE_DATA.
! 
!     By querying that node with a subkey of "Global" the caller will
!     retrieve the structures described here.
! 
!     There is no need to RegOpenKey() the reserved handle HKEY_PERFORMANCE_DATA,
!     but the caller should RegCloseKey() the handle so that network transports
!     and drivers can be removed or installed (which cannot happen while
!     they are open for monitoring.)  Remote requests must first
!     RegConnectRegistry().
! 
! --
!

!   Data structure definitions.

!   In order for data to be returned through the Configuration Registry
!   in a system-independent fashion, it must be self-describing.

!   In the following, all offsets are in bytes.

! 
!   Data is returned through the Configuration Registry in a
!   a data block which begins with a _PERF_DATA_BLOCK structure.
! 

integer, parameter, public :: PERF_DATA_VERSION     = 1
integer, parameter, public :: PERF_DATA_REVISION    = 1


integer, parameter, public :: PERF_NO_INSTANCES     = -1  ! // no instances (see NumInstances above)
! 
!  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
! 
!   PERF_COUNTER_DEFINITION.CounterType field values
! 
! 
!         Counter ID Field Definition:
! 
!    3      2        2    2    2        1        1    1
!    1      8        4    2    0        6        2    0    8                0
!   +--------+--------+----+----+--------+--------+----+----+----------------+
!   |Display |Calculation  |Time|Counter |        |Ctr |Size|                |
!   |Flags   |Modifiers    |Base|SubType |Reserved|Type|Fld |   Reserved     |
!   +--------+--------+----+----+--------+--------+----+----+----------------+
! 
! 
!   The counter type is the "or" of the following values as described below
! 
!   select one of the following to indicate the counter's data size
! 
integer, parameter, public :: PERF_SIZE_DWORD           =  #00000000
integer, parameter, public :: PERF_SIZE_LARGE           =  #00000100
integer, parameter, public :: PERF_SIZE_ZERO            =  #00000200  ! // for Zero Length fields
integer, parameter, public :: PERF_SIZE_VARIABLE_LEN    =  #00000300  ! // length is in CounterLength field
                                                                      !   of Counter Definition struct
! 
!   select one of the following values to indicate the counter field usage
! 
integer, parameter, public :: PERF_TYPE_NUMBER  =  #00000000  ! // a number (not a counter)
integer, parameter, public :: PERF_TYPE_COUNTER =  #00000400 ! // an increasing numeric value
integer, parameter, public :: PERF_TYPE_TEXT    =  #00000800  ! // a text field
integer, parameter, public :: PERF_TYPE_ZERO    =  #00000C00  ! // displays a zero
! 
!   If the PERF_TYPE_NUMBER field was selected, then select one of the 
!   following to describe the Number
! 
integer, parameter, public :: PERF_NUMBER_HEX       =  #00000000  ! // display as HEX value
integer, parameter, public :: PERF_NUMBER_DECIMAL   =  #00010000 ! // display as a decimal integer
integer, parameter, public :: PERF_NUMBER_DEC_1000  =  #00020000 ! // display as a decimal/1000
! 
!   If the PERF_TYPE_COUNTER value was selected then select one of the
!   following to indicate the type of counter
! 
integer, parameter, public :: PERF_COUNTER_VALUE        =  #00000000  !// display counter value
integer, parameter, public :: PERF_COUNTER_RATE         =  #00010000  !// divide ctr / delta time
integer, parameter, public :: PERF_COUNTER_FRACTION     =  #00020000 ! // divide ctr / base
integer, parameter, public :: PERF_COUNTER_BASE         =  #00030000  !// base value used in fractions
integer, parameter, public :: PERF_COUNTER_ELAPSED      =  #00040000 ! // subtract counter from current time 
integer, parameter, public :: PERF_COUNTER_QUEUELEN     =  #00050000 ! // Use Queuelen processing func.
integer, parameter, public :: PERF_COUNTER_HISTOGRAM    =  #00060000 ! // Counter begins or ends a histogram
! 
!   If the PERF_TYPE_TEXT value was selected, then select one of the 
!   following to indicate the type of TEXT data.
! 
integer, parameter, public :: PERF_TEXT_UNICODE =  #00000000  ! // type of text in text field
integer, parameter, public :: PERF_TEXT_ASCII   =  #00010000  ! // ASCII using the CodePage field
! 
!   Timer SubTypes
! 
integer, parameter, public :: PERF_TIMER_TICK   =  #00000000  !// use system perf. freq for base
integer, parameter, public :: PERF_TIMER_100NS  =  #00100000 ! // use 100 NS timer time base units
integer, parameter, public :: PERF_OBJECT_TIMER =  #00200000 ! // use the object timer freq
! 
!   Any types that have calculations performed can use one or more of 
!   the following calculation modification flags listed here
! 
integer, parameter, public :: PERF_DELTA_COUNTER    =  #00400000 ! // compute difference first
integer, parameter, public :: PERF_DELTA_BASE       =  #00800000  !// compute base diff as well
integer, parameter, public :: PERF_INVERSE_COUNTER  =  #01000000 ! // show as 1.00-value (assumes:
integer, parameter, public :: PERF_MULTI_COUNTER    =  #02000000  !// sum of multiple instances
! 
!   Select one of the following values to indicate the display suffix (if any)
! 
integer, parameter, public :: PERF_DISPLAY_NO_SUFFIX    =  #00000000 ! // no suffix
integer, parameter, public :: PERF_DISPLAY_PER_SEC      =  #10000000  !// "/sec"
integer, parameter, public :: PERF_DISPLAY_PERCENT      =  #20000000  !// "%"
integer, parameter, public :: PERF_DISPLAY_SECONDS      =  #30000000  !// "secs"
integer, parameter, public :: PERF_DISPLAY_NOSHOW       =  #40000000  !// value is not displayed

! 
!   Predefined counter types 
! 

integer, parameter, public :: PERF_COUNTER_HISTOGRAM_TYPE =  -2147483467 !#80000000
                                        !  Counter begins or ends a histogram

! 
!   The following are used to determine the level of detail associated
!   with the counter.  The user will be setting the level of detail
!   that should be displayed at any given time.
! 

integer, parameter, public :: PERF_DETAIL_NOVICE = 100 ! // The uninformed can understand it
integer, parameter, public :: PERF_DETAIL_ADVANCED = 200 !// For the advanced user
integer, parameter, public :: PERF_DETAIL_EXPERT = 300 !// For the expert user
integer, parameter, public :: PERF_DETAIL_WIZARD = 400 !// For the system designer



! 
!   If (PERF_DATA_BLOCK.NumInstances >= 0) then there will be
!   PERF_DATA_BLOCK.NumInstances of a (PERF_INSTANCE_DEFINITION
!   followed by a PERF_COUNTER_BLOCK followed by the counter data fields)
!   for each instance.
! 
!   If (PERF_DATA_BLOCK.NumInstances < 0) then the counter definition
!   strucutre above will be followed by only a PERF_COUNTER_BLOCK and the
!   counter data for that COUNTER.
! 

integer, parameter, public :: PERF_NO_UNIQUE_ID = -1

type  T_PERF_INSTANCE_DEFINITION
    integer ByteLength 
    integer ParentObjectTitleIndex 
    integer ParentObjectInstance 
    integer UniqueID 
    integer NameOffset 
    integer NameLength 
end type  T_PERF_INSTANCE_DEFINITION

! 
!   If .ParentObjectName is 0, there
!   is no parent-child hierarchy for this object type.  Otherwise,
!    the .ParentObjectInstance is an index, starting at 0, into the
!   instances reported for the parent object type.  It is only
!   meaningful if .ParentObjectName is not 0.  The purpose of all this
!   is to permit reporting/summation of object instances like threads
!   within processes, and logical drives within physical drives.
! 
! 
!   The PERF_INSTANCE_DEFINITION will be followed by a PERF_COUNTER_BLOCK.
! 

type  T_PERF_COUNTER_BLOCK
    integer(4)    ByteLength 
end type  T_PERF_COUNTER_BLOCK



!                               *****WINSPOOL******

type  T_PRINTER_INFO_1
    integer Flags 
    integer pDescription 
    integer pName 
    integer pComment 
end type  T_PRINTER_INFO_1


type  T_PRINTER_INFO_2
    integer pServerName 
    integer pPrinterName 
    integer pShareName 
    integer pPortName 
    integer pDriverName 
    integer pComment 
    integer pLocation 
    integer pDevMode 
    integer pSepFile 
    integer pPrintProcessor 
    integer pDatatype 
    integer pParameters 
    integer pSecurityDescriptor 
    integer Attributes 
    integer Priority 
    integer DefaultPriority 
    integer StartTime 
    integer UntilTime 
    integer Status 
    integer cJobs 
    integer AveragePPM 
end type  T_PRINTER_INFO_2

type  T_PRINTER_INFO_3
    integer pSecurityDescriptor 
end type  T_PRINTER_INFO_3

type T_PRINTER_INFO_4
    integer(4)    pPrinterName
    integer(4)    pServerName
    integer(4)    Attributes
end type T_PRINTER_INFO_4


integer, parameter, public :: PRINTER_CONTROL_PAUSE     = 1
integer, parameter, public :: PRINTER_CONTROL_RESUME    = 2
integer, parameter, public :: PRINTER_CONTROL_PURGE     = 3

integer, parameter, public :: PRINTER_STATUS_PAUSED             =  #00000001
integer, parameter, public :: PRINTER_STATUS_ERROR              =  #00000002
integer, parameter, public :: PRINTER_STATUS_PENDING_DELETION   =  #00000004
integer, parameter, public :: PRINTER_STATUS_PAPER_JAM          =  #00000008
integer, parameter, public :: PRINTER_STATUS_PAPER_OUT          =  #00000010
integer, parameter, public :: PRINTER_STATUS_MANUAL_FEED        =  #00000020
integer, parameter, public :: PRINTER_STATUS_PAPER_PROBLEM      =  #00000040
integer, parameter, public :: PRINTER_STATUS_OFFLINE            =  #00000080
integer, parameter, public :: PRINTER_STATUS_IO_ACTIVE          =  #00000100
integer, parameter, public :: PRINTER_STATUS_BUSY               =  #00000200
integer, parameter, public :: PRINTER_STATUS_PRINTING           =  #00000400
integer, parameter, public :: PRINTER_STATUS_OUTPUT_BIN_FULL    =  #00000800
integer, parameter, public :: PRINTER_STATUS_NOT_AVAILABLE      =  #00001000
integer, parameter, public :: PRINTER_STATUS_WAITING            =  #00002000
integer, parameter, public :: PRINTER_STATUS_PROCESSING         =  #00004000
integer, parameter, public :: PRINTER_STATUS_INITIALIZING       =  #00008000
integer, parameter, public :: PRINTER_STATUS_WARMING_UP         =  #00010000
integer, parameter, public :: PRINTER_STATUS_TONER_LOW          =  #00020000
integer, parameter, public :: PRINTER_STATUS_NO_TONER           =  #00040000
integer, parameter, public :: PRINTER_STATUS_PAGE_PUNT          =  #00080000
!integer, parameter, public :: PRINTER_STATUS_USER_INTERVENTION =  #00100000
integer, parameter, public :: PRINTER_STAT_USER_INTERVENTION    =  #00100000
integer, parameter, public :: PRINTER_STATUS_OUT_OF_MEMORY      =  #00200000
integer, parameter, public :: PRINTER_STATUS_DOOR_OPEN          =  #00400000


integer, parameter, public :: PRINTER_ATTRIBUTE_QUEUED  =  #00000001
integer, parameter, public :: PRINTER_ATTRIBUTE_DIRECT  =  #00000002
integer, parameter, public :: PRINTER_ATTRIBUTE_DEFAULT =  #00000004
integer, parameter, public :: PRINTER_ATTRIBUTE_SHARED  =  #00000008
integer, parameter, public :: PRINTER_ATTRIBUTE_NETWORK =  #00000010
integer, parameter, public :: PRINTER_ATTRIBUTE_HIDDEN  =  #00000020
integer, parameter, public :: PRINTER_ATTRIBUTE_LOCAL   =  #00000040

integer, parameter, public :: NO_PRIORITY   = 0
integer, parameter, public :: MAX_PRIORITY  = 99
integer, parameter, public :: MIN_PRIORITY  = 1
integer, parameter, public :: DEF_PRIORITY  = 1

type  T_JOB_INFO_1
   integer JobId 
   integer pPrinterName 
   integer pMachineName 
   integer pUserName 
   integer pDocument 
   integer pDatatype 
   integer pStatus 
   integer Status 
   integer Priority 
   integer Position 
   integer TotalPages 
   integer PagesPrinted 
   type (T_SYSTEMTIME) Submitted 
end type  T_JOB_INFO_1


type  T_JOB_INFO_2
   integer JobId 
   integer pPrinterName 
   integer pMachineName 
   integer pUserName 
   integer pDocument 
   integer pNotifyName 
   integer pDatatype 
   integer pPrintProcessor 
   integer pParameters 
   integer pDriverName 
   integer pDevMode 
   integer pStatus 
   integer pSecurityDescriptor 
   integer Status 
   integer Priority 
   integer Position 
   integer StartTime 
   integer UntilTime 
   integer TotalPages 
   integer Size 
   type (T_SYSTEMTIME) Submitted      !  Time the job was spooled
   integer Time                     !  How many seconds the job has been printing
   integer PagesPrinted 
end type  T_JOB_INFO_2                

!
integer, parameter, public :: JOB_CONTROL_PAUSE     = 1
integer, parameter, public :: JOB_CONTROL_RESUME    = 2
integer, parameter, public :: JOB_CONTROL_CANCEL    = 3
integer, parameter, public :: JOB_CONTROL_RESTART   = 4

integer, parameter, public :: JOB_STATUS_PAUSED     =  #00000001
integer, parameter, public :: JOB_STATUS_ERROR      =  #00000002
integer, parameter, public :: JOB_STATUS_DELETING   =  #00000004
integer, parameter, public :: JOB_STATUS_SPOOLING   =  #00000008
integer, parameter, public :: JOB_STATUS_PRINTING   =  #00000010
integer, parameter, public :: JOB_STATUS_OFFLINE    =  #00000020
integer, parameter, public :: JOB_STATUS_PAPEROUT   =  #00000040
integer, parameter, public :: JOB_STATUS_PRINTED    =  #00000080

integer, parameter, public :: JOB_POSITION_UNSPECIFIED = 0

type  T_ADDJOB_INFO_1
    integer Path 
    integer JobId 
end type  T_ADDJOB_INFO_1

type  T_DRIVER_INFO_1
    integer pName                !  QMS 810
end type  T_DRIVER_INFO_1


type  T_DRIVER_INFO_2
    integer cVersion 
    integer pName                !  QMS 810
    integer pEnvironment         !  Win32 x86
    integer pDriverPath          !  c:\drivers\pscript.dll
    integer pDataFile            !  c:\drivers\QMS810.PPD
    integer pConfigFile          !  c:\drivers\PSCRPTUI.DLL
end type  T_DRIVER_INFO_2


type  T_DOC_INFO_1
    integer pDocName 
    integer pOutputFile 
    integer pDatatype 
end type  T_DOC_INFO_1


type  T_FORM_INFO_1
    integer Flags 
    integer pName 
    type (T_SIZE) Sizef 
    type (T_RECTL) ImageableArea 
end type  T_FORM_INFO_1


integer, parameter, public :: FORM_BUILTIN =  #00000001


type  T_PRINTPROCESSOR_INFO_1
    integer pName 
end type  T_PRINTPROCESSOR_INFO_1

type  T_PORT_INFO_1
    integer pName 
end type  T_PORT_INFO_1


type  T_MONITOR_INFO_1
    integer pName 
end type  T_MONITOR_INFO_1


type  T_MONITOR_INFO_2
    integer pName 
    integer pEnvironment 
    integer pDLLName 
end type  T_MONITOR_INFO_2


type  T_DATATYPES_INFO_1
    integer pName 
end type  T_DATATYPES_INFO_1


type  T_PRINTER_DEFAULTS
    integer pDatatype 
    integer pDevMode 
    integer DesiredAccess 
end type  T_PRINTER_DEFAULTS


integer, parameter, public :: PRINTER_ENUM_DEFAULT      =  #00000001
integer, parameter, public :: PRINTER_ENUM_LOCAL        =  #00000002
integer, parameter, public :: PRINTER_ENUM_CONNECTIONS  =  #00000004
integer, parameter, public :: PRINTER_ENUM_FAVORITE     =  #00000004
integer, parameter, public :: PRINTER_ENUM_NAME         =  #00000008
integer, parameter, public :: PRINTER_ENUM_REMOTE       =  #00000010
integer, parameter, public :: PRINTER_ENUM_SHARED       =  #00000020
integer, parameter, public :: PRINTER_ENUM_NETWORK      =  #00000040

integer, parameter, public :: PRINTER_ENUM_EXPAND       =  #00004000
integer, parameter, public :: PRINTER_ENUM_CONTAINER    =  #00008000

integer, parameter, public :: PRINTER_ENUM_ICONMASK =  #00ff0000
integer, parameter, public :: PRINTER_ENUM_ICON1    =  #00010000
integer, parameter, public :: PRINTER_ENUM_ICON2    =  #00020000
integer, parameter, public :: PRINTER_ENUM_ICON3    =  #00040000
integer, parameter, public :: PRINTER_ENUM_ICON4    =  #00080000
integer, parameter, public :: PRINTER_ENUM_ICON5    =  #00100000
integer, parameter, public :: PRINTER_ENUM_ICON6    =  #00200000
integer, parameter, public :: PRINTER_ENUM_ICON7    =  #00400000
integer, parameter, public :: PRINTER_ENUM_ICON8    =  #00800000



integer, parameter, public :: PRINTER_CHANGE_ADD_PRINTER                =  #00000001
integer, parameter, public :: PRINTER_CHANGE_SET_PRINTER                =  #00000002
integer, parameter, public :: PRINTER_CHANGE_DELETE_PRINTER             =  #00000004
integer, parameter, public :: PRN_CHNG_FAILED_CONNECTION_PRN            =  #00000008
integer, parameter, public :: PRINTER_CHANGE_PRINTER                    =  #000000FF
integer, parameter, public :: PRINTER_CHANGE_ADD_JOB                    =  #00000100
integer, parameter, public :: PRINTER_CHANGE_SET_JOB                    =  #00000200
integer, parameter, public :: PRINTER_CHANGE_DELETE_JOB                 =  #00000400
integer, parameter, public :: PRINTER_CHANGE_WRITE_JOB                  =  #00000800
integer, parameter, public :: PRINTER_CHANGE_JOB                        =  #0000FF00
integer, parameter, public :: PRINTER_CHANGE_ADD_FORM                   =  #00010000
integer, parameter, public :: PRINTER_CHANGE_SET_FORM                   =  #00020000
integer, parameter, public :: PRINTER_CHANGE_DELETE_FORM                =  #00040000
integer, parameter, public :: PRINTER_CHANGE_FORM                       =  #00070000
integer, parameter, public :: PRINTER_CHANGE_ADD_PORT                   =  #00100000
integer, parameter, public :: PRINTER_CHANGE_CONFIGURE_PORT             =  #00200000
integer, parameter, public :: PRINTER_CHANGE_DELETE_PORT                =  #00400000
integer, parameter, public :: PRINTER_CHANGE_PORT                       =  #00700000
!integer, parameter, public :: PRINTER_CHANGE_ADD_PRINT_PROCESSOR       =  #01000000
integer, parameter, public :: PRINTER_CHNG_ADD_PRINT_PROC               =  #01000000
!integer, parameter, public :: PRINTER_CHANGE_DELETE_PRINT_PROCESSOR    =  #04000000
integer, parameter, public :: PRINTER_CHNG_DELETE_PRINT_PROC            =  #04000000
integer, parameter, public :: PRINTER_CHANGE_PRINT_PROCESSOR            =  #07000000
!integer, parameter, public :: PRINTER_CHANGE_ADD_PRINTER_DRIVER        =  #10000000
integer, parameter, public :: PRINTER_CHNG_ADD_PRINTER_DRIVER           =  #10000000
!integer, parameter, public :: PRINTER_CHANGE_DELETE_PRINTER_DRIVER     =  #40000000
integer, parameter, public :: PRINTER_CHNG_DELETE_PRINTER_DRV           =  #40000000
integer, parameter, public :: PRINTER_CHANGE_PRINTER_DRIVER             =  #70000000
integer, parameter, public :: PRINTER_CHANGE_TIMEOUT                    =  #80000000
integer, parameter, public :: PRINTER_CHANGE_ALL                        =  #7777FFFF


integer, parameter, public :: PRINTER_ERROR_INFORMATION =  #80000000
integer, parameter, public :: PRINTER_ERROR_WARNING     =  #40000000
integer, parameter, public :: PRINTER_ERROR_SEVERE      =  #20000000

integer, parameter, public :: PRINTER_ERROR_OUTOFPAPER  =  #00000001
integer, parameter, public :: PRINTER_ERROR_JAM         =  #00000002
integer, parameter, public :: PRINTER_ERROR_OUTOFTONER  =  #00000004




type  T_PROVIDOR_INFO_1
    integer pName 
    integer pEnvironment 
    integer pDLLName 
end type  T_PROVIDOR_INFO_1

integer, parameter, public :: SERVER_ACCESS_ADMINISTER  =  #00000001
integer, parameter, public :: SERVER_ACCESS_ENUMERATE   =  #00000002
integer, parameter, public :: PRINTER_ACCESS_ADMINISTER =  #00000004
integer, parameter, public :: PRINTER_ACCESS_USE        =  #00000008
integer, parameter, public :: JOB_ACCESS_ADMINISTER     =  #00000010


!                               *****WINSVC******

! 
!  Constants
! 
! 
!  Service database names
! 

character*15, parameter, public :: SERVICES_ACTIVE_DATABASE = "ServicesActive"C
character*15, parameter, public :: SERVICES_FAILED_DATABASE = "ServicesFailed"C

! 
!  Character to designate that a name is a group
! 
character, parameter, public :: SC_GROUP_IDENTIFIER           = '+'


! 
!  Value to indicate no change to an optional parameter
! 
integer, parameter, public :: SERVICE_NO_CHANGE =  -1 !#ffffffff

! 
!  Service State -- for Enum Requests (Bit Mask)
! 
integer, parameter, public :: SERVICE_ACTIVE    =  #00000001
integer, parameter, public :: SERVICE_INACTIVE  =  #00000002
!integer, parameter, public :: SERVICE_STATE_ALL = IOR(SERVICE_ACTIVE, SERVICE_INACTIVE)

! 
!  Controls
! 
integer, parameter, public :: SERVICE_CONTROL_STOP          =  #00000001
integer, parameter, public :: SERVICE_CONTROL_PAUSE         =  #00000002
integer, parameter, public :: SERVICE_CONTROL_CONTINUE      =  #00000003
integer, parameter, public :: SERVICE_CONTROL_INTERROGATE   =  #00000004
integer, parameter, public :: SERVICE_CONTROL_SHUTDOWN      =  #00000005

! 
!  Service State -- for CurrentState
! 
integer, parameter, public :: SERVICE_STOPPED           =  #00000001
integer, parameter, public :: SERVICE_START_PENDING     =  #00000002
integer, parameter, public :: SERVICE_STOP_PENDING      =  #00000003
integer, parameter, public :: SERVICE_RUNNING           =  #00000004
integer, parameter, public :: SERVICE_CONTINUE_PENDING  =  #00000005
integer, parameter, public :: SERVICE_PAUSE_PENDING     =  #00000006
integer, parameter, public :: SERVICE_PAUSED            =  #00000007

! 
!  Controls Accepted  (Bit Mask)
! 
integer, parameter, public :: SERVICE_ACCEPT_STOP           =  #00000001
integer, parameter, public :: SERVICE_ACCEPT_PAUSE_CONTINUE =  #00000002
integer, parameter, public :: SERVICE_ACCEPT_SHUTDOWN       =  #00000004

! 
!  Service Control Manager object specific access types
! 
integer, parameter, public :: SC_MANAGER_CONNECT            =  #0001
integer, parameter, public :: SC_MANAGER_CREATE_SERVICE     =  #0002
integer, parameter, public :: SC_MANAGER_ENUMERATE_SERVICE  =  #0004
integer, parameter, public :: SC_MANAGER_LOCK               =  #0008
integer, parameter, public :: SC_MANAGER_QUERY_LOCK_STATUS  =  #0010
integer, parameter, public :: SC_MANAGER_MODIFY_BOOT_CONFIG =  #0020


! 
!  Service object specific access type
! 
integer, parameter, public :: SERVICE_QUERY_CONFIG          =  #0001
integer, parameter, public :: SERVICE_CHANGE_CONFIG         =  #0002
integer, parameter, public :: SERVICE_QUERY_STATUS          =  #0004
integer, parameter, public :: SERVICE_ENUMERATE_DEPENDENTS  =  #0008
integer, parameter, public :: SERVICE_START                 =  #0010
integer, parameter, public :: SERVICE_STOP                  =  #0020
integer, parameter, public :: SERVICE_PAUSE_CONTINUE        =  #0040
integer, parameter, public :: SERVICE_INTERROGATE           =  #0080
integer, parameter, public :: SERVICE_USER_DEFINED_CONTROL  =  #0100

! 
!  Handle Types
! 



! 
!  Service Status Structure
! 
type  T_SERVICE_STATUS
    integer dwServiceType 
    integer dwCurrentState 
    integer dwControlsAccepted 
    integer dwWin32ExitCode 
    integer dwServiceSpecificExitCode 
    integer dwCheckPoint 
    integer dwWaitHint 
end type  T_SERVICE_STATUS



! 
!  Service Status Enumeration Structure
! 

type  T_ENUM_SERVICE_STATUS
    integer lpServiceName 
    integer lpDisplayName 
    type (T_SERVICE_STATUS) ServiceStatus 
end type  T_ENUM_SERVICE_STATUS


! 
!  Structures for the Lock API functions
! 

type  T_QUERY_SERVICE_LOCK_STATUS
    integer fIsLocked 
    integer lpLockOwner 
    integer dwLockDuration 
end type  T_QUERY_SERVICE_LOCK_STATUS

! 
!  Query Service Configuration Structure
! 

type  T_QUERY_SERVICE_CONFIG
    integer dwServiceType 
    integer dwStartType 
    integer dwErrorControl 
    integer lpBinaryPathName 
    integer lpLoadOrderGroup 
    integer dwTagId 
    integer lpDependencies 
    integer lpServiceStartName 
    integer lpDisplayName 
end type  T_QUERY_SERVICE_CONFIG


! 
!  Function Prototype for the Service Main Function
! 
! 
!  Service Start Table
! 

type T_SERVICE_TABLE_ENTRY
    integer lpServiceName 
    integer lpServiceProc 
end type T_SERVICE_TABLE_ENTRY



!                               *****MMSYSTEM******


!     If defined, the following flags inhibit inclusion
!  *    of the indicated items:
!  *
!  *      MMNODRV          - Installable driver support
!  *      MMNOSOUND        - Sound support
!  *      MMNOWAVE         - Waveform support
!  *      MMNOMIDI         - MIDI support
!  *      MMNOAUX          - Auxiliary audio support
!  *      MMNOTIMER        - Timer support
!  *      MMNOJOY          - Joystick support
!  *      MMNOMCI          - MCI support
!  *      MMNOMMIO         - Multimedia file I!O support
!  *      MMNOMMSYSTEM     - General MMSYSTEM functions
!  
!

!MS$IF .NOT. DEFINED (MMSYSTEM_)
!MS$DEFINE MMSYSTEM_

! ***************************************************************************
! 
!                     General constants and data types
! 
! ***************************************************************************
!

!   general constants   
integer, parameter, public :: MAXPNAMELEN    = 32     ! max product name length (including NULL)
integer, parameter, public :: MAXERRORLENGTH = 128    ! max error text length (including final NULL)

!MS$ IF DEFINED ( MM_MICROSOFT)
integer, parameter, public :: MM_MICROSOFT            = 1        ! Microsoft Corporation
!MS$ ENDIF ! MM_MICROSOFT

!* product IDs *!
!MS$ IF .NOT. DEFINED (MM_MIDI_MAPPER)
integer, parameter, public :: MM_MIDI_MAPPER          = 1       ! MIDI Mapper
integer, parameter, public :: MM_WAVE_MAPPER          = 2       ! Wave Mapper

integer, parameter, public :: MM_SNDBLST_MIDIOUT      = 3       ! Sound Blaster MIDI output port
integer, parameter, public :: MM_SNDBLST_MIDIIN       = 4       ! Sound Blaster MIDI input port
integer, parameter, public :: MM_SNDBLST_SYNTH        = 5       ! Sound Blaster internal synthesizer
integer, parameter, public :: MM_SNDBLST_WAVEOUT      = 6       ! Sound Blaster waveform output
integer, parameter, public :: MM_SNDBLST_WAVEIN       = 7       ! Sound Blaster waveform input

integer, parameter, public :: MM_ADLIB                = 9       ! Ad Lib-compatible synthesizer

integer, parameter, public :: MM_MPU401_MIDIOUT       = 10      ! MPU401-compatible MIDI output port
integer, parameter, public :: MM_MPU401_MIDIIN        = 11      ! MPU401-compatible MIDI input port

integer, parameter, public :: MM_PC_JOYSTICK          = 12      ! Joystick adapter
!MS$ ENDIF ! MM_MIDI_MAPPER



!   general data types   

! **************************************************************************
! *   Multimedia time
! **************************************************************************
!
type T_MMTIME$U_SMPTE        ! SMPTE
   BYTE hour               ! hours
   BYTE min                ! minutes  (min is also a macro, so what?)
   BYTE sec                ! seconds
   BYTE frame              ! frames
   BYTE fps                ! frames per second (24, 25, 29(30 drop) or 30)
   BYTE dummy
end type T_MMTIME$U_SMPTE

type T_MMTIME$U_MIDI            ! MIDI
   integer(4)  songptrpos     ! song pointer position
end type T_MMTIME$U_MIDI


type T_MMTIME$U
   union
      map
         integer(4)  ms               ! milliseconds
      end map
      map
         integer(4)  sample           ! samples
      end map
      map
         integer(4)  cb               ! byte count
      end map
      map
         type(T_MMTIME$U_SMPTE)    smpte
      end map
      map
         type(T_MMTIME$U_MIDI)     midi
      end map
   end union
end type T_MMTIME$U


type T_MMTIME
     integer(4)         wType              ! the contents of the union
     type (T_MMTIME$U)    u
end type T_MMTIME

!  values for wType field in T_MMTIME struct
integer, parameter, public :: TIME_MS        =  #0001  ! time in Milliseconds
integer, parameter, public :: TIME_SAMPLES   =  #0002  ! number of wave samples
integer, parameter, public :: TIME_BYTES     =  #0004  ! current byte offset
integer, parameter, public :: TIME_SMPTE     =  #0008  ! SMPTE time
integer, parameter, public :: TIME_MIDI      =  #0010  ! MIDI time
integer, parameter, public :: TIME_TICKS     =  #0020  ! Ticks within MIDI stream

! ***************************************************************************
! *                   Multimedia Window Messages
! ***************************************************************************
!

integer, parameter, public :: MM_JOY1MOVE       =  #3A0           ! joystick
integer, parameter, public :: MM_JOY2MOVE       =  #3A1
integer, parameter, public :: MM_JOY1ZMOVE      =  #3A2
integer, parameter, public :: MM_JOY2ZMOVE      =  #3A3
integer, parameter, public :: MM_JOY1BUTTONDOWN =  #3B5
integer, parameter, public :: MM_JOY2BUTTONDOWN =  #3B6
integer, parameter, public :: MM_JOY1BUTTONUP   =  #3B7
integer, parameter, public :: MM_JOY2BUTTONUP   =  #3B8

integer, parameter, public :: MM_MCINOTIFY   =  #3B9           ! MCI

integer, parameter, public :: MM_WOM_OPEN    =  #3BB           ! waveform output
integer, parameter, public :: MM_WOM_CLOSE   =  #3BC
integer, parameter, public :: MM_WOM_DONE    =  #3BD

integer, parameter, public :: MM_WIM_OPEN    =  #3BE           ! waveform input
integer, parameter, public :: MM_WIM_CLOSE   =  #3BF
integer, parameter, public :: MM_WIM_DATA    =  #3C0

integer, parameter, public :: MM_MIM_OPEN       =  #3C1           ! MIDI input
integer, parameter, public :: MM_MIM_CLOSE      =  #3C2
integer, parameter, public :: MM_MIM_DATA       =  #3C3
integer, parameter, public :: MM_MIM_LONGDATA   =  #3C4
integer, parameter, public :: MM_MIM_ERROR      =  #3C5
integer, parameter, public :: MM_MIM_LONGERROR  =  #3C6

integer, parameter, public :: MM_MOM_OPEN           =  #3C7           ! MIDI output
integer, parameter, public :: MM_MOM_CLOSE          =  #3C8
integer, parameter, public :: MM_MOM_DONE           =  #3C9
integer, parameter, public :: MM_MCISYSTEM_STRING   =  #3CA


integer, parameter, public :: MM_MIXM_LINE_CHANGE     = #3D0   ! mixer line change notify
integer, parameter, public :: MM_MIXM_CONTROL_CHANGE  = #3D1   ! mixer control change notify

! ***************************************************************************
! 
!                 String resource number bases (internal use)
! 
! ***************************************************************************
!


integer, parameter, public :: MMSYSERR_BASE  = 0
integer, parameter, public :: WAVERR_BASE    = 32
integer, parameter, public :: MIDIERR_BASE   = 64
integer, parameter, public :: TIMERR_BASE    = 96   ! was 128, changed to match Win 31 Sonic
integer, parameter, public :: JOYERR_BASE    = 160
integer, parameter, public :: MCIERR_BASE    = 256

integer, parameter, public :: MCI_STRING_OFFSET = 512  ! if this number is changed you MUST
                                                       ! alter the MCI_DEVTYPE_... list below
integer, parameter, public :: MIXERR_BASE       = 1024
integer, parameter, public :: MCI_VD_OFFSET     = 1024
integer, parameter, public :: MCI_CD_OFFSET     = 1088
integer, parameter, public :: MCI_WAVE_OFFSET   = 1152
integer, parameter, public :: MCI_SEQ_OFFSET    = 1216

! ***************************************************************************
! 
!                         General error return values
! 
! ***************************************************************************
!


integer, parameter, public :: MMSYSERR_NOERROR = 0                    ! no error
integer, parameter, public :: MMSYSERR_ERROR        = (MMSYSERR_BASE + 1)  !  unspecified error
integer, parameter, public :: MMSYSERR_BADDEVICEID  = (MMSYSERR_BASE + 2)  !  device ID out of range
integer, parameter, public :: MMSYSERR_NOTENABLED   = (MMSYSERR_BASE + 3)  !  driver failed enable
integer, parameter, public :: MMSYSERR_ALLOCATED    = (MMSYSERR_BASE + 4)  !  device already allocated
integer, parameter, public :: MMSYSERR_INVALHANDLE  = (MMSYSERR_BASE + 5)  !  device handle is invalid
integer, parameter, public :: MMSYSERR_NODRIVER     = (MMSYSERR_BASE + 6)  !  no device driver present
integer, parameter, public :: MMSYSERR_NOMEM        = (MMSYSERR_BASE + 7)  !  memory allocation error
integer, parameter, public :: MMSYSERR_NOTSUPPORTED = (MMSYSERR_BASE + 8)  !  function isn't supported
integer, parameter, public :: MMSYSERR_BADERRNUM    = (MMSYSERR_BASE + 9)  !  error value out of range
integer, parameter, public :: MMSYSERR_INVALFLAG    = (MMSYSERR_BASE + 10) !  invalid flag passed
integer, parameter, public :: MMSYSERR_INVALPARAM   = (MMSYSERR_BASE + 11) !  invalid parameter passed
integer, parameter, public :: MMSYSERR_HANDLEBUSY   = (MMSYSERR_BASE + 12) !  handle being used
                                                   !  simultaneously on another
                                                   !  thread (eg callback)
integer, parameter, public :: MMSYSERR_INVALIDALIAS = (MMSYSERR_BASE + 13) !  "Specified alias not found in WIN.INI
integer, parameter, public :: MMSYSERR_LASTERROR    = (MMSYSERR_BASE + 13) !  last error in range

!MS$IF .NOT. DEFINED (MMNODRV)
! ***************************************************************************
! 
!                         Installable driver support
! 
! ***************************************************************************
!

!MS$IF .NOT. DEFINED (DRV_LOAD)
!   Driver messages   
integer, parameter, public :: DRV_LOAD              =  #0001
integer, parameter, public :: DRV_ENABLE            =  #0002
integer, parameter, public :: DRV_OPEN              =  #0003
integer, parameter, public :: DRV_CLOSE             =  #0004
integer, parameter, public :: DRV_DISABLE           =  #0005
integer, parameter, public :: DRV_FREE              =  #0006
integer, parameter, public :: DRV_CONFIGURE         =  #0007
integer, parameter, public :: DRV_QUERYCONFIGURE    =  #0008
integer, parameter, public :: DRV_INSTALL           =  #0009
integer, parameter, public :: DRV_REMOVE            =  #000A
integer, parameter, public :: DRV_EXITSESSION       =  #000B
integer, parameter, public :: DRV_POWER             =  #000F
integer, parameter, public :: DRV_RESERVED          =  #0800
integer, parameter, public :: DRV_USER              =  #4000


!   Supported return values for DRV_CONFIGURE message   
integer, parameter, public :: DRVCNF_CANCEL  =  #0000
integer, parameter, public :: DRVCNF_OK      =  #0001
integer, parameter, public :: DRVCNF_RESTART =  #0002

!  return values from DriverProc() function
integer, parameter, public :: DRV_CANCEL  = DRVCNF_CANCEL
integer, parameter, public :: DRV_OK      = DRVCNF_OK
integer, parameter, public :: DRV_RESTART = DRVCNF_RESTART

integer, parameter, public :: DRV_MCI_FIRST = DRV_RESERVED
integer, parameter, public :: DRV_MCI_LAST  = (DRV_RESERVED + #FFF)

!MS$ENDIF   ! DRV_LOAD
!MS$ENDIF   ! MMNODRV

! ***************************************************************************
! 
!                           Driver callback support
! 
! ***************************************************************************
!


!  flags used with waveOutOpen(), waveInOpen(), midiInOpen(), and
!  midiOutOpen() to specify the type of the dwCallback parameter.
integer, parameter, public :: CALLBACK_TYPEMASK =  #00070000    ! callback type mask
integer, parameter, public :: CALLBACK_NULL     =  #00000000    ! no callback
integer, parameter, public :: CALLBACK_WINDOW   =  #00010000    ! dwCallback is a HWND
integer, parameter, public :: CALLBACK_TASK     =  #00020000    ! dwCallback is a HTASK
integer, parameter, public :: CALLBACK_FUNCTION =  #00030000    ! dwCallback is a FARPROC


!  driver callback prototypes



! ***************************************************************************
! 
!                          Manufacturer and product IDs
! 
!     Used with wMid and wPid fields in T_WAVEOUTCAPS, T_WAVEINCAPS,
!     T_MIDIOUTCAPS, T_MIDIINCAPS, T_AUXCAPS, T_JOYCAPS structures.
! 
! ***************************************************************************


!  manufacturer IDs
integer, parameter, public :: MM_MICROSOFT = 1       ! Microsoft Corp.


! ***************************************************************************
! *                    General MMSYSTEM support
! ***************************************************************************
!
!  flag values for uFlags parameter
! *** These are the Win3.1 values ***
!  *  #define SND_SYNC            #0000  ! play synchronously (default)
!  *  #define SND_ASYNC           #0001  ! play asynchronously
!  *  #define SND_NODEFAULT       #0002  ! don't use default sound
!  *  #define SND_MEMORY          #0004  ! lpszSoundName points to a memory file
!  *  #define SND_LOOP            #0008  ! loop the sound until next sndPlaySound
!  *  #define SND_NOSTOP          #0010  ! don't stop any currently playing sound
!  * NT defines some additional flags.
!  *************


integer, parameter, public :: SND_SYNC       =  #00000000   ! play synchronously (default)
integer, parameter, public :: SND_ASYNC      =  #00000001   ! play asynchronously

integer, parameter, public :: SND_NODEFAULT  =  #00000002   ! silence not default, if sound not found

integer, parameter, public :: SND_MEMORY     =  #00000004   ! lpszSoundName points to a memory file
integer, parameter, public :: SND_ALIAS      =  #00010000   ! name is a WIN.INI [sounds] entry
integer, parameter, public :: SND_FILENAME   =  #00020000   ! name is a file name
integer, parameter, public :: SND_RESOURCE   =  #00040004   ! name is a resource name or atom

integer, parameter, public :: SND_ALIAS_ID   =  #00110000   ! name is a WIN.INI [sounds] entry identifier
integer, parameter, public :: SND_ALIAS_START = 0      ! must be > 4096 to keep strings in same section of resource file

!***************************************************************************
!Following are defined in macro.f90

!  sndAlias creates the alias identifier
!#define sndAlias( ch0, ch1 ) \
!                ( SND_ALIAS_START + (DWORD)(BYTE)(ch0) | ( (DWORD)(BYTE)(ch1) << 8 ))

!integer, parameter, public :: SND_ALIAS_SYSTEMASTERISK        = sndAlias('S', '*')
!integer, parameter, public :: SND_ALIAS_SYSTEMQUESTION        = sndAlias('S', '?')
!integer, parameter, public :: SND_ALIAS_SYSTEMHAND            = sndAlias('S', 'H')
!integer, parameter, public :: SND_ALIAS_SYSTEMEXIT            = sndAlias('S', 'E')
!integer, parameter, public :: SND_ALIAS_SYSTEMSTART           = sndAlias('S', 'S')
!integer, parameter, public :: SND_ALIAS_SYSTEMWELCOME         = sndAlias('S', 'W')
!integer, parameter, public :: SND_ALIAS_SYSTEMEXCLAMATION     = sndAlias('S', '!')
!integer, parameter, public :: SND_ALIAS_SYSTEMDEFAULT         = sndAlias('S', 'D')
!*******************************************************************************

integer, parameter, public :: SND_LOOP    =  #00000008   ! loop the sound until next sndPlaySound
integer, parameter, public :: SND_NOSTOP  =  #00000010   ! don't stop any currently playing sound
integer, parameter, public :: SND_VALID   =  #0000001F  ! valid flags          !  ;Internal   

integer, parameter, public :: SND_NOWAIT     =  #00002000   ! don't wait if the driver is busy
integer, parameter, public :: SND_VALIDFLAGS =  #0017201F   ! Set of valid flag bits.  Anything outside
                                             !  this range will raise an error

integer, parameter, public :: SND_RESERVED   =  #FF000000 !-16777215    ! In particular these flags are reserved
integer, parameter, public :: SND_TYPE_MASK  =  #00170007

! ***************************************************************************
! 
!                         Waveform audio support
! 
! ***************************************************************************
!


!  waveform audio error return values
integer, parameter, public :: WAVERR_BADFORMAT      = (WAVERR_BASE + 0)    !  unsupported wave format
integer, parameter, public :: WAVERR_STILLPLAYING   = (WAVERR_BASE + 1)    !  still something playing
integer, parameter, public :: WAVERR_UNPREPARED     = (WAVERR_BASE + 2)    !  header not prepared
integer, parameter, public :: WAVERR_SYNC           = (WAVERR_BASE + 3)    !  device is synchronous
integer, parameter, public :: WAVERR_LASTERROR      = (WAVERR_BASE + 3)    !  last error in range

!  waveform audio data types

!  wave callback messages
integer, parameter, public :: WOM_OPEN    = MM_WOM_OPEN
integer, parameter, public :: WOM_CLOSE   = MM_WOM_CLOSE
integer, parameter, public :: WOM_DONE    = MM_WOM_DONE
integer, parameter, public :: WIM_OPEN    = MM_WIM_OPEN
integer, parameter, public :: WIM_CLOSE   = MM_WIM_CLOSE
integer, parameter, public :: WIM_DATA    = MM_WIM_DATA

!  device ID for wave device mapper
integer, parameter, public :: WAVE_MAPPER     = ((-1))

!  flags for dwFlags parameter in waveOutOpen() and waveInOpen()
integer, parameter, public :: WAVE_FORMAT_QUERY =  #00000001
integer, parameter, public :: WAVE_ALLOWSYNC    =  #00000002

!  wave data block header
type  T_WAVEHDR
    integer lpData            !  pointer to locked data buffer
    integer dwBufferLength    !  length of data buffer
    integer dwBytesRecorded   !  used for input only
    integer dwUser            !  for client's use
    integer dwFlags           !  assorted flags (see defines)
    integer dwLoops           !  loop control counter
    integer lpNext            !  reserved for driver
    integer reserved          !  reserved for driver
end type  T_WAVEHDR

!  flags for dwFlags field of T_WAVEHDR
integer, parameter, public :: WHDR_DONE      =  #00000001  ! done bit
integer, parameter, public :: WHDR_PREPARED  =  #00000002  ! set if this header has been prepared
integer, parameter, public :: WHDR_BEGINLOOP =  #00000004  ! loop start block
integer, parameter, public :: WHDR_ENDLOOP   =  #00000008  ! loop end block
integer, parameter, public :: WHDR_INQUEUE   =  #00000010  ! reserved for driver

!  waveform output device capabilities structure
type  T_WAVEOUTCAPS
    integer(2) wMid                          !  manufacturer ID
    integer(2) wPid                          !  product ID
    integer vDriverVersion                   !  version of the driver
    character szPname (MAXPNAMELEN )         !  product name (NULL terminated string)
    integer dwFormats                        !  formats supported
    integer(2) wChannels                     !  number of sources supported
    integer dwSupport                        !  functionality supported by driver
end type  T_WAVEOUTCAPS

!  waveform output device capabilities structure


!  flags for dwSupport field of T_WAVEOUTCAPS
integer, parameter, public :: WAVECAPS_PITCH          =  #00000001  ! supports pitch control
integer, parameter, public :: WAVECAPS_PLAYBACKRATE   =  #00000002  ! supports playback rate control
integer, parameter, public :: WAVECAPS_VOLUME         =  #00000004  ! supports volume control
integer, parameter, public :: WAVECAPS_LRVOLUME       =  #00000008  ! separate left-right volume control
integer, parameter, public :: WAVECAPS_SYNC           =  #00000010

!  waveform input device capabilities structure
type  T_WAVEINCAPS
    integer(2) wMid                       !  manufacturer ID
    integer(2) wPid                       !  product ID
    integer vDriverVersion                !  version of the driver
    character szPname (MAXPNAMELEN )      !  product name (NULL terminated string)
    integer dwFormats                     !  formats supported
    integer(2) wChannels                  !  number of channels supported
end type  T_WAVEINCAPS

!  waveform input device capabilities structure

!  defines for dwFormat field of T_WAVEINCAPS and T_WAVEOUTCAPS
integer, parameter, public :: WAVE_INVALIDFORMAT =  #00000000       ! invalid format
integer, parameter, public :: WAVE_FORMAT_1M08 =  #00000001       ! 11.025 kHz, Mono,   8-bit
integer, parameter, public :: WAVE_FORMAT_1S08 =  #00000002       ! 11.025 kHz, Stereo, 8-bit
integer, parameter, public :: WAVE_FORMAT_1M16 =  #00000004       ! 11.025 kHz, Mono,   16-bit
integer, parameter, public :: WAVE_FORMAT_1S16 =  #00000008       ! 11.025 kHz, Stereo, 16-bit
integer, parameter, public :: WAVE_FORMAT_2M08 =  #00000010       ! 22.05  kHz, Mono,   8-bit
integer, parameter, public :: WAVE_FORMAT_2S08 =  #00000020       ! 22.05  kHz, Stereo, 8-bit
integer, parameter, public :: WAVE_FORMAT_2M16 =  #00000040       ! 22.05  kHz, Mono,   16-bit
integer, parameter, public :: WAVE_FORMAT_2S16 =  #00000080       ! 22.05  kHz, Stereo, 16-bit
integer, parameter, public :: WAVE_FORMAT_4M08 =  #00000100       ! 44.1   kHz, Mono,   8-bit
integer, parameter, public :: WAVE_FORMAT_4S08 =  #00000200       ! 44.1   kHz, Stereo, 8-bit
integer, parameter, public :: WAVE_FORMAT_4M16 =  #00000400       ! 44.1   kHz, Mono,   16-bit
integer, parameter, public :: WAVE_FORMAT_4S16 =  #00000800       ! 44.1   kHz, Stereo, 16-bit

!  flags for wFormatTag field of T_WAVEFORMAT
integer, parameter, public :: WAVE_FORMAT_PCM = 1  ! Needed in resource files so outside #ifndef RC_INVOKED

!  general waveform format (information common to all formats)
!  as read from a file.  See Multimedia file formats in Programmer Reference

type  T_WAVEFORMAT
   integer(2)  wFormatTag          !  format type
   integer(2)  nChannels          !  number of channels (i.e. mono, stereo, etc.)
   integer nSamplesPerSec           !  sample rate
   integer nAvgBytesPerSec          !  for buffer estimation
   integer(2)  nBlockAlign        !  block size of data
end type  T_WAVEFORMAT

!  NOTE:  The fields in the structure above are copied into
!  the T_MCI_WAVE_SET_PARMS structure during execution

!  specific waveform format for PCM data
type  T_PCMWAVEFORMAT
    type (T_WAVEFORMAT) wf 
    integer(2) wBitsPerSample      !  corresponds to MCI_WAVE_SET_.... structure
end type  T_PCMWAVEFORMAT


! *
! *  extended waveform format structure used for all non-PCM formats. this
! *  structure is common to all non-PCM formats.
! *
type T_WAVEFORMATEX
   integer(2)  wFormatTag          !  format type
   integer(2)  nChannels           !  number of channels (i.e. mono, stereo...)
   integer(4)  nSamplesPerSec      !  sample rate
   integer(4)  nAvgBytesPerSec     !  for buffer estimation
   integer(2)  nBlockAlign         !  block size of data
   integer(2)  wBitsPerSample      !  number of bits per sample of mono data
   integer(2)  cbSize              !  the count in bytes of the size of
                                   !  extra information (after cbSize)
end type T_WAVEFORMATEX


! ***************************************************************************
! 
!                             MIDI audio support
! 
! ***************************************************************************
!


!  MIDI error return values
integer, parameter, public :: MIDIERR_UNPREPARED    = (MIDIERR_BASE + 0)   !   header not prepared   
integer, parameter, public :: MIDIERR_STILLPLAYING  = (MIDIERR_BASE + 1)   !   still something playing   
integer, parameter, public :: MIDIERR_NOMAP         = (MIDIERR_BASE + 2)   !   no current map   
integer, parameter, public :: MIDIERR_NOTREADY      = (MIDIERR_BASE + 3)   !   hardware is still busy   
integer, parameter, public :: MIDIERR_NODEVICE      = (MIDIERR_BASE + 4)   !   port no longer connected   
integer, parameter, public :: MIDIERR_INVALIDSETUP  = (MIDIERR_BASE + 5)   !   invalid setup   
integer, parameter, public :: MIDIERR_BADOPENMPDE   = (MIDIERR_BASE + 5)   !   operation unsupported w! open mode
integer, parameter, public :: MIDIERR_LASTERROR     = (MIDIERR_BASE + 5)   !   last error in range   

!  MIDI audio data types
integer, parameter, public :: MIDIPATCHSIZE = 128

!  MIDI callback messages
integer, parameter, public :: MIM_OPEN = MM_MIM_OPEN
integer, parameter, public :: MIM_CLOSE = MM_MIM_CLOSE
integer, parameter, public :: MIM_DATA = MM_MIM_DATA
integer, parameter, public :: MIM_LONGDATA = MM_MIM_LONGDATA
integer, parameter, public :: MIM_ERROR = MM_MIM_ERROR
integer, parameter, public :: MIM_LONGERROR = MM_MIM_LONGERROR
integer, parameter, public :: MOM_OPEN = MM_MOM_OPEN
integer, parameter, public :: MOM_CLOSE = MM_MOM_CLOSE
integer, parameter, public :: MOM_DONE = MM_MOM_DONE

!  device ID for MIDI mapper
integer, parameter, public :: MIDIMAPPER = (-1)       !  Cannot be cast to DWORD as RC complains   
integer, parameter, public :: MIDI_MAPPER    = (-1)

!  flags for wFlags parm of midiOutCachePatches(), midiOutCacheDrumPatches()
integer, parameter, public :: MIDI_CACHE_ALL = 1
integer, parameter, public :: MIDI_CACHE_BESTFIT = 2
integer, parameter, public :: MIDI_CACHE_QUERY = 3
integer, parameter, public :: MIDI_UNCACHE = 4

!  MIDI output device capabilities structure
type  T_MIDIOUTCAPS
    integer(2)  wMid                    !  manufacturer ID
    integer(2)  wPid                    !  product ID
    integer     vDriverVersion          !  version of the driver
    character   szPname (MAXPNAMELEN )  !  product name (NULL terminated string)
    integer(2)  wTechnology             !  type of device
    integer(2)  wVoices                 !  # of voices (internal synth only)
    integer(2)  wNotes                  !  max # of notes (internal synth only)
    integer(2)  wChannelMask            !  channels used (internal synth only)
    integer     dwSupport               !  functionality supported by driver
end type  T_MIDIOUTCAPS
!  MIDI output device capabilities structure


!  flags for wTechnology field of T_MIDIOUTCAPS structure
integer, parameter, public :: MOD_MIDIPORT = 1  ! output port
integer, parameter, public :: MOD_SYNTH = 2  ! generic internal synth
integer, parameter, public :: MOD_SQSYNTH = 3  ! square wave internal synth
integer, parameter, public :: MOD_FMSYNTH = 4  ! FM internal synth
integer, parameter, public :: MOD_MAPPER = 5  ! MIDI mapper

!  flags for dwSupport field of T_MIDIOUTCAPS
integer, parameter, public :: MIDICAPS_VOLUME =  #00000001  ! supports volume control
integer, parameter, public :: MIDICAPS_LRVOLUME =  #00000002  ! separate left-right volume control
integer, parameter, public :: MIDICAPS_CACHE =  #00000004

!  MIDI input device capabilities structure
type  T_MIDIINCAPS
    integer(2)  wMid                    !  manufacturer ID
    integer(2)  wPid                    !  product ID
    integer     vDriverVersion          !  version of the driver
    character   szPname (MAXPNAMELEN )  !  product name (NULL terminated string)
end type  T_MIDIINCAPS
!  MIDI input device capabilities structure


!  MIDI data block header
type  T_MIDIHDR
    integer lpData                 !  pointer to locked data block
    integer dwBufferLength         !  length of data in data block
    integer dwBytesRecorded        !  used for input only
    integer dwUser                 !  for client's use
    integer dwFlags                !  assorted flags (see defines)
    integer lpNext                 !  reserved for driver
    integer reserved               !  reserved for driver
end type  T_MIDIHDR

!  flags for dwFlags field of T_MIDIHDR structure
integer, parameter, public :: MHDR_DONE =  #00000001       ! done bit
integer, parameter, public :: MHDR_PREPARED =  #00000002       ! set if header prepared
integer, parameter, public :: MHDR_INQUEUE =  #00000004       ! reserved for driver

! ***************************************************************************
! 
!                         Auxiliary audio support
! 
! ***************************************************************************
!


!  device ID for aux device mapper
integer, parameter, public :: AUX_MAPPER     = ((-1))

!  Auxiliary audio device capabilities structure
type  T_AUXCAPS
    integer(2)  wMid                   !  manufacturer ID
    integer(2)  wPid                   !  product ID
    integer     vDriverVersion         !  version of the driver
    character   szPname (MAXPNAMELEN ) !  product name (NULL terminated string)
    integer(2)  wTechnology            !  type of device
    integer     dwSupport              !  functionality supported by driver
end type  T_AUXCAPS
!  Auxiliary audio device capabilities structure


!  flags for wTechnology field in T_AUXCAPS structure
integer, parameter, public :: AUXCAPS_CDAUDIO = 1       ! audio from internal CD-ROM drive
integer, parameter, public :: AUXCAPS_AUXIN = 2       ! audio from auxiliary input jacks

!  flags for dwSupport field in T_AUXCAPS structure
integer, parameter, public :: AUXCAPS_VOLUME =  #00000001   ! supports volume control
integer, parameter, public :: AUXCAPS_LRVOLUME =  #00000002   ! separate left-right volume control

! ***************************************************************************
! 
!                             Timer support
! 
! ***************************************************************************
!


!  timer error return values
integer, parameter, public :: TIMERR_NOERROR = (0)                  ! no error
integer, parameter, public :: TIMERR_NOCANDO        = (TIMERR_BASE+1)      !  request not completed
integer, parameter, public :: TIMERR_STRUCT         = (TIMERR_BASE+33)     !  time struct size

!  timer data types

!  flags for wFlags parameter of timeSetEvent() function
integer, parameter, public :: TIME_ONESHOT = 0   ! program timer for single event
integer, parameter, public :: TIME_PERIODIC = 1   ! program for continuous periodic event

!  timer device capabilities data structure
type  T_TIMECAPS
    integer wPeriodMin       !  minimum period supported
    integer wPeriodMax       !  maximum period supported
end type  T_TIMECAPS

! ***************************************************************************
! 
!                             Joystick support
! 
! ***************************************************************************
!
!  joystick error return values
integer, parameter, public :: JOYERR_NOERROR = (0)                  ! no error
integer, parameter, public :: JOYERR_PARMS          = (JOYERR_BASE+5)      !  bad parameters
integer, parameter, public :: JOYERR_NOCANDO        = (JOYERR_BASE+6)      !  request not completed
integer, parameter, public :: JOYERR_UNPLUGGED      = (JOYERR_BASE+7)      !  joystick is unplugged

!  constants used with T_JOYINFO structure and MM_JOY* messages
integer, parameter, public :: JOY_BUTTON1 =  #0001
integer, parameter, public :: JOY_BUTTON2 =  #0002
integer, parameter, public :: JOY_BUTTON3 =  #0004
integer, parameter, public :: JOY_BUTTON4 =  #0008
integer, parameter, public :: JOY_BUTTON1CHG =  #0100
integer, parameter, public :: JOY_BUTTON2CHG =  #0200
integer, parameter, public :: JOY_BUTTON3CHG =  #0400
integer, parameter, public :: JOY_BUTTON4CHG =  #0800

!  joystick ID constants
integer, parameter, public :: JOYSTICKID1 = 0
integer, parameter, public :: JOYSTICKID2 = 1

!  joystick device capabilities data structure
type  T_JOYCAPS
    integer(2) wMid                    !  manufacturer ID
    integer(2) wPid                    !  product ID
    character szPname (MAXPNAMELEN )      !  product name (NULL terminated string)
    integer wXmin                         !  minimum x position value
    integer wXmax                         !  maximum x position value
    integer wYmin                         !  minimum y position value
    integer wYmax                         !  maximum y position value
    integer wZmin                         !  minimum z position value
    integer wZmax                         !  maximum z position value
    integer wNumButtons                   !  number of buttons
    integer wPeriodMin                    !  minimum message period when captured
    integer wPeriodMax                    !  maximum message period when captured
end type  T_JOYCAPS

!  joystick information data structure
type  T_JOYINFO

    integer wXpos                   !  x position
    integer wYpos                   !  y position
    integer wZpos                   !  z position
    integer wButtons                !  button states
    
end type  T_JOYINFO

! ***************************************************************************
! 
!                         Multimedia File I!O support
! 
! ***************************************************************************
!


!  MMIO error return values
integer, parameter, public :: MMIOERR_BASE = 256
integer, parameter, public :: MMIOERR_FILENOTFOUND    = (MMIOERR_BASE + 1)  !  file not found
integer, parameter, public :: MMIOERR_OUTOFMEMORY     = (MMIOERR_BASE + 2)  !  out of memory
integer, parameter, public :: MMIOERR_CANNOTOPEN      = (MMIOERR_BASE + 3)  !  cannot open
integer, parameter, public :: MMIOERR_CANNOTCLOSE     = (MMIOERR_BASE + 4)  !  cannot close
integer, parameter, public :: MMIOERR_CANNOTREAD      = (MMIOERR_BASE + 5)  !  cannot read
integer, parameter, public :: MMIOERR_CANNOTWRITE     = (MMIOERR_BASE + 6)  !  cannot write
integer, parameter, public :: MMIOERR_CANNOTSEEK      = (MMIOERR_BASE + 7)  !  cannot seek
integer, parameter, public :: MMIOERR_CANNOTEXPAND    = (MMIOERR_BASE + 8)  !  cannot expand file
integer, parameter, public :: MMIOERR_CHUNKNOTFOUND   = (MMIOERR_BASE + 9)  !  chunk not found
integer, parameter, public :: MMIOERR_UNBUFFERED      = (MMIOERR_BASE + 10) !  file is unbuffered

!  MMIO constants
character, parameter, public :: CFSEPCHAR       = '+'             !  compound file name separator char.

!  MMIO data types

!  general MMIO information data structure
type  T_MMIOINFO       ! The MMIO state

!  general fields   
        integer dwFlags          !  general status flags
        integer fccIOProc        !  4 char id for the I!O procedure
        integer pIOProc          !  pointer to I!O procedure
        integer wErrorRet        !  place for error to be returned
        integer htask            !  alternate local task

!  fields maintained by MMIO functions during buffered I!O   
        integer cchBuffer        !  size of I!O buffer (or 0L)
        integer pchBuffer        !  start of I!O buffer (or NULL)
        integer pchNext          !  pointer to next byte to read!write
        integer pchEndRead       !  pointer to last valid byte to read
        integer pchEndWrite      !  pointer to last byte to write
        integer lBufOffset       !  disk offset of start of buffer

!  fields maintained by I!O procedure   
        integer lDiskOffset      !  disk offset of next read or write
        integer adwInfo (3 )     !  data specific to type of MMIOPROC

!  other fields maintained by MMIO   
        integer dwReserved1      !  reserved for MMIO use
        integer dwReserved2      !  reserved for MMIO use
        integer hmmio            !  handle to open file

end type  T_MMIOINFO

!  RIFF chunk information data structure
type  T_MMCKINFO
        integer ckid             !  chunk ID
        integer cksize           !  chunk size
        integer fccType          !  form type or list type
        integer dwDataOffset     !  offset of data portion of chunk
        integer dwFlags          !  flags used by MMIO functions
 end type  T_MMCKINFO

!   <dwFlags> field of T_MMIOINFO structure -- many same as OpenFile() flags   
!  Low word of flags will be passed to OpenFile() -- therefore, any MMIO-
!     specific flags should be in the high word.  
!

integer, parameter, public :: MMIO_RWMODE =  #00000003      ! mask to get bits used for opening
                                        !  file for reading!writing!both
integer, parameter, public :: MMIO_SHAREMODE =  #00000070      ! file sharing mode number

!  constants for dwFlags field of T_MMIOINFO
integer, parameter, public :: MMIO_CREATE =  #00001000      ! create new file (or truncate file)
integer, parameter, public :: MMIO_PARSE =  #00000100      ! parse new file returning path
integer, parameter, public :: MMIO_DELETE =  #00000200      ! create new file (or truncate file)
integer, parameter, public :: MMIO_EXIST =  #00004000      ! checks for existence of file
integer, parameter, public :: MMIO_ALLOCBUF =  #00010000      ! mmioOpen() should allocate a buffer
integer, parameter, public :: MMIO_GETTEMP =  #00020000      ! mmioOpen() should retrieve temp name

integer, parameter, public :: MMIO_DIRTY =  #10000000      ! I!O buffer is dirty
!   MMIO_DIRTY is also used in the <dwFlags> field of T_MMCKINFO structure   

integer, parameter, public :: MMIO_OPEN_VALID =  #0003FFFF      ! valid flags for mmioOpen !  ;Internal   

!   rea  write mode numbers (bit field MMIO_RWMODE) *!
integer, parameter, public :: MMIO_READ =  #00000000      ! open file for reading only
integer, parameter, public :: MMIO_WRITE =  #00000001      ! open file for writing only
integer, parameter, public :: MMIO_READWRITE =  #00000002      ! open file for reading and writing

!   share mode numbers (bit field MMIO_SHAREMODE)   
integer, parameter, public :: MMIO_COMPAT =  #00000000      ! compatibility mode
integer, parameter, public :: MMIO_EXCLUSIVE =  #00000010      ! exclusive-access mode
integer, parameter, public :: MMIO_DENYWRITE =  #00000020      ! deny writing to other processes
integer, parameter, public :: MMIO_DENYREAD =  #00000030      ! deny reading to other processes
integer, parameter, public :: MMIO_DENYNONE =  #00000040      ! deny nothing to other processes

!   flags for other functions   
integer, parameter, public :: MMIO_FHOPEN =  #0010  ! mmioClose(): keep file handle open
integer, parameter, public :: MMIO_EMPTYBUF =  #0010  ! mmioFlush(): empty the I!O buffer
integer, parameter, public :: MMIO_TOUPPER =  #0010  ! mmioStringToFOURCC(): cvt. to u-case
integer, parameter, public :: MMIO_INSTALLPROC =  #00010000  ! mmioInstallIOProc(): install MMIOProc
integer, parameter, public :: MMIO_GLOBALPROC =  #10000000  ! mmioInstallIOProc: install globally
integer, parameter, public :: MMIO_UNICODEPROC =  #01000000  ! mmioInstallIOProc(): Unicode MMIOProc
integer, parameter, public :: MMIO_REMOVEPROC =  #00020000  ! mmioInstallIOProc(): remove MMIOProc
integer, parameter, public :: MMIO_FINDPROC =  #00040000  ! mmioInstallIOProc(): find an MMIOProc
integer, parameter, public :: MMIO_FINDCHUNK =  #0010  ! mmioDescend(): find a chunk by ID
integer, parameter, public :: MMIO_FINDRIFF =  #0020  ! mmioDescend(): find a LIST chunk
                                        !  ???
integer, parameter, public :: MMIO_FINDLIST =  #0040  ! mmioDescend(): find a RIFF chunk
                                        !  ???
integer, parameter, public :: MMIO_CREATERIFF =  #0020  ! mmioCreateChunk(): make a LIST chunk
                                        !  ???
integer, parameter, public :: MMIO_CREATELIST =  #0040  ! mmioCreateChunk(): make a RIFF chunk
                                        !  ???

integer, parameter, public :: MMIO_VALIDPROC =  #11070000  ! valid for mmioInstallIOProc !  ;Internal   

!   message numbers for MMIOPROC   O procedure functions *!
integer, parameter, public :: MMIOM_READ      = MMIO_READ       !  read (must equal MMIO_READ!)
integer, parameter, public :: MMIOM_WRITE    = MMIO_WRITE       !  write (must equal MMIO_WRITE!)
integer, parameter, public :: MMIOM_SEEK = 2       ! seek to a new position in file
integer, parameter, public :: MMIOM_OPEN = 3       ! open file
integer, parameter, public :: MMIOM_CLOSE = 4       ! close file
integer, parameter, public :: MMIOM_WRITEFLUSH = 5       ! write and flush
integer, parameter, public :: MMIOM_RENAME = 6       ! rename specified file
integer, parameter, public :: MMIOM_USER =  #8000       ! beginning of user-defined messages

!   standard four character codes   
!$DEFINE FOURCC_RIFF     = mmioFOURCC('R', 'I', 'F', 'F')
!$DEFINE  FOURCC_LIST     = mmioFOURCC('L', 'I', 'S', 'T')
!integer, parameter, public :: FOURCC_RIFF     = mmioFOURCC('R', 'I', 'F', 'F')
!integer, parameter, public :: FOURCC_LIST     = mmioFOURCC('L', 'I', 'S', 'T')

!   four character codes used to identify standard built-in   O procedures *!
!$DEFINE FOURCC_DOS      = mmioFOURCC('D', 'O', 'S', ' ')
!$DEFINE  FOURCC_MEM      = mmioFOURCC('M', 'E', 'M', ' ')
!integer, parameter, public :: FOURCC_DOS      = mmioFOURCC('D', 'O', 'S', ' ')
!integer, parameter, public :: FOURCC_MEM      = mmioFOURCC('M', 'E', 'M', ' ')

!  flags for mmioSeek()
!MS$IF .NOT. DEFINED (SEEK_SET)
integer, parameter, public :: SEEK_SET = 0               ! seek to an absolute position
integer, parameter, public :: SEEK_CUR = 1               ! seek relative to current position
integer, parameter, public :: SEEK_END = 2               ! seek relative to end of file
!MS$ENDIF !!ifndef SEEK_SET

!   other constants   
integer, parameter, public :: MMIO_DEFAULTBUFFER = 8192    ! default buffer size

!   MMIO macros   
!#define mmioFOURCC( ch0, ch1, ch2, ch3 )                                \
!                ( (DWORD)(BYTE)(ch0) | ( (DWORD)(BYTE)(ch1) << 8 ) |    \
!                ( (DWORD)(BYTE)(ch2) << 16 ) | ( (DWORD)(BYTE)(ch3) << 24 ) )
!  This macro is machine byte-sex and word-sex dependent!!
!  The characters are BYTES, so compatible with ANSI, not at all with UNICODE


!  THIS NUMBER IS HARDCODED WHERE THE MCI_FORMAT_<x>'s ARE #define'd
!  You must change those definitions if you change this number

!   MCI error return values
integer, parameter, public :: MCIERR_INVALID_DEVICE_ID        = (MCIERR_BASE + 1)
integer, parameter, public :: MCIERR_UNRECOGNIZED_KEYWORD     = (MCIERR_BASE + 3)
integer, parameter, public :: MCIERR_UNRECOGNIZED_COMMAND     = (MCIERR_BASE + 5)
integer, parameter, public :: MCIERR_HARDWARE                 = (MCIERR_BASE + 6)
integer, parameter, public :: MCIERR_INVALID_DEVICE_NAME      = (MCIERR_BASE + 7)
integer, parameter, public :: MCIERR_OUT_OF_MEMORY            = (MCIERR_BASE + 8)
integer, parameter, public :: MCIERR_DEVICE_OPEN              = (MCIERR_BASE + 9)
integer, parameter, public :: MCIERR_CANNOT_LOAD_DRIVER       = (MCIERR_BASE + 10)
integer, parameter, public :: MCIERR_MISSING_COMMAND_STRING   = (MCIERR_BASE + 11)
integer, parameter, public :: MCIERR_PARAM_OVERFLOW           = (MCIERR_BASE + 12)
integer, parameter, public :: MCIERR_MISSING_STRING_ARGUMENT  = (MCIERR_BASE + 13)
integer, parameter, public :: MCIERR_BAD_INTEGER              = (MCIERR_BASE + 14)
integer, parameter, public :: MCIERR_PARSER_INTERNAL          = (MCIERR_BASE + 15)
integer, parameter, public :: MCIERR_DRIVER_INTERNAL          = (MCIERR_BASE + 16)
integer, parameter, public :: MCIERR_MISSING_PARAMETER        = (MCIERR_BASE + 17)
integer, parameter, public :: MCIERR_UNSUPPORTED_FUNCTION     = (MCIERR_BASE + 18)
integer, parameter, public :: MCIERR_FILE_NOT_FOUND           = (MCIERR_BASE + 19)
integer, parameter, public :: MCIERR_DEVICE_NOT_READY         = (MCIERR_BASE + 20)
integer, parameter, public :: MCIERR_INTERNAL                 = (MCIERR_BASE + 21)
integer, parameter, public :: MCIERR_DRIVER                   = (MCIERR_BASE + 22)
integer, parameter, public :: MCIERR_CANNOT_USE_ALL           = (MCIERR_BASE + 23)
integer, parameter, public :: MCIERR_MULTIPLE                 = (MCIERR_BASE + 24)
integer, parameter, public :: MCIERR_EXTENSION_NOT_FOUND      = (MCIERR_BASE + 25)
integer, parameter, public :: MCIERR_OUTOFRANGE               = (MCIERR_BASE + 26)
integer, parameter, public :: MCIERR_FLAGS_NOT_COMPATIBLE     = (MCIERR_BASE + 28)
integer, parameter, public :: MCIERR_FILE_NOT_SAVED           = (MCIERR_BASE + 30)
integer, parameter, public :: MCIERR_DEVICE_TYPE_REQUIRED     = (MCIERR_BASE + 31)
integer, parameter, public :: MCIERR_DEVICE_LOCKED            = (MCIERR_BASE + 32)
integer, parameter, public :: MCIERR_DUPLICATE_ALIAS          = (MCIERR_BASE + 33)
integer, parameter, public :: MCIERR_BAD_CONSTANT             = (MCIERR_BASE + 34)
integer, parameter, public :: MCIERR_MUST_USE_SHAREABLE       = (MCIERR_BASE + 35)
integer, parameter, public :: MCIERR_MISSING_DEVICE_NAME      = (MCIERR_BASE + 36)
integer, parameter, public :: MCIERR_BAD_TIME_FORMAT          = (MCIERR_BASE + 37)
integer, parameter, public :: MCIERR_NO_CLOSING_QUOTE         = (MCIERR_BASE + 38)
integer, parameter, public :: MCIERR_DUPLICATE_FLAGS          = (MCIERR_BASE + 39)
integer, parameter, public :: MCIERR_INVALID_FILE             = (MCIERR_BASE + 40)
integer, parameter, public :: MCIERR_NULL_PARAMETER_BLOCK     = (MCIERR_BASE + 41)
integer, parameter, public :: MCIERR_UNNAMED_RESOURCE         = (MCIERR_BASE + 42)
integer, parameter, public :: MCIERR_NEW_REQUIRES_ALIAS       = (MCIERR_BASE + 43)
integer, parameter, public :: MCIERR_NOTIFY_ON_AUTO_OPEN      = (MCIERR_BASE + 44)
integer, parameter, public :: MCIERR_NO_ELEMENT_ALLOWED       = (MCIERR_BASE + 45)
integer, parameter, public :: MCIERR_NONAPPLICABLE_FUNCTION   = (MCIERR_BASE + 46)
integer, parameter, public :: MCIERR_ILLEGAL_FOR_AUTO_OPEN    = (MCIERR_BASE + 47)
integer, parameter, public :: MCIERR_FILENAME_REQUIRED        = (MCIERR_BASE + 48)
integer, parameter, public :: MCIERR_EXTRA_CHARACTERS         = (MCIERR_BASE + 49)
integer, parameter, public :: MCIERR_DEVICE_NOT_INSTALLED     = (MCIERR_BASE + 50)
integer, parameter, public :: MCIERR_GET_CD                   = (MCIERR_BASE + 51)
integer, parameter, public :: MCIERR_SET_CD                   = (MCIERR_BASE + 52)
integer, parameter, public :: MCIERR_SET_DRIVE                = (MCIERR_BASE + 53)
integer, parameter, public :: MCIERR_DEVICE_LENGTH            = (MCIERR_BASE + 54)
integer, parameter, public :: MCIERR_DEVICE_ORD_LENGTH        = (MCIERR_BASE + 55)
integer, parameter, public :: MCIERR_NO_INTEGER               = (MCIERR_BASE + 56)

integer, parameter, public :: MCIERR_WAVE_OUTPUTSINUSE        = (MCIERR_BASE + 64)
integer, parameter, public :: MCIERR_WAVE_SETOUTPUTINUSE      = (MCIERR_BASE + 65)
integer, parameter, public :: MCIERR_WAVE_INPUTSINUSE         = (MCIERR_BASE + 66)
integer, parameter, public :: MCIERR_WAVE_SETINPUTINUSE       = (MCIERR_BASE + 67)
integer, parameter, public :: MCIERR_WAVE_OUTPUTUNSPECIFIED   = (MCIERR_BASE + 68)
integer, parameter, public :: MCIERR_WAVE_INPUTUNSPECIFIED    = (MCIERR_BASE + 69)
integer, parameter, public :: MCIERR_WAVE_OUTPUTSUNSUITABLE   = (MCIERR_BASE + 70)
integer, parameter, public :: MCIERR_WAVE_SETOUTPUTUNSUITABLE = (MCIERR_BASE + 71)
integer, parameter, public :: MCIERR_WAVE_INPUTSUNSUITABLE    = (MCIERR_BASE + 72)
integer, parameter, public :: MCIERR_WAVE_SETINPUTUNSUITABLE  = (MCIERR_BASE + 73)

integer, parameter, public :: MCIERR_SEQ_DIV_INCOMPATIBLE     = (MCIERR_BASE + 80)
integer, parameter, public :: MCIERR_SEQ_PORT_INUSE           = (MCIERR_BASE + 81)
integer, parameter, public :: MCIERR_SEQ_PORT_NONEXISTENT     = (MCIERR_BASE + 82)
integer, parameter, public :: MCIERR_SEQ_PORT_MAPNODEVICE     = (MCIERR_BASE + 83)
integer, parameter, public :: MCIERR_SEQ_PORT_MISCERROR       = (MCIERR_BASE + 84)
integer, parameter, public :: MCIERR_SEQ_TIMER                = (MCIERR_BASE + 85)
integer, parameter, public :: MCIERR_SEQ_PORTUNSPECIFIED      = (MCIERR_BASE + 86)
integer, parameter, public :: MCIERR_SEQ_NOMIDIPRESENT        = (MCIERR_BASE + 87)

integer, parameter, public :: MCIERR_NO_WINDOW                = (MCIERR_BASE + 90)
integer, parameter, public :: MCIERR_CREATEWINDOW             = (MCIERR_BASE + 91)
integer, parameter, public :: MCIERR_FILE_READ                = (MCIERR_BASE + 92)
integer, parameter, public :: MCIERR_FILE_WRITE               = (MCIERR_BASE + 93)

!  All custom device driver errors must be >= this value
integer, parameter, public :: MCIERR_CUSTOM_DRIVER_BASE       = (MCIERR_BASE + 256)

! ***************************************************************************
! *          MCI command message identifiers
! ****************************************************************************
!

!  Message numbers are hard coded because the resource compiler
!  will otherwise fail on the RCDATA command table in mmsystem.rc

!  They must be in the range between MCI_FIRST and MCI_LAST

integer, parameter, public :: MCI_FIRST =  #0800
!  Messages #801 and #802 are reserved
integer, parameter, public :: MCI_OPEN =  #0803
integer, parameter, public :: MCI_CLOSE =  #0804
integer, parameter, public :: MCI_ESCAPE =  #0805
integer, parameter, public :: MCI_PLAY =  #0806
integer, parameter, public :: MCI_SEEK =  #0807
integer, parameter, public :: MCI_STOP =  #0808
integer, parameter, public :: MCI_PAUSE =  #0809
integer, parameter, public :: MCI_INFO =  #080A
integer, parameter, public :: MCI_GETDEVCAPS =  #080B
integer, parameter, public :: MCI_SPIN =  #080C
integer, parameter, public :: MCI_SET =  #080D
integer, parameter, public :: MCI_STEP =  #080E
integer, parameter, public :: MCI_RECORD =  #080F
integer, parameter, public :: MCI_SYSINFO =  #0810
integer, parameter, public :: MCI_BREAK =  #0811
integer, parameter, public :: MCI_SOUND =  #0812
integer, parameter, public :: MCI_SAVE =  #0813
integer, parameter, public :: MCI_STATUS =  #0814

integer, parameter, public :: MCI_CUE =  #0830

integer, parameter, public :: MCI_REALIZE =  #0840
integer, parameter, public :: MCI_WINDOW =  #0841
integer, parameter, public :: MCI_PUT =  #0842
integer, parameter, public :: MCI_WHERE =  #0843
integer, parameter, public :: MCI_FREEZE =  #0844
integer, parameter, public :: MCI_UNFREEZE =  #0845

integer, parameter, public :: MCI_LOAD =  #0850
integer, parameter, public :: MCI_CUT =  #0851
integer, parameter, public :: MCI_COPY =  #0852
integer, parameter, public :: MCI_PASTE =  #0853
integer, parameter, public :: MCI_UPDATE =  #0854
integer, parameter, public :: MCI_RESUME =  #0855
integer, parameter, public :: MCI_DELETE =  #0856

integer, parameter, public :: MCI_LAST =  #0FFF

!  the next #400 message ID's are reserved for custom drivers
!  all custom MCI command messages must be >= than this value
integer, parameter, public :: MCI_USER_MESSAGES =  #400 + MCI_FIRST


! ***************************************************************************
! *   Structures for the lpdwParams (dwParam2) of mciSendCommand for those
! *   command messages that may be parsed in string form.
! ****************************************************************************
!




integer, parameter, public :: MCI_ALL_DEVICE_ID               = -1    !  Matches all MCI devices

!  constants for predefined MCI device types
! #define MCI_DEVTYPE_VCR                 (MCI_STRING_OFFSET + 1)
! #define MCI_DEVTYPE_VIDEODISC           (MCI_STRING_OFFSET + 2)
! #define MCI_DEVTYPE_OVERLAY             (MCI_STRING_OFFSET + 3)
! #define MCI_DEVTYPE_CD_AUDIO            (MCI_STRING_OFFSET + 4)
! #define MCI_DEVTYPE_DAT                 (MCI_STRING_OFFSET + 5)
! #define MCI_DEVTYPE_SCANNER             (MCI_STRING_OFFSET + 6)
! #define MCI_DEVTYPE_ANIMATION           (MCI_STRING_OFFSET + 7)
! #define MCI_DEVTYPE_DIGITAL_VIDEO       (MCI_STRING_OFFSET + 8)
! #define MCI_DEVTYPE_OTHER               (MCI_STRING_OFFSET + 9)
! #define MCI_DEVTYPE_WAVEFORM_AUDIO      (MCI_STRING_OFFSET + 10)
! #define MCI_DEVTYPE_SEQUENCER           (MCI_STRING_OFFSET + 11)

!  Constant values are used because RC does not like the parentheses
integer, parameter, public :: MCI_DEVTYPE_VCR = 513
integer, parameter, public :: MCI_DEVTYPE_VIDEODISC = 514
integer, parameter, public :: MCI_DEVTYPE_OVERLAY = 515
integer, parameter, public :: MCI_DEVTYPE_CD_AUDIO = 516
integer, parameter, public :: MCI_DEVTYPE_DAT = 517
integer, parameter, public :: MCI_DEVTYPE_SCANNER = 518
integer, parameter, public :: MCI_DEVTYPE_ANIMATION = 519
integer, parameter, public :: MCI_DEVTYPE_DIGITAL_VIDEO = 520
integer, parameter, public :: MCI_DEVTYPE_OTHER = 521
integer, parameter, public :: MCI_DEVTYPE_WAVEFORM_AUDIO = 522
integer, parameter, public :: MCI_DEVTYPE_SEQUENCER = 523

integer, parameter, public :: MCI_DEVTYPE_FIRST = MCI_DEVTYPE_VCR
integer, parameter, public :: MCI_DEVTYPE_LAST = MCI_DEVTYPE_SEQUENCER


integer, parameter, public :: MCI_DEVTYPE_FIRST_USER =  #1000

!  return values for 'status mode' command
integer, parameter, public :: MCI_MODE_NOT_READY              = (MCI_STRING_OFFSET + 12)
integer, parameter, public :: MCI_MODE_STOP                   = (MCI_STRING_OFFSET + 13)
integer, parameter, public :: MCI_MODE_PLAY                   = (MCI_STRING_OFFSET + 14)
integer, parameter, public :: MCI_MODE_RECORD                 = (MCI_STRING_OFFSET + 15)
integer, parameter, public :: MCI_MODE_SEEK                   = (MCI_STRING_OFFSET + 16)
integer, parameter, public :: MCI_MODE_PAUSE                  = (MCI_STRING_OFFSET + 17)
integer, parameter, public :: MCI_MODE_OPEN                   = (MCI_STRING_OFFSET + 18)

!  constants used in 'set time format' and 'status time format' commands
!  These are not based on MCI_FORMATS_OFFSET because of resource
!  compiler limitations
integer, parameter, public :: MCI_FORMAT_MILLISECONDS = 0
integer, parameter, public :: MCI_FORMAT_HMS = 1
integer, parameter, public :: MCI_FORMAT_MSF = 2
integer, parameter, public :: MCI_FORMAT_FRAMES = 3
integer, parameter, public :: MCI_FORMAT_SMPTE_24 = 4
integer, parameter, public :: MCI_FORMAT_SMPTE_25 = 5
integer, parameter, public :: MCI_FORMAT_SMPTE_30 = 6
integer, parameter, public :: MCI_FORMAT_SMPTE_30DROP = 7
integer, parameter, public :: MCI_FORMAT_BYTES = 8
integer, parameter, public :: MCI_FORMAT_SAMPLES = 9
integer, parameter, public :: MCI_FORMAT_TMSF = 10

!  MCI time format conversion macros
!  Note that these macros are byte-sex dependent as the SMPT format gives
!  the layout in storage that's wanted.
!#define MCI_MSF_MINUTE(msf)             ((BYTE)(msf))
!#define MCI_MSF_SECOND(msf)             ((BYTE)(((WORD)(msf)) >> 8))
!#define MCI_MSF_FRAME(msf)              ((BYTE)((msf)>>16))

!#define MCI_MAKE_MSF(m, s, f)           ((DWORD)(((BYTE)(m) | \
!                                                  ((WORD)(s)<<8)) | \
!                                                 (((DWORD)(BYTE)(f))<<16)))

!#define MCI_TMSF_TRACK(tmsf)            ((BYTE)(tmsf))
!#define MCI_TMSF_MINUTE(tmsf)           ((BYTE)(((WORD)(tmsf)) >> 8))
!#define MCI_TMSF_SECOND(tmsf)           ((BYTE)((tmsf)>>16))
!#define MCI_TMSF_FRAME(tmsf)            ((BYTE)((tmsf)>>24))

!#define MCI_MAKE_TMSF(t, m, s, f)       ( (DWORD)( ( (BYTE)(t)            \
!                                                   | ( (WORD)(m) << 8 )   \
!                                                   )                      \
!                                                 | ( ( (DWORD)(BYTE)(s)   \
!                                                     | ( (WORD)(f) <<8 )  \
!                                                     )                    \
!                                                   << 16                  \
!                                                   )                      \
!                                                 )                        \
!                                        )

!#define MCI_HMS_HOUR(hms)               ((BYTE)(hms))
!#define MCI_HMS_MINUTE(hms)             ((BYTE)(((WORD)(hms)) >> 8))
!#define MCI_HMS_SECOND(hms)             ((BYTE)((hms)>>16))

!#define MCI_MAKE_HMS(h, m, s)           ( (DWORD)( ( (BYTE)(h)            \
!                                                   | ( (WORD)(m) <<8 )    \
!                                                   )                      \
!                                                 | ( ( (DWORD)(BYTE)(s) ) \
!                                                   <<16                   \
!                                                   )                      \
!                                                 )                        \
!                                        )



!   Flags for wParam of the MM_MCINOTIFY message   
integer, parameter, public :: MCI_NOTIFY_SUCCESSFUL =  #0001
integer, parameter, public :: MCI_NOTIFY_SUPERSEDED =  #0002
integer, parameter, public :: MCI_NOTIFY_ABORTED =  #0004
integer, parameter, public :: MCI_NOTIFY_FAILURE =  #0008

!  NOTE: All flags must have an "L" suffix in order to be parsed as
!  DWORDs by the resource compiler

!  common flags for dwFlags parameter of MCI command messages
integer, parameter, public :: MCI_NOTIFY =  #00000001
integer, parameter, public :: MCI_WAIT =  #00000002
integer, parameter, public :: MCI_FROM =  #00000004
integer, parameter, public :: MCI_TO =  #00000008
integer, parameter, public :: MCI_TRACK =  #00000010

!  flags for dwFlags parameter of MCI_OPEN command message
integer, parameter, public :: MCI_OPEN_SHAREABLE =  #00000100
integer, parameter, public :: MCI_OPEN_ELEMENT =  #00000200
integer, parameter, public :: MCI_OPEN_ALIAS =  #00000400
integer, parameter, public :: MCI_OPEN_ELEMENT_ID =  #00000800
integer, parameter, public :: MCI_OPEN_TYPE_ID =  #00001000
integer, parameter, public :: MCI_OPEN_TYPE =  #00002000

!  flags for dwFlags parameter of MCI_SEEK command message
integer, parameter, public :: MCI_SEEK_TO_START =  #00000100
integer, parameter, public :: MCI_SEEK_TO_END =  #00000200

!  flags for dwFlags parameter of MCI_STATUS command message
integer, parameter, public :: MCI_STATUS_ITEM =  #00000100
integer, parameter, public :: MCI_STATUS_START =  #00000200

!  flags for dwItem field of the T_MCI_STATUS_PARMS parameter block
integer, parameter, public :: MCI_STATUS_LENGTH =  #00000001
integer, parameter, public :: MCI_STATUS_POSITION =  #00000002
integer, parameter, public :: MCI_STATUS_NUMBER_OF_TRACKS =  #00000003
integer, parameter, public :: MCI_STATUS_MODE =  #00000004
integer, parameter, public :: MCI_STATUS_MEDIA_PRESENT =  #00000005
integer, parameter, public :: MCI_STATUS_TIME_FORMAT =  #00000006
integer, parameter, public :: MCI_STATUS_READY =  #00000007
integer, parameter, public :: MCI_STATUS_CURRENT_TRACK =  #00000008

!  flags for dwFlags parameter of MCI_INFO command message
integer, parameter, public :: MCI_INFO_PRODUCT =  #00000100
integer, parameter, public :: MCI_INFO_FILE =  #00000200

!  flags for dwFlags parameter of MCI_GETDEVCAPS command message
integer, parameter, public :: MCI_GETDEVCAPS_ITEM =  #00000100

!  flags for dwItem field of the T_MCI_GETDEVCAPS_PARMS parameter block
integer, parameter, public :: MCI_GETDEVCAPS_CAN_RECORD =  #00000001
integer, parameter, public :: MCI_GETDEVCAPS_HAS_AUDIO =  #00000002
integer, parameter, public :: MCI_GETDEVCAPS_HAS_VIDEO =  #00000003
integer, parameter, public :: MCI_GETDEVCAPS_DEVICE_TYPE =  #00000004
integer, parameter, public :: MCI_GETDEVCAPS_USES_FILES =  #00000005
integer, parameter, public :: MCI_GETDEVCAPS_COMPOUND_DEVICE =  #00000006
integer, parameter, public :: MCI_GETDEVCAPS_CAN_EJECT =  #00000007
integer, parameter, public :: MCI_GETDEVCAPS_CAN_PLAY =  #00000008
integer, parameter, public :: MCI_GETDEVCAPS_CAN_SAVE =  #00000009

!  flags for dwFlags parameter of MCI_SYSINFO command message
integer, parameter, public :: MCI_SYSINFO_QUANTITY =  #00000100
integer, parameter, public :: MCI_SYSINFO_OPEN =  #00000200
integer, parameter, public :: MCI_SYSINFO_NAME =  #00000400
integer, parameter, public :: MCI_SYSINFO_INSTALLNAME =  #00000800

!  flags for dwFlags parameter of MCI_SET command message
integer, parameter, public :: MCI_SET_DOOR_OPEN =  #00000100
integer, parameter, public :: MCI_SET_DOOR_CLOSED =  #00000200
integer, parameter, public :: MCI_SET_TIME_FORMAT =  #00000400
integer, parameter, public :: MCI_SET_AUDIO =  #00000800
integer, parameter, public :: MCI_SET_VIDEO =  #00001000
integer, parameter, public :: MCI_SET_ON =  #00002000
integer, parameter, public :: MCI_SET_OFF =  #00004000

!  flags for dwAudio field of T_MCI_SET_PARMS or T_MCI_SEQ_SET_PARMS
integer, parameter, public :: MCI_SET_AUDIO_ALL =  #00004001
integer, parameter, public :: MCI_SET_AUDIO_LEFT =  #00004002
integer, parameter, public :: MCI_SET_AUDIO_RIGHT =  #00004003

!  flags for dwFlags parameter of MCI_BREAK command message
integer, parameter, public :: MCI_BREAK_KEY =  #00000100
integer, parameter, public :: MCI_BREAK_HWND =  #00000200
integer, parameter, public :: MCI_BREAK_OFF =  #00000400

!  flags for dwFlags parameter of MCI_RECORD command message
integer, parameter, public :: MCI_RECORD_INSERT =  #00000100
integer, parameter, public :: MCI_RECORD_OVERWRITE =  #00000200

!  flags for dwFlags parameter of MCI_SOUND command message
integer, parameter, public :: MCI_SOUND_NAME =  #00000100

!  flags for dwFlags parameter of MCI_SAVE command message
integer, parameter, public :: MCI_SAVE_FILE =  #00000100

!  flags for dwFlags parameter of MCI_LOAD command message
integer, parameter, public :: MCI_LOAD_FILE =  #00000100

!  Note that some structures below do not have all the fields of the
! ! corresponding Win 3.1 structures.  Some reserved WORD sized fields
! ! have disappeared.  This is deliberate.  The structures are the same
! ! size (with one exception which is two bytes longer).
! !
! ! The FIRST entry in each structure must be dwCallback.  A large union
! ! could be defined... but...
! 
!


!  generic parameter block for MCI command messages with no special parameters

type  T_MCI_GENERIC_PARMS
    integer dwCallback 
end type  T_MCI_GENERIC_PARMS

!  parameter block for MCI_OPEN command message

type  T_MCI_OPEN_PARMS
    integer dwCallback 
    integer wDeviceID 
    integer lpstrDeviceType 
    integer lpstrElementName 
    integer lpstrAlias 
end type  T_MCI_OPEN_PARMS

!  parameter block for MCI_OPEN command message

!  parameter block for MCI_PLAY command message
type  T_MCI_PLAY_PARMS
    integer dwCallback 
    integer dwFrom 
    integer dwTo 
end type  T_MCI_PLAY_PARMS

!  parameter block for MCI_SEEK command message
type  T_MCI_SEEK_PARMS
    integer dwCallback 
    integer dwTo 
end type  T_MCI_SEEK_PARMS

!  parameter block for MCI_STATUS command message
type  T_MCI_STATUS_PARMS
    integer dwCallback 
    integer dwReturn 
    integer dwItem 
    integer dwTrack 
end type  T_MCI_STATUS_PARMS

!  parameter block for MCI_INFO command message
type  T_MCI_INFO_PARMS
    integer dwCallback 
    integer lpstrReturn 
    integer dwRetSize 
end type  T_MCI_INFO_PARMS
!  parameter block for MCI_INFO command message

!  parameter block for MCI_GETDEVCAPS command message
type  T_MCI_GETDEVCAPS_PARMS
    integer dwCallback 
    integer dwReturn 
    integer dwItem 
end type  T_MCI_GETDEVCAPS_PARMS

!  parameter block for MCI_SYSINFO command message
type  T_MCI_SYSINFO_PARMS
    integer dwCallback 
    integer lpstrReturn 
    integer dwRetSize 
    integer dwNumber 
    integer wDeviceType 
end type  T_MCI_SYSINFO_PARMS
!  parameter block for MCI_SYSINFO command message

!  parameter block for MCI_SET command message
type  T_MCI_SET_PARMS
    integer dwCallback 
    integer dwTimeFormat 
    integer dwAudio 
end type  T_MCI_SET_PARMS

!  parameter block for MCI_BREAK command message
type  T_MCI_BREAK_PARMS
    integer dwCallback 
    integer nVirtKey 
    integer hwndBreak 
end type  T_MCI_BREAK_PARMS

!  parameter block for MCI_SOUND command message
type  T_MCI_SOUND_PARMS
    integer dwCallback 
    integer lpstrSoundName 
end type  T_MCI_SOUND_PARMS
!  parameter block for MCI_SOUND command message


!  parameter block for MCI_SAVE command message
type  T_MCI_SAVE_PARMS
    integer dwCallback 
    integer lpfilename 
end type  T_MCI_SAVE_PARMS
!  parameter block for MCI_SAVE command message

!  parameter block for MCI_LOAD command message
type  T_MCI_LOAD_PARMS
    integer dwCallback 
    integer lpfilename 
end type  T_MCI_LOAD_PARMS
!  parameter block for MCI_LOAD command message

!  parameter block for MCI_RECORD command message
type  T_MCI_RECORD_PARMS
    integer dwCallback 
    integer dwFrom 
    integer dwTo 
end type  T_MCI_RECORD_PARMS

! ****************************************************************************
! *    Standard command parameters for videodisc drivers                       *
! ****************************************************************************
!


!  string resource ID's for videodisc players
!  return ID's for videodisc status command
!  flag for dwReturn field of T_MCI_STATUS_PARMS
!  MCI_STATUS command, (dwItem == MCI_STATUS_MODE)
integer, parameter, public :: MCI_VD_MODE_PARK                = (MCI_VD_OFFSET + 1)

!  return ID's for videodisc MCI_GETDEVCAPS command

!  flag for dwReturn field of T_MCI_STATUS_PARMS
!  MCI_STATUS command, (dwItem == MCI_VD_STATUS_MEDIA_TYPE)
integer, parameter, public :: MCI_VD_MEDIA_CLV                = (MCI_VD_OFFSET + 2)
integer, parameter, public :: MCI_VD_MEDIA_CAV                = (MCI_VD_OFFSET + 3)
integer, parameter, public :: MCI_VD_MEDIA_OTHER              = (MCI_VD_OFFSET + 4)

integer, parameter, public :: MCI_VD_FORMAT_TRACK =  #4001

!  flags for dwFlags parameter of MCI_PLAY command message
integer, parameter, public :: MCI_VD_PLAY_REVERSE =  #00010000
integer, parameter, public :: MCI_VD_PLAY_FAST =  #00020000
integer, parameter, public :: MCI_VD_PLAY_SPEED =  #00040000
integer, parameter, public :: MCI_VD_PLAY_SCAN =  #00080000
integer, parameter, public :: MCI_VD_PLAY_SLOW =  #00100000

!  flag for dwFlags parameter of MCI_SEEK command message
integer, parameter, public :: MCI_VD_SEEK_REVERSE =  #00010000

!  flags for dwItem field of T_MCI_STATUS_PARMS parameter block
integer, parameter, public :: MCI_VD_STATUS_SPEED =  #00004002
integer, parameter, public :: MCI_VD_STATUS_FORWARD =  #00004003
integer, parameter, public :: MCI_VD_STATUS_MEDIA_TYPE =  #00004004
integer, parameter, public :: MCI_VD_STATUS_SIDE =  #00004005
integer, parameter, public :: MCI_VD_STATUS_DISC_SIZE =  #00004006

!  flags for dwFlags parameter of MCI_GETDEVCAPS command message
integer, parameter, public :: MCI_VD_GETDEVCAPS_CLV =  #00010000
integer, parameter, public :: MCI_VD_GETDEVCAPS_CAV =  #00020000

integer, parameter, public :: MCI_VD_SPIN_UP =  #00010000
integer, parameter, public :: MCI_VD_SPIN_DOWN =  #00020000

!  flags for dwItem field of T_MCI_GETDEVCAPS_PARMS parameter block
integer, parameter, public :: MCI_VD_GETDEVCAPS_CAN_REVERSE =  #00004002
integer, parameter, public :: MCI_VD_GETDEVCAPS_FAST_RATE =  #00004003
integer, parameter, public :: MCI_VD_GETDEVCAPS_SLOW_RATE =  #00004004
integer, parameter, public :: MCI_VD_GETDEVCAPS_NORMAL_RATE =  #00004005

!  flags for the dwFlags parameter of MCI_STEP command message
integer, parameter, public :: MCI_VD_STEP_FRAMES =  #00010000
integer, parameter, public :: MCI_VD_STEP_REVERSE =  #00020000

!  flag for the MCI_ESCAPE command message
integer, parameter, public :: MCI_VD_ESCAPE_STRING =  #00000100

!  parameter block for MCI_PLAY command message
type  T_MCI_VD_PLAY_PARMS
    integer dwCallback 
    integer dwFrom 
    integer dwTo 
    integer dwSpeed 
end type  T_MCI_VD_PLAY_PARMS

!  parameter block for MCI_STEP command message
type  T_MCI_VD_STEP_PARMS
    integer dwCallback 
    integer dwFrames 
end type  T_MCI_VD_STEP_PARMS

!  parameter block for MCI_ESCAPE command message
type  T_MCI_VD_ESCAPE_PARMS
    integer dwCallback 
    integer lpstrCommand 
end type  T_MCI_VD_ESCAPE_PARMS
!  parameter block for MCI_ESCAPE command message

! ****************************************************************************
! *   Standard command parameters for waveform audio drivers
! ****************************************************************************
!


integer, parameter, public :: MCI_WAVE_PCM            = (MCI_WAVE_OFFSET+0)
integer, parameter, public :: MCI_WAVE_MAPPER         = (MCI_WAVE_OFFSET+1)

!  flags for the dwFlags parameter of MCI_OPEN command message
integer, parameter, public :: MCI_WAVE_OPEN_BUFFER =  #00010000

!  flags for the dwFlags parameter of MCI_SET command message
integer, parameter, public :: MCI_WAVE_SET_FORMATTAG =  #00010000
integer, parameter, public :: MCI_WAVE_SET_CHANNELS =  #00020000
integer, parameter, public :: MCI_WAVE_SET_SAMPLESPERSEC =  #00040000
integer, parameter, public :: MCI_WAVE_SET_AVGBYTESPERSEC =  #00080000
integer, parameter, public :: MCI_WAVE_SET_BLOCKALIGN =  #00100000
integer, parameter, public :: MCI_WAVE_SET_BITSPERSAMPLE =  #00200000

!  flags for the dwFlags parameter of MCI_STATUS, MCI_SET command messages
integer, parameter, public :: MCI_WAVE_INPUT =  #00400000
integer, parameter, public :: MCI_WAVE_OUTPUT =  #00800000

!  flags for the dwItem field of T_MCI_STATUS_PARMS parameter block
integer, parameter, public :: MCI_WAVE_STATUS_FORMATTAG =  #00004001
integer, parameter, public :: MCI_WAVE_STATUS_CHANNELS =  #00004002
integer, parameter, public :: MCI_WAVE_STATUS_SAMPLESPERSEC =  #00004003
integer, parameter, public :: MCI_WAVE_STATUS_AVGBYTESPERSEC =  #00004004
integer, parameter, public :: MCI_WAVE_STATUS_BLOCKALIGN =  #00004005
integer, parameter, public :: MCI_WAVE_STATUS_BITSPERSAMPLE =  #00004006
integer, parameter, public :: MCI_WAVE_STATUS_LEVEL =  #00004007

!  flags for the dwFlags parameter of MCI_SET command message
integer, parameter, public :: MCI_WAVE_SET_ANYINPUT =  #04000000
integer, parameter, public :: MCI_WAVE_SET_ANYOUTPUT =  #08000000

!  flags for the dwFlags parameter of MCI_GETDEVCAPS command message
integer, parameter, public :: MCI_WAVE_GETDEVCAPS_INPUTS =  #00004001
integer, parameter, public :: MCI_WAVE_GETDEVCAPS_OUTPUTS =  #00004002

!  parameter block for MCI_OPEN command message
type  T_MCI_WAVE_OPEN_PARMS
    integer dwCallback 
    integer wDeviceID 
    integer lpstrDeviceType 
    integer lpstrElementName 
    integer lpstrAlias 
    integer dwBufferSeconds 
end type  T_MCI_WAVE_OPEN_PARMS
!  parameter block for MCI_OPEN command message

!  parameter block for MCI_DELETE command message
type  T_MCI_WAVE_DELETE_PARMS
    integer dwCallback 
    integer dwFrom 
    integer dwTo 
end type  T_MCI_WAVE_DELETE_PARMS

!  parameter block for MCI_SET command message
type  T_MCI_WAVE_SET_PARMS
    integer dwCallback 
    integer dwTimeFormat 
    integer dwAudio 
    integer wInput 
    integer wOutput 
    integer(2) wFormatTag                !  corresponds to T_WAVEFORMAT structure
    integer(2) wReserved2 
    integer(2) nChannels                 !  corresponds to T_WAVEFORMAT structure
    integer(2) wReserved3 
    integer nSamplesPerSec 
    integer nAvgBytesPerSec 
    integer(2) nBlockAlign               !  corresponds to T_WAVEFORMAT structure
    integer(2) wReserved4 
    integer(2) wBitsPerSample            !  corresponds to T_PCMWAVEFORMAT structure
    integer(2) wReserved5 
end type  T_MCI_WAVE_SET_PARMS

! ****************************************************************************
! *   Standard command parameters for CD audio drivers
! ****************************************************************************
!


!  None

! ****************************************************************************
! *        Standard command parameters for Sequencer drivers
! ****************************************************************************
!


!  string resource ID's for sequencers
!  return ids for status division type

!  flags for the dwReturn field of T_MCI_STATUS_PARMS parameter block
!  MCI_STATUS command, (dwItem == MCI_SEQ_STATUS_DIVTYPE)
integer, parameter, public :: MCI_SEQ_DIV_PPQN = (0 + MCI_SEQ_OFFSET)
integer, parameter, public :: MCI_SEQ_DIV_SMPTE_24 = (1 + MCI_SEQ_OFFSET)
integer, parameter, public :: MCI_SEQ_DIV_SMPTE_25 = (2 + MCI_SEQ_OFFSET)
integer, parameter, public :: MCI_SEQ_DIV_SMPTE_30DROP = (3 + MCI_SEQ_OFFSET)
integer, parameter, public :: MCI_SEQ_DIV_SMPTE_30 = (4 + MCI_SEQ_OFFSET)

!  flags for the dwMaster field of T_MCI_SEQ_SET_PARMS parameter block
!  MCI_SET command, (dwFlags == MCI_SEQ_SET_MASTER)
integer, parameter, public :: MCI_SEQ_FORMAT_SONGPTR =  #4001
integer, parameter, public :: MCI_SEQ_FILE =  #4002
integer, parameter, public :: MCI_SEQ_MIDI =  #4003
integer, parameter, public :: MCI_SEQ_SMPTE =  #4004
integer, parameter, public :: MCI_SEQ_NONE = 65533

integer, parameter, public :: MCI_SEQ_MAPPER = 65535

!  flags for the dwItem field of T_MCI_STATUS_PARMS parameter block
integer, parameter, public :: MCI_SEQ_STATUS_TEMPO =  #00004002
integer, parameter, public :: MCI_SEQ_STATUS_PORT =  #00004003
integer, parameter, public :: MCI_SEQ_STATUS_SLAVE =  #00004007
integer, parameter, public :: MCI_SEQ_STATUS_MASTER =  #00004008
integer, parameter, public :: MCI_SEQ_STATUS_OFFSET =  #00004009
integer, parameter, public :: MCI_SEQ_STATUS_DIVTYPE =  #0000400A

!  flags for the dwFlags parameter of MCI_SET command message
integer, parameter, public :: MCI_SEQ_SET_TEMPO =  #00010000
integer, parameter, public :: MCI_SEQ_SET_PORT =  #00020000
integer, parameter, public :: MCI_SEQ_SET_SLAVE =  #00040000
integer, parameter, public :: MCI_SEQ_SET_MASTER =  #00080000
integer, parameter, public :: MCI_SEQ_SET_OFFSET =  #01000000

!  parameter block for MCI_SET command message
type  T_MCI_SEQ_SET_PARMS
    integer dwCallback 
    integer dwTimeFormat 
    integer dwAudio 
    integer dwTempo 
    integer dwPort 
    integer dwSlave 
    integer dwMaster 
    integer dwOffset 
end type  T_MCI_SEQ_SET_PARMS

! ****************************************************************************
! *      Standard command parameters for animation
! ****************************************************************************
!

!  flags for dwFlags parameter of MCI_OPEN command message
integer, parameter, public :: MCI_ANIM_OPEN_WS =  #00010000
integer, parameter, public :: MCI_ANIM_OPEN_PARENT =  #00020000
integer, parameter, public :: MCI_ANIM_OPEN_NOSTATIC =  #00040000

!  flags for dwFlags parameter of MCI_PLAY command message
integer, parameter, public :: MCI_ANIM_PLAY_SPEED =  #00010000
integer, parameter, public :: MCI_ANIM_PLAY_REVERSE =  #00020000
integer, parameter, public :: MCI_ANIM_PLAY_FAST =  #00040000
integer, parameter, public :: MCI_ANIM_PLAY_SLOW =  #00080000
integer, parameter, public :: MCI_ANIM_PLAY_SCAN =  #00100000

!  flags for dwFlags parameter of MCI_STEP command message
integer, parameter, public :: MCI_ANIM_STEP_REVERSE =  #00010000
integer, parameter, public :: MCI_ANIM_STEP_FRAMES =  #00020000

!  flags for dwItem field of T_MCI_STATUS_PARMS parameter block
integer, parameter, public :: MCI_ANIM_STATUS_SPEED =  #00004001
integer, parameter, public :: MCI_ANIM_STATUS_FORWARD =  #00004002
integer, parameter, public :: MCI_ANIM_STATUS_HWND =  #00004003
integer, parameter, public :: MCI_ANIM_STATUS_HPAL =  #00004004
integer, parameter, public :: MCI_ANIM_STATUS_STRETCH =  #00004005

!  flags for the dwFlags parameter of MCI_INFO command message
integer, parameter, public :: MCI_ANIM_INFO_TEXT =  #00010000

!  flags for dwItem field of T_MCI_GETDEVCAPS_PARMS parameter block
integer, parameter, public :: MCI_ANIM_GETDEVCAPS_CAN_REVERSE =  #00004001
integer, parameter, public :: MCI_ANIM_GETDEVCAPS_FAST_RATE =  #00004002
integer, parameter, public :: MCI_ANIM_GETDEVCAPS_SLOW_RATE =  #00004003
integer, parameter, public :: MCI_ANIM_GETDEVCAPS_NORMAL_RATE =  #00004004
integer, parameter, public :: MCI_ANIM_GETDEVCAPS_PALETTES =  #00004006
integer, parameter, public :: MCI_ANIM_GETDEVCAPS_CAN_STRETCH =  #00004007
integer, parameter, public :: MCI_ANIM_GETDEVCAPS_MAX_WINDOWS =  #00004008

!  flags for the MCI_REALIZE command message
integer, parameter, public :: MCI_ANIM_REALIZE_NORM =  #00010000
integer, parameter, public :: MCI_ANIM_REALIZE_BKGD =  #00020000

!  flags for dwFlags parameter of MCI_WINDOW command message
integer, parameter, public :: MCI_ANIM_WINDOW_HWND =  #00010000
integer, parameter, public :: MCI_ANIM_WINDOW_STATE =  #00040000
integer, parameter, public :: MCI_ANIM_WINDOW_TEXT =  #00080000
integer, parameter, public :: MCI_ANIM_WINDOW_ENABLE_STRETCH =  #00100000
integer, parameter, public :: MCI_ANIM_WINDOW_DISABLE_STRETCH =  #00200000

!  flags for hWnd field of T_MCI_ANIM_WINDOW_PARMS parameter block
!  MCI_WINDOW command message, (dwFlags == MCI_ANIM_WINDOW_HWND)
integer, parameter, public :: MCI_ANIM_WINDOW_DEFAULT =  #00000000

!  flags for dwFlags parameter of MCI_PUT command message
integer, parameter, public :: MCI_ANIM_RECT =  #00010000
integer, parameter, public :: MCI_ANIM_PUT_SOURCE =  #00020000  ! also  MCI_WHERE
integer, parameter, public :: MCI_ANIM_PUT_DESTINATION =  #00040000  ! also  MCI_WHERE

!  flags for dwFlags parameter of MCI_WHERE command message
integer, parameter, public :: MCI_ANIM_WHERE_SOURCE =  #00020000
integer, parameter, public :: MCI_ANIM_WHERE_DESTINATION =  #00040000

!  flags for dwFlags parameter of MCI_UPDATE command message
integer, parameter, public :: MCI_ANIM_UPDATE_HDC =  #00020000

!  parameter block for MCI_OPEN command message
type  T_MCI_ANIM_OPEN_PARMS
    integer dwCallback 
    integer wDeviceID 
    integer lpstrDeviceType 
    integer lpstrElementName 
    integer lpstrAlias 
    integer dwStyle 
    integer hWndParent 
end type  T_MCI_ANIM_OPEN_PARMS

type  T_MCI_ANIM_PLAY_PARMS
    integer dwCallback 
    integer dwFrom 
    integer dwTo 
    integer dwSpeed 
end type  T_MCI_ANIM_PLAY_PARMS

!  parameter block for MCI_STEP command message
type  T_MCI_ANIM_STEP_PARMS
    integer dwCallback 
    integer dwFrames 
end type  T_MCI_ANIM_STEP_PARMS

!  parameter block for MCI_WINDOW command message
type  T_MCI_ANIM_WINDOW_PARMS
    integer dwCallback 
    integer hWnd 
    integer nCmdShow 
    integer lpstrText 
end type  T_MCI_ANIM_WINDOW_PARMS


!  parameter block for MCI_PUT, MCI_UPDATE, MCI_WHERE command messages
type  T_MCI_ANIM_RECT_PARMS
   integer        dwCallback 
!MS$IF DEFINED (MCI_USE_OFFEXT)
   type (T_POINT)   ptOffset 
   type (T_POINT)   ptExtent 
!MS$ELSE
    type(T_RECT)    rc
!MS$ENDIF
end type  T_MCI_ANIM_RECT_PARMS

!  parameter block for MCI_UPDATE PARMS
type  T_MCI_ANIM_UPDATE_PARMS
   integer       dwCallback 
   type (T_RECT)   rc 
   integer       hDC 
end type  T_MCI_ANIM_UPDATE_PARMS


! ****************************************************************************
! 
!     Standard command parameters for overlay
! 
! ****************************************************************************
!

!  flags for dwFlags parameter of MCI_OPEN command message
integer, parameter, public :: MCI_OVLY_OPEN_WS =  #00010000
integer, parameter, public :: MCI_OVLY_OPEN_PARENT =  #00020000

!  flags for dwFlags parameter of MCI_STATUS command message
integer, parameter, public :: MCI_OVLY_STATUS_HWND =  #00004001
integer, parameter, public :: MCI_OVLY_STATUS_STRETCH =  #00004002

!  flags for dwFlags parameter of MCI_INFO command message
integer, parameter, public :: MCI_OVLY_INFO_TEXT =  #00010000

!  flags for dwItem field of T_MCI_GETDEVCAPS_PARMS parameter block
integer, parameter, public :: MCI_OVLY_GETDEVCAPS_CAN_STRETCH =  #00004001
integer, parameter, public :: MCI_OVLY_GETDEVCAPS_CAN_FREEZE =  #00004002
integer, parameter, public :: MCI_OVLY_GETDEVCAPS_MAX_WINDOWS =  #00004003

!  flags for dwFlags parameter of MCI_WINDOW command message
integer, parameter, public :: MCI_OVLY_WINDOW_HWND =  #00010000
integer, parameter, public :: MCI_OVLY_WINDOW_STATE =  #00040000
integer, parameter, public :: MCI_OVLY_WINDOW_TEXT =  #00080000
integer, parameter, public :: MCI_OVLY_WINDOW_ENABLE_STRETCH =  #00100000
integer, parameter, public :: MCI_OVLY_WINDOW_DISABLE_STRETCH =  #00200000

!  flags for hWnd parameter of T_MCI_OVLY_WINDOW_PARMS parameter block
integer, parameter, public :: MCI_OVLY_WINDOW_DEFAULT =  #00000000

!  flags for dwFlags parameter of MCI_PUT command message
integer, parameter, public :: MCI_OVLY_RECT =  #00010000
integer, parameter, public :: MCI_OVLY_PUT_SOURCE =  #00020000
integer, parameter, public :: MCI_OVLY_PUT_DESTINATION =  #00040000
integer, parameter, public :: MCI_OVLY_PUT_FRAME =  #00080000
integer, parameter, public :: MCI_OVLY_PUT_VIDEO =  #00100000

!  flags for dwFlags parameter of MCI_WHERE command message
integer, parameter, public :: MCI_OVLY_WHERE_SOURCE =  #00020000
integer, parameter, public :: MCI_OVLY_WHERE_DESTINATION =  #00040000
integer, parameter, public :: MCI_OVLY_WHERE_FRAME =  #00080000
integer, parameter, public :: MCI_OVLY_WHERE_VIDEO =  #00100000


!  parameter block for MCI_OPEN command message
type  T_MCI_OVLY_OPEN_PARMS
    integer dwCallback 
    integer wDeviceID 
    integer lpstrDeviceType 
    integer lpstrElementName 
    integer lpstrAlias 
    integer dwStyle 
    integer hWndParent 
end type  T_MCI_OVLY_OPEN_PARMS
!  parameter block for MCI_OPEN command message

!  parameter block for MCI_WINDOW command message
type  T_MCI_OVLY_WINDOW_PARMS
    integer dwCallback 
    integer hWnd 
    integer nCmdShow 
    integer lpstrText 
end type  T_MCI_OVLY_WINDOW_PARMS
!  parameter block for MCI_WINDOW command message


!  parameter block for MCI_PUT, MCI_UPDATE, and MCI_WHERE command messages
type  T_MCI_OVLY_RECT_PARMS
    integer dwCallback 
!MS$IF DEFINED (MCI_USE_OFFEXT)
    type (T_POINT) ptOffset 
    type (T_POINT) ptExtent
!MS$ELSE
    type(T_RECT)    rc
!MS$ENDIF
end type  T_MCI_OVLY_RECT_PARMS

!  parameter block for MCI_SAVE command message
type  T_MCI_OVLY_SAVE_PARMS
    integer dwCallback 
    integer lpfilename 
    type (T_RECT) rc 
end type  T_MCI_OVLY_SAVE_PARMS
!  parameter block for MCI_SAVE command message


!  parameter block for MCI_LOAD command message
type  T_MCI_OVLY_LOAD_PARMS
    integer    dwCallback 
    integer    lpfilename 
    type (T_RECT) rc 
end type  T_MCI_OVLY_LOAD_PARMS
!  parameter block for MCI_LOAD command message


! ***************************************************************************
! 
!                         DISPLAY Driver extensions
! 
! ***************************************************************************
!


!MS$IF .NOT. DEFINED (CONE_TRANSPARENT)
integer, parameter, public :: CAPS1 = 94              ! other caps
integer, parameter, public :: C1_TRANSPARENT =  #0001          ! new raster cap
integer, parameter, public :: NEWTRANSPARENT = 3               ! use with SetBkMode()

integer, parameter, public :: QUERYROPSUPPORT = 40              ! use to determine ROP support
!MS$ENDIF 

! ***************************************************************************
! 
!                         DIB Driver extensions
! 
! ***************************************************************************
!


integer, parameter, public :: SELECTDIB = 41              ! DIB.DRV select dib escape
!#define DIBINDEX(n)     MAKELONG((n),#10FF)



!MS$ENDIF  ! !* MMSYSTEM_ *!


!                       *****WINSOCK****
! 
!  * Select uses arrays of SOCKETs.  These macros manipulate such
!  * arrays.  FD_SETSIZE may be defined by the user before including
!  * this file, but the default here should be >= 64.
!  *
!  * CAVEAT IMPLEMENTOR and USER: THESE MACROS AND TYPES MUST BE
!  * INCLUDED IN WINSOCK.H EXACTLY AS SHOWN HERE.
!  
!

!MS$IF .NOT. DEFINED (FD_SETSIZE)
integer, parameter, public :: FD_SETSIZE = 64
!MS$ENDIF !/* FD_SETSIZE */

type  T_fd_set
   integer fd_count                 !  how many are SET?   
   integer fd_array (FD_SETSIZE )   !  an array of SOCKETs   
end type  T_fd_set


! 
!  * Structure used in select() call, taken from the BSD file sys/time.h.
!

type T_timeval 
    integer tv_sec         !   seconds   
   integer tv_usec        !   and microseconds   
end type T_timeval

! 
!  * Operations on timevals.
!  *
!  * NB: timercmp does not work for >= or <=.
!  


! 
!  * Commands for ioctlsocket(),  taken from the BSD file fcntl.h.
!  *
!  *
!  * Ioctl's have the command encoded in the lower word,
!  * and the size of any in or out parameters in the upper
!  * word.  The high 2 bits of the upper word are used
!  * to encode the in/out status of the parameter; for now
!  * we restrict parameters to at most 128 bytes.
!

integer, parameter, public :: IOCPARM_MASK  =  #7f            !  parameters must be < 128 bytes   
integer, parameter, public :: IOC_VOID      =  #20000000      !  no parameters   
integer, parameter, public :: IOC_OUT       =  #40000000      !  copy out parameters   
integer, parameter, public :: IOC_IN        =  #80000000      !  copy in parameters   
!integer, parameter, public :: IOC_INOUT     = IOR(IOC_IN,IOC_OUT)
                                        !  0x20000000 distinguishes new &
!                                            old ioctl's 
!


!  * Structures returned by network data base library, taken from the
!  * BSD file netdb.h.  All addresses are supplied in host order, and
!  * returned in network order (suitable for use in system calls).


type  T_hostent 
    character(100) h_name    !!!! it is actually a char*   official name of host   
    character h_aliases      !   alias list   
    integer*2 h_addrtype !   host address type   
    integer*2 h_length   !   length of address   
    character(100) h_addr_list !!!! it is actually a char*   list of addresses   
!#define h_addr  h_addr_list[0]          !   address, for backward compat   
end type T_hostent

! 
!  * It is assumed here that a network number
!  * fits in 32 bits.
!  
!

type T_netent 
    character(100) n_name    !!!! it is actually a char*  official name of net   
    character(100) n_aliases !!!! it is actually a char*  alias list   
    integer*2 n_addrtype !   net address type   
    integer n_net            !   network #   
end type T_netent

type servent 
    character(100) s_name    !!!! it is actually a char*   official service name   
    character(100) s_aliases !!!! it is actually a char*   alias list   
    integer*2 s_port     !   port #   
    character(100) s_proto   !!!! it is actually a char*   protocol to use   
end type servent 

type protoent 
    character(100) p_name    !!!! it is actually a char*   !   official protocol name   
    character(100) p_aliases !!!! it is actually a char*ias list   
    integer*2 p_proto        !   protocol #   
end type protoent

! 
!  * Constants and structures defined by the internet system,
!  * Per RFC 790, September 1981, taken from the BSD file netinet/in.h.
!  
!

! 
!  * Protocols
!  
!

integer, parameter, public :: IPPROTO_IP    = 0               !  dummy for IP   
integer, parameter, public :: IPPROTO_ICMP  = 1               !  control message protocol   
integer, parameter, public :: IPPROTO_GGP   = 2               !  gateway^2 (deprecated)   
integer, parameter, public :: IPPROTO_TCP   = 6               !  tcp   
integer, parameter, public :: IPPROTO_PUP   = 12              !  pup   
integer, parameter, public :: IPPROTO_UDP   = 17              !  user datagram protocol   
integer, parameter, public :: IPPROTO_IDP   = 22              !  xns idp   
integer, parameter, public :: IPPROTO_ND    = 77              !  UNOFFICIAL net disk proto   

integer, parameter, public :: IPPROTO_RAW = 255               !  raw IP packet   
integer, parameter, public :: IPPROTO_MAX = 256

! 
!  * Port/socket numbers: network standard functions
!  
!

integer, parameter, public :: IPPORT_ECHO       = 7
integer, parameter, public :: IPPORT_DISCARD    = 9
integer, parameter, public :: IPPORT_SYSTAT     = 11
integer, parameter, public :: IPPORT_DAYTIME    = 13
integer, parameter, public :: IPPORT_NETSTAT    = 15
integer, parameter, public :: IPPORT_FTP        = 21
integer, parameter, public :: IPPORT_TELNET     = 23
integer, parameter, public :: IPPORT_SMTP       = 25
integer, parameter, public :: IPPORT_TIMESERVER = 37
integer, parameter, public :: IPPORT_NAMESERVER = 42
integer, parameter, public :: IPPORT_WHOIS      = 43
integer, parameter, public :: IPPORT_MTP        = 57

! 
!  * Port/socket numbers: host specific functions
!

integer, parameter, public :: IPPORT_TFTP       = 69
integer, parameter, public :: IPPORT_RJE        = 77
integer, parameter, public :: IPPORT_FINGER     = 79
integer, parameter, public :: IPPORT_TTYLINK    = 87
integer, parameter, public :: IPPORT_SUPDUP     = 95

! 
!  * UNIX TCP sockets
!

integer, parameter, public :: IPPORT_EXECSERVER     = 512
integer, parameter, public :: IPPORT_LOGINSERVER    = 513
integer, parameter, public :: IPPORT_CMDSERVER      = 514
integer, parameter, public :: IPPORT_EFSSERVER      = 520

! 
!  * UNIX UDP sockets
!

integer, parameter, public :: IPPORT_BIFFUDP        = 512
integer, parameter, public :: IPPORT_WHOSERVER      = 513
integer, parameter, public :: IPPORT_ROUTESERVER    = 520  !   520+1 also used   

! 
!  * Ports < IPPORT_RESERVED are reserved for
!  * privileged processes (e.g. root).
!  

integer, parameter, public :: IPPORT_RESERVED = 1024

! 
!  * Link numbers
!

integer, parameter, public :: IMPLINK_IP        = 155
integer, parameter, public :: IMPLINK_LOWEXPER  = 156
integer, parameter, public :: IMPLINK_HIGHEXPER = 158

! 
!   Internet address (old style... should be updated)
!  
type T_S$_un_b 
    character s_b1
    character s_b2
    character s_b3
    character s_b4
end type T_S$_un_b

type T_S$_un_w 
    integer(2) s_w1
    integer(2) s_w2
end type T_S$_un_w

type T_S$_un
    union
        map
            type (T_S$_un_b) S_un_b
        end map
        map
            type (T_S$_un_w) S_un_w
        end map
        map
            integer(4)  S_addr
        end map
    end union
end type T_S$_un

type T_in_addr
    type (T_S$_un) S_un
end type T_in_addr

! 
!  * Definitions of bits in internet address integers.
!  * On subnets, the decomposition of addresses to host and net parts
!  * is done according to subnet mask, not the masks here.
!

integer, parameter, public :: IN_CLASSA_NET     =  -16777216  !#ff000000
integer, parameter, public :: IN_CLASSA_NSHIFT  = 24
integer, parameter, public :: IN_CLASSA_HOST    =  #00ffffff
integer, parameter, public :: IN_CLASSA_MAX     = 128

!#define IN_CLASSB(i)            (((long)(i) & 0xc0000000) == 0x80000000)
integer, parameter, public :: IN_CLASSB_NET     =  -65535 !#ffff0000
integer, parameter, public :: IN_CLASSB_NSHIFT  = 16
integer, parameter, public :: IN_CLASSB_HOST    =  #0000ffff
integer, parameter, public :: IN_CLASSB_MAX     = 65536

!#define IN_CLASSC(i)            (((long)(i) & 0xe0000000) == 0xc0000000)
integer, parameter, public :: IN_CLASSC_NET     =  -255 !#ffffff00
integer, parameter, public :: IN_CLASSC_NSHIFT  = 8
integer, parameter, public :: IN_CLASSC_HOST    =  #000000ff

integer, parameter, public :: INADDR_ANY              = #00000000
integer, parameter, public :: INADDR_LOOPBACK   =  #7f000001
integer, parameter, public :: INADDR_BROADCAST  = -1 !0xffffffff    
integer, parameter, public :: INADDR_NONE       =  -1 !#ffffffff

! 
!  * Socket address, internet style.
!  
!

type T_sockaddr_in 
    integer*2 sin_family
    integer*2 sin_port
    type (T_in_addr) sin_addr
    character*1 sin_zero(8)
end type T_sockaddr_in

integer, parameter, public :: WSADESCRIPTION_LEN    = 256
integer, parameter, public :: WSASYS_STATUS_LEN     = 128

type  T_WSADATA
    integer*2 wVersion 
    integer*2 wHighVersion 
    character                     szDescription (WSADESCRIPTION_LEN +1)
    character                     szSystemStatus (WSASYS_STATUS_LEN +1 )
    integer           *2 iMaxSockets 
    integer           *2 iMaxUdpDg  
    character(100)     lpVendorInfo !!!! it is actually a char*
end type  T_WSADATA


! 
!  * Options for use with [gs]etsockopt at the IP level.
!  
!

integer, parameter, public :: IP_OPTIONS = 1               !  set/get IP per-packet options   

! 
!  * Definitions related to sockets: types, address families, options,
!  * taken from the BSD file sys/socket.h.
!  
!


! 
!  * This is used instead of -1, since the
!  * SOCKET type is unsigned.
!  
!

integer, parameter, public :: INVALID_SOCKET    = -1 !(SOCKET)(~0)
integer, parameter, public :: SOCKET_ERROR      = (-1)

! 
!  * Types
!  
!

integer, parameter, public :: SOCK_STREAM       = 1               !  stream socket   
integer, parameter, public :: SOCK_DGRAM        = 2               !  datagram socket   
integer, parameter, public :: SOCK_RAW          = 3               !  raw-protocol interface   
integer, parameter, public :: SOCK_RDM          = 4               !  reliably-delivered message   
integer, parameter, public :: SOCK_SEQPACKET    = 5               !  sequenced packet stream   

! 
!  * Option flags per-socket.
!  
!

integer, parameter, public :: SO_DEBUG          =  #0001          !  turn on debugging info recording   
integer, parameter, public :: SO_ACCEPTCONN     =  #0002          !  socket has had listen()   
integer, parameter, public :: SO_REUSEADDR      =  #0004          !  allow local address reuse   
integer, parameter, public :: SO_KEEPALIVE      =  #0008          !  keep connections alive   
integer, parameter, public :: SO_DONTROUTE      =  #0010          !  just use interface addresses   
integer, parameter, public :: SO_BROADCAST      =  #0020          !  permit sending of broadcast msgs   
integer, parameter, public :: SO_USELOOPBACK    =  #0040          !  bypass hardware when possible   
integer, parameter, public :: SO_LINGER         =  #0080          !  T_linger on close if data present   
integer, parameter, public :: SO_OOBINLINE      =  #0100          !  leave received OOB data in line   

integer, parameter, public :: SO_DONTLINGER     = -129 !NOT(SO_LINGER)

! 
!  * Additional options.
!  
!

integer, parameter, public :: SO_SNDBUF     =  #1001          !  send buffer size   
integer, parameter, public :: SO_RCVBUF     =  #1002          !  receive buffer size   
integer, parameter, public :: SO_SNDLOWAT   =  #1003          !  send low-water mark   
integer, parameter, public :: SO_RCVLOWAT   =  #1004          !  receive low-water mark   
integer, parameter, public :: SO_SNDTIMEO   =  #1005          !  send timeout   
integer, parameter, public :: SO_RCVTIMEO   =  #1006          !  receive timeout   
integer, parameter, public :: SO_ERROR      =  #1007          !  get error status and clear   
integer, parameter, public :: SO_TYPE       =  #1008          !  get socket type   

! 
!  * Options for connect and disconnect data and options.  Used only by
!  * non-TCP/IP transports such as DECNet, OSI TP4, etc.
!  
!

integer, parameter, public :: SO_CONNDATA       =  #7000
integer, parameter, public :: SO_CONNOPT        =  #7001
integer, parameter, public :: SO_DISCDATA       =  #7002
integer, parameter, public :: SO_DISCOPT        =  #7003
integer, parameter, public :: SO_CONNDATALEN    =  #7004
integer, parameter, public :: SO_CONNOPTLEN     =  #7005
integer, parameter, public :: SO_DISCDATALEN    =  #7006
integer, parameter, public :: SO_DISCOPTLEN     =  #7007

! 
!  * TCP options.
!  
!

integer, parameter, public :: TCP_NODELAY =  #0001

! 
!  * Address families.
!  
!

integer, parameter, public :: AF_UNSPEC     = 0               !  unspecified   
integer, parameter, public :: AF_UNIX       = 1               !  local to host (pipes, portals)   
integer, parameter, public :: AF_INET       = 2               !  internetwork: UDP, TCP, etc.   
integer, parameter, public :: AF_IMPLINK    = 3               !  arpanet imp addresses   
integer, parameter, public :: AF_PUP        = 4               !  pup protocols: e.g. BSP   
integer, parameter, public :: AF_CHAOS      = 5               !  mit CHAOS protocols   
integer, parameter, public :: AF_IPX        = 6               !  IPX and SPX   
integer, parameter, public :: AF_NS         = 6               !  XEROX NS protocols   
integer, parameter, public :: AF_ISO        = 7               !  ISO protocols   
integer, parameter, public :: AF_OSI        = AF_ISO          !   OSI is ISO   
integer, parameter, public :: AF_ECMA       = 8               !  european computer manufacturers   
integer, parameter, public :: AF_DATAKIT    = 9               !  datakit protocols   
integer, parameter, public :: AF_CCITT      = 10              !  CCITT protocols, X.25 etc   
integer, parameter, public :: AF_SNA        = 11              !  IBM SNA   
integer, parameter, public :: AF_DECnet     = 12              !  DECnet   
integer, parameter, public :: AF_DLI        = 13              !  Direct data link interface   
integer, parameter, public :: AF_LAT        = 14              !  LAT   
integer, parameter, public :: AF_HYLINK     = 15              !  NSC Hyperchannel   
integer, parameter, public :: AF_APPLETALK  = 16              !  AppleTalk   
integer, parameter, public :: AF_NETBIOS    = 17              !  NetBios-style addresses   

integer, parameter, public :: AF_MAX        = 18

! 
!  * Structure used by kernel to store most
!  * addresses.
!  
!

type T_sockaddr 
    integer*2 sa_family      !   address family   
    character sa_data(14)    !   up to 14 bytes of direct address   
end type T_sockaddr

! 
!  * Structure used by kernel to pass protocol
!  * information in raw sockets.
!  
!

type T_sockproto 
    integer*2 sp_family      ! address family   
    integer*2 sp_protocol    !   protocol   
end type T_sockproto

! 
!  * Protocol families, same as address families for now.
!  
!

integer, parameter, public :: PF_UNSPEC     = AF_UNSPEC
integer, parameter, public :: PF_UNIX       = AF_UNIX
integer, parameter, public :: PF_INET       = AF_INET
integer, parameter, public :: PF_IMPLINK    = AF_IMPLINK
integer, parameter, public :: PF_PUP        = AF_PUP
integer, parameter, public :: PF_CHAOS      = AF_CHAOS
integer, parameter, public :: PF_NS         = AF_NS
integer, parameter, public :: PF_IPX        = AF_IPX
integer, parameter, public :: PF_ISO        = AF_ISO
integer, parameter, public :: PF_OSI        = AF_OSI
integer, parameter, public :: PF_ECMA       = AF_ECMA
integer, parameter, public :: PF_DATAKIT    = AF_DATAKIT
integer, parameter, public :: PF_CCITT      = AF_CCITT
integer, parameter, public :: PF_SNA        = AF_SNA
integer, parameter, public :: PF_DECnet     = AF_DECnet
integer, parameter, public :: PF_DLI        = AF_DLI
integer, parameter, public :: PF_LAT        = AF_LAT
integer, parameter, public :: PF_HYLINK     = AF_HYLINK
integer, parameter, public :: PF_APPLETALK  = AF_APPLETALK

integer, parameter, public :: PF_MAX        = AF_MAX

! 
!  * Structure used for manipulating T_linger option.
!  
!

type T_linger 
    integer*2 l_onoff       !   option o  off */
    integer*2 l_linger       !   T_linger time   
end type T_linger

! 
!  * Level number for (get/set)sockopt() to apply to socket itself.
!  
!

integer, parameter, public :: SOL_SOCKET =  #ffff          !  options for socket level   

! 
!  * Maximum queue length specifiable by listen.
!  
!

integer, parameter, public :: SOMAXCONN = 5

integer, parameter, public :: MSG_OOB       =  #1             !  process out-of-band data   
integer, parameter, public :: MSG_PEEK      =  #2             !  peek at incoming message   
integer, parameter, public :: MSG_DONTROUTE =  #4             !  send without using routing tables   
integer, parameter, public :: MSG_MAXIOVLEN =  16
integer, parameter, public :: MSG_PARTIAL   =  #8000          !  partial send or recv for message xport   

! 
!  * Define constant based on rfc883, used by gethostbyxxxx() calls.
!  
!

integer, parameter, public :: MAXGETHOSTSTRUCT = 1024

! 
!  * Define flags to be used with the WSAAsyncSelect() call.
!  
!

integer, parameter, public :: FD_READ       =  #01
integer, parameter, public :: FD_WRITE      =  #02
integer, parameter, public :: FD_OOB        =  #04
integer, parameter, public :: FD_ACCEPT     =  #08
integer, parameter, public :: FD_CONNECT    =  #10
integer, parameter, public :: FD_CLOSE      =  #20

! 
!  * All Windows Sockets error constants are biased by WSABASEERR from
!  * the "normal"
!  
!

integer, parameter, public :: WSABASEERR = 10000
! 
!  * Windows Sockets definitions of regular Microsoft C error constants
!  
!

integer, parameter, public :: WSAEINTR                = (WSABASEERR+4)
integer, parameter, public :: WSAEBADF                = (WSABASEERR+9)
integer, parameter, public :: WSAEACCES               = (WSABASEERR+13)
integer, parameter, public :: WSAEFAULT               = (WSABASEERR+14)
integer, parameter, public :: WSAEINVAL               = (WSABASEERR+22)
integer, parameter, public :: WSAEMFILE               = (WSABASEERR+24)

! 
!  * Windows Sockets definitions of regular Berkeley error constants
!  
!

integer, parameter, public :: WSAEWOULDBLOCK          = (WSABASEERR+35)
integer, parameter, public :: WSAEINPROGRESS          = (WSABASEERR+36)
integer, parameter, public :: WSAEALREADY             = (WSABASEERR+37)
integer, parameter, public :: WSAENOTSOCK             = (WSABASEERR+38)
integer, parameter, public :: WSAEDESTADDRREQ         = (WSABASEERR+39)
integer, parameter, public :: WSAEMSGSIZE             = (WSABASEERR+40)
integer, parameter, public :: WSAEPROTOTYPE           = (WSABASEERR+41)
integer, parameter, public :: WSAENOPROTOOPT          = (WSABASEERR+42)
integer, parameter, public :: WSAEPROTONOSUPPORT      = (WSABASEERR+43)
integer, parameter, public :: WSAESOCKTNOSUPPORT      = (WSABASEERR+44)
integer, parameter, public :: WSAEOPNOTSUPP           = (WSABASEERR+45)
integer, parameter, public :: WSAEPFNOSUPPORT         = (WSABASEERR+46)
integer, parameter, public :: WSAEAFNOSUPPORT         = (WSABASEERR+47)
integer, parameter, public :: WSAEADDRINUSE           = (WSABASEERR+48)
integer, parameter, public :: WSAEADDRNOTAVAIL        = (WSABASEERR+49)
integer, parameter, public :: WSAENETDOWN             = (WSABASEERR+50)
integer, parameter, public :: WSAENETUNREACH          = (WSABASEERR+51)
integer, parameter, public :: WSAENETRESET            = (WSABASEERR+52)
integer, parameter, public :: WSAECONNABORTED         = (WSABASEERR+53)
integer, parameter, public :: WSAECONNRESET           = (WSABASEERR+54)
integer, parameter, public :: WSAENOBUFS              = (WSABASEERR+55)
integer, parameter, public :: WSAEISCONN              = (WSABASEERR+56)
integer, parameter, public :: WSAENOTCONN             = (WSABASEERR+57)
integer, parameter, public :: WSAESHUTDOWN            = (WSABASEERR+58)
integer, parameter, public :: WSAETOOMANYREFS         = (WSABASEERR+59)
integer, parameter, public :: WSAETIMEDOUT            = (WSABASEERR+60)
integer, parameter, public :: WSAECONNREFUSED         = (WSABASEERR+61)
integer, parameter, public :: WSAELOOP                = (WSABASEERR+62)
integer, parameter, public :: WSAENAMETOOLONG         = (WSABASEERR+63)
integer, parameter, public :: WSAEHOSTDOWN            = (WSABASEERR+64)
integer, parameter, public :: WSAEHOSTUNREACH         = (WSABASEERR+65)
integer, parameter, public :: WSAENOTEMPTY            = (WSABASEERR+66)
integer, parameter, public :: WSAEPROCLIM             = (WSABASEERR+67)
integer, parameter, public :: WSAEUSERS               = (WSABASEERR+68)
integer, parameter, public :: WSAEDQUOT               = (WSABASEERR+69)
integer, parameter, public :: WSAESTALE               = (WSABASEERR+70)
integer, parameter, public :: WSAEREMOTE              = (WSABASEERR+71)

integer, parameter, public :: WSAEDISCON              = (WSABASEERR+101)

! 
!  * Extended Windows Sockets error constant definitions
!  
!

integer, parameter, public :: WSASYSNOTREADY          = (WSABASEERR+91)
integer, parameter, public :: WSAVERNOTSUPPORTED      = (WSABASEERR+92)
integer, parameter, public :: WSANOTINITIALISED       = (WSABASEERR+93)

! 
!  * Error return codes from gethostbyname() and gethostbyaddr()
!  * (when using the resolver). Note that these errors are
!  * retrieved via WSAGetLastError() and must therefore follow
!  * the rules for avoiding clashes with error numbers from
!  * specific implementations or language run-time systems.
!  * For this reason the codes are based at WSABASEERR+1001.
!  * Note also that [WSA]NO_ADDRESS is defined only for
!  * compatibility purposes.
!  
!


integer, parameter, public :: h_errno         = 0 !WSAGetLastError()

!   Authoritative Answer: Host not found   
integer, parameter, public :: WSAHOST_NOT_FOUND         = (WSABASEERR+1001)
integer, parameter, public :: HOST_NOT_FOUND            = WSAHOST_NOT_FOUND

!   Non-Authoritative: Host not found, or SERVERFAIL   
integer, parameter, public :: WSATRY_AGAIN              = (WSABASEERR+1002)
integer, parameter, public :: TRY_AGAIN                 = WSATRY_AGAIN

!   Non recoverable errors, FORMERR, REFUSED, NOTIMP   
integer, parameter, public :: WSANO_RECOVERY            = (WSABASEERR+1003)
integer, parameter, public :: NO_RECOVERY               = WSANO_RECOVERY

!   Valid name, no data record of requested type   
integer, parameter, public :: WSANO_DATA                = (WSABASEERR+1004)
integer, parameter, public :: NO_DATA                   = WSANO_DATA

!   no address, look for MX record   
integer, parameter, public :: WSANO_ADDRESS             = WSANO_DATA
integer, parameter, public :: NO_ADDRESS                = WSANO_ADDRESS




!*********************************** WINDOWS CONSTANTS *********************************** 

integer*4, parameter, public :: LANG_SYSTEM_DEFAULT =  #00000800
integer*4, parameter, public :: LANG_USER_DEFAULT        =  #00000400
integer*4, parameter, public :: LOCALE_SYSTEM_DEFAULT    =  #00000800
integer*4, parameter, public :: LOCALE_USER_DEFAULT      =  #00000400
integer*4, parameter, public :: CONTEXT_CONTROL          =  #00000001
integer*4, parameter, public :: CONTEXT_INTEGER          =  #00000002
integer*4, parameter, public :: CONTEXT_SEGMENTS         =  #00000004
integer*4, parameter, public :: CONTEXT_FLOATING_POINT   =  #00000008
integer*4, parameter, public :: CONTEXT_DEBUG_REGISTERS  =  #00000010
integer*4, parameter, public :: CONTEXT_FULL   =  #00000007
integer*4, parameter, public :: PROCESS_ALL_ACCESS  =  #001F0FFF
integer*4, parameter, public :: THREAD_ALL_ACCESS  =  #001F03FF
integer*4, parameter, public :: EVENT_ALL_ACCESS  =  #001F0003
integer*4, parameter, public :: MUTANT_ALL_ACCESS  =  #001F0001
integer*4, parameter, public :: SEMAPHORE_ALL_ACCESS  =  #001F0003
integer*4, parameter, public :: SECTION_ALL_ACCESS  =  #000F001F
integer*4, parameter, public :: FILE_ALL_ACCESS  =  #001F01FF
integer*4, parameter, public :: FILE_GENERIC_READ   =  #00120089
integer*4, parameter, public :: FILE_GENERIC_WRITE   =  #00120116
integer*4, parameter, public :: FILE_GENERIC_EXECUTE    =  #001200A0
integer*4, parameter, public :: IO_COMPLETION_ALL_ACCESS  =  #001F0003
integer*4, parameter, public :: TOKEN_ALL_ACCESS  =  #000F00FF
integer*4, parameter, public :: TOKEN_READ        =  #00020008
integer*4, parameter, public :: TOKEN_WRITE       =  #000200E0
integer*4, parameter, public :: KEY_READ    =  #00020019
integer*4, parameter, public :: KEY_WRITE   =  #00020006
integer*4, parameter, public :: KEY_EXECUTE   =  #00020019
integer*4, parameter, public :: KEY_ALL_ACCESS   =  #000F003F
integer*4, parameter, public :: REG_LEGAL_OPTION  =  #00000007
integer*4, parameter, public :: REG_LEGAL_CHANGE_FILTER   =  #0000000F
integer*4, parameter, public :: SERVICE_DRIVER    =  #0000000B
integer*4, parameter, public :: SERVICE_WIN32     =  #00000030
integer*4, parameter, public :: SERVICE_TYPE_ALL      =  #0000003F
integer*4, parameter, public :: SECURITY_ANONYMOUS       =  #00000000
integer*4, parameter, public :: SECURITY_IDENTIFICATION  =  #00010000
integer*4, parameter, public :: SECURITY_IMPERSONATION   =  #00020000
integer*4, parameter, public :: SECURITY_DELEGATION      =  #00030000
integer*4, parameter, public :: MUTEX_ALL_ACCESS  =  #001F0001
integer*4, parameter, public :: GHND  =  #00000042
integer*4, parameter, public :: GPTR  =  #00000040
integer*4, parameter, public :: LHND  =  #00000042
integer*4, parameter, public :: LPTR  =  #00000040
integer*4, parameter, public :: FILE_MAP_ALL_ACCESS  =  #000F001F
integer*4, parameter, public :: EXCEPTION_GUARD_PAGE     =  #80000001
integer*4, parameter, public :: FS_VOL_IS_COMPRESSED     =  #00008000
integer*4, parameter, public :: FS_FILE_COMPRESSION      =  #00000010
integer*4, parameter, public :: DCB_SET  =  #00000003
integer*4, parameter, public :: CLIP_LH_ANGLES  =  #00000010
integer*4, parameter, public :: CLIP_TT_ALWAYS  =  #00000020
integer*4, parameter, public :: CLIP_EMBEDDED  =  #00000080
integer*4, parameter, public :: FF_DONTCARE  =  #00000000
integer*4, parameter, public :: FF_ROMAN  =  #00000010
integer*4, parameter, public :: FF_SWISS  =  #00000020
integer*4, parameter, public :: FF_MODERN  =  #00000030
integer*4, parameter, public :: FF_SCRIPT  =  #00000040
integer*4, parameter, public :: FF_DECORATIVE  =  #00000050
integer*4, parameter, public :: RT_CURSOR             =  #00000001
integer*4, parameter, public :: RT_BITMAP             =  #00000002
integer*4, parameter, public :: RT_ICON               =  #00000003
integer*4, parameter, public :: RT_MENU               =  #00000004
integer*4, parameter, public :: RT_DIALOG             =  #00000005
integer*4, parameter, public :: RT_STRING             =  #00000006
integer*4, parameter, public :: RT_FONTDIR            =  #00000007
integer*4, parameter, public :: RT_FONT               =  #00000008
integer*4, parameter, public :: RT_ACCELERATOR        =  #00000009
integer*4, parameter, public :: RT_RCDATA             =  #0000000A
integer*4, parameter, public :: RT_MESSAGETABLE       =  #0000000B
integer*4, parameter, public :: RT_GROUP_CURSOR       =  #0000000C
integer*4, parameter, public :: RT_GROUP_ICON         =  #0000000E
integer*4, parameter, public :: RT_VERSION            =  #00000010
integer*4, parameter, public :: RT_DLGINCLUDE         =  #00000011
integer*4, parameter, public :: WS_OVERLAPPEDWINDOW   =  #00CF0000
integer*4, parameter, public :: WS_POPUPWINDOW   =  #80880000
integer*4, parameter, public :: WS_TILEDWINDOW  =  #00CF0000
integer*4, parameter, public :: WVR_REDRAW      =  #00000300
integer*4, parameter, public :: QS_MOUSE        =  #00000006
integer*4, parameter, public :: QS_INPUT        =  #00000007
integer*4, parameter, public :: QS_ALLEVENTS    =  #000000BF
integer*4, parameter, public :: QS_ALLINPUT       =  #000000FF
integer*4, parameter, public :: IDC_ARROW             =  #00007F00
integer*4, parameter, public :: IDC_IBEAM             =  #00007F01
integer*4, parameter, public :: IDC_WAIT              =  #00007F02
integer*4, parameter, public :: IDC_CROSS             =  #00007F03
integer*4, parameter, public :: IDC_UPARROW           =  #00007F04
integer*4, parameter, public :: IDC_SIZE              =  #00007F80
integer*4, parameter, public :: IDC_ICON              =  #00007F81
integer*4, parameter, public :: IDC_SIZENWSE          =  #00007F82
integer*4, parameter, public :: IDC_SIZENESW          =  #00007F83
integer*4, parameter, public :: IDC_SIZEWE            =  #00007F84
integer*4, parameter, public :: IDC_SIZENS            =  #00007F85
integer*4, parameter, public :: IDC_SIZEALL           =  #00007F86
integer*4, parameter, public :: IDC_NO                =  #00007F88
integer*4, parameter, public :: IDC_APPSTARTING       =  #00007F8A
integer*4, parameter, public :: IDI_APPLICATION     =  #00007F00
integer*4, parameter, public :: IDI_HAND            =  #00007F01
integer*4, parameter, public :: IDI_QUESTION        =  #00007F02
integer*4, parameter, public :: IDI_EXCLAMATION     =  #00007F03
integer*4, parameter, public :: IDI_ASTERISK        =  #00007F04
integer*4, parameter, public :: WC_DIALOG         =  #00008002
integer*4, parameter, public :: LBS_STANDARD   =  #00A00003
integer*4, parameter, public :: VS_FILE_INFO  =  #00000010
integer*4, parameter, public :: IOC_INOUT      =  #00000000
integer*4, parameter, public :: FIONREAD    =  #FFFFB87F
integer*4, parameter, public :: FIONBIO     =  #FFFFFC7E
integer*4, parameter, public :: FIOASYNC    =  #8004407D
integer*4, parameter, public :: SIOCSHIWAT  =  #FFFF8400
integer*4, parameter, public :: SIOCGHIWAT  =  #FFFFC801
integer*4, parameter, public :: SIOCSLOWAT  =  #80040C02
integer*4, parameter, public :: SIOCGLOWAT  =  #40045003
integer*4, parameter, public :: SIOCATMARK  =  #FFFF9407
integer*4, parameter, public :: SERVICE_STATE_ALL   =  #00000000
integer*4, parameter, public :: SC_MANAGER_ALL_ACCESS    =  #000F0000
integer*4, parameter, public :: SERVICE_ALL_ACCESS     =  #000F0000
integer*4, parameter, public :: SERVER_ALL_ACCESS    =  #000F0000
integer*4, parameter, public :: SERVER_READ    =  #00020000
integer*4, parameter, public :: SERVER_WRITE   =  #00020000
integer*4, parameter, public :: SERVER_EXECUTE   =  #00020000
integer*4, parameter, public :: PRINTER_ALL_ACCESS   =  #000F0000
integer*4, parameter, public :: PRINTER_READ         =  #00020000
integer*4, parameter, public :: PRINTER_WRITE        =  #00020000
integer*4, parameter, public :: PRINTER_EXECUTE      =  #00020000
integer*4, parameter, public :: JOB_ALL_ACCESS        =  #000F0000
integer*4, parameter, public :: JOB_READ              =  #00020000
integer*4, parameter, public :: JOB_WRITE             =  #00020000
integer*4, parameter, public :: JOB_EXECUTE           =  #00020000
integer*4, parameter, public :: PERF_COUNTER_COUNTER  =  #00000000
integer*4, parameter, public :: PERF_COUNTER_TIMER  =  #00000000
integer*4, parameter, public :: PERF_COUNTER_QUEUELEN_TYPE   =  #00000000
integer*4, parameter, public :: PERF_COUNTER_BULK_COUNT  =  #00000000
integer*4, parameter, public :: PERF_COUNTER_TEXT  =  #00000000
integer*4, parameter, public :: PERF_COUNTER_RAWCOUNT  =  #00000000
integer*4, parameter, public :: PERF_SAMPLE_FRACTION  =  #00000000
integer*4, parameter, public :: PERF_SAMPLE_COUNTER  =  #00000000
integer*4, parameter, public :: PERF_COUNTER_NODATA  =  #00000000
integer*4, parameter, public :: PERF_COUNTER_TIMER_INV  =  #00000000
integer*4, parameter, public :: PERF_SAMPLE_BASE  =  #00000001
integer*4, parameter, public :: PERF_AVERAGE_TIMER  =  #00000000
integer*4, parameter, public :: PERF_AVERAGE_BASE  =  #00000002
integer*4, parameter, public :: PERF_AVERAGE_BULK  =  #00000000
integer*4, parameter, public :: PERF_100NSEC_TIMER  =  #00000000
integer*4, parameter, public :: PERF_100NSEC_TIMER_INV  =  #00000000
integer*4, parameter, public :: PERF_COUNTER_MULTI_TIMER  =  #00000000
integer*4, parameter, public :: PERF_COUNTER_MULTI_TIMER_INV  =  #00000000
integer*4, parameter, public :: PERF_COUNTER_MULTI_BASE   =  #00000000
integer*4, parameter, public :: PERF_100NSEC_MULTI_TIMER   =  #00000000
integer*4, parameter, public :: PERF_100NSEC_MULTI_TIMER_INV  =  #00000000
integer*4, parameter, public :: PERF_RAW_FRACTION  =  #00000000
integer*4, parameter, public :: PERF_RAW_BASE  =  #00000003
integer*4, parameter, public :: PERF_ELAPSED_TIME  =  #00000000
integer*4, parameter, public :: CF_BOTH    =  #00000003
integer*4, parameter, public :: DDE_FACKRESERVED  =  #FFFF3F00
integer*4, parameter, public :: DDE_FADVRESERVED  =  #FFFF3FFF
integer*4, parameter, public :: DDE_FADTRESERVED  =  #FFFF4FFF
integer*4, parameter, public :: DDE_FPOKRESERVED  =  #FFFFDFFF
integer*4, parameter, public :: XTYP_ERROR  =  #00008002
integer*4, parameter, public :: XTYP_ADVDATA  =  #00004010
integer*4, parameter, public :: XTYP_ADVREQ  =  #00002022
integer*4, parameter, public :: XTYP_ADVSTART  =  #00001030
integer*4, parameter, public :: XTYP_ADVSTOP  =  #00008040
integer*4, parameter, public :: XTYP_EXECUTE  =  #00004050
integer*4, parameter, public :: XTYP_CONNECT  =  #00001062
integer*4, parameter, public :: XTYP_CONNECT_CONFIRM  =  #00008072
integer*4, parameter, public :: XTYP_XACT_COMPLETE  =  #00008080
integer*4, parameter, public :: XTYP_POKE  =  #00004090
integer*4, parameter, public :: XTYP_REGISTER  =  #000080A2
integer*4, parameter, public :: XTYP_REQUEST  =  #000020B0
integer*4, parameter, public :: XTYP_DISCONNECT  =  #000080C2
integer*4, parameter, public :: XTYP_UNREGISTER  =  #000080D2
integer*4, parameter, public :: XTYP_WILDCONNECT  =  #000020E2
integer*4, parameter, public :: XTYP_MONITOR  =  #000080F2
integer*4, parameter, public :: NDDE_SHAREDB_ADMIN   =  #000E0000
integer*4, parameter, public :: NDDE_SHAREDB_OPER    =  #00000000
integer*4, parameter, public :: NDDE_SHAREDB_POWER   =  #00000000
integer*4, parameter, public :: NDDE_SHAREDB_USER    =  #00000000
integer*4, parameter, public :: NDDE_SHAREDB_EVERYONE    =  #00000000
integer*4, parameter, public :: NDDE_SHARE_GENERIC_READ  =  #00000000
integer*4, parameter, public :: NDDE_SHARE_GENERIC_WRITE  =  #00010000
integer*4, parameter, public :: NDDE_SHARE_GENERIC_EXECUTE  =  #00000000
integer*4, parameter, public :: NDDE_SHARE_GENERIC_ALL  =  #000F0000
integer*4, parameter, public :: NDDE_ITEM_GENERIC_READ    =  #00000000
integer*4, parameter, public :: NDDE_ITEM_GENERIC_ALL      =  #000F0000
integer*4, parameter, public :: NDDE_GUI_READ_LINK   =  #00000000
integer*4, parameter, public :: NDDE_GUI_CHANGE      =  #00010000
integer*4, parameter, public :: ASN_INTEGER            =  #00000002
integer*4, parameter, public :: ASN_OCTETSTRING        =  #00000004
integer*4, parameter, public :: ASN_NULL               =  #00000005
integer*4, parameter, public :: ASN_OBJECTIDENTIFIER   =  #00000006
integer*4, parameter, public :: ASN_SEQUENCE           =  #00000010
integer*4, parameter, public :: ASN_SEQUENCEOF  =  #00000010
integer*4, parameter, public :: ASN_RFC1155_IPADDRESS   =  #00000000
integer*4, parameter, public :: ASN_RFC1155_COUNTER     =  #00000001
integer*4, parameter, public :: ASN_RFC1155_GAUGE       =  #00000002
integer*4, parameter, public :: ASN_RFC1155_TIMETICKS   =  #00000003
integer*4, parameter, public :: ASN_RFC1155_OPAQUE      =  #00000004
integer*4, parameter, public :: ASN_RFC1213_DISPSTRING  =  #00000004
integer*4, parameter, public :: ASN_RFC1157_GETREQUEST      =  #00000000
integer*4, parameter, public :: ASN_RFC1157_GETNEXTREQUEST  =  #00000001
integer*4, parameter, public :: ASN_RFC1157_GETRESPONSE     =  #00000002
integer*4, parameter, public :: ASN_RFC1157_SETREQUEST      =  #00000003
integer*4, parameter, public :: ASN_RFC1157_TRAP            =  #00000004
integer*4, parameter, public :: VDMCONTEXT_CONTROL          =  #00000001
integer*4, parameter, public :: VDMCONTEXT_INTEGER          =  #00000002
integer*4, parameter, public :: VDMCONTEXT_SEGMENTS         =  #00000004
integer*4, parameter, public :: VDMCONTEXT_FLOATING_POINT   =  #00000008
integer*4, parameter, public :: VDMCONTEXT_DEBUG_REGISTERS  =  #00000010
integer*4, parameter, public :: VDMCONTEXT_FULL  =  #00000007
integer*4, parameter, public :: TBSTYLE_CHECKGROUP   =  #00000000
integer*4, parameter, public :: FSCTL_LOCK_VOLUME          =  #00090018
integer*4, parameter, public :: FSCTL_UNLOCK_VOLUME        =  #0009001C
integer*4, parameter, public :: FSCTL_DISMOUNT_VOLUME      =  #00090020
integer*4, parameter, public :: FSCTL_MOUNT_DBLS_VOLUME    =  #00090034
integer*4, parameter, public :: FSCTL_GET_COMPRESSION      =  #0009003C
integer*4, parameter, public :: FSCTL_SET_COMPRESSION      =  #00090040
integer*4, parameter, public :: FSCTL_READ_COMPRESSION     =  #00090047
integer*4, parameter, public :: FSCTL_WRITE_COMPRESSION    =  #0009004B
integer*4, parameter, public :: IOCTL_DISK_GET_DRIVE_GEOMETRY    =  #00070000
integer*4, parameter, public :: IOCTL_DISK_GET_PARTITION_INFO    =  #00074004
integer*4, parameter, public :: IOCTL_DISK_SET_PARTITION_INFO    =  #0007C008
integer*4, parameter, public :: IOCTL_DISK_GET_DRIVE_LAYOUT      =  #0007400C
integer*4, parameter, public :: IOCTL_DISK_SET_DRIVE_LAYOUT      =  #0007C010
integer*4, parameter, public :: IOCTL_DISK_VERIFY                =  #00070014
integer*4, parameter, public :: IOCTL_DISK_FORMAT_TRACKS         =  #0007C018
integer*4, parameter, public :: IOCTL_DISK_REASSIGN_BLOCKS       =  #0007C01C
integer*4, parameter, public :: IOCTL_DISK_PERFORMANCE           =  #00070020
integer*4, parameter, public :: IOCTL_DISK_IS_WRITABLE           =  #00070024
integer*4, parameter, public :: IOCTL_DISK_LOGGING               =  #00070028
integer*4, parameter, public :: IOCTL_DISK_FORMAT_TRACKS_EX      =  #0007C02C
integer*4, parameter, public :: IOCTL_DISK_CHECK_VERIFY      =  #00074800
integer*4, parameter, public :: IOCTL_DISK_MEDIA_REMOVAL     =  #00074804
integer*4, parameter, public :: IOCTL_DISK_EJECT_MEDIA       =  #00074808
integer*4, parameter, public :: IOCTL_DISK_LOAD_MEDIA        =  #0007480C
integer*4, parameter, public :: IOCTL_DISK_RESERVE           =  #00074810
integer*4, parameter, public :: IOCTL_DISK_RELEASE           =  #00074814
integer*4, parameter, public :: IOCTL_DISK_FIND_NEW_DEVICES  =  #00074818
integer*4, parameter, public :: IOCTL_DISK_REMOVE_DEVICE     =  #0007481C
integer*4, parameter, public :: IOCTL_DISK_GET_MEDIA_TYPES  =  #00070C00


!********************************************************************************************



end module msfwinty

!MS$ENDIF ! /* MSFWINTY_ */
