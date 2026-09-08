! **************************************************************************
!  This file is not guaranteed by Microsoft to be error free. Every effort
!  has been made to ensure proper data-types and declarations, but no
!  testing has been performed using this include file. Additionally, some
!  API's though listed, may not be compatible with the Microsoft Fortran
!  language.
! **************************************************************************
!MS$IF .NOT. DEFINED (MSFWIN_ )
!MS$DEFINE MSFWIN_  

               
module msfwin
use msfwinty

!ms$objcomment lib:"kernel32.lib"
!ms$objcomment lib:"user32.lib"
!ms$objcomment lib:"gdi32.lib"
!ms$objcomment lib:"advapi32.lib"
!ms$objcomment lib:"wsock32.lib"
!ms$objcomment lib:"comdlg32.lib"
!ms$objcomment lib:"shell32.lib"
!ms$objcomment lib:"version.lib"
!ms$objcomment lib:"msfwin.lib"
!ms$objcomment lib:"mpr.lib"
!ms$objcomment lib:"lz32.lib"
!ms$objcomment lib:"winspool.lib"
!ms$objcomment lib:"winmm.lib"

!                       ******WINNT******
interface
subroutine RtlCopyMemory (Destination,Source,Length) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RtlMoveMemory@12' :: RtlCopyMemory
integer(4)  Destination
integer(4)  Source
integer(4)  Length
end subroutine RtlCopyMemory
end interface

interface
subroutine RtlMoveMemory (Destination,Source,Length) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RtlMoveMemory@12' :: RtlMoveMemory
integer(4)  Destination
integer(4)  Source
integer(4)  Length
end subroutine RtlMoveMemory
end interface


interface
subroutine RtlFillMemory (Destination, Length, Fill) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RtlFillMemory@12' :: RtlFillMemory
integer(4)  Destination
integer(4)  Length
BYTE        Fill
end subroutine RtlFillMemory
end interface


interface
subroutine RtlZeroMemory (Destination, Length) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RtlZeroMemory@12' :: RtlZeroMemory
integer(4)  Destination
integer(4)  Length
end subroutine RtlZeroMemory
end interface


!               *****WINBASE*****

interface
integer(4) function  InterlockedIncrement (lpAddend ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InterlockedIncrement@4' :: InterlockedIncrement
integer lpAddend 
end function InterlockedIncrement
end interface

interface
integer(4) function  InterlockedDecrement (lpAddend) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InterlockedDecrement@4' :: InterlockedDecrement
integer lpAddend     
end function InterlockedDecrement
end interface

interface
integer(4) function  InterlockedExchange (Target ,Value  ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InterlockedExchange@8' :: InterlockedExchange
integer Target 
integer Value   
end function InterlockedExchange
end interface

interface
logical(4) function  FreeResource (hResData) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FreeResource@4' :: FreeResource
integer hResData   
end function FreeResource
end interface

interface
integer(4) function  LockResource (hResData       ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LockResource@4' :: LockResource 
integer hResData   
end function LockResource
end interface

!interface
!integer(4) function  WinMain (hInstance ,hPrevInstance ,lpCmdLine ,nShowCmd ) 
!!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinMain@16' :: WinMain
!integer hInstance 
!integer hPrevInstance 
!integer lpCmdLine 
!integer nShowCmd   
!end function WinMain
!end interface

interface
logical(4) function  FreeLibrary (hLibModule) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FreeLibrary@4' :: FreeLibrary 
integer hLibModule   
end function FreeLibrary
end interface

interface 
subroutine FreeLibraryAndExitThread (hLibModule, dwExitCode)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FreeLibraryAndExitThread@8' :: FreeLibraryAndExitThread
integer(4)     hLibModule
integer(4)     dwExitCode
end subroutine FreeLibraryAndExitThread
end interface

interface
logical(4) function DisableThreadLibraryCalls (hLibModule)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DisableThreadLibraryCalls@4' ::  DisableThreadLibraryCalls
integer(4)     hLibModule
end function DisableThreadLibraryCalls
end interface

interface
integer(4) function  GetProcAddress (hModule ,lpProcName) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetProcAddress@8' :: GetProcAddress 
!MS$ ATTRIBUTES REFERENCE :: lpProcName
integer         hModule 
character*(*)   lpProcName   
end function GetProcAddress
end interface

interface
integer(4) function  GetVersion () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetVersion@0' :: GetVersion 
end function GetVersion
end interface

interface
integer(4) function  GlobalAlloc (uFlags ,dwBytes ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalAlloc@8' :: GlobalAlloc 
integer uFlags 
integer dwBytes   
end function GlobalAlloc
end interface

interface
integer(4) function  GlobalReAlloc (hMem ,dwBytes ,uFlags    ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalReAlloc@12' :: GlobalReAlloc 
integer hMem 
integer dwBytes 
integer uFlags   
end function GlobalReAlloc
end interface

interface
integer(4) function  GlobalSize (hMem ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalSize@4' :: GlobalSize 
integer hMem   
end function GlobalSize
end interface

interface
integer(4) function  GlobalFlags (hMem   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalFlags@4' :: GlobalFlags 
integer hMem   
end function GlobalFlags
end interface

interface
integer(4) function  GlobalLock (hMem    ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalLock@4' :: GlobalLock 
integer hMem   
end function GlobalLock
end interface

! !!!MWH My version  win31 = DWORD WINAPI GlobalHandle(UINT)

interface
integer(4) function  GlobalHandle (pMem     ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalHandle@4' :: GlobalHandle 
integer pMem   
end function GlobalHandle
end interface

interface
logical(4) function  GlobalUnlock (hMem) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalUnlock@4' :: GlobalUnlock 
integer hMem   
end function GlobalUnlock
end interface

interface
integer(4) function  GlobalFree (hMem ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalFree@4' :: GlobalFree 
integer hMem   
end function GlobalFree
end interface

interface
integer(4) function  GlobalCompact (dwMinFree) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalCompact@4' :: GlobalCompact 
integer dwMinFree   
end function GlobalCompact
end interface

interface
subroutine  GlobalFix (hMem   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalFix@4' :: GlobalFix
integer hMem   
end subroutine GlobalFix
end interface

interface
subroutine  GlobalUnfix (hMem  ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalUnfix@4' :: GlobalUnfix
integer hMem   
end subroutine GlobalUnfix
end interface

interface
integer(4) function  GlobalWire (hMem ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalWire@4' :: GlobalWire 
integer hMem   
end function GlobalWire
end interface

interface
logical(4) function  GlobalUnWire (hMem ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalUnWire@4' :: GlobalUnWire 
integer(4)     hMem
end function GlobalUnWire
end interface

interface
subroutine  GlobalMemoryStatus (lpMstMemStat) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalMemoryStatus@4' :: GlobalMemoryStatus
!MS$ ATTRIBUTES REFERENCE :: lpMstMemStat
use msfwinty
type(T_MEMORYSTATUS)    lpMstMemStat   
end subroutine GlobalMemoryStatus
end interface

interface
integer(4) function  LocalAlloc (uFlags ,uBytes )  
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalAlloc@8' :: LocalAlloc 
integer uFlags 
integer uBytes   
end function LocalAlloc
end interface

interface
integer(4) function  LocalReAlloc (hMem ,uBytes ,uFlags   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalReAlloc@12' :: LocalReAlloc 
integer hMem 
integer uBytes 
integer uFlags   
end function LocalReAlloc
end interface

interface
integer(4) function  LocalLock (hMem   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalLock@4' :: LocalLock 
integer hMem   
end function LocalLock
end interface

interface
integer(4) function  LocalHandle (pMem   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalHandle@4' :: LocalHandle 
integer pMem   
end function LocalHandle
end interface

interface
logical(4) function  LocalUnlock (hMem) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalUnlock@4' :: LocalUnlock 
integer(4)     hMem
end function LocalUnlock
end interface

interface
integer(4) function  LocalSize (hMem   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalSize@4' :: LocalSize 
integer hMem   
end function LocalSize
end interface

interface
integer(4) function  LocalFlags (hMem   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalFlags@4' :: LocalFlags 
integer hMem   
end function LocalFlags
end interface

interface
integer(4) function  LocalFree (hMem   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalFree@4' :: LocalFree 
integer hMem   
end function LocalFree
end interface

interface
integer(4) function  LocalShrink (hMem ,cbNewSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalShrink@8' :: LocalShrink 
integer hMem 
integer cbNewSize   
end function LocalShrink
end interface

interface
integer(4) function  LocalCompact (uMinFree   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalCompact@4' :: LocalCompact 
integer uMinFree   
end function LocalCompact
end interface

interface
logical(4) function  FlushInstructionCache (hProcess ,lpBaseAddress ,dwSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FlushInstructionCache@12' :: FlushInstructionCache 
integer(4)     hProcess
integer lpBaseAddress 
integer dwSize   
end function FlushInstructionCache
end interface

interface
integer(4) function  VirtualAlloc (lpAddress ,dwSize ,flAllocationType ,flProtect   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VirtualAlloc@16' :: VirtualAlloc 
integer lpAddress 
integer dwSize 
integer flAllocationType 
integer flProtect   
end function VirtualAlloc
end interface

interface
logical(4) function  VirtualFree (lpAddress ,dwSize ,dwFreeType ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VirtualFree@12' :: VirtualFree 
integer lpAddress 
integer dwSize 
integer dwFreeType   
end function VirtualFree
end interface

interface
logical(4) function  VirtualProtect (lpAddress ,dwSize ,flNewProtect ,lpflOldProtect   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VirtualProtect@16' :: VirtualProtect 
integer lpAddress 
integer dwSize 
integer flNewProtect 
integer lpflOldProtect   
end function VirtualProtect
end interface

interface
integer(4) function  VirtualQuery (lpAddress ,lpBuffer ,dwLength   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VirtualQuery@12' :: VirtualQuery 
!MS$ ATTRIBUTES REFERENCE :: lpBuffer 
use msfwinty
integer                         lpAddress 
type(T_MEMORY_BASIC_INFORMATION)    lpBuffer 
integer                         dwLength   
end function VirtualQuery
end interface

interface
logical(4) function  VirtualProtectEx (hProcess ,lpAddress ,dwSize ,flNewProtect ,lpflOldProtect   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VirtualProtectEx@20' :: VirtualProtectEx 
integer hProcess 
integer lpAddress 
integer dwSize 
integer flNewProtect 
integer lpflOldProtect   
end function VirtualProtectEx
end interface

interface
integer(4) function  VirtualQueryEx (hProcess ,lpAddress ,lpBuffer ,dwLength) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VirtualQueryEx@16' :: VirtualQueryEx 
!MS$ ATTRIBUTES REFERENCE :: lpBuffer 
use msfwinty
integer                         hProcess 
integer                         lpAddress  
type(T_MEMORY_BASIC_INFORMATION)    lpBuffer 
integer                         dwLength   
end function VirtualQueryEx
end interface

interface
integer(4) function  HeapCreate (flOptions ,dwInitialSize ,dwMaximumSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HeapCreate@12' :: HeapCreate 
integer flOptions 
integer dwInitialSize 
integer dwMaximumSize   
end function HeapCreate
end interface

interface
logical(4) function  HeapDestroy (hHeap   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HeapDestroy@4' :: HeapDestroy 
integer hHeap   
end function HeapDestroy
end interface

interface
integer(4) function  HeapAlloc (hHeap ,dwFlags ,dwBytes   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HeapAlloc@12' :: HeapAlloc 
integer hHeap 
integer dwFlags 
integer dwBytes   
end function HeapAlloc
end interface

interface
integer(4) function  HeapReAlloc (hHeap ,dwFlags ,lpMem ,dwBytes   )
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HeapReAlloc@16' :: HeapReAlloc 
integer hHeap 
integer dwFlags 
integer lpMem 
integer dwBytes   
end function HeapReAlloc
end interface

interface
logical(4) function  HeapFree (hHeap ,dwFlags ,lpMem   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HeapFree@12' :: HeapFree 
integer hHeap 
integer dwFlags 
integer lpMem   
end function HeapFree
end interface

interface
integer(4) function  HeapSize (hHeap ,dwFlags ,lpMem   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HeapSize@12' :: HeapSize 
integer hHeap 
integer dwFlags 
integer lpMem   
end function HeapSize
end interface

interface
logical(4) function HeapValidate (hHeap, dwFlags, lpMem)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HeapValidate@12' :: HeapValidate
integer(4)  hHeap
integer(4)  dwFlags
integer(4)  lpMem
end function HeapValidate
end interface

interface
logical(4) function HeapCompact (hHeap, dwFlags)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HeapCompact@8' :: HeapCompact
integer(4)  hHeap
integer(4)  dwFlags
end function HeapCompact
end interface 


interface
integer(4) function  GetProcessHeap () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetProcessHeap@0' :: GetProcessHeap 
end function GetProcessHeap
end interface

interface 
integer(4) function GetProcessHeaps (NumberOfHeaps, ProcessHeaps )
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetProcessHeaps@8' :: GetProcessHeaps
integer(4)  NumberOfHeaps
integer(4)  ProcessHeaps
end function GetProcessHeaps
end interface

interface
logical(4) function HeapLock (hHeap)
!MS$ATTRIBUTES STDCALL, ALIAS : '_HeapLock@4' :: HeapLock
integer(4)  hHeap
end function HeapLock
end interface


interface
logical(4) function HeapUnlock (hHeap)
!MS$ATTRIBUTES STDCALL, ALIAS : '_HeapUnlock@4' :: HeapUnlock
integer(4)  hHeap
end function HeapUnLock
end interface


interface
logical(4) function HeapWalk (hHeap, lpEntry)
!MS$ATTRIBUTES STDCALL, ALIAS : '_HeapWalk@8' :: HeapWalk
integer(4)  hHeap
integer(4) lpEntry
end function HeapWalk
end interface


interface
logical(4) function GetBinaryType (lpApplicationName, lpBinaryType)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetBinaryTypeA@8' :: GetBinaryType
!MS$ATTRIBUTES REFERENCE :: lpApplicationName
character*(*)   lpApplicationName
integer         lpBinaryType
end function GetBinaryType
end interface

interface
logical(4) function GetShortPathName (lpszLongPath, lpszShortPath, cchBuffer)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetShortPathNameA@12' :: GetShortPathName
!MS$ATTRIBUTES REFERENCE :: lpszLongPath
!MS$ATTRIBUTES REFERENCE :: lpszShortPath
character*(*)   lpszLongPath
character*(*)   lpszShortPath
integer         cchBuffer
end function GetShortPathName
end interface

interface
logical(4) function GetProcessAffinityMask (hProcess, lpProcessAffinityMask, lpSystemAffinityMask)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetProcessAffinityMask@12' :: GetProcessAffinityMask
integer(4)  hProcess
integer(4)  lpProcessAffinityMask
integer(4)  lpSystemAffinityMask
end function GetProcessAffinityMask
end interface

interface
logical(4) function  GetProcessTimes (hProcess ,lpCreationTime ,lpExitTime ,lpKernelTime ,lpUserTime   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetProcessTimes@20' :: GetProcessTimes 
!MS$ATTRIBUTES REFERENCE :: lpCreationTime
!MS$ATTRIBUTES REFERENCE :: lpExitTime
!MS$ATTRIBUTES REFERENCE :: lpKernelTime
!MS$ATTRIBUTES REFERENCE :: lpUserTime
use msfwinty
integer         hProcess 
type(T_FILETIME)    lpCreationTime 
type(T_FILETIME)    lpExitTime 
type(T_FILETIME)    lpKernelTime 
type(T_FILETIME)    lpUserTime   
end function GetProcessTimes
end interface

interface
logical(4) function GetProcessWorkingSetSize (hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetProcessWorkingSetSize@12' :: GetProcessWorkingSetSize
integer(4)  hProcess
integer(4)  lpMinimumWorkingSetSize
integer(4)  lpMaximumWorkingSetSize
end function GetProcessWorkingSetSize
end interface

interface
logical(4) function SetProcessWorkingSetSize (hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetProcessWorkingSetSize@12' :: SetProcessWorkingSetSize
integer(4)  hProcess
integer(4)  dwMinimumWorkingSetSize
integer(4)  dwMaximumWorkingSetSize
end function SetProcessWorkingSetSize
end interface


interface
integer(4) function  OpenProcess (dwDesiredAccess ,bInheritHandle ,dwProcessId) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenProcess@12' :: OpenProcess 
integer     dwDesiredAccess 
logical(4)  bInheritHandle 
integer     dwProcessId   
end function OpenProcess
end interface

interface
integer(4) function  GetCurrentProcess () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCurrentProcess@0' :: GetCurrentProcess 
end function GetCurrentProcess
end interface

interface
integer(4) function  GetCurrentProcessId () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCurrentProcessId@0' :: GetCurrentProcessId 
end function GetCurrentProcessId
end interface

interface
subroutine  ExitProcess (uExitCode) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExitProcess@4' :: ExitProcess
integer uExitCode   
end subroutine ExitProcess
end interface

interface
logical(4) function  TerminateProcess (hProcess ,uExitCode) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TerminateProcess@8' :: TerminateProcess 
integer hProcess 
integer uExitCode   
end function TerminateProcess
end interface

interface
logical(4) function  GetExitCodeProcess (hProcess ,lpExitCode) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetExitCodeProcess@8' :: GetExitCodeProcess 
integer hProcess 
integer lpExitCode   
end function GetExitCodeProcess
end interface

interface
subroutine  FatalExit (ExitCode) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FatalExit@4' :: FatalExit
integer ExitCode   
end subroutine FatalExit
end interface

interface
integer(4) function  GetEnvironmentStrings () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetEnvironmentStringsA@0' :: GetEnvironmentStrings 
end function GetEnvironmentStrings
end interface

interface
logical(4) function FreeEnvironmentStrings (lpStr)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FreeEnvironmentStringsA@4' :: FreeEnvironmentStrings
!MS$ ATTRIBUTES REFERENCE :: lpStr
character*(*)   lpStr
end function FreeEnvironmentStrings
end interface

interface
subroutine  RaiseException (dwExceptionCode ,dwExceptionFlags ,nNumberOfArguments ,lpArguments   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RaiseException@16' :: RaiseException
integer dwExceptionCode 
integer dwExceptionFlags 
integer nNumberOfArguments 
integer lpArguments   
end subroutine RaiseException
end interface

interface
integer(4) function  UnhandledExceptionFilter (ExceptionInfo) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_UnhandledExceptionFilter@4' :: UnhandledExceptionFilter 
!MS$ ATTRIBUTES REFERENCE :: ExceptionInfo
use msfwinty
type(T_EXCEPTION_POINTERS)  ExceptionInfo   
end function UnhandledExceptionFilter
end interface

interface
integer(4) function  SetUnhandledExceptionFilter (lpTopLevelExceptionFilter) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetUnhandledExceptionFilter@4' :: SetUnhandledExceptionFilter 
integer lpTopLevelExceptionFilter   
end function SetUnhandledExceptionFilter
end interface

interface
integer(4) function  CreateThread (lpThreadAttributes ,dwStackSize ,lpStartAddress ,lpParameter ,dwCreationFlags ,lpThreadId   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateThread@24' :: CreateThread 
!MS$ ATTRIBUTES REFERENCE :: lpThreadAttributes
use msfwinty 
type(T_SECURITY_ATTRIBUTES)   lpThreadAttributes 
integer                     dwStackSize 
integer                     lpStartAddress 
integer                     lpParameter 
integer                     dwCreationFlags 
integer                     lpThreadId   
end function CreateThread
end interface

interface
integer(4) function  CreateRemoteThread (hProcess ,lpThreadAttributes ,dwStackSize ,lpStartAddress ,lpParameter ,dwCreationFlags ,lpThreadId   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateRemoteThread@28' :: CreateRemoteThread 
!MS$ ATTRIBUTES REFERENCE :: lpThreadAttributes
use msfwinty 
integer                     hProcess 
type(T_SECURITY_ATTRIBUTES)   lpThreadAttributes 
integer                     dwStackSize 
integer                     lpStartAddress 
integer                     lpParameter 
integer                     dwCreationFlags 
integer                     lpThreadId   
end function CreateRemoteThread
end interface

interface
integer(4) function  GetCurrentThread () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCurrentThread@0' :: GetCurrentThread 
end function GetCurrentThread
end interface

interface
integer(4) function  GetCurrentThreadId () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCurrentThreadId@0' :: GetCurrentThreadId 
end function GetCurrentThreadId
end interface

interface
integer(4) function SetThreadAffinityMask (hThread, dwThreadAffinityMask)
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetThreadAffinityMask@8' :: SetThreadAffinityMask
integer(4) hThread
integer(4) dwThreadAffinityMask
end function SetThreadAffinityMask
end interface

interface
logical(4) function  SetThreadPriority (hThread ,nPriority) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetThreadPriority@8' :: SetThreadPriority 
integer hThread 
integer nPriority   
end function SetThreadPriority
end interface

interface
integer(4) function  GetThreadPriority (hThread)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetThreadPriority@4' :: GetThreadPriority 
integer hThread   
end function GetThreadPriority
end interface

interface
logical(4) function  GetThreadTimes (hThread ,lpCreationTime ,lpExitTime ,lpKernelTime ,lpUserTime) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetThreadTimes@20' :: GetThreadTimes 
!MS$ ATTRIBUTES REFERENCE :: lpCreationTime
!MS$ ATTRIBUTES REFERENCE :: lpExitTime
!MS$ ATTRIBUTES REFERENCE :: lpKernelTime
!MS$ ATTRIBUTES REFERENCE :: lpUserTime
use msfwinty
integer         hThread 
type(T_FILETIME)    lpCreationTime 
type(T_FILETIME)    lpExitTime 
type(T_FILETIME)    lpKernelTime 
type(T_FILETIME)    lpUserTime   
end function GetThreadTimes
end interface

interface
subroutine  ExitThread (dwExitCode) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExitThread@4' :: ExitThread
integer dwExitCode   
end subroutine ExitThread
end interface

interface
logical(4) function  TerminateThread (hThread ,dwExitCode) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TerminateThread@8' :: TerminateThread 
integer hThread 
integer dwExitCode   
end function TerminateThread
end interface

interface
logical(4) function  GetExitCodeThread (hThread ,lpExitCode) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetExitCodeThread@8' :: GetExitCodeThread 
integer hThread 
integer lpExitCode   
end function GetExitCodeThread
end interface

interface
logical(4) function  GetThreadSelectorEntry (hThread ,dwSelector ,lpSelectorEntry   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetThreadSelectorEntry@12' :: GetThreadSelectorEntry 
integer hThread 
integer dwSelector 
integer lpSelectorEntry   
end function GetThreadSelectorEntry
end interface

interface
integer(4) function  GetLastError () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetLastError@0' :: GetLastError 
end function GetLastError
end interface

interface
subroutine  SetLastError (dwErrCode) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetLastError@4' :: SetLastError
integer dwErrCode   
end subroutine SetLastError
end interface

interface
logical(4) function  GetOverlappedResult (hFile ,lpOverlapped ,lpNumberOfBytesTransferred ,bWait   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetOverlappedResult@16' :: GetOverlappedResult 
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped 
use msfwinty
integer             hFile 
type(T_OVERLAPPED)    lpOverlapped 
integer             lpNumberOfBytesTransferred 
logical(4)          bWait   
end function GetOverlappedResult
end interface

interface
integer(4) function CreateIoCompletionPort (FileHandle, ExistingCompletionPort, &
                        CompletionKey, NumberOfConcurrentThreads)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateIoCompletionPort@16' :: CreateIoCompletionPort
integer(4) FileHandle
integer(4) ExistingCompletionPort
integer(4) CompletionKey
integer(4) NumberOfConcurrentThreads
end function
end interface


interface
logical(4) function GetQueuedCompletionStatus (CompletionPort, lpNumberOfBytesTransferred, lpCompletionKey, lpOverlapped, dwMilliseconds)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetQueuedCompletionStatus@20' :: GetQueuedCompletionStatus
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped
use msfwinty
integer             CompletionPort
integer             lpNumberOfBytesTransferred
integer             lpCompletionKey
type(T_OVERLAPPED)  lpOverlapped
integer(4)  dwMilliseconds
end function GetQueuedCompletionStatus
end interface

interface
integer(4) function  SetErrorMode (uMode) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetErrorMode@4' :: SetErrorMode 
integer uMode   
end function SetErrorMode
end interface

interface
logical(4) function  ReadProcessMemory (hProcess ,lpBaseAddress ,lpBuffer ,nSize ,lpNumberOfBytesRead   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadProcessMemory@20' :: ReadProcessMemory 
integer hProcess 
integer lpBaseAddress 
integer lpBuffer 
integer nSize 
integer lpNumberOfBytesRead   
end function ReadProcessMemory
end interface

interface
logical(4) function  WriteProcessMemory (hProcess ,lpBaseAddress ,lpBuffer ,nSize ,lpNumberOfBytesWritten   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteProcessMemory@20' :: WriteProcessMemory 
integer hProcess 
integer lpBaseAddress 
integer lpBuffer 
integer nSize 
integer lpNumberOfBytesWritten   
end function WriteProcessMemory
end interface

interface
logical(4) function  GetThreadContext (hThread ,lpContext) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetThreadContext@8' :: GetThreadContext
integer         hThread 
integer         lpContext   
end function GetThreadContext
end interface

interface
logical(4) function  SetThreadContext (hThread ,lpContext) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetThreadContext@8' :: SetThreadContext
integer         hThread 
integer         lpContext   
end function SetThreadContext
end interface

interface
integer(4) function  SuspendThread (hThread) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SuspendThread@4' :: SuspendThread
integer hThread   
end function SuspendThread
end interface

interface
integer(4) function  ResumeThread (hThread) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ResumeThread@4' :: ResumeThread
integer hThread   
end function ResumeThread
end interface

interface
subroutine  DebugBreak () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DebugBreak@0' :: DebugBreak
end subroutine DebugBreak
end interface

interface
logical(4) function  WaitForDebugEvent (lpDebugEvent ,dwMilliseconds) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WaitForDebugEvent@8' :: WaitForDebugEvent
!MS$ ATTRIBUTES REFERENCE :: lpDebugEvent
use msfwinty
type(T_DEBUG_EVENT) lpDebugEvent 
integer             dwMilliseconds   
end function WaitForDebugEvent
end interface

interface
logical(4) function  ContinueDebugEvent (dwProcessId ,dwThreadId ,dwContinueStatus) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ContinueDebugEvent@12' :: ContinueDebugEvent
integer dwProcessId 
integer dwThreadId 
integer dwContinueStatus   
end function ContinueDebugEvent
end interface

interface
logical(4) function  DebugActiveProcess (dwProcessId) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DebugActiveProcess@4' :: DebugActiveProcess
integer dwProcessId   
end function DebugActiveProcess
end interface

interface
subroutine  InitializeCriticalSection (lpCriticalSection) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitializeCriticalSection@4' :: InitializeCriticalSection
integer lpCriticalSection   
end subroutine InitializeCriticalSection
end interface

interface
subroutine  EnterCriticalSection (lpCriticalSection) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnterCriticalSection@4' :: EnterCriticalSection
integer lpCriticalSection   
end subroutine EnterCriticalSection
end interface

interface
subroutine  LeaveCriticalSection (lpCriticalSection) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LeaveCriticalSection@4' :: LeaveCriticalSection
integer lpCriticalSection   
end subroutine LeaveCriticalSection
end interface

interface
subroutine  DeleteCriticalSection (lpCriticalSection) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteCriticalSection@4' :: DeleteCriticalSection
integer lpCriticalSection   
end subroutine DeleteCriticalSection
end interface

interface
logical(4) function  SetEvent (hEvent) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetEvent@4' :: SetEvent
integer hEvent   
end function SetEvent
end interface

interface
logical(4) function  ResetEvent (hEvent) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ResetEvent@4' :: ResetEvent
integer hEvent   
end function ResetEvent
end interface

interface
logical(4) function  PulseEvent (hEvent) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PulseEvent@4' :: PulseEvent
integer hEvent   
end function PulseEvent
end interface

interface
logical(4) function  ReleaseSemaphore (hSemaphore ,lReleaseCount ,lpPreviousCount) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReleaseSemaphore@12' :: ReleaseSemaphore
integer hSemaphore 
integer lReleaseCount 
integer lpPreviousCount   
end function ReleaseSemaphore
end interface

interface
logical(4) function  ReleaseMutex (hMutex) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReleaseMutex@4' :: ReleaseMutex
integer hMutex   
end function ReleaseMutex
end interface

interface
integer(4) function  WaitForSingleObject (hHandle ,dwMilliseconds) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WaitForSingleObject@8' :: WaitForSingleObject
integer hHandle 
integer dwMilliseconds   
end function WaitForSingleObject
end interface

interface
integer(4) function  WaitForMultipleObjects (nCount ,lpHandles ,bWaitAll ,dwMilliseconds) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WaitForMultipleObjects@16' :: WaitForMultipleObjects
integer nCount 
integer lpHandles 
logical(4) bWaitAll 
integer dwMilliseconds   
end function WaitForMultipleObjects
end interface

interface
subroutine  Sleep (dwMilliseconds) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Sleep@4' :: Sleep
integer dwMilliseconds   
end subroutine Sleep
end interface

interface
integer(4) function  LoadResource (hModule ,hResInfo) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LoadResource@8' :: LoadResource
integer hModule 
integer hResInfo   
end function LoadResource
end interface

interface
integer(4) function  SizeofResource (hModule ,hResInfo) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SizeofResource@8' :: SizeofResource
integer hModule 
integer hResInfo   
end function SizeofResource
end interface

interface
integer(2) function  GlobalDeleteAtom (nAtom) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalDeleteAtom@4' :: GlobalDeleteAtom
integer(2)  nAtom   
end function GlobalDeleteAtom
end interface

interface
logical(4) function  InitAtomTable (nSize) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitAtomTable@4' :: InitAtomTable
integer nSize   
end function InitAtomTable
end interface

interface
integer(2) function  DeleteAtom (nAtom) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteAtom@4' :: DeleteAtom
integer(2)  nAtom   
end function DeleteAtom
end interface

interface
integer(4) function  SetHandleCount (uNumber) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetHandleCount@4' :: SetHandleCount
integer uNumber   
end function SetHandleCount
end interface

interface
integer(4) function  GetLogicalDrives () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetLogicalDrives@0' :: GetLogicalDrives
end function GetLogicalDrives
end interface

interface
logical(4) function  LockFile (hFile ,dwFileOffsetLow ,dwFileOffsetHigh ,nNumberOfBytesToLockLow ,nNumberOfBytesToLockHigh) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LockFile@20' :: LockFile
integer hFile 
integer dwFileOffsetLow 
integer dwFileOffsetHigh 
integer nNumberOfBytesToLockLow 
integer nNumberOfBytesToLockHigh   
end function LockFile
end interface

interface
logical(4) function  UnlockFile (hFile ,dwFileOffsetLow ,dwFileOffsetHigh ,nNumberOfBytesToUnlockLow ,nNumberOfBytesToUnlockHigh) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_UnlockFile@20' :: UnlockFile
integer hFile 
integer dwFileOffsetLow 
integer dwFileOffsetHigh 
integer nNumberOfBytesToUnlockLow 
integer nNumberOfBytesToUnlockHigh   
end function UnlockFile
end interface

interface
logical(4) function  LockFileEx (hFile ,dwFlags ,dwReserved ,nNumberOfBytesToLockLow ,nNumberOfBytesToLockHigh ,lpOverlapped) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LockFileEx@24' :: LockFileEx
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped
use msfwinty
integer             hFile 
integer             dwFlags 
integer             dwReserved 
integer             nNumberOfBytesToLockLow 
integer             nNumberOfBytesToLockHigh 
type(T_OVERLAPPED)  lpOverlapped   
end function LockFileEx
end interface


interface
logical(4) function  UnlockFileEx (hFile ,dwReserved ,nNumberOfBytesToUnlockLow ,nNumberOfBytesToUnlockHigh ,lpOverlapped) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_UnlockFileEx@20' :: UnlockFileEx
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped
use msfwinty
integer             hFile 
integer             dwReserved 
integer             nNumberOfBytesToUnlockLow 
integer             nNumberOfBytesToUnlockHigh 
type(T_OVERLAPPED)  lpOverlapped   
end function UnlockFileEx
end interface

interface
logical(4) function  GetFileInformationByHandle (hFile ,lpFileInformation) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetFileInformationByHandle@8' :: GetFileInformationByHandle
!MS$ ATTRIBUTES REFERENCE :: lpFileInformation
use msfwinty
integer                             hFile 
type(T_BY_HANDLE_FILE_INFORMATION)  lpFileInformation    
end function GetFileInformationByHandle
end interface

interface
integer(4) function  GetFileType (hFile) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetFileType@4' :: GetFileType
integer hFile   
end function GetFileType
end interface

interface
integer(4) function  GetFileSize (hFile ,lpFileSizeHigh) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetFileSize@8' :: GetFileSize
integer hFile 
integer lpFileSizeHigh   
end function GetFileSize
end interface

interface
integer(4) function  GetStdHandle (nStdHandle) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetStdHandle@4' :: GetStdHandle
integer nStdHandle   
end function GetStdHandle
end interface

interface
logical(4) function  SetStdHandle (nStdHandle ,hHandle) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetStdHandle@8' :: SetStdHandle
integer nStdHandle 
integer hHandle   
end function SetStdHandle
end interface

interface
logical(4) function  WriteFile (hFile ,lpBuffer ,nNumberOfBytesToWrite ,lpNumberOfBytesWritten ,lpOverlapped   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteFile@20' :: WriteFile
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped   
use msfwinty
integer             hFile 
integer             lpBuffer 
integer             nNumberOfBytesToWrite 
integer             lpNumberOfBytesWritten  
type(T_OVERLAPPED)    lpOverlapped   
end function WriteFile
end interface

interface
logical(4) function  ReadFile (hFile ,lpBuffer ,nNumberOfBytesToRead ,lpNumberOfBytesRead ,lpOverlapped   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadFile@20' :: ReadFile
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped   
use msfwinty
integer             hFile 
integer             lpBuffer 
integer             nNumberOfBytesToRead 
integer             lpNumberOfBytesRead 
type(T_OVERLAPPED)    lpOverlapped   
end function ReadFile
end interface

interface
logical(4) function  FlushFileBuffers (hFile) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FlushFileBuffers@4' :: FlushFileBuffers
integer hFile   
end function FlushFileBuffers
end interface

interface
logical(4) function  DeviceIoControl (hDevice ,dwIoControlCode ,lpInBuffer ,nInBufferSize ,lpOutBuffer ,nOutBufferSize, &
         lpBytesReturned, lpOverlapped)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeviceIoControl@32' :: DeviceIoControl
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped   
use msfwinty
integer             hDevice 
integer             dwIoControlCode 
integer             lpInBuffer 
integer             nInBufferSize 
integer             lpOutBuffer 
integer             nOutBufferSize 
integer             lpBytesReturned 
type(T_OVERLAPPED)    lpOverlapped   
end function DeviceIoControl
end interface

interface
logical(4) function  SetEndOfFile (hFile) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetEndOfFile@4' :: SetEndOfFile
integer hFile   
end function SetEndOfFile
end interface

interface
integer(4) function  SetFilePointer (hFile ,lDistanceToMove ,lpDistanceToMoveHigh ,dwMoveMethod   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetFilePointer@16' :: SetFilePointer
integer hFile 
integer lDistanceToMove 
integer lpDistanceToMoveHigh 
integer dwMoveMethod   
end function SetFilePointer
end interface

interface
logical(4) function  FindClose (hFindFile) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindClose@4' :: FindClose
integer hFindFile   
end function FindClose
end interface

interface
logical(4) function  GetFileTime (hFile ,lpCreationTime ,lpLastAccessTime ,lpLastWriteTime) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetFileTime@16' :: GetFileTime
!MS$ ATTRIBUTES REFERENCE :: lpCreationTime
!MS$ ATTRIBUTES REFERENCE :: lpLastAccessTime
!MS$ ATTRIBUTES REFERENCE :: lpLastWriteTime
use msfwinty
integer hFile 
type(T_FILETIME)    lpCreationTime 
type(T_FILETIME)    lpLastAccessTime 
type(T_FILETIME)    lpLastWriteTime   
end function GetFileTime
end interface

interface
logical(4) function  SetFileTime (hFile ,lpCreationTime ,lpLastAccessTime ,lpLastWriteTime) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetFileTime@16' :: SetFileTime
!MS$ ATTRIBUTES REFERENCE :: lpCreationTime
!MS$ ATTRIBUTES REFERENCE :: lpLastAccessTime
!MS$ ATTRIBUTES REFERENCE :: lpLastWriteTime
use msfwinty
integer hFile 
type(T_FILETIME)    lpCreationTime 
type(T_FILETIME)    lpLastAccessTime 
type(T_FILETIME)    lpLastWriteTime   
end function SetFileTime
end interface

interface
logical(4) function  CloseHandle (hObject) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CloseHandle@4' :: CloseHandle
integer hObject   
end function CloseHandle
end interface

interface
logical(4) function  DuplicateHandle (hSourceProcessHandle ,hSourceHandle ,hTargetProcessHandle ,lpTargetHandle ,dwDesiredAccess ,bInheritHandle ,dwOptions   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DuplicateHandle@28' :: DuplicateHandle
integer hSourceProcessHandle 
integer hSourceHandle 
integer hTargetProcessHandle 
integer lpTargetHandle 
integer dwDesiredAccess 
logical(4)  bInheritHandle 
integer dwOptions   
end function DuplicateHandle
end interface

interface
logical(4) function GetHandleInformation (hObject, lpdwFlags)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetHandleInformation@8' :: GetHandleInformation
integer(4)  hObject
integer(4)  lpdwFlags
end function GetHandleInformation
end interface

interface
logical(4) function SetHandleInformation (hObject, dwMask, dwFlags)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetHandleInformation@8' :: SetHandleInformation
integer(4)  hObject
integer(4)  dwMask
integer(4)  dwFlags
end function SetHandleInformation
end interface


interface
integer(4) function  LoadModule (lpModuleName ,lpParameterBlock   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LoadModule@8' :: LoadModule
!MS$ ATTRIBUTES REFERENCE :: lpModuleName
character*(*)   lpModuleName 
integer         lpParameterBlock   
end function LoadModule
end interface

interface
integer(4) function  WinExec (lpCmdLine ,uCmdShow) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WinExec@8' :: WinExec
!MS$ ATTRIBUTES REFERENCE :: lpCmdLine 
character*(*)   lpCmdLine 
integer         uCmdShow   
end function WinExec
end interface

interface
logical(4) function  ClearCommBreak (hFile) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ClearCommBreak@4' :: ClearCommBreak
integer hFile   
end function ClearCommBreak
end interface

interface
logical(4) function  ClearCommError (hFile ,lpErrors ,lpStat) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ClearCommError@12' :: ClearCommError
!MS$ ATTRIBUTES REFERENCE :: lpStat
use msfwinty
integer         hFile
integer         lpErrors
type(T_COMSTAT) lpStat
end function ClearCommError
end interface

interface
logical(4) function  SetupComm (hFile ,dwInQueue ,dwOutQueue   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetupComm@12' :: SetupComm
integer hFile 
integer dwInQueue 
integer dwOutQueue   
end function SetupComm
end interface

interface
logical(4) function  EscapeCommFunction (hFile ,dwFunc) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EscapeCommFunction@8' :: EscapeCommFunction
integer hFile 
integer dwFunc   
end function EscapeCommFunction
end interface

interface
logical(4) function GetCommConfig (hCommDev, lpCC, lpdwSize)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCommConfig@12' :: GetCommConfig
integer(4)  hCommDev
integer(4)  lpCC
integer(4)  lpdwSize
end function GetCommConfig
end interface

interface
integer(4) function  GetCommMask (hFile ,lpEvtMask) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCommMask@8' :: GetCommMask
integer hFile 
integer lpEvtMask   
end function GetCommMask
end interface

interface
logical(4) function  GetCommProperties (hFile ,lpCommProp) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCommProperties@8' :: GetCommProperties
integer hFile 
integer lpCommProp   
end function GetCommProperties
end interface

interface
logical(4) function  GetCommModemStatus (hFile ,lpModemStat) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCommModemStatus@8' :: GetCommModemStatus
integer hFile 
integer lpModemStat   
end function GetCommModemStatus
end interface

interface
logical(4) function  GetCommState (hFile ,lpDCB   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCommState@8' :: GetCommState
!MS$ ATTRIBUTES REFERENCE :: lpDCB
use msfwinty
integer     hFile 
type(T_DCB) lpDCB   
end function GetCommState
end interface

interface
logical(4) function  GetCommTimeouts (hFile ,lpCommTimeouts) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCommTimeouts@8' :: GetCommTimeouts
!MS$ ATTRIBUTES REFERENCE :: lpCommTimeouts
use msfwinty
integer             hFile 
type(T_COMMTIMEOUTS)    lpCommTimeouts   
end function GetCommTimeouts
end interface

interface
logical(4) function  PurgeComm (hFile ,dwFlags) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PurgeComm@8' :: PurgeComm
integer hFile 
integer dwFlags   
end function PurgeComm
end interface

interface
logical(4) function  SetCommBreak (hFile) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetCommBreak@4' :: SetCommBreak
integer hFile   
end function SetCommBreak
end interface

interface
logical(4) function SetCommConfig (hCommDev, lpCC, dwSize)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetCommConfig@12' :: SetCommConfig
integer(4)  hCommDev
integer(4)  lpCC
integer(4)  dwSize
end function SetCommConfig
end interface

interface
logical(4) function  SetCommMask (hFile ,dwEvtMask) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetCommMask@8' :: SetCommMask
integer hFile 
integer dwEvtMask   
end function SetCommMask
end interface

interface
logical(4) function  SetCommState (hFile ,lpDCB) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetCommState@8' :: SetCommState
!MS$ ATTRIBUTES REFERENCE :: lpDCB
use msfwinty
integer     hFile 
type(T_DCB) lpDCB   
end function SetCommState
end interface

interface
logical(4) function  SetCommTimeouts (hFile ,lpCommTimeouts) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetCommTimeouts@8' :: SetCommTimeouts
!MS$ ATTRIBUTES REFERENCE :: lpCommTimeouts
use msfwinty
integer             hFile 
type(T_COMMTIMEOUTS)    lpCommTimeouts   
end function SetCommTimeouts
end interface

interface
logical(4) function  TransmitCommChar (hFile ,cChar) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TransmitCommChar@8' :: TransmitCommChar
integer     hFile 
character   cChar   
end function TransmitCommChar
end interface

interface
logical(4) function  WaitCommEvent (hFile ,lpEvtMask ,lpOverlapped   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WaitCommEvent@12' :: WaitCommEvent
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped   
use msfwinty
integer             hFile 
integer             lpEvtMask 
type(T_OVERLAPPED)  lpOverlapped   
end function WaitCommEvent
end interface

interface
integer(4) function  SetTapePosition (hDevice ,dwPositionMethod ,dwPartition ,dwOffsetLow ,dwOffsetHigh ,bImmediate) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetTapePosition@24' :: SetTapePosition
integer     hDevice 
integer     dwPositionMethod 
integer     dwPartition 
integer     dwOffsetLow 
integer     dwOffsetHigh 
logical(4)  bImmediate   
end function SetTapePosition
end interface

interface
integer(4) function  GetTapePosition (hDevice ,dwPositionType ,lpdwPartition ,lpdwOffsetLow ,lpdwOffsetHigh) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTapePosition@20' :: GetTapePosition
integer hDevice 
integer dwPositionType 
integer lpdwPartition 
integer lpdwOffsetLow 
integer lpdwOffsetHigh   
end function GetTapePosition
end interface

interface
integer(4) function  PrepareTape (hDevice ,dwOperation ,bImmediate) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrepareTape@12' :: PrepareTape
integer     hDevice 
integer     dwOperation 
logical(4)  bImmediate   
end function PrepareTape
end interface

interface
integer(4) function  EraseTape (hDevice ,dwEraseType ,bImmediate) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EraseTape@12' :: EraseTape
integer     hDevice 
integer     dwEraseType 
logical(4)  bImmediate   
end function EraseTape
end interface

interface
integer(4) function  CreateTapePartition (hDevice ,dwPartitionMethod ,dwCount ,dwSize) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateTapePartition@16' :: CreateTapePartition
integer hDevice 
integer dwPartitionMethod 
integer dwCount 
integer dwSize   
end function CreateTapePartition
end interface

interface
integer(4) function  WriteTapemark (hDevice ,dwTapemarkType ,dwTapemarkCount ,bImmediate) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteTapemark@16' :: WriteTapemark
integer     hDevice 
integer     dwTapemarkType 
integer     dwTapemarkCount 
logical(4)  bImmediate   
end function WriteTapemark
end interface

interface
integer(4) function  GetTapeStatus (hDevice) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTapeStatus@4' :: GetTapeStatus
integer hDevice   
end function GetTapeStatus
end interface

interface
integer(4) function  GetTapeParameters (hDevice ,dwOperation ,lpdwSize ,lpTapeInformation) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTapeParameters@16' :: GetTapeParameters
integer hDevice 
integer dwOperation 
integer lpdwSize 
integer lpTapeInformation   
end function GetTapeParameters
end interface

interface
integer(4) function  SetTapeParameters (hDevice ,dwOperation ,lpTapeInformation) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetTapeParameters@12' :: SetTapeParameters
integer hDevice 
integer dwOperation 
integer lpTapeInformation   
end function SetTapeParameters
end interface

interface
logical(4) function  Beep (dwFreq ,dwDuration) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Beep@8' :: Beep
integer dwFreq 
integer dwDuration   
end function Beep
end interface

interface
integer(4) function  MulDiv (nNumber ,nNumerator ,nDenominator   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MulDiv@12' :: MulDiv
integer nNumber 
integer nNumerator 
integer nDenominator   
end function MulDiv
end interface

interface
subroutine  GetSystemTime (lpSystemTime) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSystemTime@4' :: GetSystemTime
!MS$ ATTRIBUTES REFERENCE :: lpSystemTime
use msfwinty
type(T_SYSTEMTIME)    lpSystemTime   
end subroutine GetSystemTime
end interface

interface
logical(4) function  SetSystemTime (lpSystemTime) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetSystemTime@4' :: SetSystemTime
!MS$ ATTRIBUTES REFERENCE :: lpSystemTime
use msfwinty
type(T_SYSTEMTIME)    lpSystemTime   
end function SetSystemTime
end interface

interface
subroutine  GetLocalTime (lpSystemTime) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetLocalTime@4' :: GetLocalTime
!MS$ ATTRIBUTES REFERENCE :: lpSystemTime
use msfwinty
type(T_SYSTEMTIME)    lpSystemTime   
end subroutine GetLocalTime
end interface

interface
logical(4) function  SetLocalTime (lpSystemTime) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetLocalTime@4' :: SetLocalTime
!MS$ ATTRIBUTES REFERENCE :: lpSystemTime
use msfwinty
type(T_SYSTEMTIME)    lpSystemTime   
end function SetLocalTime
end interface

interface
subroutine  GetSystemInfo (lpSystemInfo) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSystemInfo@4' :: GetSystemInfo
!MS$ ATTRIBUTES REFERENCE :: lpSystemInfo
use msfwinty
type(T_SYSTEM_INFO)   lpSystemInfo   
end subroutine GetSystemInfo
end interface

! 
!  Routines to convert back and forth between system time and file time
! 

interface
logical(4) function  SystemTimeToFileTime (lpSystemTime ,lpFileTime) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SystemTimeToFileTime@8' :: SystemTimeToFileTime
!MS$ ATTRIBUTES REFERENCE :: lpSystemTime
!MS$ ATTRIBUTES REFERENCE :: lpFileTime   
use msfwinty
type(T_SYSTEMTIME)  lpSystemTime   
type(T_FILETIME)        lpFileTime   
end function SystemTimeToFileTime
end interface

interface
logical(4) function  FileTimeToLocalFileTime (lpFileTime ,lpLocalFileTime   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileTimeToLocalFileTime@8' :: FileTimeToLocalFileTime
integer lpFileTime 
integer lpLocalFileTime   
end function FileTimeToLocalFileTime
end interface

interface
logical(4) function  LocalFileTimeToFileTime (lpLocalFileTime ,lpFileTime   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LocalFileTimeToFileTime@8' :: LocalFileTimeToFileTime
integer lpLocalFileTime 
integer lpFileTime   
end function LocalFileTimeToFileTime
end interface

interface
logical(4) function  FileTimeToSystemTime (lpFileTime ,lpSystemTime   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileTimeToSystemTime@8' :: FileTimeToSystemTime
integer lpFileTime 
integer lpSystemTime   
end function FileTimeToSystemTime
end interface

interface
integer(4) function  CompareFileTime (lpFileTimea ,lpFileTimeb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CompareFileTime@8' :: CompareFileTime
integer lpFileTimea 
integer lpFileTimeb   
end function CompareFileTime
end interface

interface
logical(4) function  FileTimeToDosDateTime (lpFileTime ,lpFatDate ,lpFatTime   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FileTimeToDosDateTime@12' :: FileTimeToDosDateTime
!MS$ ATTRIBUTES REFERENCE :: lpFileTime
use msfwinty
type(T_FILETIME)    lpFileTime 
integer         lpFatDate 
integer         lpFatTime   
end function FileTimeToDosDateTime
end interface

interface
logical(4) function  DosDateTimeToFileTime (wFatDate ,wFatTime ,lpFileTime   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DosDateTimeToFileTime@12' :: DosDateTimeToFileTime
!MS$ ATTRIBUTES REFERENCE :: lpFileTime
use msfwinty
integer(2)          wFatDate 
integer(2)          wFatTime 
type(T_FILETIME)    lpFileTime 
end function DosDateTimeToFileTime
end interface

interface
integer(4) function  GetTickCount () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTickCount@0' :: GetTickCount
end function GetTickCount
end interface

interface
logical(4) function SetSystemTimeAdjustment (dwTimeAdjustment, bTimeAdjustmentDisabled)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetSystemTimeAdjustment@8' :: SetSystemTimeAdjustment
integer(4)  dwTimeAdjustment
logical(4)  bTimeAdjustmentDisabled
end function SetSystemTimeAdjustment
end interface

interface
logical(4) function GetSystemTimeAdjustment (lpTimeAdjustment, lpTimeIncrement, lpTimeAdjustmentDisabled)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSystemTimeAdjustment@12' :: GetSystemTimeAdjustment
integer(4)  lpTimeAdjustment
integer(4)  lpTimeIncrement
integer(4)  lpTimeAdjustmentDisabled
end function GetSystemTimeAdjustment
end interface


interface
integer(4) function  FormatMessage (dwFlags ,lpSource ,dwMessageId ,dwLanguageId ,lpBuffer ,nSize ,Arguments   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FormatMessageA@28' :: FormatMessage
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
integer         dwFlags 
integer         lpSource 
integer         dwMessageId 
integer         dwLanguageId 
character*(*)   lpBuffer 
integer         nSize 
integer         Arguments   
end function FormatMessage
end interface


interface
logical(4) function  CreatePipe (hReadPipe ,hWritePipe ,lpPipeAttributes ,nSize) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreatePipe@16' :: CreatePipe
!MS$ ATTRIBUTES REFERENCE :: lpPipeAttributes 
use msfwinty
integer                     hReadPipe 
integer                     hWritePipe 
type(T_SECURITY_ATTRIBUTES)   lpPipeAttributes 
integer                     nSize   
end function CreatePipe
end interface

interface
logical(4) function  ConnectNamedPipe (hNamedPipe ,lpOverlapped) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ConnectNamedPipe@8' :: ConnectNamedPipe
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped
use msfwinty
integer             hNamedPipe 
type(T_OVERLAPPED)  lpOverlapped   
end function ConnectNamedPipe
end interface

interface
logical(4) function  DisconnectNamedPipe (hNamedPipe) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DisconnectNamedPipe@4' :: DisconnectNamedPipe
integer hNamedPipe   
end function DisconnectNamedPipe
end interface

interface
logical(4) function  SetNamedPipeHandleState (hNamedPipe ,lpMode ,lpMaxCollectionCount ,lpCollectDataTimeout   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetNamedPipeHandleState@16' :: SetNamedPipeHandleState
integer hNamedPipe 
integer lpMode 
integer lpMaxCollectionCount 
integer lpCollectDataTimeout   
end function SetNamedPipeHandleState
end interface

interface
logical(4) function  GetNamedPipeInfo (hNamedPipe ,lpFlags ,lpOutBufferSize ,lpInBufferSize ,lpMaxInstances   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetNamedPipeInfo@20' :: GetNamedPipeInfo
integer hNamedPipe 
integer lpFlags 
integer lpOutBufferSize 
integer lpInBufferSize 
integer lpMaxInstances   
end function GetNamedPipeInfo
end interface

interface
logical(4) function  PeekNamedPipe (hNamedPipe ,lpBuffer ,nBufferSize ,lpBytesRead ,lpTotalBytesAvail ,lpBytesLeftThisMessage   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PeekNamedPipe@24' :: PeekNamedPipe
integer hNamedPipe 
integer lpBuffer 
integer nBufferSize 
integer lpBytesRead 
integer lpTotalBytesAvail 
integer lpBytesLeftThisMessage   
end function PeekNamedPipe
end interface

interface
logical(4) function  TransactNamedPipe (hNamedPipe ,lpInBuffer ,nInBufferSize ,lpOutBuffer ,nOutBufferSize ,lpBytesRead ,lpOverlapped   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TransactNamedPipe@28' :: TransactNamedPipe
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped
use msfwinty
integer             hNamedPipe 
integer             lpInBuffer 
integer             nInBufferSize 
integer             lpOutBuffer  
integer             nOutBufferSize 
integer             lpBytesRead  
type(T_OVERLAPPED)  lpOverlapped   
end function TransactNamedPipe
end interface

interface
integer(4) function  CreateMailslot (lpName ,nMaxMessageSize ,lReadTimeout ,lpSecurityAttributes   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateMailslotA@16' :: CreateMailslot
!MS$ ATTRIBUTES REFERENCE :: lpName 
!MS$ ATTRIBUTES REFERENCE :: lpSecurityAttributes   
use msfwinty
character*(*)               lpName 
integer                     nMaxMessageSize 
integer                     lReadTimeout 
type(T_SECURITY_ATTRIBUTES) lpSecurityAttributes   
end function CreateMailslot
end interface

interface
logical(4) function  GetMailslotInfo (hMailslot ,lpMaxMessageSize ,lpNextSize ,lpMessageCount ,lpReadTimeout   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetMailslotInfo@20' :: GetMailslotInfo
integer hMailslot 
integer lpMaxMessageSize 
integer lpNextSize 
integer lpMessageCount 
integer lpReadTimeout   
end function GetMailslotInfo
end interface

interface
logical(4) function  SetMailslotInfo (hMailslot ,lReadTimeout   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetMailslotInfo@8' :: SetMailslotInfo
integer hMailslot 
integer lReadTimeout   
end function SetMailslotInfo
end interface

interface
integer(4) function  MapViewOfFile (hFileMappingObject ,dwDesiredAccess ,dwFileOffsetHigh ,dwFileOffsetLow ,dwNumberOfBytesToMap   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MapViewOfFile@20' :: MapViewOfFile
integer hFileMappingObject 
integer dwDesiredAccess 
integer dwFileOffsetHigh 
integer dwFileOffsetLow 
integer dwNumberOfBytesToMap   
end function MapViewOfFile
end interface

interface
logical(4) function  FlushViewOfFile (lpBaseAddress ,dwNumberOfBytesToFlush   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FlushViewOfFile@8' :: FlushViewOfFile
integer lpBaseAddress 
integer dwNumberOfBytesToFlush   
end function FlushViewOfFile
end interface

interface
logical(4) function  UnmapViewOfFile (lpBaseAddress   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_UnmapViewOfFile@4' :: UnmapViewOfFile
integer lpBaseAddress   
end function UnmapViewOfFile
end interface

! 
!  l Compat Functions
! 

interface
integer(4) function  lstrcmp (lpStringa ,lpStringb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_lstrcmpA@8' :: lstrcmp
!MS$ ATTRIBUTES REFERENCE :: lpStringa
!MS$ ATTRIBUTES REFERENCE :: lpStringb
character*(*)   lpStringa 
character*(*)   lpStringb   
end function lstrcmp
end interface

interface
integer(4) function  lstrcmpi (lpStringa ,lpStringb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_lstrcmpiA@8' :: lstrcmpi
!MS$ ATTRIBUTES REFERENCE :: lpStringa
!MS$ ATTRIBUTES REFERENCE :: lpStringb
character*(*)   lpStringa 
character*(*)   lpStringb   
end function lstrcmpi
end interface

interface
integer(4) function  lstrcpyn (lpStringa ,lpStringb, nChar   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_lstrcpynA@12' :: lstrcpyn
!MS$ ATTRIBUTES REFERENCE :: lpStringa
!MS$ ATTRIBUTES REFERENCE :: lpStringb
character*(*)   lpStringa 
character*(*)   lpStringb   
integer  nChar
end function lstrcpyn
end interface


interface
integer(4) function  lstrcpy (lpStringa ,lpStringb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_lstrcpyA@8' :: lstrcpy
!MS$ATTRIBUTES REFERENCE :: lpStringa
!MS$ATTRIBUTES REFERENCE :: lpStringb
character*(*) lpStringa 
character*(*) lpStringb   
end function lstrcpy
end interface

interface
integer(4) function  lstrcat (lpStringa ,lpStringb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_lstrcatA@8' :: lstrcat
!MS$ATTRIBUTES REFERENCE :: lpStringa
!MS$ATTRIBUTES REFERENCE :: lpStringb
character*(*) lpStringa 
character*(*) lpStringb   
end function lstrcat
end interface

interface
integer(4) function  lstrlen (lpString) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_lstrlenA@4' :: lstrlen
!MS$ATTRIBUTES REFERENCE :: lpString
character*(*) lpString   
end function lstrlen
end interface

interface
integer(4) function  OpenFile (lpFileName ,lpReOpenBuff ,uStyle   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenFile@12' :: OpenFile
!MS$ATTRIBUTES REFERENCE :: lpFileName
!MS$ATTRIBUTES REFERENCE :: lpReOpenBuff
use msfwinty
character*(*)       lpFileName 
type(T_OFSTRUCT)    lpReOpenBuff 
integer             uStyle   
end function OpenFile
end interface

interface
integer(4) function  lopen (lpPathName ,iReadWrite   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '__lopen@8' :: lopen
!MS$ ATTRIBUTES REFERENCE :: lpPathName
character*(*)   lpPathName 
integer         iReadWrite   
end function lopen
end interface

interface
integer(4) function  lcreat (lpPathName ,iAttribute   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '__lcreat@8' :: lcreat
!MS$ ATTRIBUTES REFERENCE :: lpPathName
character*(*)   lpPathName 
integer         iAttribute   
end function lcreat
end interface

interface
integer(4) function  lread (hFile ,lpBuffer ,uBytes   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '__lread@12' :: lread
integer hFile 
integer lpBuffer 
integer uBytes   
end function lread
end interface

interface
integer(4) function  lwrite (hFile ,lpBuffer ,uBytes   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '__lwrite@12' :: lwrite
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
integer         hFile 
character*(*)   lpBuffer 
integer         uBytes   
end function lwrite
end interface

interface
integer(4) function  hread (hFile ,lpBuffer ,lBytes) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '__hread@12' :: hread
integer hFile 
integer lpBuffer 
integer lBytes   
end function hread
end interface

interface
integer(4) function  hwrite (hFile ,lpBuffer ,lBytes) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '__hwrite@12' :: hwrite
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
integer         hFile 
character*(*)   lpBuffer 
integer         lBytes   
end function hwrite
end interface

interface
integer(4) function  lclose (hFile) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '__lclose@4' :: lclose
integer hFile   
end function lclose
end interface

interface
integer(4) function  llseek (hFile ,lOffset ,iOrigin   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '__llseek@12' :: llseek
integer hFile 
integer lOffset 
integer iOrigin   
end function llseek
end interface

interface
logical(4) function IsTextUnicode (lpBuffer, cb, lpi)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsTextUnicode@12' :: IsTextUnicode
integer(4)  lpBuffer
integer(4)  cb
integer(4)  lpi
end function IsTextUnicode
end interface

interface
integer(4) function  TlsAlloc () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TlsAlloc@0' :: TlsAlloc
end function TlsAlloc
end interface

interface
integer(4) function  TlsGetValue (dwTlsIndex   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TlsGetValue@4' :: TlsGetValue
integer dwTlsIndex   
end function TlsGetValue
end interface

interface
logical(4) function  TlsSetValue (dwTlsIndex ,lpTlsValue   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TlsSetValue@8' :: TlsSetValue
integer dwTlsIndex 
integer lpTlsValue   
end function TlsSetValue
end interface

interface
logical(4) function  TlsFree (dwTlsIndex   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TlsFree@4' :: TlsFree
integer dwTlsIndex   
end function TlsFree
end interface

interface
integer(4) function  SleepEx (dwMilliseconds ,bAlertable   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SleepEx@8' :: SleepEx
integer     dwMilliseconds 
logical(4)  bAlertable   
end function SleepEx
end interface

interface
integer(4) function  WaitForSingleObjectEx (hHandle ,dwMilliseconds ,bAlertable   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WaitForSingleObjectEx@12' :: WaitForSingleObjectEx
integer     hHandle 
integer     dwMilliseconds 
logical(4)  bAlertable   
end function WaitForSingleObjectEx
end interface

interface
integer(4) function  WaitForMultipleObjectsEx (nCount ,lpHandles ,bWaitAll ,dwMilliseconds ,bAlertable   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WaitForMultipleObjectsEx@20' :: WaitForMultipleObjectsEx
integer     nCount 
integer     lpHandles 
logical(4)  bWaitAll 
integer     dwMilliseconds 
logical(4)  bAlertable   
end function WaitForMultipleObjectsEx
end interface

interface
logical(4) function  ReadFileEx (hFile ,lpBuffer ,nNumberOfBytesToRead ,lpOverlapped ,lpCompletionRoutine   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadFileEx@20' :: ReadFileEx
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped 
use msfwinty
integer             hFile 
integer             lpBuffer 
integer             nNumberOfBytesToRead 
type(T_OVERLAPPED)  lpOverlapped 
integer             lpCompletionRoutine   
end function ReadFileEx
end interface

interface
logical(4) function  WriteFileEx (hFile ,lpBuffer ,nNumberOfBytesToWrite ,lpOverlapped ,lpCompletionRoutine   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteFileEx@20' :: WriteFileEx
!MS$ ATTRIBUTES REFERENCE :: lpOverlapped 
use msfwinty
integer             hFile 
integer             lpBuffer 
integer             nNumberOfBytesToWrite 
type(T_OVERLAPPED)  lpOverlapped 
integer             lpCompletionRoutine   
end function WriteFileEx
end interface

interface
logical(4) function  BackupRead (hFile ,lpBuffer ,nNumberOfBytesToRead ,lpNumberOfBytesRead ,bAbort ,bProcessSecurity ,lpContext   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BackupRead@28' :: BackupRead
integer     hFile 
integer     lpBuffer 
integer     nNumberOfBytesToRead 
integer     lpNumberOfBytesRead 
logical(4)  bAbort 
logical(4)  bProcessSecurity 
integer     lpContext   
end function BackupRead
end interface

interface
logical(4) function  BackupSeek (hFile ,dwLowBytesToSeek ,dwHighBytesToSeek ,lpdwLowByteSeeked ,lpdwHighByteSeeked ,lpContext   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BackupSeek@24' :: BackupSeek
integer hFile 
integer dwLowBytesToSeek 
integer dwHighBytesToSeek 
integer lpdwLowByteSeeked 
integer lpdwHighByteSeeked 
integer lpContext   
end function BackupSeek
end interface

interface
logical(4) function  BackupWrite (hFile ,lpBuffer ,nNumberOfBytesToWrite ,lpNumberOfBytesWritten ,bAbort ,bProcessSecurity ,lpContext   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BackupWrite@28' :: BackupWrite
integer     hFile 
integer     lpBuffer 
integer     nNumberOfBytesToWrite 
integer     lpNumberOfBytesWritten 
logical(4)  bAbort 
logical(4)  bProcessSecurity 
integer     lpContext   
end function BackupWrite
end interface

interface
integer(4) function  CreateMutex (lpMutexAttributes ,bInitialOwner ,lpName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateMutexA@12' :: CreateMutex
!MS$ ATTRIBUTES REFERENCE :: lpMutexAttributes 
!MS$ ATTRIBUTES REFERENCE :: lpName
use msfwinty
type(T_SECURITY_ATTRIBUTES) lpMutexAttributes 
logical(4)                  bInitialOwner 
character*(*)               lpName   
end function CreateMutex
end interface

interface
integer(4) function  OpenMutex (dwDesiredAccess ,bInheritHandle ,lpName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenMutexA@12' :: OpenMutex
!MS$ ATTRIBUTES REFERENCE :: lpName
integer         dwDesiredAccess 
logical(4)      bInheritHandle 
character*(*)   lpName   
end function OpenMutex
end interface

interface
integer(4) function  CreateEvent (lpEventAttributes ,bManualReset ,bInitialState ,lpName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateEventA@16' :: CreateEvent
!MS$ ATTRIBUTES REFERENCE :: lpEventAttributes 
!MS$ ATTRIBUTES REFERENCE :: lpName
use msfwinty
type(T_SECURITY_ATTRIBUTES) lpEventAttributes 
logical(4)                  bManualReset 
logical(4)                  bInitialState 
character*(*)               lpName   
end function CreateEvent
end interface

interface
integer(4) function  OpenEvent (dwDesiredAccess ,bInheritHandle ,lpName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenEventA@12' :: OpenEvent
!MS$ ATTRIBUTES REFERENCE :: lpName
integer(4)      dwDesiredAccess 
logical(4)      bInheritHandle 
character*(*)   lpName   
end function OpenEvent
end interface

interface
integer(4) function  CreateSemaphore (lpSemaphoreAttributes ,lInitialCount ,lMaximumCount ,lpName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateSemaphoreA@16' :: CreateSemaphore
!MS$ ATTRIBUTES REFERENCE :: lpSemaphoreAttributes 
!MS$ ATTRIBUTES REFERENCE :: lpName
use msfwinty
type(T_SECURITY_ATTRIBUTES) lpSemaphoreAttributes
integer                     lInitialCount 
integer                     lMaximumCount 
character*(*)               lpName   
end function CreateSemaphore
end interface

interface
integer(4) function  OpenSemaphore (dwDesiredAccess ,bInheritHandle ,lpName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenSemaphoreA@12' :: OpenSemaphore
!MS$ ATTRIBUTES REFERENCE :: lpName
integer(4)      dwDesiredAccess 
logical(4)      bInheritHandle 
character*(*)   lpName   
end function OpenSemaphore
end interface

interface
integer(4) function  CreateFileMapping (hFile ,lpFileMappingAttributes ,flProtect ,dwMaximumSizeHigh ,dwMaximumSizeLow ,lpName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateFileMappingA@24' :: CreateFileMapping
!MS$ ATTRIBUTES REFERENCE :: lpName
!MS$ ATTRIBUTES REFERENCE :: lpFileMappingAttributes 
use msfwinty
integer                     hFile 
type(T_SECURITY_ATTRIBUTES) lpFileMappingAttributes 
integer                     flProtect 
integer                     dwMaximumSizeHigh 
integer                     dwMaximumSizeLow 
character*(*)               lpName
end function CreateFileMapping
end interface

interface
integer(4) function  OpenFileMapping (dwDesiredAccess ,bInheritHandle ,lpName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenFileMappingA@12' :: OpenFileMapping
!MS$ ATTRIBUTES REFERENCE :: lpName
integer(4)      dwDesiredAccess 
logical(4)      bInheritHandle 
character*(*)   lpName
end function OpenFileMapping
end interface

interface
integer(4) function  GetLogicalDriveStrings (nBufferLength ,lpBuffer   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetLogicalDriveStringsA@8' :: GetLogicalDriveStrings
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
integer         nBufferLength 
character*(*)   lpBuffer
end function GetLogicalDriveStrings
end interface

interface
integer(4) function  LoadLibrary (lpLibFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LoadLibraryA@4' :: LoadLibrary
!MS$ ATTRIBUTES REFERENCE :: lpLibFileName
character*(*)   lpLibFileName   
end function LoadLibrary
end interface

interface
integer(4) function  LoadLibraryEx (lpLibFileName ,hFile ,dwFlags) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LoadLibraryExA@12' :: LoadLibraryEx
!MS$ ATTRIBUTES REFERENCE :: lpLibFileName
character*(*)   lpLibFileName   
integer         hFile 
integer         dwFlags   
end function LoadLibraryEx
end interface

interface
integer(4) function  GetModuleFileName (hModule ,lpFilename ,nSize) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetModuleFileNameA@12' :: GetModuleFileName
!MS$ ATTRIBUTES REFERENCE :: lpFilename
integer         hModule 
character*(*)   lpFilename 
integer         nSize   
end function GetModuleFileName
end interface

interface
integer(4) function  GetModuleHandle (lpModuleName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetModuleHandleA@4' :: GetModuleHandle
integer lpModuleName   
end function GetModuleHandle
end interface

interface
logical(4) function  CreateProcess (lpApplicationName ,lpCommandLine ,lpProcessAttributes ,lpThreadAttributes ,bInheritHandles ,dwCreationFlags ,lpEnvironment ,lpCurrentDirectory ,lpStartupInfo ,lpProcessInformation   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateProcessA@40' :: CreateProcess
!MS$ ATTRIBUTES REFERENCE :: lpApplicationName 
!MS$ ATTRIBUTES REFERENCE :: lpCommandLine
!MS$ ATTRIBUTES REFERENCE :: lpProcessAttributes
!MS$ ATTRIBUTES REFERENCE :: lpThreadAttributes
!MS$ ATTRIBUTES REFERENCE :: lpCurrentDirectory
!MS$ ATTRIBUTES REFERENCE :: lpStartupInfo
!MS$ ATTRIBUTES REFERENCE :: lpProcessInformation
use msfwinty
character*(*)               lpApplicationName 
character*(*)               lpCommandLine 
type(T_SECURITY_ATTRIBUTES) lpProcessAttributes 
type(T_SECURITY_ATTRIBUTES) lpThreadAttributes 
logical(4)                  bInheritHandles 
integer                     dwCreationFlags 
integer                     lpEnvironment 
character*(*)               lpCurrentDirectory 
type(T_STARTUPINFO)         lpStartupInfo 
type(T_PROCESS_INFORMATION) lpProcessInformation   
end function CreateProcess
end interface

interface
logical(4) function  SetProcessShutdownParameters (dwLevel ,dwFlags   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetProcessShutdownParameters@8' :: SetProcessShutdownParameters
integer dwLevel 
integer dwFlags   
end function SetProcessShutdownParameters
end interface

interface
logical(4) function  GetProcessShutdownParameters (lpdwLevel ,lpdwFlags   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetProcessShutdownParameters@8' :: GetProcessShutdownParameters
integer lpdwLevel 
integer lpdwFlags   
end function GetProcessShutdownParameters
end interface

interface
subroutine  FatalAppExit (uAction ,lpMessageText   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FatalAppExitA@8' :: FatalAppExit
!MS$ ATTRIBUTES REFERENCE :: lpMessageText
integer         uAction 
character*(*)   lpMessageText   
end subroutine FatalAppExit
end interface

interface
subroutine  GetStartupInfo (lpStartupInfo   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetStartupInfoA@4' :: GetStartupInfo
!MS$ ATTRIBUTES REFERENCE :: lpStartupInfo
use msfwinty
type(T_STARTUPINFO) lpStartupInfo   
end subroutine GetStartupInfo
end interface

interface
integer(4) function  GetCommandLine () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCommandLineA@0' :: GetCommandLine
end function GetCommandLine
end interface

interface
integer(4) function  GetEnvironmentVariable (lpName ,lpBuffer ,nSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetEnvironmentVariableA@12' :: GetEnvironmentVariable
!MS$ ATTRIBUTES REFERENCE :: lpName
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
character*(*)   lpName 
character*(*)   lpBuffer 
integer         nSize   
end function GetEnvironmentVariable
end interface

interface
logical(4) function  SetEnvironmentVariable (lpName ,lpValue) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetEnvironmentVariableA@8' :: SetEnvironmentVariable
!MS$ ATTRIBUTES REFERENCE :: lpName
!MS$ ATTRIBUTES REFERENCE :: lpValue
character*(*)   lpName 
character*(*)   lpValue   
end function SetEnvironmentVariable
end interface

interface
integer(4) function  ExpandEnvironmentStrings (lpSrc ,lpDst ,nSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExpandEnvironmentStringsA@12' :: ExpandEnvironmentStrings
!MS$ ATTRIBUTES REFERENCE :: lpSrc
!MS$ ATTRIBUTES REFERENCE :: lpDst
character*(*)   lpSrc 
character*(*)   lpDst 
integer         nSize   
end function ExpandEnvironmentStrings
end interface

interface
subroutine  OutputDebugString (lpOutputString) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OutputDebugStringA@4' :: OutputDebugString
!MS$ ATTRIBUTES REFERENCE :: lpOutputString
character*(*)   lpOutputString   
end subroutine OutputDebugString
end interface

interface
integer(4) function  FindResource (hModule ,lpName ,lpType   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindResourceA@12' :: FindResource
integer hModule 
integer lpName 
integer lpType   
end function FindResource
end interface

interface
integer(4) function  FindResourceEx (hModule ,lpType ,lpName ,wLanguage ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindResourceExA@16' :: FindResourceEx
integer hModule 
integer lpType 
integer lpName 
integer(2)  wLanguage   
end function FindResourceEx
end interface

interface
logical(4) function  EnumResourceTypes (hModule ,lpEnumFunc ,lParam   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumResourceTypesA@12' :: EnumResourceTypes
integer hModule 
integer lpEnumFunc 
integer lParam   
end function EnumResourceTypes
end interface

interface
logical(4) function  EnumResourceNames (hModule ,lpType ,lpEnumFunc ,lParam   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumResourceNamesA@16' :: EnumResourceNames
integer hModule 
integer lpType 
integer lpEnumFunc 
integer lParam   
end function EnumResourceNames
end interface

interface
logical(4) function  EnumResourceLanguages (hModule ,lpType ,lpName ,lpEnumFunc ,lParam   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumResourceLanguagesA@20' :: EnumResourceLanguages
integer hModule 
integer lpType 
integer lpName 
integer lpEnumFunc 
integer lParam   
end function EnumResourceLanguages
end interface

interface
integer(4) function  BeginUpdateResource (pFileName ,bDeleteExistingResources   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BeginUpdateResourceA@8' :: BeginUpdateResource
!MS$ ATTRIBUTES REFERENCE :: pFileName
character*(*)   pFileName 
logical(4)      bDeleteExistingResources   
end function BeginUpdateResource
end interface

interface
logical(4) function  UpdateResource (hUpdate ,lpType ,lpName ,wLanguage,lpData ,cbData   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_UpdateResourceA@24' :: UpdateResource
integer     hUpdate 
integer     lpType 
integer     lpName 
integer(2)  wLanguage 
integer     lpData 
integer     cbData   
end function UpdateResource
end interface

interface
logical(4) function  EndUpdateResource (hUpdate ,fDiscard   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EndUpdateResourceA@8' :: EndUpdateResource
integer(4)  hUpdate 
logical(4)  fDiscard   
end function EndUpdateResource
end interface

interface
integer(2) function  GlobalAddAtom (lpString) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalAddAtomA@4' :: GlobalAddAtom
!MS$ ATTRIBUTES REFERENCE :: lpString
character*(*)   lpString   
end function GlobalAddAtom
end interface

interface
integer(2) function  GlobalFindAtom (lpString   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalFindAtomA@4' :: GlobalFindAtom
!MS$ ATTRIBUTES REFERENCE :: lpString
character*(*)   lpString   
end function GlobalFindAtom
end interface

interface
integer(4) function  GlobalGetAtomName (nAtom ,lpBuffer ,nSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GlobalGetAtomNameA@12' :: GlobalGetAtomName
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
integer(2)      nAtom 
character*(*)   lpBuffer 
integer         nSize   
end function GlobalGetAtomName
end interface

interface
integer(2) function  AddAtom (lpString) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddAtomA@4' :: AddAtom
!MS$ ATTRIBUTES REFERENCE :: lpString
character*(*)   lpString
end function AddAtom
end interface

interface
integer(2) function  FindAtom (lpString   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindAtomA@4' :: FindAtom
!MS$ ATTRIBUTES REFERENCE :: lpString
character*(*)   lpString
end function FindAtom
end interface

interface
integer(4) function  GetAtomName (nAtom ,lpBuffer ,nSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetAtomNameA@12' :: GetAtomName
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
integer(2)      nAtom
character*(*)   lpBuffer 
integer         nSize   
end function GetAtomName
end interface

interface
integer(4) function  GetProfileInt (lpAppName ,lpKeyName ,nDefault   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetProfileIntA@12' :: GetProfileInt
!MS$ ATTRIBUTES REFERENCE :: lpAppName
!MS$ ATTRIBUTES REFERENCE :: lpKeyName 
character*(*)   lpAppName 
character*(*)   lpKeyName 
integer         nDefault   
end function GetProfileInt
end interface

interface
integer(4) function  GetProfileString (lpAppName ,lpKeyName ,lpDefault ,lpReturnedString ,nSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetProfileStringA@20' :: GetProfileString
!MS$ ATTRIBUTES REFERENCE :: lpAppName
!MS$ ATTRIBUTES REFERENCE :: lpKeyName 
!MS$ ATTRIBUTES REFERENCE :: lpDefault
!MS$ ATTRIBUTES REFERENCE :: lpReturnedString 
character*(*)   lpAppName 
character*(*)   lpKeyName 
character*(*)   lpDefault 
character*(*)   lpReturnedString 
integer         nSize   
end function GetProfileString
end interface

interface
logical(4) function  WriteProfileString (lpAppName ,lpKeyName ,lpString   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteProfileStringA@12' :: WriteProfileString
!MS$ ATTRIBUTES REFERENCE :: lpAppName
!MS$ ATTRIBUTES REFERENCE :: lpKeyName 
!MS$ ATTRIBUTES REFERENCE :: lpString
character*(*)   lpAppName 
character*(*)   lpKeyName 
character*(*)   lpString   
end function WriteProfileString
end interface

interface
integer(4) function  GetProfileSection (lpAppName ,lpReturnedString ,nSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetProfileSectionA@12' :: GetProfileSection
!MS$ ATTRIBUTES REFERENCE :: lpAppName 
!MS$ ATTRIBUTES REFERENCE :: lpReturnedString 
character*(*)   lpAppName 
character*(*)   lpReturnedString 
integer         nSize   
end function GetProfileSection
end interface

interface
logical(4) function  WriteProfileSection (lpAppName ,lpString   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteProfileSectionA@8' :: WriteProfileSection
!MS$ ATTRIBUTES REFERENCE :: lpAppName 
!MS$ ATTRIBUTES REFERENCE :: lpString   
character*(*)   lpAppName 
character*(*)   lpString   
end function WriteProfileSection
end interface

interface
integer(4) function  GetPrivateProfileInt (lpAppName ,lpKeyName ,nDefault ,lpFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPrivateProfileIntA@16' :: GetPrivateProfileInt
!MS$ ATTRIBUTES REFERENCE :: lpAppName 
!MS$ ATTRIBUTES REFERENCE :: lpKeyName
!MS$ ATTRIBUTES REFERENCE :: lpFileName
character*(*)   lpAppName 
character*(*)   lpKeyName 
integer         nDefault 
character*(*)   lpFileName   
end function GetPrivateProfileInt
end interface

interface
integer(4) function  GetPrivateProfileString (lpAppName ,lpKeyName ,lpDefault ,lpReturnedString ,nSize ,lpFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPrivateProfileStringA@24' :: GetPrivateProfileString
!MS$ ATTRIBUTES REFERENCE :: lpAppName 
!MS$ ATTRIBUTES REFERENCE :: lpKeyName
!MS$ ATTRIBUTES REFERENCE :: lpDefault
!MS$ ATTRIBUTES REFERENCE :: lpReturnedString 
!MS$ ATTRIBUTES REFERENCE :: lpFileName 
character*(*)   lpAppName 
character*(*)   lpKeyName 
character*(*)   lpDefault 
character*(*)   lpReturnedString 
integer         nSize 
character*(*)   lpFileName   
end function GetPrivateProfileString
end interface

interface
logical(4) function  WritePrivateProfileString (lpAppName ,lpKeyName ,lpString ,lpFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WritePrivateProfileStringA@16' :: WritePrivateProfileString
!MS$ ATTRIBUTES REFERENCE :: lpAppName 
!MS$ ATTRIBUTES REFERENCE :: lpKeyName
!MS$ ATTRIBUTES REFERENCE :: lpString 
!MS$ ATTRIBUTES REFERENCE :: lpFileName
character*(*)   lpAppName 
character*(*)   lpKeyName 
character*(*)   lpString 
character*(*)   lpFileName   
end function WritePrivateProfileString
end interface

interface
integer(4) function  GetPrivateProfileSection (lpAppName ,lpReturnedString ,nSize ,lpFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPrivateProfileSectionA@16' :: GetPrivateProfileSection
!MS$ ATTRIBUTES REFERENCE :: lpAppName 
!MS$ ATTRIBUTES REFERENCE :: lpReturnedString
!MS$ ATTRIBUTES REFERENCE :: lpFileName
character*(*)   lpAppName 
character*(*)   lpReturnedString 
integer         nSize 
character*(*)   lpFileName   
end function GetPrivateProfileSection
end interface

interface
logical(4) function  WritePrivateProfileSection (lpAppName ,lpString ,lpFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WritePrivateProfileSectionA@12' :: WritePrivateProfileSection
!MS$ ATTRIBUTES REFERENCE :: lpAppName 
!MS$ ATTRIBUTES REFERENCE :: lpString
!MS$ ATTRIBUTES REFERENCE :: lpFileName
character*(*)   lpAppName 
character*(*)   lpString 
character*(*)   lpFileName   
end function WritePrivateProfileSection
end interface

interface
integer(4) function  GetDriveType (lpRootPathName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetDriveTypeA@4' :: GetDriveType
!MS$ ATTRIBUTES REFERENCE :: lpRootPathName
character*(*)   lpRootPathName   
end function GetDriveType
end interface

interface
integer(4) function  GetSystemDirectory (lpBuffer ,uSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSystemDirectoryA@8' :: GetSystemDirectory
!MS$ ATTRIBUTES REFERENCE :: lpBuffer 
character*(*)   lpBuffer 
integer         uSize   
end function GetSystemDirectory
end interface

interface
integer(4) function  GetTempPath (nBufferLength ,lpBuffer   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTempPathA@8' :: GetTempPath
!MS$ ATTRIBUTES REFERENCE :: lpBuffer 
integer         nBufferLength 
character*(*)   lpBuffer 
end function GetTempPath
end interface

interface
integer(4) function  GetTempFileName (lpPathName ,lpPrefixString ,uUnique ,lpTempFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTempFileNameA@16' :: GetTempFileName
!MS$ ATTRIBUTES REFERENCE :: lpPathName
!MS$ ATTRIBUTES REFERENCE :: lpPrefixString
!MS$ ATTRIBUTES REFERENCE :: lpTempFileName 
character*(*)   lpPathName 
character*(*)   lpPrefixString 
integer         uUnique 
character*(*)   lpTempFileName   
end function GetTempFileName
end interface

interface
integer(4) function  GetWindowsDirectory (lpBuffer ,uSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetWindowsDirectoryA@8' :: GetWindowsDirectory
!MS$ ATTRIBUTES REFERENCE ::  lpBuffer 
character*(*)   lpBuffer 
integer         uSize   
end function GetWindowsDirectory
end interface

interface
logical(4) function  SetCurrentDirectory (lpPathName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetCurrentDirectoryA@4' :: SetCurrentDirectory
!MS$ ATTRIBUTES REFERENCE ::  lpPathName   
character*(*)   lpPathName   
end function SetCurrentDirectory
end interface

interface
logical(4) function  GetCurrentDirectory (nBufferLength ,lpBuffer   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCurrentDirectoryA@8' :: GetCurrentDirectory
!MS$ ATTRIBUTES REFERENCE ::  lpBuffer   
integer         nBufferLength 
character*(*)   lpBuffer   
end function GetCurrentDirectory
end interface

interface
logical(4) function  GetDiskFreeSpace (lpRootPathName ,lpSectorsPerCluster ,lpBytesPerSector ,lpNumberOfFreeClusters ,lpTotalNumberOfClusters   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetDiskFreeSpaceA@20' :: GetDiskFreeSpace
!MS$ ATTRIBUTES REFERENCE ::  lpRootPathName
character*(*)   lpRootPathName 
integer         lpSectorsPerCluster 
integer         lpBytesPerSector 
integer         lpNumberOfFreeClusters 
integer         lpTotalNumberOfClusters   
end function GetDiskFreeSpace
end interface

interface
logical(4) function  CreateDirectory (lpPathName ,lpSecurityAttributes   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateDirectoryA@8' :: CreateDirectory
!MS$ ATTRIBUTES REFERENCE :: lpPathName 
!MS$ ATTRIBUTES REFERENCE :: lpSecurityAttributes   
use msfwinty
character*(*)               lpPathName 
type(T_SECURITY_ATTRIBUTES) lpSecurityAttributes   
end function CreateDirectory
end interface

interface
logical(4) function  CreateDirectoryEx (lpTemplateDirectory ,lpNewDirectory ,lpSecurityAttributes   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateDirectoryExA@12' :: CreateDirectoryEx
!MS$ ATTRIBUTES REFERENCE :: lpTemplateDirectory
!MS$ ATTRIBUTES REFERENCE :: lpNewDirectory
!MS$ ATTRIBUTES REFERENCE :: lpSecurityAttributes    
character*(*)      lpTemplateDirectory 
character*(*)      lpNewDirectory 
character*(*)      lpSecurityAttributes   
end function CreateDirectoryEx
end interface

interface
logical(4) function  RemoveDirectory (lpPathName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RemoveDirectoryA@4' :: RemoveDirectory
!MS$ ATTRIBUTES REFERENCE :: lpPathName   
character*(*)   lpPathName   
end function RemoveDirectory
end interface

interface
integer(4) function  GetFullPathName (lpFileName ,nBufferLength ,lpBuffer ,lpFilePart   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetFullPathNameA@16' :: GetFullPathName
!MS$ ATTRIBUTES REFERENCE :: lpFileName   
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
!MS$ ATTRIBUTES REFERENCE :: lpFilePart
character*(*)   lpFileName 
integer         nBufferLength 
character*(*)   lpBuffer 
character*(*)   lpFilePart   
end function GetFullPathName
end interface

interface
logical(4) function  DefineDosDevice (dwFlags ,lpDeviceName ,lpTargetPath   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DefineDosDeviceA@12' :: DefineDosDevice
!MS$ ATTRIBUTES REFERENCE :: lpDeviceName
!MS$ ATTRIBUTES REFERENCE :: lpTargetPath
integer         dwFlags 
character*(*)   lpDeviceName 
character*(*)   lpTargetPath   
end function DefineDosDevice
end interface


interface
integer(4) function  QueryDosDevice (lpDeviceName ,lpTargetPath ,ucchMax   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_QueryDosDeviceA@12' :: QueryDosDevice
!MS$ ATTRIBUTES REFERENCE :: lpDeviceName
!MS$ ATTRIBUTES REFERENCE :: lpTargetPath
character*(*)   lpDeviceName 
character*(*)   lpTargetPath   
integer         ucchMax   
end function QueryDosDevice
end interface

!MS$DEFINE EXPAND_LOCAL_DRIVES



interface
integer(4) function  CreateFile (lpFileName ,dwDesiredAccess ,dwShareMode ,lpSecurityAttributes ,dwCreationDisposition ,dwFlagsAndAttributes ,hTemplateFile   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateFileA@28' :: CreateFile
!MS$ ATTRIBUTES REFERENCE :: lpFileName 
!MS$ ATTRIBUTES REFERENCE :: lpSecurityAttributes 
use msfwinty
character*(*)               lpFileName 
integer                     dwDesiredAccess 
integer                     dwShareMode 
type(T_SECURITY_ATTRIBUTES)  lpSecurityAttributes 
integer                     dwCreationDisposition 
integer                     dwFlagsAndAttributes 
integer                     hTemplateFile   
end function CreateFile
end interface

interface
logical(4) function  SetFileAttributes (lpFileName ,dwFileAttributes   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetFileAttributesA@8' :: SetFileAttributes
!MS$ ATTRIBUTES REFERENCE :: lpFileName 
character*(*)   lpFileName 
integer         dwFileAttributes   
end function SetFileAttributes
end interface

interface
integer(4) function  GetFileAttributes (lpFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetFileAttributesA@4' :: GetFileAttributes
!MS$ ATTRIBUTES REFERENCE :: lpFileName 
character*(*)   lpFileName 
end function GetFileAttributes
end interface

interface
integer(4) function GetCompressedFileSize (lpFileName, lpFileSizeHigh)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCompressedFileSizeA@8' :: GetCompressedFileSize
!MS$ ATTRIBUTES REFERENCE :: lpFileName
character*(*)   lpFileName
integer(4)      lpFileSizeHigh
end function GetCompressedFileSize
end interface

interface
logical(4) function  DeleteFile (lpFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteFileA@4' :: DeleteFile
!MS$ ATTRIBUTES REFERENCE :: lpFileName
character*(*)   lpFileName
end function DeleteFile
end interface

interface
integer(4) function  FindFirstFile (lpFileName ,lpFindFileData   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindFirstFileA@8' :: FindFirstFile
!MS$ ATTRIBUTES REFERENCE :: lpFileName
!MS$ ATTRIBUTES REFERENCE :: lpFindFileData
use msfwinty
character*(*)           lpFileName
type(T_WIN32_FIND_DATA) lpFindFileData   
end function FindFirstFile
end interface

interface
logical(4) function  FindNextFile (hFindFile ,lpFindFileData   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindNextFileA@8' :: FindNextFile
!MS$ ATTRIBUTES REFERENCE :: lpFindFileData
use msfwinty
integer                 hFindFile 
type(T_WIN32_FIND_DATA) lpFindFileData   
end function FindNextFile
end interface

interface
integer(4) function  SearchPath (lpPath ,lpFileName ,lpExtension ,nBufferLength ,lpBuffer ,lpFilePart   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SearchPathA@24' :: SearchPath
!MS$ ATTRIBUTES REFERENCE :: lpPath
!MS$ ATTRIBUTES REFERENCE :: lpFileName
!MS$ ATTRIBUTES REFERENCE :: lpExtension
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
!MS$ ATTRIBUTES REFERENCE :: lpFilePart
character*(*)   lpPath 
character*(*)   lpFileName 
character*(*)   lpExtension 
integer         nBufferLength 
character*(*)   lpBuffer 
character*(*)   lpFilePart   
end function SearchPath
end interface

interface
logical(4) function  CopyFile (lpExistingFileName ,lpNewFileName ,bFailIfExists   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CopyFileA@12' :: CopyFile
!MS$ ATTRIBUTES REFERENCE :: lpExistingFileName
!MS$ ATTRIBUTES REFERENCE :: lpNewFileName
character*(*)   lpExistingFileName 
character*(*)   lpNewFileName 
logical(4)      bFailIfExists   
end function CopyFile
end interface

interface
logical(4) function  MoveFile (lpExistingFileName ,lpNewFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MoveFileA@8' :: MoveFile
!MS$ ATTRIBUTES REFERENCE :: lpExistingFileName
!MS$ ATTRIBUTES REFERENCE :: lpNewFileName
character*(*)   lpExistingFileName 
character*(*)   lpNewFileName 
end function MoveFile
end interface

interface
logical(4) function  MoveFileEx (lpExistingFileName ,lpNewFileName ,dwFlags   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MoveFileExA@12' :: MoveFileEx
!MS$ ATTRIBUTES REFERENCE :: lpExistingFileName
!MS$ ATTRIBUTES REFERENCE :: lpNewFileName
character*(*)   lpExistingFileName 
character*(*)   lpNewFileName 
integer         dwFlags   
end function MoveFileEx
end interface

interface
integer(4) function  CreateNamedPipe (lpName ,dwOpenMode ,dwPipeMode ,nMaxInstances ,nOutBufferSize ,nInBufferSize ,nDefaultTimeOut ,lpSecurityAttributes) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateNamedPipeA@32' :: CreateNamedPipe
!MS$ ATTRIBUTES REFERENCE :: lpName 
!MS$ ATTRIBUTES REFERENCE :: lpSecurityAttributes 
use msfwinty
character*(*)                   lpName 
integer                         dwOpenMode 
integer                         dwPipeMode 
integer                         nMaxInstances 
integer                         nOutBufferSize 
integer                         nInBufferSize 
integer                         nDefaultTimeOut 
type(T_SECURITY_ATTRIBUTES)     lpSecurityAttributes   
end function CreateNamedPipe
end interface

interface
logical(4) function  GetNamedPipeHandleState (hNamedPipe ,lpState ,lpCurInstances ,lpMaxCollectionCount ,lpCollectDataTimeout ,lpUserName ,nMaxUserNameSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetNamedPipeHandleStateA@28' :: GetNamedPipeHandleState
!MS$ ATTRIBUTES REFERENCE :: lpUserName
integer         hNamedPipe 
integer         lpState 
integer         lpCurInstances 
integer         lpMaxCollectionCount 
integer         lpCollectDataTimeout 
character*(*)   lpUserName 
integer         nMaxUserNameSize   
end function GetNamedPipeHandleState
end interface

interface
logical(4) function  CallNamedPipe (lpNamedPipeName ,lpInBuffer ,nInBufferSize ,lpOutBuffer ,nOutBufferSize ,lpBytesRead ,nTimeOut   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CallNamedPipeA@28' :: CallNamedPipe
!MS$ ATTRIBUTES REFERENCE :: lpNamedPipeName
character*(*)   lpNamedPipeName 
integer         lpInBuffer 
integer         nInBufferSize 
integer         lpOutBuffer 
integer         nOutBufferSize 
integer         lpBytesRead 
integer         nTimeOut   
end function CallNamedPipe
end interface

interface
logical(4) function  WaitNamedPipe (lpNamedPipeName ,nTimeOut   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WaitNamedPipeA@8' :: WaitNamedPipe
!MS$ ATTRIBUTES REFERENCE :: lpNamedPipeName
character*(*)   lpNamedPipeName 
integer         nTimeOut   
end function WaitNamedPipe
end interface

interface
logical(4) function  SetVolumeLabel (lpRootPathName ,lpVolumeName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetVolumeLabelA@8' :: SetVolumeLabel
!MS$ ATTRIBUTES REFERENCE :: lpRootPathName 
!MS$ ATTRIBUTES REFERENCE :: lpVolumeName
character*(*)   lpRootPathName 
character*(*)   lpVolumeName   
end function SetVolumeLabel
end interface

interface
subroutine  SetFileApisToOEM () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetFileApisToOEM@0' :: SetFileApisToOEM
end subroutine SetFileApisToOEM
end interface

interface
subroutine  SetFileApisToANSI () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetFileApisToANSI@0' :: SetFileApisToANSI
end subroutine SetFileApisToANSI
end interface


interface
logical(4) function AreFileApisANSI ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AreFileApisANSI@0' :: AreFileApisANSI
end function AreFileApisANSI
end interface

interface
logical(4) function  GetVolumeInformation (lpRootPathName ,lpVolumeNameBuffer ,nVolumeNameSize ,lpVolumeSerialNumber ,lpMaximumComponentLength ,lpFileSystemFlags ,lpFileSystemNameBuffer ,nFileSystemNameSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetVolumeInformationA@32' :: GetVolumeInformation
!MS$ ATTRIBUTES REFERENCE :: lpRootPathName 
!MS$ ATTRIBUTES REFERENCE :: lpVolumeNameBuffer 
!MS$ ATTRIBUTES REFERENCE :: lpFileSystemNameBuffer 
character*(*)   lpRootPathName 
character*(*)   lpVolumeNameBuffer 
integer         nVolumeNameSize 
integer         lpVolumeSerialNumber 
integer         lpMaximumComponentLength 
integer         lpFileSystemFlags 
character*(*)   lpFileSystemNameBuffer 
integer         nFileSystemNameSize   
end function GetVolumeInformation
end interface

! 
!  Event logging APIs
! 

interface
logical(4) function  ClearEventLog (hEventLog ,lpBackupFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ClearEventLogA@8' :: ClearEventLog
!MS$ ATTRIBUTES REFERENCE :: lpBackupFileName
integer         hEventLog 
character*(*)   lpBackupFileName   
end function ClearEventLog
end interface

interface
logical(4) function  BackupEventLog (hEventLog ,lpBackupFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BackupEventLogA@8' :: BackupEventLog
!MS$ ATTRIBUTES REFERENCE :: lpBackupFileName
integer         hEventLog 
character*(*)   lpBackupFileName   
end function BackupEventLog
end interface

interface
logical(4) function  CloseEventLog  (hEventLog   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CloseEventLog@4' :: CloseEventLog 
integer hEventLog   
end function CloseEventLog
end interface

interface
logical(4) function  DeregisterEventSource  (hEventLog   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeregisterEventSource@4' :: DeregisterEventSource 
integer hEventLog   
end function DeregisterEventSource
end interface

interface
logical(4) function NotifyChangeEventLog (hEventLog, hEvent)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_NotifyChangeEventLog@8' :: NotifyChangeEventLog
integer(4)  hEventLog
integer(4)  hEvent
end function NotifyChangeEventLog
end interface

interface
logical(4) function  GetNumberOfEventLogRecords  (hEventLog ,NumberOfRecords   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetNumberOfEventLogRecords@8' :: GetNumberOfEventLogRecords 
integer hEventLog 
integer NumberOfRecords   
end function GetNumberOfEventLogRecords
end interface

interface
logical(4) function  GetOldestEventLogRecord  (hEventLog ,OldestRecord   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetOldestEventLogRecord@8' :: GetOldestEventLogRecord 
integer hEventLog 
integer OldestRecord   
end function GetOldestEventLogRecord
end interface

interface
integer(4) function  OpenEventLog (lpUNCServerName ,lpSourceName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenEventLogA@8' :: OpenEventLog
!MS$ ATTRIBUTES REFERENCE :: lpUNCServerName
!MS$ ATTRIBUTES REFERENCE :: lpSourceName
character*(*)   lpUNCServerName 
character*(*)   lpSourceName   
end function OpenEventLog
end interface

interface
integer(4) function  RegisterEventSource (lpUNCServerName ,lpSourceName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegisterEventSourceA@8' :: RegisterEventSource
!MS$ ATTRIBUTES REFERENCE :: lpUNCServerName
!MS$ ATTRIBUTES REFERENCE :: lpSourceName
character*(*)   lpUNCServerName 
character*(*)   lpSourceName   
end function RegisterEventSource
end interface

interface
integer(4) function  OpenBackupEventLog (lpUNCServerName ,lpFileName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenBackupEventLogA@8' :: OpenBackupEventLog
!MS$ ATTRIBUTES REFERENCE :: lpUNCServerName
!MS$ ATTRIBUTES REFERENCE :: lpFileName 
character*(*)   lpUNCServerName 
character*(*)   lpFileName 
end function OpenBackupEventLog
end interface

interface
logical(4) function  ReadEventLog (hEventLog ,dwReadFlags ,dwRecordOffset ,lpBuffer ,nNumberOfBytesToRead ,pnBytesRead ,pnMinNumberOfBytesNeeded   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadEventLogA@28' :: ReadEventLog
integer hEventLog 
integer dwReadFlags 
integer dwRecordOffset 
integer lpBuffer 
integer nNumberOfBytesToRead 
integer pnBytesRead 
integer pnMinNumberOfBytesNeeded   
end function ReadEventLog
end interface

interface
logical(4) function  ReportEvent (hEventLog ,wType,wCategory,dwEventID ,lpUserSid ,wNumStrings ,dwDataSize ,lpStrings ,lpRawData) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReportEventA@36' :: ReportEvent
integer     hEventLog 
integer(2)  wType 
integer(2)  wCategory 
integer     dwEventID 
integer     lpUserSid 
integer(2)  wNumStrings 
integer     dwDataSize 
integer     lpStrings 
integer     lpRawData   
end function ReportEvent
end interface

! 
! 
!  Security APIs
! 

interface
logical(4) function  DuplicateToken (ExistingTokenHandle ,ImpersonationLevel ,DuplicateTokenHandle   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DuplicateToken@12' :: DuplicateToken
integer     ExistingTokenHandle 
integer     ImpersonationLevel 
integer     DuplicateTokenHandle   
end function DuplicateToken
end interface

interface
logical(4) function  GetKernelObjectSecurity  (Handle ,RequestedInformation ,pSecurityDescriptor ,nLength ,lpnLengthNeeded   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetKernelObjectSecurity@20' :: GetKernelObjectSecurity 
!MS$ ATTRIBUTES REFERENCE :: pSecurityDescriptor
use msfwinty
integer                         Handle 
integer                         RequestedInformation 
type(T_SECURITY_DESCRIPTOR)     pSecurityDescriptor 
integer                         nLength 
integer                         lpnLengthNeeded   
end function GetKernelObjectSecurity
end interface

interface
logical(4) function  ImpersonateNamedPipeClient (hNamedPipe   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ImpersonateNamedPipeClient@4' :: ImpersonateNamedPipeClient
integer hNamedPipe   
end function ImpersonateNamedPipeClient
end interface

interface
logical(4) function  ImpersonateSelf (ImpersonationLevel   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ImpersonateSelf@4' :: ImpersonateSelf
integer ImpersonationLevel 
end function ImpersonateSelf
end interface

interface
logical(4) function  RevertToSelf  () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RevertToSelf@0' :: RevertToSelf 
end function RevertToSelf
end interface

interface
logical(4) function  SetThreadToken  (Thread ,Token   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetThreadToken@8' :: SetThreadToken 
integer Thread 
integer Token   
end function SetThreadToken
end interface

interface
logical(4) function  AccessCheck  (pSecurityDescriptor ,ClientToken ,DesiredAccess ,GenericMapping ,PrivilegeSet ,PrivilegeSetLength ,GrantedAccess ,AccessStatus   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AccessCheck@32' :: AccessCheck 
!MS$ ATTRIBUTES REFERENCE :: pSecurityDescriptor
!MS$ ATTRIBUTES REFERENCE :: GenericMapping
!MS$ ATTRIBUTES REFERENCE :: PrivilegeSet
use msfwinty
type(T_SECURITY_DESCRIPTOR) pSecurityDescriptor 
integer                     ClientToken 
integer                     DesiredAccess 
type(T_GENERIC_MAPPING)     GenericMapping 
type(T_PRIVILEGE_SET)       PrivilegeSet 
integer                     PrivilegeSetLength 
integer                     GrantedAccess 
integer                     AccessStatus   
end function AccessCheck
end interface

interface
logical(4) function  OpenProcessToken  (ProcessHandle ,DesiredAccess ,TokenHandle   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenProcessToken@12' :: OpenProcessToken 
integer ProcessHandle 
integer DesiredAccess 
integer TokenHandle   
end function OpenProcessToken
end interface

interface
logical(4) function  OpenThreadToken  (ThreadHandle ,DesiredAccess ,OpenAsSelf ,TokenHandle   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenThreadToken@16' :: OpenThreadToken 
integer(4)  ThreadHandle 
integer(4)  DesiredAccess 
logical(4)  OpenAsSelf 
integer(4)  TokenHandle   
end function OpenThreadToken
end interface

interface
logical(4) function  GetTokenInformation  (TokenHandle ,TokenInformationClass ,TokenInformation ,TokenInformationLength ,ReturnLength   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTokenInformation@20' :: GetTokenInformation 
integer     TokenHandle 
integer     TokenInformationClass 
integer     TokenInformation 
integer     TokenInformationLength 
end function GetTokenInformation
end interface

interface
logical(4) function  SetTokenInformation  (TokenHandle ,TokenInformationClass ,TokenInformation ,TokenInformationLength   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetTokenInformation@16' :: SetTokenInformation 
integer TokenHandle 
integer TokenInformationClass 
integer TokenInformation 
integer TokenInformationLength   
end function SetTokenInformation
end interface

interface
logical(4) function  AdjustTokenPrivileges  (TokenHandle ,fDisableAll ,NewState ,BufferLength ,PreviousState ,ReturnLength   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AdjustTokenPrivileges@24' :: AdjustTokenPrivileges 
!MS$ ATTRIBUTES REFERENCE :: NewState
!MS$ ATTRIBUTES REFERENCE :: PreviousState
use msfwinty
integer                     TokenHandle 
logical(4)                  fDisableAll
type(T_TOKEN_PRIVILEGES)    NewState 
integer                     BufferLength 
type(T_TOKEN_PRIVILEGES)    PreviousState
integer                     ReturnLength 
end function AdjustTokenPrivileges
end interface

interface
logical(4) function  AdjustTokenGroups  (TokenHandle ,fResetToDefault ,NewState ,BufferLength ,PreviousState ,ReturnLength   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AdjustTokenGroups@24' :: AdjustTokenGroups 
!MS$ ATTRIBUTES REFERENCE :: NewState
!MS$ ATTRIBUTES REFERENCE :: PreviousState
use msfwinty
integer                 TokenHandle 
logical(4)              fResetToDefault 
type(T_TOKEN_GROUPS)    NewState 
integer                 BufferLength
type(T_TOKEN_GROUPS)    PreviousState 
integer                 ReturnLength
end function AdjustTokenGroups
end interface

interface
logical(4) function  PrivilegeCheck  (ClientToken ,RequiredPrivileges ,pfResult   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrivilegeCheck@12' :: PrivilegeCheck 
!MS$ ATTRIBUTES REFERENCE :: RequiredPrivileges
use msfwinty
integer(4)              ClientToken 
type(T_PRIVILEGE_SET)   RequiredPrivileges 
integer(4)              pfResult   
end function PrivilegeCheck
end interface

interface
logical(4) function  AccessCheckAndAuditAlarm (SubsystemName ,HandleId ,ObjectTypeName ,ObjectName ,SecurityDescriptor ,DesiredAccess ,GenericMapping ,ObjectCreation ,GrantedAccess ,AccessStatus ,pfGenerateOnClose) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AccessCheckAndAuditAlarmA@44' :: AccessCheckAndAuditAlarm
!MS$ ATTRIBUTES REFERENCE :: SubsystemName
!MS$ ATTRIBUTES REFERENCE :: ObjectTypeName
!MS$ ATTRIBUTES REFERENCE :: ObjectName
!MS$ ATTRIBUTES REFERENCE :: SecurityDescriptor
!MS$ ATTRIBUTES REFERENCE :: GenericMapping
use msfwinty
character*(*)               SubsystemName 
integer(4)                  HandleId 
character*(*)               ObjectTypeName 
character*(*)               ObjectName 
type(T_SECURITY_DESCRIPTOR) SecurityDescriptor 
integer(4)                  DesiredAccess 
type(T_GENERIC_MAPPING)     GenericMapping 
logical(4)                  ObjectCreation 
integer(4)                  GrantedAccess 
integer(4)                  AccessStatus 
integer(4)                  pfGenerateOnClose   
end function AccessCheckAndAuditAlarm
end interface

interface
logical(4) function  ObjectOpenAuditAlarm (SubsystemName ,HandleId ,ObjectTypeName ,ObjectName ,pSecurityDescriptor ,ClientToken ,DesiredAccess ,GrantedAccess ,Privileges ,ObjectCreation ,AccessGranted ,GenerateOnClose   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ObjectOpenAuditAlarmA@48' :: ObjectOpenAuditAlarm
!MS$ ATTRIBUTES REFERENCE :: SubsystemName
!MS$ ATTRIBUTES REFERENCE :: ObjectTypeName
!MS$ ATTRIBUTES REFERENCE :: ObjectName
!MS$ ATTRIBUTES REFERENCE :: pSecurityDescriptor
!MS$ ATTRIBUTES REFERENCE :: Privileges
use msfwinty
character*(*)               SubsystemName 
integer(4)                  HandleId 
character*(*)               ObjectTypeName 
character*(*)               ObjectName 
type(T_SECURITY_DESCRIPTOR) pSecurityDescriptor 
integer(4)                  ClientToken 
integer(4)                  DesiredAccess 
integer(4)                  GrantedAccess 
type(T_PRIVILEGE_SET)       Privileges 
logical(4)                  ObjectCreation 
logical(4)                  AccessGranted 
integer(4)                  GenerateOnClose   
end function ObjectOpenAuditAlarm
end interface

interface
logical(4) function  ObjectPrivilegeAuditAlarm (SubsystemName ,HandleId ,ClientToken ,DesiredAccess ,Privileges ,AccessGranted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ObjectPrivilegeAuditAlarmA@24' :: ObjectPrivilegeAuditAlarm
!MS$ ATTRIBUTES REFERENCE :: SubsystemName
!MS$ ATTRIBUTES REFERENCE :: Privileges
use msfwinty
character*(*)           SubsystemName 
integer(4)              HandleId 
integer(4)              ClientToken 
integer(4)              DesiredAccess 
type(T_PRIVILEGE_SET)   Privileges 
logical(4)              AccessGranted   
end function ObjectPrivilegeAuditAlarm
end interface

interface
logical(4) function  ObjectCloseAuditAlarm (SubsystemName ,HandleId ,GenerateOnClose   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ObjectCloseAuditAlarmA@12' :: ObjectCloseAuditAlarm
!MS$ ATTRIBUTES REFERENCE :: SubsystemName
character*(*)   SubsystemName 
integer         HandleId 
integer         GenerateOnClose   
end function ObjectCloseAuditAlarm
end interface

interface
integer(4) function  PrivilegedServiceAuditAlarm (SubsystemName ,ServiceName ,ClientToken ,Privileges ,AccessGranted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrivilegedServiceAuditAlarmA@20' :: PrivilegedServiceAuditAlarm
!MS$ ATTRIBUTES REFERENCE :: SubsystemName
!MS$ ATTRIBUTES REFERENCE :: ServiceName
!MS$ ATTRIBUTES REFERENCE :: Privileges
use msfwinty
character*(*)           SubsystemName 
character*(*)           ServiceName 
integer(4)              ClientToken 
type(T_PRIVILEGE_SET)   Privileges 
logical(4)              AccessGranted   
end function PrivilegedServiceAuditAlarm
end interface

interface
logical(4) function  IsValidSid  (pSid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsValidSid@4' :: IsValidSid 
integer(4)  pSid   
end function IsValidSid
end interface

interface
logical(4) function  EqualSid  (pSida ,pSidb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EqualSid@8' :: EqualSid 
integer(4)  pSida    
integer(4)  pSidb   
end function EqualSid
end interface

interface
logical(4) function  EqualPrefixSid  (pSida ,pSidb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EqualPrefixSid@8' :: EqualPrefixSid 
!MS$ ATTRIBUTES REFERENCE :: pSida 
!MS$ ATTRIBUTES REFERENCE :: pSida 
use msfwinty
type(T_SID) pSida    
type(T_SID) pSidb   
end function EqualPrefixSid
end interface

interface
integer(4) function  GetSidLengthRequired  (nSubAuthorityCount   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSidLengthRequired@4' :: GetSidLengthRequired 
character nSubAuthorityCount   
end function GetSidLengthRequired
end interface

interface
logical(4) function  AllocateAndInitializeSid  (pIdentifierAuthority ,nSubAuthorityCount ,nSubAuthority0 ,nSubAuthority1 ,nSubAuthority2 ,nSubAuthority3 ,nSubAuthority4 ,nSubAuthority5 ,nSubAuthority6 ,nSubAuthority7 ,pSid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_fAllocateAndInitializeSid@44' :: AllocateAndInitializeSid 
!MS$ ATTRIBUTES REFERENCE :: pIdentifierAuthority
use msfwinty
type(T_SID_IDENTIFIER_AUTHORITY)  pIdentifierAuthority 
BYTE                            nSubAuthorityCount 
integer(4)                      nSubAuthority0 
integer(4)                      nSubAuthority1 
integer(4)                      nSubAuthority2 
integer(4)                      nSubAuthority3 
integer(4)                      nSubAuthority4 
integer(4)                      nSubAuthority5 
integer(4)                      nSubAuthority6 
integer(4)                      nSubAuthority7 
integer(4)                      pSid   
end function AllocateAndInitializeSid
end interface

interface
integer(4) function  FreeSid (pSid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FreeSid@4' :: FreeSid
!MS$ ATTRIBUTES REFERENCE :: pSid
use msfwinty
type(T_SID) pSid   
end function FreeSid
end interface

interface
logical(4) function  InitializeSid  (Sid ,pIdentifierAuthority ,nSubAuthorityCount   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitializeSid@12' :: InitializeSid 
!MS$ ATTRIBUTES REFERENCE :: pIdentifierAuthority
use msfwinty
integer(4)                          Sid   
type(T_SID_IDENTIFIER_AUTHORITY)    pIdentifierAuthority 
BYTE                                nSubAuthorityCount   
end function InitializeSid
end interface

interface
integer(4) function  GetSidIdentifierAuthority  (pSid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSidIdentifierAuthority@4' :: GetSidIdentifierAuthority 
integer(4)  pSid   
end function GetSidIdentifierAuthority
end interface

interface
integer(4) function  GetSidSubAuthority  (pSid ,nSubAuthority   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSidSubAuthority@8' :: GetSidSubAuthority 
integer     pSid   
integer     nSubAuthority   
end function GetSidSubAuthority
end interface

interface
integer(4) function  GetSidSubAuthorityCount  (pSid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSidSubAuthorityCount@4' :: GetSidSubAuthorityCount 
integer(4)  pSid   
end function GetSidSubAuthorityCount
end interface

interface
integer(4) function  GetLengthSid  (pSid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetLengthSid@4' :: GetLengthSid 
!MS$ ATTRIBUTES REFERENCE :: pSid
use msfwinty
type(T_SID) pSid   
end function GetLengthSid
end interface

interface
logical(4) function  CopySid  (nDestinationSidLength ,pDestinationSid ,pSourceSid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CopySid@12' :: CopySid 
!MS$ ATTRIBUTES REFERENCE :: pDestinationSid
!MS$ ATTRIBUTES REFERENCE :: pSourceSid
use msfwinty
integer     nDestinationSidLength 
type(T_SID) pDestinationSid 
type(T_SID) pSourceSid   
end function CopySid
end interface

interface
logical(4) function  AreAllAccessesGranted  (GrantedAccess ,DesiredAccess   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AreAllAccessesGranted@8' :: AreAllAccessesGranted 
integer GrantedAccess 
integer DesiredAccess   
end function AreAllAccessesGranted
end interface

interface
logical(4) function  AreAnyAccessesGranted  (GrantedAccess ,DesiredAccess   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AreAnyAccessesGranted@8' :: AreAnyAccessesGranted 
integer GrantedAccess 
integer DesiredAccess   
end function AreAnyAccessesGranted
end interface

interface
subroutine  MapGenericMask  (AccessMask ,GenericMapping   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MapGenericMask@8' :: MapGenericMask 
!MS$ ATTRIBUTES REFERENCE :: GenericMapping
use msfwinty
integer                 AccessMask 
type(T_GENERIC_MAPPING) GenericMapping
end subroutine MapGenericMask
end interface

interface
logical(4) function  IsValidAcl  (pAcl   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsValidAcl@4' :: IsValidAcl 
integer(4)  pAcl   
end function IsValidAcl
end interface

interface
logical(4) function  InitializeAcl  (pAcl ,nAclLength ,dwAclRevision   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitializeAcl@12' :: InitializeAcl 
!MS$ ATTRIBUTES REFERENCE :: pAcl   
use msfwinty
type(T_ACL) pAcl   
integer     nAclLength 
integer     dwAclRevision   
end function InitializeAcl
end interface

interface
logical(4) function  GetAclInformation  (pAcl ,pAclInformation ,nAclInformationLength ,dwAclInformationClass   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetAclInformation@16' :: GetAclInformation 
integer         pAcl   
integer         pAclInformation 
integer         nAclInformationLength 
integer         dwAclInformationClass   
end function GetAclInformation
end interface

interface
logical(4) function  SetAclInformation  (pAcl ,pAclInformation ,nAclInformationLength ,dwAclInformationClass   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetAclInformation@16' :: SetAclInformation 
!MS$ ATTRIBUTES REFERENCE :: pAcl   
use msfwinty
type(T_ACL)     pAcl   
integer         pAclInformation 
integer         nAclInformationLength 
integer         dwAclInformationClass   
end function SetAclInformation
end interface

interface
logical(4) function  AddAce  (pAcl ,dwAceRevision ,dwStartingAceIndex ,pAceList ,nAceListLength   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddAce@20' :: AddAce 
!MS$ ATTRIBUTES REFERENCE :: pAcl   
use msfwinty
type(T_ACL) pAcl   
integer     dwAceRevision 
integer     dwStartingAceIndex 
integer     pAceList 
integer     nAceListLength   
end function AddAce
end interface

interface
logical(4) function  DeleteAce  (pAcl ,dwAceIndex   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteAce@8' :: DeleteAce 
!MS$ ATTRIBUTES REFERENCE :: pAcl   
use msfwinty
type(T_ACL) pAcl   
integer     dwAceIndex   
end function DeleteAce
end interface

interface
logical(4) function  GetAce  (pAcl ,dwAceIndex ,pAce   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetAce@12' :: GetAce 
integer     pAcl   
integer     dwAceIndex 
integer     pAce   
end function GetAce
end interface

interface
logical(4) function  AddAccessAllowedAce  (pAcl ,dwAceRevision ,AccessMask ,pSid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddAccessAllowedAce@16' :: AddAccessAllowedAce 
!MS$ ATTRIBUTES REFERENCE :: pAcl   
!MS$ ATTRIBUTES REFERENCE :: pSid 
use msfwinty
type(T_ACL) pAcl   
integer     dwAceRevision 
integer     AccessMask 
type(T_SID) pSid
end function AddAccessAllowedAce
end interface

interface
logical(4) function  AddAccessDeniedAce  (pAcl ,dwAceRevision ,AccessMask ,pSid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddAccessDeniedAce@16' :: AddAccessDeniedAce 
!MS$ ATTRIBUTES REFERENCE :: pAcl   
!MS$ ATTRIBUTES REFERENCE :: pSid 
use msfwinty
type(T_ACL) pAcl   
integer     dwAceRevision 
integer     AccessMask 
type(T_SID) pSid
end function AddAccessDeniedAce
end interface

interface
logical(4) function  AddAuditAccessAce (pAcl ,dwAceRevision ,dwAccessMask ,pSid ,bAuditSuccess ,bAuditFailure   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddAuditAccessAce@24' :: AddAuditAccessAce
!MS$ ATTRIBUTES REFERENCE :: pAcl   
!MS$ ATTRIBUTES REFERENCE :: pSid 
use msfwinty
type(T_ACL)     pAcl   
integer(4)      dwAceRevision 
integer(4)      dwAccessMask 
type(T_SID)     pSid
logical(4)      bAuditSuccess 
logical(4)      bAuditFailure   
end function AddAuditAccessAce
end interface

interface
logical(4) function  FindFirstFreeAce  (pAcl ,pAce   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindFirstFreeAce@8' :: FindFirstFreeAce 
!MS$ ATTRIBUTES REFERENCE :: pAcl   
use msfwinty
type(T_ACL) pAcl   
integer     pAce   
end function FindFirstFreeAce
end interface

interface
logical(4) function  InitializeSecurityDescriptor  (pSecurityDescriptor ,dwRevision   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitializeSecurityDescriptor@8' :: InitializeSecurityDescriptor 
integer(4)  pSecurityDescriptor 
integer(4)  dwRevision   
end function InitializeSecurityDescriptor
end interface

interface
logical(4) function  IsValidSecurityDescriptor  (pSecurityDescriptor   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsValidSecurityDescriptor@4' :: IsValidSecurityDescriptor 
integer(4)  pSecurityDescriptor 
end function IsValidSecurityDescriptor
end interface

interface
integer(4) function  GetSecurityDescriptorLength  (pSecurityDescriptor   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSecurityDescriptorLength@4' :: GetSecurityDescriptorLength 
integer(4)  pSecurityDescriptor 
end function GetSecurityDescriptorLength
end interface

interface
logical(4) function  GetSecurityDescriptorControl  (pSecurityDescriptor ,pControl ,lpdwRevision   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSecurityDescriptorControl@12' :: GetSecurityDescriptorControl 
integer  pSecurityDescriptor 
integer  pControl 
integer  lpdwRevision   
end function GetSecurityDescriptorControl
end interface

interface
logical(4) function  SetSecurityDescriptorDacl  (pSecurityDescriptor ,bDaclPresent ,pDacl ,bDaclDefaulted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetSecurityDescriptorDacl@16' :: SetSecurityDescriptorDacl 
!MS$ ATTRIBUTES REFERENCE :: pDacl
use msfwinty
integer(4)      pSecurityDescriptor 
logical(4)      bDaclPresent 
type(T_ACL)     pDacl 
logical(4)      bDaclDefaulted   
end function SetSecurityDescriptorDacl
end interface

interface
logical(4) function  GetSecurityDescriptorDacl  (pSecurityDescriptor ,lpbDaclPresent ,pDacl ,lpbDaclDefaulted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSecurityDescriptorDacl@16' :: GetSecurityDescriptorDacl 
integer pSecurityDescriptor 
integer lpbDaclPresent 
integer pDacl 
integer lpbDaclDefaulted   
end function GetSecurityDescriptorDacl
end interface

interface
logical(4) function  SetSecurityDescriptorSacl  (pSecurityDescriptor ,bSaclPresent ,pSacl ,bSaclDefaulted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetSecurityDescriptorSacl@16' :: SetSecurityDescriptorSacl 
integer(4)  pSecurityDescriptor 
logical(4)  bSaclPresent 
integer(4)  pSacl 
logical(4)  bSaclDefaulted   
end function SetSecurityDescriptorSacl
end interface

interface
logical(4) function  GetSecurityDescriptorSacl  (pSecurityDescriptor ,lpbSaclPresent ,pSacl ,lpbSaclDefaulted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSecurityDescriptorSacl@16' :: GetSecurityDescriptorSacl 
integer pSecurityDescriptor 
integer lpbSaclPresent 
integer pSacl 
integer lpbSaclDefaulted   
end function GetSecurityDescriptorSacl
end interface

interface
logical(4) function  SetSecurityDescriptorOwner  (pSecurityDescriptor ,pOwner ,bOwnerDefaulted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetSecurityDescriptorOwner@12' :: SetSecurityDescriptorOwner 
!MS$ ATTRIBUTES REFERENCE :: pSecurityDescriptor 
use msfwinty
type(T_SECURITY_DESCRIPTOR)   pSecurityDescriptor 
integer                     pOwner 
logical(4)                  bOwnerDefaulted   
end function SetSecurityDescriptorOwner
end interface

interface
logical(4) function  GetSecurityDescriptorOwner  (pSecurityDescriptor ,pOwner ,lpbOwnerDefaulted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSecurityDescriptorOwner@12' :: GetSecurityDescriptorOwner 
integer     pSecurityDescriptor 
integer     pOwner 
integer     lpbOwnerDefaulted   
end function GetSecurityDescriptorOwner
end interface

interface
logical(4) function  SetSecurityDescriptorGroup  (pSecurityDescriptor ,pGroup ,bGroupDefaulted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetSecurityDescriptorGroup@12' :: SetSecurityDescriptorGroup 
integer     pSecurityDescriptor 
integer     pGroup 
logical(4)  bGroupDefaulted   
end function SetSecurityDescriptorGroup
end interface

interface
logical(4) function  GetSecurityDescriptorGroup  (pSecurityDescriptor ,pGroup ,lpbGroupDefaulted   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSecurityDescriptorGroup@12' :: GetSecurityDescriptorGroup 
integer(4)      pSecurityDescriptor 
integer         pGroup 
integer         lpbGroupDefaulted   
end function GetSecurityDescriptorGroup
end interface

interface
logical(4) function  CreatePrivateObjectSecurity  (ParentDescriptor ,CreatorDescriptor ,NewDescriptor ,IsDirectoryObject ,Token ,GenericMapping   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreatePrivateObjectSecurity@24' :: CreatePrivateObjectSecurity 
!MS$ ATTRIBUTES REFERENCE :: ParentDescriptor
!MS$ ATTRIBUTES REFERENCE :: CreatorDescriptor
use msfwinty
type(T_SECURITY_DESCRIPTOR) ParentDescriptor 
type(T_SECURITY_DESCRIPTOR) CreatorDescriptor
integer(4)                  NewDescriptor 
logical(4)                  IsDirectoryObject 
integer(4)                  Token 
type(T_GENERIC_MAPPING)     GenericMapping   
end function CreatePrivateObjectSecurity
end interface

interface
logical(4) function  SetPrivateObjectSecurity  (SecurityInformation ,ModificationDescriptor ,ObjectsSecurityDescriptor ,GenericMapping ,Token   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetPrivateObjectSecurity@20' :: SetPrivateObjectSecurity 
!MS$ ATTRIBUTES REFERENCE :: ModificationDescriptor 
use msfwinty
integer                         SecurityInformation 
type(T_SECURITY_DESCRIPTOR)     ModificationDescriptor 
integer                         ObjectsSecurityDescriptor 
type(T_GENERIC_MAPPING)         GenericMapping   
integer                         Token   
end function SetPrivateObjectSecurity
end interface

interface
logical(4) function  GetPrivateObjectSecurity  (ObjectDescriptor ,SecurityInformation ,ResultantDescriptor ,DescriptorLength ,ReturnLength   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPrivateObjectSecurity@20' :: GetPrivateObjectSecurity 
!MS$ ATTRIBUTES REFERENCE :: ObjectDescriptor 
!MS$ ATTRIBUTES REFERENCE :: ResultantDescriptor 
use msfwinty
type(T_SECURITY_DESCRIPTOR)     ObjectDescriptor 
integer                         SecurityInformation 
type(T_SECURITY_DESCRIPTOR)     ResultantDescriptor 
integer(4)                      DescriptorLength 
integer(4)                      ReturnLength
end function GetPrivateObjectSecurity
end interface

interface
logical(4) function  DestroyPrivateObjectSecurity  (ObjectDescriptor   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DestroyPrivateObjectSecurity@4' :: DestroyPrivateObjectSecurity 
integer ObjectDescriptor   
end function DestroyPrivateObjectSecurity
end interface

interface
logical(4) function  MakeSelfRelativeSD  (pAbsoluteSecurityDescriptor, pSelfRelativeSecurityDescriptor, lpdwBufferLength   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeSelfRelativeSD@12' :: MakeSelfRelativeSD 
!MS$ ATTRIBUTES REFERENCE :: pAbsoluteSecurityDescriptor 
!MS$ ATTRIBUTES REFERENCE :: pSelfRelativeSecurityDescriptor 
use msfwinty
type(T_SECURITY_DESCRIPTOR)     pAbsoluteSecurityDescriptor 
type(T_SECURITY_DESCRIPTOR)     pSelfRelativeSecurityDescriptor 
integer                         lpdwBufferLength   
end function MakeSelfRelativeSD
end interface

interface
logical(4) function  MakeAbsoluteSD  (pSelfRelativeSecurityDescriptor ,pAbsoluteSecurityDescriptor ,lpdwAbsSecurityDescriptorSize ,pDacl ,lpdwDaclSize ,pSacl ,lpdwSaclSize ,pOwner ,lpdwOwnerSize ,pPrimaryGroup ,lpdwPrimaryGroupSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeAbsoluteSD@44' :: MakeAbsoluteSD 
!MS$ ATTRIBUTES REFERENCE :: pSelfRelativeSecurityDescriptor
!MS$ ATTRIBUTES REFERENCE :: pAbsoluteSecurityDescriptor 
!MS$ ATTRIBUTES REFERENCE :: pDacl
!MS$ ATTRIBUTES REFERENCE :: pSacl 
!MS$ ATTRIBUTES REFERENCE :: pOwner
!MS$ ATTRIBUTES REFERENCE :: pPrimaryGroup 
use msfwinty
type(T_SECURITY_DESCRIPTOR) pSelfRelativeSecurityDescriptor
type(T_SECURITY_DESCRIPTOR) pAbsoluteSecurityDescriptor
integer                     lpdwAbsSecurityDescriptorSize 
type(T_ACL)                 pDacl 
integer                     lpdwDaclSize 
type(T_ACL)                 pSacl 
integer                     lpdwSaclSize 
type(T_SID)                 pOwner 
integer                     lpdwOwnerSize 
type(T_SID)                 pPrimaryGroup 
integer                     lpdwPrimaryGroupSize   
end function MakeAbsoluteSD
end interface

interface
logical(4) function  SetFileSecurity (lpFileName ,SecurityInformation ,pSecurityDescriptor   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetFileSecurityA@12' :: SetFileSecurity
!MS$ ATTRIBUTES REFERENCE :: lpFileName
!MS$ ATTRIBUTES REFERENCE :: pSecurityDescriptor
use msfwinty
character*(*)               lpFileName 
integer                     SecurityInformation 
type(T_SECURITY_DESCRIPTOR)   pSecurityDescriptor   
end function SetFileSecurity
end interface

interface
logical(4) function  GetFileSecurity (lpFileName ,RequestedInformation ,pSecurityDescriptor ,nLength ,lpnLengthNeeded   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetFileSecurityA@20' :: GetFileSecurity
!MS$ATTRIBUTES REFERENCE :: lpFileName 
character*(*)       lpFileName 
integer             RequestedInformation 
integer             pSecurityDescriptor   
integer             nLength 
integer             lpnLengthNeeded   
end function GetFileSecurity
end interface

interface
logical(4) function  SetKernelObjectSecurity  (Handle ,SecurityInformation ,SecurityDescriptor   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetKernelObjectSecurity@12' :: SetKernelObjectSecurity 
!MS$ATTRIBUTES REFERENCE :: SecurityDescriptor   
use msfwinty
integer                     Handle 
integer                     SecurityInformation 
type(T_SECURITY_DESCRIPTOR) SecurityDescriptor   
end function SetKernelObjectSecurity
end interface

interface
integer(4) function  FindFirstChangeNotification (lpPathName ,bWatchSubtree ,dwNotifyFilter   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindFirstChangeNotificationA@12' :: FindFirstChangeNotification
!MS$ ATTRIBUTES REFERENCE :: lpPathName
character*(*)   lpPathName 
logical(4)      bWatchSubtree 
integer(4)      dwNotifyFilter   
end function FindFirstChangeNotification
end interface

interface
logical(4) function  FindNextChangeNotification (hChangeHandle   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindNextChangeNotification@4' :: FindNextChangeNotification
integer hChangeHandle   
end function FindNextChangeNotification
end interface

interface
logical(4) function  FindCloseChangeNotification (hChangeHandle   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FindCloseChangeNotification@4' :: FindCloseChangeNotification
integer hChangeHandle   
end function FindCloseChangeNotification
end interface

interface
logical(4) function  VirtualLock (lpAddress ,dwSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VirtualLock@8' :: VirtualLock
integer lpAddress 
integer dwSize   
end function VirtualLock
end interface

interface
logical(4) function  VirtualUnlock (lpAddress ,dwSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VirtualUnlock@8' :: VirtualUnlock
integer lpAddress 
integer dwSize   
end function VirtualUnlock
end interface

interface
integer(4) function  MapViewOfFileEx (hFileMappingObject ,dwDesiredAccess ,dwFileOffsetHigh ,dwFileOffsetLow ,dwNumberOfBytesToMap ,lpBaseAddress   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MapViewOfFileEx@24' :: MapViewOfFileEx
integer hFileMappingObject 
integer dwDesiredAccess 
integer dwFileOffsetHigh 
integer dwFileOffsetLow 
integer dwNumberOfBytesToMap 
integer lpBaseAddress   
end function MapViewOfFileEx
end interface

interface
logical(4) function  SetPriorityClass (hProcess ,dwPriorityClass   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetPriorityClass@8' :: SetPriorityClass
integer hProcess 
integer dwPriorityClass   
end function SetPriorityClass
end interface

interface
integer(4) function  GetPriorityClass (hProcess   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPriorityClass@4' :: GetPriorityClass
integer hProcess   
end function GetPriorityClass
end interface

interface
logical(4) function  IsBadReadPtr (lp ,ucb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsBadReadPtr@8' :: IsBadReadPtr
integer lp 
integer ucb   
end function IsBadReadPtr
end interface

interface
logical(4) function  IsBadWritePtr (lp ,ucb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsBadWritePtr@8' :: IsBadWritePtr
integer lp 
integer ucb   
end function IsBadWritePtr
end interface

interface
logical(4) function  IsBadHugeReadPtr (lp ,ucb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsBadHugeReadPtr@8' :: IsBadHugeReadPtr
integer lp 
integer ucb   
end function IsBadHugeReadPtr
end interface

interface
logical(4) function  IsBadHugeWritePtr (lp ,ucb   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsBadHugeWritePtr@8' :: IsBadHugeWritePtr
integer lp 
integer ucb   
end function IsBadHugeWritePtr
end interface

interface
logical(4) function  IsBadCodePtr (lpfn   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsBadCodePtr@4' :: IsBadCodePtr
integer lpfn   
end function IsBadCodePtr
end interface

interface
logical(4) function  IsBadStringPtr (lpsz ,ucchMax   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsBadStringPtrA@8' :: IsBadStringPtr
!MS$ATTRIBUTES REFERENCE :: lpsz
character*(*)   lpsz 
integer         ucchMax   
end function IsBadStringPtr
end interface

interface
logical(4) function  LookupAccountSid (lpSystemName ,Sid ,Name ,cbName ,ReferencedDomainName ,cbReferencedDomainName ,peUse   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LookupAccountSidA@28' :: LookupAccountSid
!MS$ATTRIBUTES REFERENCE :: lpSystemName
!MS$ATTRIBUTES REFERENCE :: Name
!MS$ATTRIBUTES REFERENCE :: ReferencedDomainName
use msfwinty
character*(*)   lpSystemName 
integer(4)      Sid 
character*(*)   Name 
integer         cbName 
character*(*)   ReferencedDomainName 
integer         cbReferencedDomainName 
integer         peUse   
end function LookupAccountSid
end interface

interface
logical(4) function  LookupAccountName (lpSystemName ,lpAccountName ,Sid ,cbSid ,ReferencedDomainName ,cbReferencedDomainName ,peUse   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LookupAccountNameA@28' :: LookupAccountName
!MS$ATTRIBUTES REFERENCE :: lpSystemName
!MS$ATTRIBUTES REFERENCE :: lpAccountName
!MS$ATTRIBUTES REFERENCE :: Sid
!MS$ATTRIBUTES REFERENCE :: ReferencedDomainName
use msfwinty
character*(*)   lpSystemName 
character*(*)   lpAccountName 
type(T_SID)     Sid 
integer         cbSid 
character*(*)   ReferencedDomainName 
integer         cbReferencedDomainName 
integer         peUse   
end function LookupAccountName
end interface

interface
logical(4) function  LookupPrivilegeValue (lpSystemName ,lpName ,lpLuid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LookupPrivilegeValueA@12' :: LookupPrivilegeValue
!MS$ATTRIBUTES REFERENCE :: lpSystemName 
!MS$ATTRIBUTES REFERENCE :: lpName 
character*(*)   lpSystemName 
character*(*)   lpName 
integer         lpLuid   
end function LookupPrivilegeValue
end interface

interface
logical(4) function  LookupPrivilegeName (lpSystemName ,lpLuid ,lpName ,cbName   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LookupPrivilegeNameA@16' :: LookupPrivilegeName
!MS$ ATTRIBUTES REFERENCE :: lpSystemName
!MS$ ATTRIBUTES REFERENCE :: lpName
character*(*)   lpSystemName 
integer         lpLuid 
character*(*)   lpName 
integer         cbName   
end function LookupPrivilegeName
end interface

interface
logical(4) function  LookupPrivilegeDisplayName (lpSystemName ,lpName ,lpDisplayName ,cbDisplayName ,lpLanguageId   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LookupPrivilegeDisplayNameA@20' :: LookupPrivilegeDisplayName
!MS$ ATTRIBUTES REFERENCE :: lpSystemName
!MS$ ATTRIBUTES REFERENCE :: lpName
!MS$ ATTRIBUTES REFERENCE :: lpDisplayName 
character*(*)   lpSystemName 
character*(*)   lpName 
character*(*)   lpDisplayName 
integer         cbDisplayName 
integer         lpLanguageId   
end function LookupPrivilegeDisplayName
end interface

interface
logical(4) function  AllocateLocallyUniqueId (Luid   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AllocateLocallyUniqueId@4' :: AllocateLocallyUniqueId
integer Luid   
end function AllocateLocallyUniqueId
end interface

interface
logical(4) function  BuildCommDCB (lpDef ,lpDCB   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BuildCommDCBA@8' :: BuildCommDCB
!MS$ ATTRIBUTES REFERENCE :: lpDef
!MS$ ATTRIBUTES REFERENCE :: lpDCB
use msfwinty
character*(*)   lpDef 
type(T_DCB)     lpDCB
end function BuildCommDCB
end interface

interface
logical(4) function  BuildCommDCBAndTimeouts (lpDef ,lpDCB ,lpCommTimeouts   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BuildCommDCBAndTimeoutsA@12' :: BuildCommDCBAndTimeouts
!MS$ ATTRIBUTES REFERENCE :: lpDef
!MS$ ATTRIBUTES REFERENCE :: lpDCB
use msfwinty
character*(*)           lpDef 
type(T_DCB)             lpDCB
type(T_COMMTIMEOUTS)    lpCommTimeouts   
end function BuildCommDCBAndTimeouts
end interface


interface
logical(4) function CommConfigDialog (lpszName, hWnd, lpCC)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CommConfigDialogA@12' :: CommConfigDialog
integer(4)  lpszName
integer(4)  hWnd
integer(4)  lpCC
end function CommConfigDialog
end interface

interface
logical(4) function GetDefaultCommConfig (lpszName, lpCC, lpdwSize)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetDefaultCommConfigA@12' :: GetDefaultCommConfig
integer(4)  lpszName
integer(4)  lpCC
integer(4)  lpdwSize
end function GetDefaultCommConfig
end interface

interface
logical(4) function SetDefaultCommConfig (lpszName, lpCC, dwSize)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetDefaultCommConfigA@12' :: SetDefaultCommConfig
integer(4)  lpszName
integer(4)  lpCC
integer(4)  dwSize
end function SetDefaultCommConfig
end interface

interface
logical(4) function  GetComputerName (lpBuffer ,nSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetComputerNameA@8' :: GetComputerName
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
character*(*)   lpBuffer 
integer         nSize   
end function GetComputerName
end interface

interface
logical(4) function  SetComputerName (lpComputerName) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetComputerNameA@4' :: SetComputerName
!MS$ ATTRIBUTES REFERENCE :: lpComputerName
character*(*)   lpComputerName
end function SetComputerName
end interface

interface
logical(4) function  GetUserName (lpBuffer ,nSize   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetUserNameA@8' :: GetUserName
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
character*(*)   lpBuffer 
integer         nSize   
end function GetUserName
end interface

! 
!  Performance counter API's
! 

interface
logical(4) function  QueryPerformanceCounter (lpPerformanceCount   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_QueryPerformanceCounter@4' :: QueryPerformanceCounter
integer lpPerformanceCount   
end function QueryPerformanceCounter
end interface

interface
logical(4) function  QueryPerformanceFrequency (lpFrequency   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_QueryPerformanceFrequency@4' :: QueryPerformanceFrequency
integer lpFrequency   
end function QueryPerformanceFrequency
end interface

interface
logical(4) function GetVersionEx (lpVersionInformation)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetVersionExA@4' :: GetVersionEx
!MS$ ATTRIBUTES REFERENCE :: lpVersionInformation
use msfwinty
type(T_OSVERSIONINFO)  lpVersionInformation
end function GetVersionEx
end interface


interface 
subroutine MoveMemory (Destination,Source,Length)
!MS$ ATTRIBUTES STDCALL,ALIAS :'_RtlMoveMemory@12' ::  MoveMemory
integer(4)     Destination 
integer(4)     Source 
integer(4)     Length 
end subroutine MoveMemory
end interface

interface 
subroutine FillMemory (Destination,Length, Fill)
!MS$ ATTRIBUTES STDCALL,ALIAS : '_RtlFillMemory@12' ::  FillMemory
integer(4)     Destination 
integer(4)     Length 
integer(4)     Fill 
end subroutine FillMemory
end interface

interface 
subroutine CopyMemory (Destination,Source,Length)
!MS$ ATTRIBUTES STDCALL,ALIAS : '_RtlMoveMemory@12' :: CopyMemory
integer(4)     Destination 
integer(4)     Source 
integer(4)     Length 
end subroutine CopyMemory
end interface

interface 
subroutine ZeroMemory (Destination,Length)
!MS$ATTRIBUTES STDCALL,ALIAS :'_RtlZeroMemory@8' :: ZeroMemory
integer(4)     Destination 
integer(4)     Length 
end subroutine ZeroMemory
end interface


!                       *****WINGDI*****

interface
integer function  AddFontResource (dummy) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddFontResourceA@4' :: AddFontResource
!MS$ ATTRIBUTES REFERENCE :: dummy
character*(*)   dummy
end function AddFontResource
end interface

interface
logical(4) function  AnimatePalette (dummy0,dummy1,dummy2,dummy) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AnimatePalette@16' :: AnimatePalette
!MS$ ATTRIBUTES REFERENCE :: dummy
use msfwinty
integer                 dummy0  
integer                 dummy1  
integer                 dummy2  
type(T_PALETTEENTRY)    dummy  
end function AnimatePalette
end interface

interface
logical(4) function  MSFWIN$Arc (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Arc@36' :: MSFWIN$Arc
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
integer dummy4  
integer dummy5  
integer dummy6  
integer dummy7  
integer dummy8  
end function MSFWIN$Arc
end interface

interface
logical(4) function  BitBlt (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BitBlt@36' :: BitBlt
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
integer dummy4  
integer dummy5  
integer dummy6  
integer dummy7  
integer dummy8  
end function BitBlt
end interface

interface
logical(4) function  CancelDC (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CancelDC@4' :: CancelDC
integer dummy0  
end function CancelDC
end interface

interface
logical(4) function  Chord (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Chord@36' :: Chord
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
integer dummy4  
integer dummy5  
integer dummy6  
integer dummy7  
integer dummy8  
end function Chord
end interface

interface
integer function  CloseMetaFile (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CloseMetaFile@4' :: CloseMetaFile
integer dummy0 
end function CloseMetaFile
end interface

interface
integer function ChoosePixelFormat (hDC, lpPixelFormatDescriptor)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChoosePixelFormat@8' :: ChoosePixelFormat
!MS$ ATTRIBUTES REFERENCE :: lppixelFormatDescriptor
use msfwinty
integer                         hDC
type (T_PIXELFORMATDESCRIPTOR)  lppixelFormatDescriptor
end function ChoosePixelFormat
end interface

interface
integer function  CombineRgn (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CombineRgn@16' :: CombineRgn
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
end function CombineRgn
end interface

interface
integer function  CopyMetaFile (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CopyMetaFileA@8' :: CopyMetaFile
!MS$ ATTRIBUTES REFERENCE :: dummy1
integer         dummy0  
character*(*)   dummy1  
end function CopyMetaFile
end interface

interface
integer function  CreateBitmap (dummy0,dummy1,dummy2,dummy3,dummy4)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateBitmap@20' :: CreateBitmap
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
integer dummy4  
end function CreateBitmap
end interface

interface
integer function  CreateBitmapIndirect (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateBitmapIndirect@4' :: CreateBitmapIndirect
!MS$ ATTRIBUTES REFERENCE :: dummy0  
use msfwinty
type(T_BITMAP)  dummy0  
end function CreateBitmapIndirect
end interface

interface
integer function  CreateBrushIndirect (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateBrushIndirect@4' :: CreateBrushIndirect
!MS$ ATTRIBUTES REFERENCE :: dummy0  
use msfwinty
type(T_LOGBRUSH)  dummy0  
end function CreateBrushIndirect
end interface

interface
integer function  CreateCompatibleBitmap (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateCompatibleBitmap@12' :: CreateCompatibleBitmap
integer dummy0  
integer dummy1  
integer dummy2  
end function CreateCompatibleBitmap
end interface

interface
integer function  CreateDiscardableBitmap (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateDiscardableBitmap@12' :: CreateDiscardableBitmap
integer dummy0  
integer dummy1  
integer dummy2  
end function CreateDiscardableBitmap
end interface

interface
integer function  CreateCompatibleDC (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateCompatibleDC@4' :: CreateCompatibleDC
integer dummy0 
end function CreateCompatibleDC
end interface

interface
integer function  CreateDC (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateDCA@16' :: CreateDC
!MS$ ATTRIBUTES REFERENCE :: dummy0
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy2
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
character*(*)   dummy0  
character*(*)   dummy1  
character*(*)   dummy2  
type(T_DEVMODE) dummy3  
end function CreateDC
end interface

interface
integer function  CreateDIBitmap (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateDIBitmap@24' :: CreateDIBitmap
integer     dummy0  
integer     dummy1
integer     dummy2  
integer     dummy3  
integer     dummy4  
integer     dummy5  
end function CreateDIBitmap
end interface


interface
integer function  CreateDIBPatternBrush (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateDIBPatternBrush@8' :: CreateDIBPatternBrush
integer dummy0  
integer dummy1  
end function CreateDIBPatternBrush
end interface

interface
integer function  CreateDIBPatternBrushPt (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateDIBPatternBrushPt@8' :: CreateDIBPatternBrushPt
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
type(T_BITMAPINFO)  dummy0  
integer             dummy1  
end function CreateDIBPatternBrushPt
end interface


interface
integer function  CreateEllipticRgn (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateEllipticRgn@16' :: CreateEllipticRgn
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
end function CreateEllipticRgn
end interface

interface
integer function  CreateEllipticRgnIndirect (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateEllipticRgnIndirect@4' :: CreateEllipticRgnIndirect
!MS$ ATTRIBUTES REFERENCE :: dummy0
use msfwinty
type(T_RECT)    dummy0  
end function CreateEllipticRgnIndirect
end interface

interface
integer function  CreateFontIndirect (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateFontIndirectA@4' :: CreateFontIndirect
!MS$ ATTRIBUTES REFERENCE :: dummy0
use msfwinty
type(T_LOGFONT)   dummy0
end function CreateFontIndirect
end interface


interface
integer function  CreateFont (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8,dummy9,dummy10,dummy11,dummy12,dummy13) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateFontA@56' :: CreateFont
!MS$ ATTRIBUTES REFERENCE :: dummy13
integer         dummy0 
integer         dummy1 
integer         dummy2 
integer         dummy3 
integer         dummy4 
integer         dummy5 
integer         dummy6 
integer         dummy7 
integer         dummy8 
integer         dummy9 
integer         dummy10 
integer         dummy11 
integer         dummy12 
character*(*)   dummy13 
end function CreateFont
end interface

interface
integer function  CreateHatchBrush (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateHatchBrush@8' :: CreateHatchBrush
integer dummy0 
integer dummy1 
end function CreateHatchBrush
end interface

interface
integer function  CreateIC (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateICA@16' :: CreateIC
!MS$ ATTRIBUTES REFERENCE :: dummy0
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy2
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
character*(*)   dummy0  
character*(*)   dummy1  
character*(*)   dummy2  
type(T_DEVMODE) dummy3  
end function CreateIC
end interface


interface
integer function  CreateMetaFile (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateMetaFileA@4' :: CreateMetaFile
!MS$ ATTRIBUTES REFERENCE :: dummy0
use msfwinty
character*(*)   dummy0  
end function CreateMetaFile
end interface

interface
integer function  CreatePalette (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreatePalette@4' :: CreatePalette
!MS$ ATTRIBUTES REFERENCE :: dummy0
use msfwinty
type(T_LOGPALETTE)    dummy0
end function CreatePalette
end interface

interface
integer function  CreatePen (dummy0,dummy1,dummy2)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreatePen@12' :: CreatePen
integer dummy0 
integer dummy1 
integer dummy2 
end function CreatePen
end interface

interface
integer function  CreatePenIndirect (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreatePenIndirect@4' :: CreatePenIndirect
!MS$ ATTRIBUTES REFERENCE :: dummy0
use msfwinty
type(T_LOGPEN)  dummy0 
end function CreatePenIndirect
end interface

interface
integer function  CreatePolyPolygonRgn (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreatePolyPolygonRgn@16' :: CreatePolyPolygonRgn
!MS$ ATTRIBUTES REFERENCE :: dummy0
use msfwinty
type(T_POINT)   dummy0  
integer         dummy1  
integer         dummy2  
integer         dummy3  
end function CreatePolyPolygonRgn
end interface

interface
integer function  CreatePatternBrush (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreatePatternBrush@4' :: CreatePatternBrush
integer dummy0 
end function CreatePatternBrush
end interface

interface
integer function  CreateRectRgn (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateRectRgn@16' :: CreateRectRgn
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
end function CreateRectRgn
end interface

interface
integer function  CreateRectRgnIndirect (dummy) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateRectRgnIndirect@4' :: CreateRectRgnIndirect
!MS$ ATTRIBUTES REFERENCE :: dummy
use msfwinty
type(T_RECT)  dummy 
end function CreateRectRgnIndirect
end interface

interface
function  CreateRoundRectRgn (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateRoundRectRgn@24' :: CreateRoundRectRgn
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
integer dummy5 
end function CreateRoundRectRgn
end interface


interface
logical(4) function  CreateScalableFontResource (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateScalableFontResourceA@16' :: CreateScalableFontResource
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy2
!MS$ ATTRIBUTES REFERENCE :: dummy3
integer         dummy0 
character*(*)   dummy1
character*(*)   dummy2
character*(*)   dummy3
end function CreateScalableFontResource
end interface


interface
integer function  CreateSolidBrush (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateSolidBrush@4' :: CreateSolidBrush
integer dummy0  
end function CreateSolidBrush
end interface

interface
logical(4) function  DeleteDC (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteDC@4' :: DeleteDC
integer dummy0 
end function DeleteDC
end interface

interface
logical(4) function  DeleteMetaFile (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteMetaFile@4' :: DeleteMetaFile
integer dummy0 
end function DeleteMetaFile
end interface

interface
logical(4) function  DeleteObject (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteObject@4' :: DeleteObject
integer dummy0 
end function DeleteObject
end interface

interface
integer(4) function DescribePixelFormat (hdc, iPixelFormat, nBytes, ppfd)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DescribePixelFormat@16' :: DescribePixelFormat
!MS$ ATTRIBUTES REFERENCE :: ppfd
use msfwinty
integer(4)                      hdc
integer(4)                      iPixelFormat
integer(4)                      nBytes
type (T_PIXELFORMATDESCRIPTOR)  ppfd
end function DescribePixelFormat
end interface

interface
integer function  DeviceCapabilities (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeviceCapabilitiesA@20' :: DeviceCapabilities
!MS$ ATTRIBUTES REFERENCE :: dummy0  
!MS$ ATTRIBUTES REFERENCE :: dummy1  
!MS$ ATTRIBUTES REFERENCE :: dummy3  
!MS$ ATTRIBUTES REFERENCE :: dummy4  
use msfwinty
character*(*)   dummy0  
character*(*)   dummy1  
integer*2       dummy2  
character*(*)   dummy3 
type(T_DEVMODE) dummy4 
end function DeviceCapabilities
end interface

interface
logical(4) function  MSFWIN$Ellipse (dummy0,dummy1,dummy2,dummy3,dummy4)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Ellipse@20' :: MSFWIN$Ellipse
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
end function MSFWIN$Ellipse
end interface

interface
integer function  EnumFontFamilies (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumFontFamiliesA@16' :: EnumFontFamilies
!MS$ ATTRIBUTES REFERENCE :: dummy1  
integer         dummy0  
character*(*)   dummy1  
integer         dummy2  
integer         dummy3  
end function EnumFontFamilies
end interface

interface
integer(4) function  EnumFonts (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumFontsA@16' :: EnumFonts
!MS$ ATTRIBUTES REFERENCE :: dummy1  
integer         dummy0  
character*(*)   dummy1  
integer         dummy2  
integer         dummy3  
end function EnumFonts
end interface

interface
integer function  EnumObjects (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumObjects@16' :: EnumObjects
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
end function EnumObjects
end interface

interface
logical (4) function  EqualRgn (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EqualRgn@8' :: EqualRgn
integer dummy0 
integer dummy1 
end function EqualRgn
end interface

interface
integer function  Escape (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Escape@20' :: Escape
!MS$ ATTRIBUTES REFERENCE :: dummy3
integer         dummy0 
integer         dummy1 
integer         dummy2 
character*(*)   dummy3 
integer         dummy4 
end function Escape
end interface

interface
integer function  ExtEscape (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExtEscape@24' :: ExtEscape
!MS$ ATTRIBUTES REFERENCE :: dummy3
!MS$ ATTRIBUTES REFERENCE :: dummy5
integer         dummy0 
integer         dummy1 
integer         dummy2 
character*(*)   dummy3 
integer         dummy4 
character*(*)   dummy5 
end function ExtEscape
end interface

interface
integer function DrawEscape (dummy0,dummy1,dummy2,dummy3)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DrawEscape@16' :: DrawEscape
!MS$ ATTRIBUTES REFERENCE :: dummy3
integer         dummy0 
integer         dummy1 
integer         dummy2 
character*(*)   dummy3 
end function DrawEscape
end interface

interface
integer function  ExcludeClipRect (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExcludeClipRect@20' :: ExcludeClipRect
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
end function ExcludeClipRect
end interface

interface
integer function  ExtCreateRegion (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExtCreateRegion@12' :: ExtCreateRegion
!MS$ ATTRIBUTES REFERENCE :: dummy0
!MS$ ATTRIBUTES REFERENCE :: dummy2
use msfwinty
type(T_XFORM)   dummy0 
integer         dummy1 
type(T_RGNDATA) dummy2 
end function ExtCreateRegion
end interface

interface
logical(4) function  ExtFloodFill (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExtFloodFill@20' :: ExtFloodFill
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
end function ExtFloodFill
end interface

interface
logical(4) function  FillRgn (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FillRgn@12' :: FillRgn
integer dummy0 
integer dummy1 
integer dummy2 
end function FillRgn
end interface

interface
logical(4) function  MSFWIN$FloodFill (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FloodFill@16' :: MSFWIN$FloodFill
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
end function MSFWIN$FloodFill
end interface

interface
logical(4) function  FrameRgn (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FrameRgn@20' :: FrameRgn
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
end function FrameRgn
end interface

interface
integer function  GetROP2 (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetROP2@4' :: GetROP2
integer dummy0 
end function GetROP2
end interface

interface
logical(4) function  GetAspectRatioFilterEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetAspectRatioFilterEx@8' :: GetAspectRatioFilterEx
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_SIZE)    dummy1 
end function GetAspectRatioFilterEx
end interface

interface
integer function  MSFWIN$GetBkColor (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetBkColor@4' :: MSFWIN$GetBkColor
integer dummy0 
end function MSFWIN$GetBkColor
end interface

interface
integer function  GetBkMode (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetBkMode@4' :: GetBkMode
integer dummy0 
end function GetBkMode
end interface

interface
integer function  GetBitmapBits (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetBitmapBits@12' :: GetBitmapBits
integer dummy0 
integer dummy1 
integer dummy2 
end function GetBitmapBits
end interface

interface
logical(4) function  GetBitmapDimensionEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetBitmapDimensionEx@8' :: GetBitmapDimensionEx
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_SIZE)    dummy1 
end function GetBitmapDimensionEx
end interface

interface
integer function  GetBoundsRect (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetBoundsRect@12' :: GetBoundsRect
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_RECT)    dummy1 
integer         dummy2 
end function GetBoundsRect
end interface

interface
logical(4) function  GetBrushOrgEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetBrushOrgEx@8' :: GetBrushOrgEx
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_POINT)   dummy1 
end function GetBrushOrgEx
end interface

interface
logical(4) function  GetCharWidth (dummy0,dummy1,dummy2,dummy) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCharWidthA@16' :: GetCharWidth
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy 
end function GetCharWidth
end interface

interface
logical(4) function GetCharWidth32 (dummy0, dummy1, dummy2, dummy)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCharWidth32A@16' :: GetCharWidth32
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy   
end function GetCharWidth32
end interface

interface
logical(4) function  GetCharWidthFloat (dummy0,dummy1,dummy2,dummy) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCharWidthFloatA@16' :: GetCharWidthFloat
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy   
end function GetCharWidthFloat
end interface

interface
logical(4) function  GetCharABCWidths (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCharABCWidthsA@16' :: GetCharABCWidths
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer     dummy0
integer     dummy1
integer     dummy2
type(T_ABC) dummy3
end function GetCharABCWidths
end interface

interface
logical(4) function  GetCharABCWidthsFloat (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCharABCWidthsFloatA@16' :: GetCharABCWidthsFloat
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer             dummy0 
integer             dummy1 
integer             dummy2 
type(T_ABCFLOAT)    dummy3
end function GetCharABCWidthsFloat
end interface

interface
integer function  GetClipBox (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetClipBox@8' :: GetClipBox
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer     dummy0 
type(T_RECT)  dummy1 
end function GetClipBox
end interface

interface
integer function  GetClipRgn (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetClipRgn@8' :: GetClipRgn
integer dummy0 
integer dummy1 
end function GetClipRgn
end interface

interface
integer function  GetMetaRgn (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetMetaRgn@8' :: GetMetaRgn
integer dummy0 
integer dummy1 
end function GetMetaRgn
end interface

interface
integer function  GetCurrentObject (dummy0,dummy1)  
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCurrentObject@8' :: GetCurrentObject
integer dummy0 
integer dummy1 
end function GetCurrentObject
end interface

interface
logical(4) function  GetCurrentPositionEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCurrentPositionEx@8' :: GetCurrentPositionEx
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_POINT)   dummy1 
end function GetCurrentPositionEx
end interface

interface
integer function  GetDeviceCaps (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetDeviceCaps@8' :: GetDeviceCaps
integer dummy0 
integer dummy1 
end function GetDeviceCaps
end interface

interface
integer function  GetDIBits (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetDIBits@28' :: GetDIBits
!MS$ ATTRIBUTES REFERENCE :: dummy5
use msfwinty
integer             dummy0 
integer             dummy1 
integer             dummy2 
integer             dummy3 
integer             dummy4 
type(T_BITMAPINFO)  dummy5 
integer             dummy6 
end function GetDIBits
end interface

interface
integer function  GetFontData (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetFontData@20' :: GetFontData
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
end function GetFontData
end interface

interface
integer function  GetGlyphOutline (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetGlyphOutlineA@28' :: GetGlyphOutline
!MS$ ATTRIBUTES REFERENCE :: dummy3 
!MS$ ATTRIBUTES REFERENCE :: dummy6
use msfwinty 
integer                 dummy0 
integer                 dummy1 
integer                 dummy2 
type(T_GLYPHMETRICS)    dummy3 
integer                 dummy4 
integer                 dummy5 
type(T_MAT2)            dummy6 
end function GetGlyphOutline
end interface

interface
integer function  GetGraphicsMode (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetGraphicsMode@4' :: GetGraphicsMode
integer dummy0 
end function GetGraphicsMode
end interface

interface
integer function  GetMapMode (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetMapMode@4' :: GetMapMode
integer dummy0 
end function GetMapMode
end interface

interface
integer function  GetMetaFileBitsEx (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetMetaFileBitsEx@12' :: GetMetaFileBitsEx
integer dummy0 
integer dummy1 
integer dummy2 
end function GetMetaFileBitsEx
end interface

interface
integer function  GetMetaFile (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetMetaFileA@4' :: GetMetaFile
!MS$ ATTRIBUTES REFERENCE :: dummy0
character*(*)   dummy0
end function GetMetaFile
end interface

interface
integer function  GetNearestColor (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetNearestColor@8' :: GetNearestColor
integer dummy0 
integer dummy1 
end function GetNearestColor
end interface

interface
integer function  GetNearestPaletteIndex (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetNearestPaletteIndex@8' :: GetNearestPaletteIndex
integer dummy0 
integer dummy1 
end function GetNearestPaletteIndex
end interface

interface
integer function  GetObjectType (h ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetObjectType@4' :: GetObjectType
integer h 
end function GetObjectType
end interface

interface
integer function  GetOutlineTextMetrics (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetOutlineTextMetricsA@12' :: GetOutlineTextMetrics
!MS$ ATTRIBUTES REFERENCE :: dummy2 
use msfwinty
integer                     dummy0 
integer                     dummy1 
type(T_OUTLINETEXTMETRIC)   dummy2 
end function GetOutlineTextMetrics
end interface

interface
integer function  GetPaletteEntries (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPaletteEntries@16' :: GetPaletteEntries
!MS$ ATTRIBUTES REFERENCE :: dummy3 
use msfwinty
integer                 dummy0 
integer                 dummy1 
integer                 dummy2 
type(T_PALETTEENTRY)    dummy3 
end function GetPaletteEntries
end interface

interface
integer function  MSFWIN$GetPixel (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPixel@12' :: MSFWIN$GetPixel
integer dummy0 
integer dummy1 
integer dummy2 
end function MSFWIN$GetPixel
end interface

interface
integer function  GetPolyFillMode (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPolyFillMode@4' :: GetPolyFillMode
integer dummy0 
end function GetPolyFillMode
end interface

interface
logical(4) function  GetRasterizerCaps (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetRasterizerCaps@8' :: GetRasterizerCaps
!MS$ ATTRIBUTES REFERENCE :: dummy0 
use msfwinty
type(T_RASTERIZER_STATUS)   dummy0 
integer dummy1 
end function GetRasterizerCaps
end interface

interface
integer function  GetRegionData (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetRegionData@12' :: GetRegionData
!MS$ ATTRIBUTES REFERENCE :: dummy2 
use msfwinty
integer         dummy0 
integer         dummy1 
type(T_RGNDATA) dummy2 
end function GetRegionData
end interface

interface
integer function  GetRgnBox (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetRgnBox@8' :: GetRgnBox
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_RECT)    dummy1 
end function GetRgnBox
end interface

interface
integer function  GetStockObject (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetStockObject@4' :: GetStockObject
integer dummy0 
end function GetStockObject
end interface

interface
integer function  GetStretchBltMode (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetStretchBltMode@4' :: GetStretchBltMode
integer dummy0 
end function GetStretchBltMode
end interface

interface
integer function  GetSystemPaletteEntries (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSystemPaletteEntries@16' :: GetSystemPaletteEntries
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer                 dummy0 
integer                 dummy1 
integer                 dummy2 
type(T_PALETTEENTRY)    dummy3
end function GetSystemPaletteEntries
end interface

interface
integer function  GetSystemPaletteUse (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSystemPaletteUse@4' :: GetSystemPaletteUse
integer dummy0 
end function GetSystemPaletteUse
end interface

interface
integer function  GetTextCharacterExtra (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTextCharacterExtra@4' :: GetTextCharacterExtra
integer dummy0 
end function GetTextCharacterExtra
end interface

interface
integer function  GetTextAlign (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTextAlign@4' :: GetTextAlign
integer dummy0 
end function GetTextAlign
end interface

interface
integer function  MSFWIN$GetTextColor (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTextColor@4' :: MSFWIN$GetTextColor
integer dummy0 
end function MSFWIN$GetTextColor
end interface

interface
logical(4) function  GetTextExtentPoint (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTextExtentPointA@16' :: GetTextExtentPoint
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0 
character*(*)   dummy1 
integer         dummy2 
type(T_SIZE)    dummy3 
end function GetTextExtentPoint
end interface

interface
logical(4) function  GetTextExtentPoint32(dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTextExtentPoint32A@16' :: GetTextExtentPoint32
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0 
character*(*)   dummy1 
integer         dummy2 
type(T_SIZE)    dummy3 
end function GetTextExtentPoint32
end interface

interface
logical(4) function  GetTextExtentExPoint (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTextExtentExPointA@28' :: GetTextExtentExPoint
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy6
use msfwinty
integer         dummy0 
character*(*)   dummy1 
integer         dummy2 
integer         dummy3 
integer         dummy4 
integer         dummy5 
type(T_SIZE)    dummy6 
end function GetTextExtentExPoint
end interface

interface
logical(4) function  GetViewportExtEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetViewportExtEx@8' :: GetViewportExtEx
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_SIZE)    dummy1 
end function GetViewportExtEx
end interface

interface
logical(4) function  GetViewportOrgEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetViewportOrgEx@8' :: GetViewportOrgEx
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_POINT)   dummy1 
end function GetViewportOrgEx
end interface

interface
logical(4) function  GetWindowExtEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetWindowExtEx@8' :: GetWindowExtEx
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_SIZE)    dummy1 
end function GetWindowExtEx
end interface

interface
logical(4) function  GetWindowOrgEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetWindowOrgEx@8' :: GetWindowOrgEx
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_SIZE)    dummy1 
end function GetWindowOrgEx
end interface

interface
integer function  IntersectClipRect (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IntersectClipRect@20' :: IntersectClipRect
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
end function IntersectClipRect
end interface

interface
logical(4) function  InvertRgn (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InvertRgn@8' :: InvertRgn
integer dummy0 
integer dummy1 
end function InvertRgn
end interface

interface
logical(4) function  LineDDA (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LineDDA@24' :: LineDDA
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
integer dummy5 
end function LineDDA
end interface

interface
logical(4) function  MSFWIN$LineTo (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LineTo@12' :: MSFWIN$LineTo
integer dummy0 
integer dummy1 
integer dummy2 
end function MSFWIN$LineTo
end interface

interface
logical(4) function  MaskBlt (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8,dummy9,dummy10,dummy11) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MaskBlt@48' :: MaskBlt
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
integer dummy5 
integer dummy6 
integer dummy7 
integer dummy8 
integer dummy9 
integer dummy10
integer dummy11
end function MaskBlt
end interface

interface
logical(4) function  PlgBlt (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8,dummy9) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PlgBlt@40' :: PlgBlt
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_POINT)   dummy1 
integer         dummy2 
integer         dummy3 
integer         dummy4 
integer         dummy5 
integer         dummy6 
integer         dummy7 
integer         dummy8 
integer         dummy9 
end function PlgBlt
end interface

interface
integer function  OffsetClipRgn (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OffsetClipRgn@12' :: OffsetClipRgn
integer dummy0 
integer dummy1 
integer dummy2 
end function OffsetClipRgn
end interface

interface
integer function  OffsetRgn (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OffsetRgn@12' :: OffsetRgn
integer dummy0 
integer dummy1 
integer dummy2 
end function OffsetRgn
end interface

interface
logical(4) function  PatBlt (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PatBlt@24' :: PatBlt
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
integer dummy5 
end function PatBlt
end interface

interface
logical(4) function  MSFWIN$Pie (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Pie@36' :: MSFWIN$Pie
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
integer dummy5 
integer dummy6 
integer dummy7 
integer dummy8 
end function MSFWIN$Pie
end interface

interface
logical(4) function  PlayMetaFile (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PlayMetaFile@8' :: PlayMetaFile
integer dummy0 
integer dummy1 
end function PlayMetaFile
end interface            

interface
logical(4) function  PaintRgn (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PaintRgn@8' :: PaintRgn
integer dummy0 
integer dummy1 
end function PaintRgn
end interface

interface
logical(4) function  PolyPolygon (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PolyPolygon@16' :: PolyPolygon
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_POINT)   dummy1 
integer         dummy2 
integer         dummy3 
end function PolyPolygon
end interface

interface
logical(4) function  PtInRegion (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PtInRegion@12' :: PtInRegion
integer dummy0 
integer dummy1 
integer dummy2 
end function PtInRegion
end interface

interface
logical(4) function  PtVisible (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PtVisible@12' :: PtVisible
integer dummy0 
integer dummy1 
integer dummy2 
end function PtVisible
end interface

interface
logical(4) function  RectInRegion (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RectInRegion@8' :: RectInRegion
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_RECT)    dummy1 
end function RectInRegion
end interface

interface
logical(4) function  RectVisible (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RectVisible@8' :: RectVisible
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_RECT)    dummy1 
end function RectVisible
end interface

interface
logical(4) function  MSFWIN$Rectangle (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Rectangle@20' :: MSFWIN$Rectangle
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
end function MSFWIN$Rectangle
end interface

interface
logical(4) function  RestoreDC (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RestoreDC@8' :: RestoreDC
integer dummy0 
integer dummy1 
end function RestoreDC
end interface

interface
integer function  ResetDC (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ResetDCA@8' :: ResetDC
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_DEVMODE) dummy1 
end function ResetDC
end interface

interface
integer function  RealizePalette (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RealizePalette@4' :: RealizePalette
integer dummy0 
end function RealizePalette
end interface

interface
logical(4) function  RemoveFontResource (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RemoveFontResourceA@4' :: RemoveFontResource
!MS$ ATTRIBUTES REFERENCE :: dummy0
character*(*)   dummy0 
end function RemoveFontResource
end interface

interface
logical(4) function  RoundRect (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RoundRect@28' :: RoundRect
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
integer dummy5 
integer dummy6 
end function RoundRect
end interface

interface
logical(4) function  ResizePalette (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ResizePalette@8' :: ResizePalette
integer dummy0 
integer dummy1 
end function ResizePalette
end interface

interface
integer function  SaveDC (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SaveDC@4' :: SaveDC
integer dummy0 
end function SaveDC
end interface

interface
integer function  SelectClipRgn (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SelectClipRgn@8' :: SelectClipRgn
integer dummy0 
integer dummy1 
end function SelectClipRgn
end interface

interface
integer function  ExtSelectClipRgn (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExtSelectClipRgn@12' :: ExtSelectClipRgn
integer dummy0 
integer dummy1 
integer dummy2 
end function ExtSelectClipRgn
end interface

interface
integer function  SetMetaRgn (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetMetaRgn@4' :: SetMetaRgn
integer dummy0 
end function SetMetaRgn
end interface

interface
integer function  SelectObject (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SelectObject@8' :: SelectObject
integer dummy0 
integer dummy1 
end function SelectObject
end interface

interface
logical(4) function  MSFWIN$SelectPalette (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SelectPalette@12' :: MSFWIN$SelectPalette
integer dummy0 
integer dummy1 
logical dummy2 
end function MSFWIN$SelectPalette
end interface

interface
integer function  MSFWIN$SetBkColor (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetBkColor@8' :: MSFWIN$SetBkColor
integer dummy0 
integer dummy1 
end function MSFWIN$SetBkColor
end interface

interface
integer function  SetBkMode (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetBkMode@8' :: SetBkMode
integer dummy0 
integer dummy1 
end function SetBkMode
end interface              

interface
integer function  SetBitmapBits (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetBitmapBits@12' :: SetBitmapBits
integer dummy0 
integer dummy1 
integer dummy2 
end function SetBitmapBits
end interface

interface
integer function  SetBoundsRect (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetBoundsRect@12' :: SetBoundsRect
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0 
type(T_RECT)    dummy1 
integer         dummy2 
end function SetBoundsRect
end interface

interface
integer function  SetDIBits (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetDIBits@28' :: SetDIBits
!MS$ ATTRIBUTES REFERENCE :: dummy5
use msfwinty
integer             dummy0 
integer             dummy1 
integer             dummy2 
integer             dummy3 
integer             dummy4 
type(T_BITMAPINFO)  dummy5 
integer             dummy6 
end function SetDIBits
end interface

interface
integer function  SetDIBitsToDevice (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8,dummy9,dummy10,dummy11) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetDIBitsToDevice@48' :: SetDIBitsToDevice
!MS$ ATTRIBUTES REFERENCE :: dummy10
use msfwinty
integer             dummy0 
integer             dummy1 
integer             dummy2 
integer             dummy3 
integer             dummy4 
integer             dummy5 
integer             dummy6 
integer             dummy7 
integer             dummy8 
integer             dummy9 
type(T_BITMAPINFO)  dummy10 
integer             dummy11
end function SetDIBitsToDevice
end interface

interface
integer function  SetMapperFlags (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetMapperFlags@8' :: SetMapperFlags
integer dummy0 
integer dummy1 
end function SetMapperFlags
end interface

interface
integer function  SetGraphicsMode (hdc ,iMode ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetGraphicsMode@8' :: SetGraphicsMode
integer hdc 
integer iMode 
end function SetGraphicsMode
end interface

interface
integer function  SetMapMode (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetMapMode@8' :: SetMapMode
integer dummy0 
integer dummy1 
end function SetMapMode
end interface

interface
integer function  SetMetaFileBitsEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetMetaFileBitsEx@8' :: SetMetaFileBitsEx
integer dummy0 
integer dummy1 
end function SetMetaFileBitsEx
end interface

interface
integer function  SetPaletteEntries (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetPaletteEntries@16' :: SetPaletteEntries
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer             dummy0 
integer             dummy1 
integer             dummy2 
type(T_PALETTEENTRY) dummy3 
end function SetPaletteEntries
end interface

interface
integer function  MSFWIN$SetPixel (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetPixel@16' :: MSFWIN$SetPixel
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
end function MSFWIN$SetPixel
end interface

interface
logical(4) function  SetPixelV (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetPixelV@16' :: SetPixelV
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
end function SetPixelV
end interface

interface
logical(4) function SetPixelFormat (dummy0, dummy1, dummy2)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetPixelFormat@12' :: SetPixelFormat
!MS$ ATTRIBUTES REFERENCE :: dummy2
use msfwinty
integer(4)                      dummy0
integer(4)                      dummy1
type (T_PIXELFORMATDESCRIPTOR)  dummy2

end function SetPixelFormat
end interface

interface
integer function  SetPolyFillMode (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetPolyFillMode@8' :: SetPolyFillMode
integer dummy0 
integer dummy1 
end function SetPolyFillMode
end interface

interface
logical(4) function  StretchBlt (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8,dummy9,dummy10) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StretchBlt@44' :: StretchBlt
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
integer dummy5 
integer dummy6 
integer dummy7 
integer dummy8 
integer dummy9 
integer dummy10
end function StretchBlt
end interface

interface
logical(4) function  SetRectRgn (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetRectRgn@20' :: SetRectRgn
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
end function SetRectRgn
end interface

interface
integer function  StretchDIBits (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8,dummy9,dummy10,dummy11,dummy12) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StretchDIBits@52' :: StretchDIBits
!MS$ ATTRIBUTES REFERENCE :: dummy10
use msfwinty
integer             dummy0 
integer             dummy1 
integer             dummy2 
integer             dummy3 
integer             dummy4 
integer             dummy5 
integer             dummy6 
integer             dummy7 
integer             dummy8 
integer             dummy9 
type(T_BITMAPINFO)  dummy10
integer             dummy11
integer             dummy12
end function StretchDIBits
end interface

interface
integer function  SetROP2 (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_SetROP2@8' :: SetROP2
integer dummy0  
integer dummy1  
end function SetROP2
end interface

interface
integer function  SetStretchBltMode (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetStretchBltMode@8' :: SetStretchBltMode
integer dummy0 
integer dummy1 
end function SetStretchBltMode
end interface

interface
integer function  SetSystemPaletteUse (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetSystemPaletteUse@8' :: SetSystemPaletteUse
integer dummy0 
integer dummy1 
end function SetSystemPaletteUse
end interface

interface
integer function  SetTextCharacterExtra (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetTextCharacterExtra@8' :: SetTextCharacterExtra
integer dummy0 
integer dummy1 
end function SetTextCharacterExtra
end interface

interface
integer function  MSFWIN$SetTextColor (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetTextColor@8' :: MSFWIN$SetTextColor
integer dummy0 
integer dummy1 
end function MSFWIN$SetTextColor
end interface

interface
integer function  SetTextAlign (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetTextAlign@8' :: SetTextAlign
integer dummy0 
integer dummy1 
end function SetTextAlign
end interface

interface
logical(4) function  SetTextJustification (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetTextJustification@12' :: SetTextJustification
integer dummy0 
integer dummy1 
integer dummy2 
end function SetTextJustification
end interface

interface
logical(4) function  UpdateColors (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_UpdateColors@4' :: UpdateColors
integer dummy0 
end function UpdateColors
end interface

interface
logical(4) function  PlayMetaFileRecord (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PlayMetaFileRecord@16' :: PlayMetaFileRecord
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
end function PlayMetaFileRecord
end interface

interface
logical(4) function  EnumMetaFile (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumMetaFile@16' :: EnumMetaFile
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
end function EnumMetaFile
end interface
!  Enhanced Metafile Function Declarations

interface
integer function  CloseEnhMetaFile (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CloseEnhMetaFile@4' :: CloseEnhMetaFile
integer dummy0 
end function CloseEnhMetaFile
end interface

interface
integer function  CopyEnhMetaFile (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CopyEnhMetaFileA@8' :: CopyEnhMetaFile
!MS$ ATTRIBUTES REFERENCE :: dummy1
integer         dummy0 
character*(*)   dummy1 
end function CopyEnhMetaFile
end interface

interface
integer function  CreateEnhMetaFile (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateEnhMetaFileA@16' :: CreateEnhMetaFile
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy2
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0 
character*(*)   dummy1 
type(T_RECT)    dummy2 
character*(*)   dummy3 
end function CreateEnhMetaFile
end interface

interface
logical(4) function  DeleteEnhMetaFile (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteEnhMetaFile@4' :: DeleteEnhMetaFile
integer dummy0 
end function DeleteEnhMetaFile
end interface

interface
logical(4) function  EnumEnhMetaFile (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumEnhMetaFile@20' :: EnumEnhMetaFile
!MS$ ATTRIBUTES REFERENCE :: dummy4
use msfwinty
integer         dummy0 
integer         dummy1 
integer         dummy2 
integer         dummy3 
type(T_RECT)    dummy4 
end function EnumEnhMetaFile
end interface

interface
integer function  GetEnhMetaFile (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetEnhMetaFileA@4' :: GetEnhMetaFile
!MS$ ATTRIBUTES REFERENCE :: dummy0
character*(*)   dummy0 
end function GetEnhMetaFile
end interface

interface
integer function  GetEnhMetaFileBits (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetEnhMetaFileBits@12' :: GetEnhMetaFileBits
integer dummy0 
integer dummy1 
integer dummy2 
end function GetEnhMetaFileBits
end interface
 
interface
integer function  GetEnhMetaFileDescription (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetEnhMetaFileDescriptionA@12' :: GetEnhMetaFileDescription
!MS$ ATTRIBUTES REFERENCE :: dummy2
integer         dummy0 
integer         dummy1 
character*(*)   dummy2 
end function GetEnhMetaFileDescription
end interface

interface
integer function  GetEnhMetaFileHeader (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetEnhMetaFileHeader@12' :: GetEnhMetaFileHeader
!MS$ ATTRIBUTES REFERENCE :: dummy2
use msfwinty
integer                 dummy0 
integer                 dummy1 
type(T_ENHMETAHEADER)   dummy2 
end function GetEnhMetaFileHeader
end interface

interface
integer function  GetEnhMetaFilePaletteEntries (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetEnhMetaFilePaletteEntries@12' :: GetEnhMetaFilePaletteEntries
!MS$ ATTRIBUTES REFERENCE :: dummy2
use msfwinty
integer                 dummy0 
integer                 dummy1 
type(T_PALETTEENTRY)    dummy2 
end function GetEnhMetaFilePaletteEntries
end interface

interface
integer function  GetWinMetaFileBits (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetWinMetaFileBits@20' :: GetWinMetaFileBits
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
integer dummy4 
end function GetWinMetaFileBits
end interface

interface
logical(4) function  PlayEnhMetaFile (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PlayEnhMetaFile@12' :: PlayEnhMetaFile
!MS$ ATTRIBUTES REFERENCE :: dummy2
use msfwinty
integer     dummy0 
integer     dummy1 
type(T_RECT)  dummy2 
end function PlayEnhMetaFile
end interface

interface
logical(4) function  PlayEnhMetaFileRecord (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PlayEnhMetaFileRecord@16' :: PlayEnhMetaFileRecord
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
end function PlayEnhMetaFileRecord
end interface

interface
integer function  SetEnhMetaFileBits (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetEnhMetaFileBits@8' :: SetEnhMetaFileBits
integer dummy0 
integer dummy1 
end function SetEnhMetaFileBits
end interface

interface
integer function  SetWinMetaFileBits (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetWinMetaFileBits@16' :: SetWinMetaFileBits
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer                 dummy0 
integer                 dummy1 
integer                 dummy2 
type(T_METAFILEPICT)    dummy3 
end function SetWinMetaFileBits
end interface

interface
logical(4) function  GdiComment (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GdiComment@12' :: GdiComment
integer dummy0 
integer dummy1 
integer dummy2 
end function GdiComment
end interface


interface
logical(4) function  GetTextMetrics (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTextMetricsA@8' :: GetTextMetrics
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer             dummy0 
type(T_TEXTMETRIC)    dummy1 
end function GetTextMetrics
end interface

interface
logical(4) function  AngleArc (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AngleArc@24' :: AngleArc
integer dummy0 
integer dummy1 
integer dummy2 
integer dummy3 
real dummy4 
real dummy5 
end function AngleArc
end interface

interface
logical(4) function  PolyPolyline (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PolyPolyline@16' :: PolyPolyline
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_POINT)   dummy1  
integer         dummy2  
integer         dummy3  
end function PolyPolyline
end interface

interface
logical(4) function  GetWorldTransform (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetWorldTransform@8' :: GetWorldTransform
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_XFORM)   dummy1  
end function GetWorldTransform
end interface

interface
logical(4) function  SetWorldTransform (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetWorldTransform@8' :: SetWorldTransform
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_XFORM)   dummy1  
end function SetWorldTransform
end interface

interface
logical(4) function  ModifyWorldTransform (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ModifyWorldTransform@12' :: ModifyWorldTransform
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_XFORM)   dummy1  
integer         dummy2  
end function ModifyWorldTransform
end interface

interface
logical(4) function  CombineTransform (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CombineTransform@12' :: CombineTransform
!MS$ ATTRIBUTES REFERENCE :: dummy0
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy2
use msfwinty
type(T_XFORM)   dummy0  
type(T_XFORM)   dummy1  
type(T_XFORM)   dummy2  
end function CombineTransform
end interface

interface
logical(4) function  SetColorAdjustment (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetColorAdjustment@8' :: SetColorAdjustment
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer                     dummy0  
type(T_COLORADJUSTMENT)     dummy1  
end function SetColorAdjustment
end interface

interface
logical(4) function  GetColorAdjustment (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetColorAdjustment@8' :: GetColorAdjustment
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer                     dummy0  
type(T_COLORADJUSTMENT)     dummy1  
end function GetColorAdjustment
end interface

interface
integer function  CreateHalftonePalette (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateHalftonePalette@4' :: CreateHalftonePalette
integer dummy0  
end function CreateHalftonePalette
end interface

interface
integer function  StartDoc (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StartDocA@8' :: StartDoc
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_DOCINFO) dummy1  
end function StartDoc
end interface

interface
integer function  EndDoc (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EndDoc@4' :: EndDoc
integer dummy0  
end function EndDoc
end interface

interface
integer function  StartPage (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StartPage@4' :: StartPage
integer dummy0  
end function StartPage
end interface

interface
integer function  EndPage (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EndPage@4' :: EndPage
integer dummy0  
end function EndPage
end interface

interface
integer function  AbortDoc (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AbortDoc@4' :: AbortDoc
integer dummy0  
end function AbortDoc
end interface

interface
integer function  SetAbortProc (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetAbortProc@8' :: SetAbortProc
integer dummy0  
integer dummy1  
end function SetAbortProc
end interface

interface
logical(4) function  AbortPath (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AbortPath@4' :: AbortPath
integer dummy0  
end function AbortPath
end interface

interface
logical(4) function  ArcTo (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7,dummy8) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ArcTo@36' :: ArcTo
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
integer dummy4  
integer dummy5  
integer dummy6  
integer dummy7  
integer dummy8  
end function ArcTo
end interface

interface
logical (4) function  BeginPath (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BeginPath@4' :: BeginPath
integer dummy0  
end function BeginPath
end interface

interface
logical(4) function  CloseFigure (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CloseFigure@4' :: CloseFigure
integer dummy0  
end function CloseFigure
end interface

interface
logical(4) function  EndPath (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EndPath@4' :: EndPath
integer dummy0  
end function EndPath
end interface

interface
logical(4) function  FillPath (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FillPath@4' :: FillPath
integer dummy0  
end function FillPath
end interface

interface
logical(4) function  FlattenPath (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FlattenPath@4' :: FlattenPath
integer dummy0  
end function FlattenPath
end interface

interface
integer function  GetPath (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPath@16' :: GetPath
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_POINT)   dummy1  
integer         dummy2  
integer         dummy3  
end function GetPath
end interface

interface
integer function  PathToRegion (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PathToRegion@4' :: PathToRegion
integer dummy0  
end function PathToRegion
end interface

interface
logical(4) function  PolyDraw (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PolyDraw@16' :: PolyDraw
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0
type(T_POINT)   dummy1
integer         dummy2
integer         dummy3
end function PolyDraw
end interface

interface
logical(4) function  SelectClipPath (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SelectClipPath@8' :: SelectClipPath
integer dummy0  
integer dummy1  
end function SelectClipPath
end interface

interface
integer(4) function  SetArcDirection (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetArcDirection@8' :: SetArcDirection
integer dummy0  
integer dummy1  
end function SetArcDirection
end interface

interface
logical(4) function  SetMiterLimit (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetMiterLimit@12' :: SetMiterLimit
integer dummy0  
real dummy1  
integer dummy2  
end function SetMiterLimit
end interface

interface
logical(4) function  StrokeAndFillPath (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StrokeAndFillPath@4' :: StrokeAndFillPath
integer dummy0  
end function StrokeAndFillPath
end interface

interface
logical(4) function  StrokePath (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StrokePath@4' :: StrokePath
integer dummy0  
end function StrokePath
end interface

interface
logical(4) function  WidenPath (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WidenPath@4' :: WidenPath
integer dummy0  
end function WidenPath
end interface

interface
integer function  ExtCreatePen (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExtCreatePen@20' :: ExtCreatePen
!MS$ ATTRIBUTES REFERENCE :: dummy2
use msfwinty
integer             dummy0  
integer             dummy1  
type(T_LOGBRUSH)    dummy2  
integer             dummy3  
integer             dummy4  
end function ExtCreatePen
end interface

interface
logical(4) function  GetMiterLimit (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetMiterLimit@8' :: GetMiterLimit
integer dummy0  
integer dummy1  
end function GetMiterLimit
end interface

interface
integer function  GetArcDirection (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetArcDirection@4' :: GetArcDirection
integer dummy0  
end function GetArcDirection
end interface

interface
integer function  GetObject (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetObjectA@12' :: GetObject
integer dummy0  
integer dummy1  
integer dummy2  
end function GetObject
end interface

interface
logical(4) function  MoveToEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MoveToEx@16' :: MoveToEx
!MS$ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0  
integer         dummy1  
integer         dummy2  
type(T_POINT)   dummy3  
end function MoveToEx
end interface

interface
logical(4) function  TextOut (dummy0,dummy1,dummy2,dummy3,dummy4) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_TextOutA@20' :: TextOut
!MS$ATTRIBUTES REFERENCE :: dummy3
integer  dummy0  
integer  dummy1  
integer  dummy2  
character*(*) dummy3  
integer  dummy4  
end function TextOut
end interface

interface
logical(4) function  ExtTextOut (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5,dummy6,dummy7) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ExtTextOutA@32' :: ExtTextOut
!MS$ATTRIBUTES REFERENCE :: dummy4
!MS$ATTRIBUTES REFERENCE :: dummy5
use msfwinty
integer             dummy0  
integer             dummy1  
integer             dummy2  
integer             dummy3  
type(T_RECT)        dummy4  
character*(*)       dummy5  
integer             dummy6  
integer             dummy7  
end function ExtTextOut
end interface

interface
logical(4) function  PolyTextOut (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PolyTextOutA@12' :: PolyTextOut
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer             dummy0  
type(T_POLYTEXT)    dummy1  
integer             dummy2
end function PolyTextOut
end interface

interface
integer function  CreatePolygonRgn (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreatePolygonRgn@12' :: CreatePolygonRgn
!MS$ ATTRIBUTES REFERENCE :: dummy0
use msfwinty
type(T_POINT) dummy0  
integer     dummy1  
integer     dummy2  
end function CreatePolygonRgn
end interface

interface
logical(4) function  DPtoLP (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DPtoLP@12' :: DPtoLP
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer     dummy0  
type(T_POINT) dummy1  
integer     dummy2  
end function DPtoLP
end interface

interface
logical(4) function  LPtoDP (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LPtoDP@12' :: LPtoDP
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer     dummy0  
type(T_POINT) dummy1  
integer     dummy2  
end function LPtoDP
end interface

interface
logical(4) function  MSFWIN$Polygon (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Polygon@12' :: MSFWIN$Polygon
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_POINT)   dummy1  
integer         dummy2  
end function MSFWIN$Polygon
end interface

interface
logical(4) function  Polyline (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Polyline@12' :: Polyline
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_POINT)   dummy1
integer         dummy2  
end function Polyline
end interface

interface
logical(4) function  PolyBezier (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PolyBezier@12' :: PolyBezier
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_POINT)   dummy1
integer         dummy2  
end function PolyBezier
end interface

interface
logical(4) function  PolyBezierTo (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PolyBezierTo@12' :: PolyBezierTo
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_POINT)   dummy1
integer         dummy2  
end function PolyBezierTo
end interface

interface
logical(4) function  PolylineTo (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PolylineTo@12' :: PolylineTo
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_POINT)   dummy1
integer         dummy2  
end function PolylineTo
end interface

interface
logical(4) function  SetViewportExtEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetViewportExtEx@16' :: SetViewportExtEx
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
type(T_SIZE)    dummy3  
end function SetViewportExtEx
end interface

interface
logical(4) function  SetViewportOrgEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetViewportOrgEx@16' :: SetViewportOrgEx
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
type(T_POINT)   dummy3  
end function SetViewportOrgEx
end interface

interface
logical(4) function  SetWindowExtEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetWindowExtEx@16' :: SetWindowExtEx
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
type(T_SIZE)    dummy3  
end function SetWindowExtEx
end interface

interface
logical(4) function  SetWindowOrgEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetWindowOrgEx@16' :: SetWindowOrgEx
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
type(T_POINT)   dummy3  
end function SetWindowOrgEx
end interface
 
interface
logical(4) function  OffsetViewportOrgEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OffsetViewportOrgEx@16' :: OffsetViewportOrgEx
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
type(T_POINT)   dummy3  
end function OffsetViewportOrgEx
end interface

interface
logical(4) function  OffsetWindowOrgEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OffsetWindowOrgEx@16' :: OffsetWindowOrgEx
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
type(T_POINT)   dummy3  
end function OffsetWindowOrgEx
end interface

interface
logical(4) function  ScaleViewportExtEx (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ScaleViewportExtEx@24' :: ScaleViewportExtEx
!MS$ ATTRIBUTES REFERENCE :: dummy5
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
integer         dummy3 
integer         dummy4 
type(T_SIZE)    dummy5  
end function ScaleViewportExtEx
end interface

interface
logical(4) function  ScaleWindowExtEx (dummy0,dummy1,dummy2,dummy3,dummy4,dummy5) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ScaleWindowExtEx@24' :: ScaleWindowExtEx
!MS$ ATTRIBUTES REFERENCE :: dummy5
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
integer         dummy3 
integer         dummy4 
type(T_SIZE)    dummy5  
end function ScaleWindowExtEx
end interface

interface
logical(4) function  SetBitmapDimensionEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetBitmapDimensionEx@16' :: SetBitmapDimensionEx
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
type(T_SIZE)    dummy3  
end function SetBitmapDimensionEx
end interface

interface
logical(4) function  SetBrushOrgEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetBrushOrgEx@16' :: SetBrushOrgEx
!MS$ ATTRIBUTES REFERENCE :: dummy3
use msfwinty
integer         dummy0  
integer         dummy1   
integer         dummy2  
type(T_POINT)   dummy3  
end function SetBrushOrgEx
end interface

interface
integer function  GetTextFace (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetTextFaceA@12' :: GetTextFace
!MS$ ATTRIBUTES REFERENCE :: dummy2
integer         dummy0  
integer         dummy1  
character*(*)   dummy2  
end function GetTextFace
end interface

interface
integer function  GetKerningPairs (dummy0,dummy1,dummy2) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetKerningPairsA@12' :: GetKerningPairs
!MS$ ATTRIBUTES REFERENCE :: dummy2
use msfwinty
integer             dummy0  
integer             dummy1  
type(T_KERNINGPAIR) dummy2  
end function GetKerningPairs
end interface


interface
logical(4) function  GetDCOrgEx (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetDCOrgEx@8' :: GetDCOrgEx
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer         dummy0  
type(T_POINT)   dummy1  
end function GetDCOrgEx
end interface

interface
logical(4) function  FixBrushOrgEx (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FixBrushOrgEx@16' :: FixBrushOrgEx
integer dummy0  
integer dummy1  
integer dummy2  
integer dummy3  
end function FixBrushOrgEx
end interface


interface
logical(4) function  UnrealizeObject (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_UnrealizeObject@4' :: UnrealizeObject
integer dummy0  
end function UnrealizeObject
end interface

interface
logical(4) function  GdiFlush () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GdiFlush@0' :: GdiFlush
end function GdiFlush
end interface

interface
integer(4) function  GdiSetBatchLimit (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GdiSetBatchLimit@4' :: GdiSetBatchLimit
integer dummy0  
end function GdiSetBatchLimit
end interface

interface
integer(4) function  GdiGetBatchLimit (dummy0) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GdiGetBatchLimit@4' :: GdiGetBatchLimit
integer dummy0  
end function GdiGetBatchLimit
end interface

interface 
integer function fwglCreateContext (hDC)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_wglCreateContext@' :: fwglCreateContext 
integer hDC
end function fwglCreateContext 
end interface

interface 
integer function fwglDeleteContext (hDC)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_wglDeleteContext@' :: fwglDeleteContext 
integer hDC
end function fwglDeleteContext 
end interface

interface 
integer function fwglGetCurrentContext (hDC)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_wglGetCurrentContext@4' :: fwglGetCurrentContext 
integer hDC
end function fwglGetCurrentContext 
end interface

interface 
integer function fwglGetCurrentDC ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_wglGetCurrentDC@0' :: fwglGetCurrentDC 
end function fwglGetCurrentDC 
end interface

interface 
logical(4) function fwglMakeCurrent (hDC, hGLRC)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_wglMakeCurrent@8' :: fwglMakeCurrent 
integer hGLRC               
integer hDC
end function fwglMakeCurrent 
end interface

interface 
integer function fwglUseFontBitmaps (hDC, dummy1, dummy2, dummy3)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_wglUseFontBitmapsA@4' :: fwglUseFontBitmaps
integer dummy1
integer dummy2
integer dummy3
integer hDC
end function fwglUseFontBitmaps
end interface

interface
logical(4) function SwapBuffers (hDC)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SwapBuffers@4' :: SwapBuffers
integer(4)  hDC
end function SwapBuffers
end interface

!                                   ******WINUSER******

interface
integer function  LoadKeyboardLayout (pwszKLID ,Flags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LoadKeyboardLayoutA@8' :: LoadKeyboardLayout
!MS$ATTRIBUTES REFERENCE :: pwszKLID
character*(*)   pwszKLID
integer(2)      Flags
end function LoadKeyboardLayout
end interface


interface
LOGICAL(4) function  ActivateKeyboardLayout (hkl ,Flags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ActivateKeyboardLayout@8' :: ActivateKeyboardLayout
integer(2) hkl
integer(2) Flags
end function ActivateKeyboardLayout
end interface

interface
LOGICAL(4) function  UnloadKeyboardLayout (hkl ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_UnloadKeyboardLayout@4' :: UnloadKeyboardLayout
integer hkl
end function UnloadKeyboardLayout
end interface

interface
logical(4) function  GetKeyboardLayoutName (pwszKLID ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetKeyboardLayoutNameA@4' :: GetKeyboardLayoutName
!MS$ATTRIBUTES REFERENCE :: pwszKLID
character*(*)   pwszKLID
end function GetKeyboardLayoutName
end interface

interface
function  GetThreadDesktop (dummy ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetThreadDesktop@4' :: GetThreadDesktop
integer dummy
end function GetThreadDesktop
end interface


interface
integer function  GetProcessWindowStation () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetProcessWindowStation@0' :: GetProcessWindowStation
end function GetProcessWindowStation
end interface

interface
logical(4) function  SetUserObjectSecurity (hObj ,pSIRequested ,pSID ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetUserObjectSecurity@12' :: SetUserObjectSecurity
!MS$ATTRIBUTES REFERENCE :: pSID
use msfwinty
integer(2)                  hObj
integer                     pSIRequested
type(T_SECURITY_DESCRIPTOR) pSID
end function SetUserObjectSecurity
end interface

interface
logical(4) function  GetUserObjectSecurity (hObj ,pSIRequested ,pSID ,nLength ,lpnLengthNeeded ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetUserObjectSecurity@20' :: GetUserObjectSecurity
!MS$ATTRIBUTES REFERENCE :: pSID
use msfwinty
integer(2)                  hObj
integer                     pSIRequested
type(T_SECURITY_DESCRIPTOR) pSID
integer                     nLength
integer                     lpnLengthNeeded
end function GetUserObjectSecurity
end interface

interface
integer function  RegisterWindowMessage (lpString ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RegisterWindowMessageA@4' :: RegisterWindowMessage
!MS$ATTRIBUTES REFERENCE :: lpString
character*(*)   lpString
end function RegisterWindowMessage
end interface


! 
!  * Message Function Templates
!

interface
logical(4) function  GetMessage (lpMsg ,hWnd  ,wMsgFilterMin ,wMsgFilterMax ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMessageA@16' :: GetMessage
!MS$ATTRIBUTES REFERENCE :: lpMsg
use msfwinty
type (T_MSG) lpMsg
integer     hWnd 
integer     wMsgFilterMin
integer     wMsgFilterMax
end function GetMessage
end interface

! 
!  * Message Function Templates
!

interface
logical(4) function  TranslateMessage (lpMsg ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_TranslateMessage@4' :: TranslateMessage
!MS$ATTRIBUTES REFERENCE :: lpMsg
use msfwinty
type (T_MSG) lpMsg
end function TranslateMessage
end interface

interface
logical(4) function  DispatchMessage (lpMsg ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DispatchMessageA@4' :: DispatchMessage
!MS$ATTRIBUTES REFERENCE :: lpMsg
use msfwinty
type (T_MSG) lpMsg
end function DispatchMessage
end interface

interface
logical(4) function  SetMessageQueue (cMessagesMax ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetMessageQueue@4' :: SetMessageQueue
integer cMessagesMax
end function SetMessageQueue
end interface


interface
logical(4) function  PeekMessage (lpMsg ,hWnd  ,wMsgFilterMin ,wMsgFilterMax ,wRemoveMsg ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_PeekMessageA@20' :: PeekMessage
!MS$ATTRIBUTES REFERENCE :: lpMsg
use msfwinty
type(T_MSG)     lpMsg
integer         hWnd 
integer         wMsgFilterMin
integer         wMsgFilterMax
integer         wRemoveMsg
end function PeekMessage
end interface


interface
logical(4) function  RegisterHotKey (hWnd  ,id ,fsModifiers ,vk ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RegisterHotKey@16' :: RegisterHotKey
integer hWnd 
integer id
integer fsModifiers
integer vk
end function RegisterHotKey
end interface

interface
logical(4) function  UnregisterHotKey (hWnd ,id ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_UnregisterHotKey@8' :: UnregisterHotKey
integer hWnd
integer id
end function UnregisterHotKey
end interface


interface
logical(4) function  ExitWindowsEx (uFlags ,dwReserved ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ExitWindowsEx@8' :: ExitWindowsEx
integer uFlags
integer dwReserved
end function ExitWindowsEx
end interface

interface
logical(4) function  SwapMouseButton (fSwap ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SwapMouseButton@4' :: SwapMouseButton
logical(4) fSwap
end function SwapMouseButton
end interface

interface
function  GetMessagePos () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMessagePos@0' :: GetMessagePos
end function GetMessagePos
end interface

interface
integer(4) function  GetMessageTime () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMessageTime@0' :: GetMessageTime
end function GetMessageTime
end interface

interface
integer(4) function  GetMessageExtraInfo () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMessageExtraInfo@0' :: GetMessageExtraInfo
end function GetMessageExtraInfo
end interface

interface
integer*4 function  SendMessage (hWnd ,Msg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SendMessageA@16' :: SendMessage
integer hWnd
integer Msg
integer wParam
integer lParam
end function SendMessage
end interface

interface
integer(4) function  SendMessageTimeout (hWnd ,Msg ,wParam ,lParam ,fuFlags ,uTimeout ,lpdwResult ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SendMessageTimeouAt@28' :: SendMessageTimeout
integer hWnd
integer Msg
integer wParam
integer lParam
integer fuFlags
integer uTimeout
integer lpdwResult
end function SendMessageTimeout
end interface


interface
logical(4) function  SendNotifyMessage (hWnd ,Msg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SendNotifyMessageA@16' :: SendNotifyMessage
integer hWnd
integer Msg
integer wParam
integer lParam
end function SendNotifyMessage
end interface


interface
logical(4) function  SendMessageCallback (hWnd ,Msg ,wParam ,lParam ,lpResultCallBack ,dwData ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SendMessageCallbackA@24' :: SendMessageCallback
integer hWnd
integer Msg
integer wParam
integer lParam
integer lpResultCallBack
integer dwData
end function SendMessageCallback
end interface


interface
logical(4) function  PostMessage (hWnd ,Msg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_PostMessageA@16' :: PostMessage
integer hWnd
integer Msg
integer wParam
integer lParam
end function PostMessage
end interface

interface
logical(4) function  PostThreadMessage (idThread ,Msg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_PostThreadMessageA@16' :: PostThreadMessage
integer idThread
integer Msg
integer wParam
integer lParam
end function PostThreadMessage
end interface


interface
logical(4) function  AttachThreadInput (idAttach ,idAttachTo ,fAttach ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_AttachThreadInput@12' :: AttachThreadInput
integer idAttach
integer idAttachTo
integer fAttach
end function AttachThreadInput
end interface


interface
logical(4) function  ReplyMessage (lResult ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ReplyMessage@4' :: ReplyMessage
integer lResult
end function ReplyMessage
end interface

interface
logical(4) function  WaitMessage () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_WaitMessage@0' :: WaitMessage
end function WaitMessage
end interface

interface
integer(4) function  WaitForInputIdle (hProcess ,dwMilliseconds ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_WaitForInputIdle@8' :: WaitForInputIdle
integer hProcess
integer dwMilliseconds
end function WaitForInputIdle
end interface

interface
integer(4) function  DefWindowProc (hWnd ,Msg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DefWindowProcA@16' :: DefWindowProc
integer hWnd
integer Msg
integer wParam
integer lParam
end function DefWindowProc
end interface

interface
subroutine  PostQuitMessage (nExitCode ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_PostQuitMessage@4' :: PostQuitMessage
integer nExitCode
end subroutine PostQuitMessage
end interface

interface
integer(4) function  CallWindowProc (lpPrevWndFunc ,hWnd ,Msg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CallWindowProcA@20' :: CallWindowProc
integer lpPrevWndFunc
integer hWnd
integer Msg
integer wParam
integer lParam
end function CallWindowProc
end interface

interface
logical(4) function  InSendMessage () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_InSendMessage@0' :: InSendMessage
end function InSendMessage
end interface

interface
integer(4) function  GetDoubleClickTime () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDoubleClickTime@0' :: GetDoubleClickTime
end function GetDoubleClickTime
end interface

interface
logical(4) function  SetDoubleClickTime (dummy ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetDoubleClickTime@4' :: SetDoubleClickTime
integer dummy
end function SetDoubleClickTime
end interface

interface
integer(4) function  RegisterClass (lpWndClass ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RegisterClassA@4' :: RegisterClass
!MS$ATTRIBUTES REFERENCE :: lpWndClass
use msfwinty
type(T_WNDCLASS) lpWndClass
end function RegisterClass
end interface


interface
logical(4) function  UnregisterClass (lpClassName ,hInstance ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_UnregisterClassA@8' :: UnregisterClass
!MS$ATTRIBUTES REFERENCE :: lpClassName
character*(*)   lpClassName
integer         hInstance
end function UnregisterClass
end interface

interface
logical(4) function  GetClassInfo (hInstance  ,lpClassName ,lpWndClass ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClassInfoA@12' :: GetClassInfo
!MS$ATTRIBUTES REFERENCE :: lpClassName
!MS$ATTRIBUTES REFERENCE :: lpWndClass
use msfwinty
integer             hInstance 
character*(*)       lpClassName
type(T_WNDCLASS)    lpWndClass
end function GetClassInfo
end interface


interface
integer(4) function  CreateWindowEx (dwExStyle ,lpClassName ,lpWindowName, &
            dwStyle ,X ,Y ,nWidth ,nHeight ,hWndParent  ,hMenu ,hInstance ,lpParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateWindowExA@48' :: CreateWindowEx
!MS$ATTRIBUTES REFERENCE :: lpClassName
!MS$ATTRIBUTES REFERENCE :: lpWindowName
integer         dwExStyle
character*(*)   lpClassName
character*(*)   lpWindowName
integer         dwStyle
integer         X
integer         Y
integer         nWidth
integer         nHeight
integer         hWndParent 
integer         hMenu
integer         hInstance
integer         lpParam
end function CreateWindowEx
end interface

interface 
integer(4) function  CreateWindow (lpszClassName, lpszWindowName, dwStyle, &
              X ,Y ,nWidth ,nHeight ,hWndParent,hMenu ,hInstance ,lpParam )
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateWindows@44' :: CreateWindow
!MS$ATTRIBUTES REFERENCE :: lpszClassName
!MS$ATTRIBUTES REFERENCE :: lpszWindowName
character*(*)   lpszClassName
character*(*)   lpszWindowName 
integer*4       dwStyle 
integer         X 
integer         Y 
integer         nWidth 
integer         nHeight 
integer*4       hWndParent  
integer*4       hMenu 
integer*4       hInstance 
integer*4       lpParam 
end function CreateWindow
end interface



interface
logical(4) function  IsWindow (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsWindow@4' :: IsWindow
integer hWnd
end function IsWindow
end interface

interface
logical(4) function  IsMenu (hMenu ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsMenu@4' :: IsMenu
integer hMenu
end function IsMenu
end interface

interface
logical(4) function  IsChild (hWndParent ,hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsChild@8' :: IsChild
integer hWndParent
integer hWnd
end function IsChild
end interface

interface
logical(4) function  DestroyWindow (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DestroyWindow@4' :: DestroyWindow
integer hWnd
end function DestroyWindow
end interface

interface
logical(4) function  ShowWindow (hWnd ,nCmdShow ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ShowWindow@8' :: ShowWindow
integer hWnd
integer nCmdShow
end function ShowWindow
end interface

interface
logical(4) function  FlashWindow (hWnd ,bInvert ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_FlashWindow@8' :: FlashWindow
integer hWnd
logical(4) bInvert
end function FlashWindow
end interface

interface
logical(4) function  ShowOwnedPopups (hWnd ,fShow ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ShowOwnedPopups@8' :: ShowOwnedPopups
integer hWnd
integer fShow
end function ShowOwnedPopups
end interface

interface
logical(4) function  OpenIcon (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OpenIcon@4' :: OpenIcon
integer hWnd
end function OpenIcon
end interface

interface
logical(4) function  CloseWindow (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CloseWindow@4' :: CloseWindow
integer hWnd
end function CloseWindow
end interface


interface
logical(4) function  MoveWindow (hWnd ,X ,Y ,nWidth ,nHeight ,bRepaint ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_MoveWindow@24' :: MoveWindow
integer hWnd
integer X  
integer Y
integer nWidth
integer nHeight
logical(4) bRepaint
end function MoveWindow
end interface

interface
logical(4) function  SetWindowPos (hWnd ,hWndInsertAfter  ,X ,Y ,cx ,cy ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetWindowPos@28' :: SetWindowPos
integer hWnd
integer hWndInsertAfter 
integer X
integer Y
integer cx
integer cy
integer uFlags
end function SetWindowPos
end interface

interface
logical(4) function  GetWindowPlacement (hWnd ,lpwndpl ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetWindowPlacement@8' :: GetWindowPlacement
!MS$ATTRIBUTES REFERENCE :: lpwndpl
use msfwinty
integer                 hWnd
type(T_WINDOWPLACEMENT) lpwndpl
end function GetWindowPlacement
end interface

interface
logical(4) function  SetWindowPlacement (hWnd ,lpwndpl ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetWindowPlacement@8' :: SetWindowPlacement
!MS$ATTRIBUTES REFERENCE :: lpwndpl
use msfwinty
integer                 hWnd
type(T_WINDOWPLACEMENT) lpwndpl
end function SetWindowPlacement
end interface

interface
integer(4) function  BeginDeferWindowPos (nNumWindows ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_BeginDeferWindowPos@4' :: BeginDeferWindowPos
integer nNumWindows
end function BeginDeferWindowPos
end interface

interface
integer(4) function  DeferWindowPos (hWinPosInfo ,hWnd ,hWndInsertAfter  ,x ,y ,cx ,cy ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DeferWindowPos@32' :: DeferWindowPos
integer hWinPosInfo
integer hWnd
integer hWndInsertAfter 
integer x
integer y
integer cx
integer cy
integer uFlags
end function DeferWindowPos
end interface

interface
logical(4) function  EndDeferWindowPos (hWinPosInfo ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EndDeferWindowPos@4' :: EndDeferWindowPos
integer hWinPosInfo
end function EndDeferWindowPos
end interface

interface
logical(4) function  IsWindowVisible (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsWindowVisible@4' :: IsWindowVisible
integer hWnd
end function IsWindowVisible
end interface

interface
logical(4)  function  IsIconic (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsIconic@4' :: IsIconic
integer hWnd
end function IsIconic
end interface

interface
logical(4) function  AnyPopup () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_AnyPopup@0' :: AnyPopup
end function AnyPopup
end interface

interface
logical(4) function  BringWindowToTop (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_BringWindowToTop@4' :: BringWindowToTop
integer hWnd
end function BringWindowToTop
end interface

interface
logical(4) function  IsZoomed (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsZoomed@4' :: IsZoomed
integer hWnd
end function IsZoomed
end interface

interface
integer(4) function  CreateDialog (hInstance ,lpTemplateName ,hWndParent  ,lpDialogFunc ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateDialogs@16' :: CreateDialog
integer hInstance
integer lpTemplateName
integer hWndParent 
integer lpDialogFunc
end function CreateDialog
end interface


interface
integer(4) function  CreateDialogParam (hInstance ,lpTemplateName ,hWndParent  ,lpDialogFunc ,dwInitParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateDialogParamA@20' :: CreateDialogParam
integer hInstance
integer lpTemplateName
integer hWndParent 
integer lpDialogFunc
integer dwInitParam
end function CreateDialogParam
end interface

interface
integer(4) function  CreateDialogIndirectParam (hInstance ,lpTemplate ,hWndParent ,lpDialogFunc ,dwInitParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateDialogIndirectParamA@20' :: CreateDialogIndirectParam
!MS$ATTRIBUTES REFERENCE :: lpTemplate
use msfwinty
integer             hInstance
type(T_DLGTEMPLATE) lpTemplate
integer             hWndParent
integer             lpDialogFunc
integer             dwInitParam
end function CreateDialogIndirectParam
end interface

interface 
integer(4) function DialogBox (hInst, lpszTemplate, hwndOwner, dlgprc)
!MS$ATTRIBUTES STDCALL, ALIAS : '_DialogBoxs@16' :: DialogBox
integer*4   hInst 
integer*4   lpszTemplate 
integer*4   hwndOwner 
integer*4   dlgprc 
end function DialogBox
end interface


interface
integer(4) function  DialogBoxParam (hInstance ,lpTemplateName ,hWndParent  ,lpDialogFunc ,dwInitParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DialogBoxParamA@20' :: DialogBoxParam
integer hInstance
integer lpTemplateName
integer hWndParent 
integer lpDialogFunc
integer dwInitParam
end function DialogBoxParam
end interface

interface
integer(4) function  DialogBoxIndirectParam (hInstance ,hDialogTemplate ,hWndParent  ,lpDialogFunc ,dwInitParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DialogBoxIndirectParamA@20' :: DialogBoxIndirectParam
!MS$ATTRIBUTES REFERENCE :: hDialogTemplate 
use msfwinty
integer             hInstance
type(T_DLGTEMPLATE) hDialogTemplate 
integer             hWndParent 
integer             lpDialogFunc
integer             dwInitParam
end function DialogBoxIndirectParam
end interface


interface
logical(4) function  EndDialog (hDlg ,nResult ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EndDialog@8' :: EndDialog
integer hDlg
integer nResult
end function EndDialog
end interface

interface
integer(4) function  GetDlgItem (hDlg ,nIDDlgItem ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDlgItem@8' :: GetDlgItem
integer hDlg
integer nIDDlgItem
end function GetDlgItem
end interface

interface
logical(4) function  SetDlgItemInt (hDlg ,nIDDlgItem ,uValue ,bSigned ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetDlgItemInt@16' :: SetDlgItemInt
integer     hDlg
integer     nIDDlgItem
integer     uValue
logical(4)  bSigned
end function SetDlgItemInt
end interface

interface
integer(4) function  GetDlgItemInt (hDlg ,nIDDlgItem ,lpTranslated ,bSigned )
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDlgItemInt@16' :: GetDlgItemInt
integer hDlg
integer nIDDlgItem
integer(4) lpTranslated
logical(4) bSigned
end function GetDlgItemInt
end interface

interface
logical(4) function  SetDlgItemText (hDlg ,nIDDlgItem ,lpString ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetDlgItemTextA@12' :: SetDlgItemText
!MS$ATTRIBUTES REFERENCE :: lpString
integer        hDlg
integer        nIDDlgItem
character*(*)  lpString             
end function SetDlgItemText
end interface

interface
integer(4) function  GetDlgItemText (hDlg ,nIDDlgItem ,lpString ,nMaxCount ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDlgItemTextA@16' :: GetDlgItemText
!MS$ATTRIBUTES REFERENCE :: lpString
integer         hDlg
integer         nIDDlgItem
character*(*)   lpString
integer         nMaxCount
end function GetDlgItemText
end interface

interface
logical(4) function  CheckDlgButton (hDlg ,nIDButton ,uCheck ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CheckDlgButton@12' :: CheckDlgButton
integer hDlg
integer nIDButton
integer uCheck
end function CheckDlgButton
end interface

interface
logical(4) function  CheckRadioButton (hDlg ,nIDFirstButton ,nIDLastButton ,nIDCheckButton ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CheckRadioButton@16' :: CheckRadioButton
integer hDlg
integer nIDFirstButton
integer nIDLastButton
integer nIDCheckButton
end function CheckRadioButton
end interface

interface
integer(4) function  IsDlgButtonChecked (hDlg ,nIDButton )
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsDlgButtonChecked@8' :: IsDlgButtonChecked
integer hDlg
integer nIDButton
end function IsDlgButtonChecked
end interface

interface
integer(4) function  SendDlgItemMessage (hDlg ,nIDDlgItem ,Msg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SendDlgItemMessageA@20' :: SendDlgItemMessage
integer hDlg
integer nIDDlgItem
integer Msg
integer wParam
integer lParam
end function SendDlgItemMessage
end interface

interface
integer(4) function  GetNextDlgGroupItem (hDlg ,hCtl ,bPrevious )
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetNextDlgGroupItem@12' :: GetNextDlgGroupItem
integer     hDlg
integer     hCtl
logical(4)  bPrevious
end function GetNextDlgGroupItem
end interface

interface
integer(4) function  GetNextDlgTabItem (hDlg ,hCtl ,bPrevious ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetNextDlgTabItem@12' :: GetNextDlgTabItem
integer     hDlg
integer     hCtl
logical(4)  bPrevious
end function GetNextDlgTabItem
end interface

interface
integer(4) function  GetDlgCtrlID (hWnd )
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDlgCtrlID@4' :: GetDlgCtrlID
integer hWnd
end function GetDlgCtrlID
end interface

interface
integer(4) function  GetDialogBaseUnits () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDialogBaseUnits@0' :: GetDialogBaseUnits
end function GetDialogBaseUnits
end interface

interface
integer(4) function  DefDlgProc (hDlg ,Msg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DefDlgProcA@16' :: DefDlgProc
integer hDlg
integer Msg
integer wParam
integer lParam
end function DefDlgProc
end interface

interface
logical(4) function  CallMsgFilter (lpMsg ,nCode ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CallMsgFilterA@8' :: CallMsgFilter
!MS$ATTRIBUTES REFERENCE :: lpMsg
use msfwinty
type(T_MSG)     lpMsg
integer         nCode
end function CallMsgFilter
end interface

! 
!  * Clipboard Manager Functions
!

interface
logical(4) function  OpenClipboard (hWndNewOwner ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OpenClipboard@4' :: OpenClipboard
integer hWndNewOwner
end function OpenClipboard
end interface

interface
logical(4) function  CloseClipboard () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CloseClipboard@0' :: CloseClipboard
end function CloseClipboard
end interface

interface
integer(4) function  GetClipboardOwner () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClipboardOwner@0' :: GetClipboardOwner
end function GetClipboardOwner
end interface

interface
integer(4) function  SetClipboardViewer (hWndNewViewer ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetClipboardViewer@4' :: SetClipboardViewer
integer hWndNewViewer
end function SetClipboardViewer
end interface

interface
integer(4) function  GetClipboardViewer () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClipboardViewer@0' :: GetClipboardViewer
end function GetClipboardViewer
end interface

interface
logical(4) function  ChangeClipboardChain (hWndRemove ,hWndNewNext ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ChangeClipboardChain@8' :: ChangeClipboardChain
integer hWndRemove
integer hWndNewNext
end function ChangeClipboardChain
end interface

interface
integer (4) function  SetClipboardData (uFormat ,hMem ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetClipboardData@8' :: SetClipboardData
integer uFormat
integer hMem
end function SetClipboardData
end interface

interface
integer(4) function  GetClipboardData (uFormat ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClipboardData@4' :: GetClipboardData
integer uFormat
end function GetClipboardData
end interface

interface
integer(4) function  RegisterClipboardFormat (lpszFormat )
!MS$ATTRIBUTES STDCALL, ALIAS : '_RegisterClipboardFormatA@4' :: RegisterClipboardFormat
!MS$ATTRIBUTES REFERENCE :: lpszFormat
character*(*)   lpszFormat
end function RegisterClipboardFormat
end interface


interface
integer(4) function  CountClipboardFormats () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CountClipboardFormats@0' :: CountClipboardFormats
end function CountClipboardFormats
end interface


interface
integer(4) function  EnumClipboardFormats (format ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumClipboardFormats@4' :: EnumClipboardFormats
integer format
end function EnumClipboardFormats
end interface

interface
integer(4) function  GetClipboardFormatName (format ,lpszFormatName ,cchMaxCount ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClipboardFormatNameA@12' :: GetClipboardFormatName
!MS$ATTRIBUTES REFERENCE :: lpszFormatName
integer         format
character*(*)   lpszFormatName
integer         cchMaxCount
end function GetClipboardFormatName
end interface

interface
logical(4) function  EmptyClipboard () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EmptyClipboard@0' :: EmptyClipboard
end function EmptyClipboard
end interface

interface
logical(4) function  IsClipboardFormatAvailable (format ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsClipboardFormatAvailable@4' :: IsClipboardFormatAvailable
integer format
end function IsClipboardFormatAvailable
end interface

interface
integer(4) function  GetPriorityClipboardFormat (paFormatPriorityList ,cFormats ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetPriorityClipboardFormat@8' :: GetPriorityClipboardFormat
integer  paFormatPriorityList
integer cFormats
end function GetPriorityClipboardFormat
end interface

interface
integer(4) function  GetOpenClipboardWindow () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetOpenClipboardWindow@0' :: GetOpenClipboardWindow
end function GetOpenClipboardWindow
end interface

! 
!  * Character Translation Routines
!  

interface
logical(4) function  CharToOem (lpszSrc ,lpszDst ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CharToOemA@8' :: CharToOem
!MS$ATTRIBUTES REFERENCE :: lpszSrc
!MS$ATTRIBUTES REFERENCE :: lpszDst
character*(*)   lpszSrc
character*(*)   lpszDst
end function CharToOem
end interface

interface
logical(4) function  OemToChar (lpszSrc ,lpszDst ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OemToCharA@8' :: OemToChar
!MS$ATTRIBUTES REFERENCE :: lpszSrc
!MS$ATTRIBUTES REFERENCE :: lpszDst
character*(*)   lpszSrc
character*(*)   lpszDst
end function OemToChar
end interface

interface
logical(4) function  CharToOemBuff (lpszSrc ,lpszDst ,cchDstLength ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CharToOemBuffA@12' :: CharToOemBuff
!MS$ATTRIBUTES REFERENCE :: lpszSrc
!MS$ATTRIBUTES REFERENCE :: lpszDst
character*(*)   lpszSrc
character*(*)   lpszDst
integer         cchDstLength
end function CharToOemBuff
end interface

interface
logical(4) function  OemToCharBuff (lpszSrc ,lpszDst ,cchDstLength ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OemToCharBuffA@12' :: OemToCharBuff
!MS$ATTRIBUTES REFERENCE :: lpszSrc
!MS$ATTRIBUTES REFERENCE :: lpszDst
character*(*)   lpszSrc
character*(*)   lpszDst
integer         cchDstLength
end function OemToCharBuff
end interface

interface
integer(4) function  CharUpper (lpsz )
!MS$ATTRIBUTES STDCALL, ALIAS : '_CharUpperA@4' :: CharUpper
!MS$ATTRIBUTES REFERENCE :: lpsz
character*(*)   lpsz
end function CharUpper
end interface

interface
integer(4) function  CharUpperBuff (lpsz ,cchLength ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CharUpperBuffA@8' :: CharUpperBuff
!MS$ATTRIBUTES REFERENCE :: lpsz
character*(*)   lpsz
integer         cchLength
end function CharUpperBuff
end interface

interface
integer(4) function  CharLower (lpsz ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CharLowerA@4' :: CharLower
!MS$ATTRIBUTES REFERENCE :: lpsz
character*(*) lpsz
end function CharLower
end interface

interface
integer(4) function  CharLowerBuff (lpsz ,cchLength ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CharLowerBuffA@8' :: CharLowerBuff
!MS$ATTRIBUTES REFERENCE :: lpsz
character*(*)   lpsz
integer         cchLength
end function CharLowerBuff
end interface

interface
integer(4) function  CharNext (lpsz ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CharNextA@4' :: CharNext
!MS$ATTRIBUTES REFERENCE :: lpsz
character*(*)   lpsz
end function CharNext
end interface

interface
integer(4) function  CharPrev (lpszStart ,lpszCurrent ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CharPrevA@8' :: CharPrev
!MS$ATTRIBUTES REFERENCE :: lpszStart
!MS$ATTRIBUTES REFERENCE :: lpszCurrent
character*(*)   lpszStart
character*(*)   lpszCurrent
end function CharPrev
end interface


!  * Language dependent Routines
interface
logical(4) function  IsCharAlpha (ch ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsCharAlphaA@4' :: IsCharAlpha
character ch
end function IsCharAlpha
end interface


interface
logical(4) function  IsCharAlphaNumeric (ch ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsCharAlphaNumericA@4' :: IsCharAlphaNumeric
character ch
end function IsCharAlphaNumeric
end interface

interface
logical(4) function  IsCharUpper (ch ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsCharUpperA@4' :: IsCharUpper
character ch
end function IsCharUpper
end interface

interface
logical(4) function  IsCharLower (ch ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsCharLowerA@4' :: IsCharLower
character ch
end function IsCharLower
end interface

interface
integer(4) function  SetFocus (hWnd )
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetFocus@4' :: SetFocus
integer hWnd
end function SetFocus
end interface

interface
integer(4) function  GetActiveWindow () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetActiveWindow@0' :: GetActiveWindow
end function GetActiveWindow
end interface

interface
integer(4) function  GetFocus () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetFocus@0' :: GetFocus
end function GetFocus
end interface

interface
integer(4) function  GetKBCodePage () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetKBCodePage@0' :: GetKBCodePage
end function GetKBCodePage
end interface

interface
integer(2) function  GetKeyState (nVirtKey ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetKeyState@4' :: GetKeyState
integer nVirtKey
end function GetKeyState
end interface

interface
integer(2) function  GetAsyncKeyState (vKey ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetAsyncKeyState@4' :: GetAsyncKeyState
integer vKey
end function GetAsyncKeyState
end interface

interface
logical(4) function  GetKeyboardState (lpKeyState ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetKeyboardState@4' :: GetKeyboardState
integer lpKeyState
end function GetKeyboardState
end interface

interface
logical(4) function  SetKeyboardState (lpKeyState ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetKeyboardState@4' :: SetKeyboardState
integer lpKeyState
end function SetKeyboardState
end interface

interface
integer(4) function  GetKeyNameText (lParam ,lpString ,nSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetKeyNameTextA@12' :: GetKeyNameText
!MS$ATTRIBUTES REFERENCE :: lpString
integer         lParam
character*(*)   lpString
integer         nSize   
end function GetKeyNameText
end interface

interface
integer(4) function  GetKeyboardType (nTypeFlag ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetKeyboardType@4' :: GetKeyboardType
integer nTypeFlag
end function GetKeyboardType
end interface

interface
integer(4) function  ToAscii (uVirtKey ,uScanCode ,lpKeyState ,lpChar ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ToAscii@20' :: ToAscii
integer uVirtKey
integer uScanCode
integer lpKeyState
integer lpChar
integer uFlags
end function ToAscii
end interface

interface
integer(4) function  OemKeyScan (wOemChar ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OemKeyScan@4' :: OemKeyScan
integer*2 wOemChar
end function OemKeyScan
end interface

interface
integer(2) function  VkKeyScan (ch ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_VkKeyScanA@4' :: VkKeyScan
character ch
end function VkKeyScan
end interface

interface
subroutine  keybd_event (bVk ,bScan ,dwFlags ,dwExtraInfo ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_keybd_event@16' :: keybd_event
BYTE    bVk
BYTE    bScan
integer dwFlags
integer dwExtraInfo
end subroutine keybd_event
end interface

interface
subroutine  msfwin$mouse_event (dwFlags ,dx ,dy ,cButtons ,dwExtraInfo ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mouse_event@20' :: msfwin$mouse_event
integer dwFlags
integer dx
integer dy
integer cButtons
integer dwExtraInfo
end subroutine msfwin$mouse_event
end interface

interface
integer(4) function  MapVirtualKey (uCode ,uMapType ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_MapVirtualKeyA@8' :: MapVirtualKey
integer uCode
integer uMapType
end function MapVirtualKey
end interface

interface
logical(4) function  GetInputState () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetInputState@0' :: GetInputState
end function GetInputState
end interface

interface
integer(4) function  GetQueueStatus (flags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetQueueStatus@4' :: GetQueueStatus
integer flags
end function GetQueueStatus
end interface

interface
integer(4) function  GetCapture () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetCapture@0' :: GetCapture
end function GetCapture
end interface

interface
integer(4) function  SetCapture (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetCapture@4' :: SetCapture
integer hWnd
end function SetCapture
end interface

interface
logical(4) function  ReleaseCapture () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ReleaseCapture@0' :: ReleaseCapture
end function ReleaseCapture
end interface

interface
integer(4) function  MsgWaitForMultipleObjects (nCount ,pHandles ,fWaitAll ,dwMilliseconds ,dwWakeMask ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_MsgWaitForMultipleObjects@20' :: MsgWaitForMultipleObjects
integer     nCount
integer     pHandles
logical(4)  fWaitAll
integer     dwMilliseconds
integer     dwWakeMask
end function MsgWaitForMultipleObjects
end interface


! 
!  * Windows Functions
!  

interface
integer(4) function  SetTimer (hWnd  ,nIDEvent ,uElapse ,lpTimerFunc, flag ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_FSetTimer@20' :: SetTimer
integer hWnd 
integer nIDEvent
integer uElapse
integer lpTimerFunc
integer flag
end function SetTimer
end interface

interface
logical(4) function  KillTimer (hWnd ,uIDEvent ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_KillTimer@8' :: KillTimer
integer hWnd
integer uIDEvent
end function KillTimer
end interface

interface
logical(4) function  IsWindowUnicode (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsWindowUnicode@4' :: IsWindowUnicode
integer hWnd
end function IsWindowUnicode
end interface

interface
logical(4) function  EnableWindow (hWnd ,bEnable ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnableWindow@8' :: EnableWindow
integer     hWnd
logical(4)  bEnable
end function EnableWindow
end interface

interface
logical(4) function  IsWindowEnabled (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsWindowEnabled@4' :: IsWindowEnabled
integer hWnd
end function IsWindowEnabled
end interface

interface
integer(4) function  LoadAccelerators (hInstance ,lpTableName ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LoadAcceleratorsA@8' :: LoadAccelerators
integer         hInstance
integer         lpTableName
end function LoadAccelerators
end interface


interface
integer(4) function  CreateAcceleratorTable (dummy ,dummy1 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateAcceleratorTableA@8' :: CreateAcceleratorTable
!MS$ATTRIBUTES REFERENCE :: dummy
use msfwinty
type(T_ACCEL)   dummy
integer         dummy1
end function CreateAcceleratorTable
end interface

interface
logical(4) function  DestroyAcceleratorTable (hAccel ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DestroyAcceleratorTable@4' :: DestroyAcceleratorTable
integer hAccel
end function DestroyAcceleratorTable
end interface

interface
integer(4) function  CopyAcceleratorTable (hAccelSrc ,lpAccelDst ,cAccelEntries ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CopyAcceleratorTableA@12' :: CopyAcceleratorTable
!MS$ATTRIBUTES REFERENCE :: lpAccelDst
use msfwinty
integer         hAccelSrc
type(T_ACCEL)   lpAccelDst
integer         cAccelEntries
end function CopyAcceleratorTable
end interface

interface
integer(4) function  TranslateAccelerator (hWnd ,hAccTable ,lpMsg ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_TranslateAccelerator@12' :: TranslateAccelerator
!MS$ATTRIBUTES REFERENCE :: lpMsg 
use msfwinty
integer     hWnd
integer     hAccTable
type(T_MSG) lpMsg
end function TranslateAccelerator
end interface

interface
integer(4) function  GetSystemMetrics (nIndex ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetSystemMetrics@4' :: GetSystemMetrics
integer nIndex
end function GetSystemMetrics
end interface

interface
integer(4) function  LoadMenu (hInstance ,lpMenuName ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LoadMenuA@8' :: LoadMenu
integer hInstance
integer lpMenuName
end function LoadMenu
end interface

interface
integer(4) function  LoadMenuIndirect (lpMenuTemplate ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LoadMenuIndirectA@4' :: LoadMenuIndirect
integer lpMenuTemplate
end function LoadMenuIndirect
end interface

interface
integer(4) function  GetMenu (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMenu@4' :: GetMenu
integer hWnd
end function GetMenu
end interface

interface
logical(4) function  SetMenu (hWnd ,hMenu ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetMenu@8' :: SetMenu
integer hWnd
integer hMenu
end function SetMenu
end interface

interface
logical(4) function  ChangeMenu (hMenu ,cmd ,lpszNewItem ,cmdInsert ,flags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ChangeMenuA@20' :: ChangeMenu
integer hMenu
integer cmd
integer lpszNewItem
integer cmdInsert
integer flags
end function ChangeMenu
end interface

interface
logical(4) function  HiliteMenuItem (hWnd ,hMenu ,uIDHiliteItem ,uHilite ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_HiliteMenuItem@16' :: HiliteMenuItem
integer hWnd
integer hMenu
integer uIDHiliteItem
integer uHilite
end function HiliteMenuItem
end interface

interface
integer(4) function  GetMenuString (hMenu ,uIDItem ,lpString ,nMaxCount ,uFlag ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMenuStringA@20' :: GetMenuString
!MS$ATTRIBUTES REFERENCE :: lpString
integer         hMenu
integer         uIDItem 
character*(*)   lpString
integer         nMaxCount
integer         uFlag
end function GetMenuString
end interface


interface
integer(4) function  GetMenuState (hMenu ,uId ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMenuState@12' :: GetMenuState
integer hMenu
integer uId
integer uFlags
end function GetMenuState
end interface

interface
logical(4) function  DrawMenuBar (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DrawMenuBar@4' :: DrawMenuBar
integer hWnd
end function DrawMenuBar
end interface

interface
integer(4) function  GetSystemMenu (hWnd ,bRevert ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetSystemMenu@8' :: GetSystemMenu
integer     hWnd
logical(4)  bRevert
end function GetSystemMenu
end interface

interface
integer(4) function  CreateMenu () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateMenu@0' :: CreateMenu
end function CreateMenu
end interface

interface
integer(4) function  CreatePopupMenu () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreatePopupMenu@0' :: CreatePopupMenu
end function CreatePopupMenu
end interface

interface
logical(4) function  DestroyMenu (hMenu ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DestroyMenu@4' :: DestroyMenu
integer hMenu
end function DestroyMenu
end interface

interface
integer(4) function  CheckMenuItem (hMenu ,uIDCheckItem ,uCheck ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CheckMenuItem@12' :: CheckMenuItem
integer hMenu
integer uIDCheckItem
integer uCheck
end function CheckMenuItem
end interface

interface
logical(4) function  EnableMenuItem (hMenu ,uIDEnableItem ,uEnable ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnableMenuItem@12' :: EnableMenuItem
integer hMenu
integer uIDEnableItem
integer uEnable
end function EnableMenuItem
end interface

interface
integer(4) function  GetSubMenu (hMenu ,nPos ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetSubMenu@8' :: GetSubMenu
integer hMenu
integer nPos
end function GetSubMenu
end interface

interface
integer(4) function  GetMenuItemID (hMenu ,nPos ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMenuItemID@8' :: GetMenuItemID
integer hMenu
integer nPos
end function GetMenuItemID
end interface

interface
integer(4) function  GetMenuItemCount (hMenu ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMenuItemCount@4' :: GetMenuItemCount
integer hMenu
end function GetMenuItemCount
end interface

interface
logical(4) function  InsertMenu (hMenu ,uPosition ,uFlags ,uIDNewItem ,lpNewItem ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_InsertMenuA@20' :: InsertMenu
integer         hMenu
integer         uPosition
integer         uFlags
integer         uIDNewItem
integer         lpNewItem   
end function InsertMenu
end interface

interface
logical(4) function  AppendMenu (hMenu ,uFlags ,uIDNewItem ,lpNewItem ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_AppendMenuA@16' :: AppendMenu
integer         hMenu
integer         uFlags
integer         uIDNewItem
integer         lpNewItem   
end function AppendMenu
end interface

interface
logical(4) function  ModifyMenu (hMnu ,uPosition ,uFlags ,uIDNewItem ,lpNewItem ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ModifyMenuA@20' :: ModifyMenu
integer         hMnu
integer         uPosition
integer         uFlags
integer         uIDNewItem
integer         lpNewItem   
end function ModifyMenu
end interface

interface
logical(4) function  RemoveMenu (hMenu ,uPosition ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RemoveMenu@12' :: RemoveMenu
integer hMenu
integer uPosition
integer uFlags
end function RemoveMenu
end interface

interface
logical(4) function  DeleteMenu (hMenu ,uPosition ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DeleteMenu@12' :: DeleteMenu
integer hMenu
integer uPosition
integer uFlags
end function DeleteMenu
end interface

interface
logical(4) function  SetMenuItemBitmaps (hMenu ,uPosition ,uFlags ,hBitmapUnchecked ,hBitmapChecked ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetMenuItemBitmaps@20' :: SetMenuItemBitmaps
integer hMenu
integer uPosition
integer uFlags
integer hBitmapUnchecked
integer hBitmapChecked
end function SetMenuItemBitmaps
end interface

interface
integer(4) function  GetMenuCheckMarkDimensions () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetMenuCheckMarkDimensions@0' :: GetMenuCheckMarkDimensions
end function GetMenuCheckMarkDimensions
end interface

interface
logical(4) function  TrackPopupMenu (hMenu ,uFlags ,x ,y ,nReserved ,hWnd ,prcRect ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_TrackPopupMenu@28' :: TrackPopupMenu
!MS$ATTRIBUTES REFERENCE :: prcRect
use msfwinty
integer         hMenu
integer         uFlags
integer         x
integer         y
integer         nReserved
integer         hWnd
type(T_RECT)    prcRect
end function TrackPopupMenu
end interface

interface
logical(4) function  DrawIcon (hDC ,X ,Y ,hIcon ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DrawIcon@16' :: DrawIcon
integer hDC
integer X
integer Y
integer hIcon
end function DrawIcon
end interface

interface
integer(4) function  DrawText (hDC ,lpString ,nCount ,lpRect ,uFormat ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DrawTextA@20' :: DrawText
!MS$ATTRIBUTES REFERENCE :: lpString
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
integer         hDC
character*(*)   lpString
integer         nCount
type(T_RECT)    lpRect
integer         uFormat
end function DrawText
end interface


interface
logical(4) function  GrayString (hDC ,hBrush ,lpOutputFunc ,lpData ,nCount ,X ,Y ,nWidth ,nHeight ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GrayStringA@36' :: GrayString
integer hDC
integer hBrush
integer lpOutputFunc
integer lpData
integer nCount
integer X
integer Y
integer nWidth
integer nHeight
end function GrayString
end interface

interface
integer(4) function  TabbedTextOut (hDC ,X ,Y ,lpString ,nCount ,nTabPositions ,lpnTabStopPositions ,nTabOrigin ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_TabbedTextOutA@36' :: TabbedTextOut
!MS$ATTRIBUTES REFERENCE :: lpString
integer         hDC
integer         X
integer         Y
character*(*)   lpString
integer         nCount
integer         nTabPositions
integer         lpnTabStopPositions
integer         nTabOrigin
end function TabbedTextOut
end interface

interface
integer(4) function  GetTabbedTextExtent (hDC ,lpString ,nCount ,nTabPositions ,lpnTabStopPositions ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetTabbedTextExtentA@24' :: GetTabbedTextExtent
!MS$ATTRIBUTES REFERENCE :: lpString
integer         hDC
character*(*)   lpString
integer         nCount
integer         nTabPositions
integer         lpnTabStopPositions
end function GetTabbedTextExtent
end interface

interface
logical(4) function  UpdateWindow (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_UpdateWindow@4' :: UpdateWindow
integer hWnd
end function UpdateWindow
end interface

interface
integer(4) function  SetActiveWindow (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetActiveWindow@4' :: SetActiveWindow
integer hWnd
end function SetActiveWindow
end interface

interface
integer(4) function  GetForegroundWindow () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetForegroundWindow@0' :: GetForegroundWindow
end function GetForegroundWindow
end interface

interface
logical(4) function  SetForegroundWindow (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetForegroundWindow@4' :: SetForegroundWindow
integer hWnd
end function SetForegroundWindow
end interface

interface
integer(4) function  WindowFromDC (hDC ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_WindowFromDC@4' :: WindowFromDC
integer hDC
end function WindowFromDC
end interface

interface
integer(4) function  GetDC (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDC@4' :: GetDC
integer hWnd
end function GetDC
end interface

interface
integer(4) function  GetDCEx (hWnd  ,hrgnClip ,flags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDCEx@12' :: GetDCEx
integer hWnd 
integer hrgnClip
integer flags
end function GetDCEx
end interface

interface
integer(4) function  GetWindowDC (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetWindowDC@4' :: GetWindowDC
integer hWnd
end function GetWindowDC
end interface

interface
integer(4) function  ReleaseDC (hWnd ,hDC ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ReleaseDC@8' :: ReleaseDC
integer hWnd
integer hDC
end function ReleaseDC
end interface

interface
integer(4) function  BeginPaint (hWnd ,lpPaint ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_BeginPaint@8' :: BeginPaint
!MS$ATTRIBUTES REFERENCE :: lpPaint
use msfwinty
integer                 hWnd
type (T_PAINTSTRUCT)    lpPaint

end function BeginPaint
end interface

interface
logical(4) function  EndPaint (hWnd ,lpPaint ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EndPaint@8' :: EndPaint
!MS$ATTRIBUTES REFERENCE :: lpPaint
use msfwinty
integer                 hWnd
type (T_PAINTSTRUCT)    lpPaint
end function EndPaint
end interface

interface
logical(4) function  GetUpdateRect (hWnd ,lpRect ,bErase ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetUpdateRect@12' :: GetUpdateRect
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
integer         hWnd
type(T_RECT)    lpRect
logical(4)      bErase
end function GetUpdateRect
end interface

interface
integer(4) function  GetUpdateRgn (hWnd ,hRgn ,bErase ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetUpdateRgn@12' :: GetUpdateRgn
integer     hWnd
integer     hRgn
logical(4)  bErase
end function GetUpdateRgn
end interface

interface
integer(4) function  ExcludeUpdateRgn (hDC ,hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ExcludeUpdateRgn@8' :: ExcludeUpdateRgn
integer hDC
integer hWnd
end function ExcludeUpdateRgn
end interface

interface
logical(4) function  InvalidateRect (hWnd  ,lpRect ,bErase ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_InvalidateRect@12' :: InvalidateRect
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
integer         hWnd 
type(T_RECT)    lpRect
logical(4)      bErase
end function InvalidateRect
end interface

interface
logical(4) function  ValidateRect (hWnd  ,lpRect ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ValidateRect@8' :: ValidateRect
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
integer         hWnd 
type(T_RECT)    lpRect
end function ValidateRect
end interface

interface
logical(4) function  InvalidateRgn (hWnd ,hRgn ,bErase ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_InvalidateRgn@12' :: InvalidateRgn
integer     hWnd
integer     hRgn
logical(4)  bErase
end function InvalidateRgn
end interface

interface
logical(4) function  ValidateRgn (hWnd ,hRgn ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ValidateRgn@8' :: ValidateRgn
integer hWnd
integer hRgn
end function ValidateRgn
end interface

interface
logical(4) function  RedrawWindow (hWnd ,lprcUpdate ,hrgnUpdate ,flags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RedrawWindow@16' :: RedrawWindow
!MS$ATTRIBUTES REFERENCE :: lprcUpdate
use msfwinty
integer         hWnd 
type(T_RECT)    lprcUpdate
integer         hrgnUpdate
integer         flags       
end function RedrawWindow
end interface


! 
!  * LockWindowUpdate API
!
interface
logical(4) function  LockWindowUpdate (hWndLock ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LockWindowUpdate@4' :: LockWindowUpdate
integer hWndLock
end function LockWindowUpdate
end interface

interface
logical(4) function  ScrollWindow (hWnd ,XAmount ,YAmount ,lpRect ,lpClipRect ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ScrollWindow@20' :: ScrollWindow
!MS$ATTRIBUTES REFERENCE :: lpRect
!MS$ATTRIBUTES REFERENCE :: lpClipRect
use msfwinty
integer         hWnd
integer         XAmount
integer         YAmount
type(T_RECT)    lpRect
type(T_RECT)    lpClipRect
end function ScrollWindow
end interface

interface
logical(4) function  ScrollDC (hDC ,dx ,dy ,lprcScroll ,lprcClip  ,hrgnUpdate ,lprcUpdate ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ScrollDC@28' :: ScrollDC
!MS$ATTRIBUTES REFERENCE :: lprcScroll
!MS$ATTRIBUTES REFERENCE :: lprcClip
!MS$ATTRIBUTES REFERENCE :: lprcUpdate
use msfwinty
integer         hDC
integer         dx
integer         dy      
type(T_RECT)    lprcScroll
type(T_RECT)    lprcClip 
integer         hrgnUpdate
type(T_RECT)    lprcUpdate
end function ScrollDC
end interface

interface
integer(4) function  ScrollWindowEx (hWnd ,dx ,dy ,prcScroll ,prcClip  ,hrgnUpdate ,prcUpdate ,flags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ScrollWindowEx@32' :: ScrollWindowEx
!MS$ATTRIBUTES REFERENCE :: prcScroll
!MS$ATTRIBUTES REFERENCE :: prcClip
!MS$ATTRIBUTES REFERENCE :: prcUpdate
use msfwinty
integer         hWnd
integer         dx
integer         dy
type(T_RECT)    prcScroll
type(T_RECT)    prcClip 
integer         hrgnUpdate
type(T_RECT)    prcUpdate
integer         flags
end function ScrollWindowEx
end interface

interface
integer(4) function  SetScrollPos (hWnd ,nBar ,nPos ,bRedraw ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetScrollPos@16' :: SetScrollPos
integer     hWnd
integer     nBar
integer     nPos
logical(4)  bRedraw
end function SetScrollPos
end interface

interface
integer(4) function  GetScrollPos (hWnd ,nBar ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetScrollPos@8' :: GetScrollPos
integer hWnd
integer nBar
end function GetScrollPos
end interface

interface
logical(4) function  SetScrollRange (hWnd ,nBar ,nMinPos ,nMaxPos ,bRedraw ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetScrollRange@20' :: SetScrollRange
integer     hWnd
integer     nBar
integer     nMinPos
integer     nMaxPos
logical(4)  bRedraw
end function SetScrollRange
end interface

interface
logical(4) function  GetScrollRange (hWnd ,nBar ,lpMinPos ,lpMaxPos ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetScrollRange@16' :: GetScrollRange
integer hWnd
integer nBar
integer lpMinPos
integer lpMaxPos
end function GetScrollRange
end interface

interface
logical(4) function  ShowScrollBar (hWnd ,wBar ,bShow ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ShowScrollBar@12' :: ShowScrollBar
integer     hWnd
integer     wBar
logical(4)  bShow
end function ShowScrollBar
end interface

interface
logical(4) function  EnableScrollBar (hWnd ,wSBflags ,wArrows ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnableScrollBar@12' :: EnableScrollBar
integer hWnd
integer wSBflags
integer wArrows
end function EnableScrollBar
end interface

interface
logical(4) function  SetProp (hWnd ,lpString ,hData ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetPropA@12' :: SetProp
!MS$ATTRIBUTES REFERENCE :: lpString
integer         hWnd
character*(*)   lpString
integer         hData
end function SetProp
end interface

interface
integer(4) function  GetProp (hWnd ,lpString ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetPropA@8' :: GetProp
!MS$ATTRIBUTES REFERENCE :: lpString
integer         hWnd
character*(*)   lpString
end function GetProp
end interface

interface
integer(4) function  RemoveProp (hWnd ,lpString ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RemovePropA@8' :: RemoveProp
!MS$ATTRIBUTES REFERENCE :: lpString
integer         hWnd
character*(*)   lpString
end function RemoveProp
end interface

interface
integer(4) function  EnumPropsEx (hWnd ,lpEnumFunc ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumPropsExA@12' :: EnumPropsEx
integer hWnd
integer lpEnumFunc
integer lParam
end function EnumPropsEx
end interface

interface
integer(4) function  EnumProps (hWnd ,lpEnumFunc ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumPropsA@8' :: EnumProps
integer hWnd
integer lpEnumFunc
end function EnumProps
end interface

interface
logical(4) function  SetWindowText (hWnd ,lpString ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetWindowTextA@8' :: SetWindowText
!MS$ATTRIBUTES REFERENCE :: lpString 
integer         hWnd
character*(*)   lpString
end function SetWindowText
end interface

interface
integer(4) function  GetWindowText (hWnd ,lpString ,nMaxCount ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetWindowTextA@12' :: GetWindowText
!MS$ATTRIBUTES REFERENCE :: lpString 
integer         hWnd
character*(*)   lpString
integer         nMaxCount
end function GetWindowText
end interface

interface
integer(4) function  GetWindowTextLength (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetWindowTextLengthA@4' :: GetWindowTextLength
integer hWnd
end function GetWindowTextLength
end interface

interface
logical(4) function  GetClientRect (hWnd ,lpRect ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClientRect@8' :: GetClientRect
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
integer         hWnd
type (T_RECT)   lpRect
end function GetClientRect
end interface

interface
logical(4) function  GetWindowRect (hWnd ,lpRect ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetWindowRect@8' :: GetWindowRect
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
integer         hWnd
type (T_RECT)   lpRect
end function GetWindowRect
end interface

interface
logical(4) function  AdjustWindowRect (lpRect ,dwStyle ,bMenu ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_AdjustWindowRect@12' :: AdjustWindowRect
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
type (T_RECT)   lpRect
integer         dwStyle
logical(4)      bMenu
end function AdjustWindowRect
end interface

interface
logical(4) function  AdjustWindowRectEx (lpRect ,dwStyle ,bMenu ,dwExStyle ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_AdjustWindowRectEx@16' :: AdjustWindowRectEx
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
type (T_RECT)   lpRect
integer         dwStyle
logical(4)      bMenu
integer         dwExStyle
end function AdjustWindowRectEx
end interface

interface
integer(4) function  MessageBox (hWnd  ,lpText ,lpCaption  ,uType ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_MessageBoxA@16' :: MessageBox
!MS$ATTRIBUTES REFERENCE :: lpText
!MS$ATTRIBUTES REFERENCE :: lpCaption
integer         hWnd
character*(*)   lpText
character*(*)   lpCaption 
integer         uType
end function MessageBox
end interface

interface
integer(4) function  MessageBoxEx (hWnd  ,lpText ,lpCaption  ,uType ,wLanguageId) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_MessageBoxExA@20' :: MessageBoxEx
!MS$ATTRIBUTES REFERENCE :: lpText
!MS$ATTRIBUTES REFERENCE :: lpCaption
integer         hWnd
character*(*)   lpText
character*(*)   lpCaption 
integer         uType
integer*2       wLanguageId
end function MessageBoxEx
end interface

interface
logical(4) function  MessageBeep (uType ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_MessageBeep@4' :: MessageBeep
integer uType
end function MessageBeep
end interface

interface
integer(4) function  ShowCursor (bShow ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ShowCursor@4' :: ShowCursor
logical(4) bShow
end function ShowCursor
end interface

interface
logical(4) function  SetCursorPos (X ,Y ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetCursorPos@8' :: SetCursorPos
integer X
integer Y
end function SetCursorPos
end interface

interface
integer(4) function  SetCursor (hCursor ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetCursor@4' :: SetCursor
integer hCursor
end function SetCursor
end interface

interface
logical(4) function  GetCursorPos (lpPoint ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetCursorPos@4' :: GetCursorPos
!MS$ATTRIBUTES REFERENCE :: lpPoint
use msfwinty
type(T_POINT) lpPoint
end function GetCursorPos
end interface

interface
logical(4) function  ClipCursor (lpRect ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ClipCursor@4' :: ClipCursor
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
type(T_RECT) lpRect
end function ClipCursor
end interface

interface
logical(4) function  GetClipCursor (lpRect ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClipCursor@4' :: GetClipCursor
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
type(T_RECT) lpRect
end function GetClipCursor
end interface

interface
integer(4) function  GetCursor () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetCursor@0' :: GetCursor
end function GetCursor
end interface

interface
logical(4) function  CreateCaret (hWnd ,hBitmap  ,nWidth ,nHeight ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateCaret@16' :: CreateCaret
integer hWnd
integer hBitmap 
integer nWidth
integer nHeight
end function CreateCaret
end interface

interface
integer(4) function  GetCaretBlinkTime () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetCaretBlinkTime@0' :: GetCaretBlinkTime
end function GetCaretBlinkTime
end interface

interface
logical(4) function  SetCaretBlinkTime (uMSeconds ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetCaretBlinkTime@4' :: SetCaretBlinkTime
integer uMSeconds
end function SetCaretBlinkTime
end interface

interface
logical(4) function  DestroyCaret () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DestroyCaret@0' :: DestroyCaret
end function DestroyCaret
end interface

interface
logical(4) function  HideCaret (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_HideCaret@4' :: HideCaret
integer hWnd
end function HideCaret
end interface

interface
logical(4) function  ShowCaret (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ShowCaret@4' :: ShowCaret
integer hWnd
end function ShowCaret
end interface

interface
logical(4) function  SetCaretPos (X ,Y ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetCaretPos@8' :: SetCaretPos
integer X
integer Y
end function SetCaretPos
end interface

interface
logical(4) function  GetCaretPos (lpPoint ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetCaretPos@4' :: GetCaretPos
!MS$ATTRIBUTES REFERENCE :: lpPoint
use msfwinty
type(T_POINT)   lpPoint
end function GetCaretPos
end interface

interface
logical(4) function  ClientToScreen (hWnd ,lpPoint ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ClientToScreen@8' :: ClientToScreen
!MS$ATTRIBUTES REFERENCE :: lpPoint
use msfwinty
integer         hWnd
type(T_POINT)   lpPoint
end function ClientToScreen
end interface

interface
logical(4) function  ScreenToClient (hWnd ,lpPoint ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ScreenToClient@8' :: ScreenToClient
!MS$ATTRIBUTES REFERENCE :: lpPoint
use msfwinty
integer         hWnd
type(T_POINT)   lpPoint
end function ScreenToClient
end interface

interface
integer(4) function  MapWindowPoints (hWndFrom ,hWndTo ,lpPoints ,cPoints ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_MapWindowPoints@16' :: MapWindowPoints
!MS$ATTRIBUTES REFERENCE :: lpPoints
use msfwinty
integer         hWndFrom
integer         hWndTo
type(T_POINT)   lpPoints
integer         cPoints
end function MapWindowPoints
end interface

interface
integer(4) function  WindowFromPoint (Pt ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_WindowFromPoint@4' :: WindowFromPoint
use msfwinty
type (T_POINT) Pt
end function WindowFromPoint
end interface

interface
integer(4) function  ChildWindowFromPoint (hWndParent ,Pt ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ChildWindowFromPoint@8' :: ChildWindowFromPoint
use msfwinty
integer         hWndParent
type (T_POINT)  Pt
end function ChildWindowFromPoint
end interface


interface
integer(4) function  GetSysColor (nIndex ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetSysColor@4' :: GetSysColor
integer nIndex
end function GetSysColor
end interface

interface
logical(4) function  SetSysColors (cElements ,lpaElements ,lpaRgbValues ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetSysColors@12' :: SetSysColors
integer     cElements
integer     lpaElements
integer     lpaRgbValues
end function SetSysColors
end interface

interface
logical(4) function  DrawFocusRect (hDC ,lprc ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DrawFocusRect@8' :: DrawFocusRect
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
integer         hDC
type(T_RECT)    lprc
end function DrawFocusRect
end interface

interface
integer(4) function  FillRect (hDC ,lprc ,hbr ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_FillRect@12' :: FillRect
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
integer         hDC
type(T_RECT)    lprc
integer         hbr
end function FillRect
end interface

interface
integer function  FrameRect (hDC ,lprc ,hbr ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_FrameRect@12' :: FrameRect
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
integer         hDC
type(T_RECT)    lprc
integer         hbr
end function FrameRect
end interface

interface
logical(4) function  InvertRect (hDC ,lprc ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_InvertRect@8' :: InvertRect
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
integer         hDC
type(T_RECT)    lprc
end function InvertRect
end interface

interface
logical(4) function  SetRect (lprc ,xLeft ,yTop ,xRight ,yBottom ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetRect@20' :: SetRect
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
type(T_RECT)    lprc
integer         xLeft
integer         yTop
integer         xRight
integer         yBottom
end function SetRect
end interface

interface
logical(4) function  SetRectEmpty (lprc ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetRectEmpty@4' :: SetRectEmpty
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
type(T_RECT)  lprc
end function SetRectEmpty
end interface

interface
logical(4) function  CopyRect (lprcDst ,lprcSrc ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CopyRect@8' :: CopyRect
!MS$ATTRIBUTES REFERENCE :: lprcDst
!MS$ATTRIBUTES REFERENCE :: lprcSrc
use msfwinty
type(T_RECT)  lprcDst
type(T_RECT)  lprcSrc
end function CopyRect
end interface

interface
 logical(4) function  InflateRect (lprc ,dx ,dy ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_InflateRect@12' :: InflateRect
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
type(T_RECT)    lprc
integer         dx
integer         dy
end function InflateRect
end interface

interface
logical(4) function  IntersectRect (lprcDst ,lprcSrc1 ,lprcSrc2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IntersectRect@12' :: IntersectRect
!MS$ATTRIBUTES REFERENCE :: lprcDst
!MS$ATTRIBUTES REFERENCE :: lprcSrc1
!MS$ATTRIBUTES REFERENCE :: lprcSrc2
use msfwinty
type(T_RECT)  lprcDst
type(T_RECT)  lprcSrc1
type(T_RECT)  lprcSrc2
end function IntersectRect
end interface

interface
logical(4) function  UnionRect (lprcDst ,lprcSrc1 ,lprcSrc2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_UnionRect@12' :: UnionRect
!MS$ATTRIBUTES REFERENCE :: lprcDst
!MS$ATTRIBUTES REFERENCE :: lprcSrc1
!MS$ATTRIBUTES REFERENCE :: lprcSrc2
use msfwinty
type(T_RECT)  lprcDst
type(T_RECT)  lprcSrc1
type(T_RECT)  lprcSrc2
end function UnionRect
end interface

interface
logical(4) function  SubtractRect (lprcDst ,lprcSrc1 ,lprcSrc2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SubtractRect@12' :: SubtractRect
!MS$ATTRIBUTES REFERENCE :: lprcDst
!MS$ATTRIBUTES REFERENCE :: lprcSrc1
!MS$ATTRIBUTES REFERENCE :: lprcSrc2
use msfwinty
type(T_RECT)  lprcDst
type(T_RECT)  lprcSrc1
type(T_RECT)  lprcSrc2
end function SubtractRect
end interface

interface
logical(4) function  OffsetRect (lprc ,dx ,dy ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OffsetRect@12' :: OffsetRect
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
type(T_RECT)    lprc
integer         dx
integer         dy
end function OffsetRect
end interface

interface
logical(4) function  IsRectEmpty (lprc ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsRectEmpty@4' :: IsRectEmpty
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
type(T_RECT)    lprc
end function IsRectEmpty
end interface

interface
logical(4) function  EqualRect (lprca ,lprcb ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EqualRect@8' :: EqualRect
!MS$ATTRIBUTES REFERENCE :: lprca
!MS$ATTRIBUTES REFERENCE :: lprcb
use msfwinty
type(T_RECT)    lprca
type(T_RECT)    lprcb
end function EqualRect
end interface

interface
logical(4) function  PtInRect (lprc ,pt ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_PtInRect@12' :: PtInRect
!MS$ATTRIBUTES REFERENCE :: lprc
use msfwinty
type(T_RECT)    lprc
type(T_POINT)   pt
end function PtInRect
end interface

interface
integer(2) function  GetWindowWord (hWnd ,nIndex ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetWindowWord@8' :: GetWindowWord
integer hWnd
integer nIndex
end function GetWindowWord
end interface

interface
integer(2) function  SetWindowWord (hWnd ,nIndex ,wNewWord) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetWindowWord@12' :: SetWindowWord
integer     hWnd
integer     nIndex
integer(2)  wNewWord
end function SetWindowWord
end interface

interface
integer(4) function  GetWindowLong (hWnd ,nIndex ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetWindowLongA@8' :: GetWindowLong
integer hWnd
integer nIndex
end function GetWindowLong
end interface


interface
integer(4) function  SetWindowLong (hWnd ,nIndex ,dwNewLong ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetWindowLongA@12' :: SetWindowLong
integer hWnd
integer nIndex
integer dwNewLong
end function SetWindowLong
end interface

interface
integer(2) function  GetClassWord (hWnd ,nIndex ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClassWord@8' :: GetClassWord
integer hWnd
integer nIndex
end function GetClassWord
end interface

interface
integer(2) function  SetClassWord (hWnd ,nIndex ,wNewWord) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetClassWord@12' :: SetClassWord
integer hWnd
integer nIndex
integer*2 wNewWord
end function SetClassWord
end interface

interface
integer(4) function  GetClassLong (hWnd ,nIndex ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClassLongA@8' :: GetClassLong
integer hWnd
integer nIndex
end function GetClassLong
end interface


interface
integer(4) function  SetClassLong (hWnd ,nIndex ,dwNewLong ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetClassLongA@12' :: SetClassLong
integer hWnd
integer nIndex
integer dwNewLong
end function SetClassLong
end interface

interface
integer(4) function  GetDesktopWindow () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDesktopWindow@0' :: GetDesktopWindow
end function GetDesktopWindow
end interface

interface
integer(4) function  GetParent (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetParent@4' :: GetParent
integer hWnd
end function GetParent
end interface

interface
integer(4) function  SetParent (hWndChild ,hWndNewParent ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetParent@8' :: SetParent
integer hWndChild
integer hWndNewParent
end function SetParent
end interface

interface
logical(4) function  EnumChildWindows (hWndParent ,lpEnumFunc ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumChildWindows@12' :: EnumChildWindows
integer hWndParent
integer lpEnumFunc
integer lParam
end function EnumChildWindows
end interface

interface
integer(4) function  FindWindow (lpClassName  ,lpWindowName ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_FindWindowA@8' :: FindWindow
!MS$ATTRIBUTES REFERENCE :: lpWindowName
integer         lpClassName 
character*(*)   lpWindowName
end function FindWindow
end interface

interface
logical(4) function  EnumWindows (lpEnumFunc ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumWindows@8' :: EnumWindows
integer lpEnumFunc
integer lParam
end function EnumWindows
end interface

interface
logical(4) function  EnumThreadWindows (dwThreadId ,lpfn ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumThreadWindows@12' :: EnumThreadWindows
integer dwThreadId
integer lpfn
integer lParam
end function EnumThreadWindows
end interface

interface
integer(4) function  GetClassName (hWnd ,lpClassName ,nMaxCount ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetClassNameA@12' :: GetClassName
!MS$ATTRIBUTES REFERENCE :: lpClassName
integer         hWnd
character*(*)   lpClassName
integer         nMaxCount
end function GetClassName
end interface

interface
integer(4) function  GetTopWindow (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetTopWindow@4' :: GetTopWindow
integer hWnd
end function GetTopWindow
end interface

interface
integer(4) function  GetWindowThreadProcessId (hWnd ,lpdwProcessId ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetWindowThreadProcessId@8' :: GetWindowThreadProcessId
integer hWnd
integer lpdwProcessId
end function GetWindowThreadProcessId
end interface

interface
integer(4) function  GetLastActivePopup (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetLastActivePopup@4' :: GetLastActivePopup
integer hWnd
end function GetLastActivePopup
end interface

interface
integer(4) function  GetWindow (hWnd ,uCmd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetWindow@8' :: GetWindow
integer hWnd
integer uCmd
end function GetWindow
end interface


interface
integer(4) function  SetWindowsHook (nFilterType ,pfnFilterProc ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetWindowsHookA@8' :: SetWindowsHook
integer nFilterType
integer pfnFilterProc
end function SetWindowsHook
end interface

interface
logical(4) function  UnhookWindowsHook (nCode ,pfnFilterProc ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_UnhookWindowsHook@8' :: UnhookWindowsHook
integer nCode
integer pfnFilterProc
end function UnhookWindowsHook
end interface

interface
integer(4) function  SetWindowsHookEx (idHook ,lpfn ,hmod ,dwThreadId ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetWindowsHookExA@16' :: SetWindowsHookEx
integer idHook
integer lpfn
integer hmod
integer dwThreadId
end function SetWindowsHookEx
end interface


interface
logical(4) function  UnhookWindowsHookEx (hhk ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_UnhookWindowsHookEx@4' :: UnhookWindowsHookEx
integer hhk
end function UnhookWindowsHookEx
end interface

interface
integer(4) function  CallNextHookEx (hhk ,nCode ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CallNextHookEx@16' :: CallNextHookEx
integer hhk
integer nCode
integer wParam
integer lParam
end function CallNextHookEx
end interface

!
! 
!  * Resource Loading Routines
!

interface
integer(4) function  LoadBitmap (hInstance ,lpBitmapName ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LoadBitmapA@8' :: LoadBitmap
integer hInstance
integer lpBitmapName
end function LoadBitmap
end interface

interface
integer(4) function  LoadCursor (hInstance ,lpCursorName ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LoadCursorA@8' :: LoadCursor
integer hInstance
integer lpCursorName
end function LoadCursor
end interface

interface
integer(4) function  CreateCursor (hInst ,xHotSpot ,yHotSpot ,nWidth ,nHeight ,pvANDPlane ,pvXORPlane ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateCursor@28' :: CreateCursor
integer hInst
integer xHotSpot
integer yHotSpot
integer nWidth
integer nHeight
integer pvANDPlane
integer pvXORPlane
end function CreateCursor
end interface

interface
logical(4) function  DestroyCursor (hCursor ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DestroyCursor@4' :: DestroyCursor
integer hCursor
end function DestroyCursor
end interface

interface
integer(4) function  LoadIcon (hInstance ,lpIconName ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LoadIconA@8' :: LoadIcon
integer hInstance
integer lpIconName
end function LoadIcon
end interface

interface
integer(4) function  CreateIcon (hInstance ,nWidth ,nHeight ,cPlanes ,cBitsPixel ,lpbANDbits ,lpbXORbits ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateIcon@28' :: CreateIcon
integer hInstance
integer nWidth
integer nHeight
byte cPlanes
byte cBitsPixel
integer  lpbANDbits
integer lpbXORbits
end function CreateIcon
end interface

interface
logical(4) function  DestroyIcon (hIcon ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DestroyIcon@4' :: DestroyIcon
integer hIcon
end function DestroyIcon
end interface

interface
integer(4) function  LookupIconIdFromDirectory (presbits ,fIcon ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LookupIconIdFromDirectory@8' :: LookupIconIdFromDirectory
integer     presbits
logical(4)  fIcon
end function LookupIconIdFromDirectory
end interface

interface
integer(4) function  CreateIconFromResource (presbits ,dwResSize ,fIcon ,dwVer ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateIconFromResource@16' :: CreateIconFromResource
integer     presbits
integer     dwResSize
logical(4)  fIcon
integer     dwVer
end function CreateIconFromResource
end interface

interface
integer(4) function  CreateIconIndirect (piconinfo ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateIconIndirect@4' :: CreateIconIndirect
!MS$ATTRIBUTES REFERENCE :: piconinfo
use msfwinty
type(T_ICONINFO)    piconinfo
end function CreateIconIndirect
end interface

interface
integer(4) function  CopyIcon (hIcon ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CopyIcon@4' :: CopyIcon
integer hIcon
end function CopyIcon
end interface

interface
logical(4) function  GetIconInfo (hIcon ,piconinfo ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetIconInfo@8' :: GetIconInfo
!MS$ATTRIBUTES REFERENCE :: piconinfo
use msfwinty
integer             hIcon
type(T_ICONINFO)    piconinfo
end function GetIconInfo
end interface

interface
integer(4) function  LoadString (hInstance ,uID ,lpBuffer ,nBufferMax ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LoadStringA@16' :: LoadString
!MS$ATTRIBUTES REFERENCE :: lpBuffer
integer         hInstance
integer         uID
character*(*)   lpBuffer
integer         nBufferMax
end function LoadString
end interface


! 
!  * Dialog Manager Routines
!  
interface
logical(4) function  IsDialogMessage (hDlg ,lpMsg ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsDialogMessageA@8' :: IsDialogMessage
!MS$ATTRIBUTES REFERENCE :: lpMsg
use msfwinty
integer         hDlg
type (T_MSG)    lpMsg
end function IsDialogMessage
end interface

interface
logical(4) function  MapDialogRect (hDlg ,lpRect ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_MapDialogRect@8' :: MapDialogRect
!MS$ATTRIBUTES REFERENCE :: lpRect
use msfwinty
integer         hDlg
type(T_RECT)    lpRect
end function MapDialogRect
end interface

interface
integer(4) function  DlgDirList (hDlg ,lpPathSpec ,nIDListBox ,nIDStaticPath ,uFileType ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DlgDirListA@20' :: DlgDirList
!MS$ATTRIBUTES REFERENCE :: lpPathSpec
integer         hDlg
character*(*)   lpPathSpec
integer         nIDListBox
integer         nIDStaticPath
integer         uFileType
end function DlgDirList
end interface

interface
logical(4) function  DlgDirSelectEx (hDlg ,lpString ,nCount ,nIDListBox ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DlgDirSelectExA@16' :: DlgDirSelectEx
!MS$ATTRIBUTES REFERENCE :: lpString
integer         hDlg
character*(*)   lpString
integer         nCount
integer         nIDListBox
end function DlgDirSelectEx
end interface

interface
integer(4) function  DlgDirListComboBox (hDlg ,lpPathSpec ,nIDComboBox ,nIDStaticPath ,uFiletype ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DlgDirListComboBoxA@20' :: DlgDirListComboBox
!MS$ATTRIBUTES REFERENCE :: lpPathSpec
integer         hDlg
character*(*)   lpPathSpec
integer         nIDComboBox
integer         nIDStaticPath
integer         uFiletype
end function DlgDirListComboBox
end interface

interface
logical(4) function  DlgDirSelectComboBoxEx (hDlg ,lpString ,nCount ,nIDComboBox ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DlgDirSelectComboBoxExA@16' :: DlgDirSelectComboBoxEx
!MS$ATTRIBUTES REFERENCE :: lpString
integer         hDlg
character*(*)   lpString
integer         nCount
integer         nIDComboBox
end function DlgDirSelectComboBoxEx
end interface

interface
integer(4) function  DefFrameProc (hWnd ,hWndMDIClient  ,uMsg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DefFrameProcA@20' :: DefFrameProc
integer hWnd
integer hWndMDIClient 
integer uMsg
integer wParam
integer lParam
end function DefFrameProc
end interface

interface
integer(4) function  DefMDIChildProc (hWnd ,uMsg ,wParam ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DefMDIChildProcA@16' :: DefMDIChildProc
integer hWnd
integer uMsg
integer wParam
integer lParam
end function DefMDIChildProc
end interface


interface
logical(4) function  TranslateMDISysAccel (hWndClient ,lpMsg ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_TranslateMDISysAccel@8' :: TranslateMDISysAccel
!MS$ATTRIBUTES REFERENCE :: lpMsg 
use msfwinty
integer     hWndClient
type(T_MSG) lpMsg
end function TranslateMDISysAccel
end interface

interface
integer(4) function  ArrangeIconicWindows (hWnd ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ArrangeIconicWindows@4' :: ArrangeIconicWindows
integer hWnd
end function ArrangeIconicWindows
end interface

interface
integer(4) function  CreateMDIWindow (lpClassName ,lpWindowName ,dwStyle ,X ,Y ,nWidth ,nHeight ,hWndParent ,hInstance ,lParam ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateMDIWindowA@40' :: CreateMDIWindow
!MS$ATTRIBUTES REFERENCE :: lpClassName
!MS$ATTRIBUTES REFERENCE :: lpWindowName
character*(*)   lpClassName
character*(*)   lpWindowName
integer         dwStyle
integer         X
integer         Y
integer         nWidth
integer         nHeight
integer         hWndParent
integer         hInstance
integer         lParam       
end function CreateMDIWindow
end interface

interface
logical(4) function  WinHelp (hWndMain ,lpszHelp ,uCommand ,dwData) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_WinHelpA@16' :: WinHelp
!MS$ATTRIBUTES  REFERENCE :: lpszHelp
integer         hWndMain
character*(*)   lpszHelp
integer         uCommand
integer         dwData   
end function WinHelp
end interface

interface
logical(4) function  SystemParametersInfo (uiAction ,uiParam ,pvParam ,fWinIni ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SystemParametersInfoA@16' :: SystemParametersInfo
integer uiAction
integer uiParam
integer pvParam
integer fWinIni
end function SystemParametersInfo
end interface


!
!Set debug level
!

interface 
integer function SetDebugErrorLevel( dwLevel)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetDebugErrorLevel@4' :: SetDebugErrorLevel
integer dwLevel
end function
end interface

interface
integer function SetLastErrorEx (dwErrorCode, dwType)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetLastErrorEx@8':: SetLastErrorEx
integer dwErrorCode
integer dwType
end function
end interface


!                       *****WINCON*****

! 
!  direct API definitions.
! 

interface
logical(4) function  PeekConsoleInput (hConsoleInput ,lpBuffer ,nLength ,lpNumberOfEventsRead ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PeekConsoleInputA@16' :: PeekConsoleInput
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
use msfwinty
integer             hConsoleInput
type(T_INPUT_RECORD) lpBuffer
integer             nLength
integer             lpNumberOfEventsRead   
end function PeekConsoleInput
end interface

interface
logical(4) function  ReadConsoleInput (hConsoleInput ,lpBuffer ,nLength ,lpNumberOfEventsRead ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadConsoleInputA@16' :: ReadConsoleInput
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
use msfwinty
integer             hConsoleInput
type(T_INPUT_RECORD) lpBuffer
integer             nLength
integer             lpNumberOfEventsRead   
end function ReadConsoleInput
end interface

interface
logical(4) function  WriteConsoleInput (hConsoleInput ,lpBuffer ,nLength ,lpNumberOfEventsWritten ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteConsoleInputA@16' :: WriteConsoleInput
!MS$ ATTRIBUTES REFERENCE :: lpBuffer
use msfwinty
integer             hConsoleInput
type(T_INPUT_RECORD) lpBuffer
integer             nLength
integer             lpNumberOfEventsWritten   
end function WriteConsoleInput
end interface


interface
logical(4) function  ReadConsoleOutput (hConsoleOutput ,lpBuffer ,dwBufferSize ,dwBufferCoord ,lpReadRegion) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadConsoleOutputA@20' :: ReadConsoleOutput
!MS$ ATTRIBUTES REFERENCE :: lpBuffer 
!MS$ ATTRIBUTES REFERENCE :: dwBufferSize
!MS$ ATTRIBUTES REFERENCE :: dwBufferCoord
!MS$ ATTRIBUTES REFERENCE :: lpReadRegion
use msfwinty
integer             hConsoleOutput
type(T_CHAR_INFO)   lpBuffer
type(T_COORD)       dwBufferSize
type(T_COORD)       dwBufferCoord
type(T_SMALL_RECT)  lpReadRegion   
end function ReadConsoleOutput
end interface

interface
logical(4) function  WriteConsoleOutput (hConsoleOutput ,lpBuffer ,dwBufferSize ,dwBufferCoord ,lpWriteRegion ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteConsoleOutputA@20' :: WriteConsoleOutput
!MS$ ATTRIBUTES REFERENCE :: lpBuffer 
!MS$ ATTRIBUTES REFERENCE :: dwBufferSize
!MS$ ATTRIBUTES REFERENCE :: dwBufferCoord
!MS$ ATTRIBUTES REFERENCE :: lpWriteRegion 
use msfwinty
integer             hConsoleOutput
type(T_CHAR_INFO)   lpBuffer
type(T_COORD)       dwBufferSize
type(T_COORD)       dwBufferCoord
type(T_SMALL_RECT)  lpWriteRegion   
end function WriteConsoleOutput
end interface

interface
logical(4) function  ReadConsoleOutputCharacter (hConsoleOutput ,lpCharacter ,nLength ,dwReadCoord ,lpNumberOfCharsRead ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadConsoleOutputCharacterA@20' :: ReadConsoleOutputCharacter
!MS$ ATTRIBUTES REFERENCE :: lpCharacter
use msfwinty
integer         hConsoleOutput
character*(*)   lpCharacter
integer         nLength
type(T_COORD)   dwReadCoord
integer         lpNumberOfCharsRead   
end function ReadConsoleOutputCharacter
end interface


interface
logical(4) function  ReadConsoleOutputAttribute (hConsoleOutput ,lpAttribute ,nLength ,dwReadCoord ,lpNumberOfAttrsRead ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadConsoleOutputAttribute@20' :: ReadConsoleOutputAttribute
use msfwinty
integer         hConsoleOutput
integer         lpAttribute
integer         nLength
type(T_COORD)   dwReadCoord
integer         lpNumberOfAttrsRead   
end function ReadConsoleOutputAttribute
end interface

interface
logical(4) function  WriteConsoleOutputCharacter (hConsoleOutput ,lpCharacter ,nLength ,dwWriteCoord ,lpNumberOfCharsWritten ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteConsoleOutputCharacterA@20' :: WriteConsoleOutputCharacter
!MS$ ATTRIBUTES REFERENCE :: lpCharacter
use msfwinty
integer         hConsoleOutput
character*(*)   lpCharacter
integer         nLength
type(T_COORD)   dwWriteCoord
integer         lpNumberOfCharsWritten
end function WriteConsoleOutputCharacter
end interface

interface
logical(4) function  WriteConsoleOutputAttribute (hConsoleOutput ,lpAttribute ,nLength ,dwWriteCoord ,lpNumberOfAttrsWritten ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteConsoleOutputAttribute@20' :: WriteConsoleOutputAttribute
use msfwinty
integer         hConsoleOutput
integer         lpAttribute
integer         nLength
type(T_COORD)   dwWriteCoord
integer         lpNumberOfAttrsWritten   
end function WriteConsoleOutputAttribute
end interface

interface
logical(4) function  FillConsoleOutputCharacter (hConsoleOutput ,cCharacter ,nLength ,dwWriteCoord ,lpNumberOfCharsWritten ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FillConsoleOutputCharacterA@20' :: FillConsoleOutputCharacter
use msfwinty
integer         hConsoleOutput
character       cCharacter
integer         nLength
type(T_COORD)   dwWriteCoord
integer         lpNumberOfCharsWritten   
end function FillConsoleOutputCharacter
end interface

interface
logical(4) function  FillConsoleOutputAttribute (hConsoleOutput ,wAttribute ,nLength ,dwWriteCoord ,lpNumberOfAttrsWritten ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FillConsoleOutputAttribute@20' :: FillConsoleOutputAttribute
use msfwinty
integer         hConsoleOutput
integer(2)      wAttribute
integer         nLength
type(T_COORD)   dwWriteCoord
integer         lpNumberOfAttrsWritten   
end function FillConsoleOutputAttribute
end interface

interface
logical(4) function  GetConsoleMode (hConsoleHandle ,lpMode ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetConsoleMode@8' :: GetConsoleMode
integer hConsoleHandle
integer lpMode   
end function GetConsoleMode
end interface

interface
logical(4) function  GetNumberOfConsoleInputEvents (hConsoleInput ,lpNumberOfEvents ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetNumberOfConsoleInputEvents@8' :: GetNumberOfConsoleInputEvents
integer hConsoleInput
integer lpNumberOfEvents   
end function GetNumberOfConsoleInputEvents
end interface

interface
logical(4) function  GetConsoleScreenBufferInfo (hConsoleOutput ,lpConsoleScreenBufferInfo) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetConsoleScreenBufferInfo@8' :: GetConsoleScreenBufferInfo
!MS$ ATTRIBUTES REFERENCE :: lpConsoleScreenBufferInfo
use msfwinty
integer                             hConsoleOutput
type(T_CONSOLE_SCREEN_BUFFER_INFO)  lpConsoleScreenBufferInfo
end function GetConsoleScreenBufferInfo
end interface

interface
integer*4 function  GetLargestConsoleWindowSize (hConsoleOutput ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetLargestConsoleWindowSize@4' :: GetLargestConsoleWindowSize
use msfwinty
integer hConsoleOutput   
end function GetLargestConsoleWindowSize
end interface

interface
logical(4) function  GetConsoleCursorInfo (hConsoleOutput ,lpConsoleCursorInfo ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetConsoleCursorInfo@8' :: GetConsoleCursorInfo
!MS$ ATTRIBUTES REFERENCE :: lpConsoleCursorInfo
use msfwinty
integer                             hConsoleOutput
type(T_CONSOLE_SCREEN_BUFFER_INFO)  lpConsoleCursorInfo   
end function GetConsoleCursorInfo
end interface

interface
logical(4) function  GetNumberOfConsoleMouseButtons (lpNumberOfMouseButtons ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetNumberOfConsoleMouseButtons@4' :: GetNumberOfConsoleMouseButtons
integer lpNumberOfMouseButtons   
end function GetNumberOfConsoleMouseButtons
end interface

interface
logical(4) function  SetConsoleMode (hConsoleHandle ,dwMode ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleMode@8' :: SetConsoleMode
integer hConsoleHandle
integer dwMode   
end function SetConsoleMode
end interface

interface
logical(4) function  SetConsoleActiveScreenBuffer (hConsoleOutput ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleActiveScreenBuffer@4' :: SetConsoleActiveScreenBuffer
integer hConsoleOutput   
end function SetConsoleActiveScreenBuffer
end interface

interface
logical(4) function  FlushConsoleInputBuffer (hConsoleInput) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FlushConsoleInputBuffer@4' :: FlushConsoleInputBuffer
integer hConsoleInput   
end function FlushConsoleInputBuffer
end interface

interface
logical(4) function  SetConsoleScreenBufferSize (hConsoleOutput ,dwSize ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleScreenBufferSize@8' :: SetConsoleScreenBufferSize
use msfwinty
integer         hConsoleOutput
type (T_COORD)  dwSize   
end function SetConsoleScreenBufferSize
end interface

interface
logical(4) function  SetConsoleCursorPosition (hConsoleOutput ,dwCursorPosition ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleCursorPosition@8' :: SetConsoleCursorPosition
use msfwinty
integer         hConsoleOutput
type (T_COORD)  dwCursorPosition   
end function SetConsoleCursorPosition
end interface

interface
logical(4) function  SetConsoleCursorInfo (hConsoleOutput ,lpConsoleCursorInfo ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleCursorInfo@8' :: SetConsoleCursorInfo
!MS$ ATTRIBUTES REFERENCE :: lpConsoleCursorInfo   
use msfwinty
integer                     hConsoleOutput
type(T_CONSOLE_CURSOR_INFO) lpConsoleCursorInfo   
end function SetConsoleCursorInfo
end interface

interface
logical(4) function  ScrollConsoleScreenBuffer (hConsoleOutput ,lpScrollRectangle ,lpClipRectangle ,dwDestinationOrigin ,lpFill ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ScrollConsoleScreenBufferA@20' :: ScrollConsoleScreenBuffer
!MS$ ATTRIBUTES REFERENCE :: lpScrollRectangle
!MS$ ATTRIBUTES REFERENCE :: lpClipRectangle
!MS$ ATTRIBUTES REFERENCE :: lpFill
use msfwinty
integer             hConsoleOutput
type(T_SMALL_RECT)  lpScrollRectangle
type(T_SMALL_RECT)  lpClipRectangle
type(T_COORD)       dwDestinationOrigin
type(T_CHAR_INFO)   lpFill
end function ScrollConsoleScreenBuffer
end interface


interface
logical(4) function  SetConsoleWindowInfo (hConsoleOutput ,bAbsolute ,lpConsoleWindow ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleWindowInfo@12' :: SetConsoleWindowInfo
!MS$ ATTRIBUTES REFERENCE :: lpConsoleWindow
use msfwinty
integer(4)          hConsoleOutput
logical(4)          bAbsolute
type(T_SMALL_RECT)  lpConsoleWindow
end function SetConsoleWindowInfo
end interface

interface
logical(4) function  SetConsoleTextAttribute (hConsoleOutput ,wAttributes ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleTextAttribute@8' :: SetConsoleTextAttribute
integer hConsoleOutput
integer(2)  wAttributes   
end function SetConsoleTextAttribute
end interface

interface
logical(4) function  SetConsoleCtrlHandler (HandlerRoutine ,Add ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleCtrlHandler@8' :: SetConsoleCtrlHandler
integer(4)  HandlerRoutine
logical(4)  Add   
end function SetConsoleCtrlHandler
end interface

interface
logical(4) function  GenerateConsoleCtrlEvent (dwCtrlEvent ,dwProcessGroupId ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GenerateConsoleCtrlEvent@8' :: GenerateConsoleCtrlEvent
integer dwCtrlEvent
integer dwProcessGroupId   
end function GenerateConsoleCtrlEvent
end interface

interface
logical(4) function  AllocConsole ( ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AllocConsole@0' :: AllocConsole
end function AllocConsole
end interface

interface
logical(4) function  FreeConsole ( ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FreeConsole@0' :: FreeConsole
end function FreeConsole
end interface

interface
integer(4) function  GetConsoleTitle (lpConsoleTitle ,nSize ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetConsoleTitleA@8' :: GetConsoleTitle
!MS$ATTRIBUTES REFERENCE :: lpConsoleTitle
character*(*)   lpConsoleTitle
integer         nSize   
end function GetConsoleTitle
end interface

interface
logical(4) function  SetConsoleTitle (lpConsoleTitle ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleTitleA@4' :: SetConsoleTitle
!MS$ATTRIBUTES REFERENCE :: lpConsoleTitle
character*(*) lpConsoleTitle   
end function SetConsoleTitle
end interface

interface
logical(4) function  ReadConsole (hConsoleInput ,lpBuffer ,nNumberOfCharsToRead ,lpNumberOfCharsRead ,lpReserved) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadConsoleA@20' :: ReadConsole
integer hConsoleInput
integer lpBuffer
integer nNumberOfCharsToRead
integer lpNumberOfCharsRead
integer lpReserved   
end function ReadConsole
end interface


interface
logical(4) function  WriteConsole (hConsoleOutput ,lpBuffer ,nNumberOfCharsToWrite ,lpNumberOfCharsWritten ,lpReserved ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WriteConsoleA@20' :: WriteConsole
integer hConsoleOutput
integer lpBuffer
integer nNumberOfCharsToWrite
integer lpNumberOfCharsWritten
integer lpReserved   
end function WriteConsole
end interface

interface
integer(4) function  CreateConsoleScreenBuffer (dwDesiredAccess ,dwShareMode ,lpSecurityAttributes ,dwFlags ,lpScreenBufferData) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CreateConsoleScreenBuffer@20' :: CreateConsoleScreenBuffer
!MS$ ATTRIBUTES REFERENCE :: lpSecurityAttributes
use msfwinty
integer                     dwDesiredAccess
integer                     dwShareMode
type(T_SECURITY_ATTRIBUTES) lpSecurityAttributes
integer                     dwFlags
integer                     lpScreenBufferData   
end function CreateConsoleScreenBuffer
end interface

interface
integer(4) function  GetConsoleCP ( ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetConsoleCP@4' :: GetConsoleCP
end function GetConsoleCP
end interface

interface
logical(4) function  SetConsoleCP (wCodePageID ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleCP@4' :: SetConsoleCP
integer wCodePageID   
end function SetConsoleCP
end interface

interface
integer(4) function  GetConsoleOutputCP ( ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetConsoleOutputCP@0' :: GetConsoleOutputCP
end function GetConsoleOutputCP
end interface

interface
logical(4) function  SetConsoleOutputCP (wCodePageID ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetConsoleOutputCP@4' :: SetConsoleOutputCP
integer wCodePageID   
end function SetConsoleOutputCP
end interface


!                       ****WINNETWK*****

interface
integer(4) function  WNetAddConnection  (lpRemoteName ,lpPassword ,lpLocalName) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetAddConnectionA@12' :: WNetAddConnection
!MS$ ATTRIBUTES REFERENCE :: lpRemoteName
!MS$ ATTRIBUTES REFERENCE :: lpPassword
!MS$ ATTRIBUTES REFERENCE :: lpLocalName
character*(*)   lpRemoteName
character*(*)   lpPassword
character*(*)   lpLocalName
end function WNetAddConnection
end interface

interface
integer(4) function WNetAddConnection2 (lpNetResource,lpPassword,lpUserName,dwFlags) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetAddConnection2A@16' :: WNetAddConnection2
!MS$ ATTRIBUTES REFERENCE :: lpNetResource
!MS$ ATTRIBUTES REFERENCE :: lpPassword
!MS$ ATTRIBUTES REFERENCE :: lpUserName
use msfwinty
type(T_NETRESOURCE) lpNetResource
character*(*)       lpPassword
character*(*)       lpUserName
integer             dwFlags
end function WNetAddConnection2
end interface

interface
integer(4) function WNetAddConnection3 (hwndOwner, lpNetResource,lpPassword,lpUserName,dwFlags) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetAddConnection3A@20' :: WNetAddConnection3
!MS$ ATTRIBUTES REFERENCE :: lpNetResource
!MS$ ATTRIBUTES REFERENCE :: lpPassword
!MS$ ATTRIBUTES REFERENCE :: lpUserName
use msfwinty
integer             hwndOwner
type(T_NETRESOURCE) lpNetResource
character*(*)       lpPassword
character*(*)       lpUserName
integer             dwFlags
end function WNetAddConnection3
end interface


interface
integer(4) function  WNetCancelConnection  (lpName ,fForce ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetCancelConnectionA@8' :: WNetCancelConnection  
!MS$ ATTRIBUTES REFERENCE :: lpName
character*(*)   lpName
logical(4)      fForce   
end function WNetCancelConnection
end interface

interface
integer(4) function WNetCancelConnection2 (lpName,dwFlags,fForce) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetCancelConnection2A@12' :: WNetCancelConnection2 
!MS$ ATTRIBUTES REFERENCE :: lpName
character*(*)   lpName
integer         dwFlags              
logical(4)      fForce   
end function WNetCancelConnection2
end interface

interface
integer(4) function  WNetGetConnection  (lpLocalName ,lpRemoteName ,lpnLength ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetGetConnectionA@12' :: WNetGetConnection
!MS$ ATTRIBUTES REFERENCE :: lpLocalName
!MS$ ATTRIBUTES REFERENCE :: lpRemoteName
character*(*)   lpLocalName
character*(*)   lpRemoteName
integer         lpnLength   
end function WNetGetConnection
end interface

interface
integer function WNetGetUniversalName (lpLocalPath, dwInfoLevel, lpBuffer, lpBufferSize)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetGetUniversalNameA@20' :: WNetGetUniversalName
integer lpLocalPath
integer dwInfoLevel
integer lpBuffer
integer lpBufferSize
end function
end interface

interface
integer(4) function  WNetOpenEnum  (dwScope ,dwType ,dwUsage ,lpNetResource ,lphEnum ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetOpenEnumA@16' :: WNetOpenEnum
!MS$ ATTRIBUTES REFERENCE :: lpNetResource
use msfwinty
integer             dwScope
integer             dwType
integer             dwUsage
type(T_NETRESOURCE) lpNetResource
integer             lphEnum   
end function WNetOpenEnum
end interface

interface
integer(4) function  WNetEnumResource  (hEnum ,lpcCount ,lpBuffer ,lpBufferSize ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetEnumResourceA@16' :: WNetEnumResource
integer hEnum
integer lpcCount
integer lpBuffer
integer lpBufferSize   
end function WNetEnumResource
end interface


interface
integer(4) function  WNetCloseEnum  (hEnum ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetCloseEnum@4' :: WNetCloseEnum  
integer hEnum   
end function WNetCloseEnum
end interface

! 
!   OTHER
!  

interface
integer(4) function  WNetGetUser  (lpName ,lpUserName ,lpnLength   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetGetUserA@12' :: WNetGetUser
!MS$ ATTRIBUTES REFERENCE :: lpName
!MS$ ATTRIBUTES REFERENCE :: lpUserName
character*(*)   lpName
character*(*)   lpUserName
integer         lpnLength   
end function WNetGetUser
end interface

!   BROWSE DIALOGS

interface
integer(4) function  WNetConnectionDialog (hwnd ,dwType ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetConnectionDialog@8' :: WNetConnectionDialog 
integer hwnd
integer dwType   
end function WNetConnectionDialog
end interface

interface
integer(4) function  WNetDisconnectDialog (hwnd ,dwType ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetDisconnectDialog@8' :: WNetDisconnectDialog 
integer hwnd
integer dwType   
end function WNetDisconnectDialog
end interface

!   ERRORS

interface
integer(4) function  WNetGetLastError  (lpError ,lpErrorBuf ,nErrorBufSize ,lpNameBuf ,nNameBufSize ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WNetGetLastErrorA@20' :: WNetGetLastError
!MS$ ATTRIBUTES REFERENCE :: lpErrorBuf
!MS$ ATTRIBUTES REFERENCE :: lpNameBuf
integer         lpError
character*(*)   lpErrorBuf
integer         nErrorBufSize
character*(*)   lpNameBuf
integer         nNameBufSize   
end function WNetGetLastError
end interface


!                       *****COMMDLG******

interface
logical(4) function  GetOpenFileName (dummy ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_GetOpenFileNameA@4' :: GetOpenFileName
!MS$ ATTRIBUTES REFERENCE :: dummy
use msfwinty
type(T_OPENFILENAME)  dummy
end function GetOpenFileName
end interface

interface
logical(4) function  GetSaveFileName (dummy ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_GetSaveFileNameA@4' :: GetSaveFileName
!MS$ ATTRIBUTES REFERENCE :: dummy
use msfwinty
type(T_OPENFILENAME)    dummy
end function GetSaveFileName
end interface

interface
integer*2 function  GetFileTitle (dummya ,dummyb ,dummyc ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_GetFileTitleA@12' :: GetFileTitle
!MS$ ATTRIBUTES REFERENCE :: dummya
!MS$ ATTRIBUTES REFERENCE :: dummyb
character*(*)   dummya
character*(*)   dummyb
integer*2       dummyc
end function GetFileTitle
end interface


interface
logical(4) function  ChooseColor (dummy ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_ChooseColorA@4' :: ChooseColor
!MS$ ATTRIBUTES REFERENCE :: dummy
use msfwinty
type(T_CHOOSECOLOR) dummy
end function ChooseColor
end interface

interface
integer*4 function  FindText (dummy ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_FindTextA@4' :: FindText
!MS$ ATTRIBUTES REFERENCE :: dummy
use msfwinty
type(T_FINDREPLACE) dummy
end function FindText
end interface

interface
integer*4 function  ReplaceText (dummy ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_ReplaceTextA@4' :: ReplaceText
!MS$ ATTRIBUTES REFERENCE :: dummy
use msfwinty
type(T_FINDREPLACE) dummy
end function ReplaceText
end interface

interface
logical(4) function  ChooseFont (dummy ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_ChooseFontA@4' :: ChooseFont
!MS$ ATTRIBUTES REFERENCE :: dummy
use msfwinty
type(T_CHOOSEFONT) dummy
end function ChooseFont
end interface

interface
logical(4) function  PrintDlg (dummy) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_PrintDlgA@4' :: PrintDlg
!MS$ ATTRIBUTES REFERENCE :: dummy
use msfwinty
type(T_PRINTDLG)    dummy
end function PrintDlg
end interface

interface
integer*4 function  CommDlgExtendedError () 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_CommDlgExtendedError@0' :: CommDlgExtendedError
end function CommDlgExtendedError
end interface


!                       ******WINREG******
! 
interface
integer(4) function  RegCloseKey  (hKey  ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegCloseKey@4'   :: RegCloseKey  
integer hKey   
end function RegCloseKey
end interface

interface
integer(4) function  RegConnectRegistry  (lpMachineName ,hKey ,phkResult ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegConnectRegistryA@12'   :: RegConnectRegistry
!MS$ ATTRIBUTES REFERENCE :: lpMachineName
character*(*)   lpMachineName
integer         hKey
integer         phkResult
end function RegConnectRegistry
end interface

interface
integer(4) function  RegCreateKey  (hKey ,lpSubKey ,phkResult ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegCreateKeyA@12'   :: RegCreateKey  
!MS$ ATTRIBUTES REFERENCE :: lpSubKey
integer         hKey
character*(*)   lpSubKey
integer         phkResult   
end function RegCreateKey
end interface

interface
integer(4) function  RegCreateKeyEx  (hKey ,lpSubKey ,Reserved ,lpClass ,dwOptions ,samDesired ,lpSecurityAttributes ,phkResult ,lpdwDisposition  ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegCreateKeyExA@36'   :: RegCreateKeyEx  
!MS$ ATTRIBUTES REFERENCE :: lpSubKey
!MS$ ATTRIBUTES REFERENCE :: lpClass
!MS$ ATTRIBUTES REFERENCE :: lpSecurityAttributes
use msfwinty
integer                     hKey
character*(*)               lpSubKey
integer                     Reserved
character*(*)               lpClass
integer                     dwOptions
integer                     samDesired
type(T_SECURITY_ATTRIBUTES) lpSecurityAttributes
integer                     phkResult
integer                     lpdwDisposition   
end function RegCreateKeyEx
end interface

interface
integer(4) function  RegDeleteKey  (hKey ,lpSubKey   ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegDeleteKeyA@8'   :: RegDeleteKey  
!MS$ ATTRIBUTES REFERENCE :: lpSubKey
integer         hKey
character*(*)   lpSubKey
end function RegDeleteKey
end interface

interface
integer(4) function  RegDeleteValue  (hKey ,lpValueName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegDeleteValueA@8'   :: RegDeleteValue  
!MS$ ATTRIBUTES REFERENCE :: lpValueName
integer         hKey
character*(*)   lpValueName
end function RegDeleteValue
end interface

interface
integer(4) function  RegEnumKey  (hKey ,dwIndex ,lpName ,cbName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegEnumKeyA@16'   :: RegEnumKey  
!MS$ ATTRIBUTES REFERENCE :: lpName
integer         hKey
integer         dwIndex
character*(*)   lpName
integer         cbName   
end function RegEnumKey
end interface


interface
integer(4) function  RegEnumKeyEx  (hKey ,dwIndex ,lpName ,lpcbName ,lpReserved ,lpClass ,lpcbClass ,lpftLastWriteTime ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegEnumKeyExA@32'   :: RegEnumKeyEx  
!MS$ ATTRIBUTES REFERENCE :: lpName
!MS$ ATTRIBUTES REFERENCE :: lpClass
!MS$ ATTRIBUTES REFERENCE :: lpftLastWriteTime
use msfwinty
integer             hKey
integer             dwIndex
character*(*)       lpName
integer             lpcbName
integer             lpReserved
character*(*)       lpClass
integer             lpcbClass
type(T_FILETIME)    lpftLastWriteTime   
end function RegEnumKeyEx
end interface

interface
integer(4) function  RegEnumValue  (hKey ,dwIndex ,lpValueName ,lpcbValueName ,lpReserved ,lpType ,lpData ,lpcbData ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegEnumValueA@32'   :: RegEnumValue  
!MS$ ATTRIBUTES REFERENCE :: lpValueName
integer         hKey
integer         dwIndex
character*(*)   lpValueName
integer         lpcbValueName
integer         lpReserved
integer         lpType
integer         lpData
integer         lpcbData   
end function RegEnumValue
end interface

interface
integer(4) function  RegFlushKey  (hKey  ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegFlushKey@4'   :: RegFlushKey  
integer hKey   
end function RegFlushKey
end interface

interface
integer(4) function  RegGetKeySecurity  (hKey ,SecurityInformation ,pSecurityDescriptor ,lpcbSecurityDescriptor ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegGetKeySecurity@16'   :: RegGetKeySecurity  
!MS$ ATTRIBUTES REFERENCE :: lpcbSecurityDescriptor   
use msfwinty
integer                     hKey
integer                     SecurityInformation
integer                     pSecurityDescriptor
type(T_SECURITY_DESCRIPTOR) lpcbSecurityDescriptor   
end function RegGetKeySecurity
end interface

interface
integer(4) function  RegLoadKey  (hKey ,lpSubKey ,lpFile ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegLoadKeyA@12'   :: RegLoadKey
!MS$ ATTRIBUTES REFERENCE :: lpSubKey
!MS$ ATTRIBUTES REFERENCE :: lpFile
integer         hKey
character*(*)   lpSubKey
character*(*)   lpFile   
end function RegLoadKey
end interface

interface
integer(4) function  RegNotifyChangeKeyValue  (hKey ,bWatchSubtree ,dwNotifyFilter ,hEvent ,fAsynchronus ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegNotifyChangeKeyValue@20'   :: RegNotifyChangeKeyValue  
integer     hKey
logical(4)  bWatchSubtree
integer     dwNotifyFilter
integer     hEvent
logical(4)  fAsynchronus   
end function RegNotifyChangeKeyValue
end interface

interface
integer(4) function  RegOpenKey (hKey ,lpSubKey ,phkResult ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegOpenKeyA@12'   :: RegOpenKey
!MS$ ATTRIBUTES REFERENCE :: lpSubKey
integer         hKey
character*(*)   lpSubKey
integer         phkResult   
end function RegOpenKey
end interface

interface
integer(4) function  RegOpenKeyEx  (hKey ,lpSubKey ,ulOptions ,samDesired ,phkResult) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegOpenKeyExA@20'   :: RegOpenKeyEx  
!MS$ATTRIBUTES REFERENCE :: lpSubKey
integer         hKey
character*(*)   lpSubKey
integer         ulOptions
integer         samDesired
integer         phkResult   
end function RegOpenKeyEx
end interface

interface
integer(4) function  RegQueryInfoKey  (hKey ,lpClass ,lpcbClass ,lpReserved ,lpcSubKeys ,lpcbMaxSubKeyLen ,lpcbMaxClassLen ,lpcValues ,lpcbMaxValueNameLen ,lpcbMaxValueLen ,lpcbSecurityDescriptor ,lpftLastWriteTime ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegQueryInfoKeyA@48'   :: RegQueryInfoKey
!MS$ATTRIBUTES REFERENCE :: lpClass
!MS$ATTRIBUTES REFERENCE :: lpftLastWriteTime 
use msfwinty
integer         hKey
character*(*)   lpClass
integer         lpcbClass
integer         lpReserved
integer         lpcSubKeys
integer         lpcbMaxSubKeyLen
integer         lpcbMaxClassLen
integer         lpcValues
integer         lpcbMaxValueNameLen
integer         lpcbMaxValueLen
integer         lpcbSecurityDescriptor
type(T_FILETIME)  lpftLastWriteTime   
end function RegQueryInfoKey
end interface

interface
integer(4) function  RegQueryValue  (hKey ,lpSubKey ,lpValue ,lpcbValue ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegQueryValueA@16'   :: RegQueryValue
!MS$ ATTRIBUTES REFERENCE :: lpSubKey
!MS$ ATTRIBUTES REFERENCE :: lpValue
integer         hKey
character*(*)   lpSubKey
character*(*)   lpValue
integer         lpcbValue   
end function RegQueryValue
end interface

interface
integer(4) function  RegQueryValueEx  (hKey ,lpValueName ,lpReserved ,lpType ,lpData ,lpcbData) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegQueryValueExA@24'   :: RegQueryValueEx  
!MS$ ATTRIBUTES REFERENCE :: lpValueName
integer         hKey
character*(*)   lpValueName
integer         lpReserved
integer         lpType
integer         lpData
integer         lpcbData   
end function RegQueryValueEx
end interface

interface
integer(4) function  RegReplaceKey  (hKey ,lpSubKey ,lpNewFile ,lpOldFile ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegReplaceKeyA@16'   :: RegReplaceKey
!MS$ ATTRIBUTES REFERENCE :: lpSubKey
!MS$ ATTRIBUTES REFERENCE :: lpNewFile
!MS$ ATTRIBUTES REFERENCE :: lpOldFile
integer         hKey
character*(*)   lpSubKey
character*(*)   lpNewFile
character*(*)   lpOldFile   
end function RegReplaceKey
end interface

interface
integer(4) function  RegRestoreKey  (hKey ,lpFile ,dwFlags ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegRestoreKeyA@12'   :: RegRestoreKey
!MS$ ATTRIBUTES REFERENCE :: lpFile
integer         hKey
character*(*)   lpFile
integer         dwFlags   
end function RegRestoreKey
end interface

interface
integer(4) function  RegSaveKey  (hKey ,lpFile ,lpSecurityAttributes ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegSaveKeyA@12'   :: RegSaveKey
!MS$ ATTRIBUTES REFERENCE :: lpFile
!MS$ ATTRIBUTES REFERENCE :: lpSecurityAttributes
use msfwinty
integer                     hKey
character*(*)               lpFile
type(T_SECURITY_ATTRIBUTES) lpSecurityAttributes   
end function RegSaveKey
end interface

interface
integer(4) function  RegSetKeySecurity  (hKey ,SecurityInformation ,pSecurityDescriptor ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegSetKeySecurity@12'   :: RegSetKeySecurity  
!MS$ ATTRIBUTES REFERENCE :: pSecurityDescriptor
use msfwinty
integer                     hKey
integer                     SecurityInformation
type(T_SECURITY_DESCRIPTOR) pSecurityDescriptor   
end function RegSetKeySecurity
end interface

interface
integer(4) function  RegSetValue  (hKey ,lpSubKey ,dwType ,lpData ,cbData ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegSetValueA@20'   :: RegSetValue
!MS$ ATTRIBUTES REFERENCE :: lpSubKey
!MS$ ATTRIBUTES REFERENCE :: lpData
integer         hKey
character*(*)   lpSubKey
integer         dwType
character*(*)   lpData
integer         cbData   
end function RegSetValue
end interface

interface
integer(4) function  RegSetValueEx  (hKey ,lpValueName ,Reserved ,dwType ,lpData ,cbData ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegSetValueExA@24'   :: RegSetValueEx
!MS$ ATTRIBUTES REFERENCE :: lpValueName
integer         hKey
character*(*)   lpValueName
integer         Reserved
integer         dwType
integer         lpData
integer         cbData   
end function RegSetValueEx
end interface

interface
integer(4) function  RegUnLoadKey  (hKey ,lpSubKey ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegUnLoadKeyA@8'   :: RegUnLoadKey
!MS$ ATTRIBUTES REFERENCE :: lpSubKey
integer         hKey
character*(*)   lpSubKey   
end function RegUnLoadKey
end interface

! 
!  Remoteable System Shutdown APIs
! 

interface
logical(4) function  InitiateSystemShutdown (lpMachineName ,lpMessage ,dwTimeout ,bForceAppsClosed ,bRebootAfterShutdown ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_InitiateSystemShutdownA@20'  :: InitiateSystemShutdown
!MS$ ATTRIBUTES REFERENCE :: lpMachineName
!MS$ ATTRIBUTES REFERENCE :: lpMessage
character*(*)   lpMachineName
character*(*)   lpMessage
integer         dwTimeout
logical(4)      bForceAppsClosed
logical(4)      bRebootAfterShutdown   
end function InitiateSystemShutdown
end interface

interface
logical(4) function  AbortSystemShutdown (lpMachineName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AbortSystemShutdownA@4'  :: AbortSystemShutdown
!MS$ ATTRIBUTES REFERENCE :: lpMachineName
character*(*)   lpMachineName
end function AbortSystemShutdown
end interface


!                               ******DDE*******

interface
logical(4) function  DdeSetQualityOfService (hwndClient ,pqosNew ,pqosPrev ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_DdeSetQualityOfService@12' :: DdeSetQualityOfService
!MS$ ATTRIBUTES REFERENCE :: pqosNew
!MS$ ATTRIBUTES REFERENCE :: pqosPrev
use msfwinty
integer(4)                          hwndClient 
type(T_SECURITY_QUALITY_OF_SERVICE) pqosNew 
type(T_SECURITY_QUALITY_OF_SERVICE) pqosPrev 
end function DdeSetQualityOfService
end interface

interface
logical(4) function  ImpersonateDdeClientWindow (hWndClient ,hWndServer ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_ImpersonateDdeClientWindow@8' :: ImpersonateDdeClientWindow
integer hWndClient 
integer hWndServer 
end function ImpersonateDdeClientWindow
end interface

! 
!  * DDE message packing APIs

interface
integer function  PackDDElParam (msg ,uiLo ,uiHi ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_PackDDElParam@12' :: PackDDElParam
integer msg 
integer uiLo 
integer uiHi 
end function PackDDElParam
end interface

interface
logical(4) function  UnpackDDElParam (msg ,lParam ,puiLo ,puiHi ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_UnpackDDElParam@16' :: UnpackDDElParam
integer msg 
integer lParam 
integer puiLo 
integer puiHi 
end function UnpackDDElParam
end interface

interface
logical(4) function  FreeDDElParam (msg ,lParam ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_FreeDDElParam@8' :: FreeDDElParam
integer msg 
integer lParam 
end function FreeDDElParam
end interface

interface
integer function  ReuseDDElParam (lParam ,msgIn ,msgOut ,uiLo ,uiHi ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_ReuseDDElParam@20' :: ReuseDDElParam
integer lParam 
integer msgIn 
integer msgOut 
integer uiLo 
integer uiHi 
end function ReuseDDElParam
end interface


!                               ****DDEML*******
!   DLL registration functions   

interface
integer(4) function  DdeInitialize (pidInst ,pfnCallback ,afCmd ,ulRes ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_DdeInitializeA@16' :: DdeInitialize
integer pidInst 
integer pfnCallback 
integer afCmd  
integer ulRes  
end function DdeInitialize
end interface

interface
logical(4) function  DdeUninitialize (idInst ) 
!MS$ ATTRIBUTES STDCALL, ALIAS:'_DdeUninitialize@4' :: DdeUninitialize
integer idInst 
end function DdeUninitialize
end interface

!  * conversation enumeration functions

interface
integer(4) function  DdeConnectList (idInst ,hszService ,hszTopic ,hConvList ,pCC ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeConnectList@20' :: DdeConnectList
!MS$ ATTRIBUTES REFERENCE :: pCC
use msfwinty
integer             idInst 
integer             hszService 
integer             hszTopic 
integer             hConvList 
type(T_CONVCONTEXT) pCC 
end function DdeConnectList
end interface

interface
integer(4) function  DdeQueryNextServer (hConvList ,hConvPrev ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeQueryNextServer@8' :: DdeQueryNextServer
integer hConvList 
integer hConvPrev 
end function DdeQueryNextServer
end interface

interface
logical(4) function  DdeDisconnectList (hConvList ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeDisconnectList@4' :: DdeDisconnectList
integer hConvList 
end function DdeDisconnectList
end interface

!  * conversation control functions

interface
integer(4) function  DdeConnect (idInst ,hszService ,hszTopic ,pCC ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeConnect@16' :: DdeConnect
!MS$ ATTRIBUTES REFERENCE :: pCC
use msfwinty
integer             idInst 
integer             hszService 
integer             hszTopic 
type(T_CONVCONTEXT) pCC 
end function DdeConnect
end interface

interface
logical(4) function  DdeDisconnect (hConv ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeDisconnect@4' :: DdeDisconnect
integer hConv 
end function DdeDisconnect
end interface

interface
integer(4) function  DdeReconnect (hConv ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeReconnect@4' :: DdeReconnect
integer hConv 
end function DdeReconnect
end interface

interface
integer(4) function  DdeQueryConvInfo (hConv ,idTransaction ,pConvInfo ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeQueryConvInfo@12' :: DdeQueryConvInfo
!MS$ ATTRIBUTES REFERENCE :: pConvInfo
use msfwinty
integer             hConv 
integer             idTransaction 
type(T_CONVINFO)    pConvInfo 
end function DdeQueryConvInfo
end interface

interface
logical(4) function  DdeSetUserHandle (hConv ,id ,hUser ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeSetUserHandle@12' :: DdeSetUserHandle
integer hConv 
integer id 
integer hUser 
end function DdeSetUserHandle
end interface

interface
logical(4) function  DdeAbandonTransaction (idInst ,hConv ,idTransaction ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeAbandonTransaction@12' :: DdeAbandonTransaction
integer idInst 
integer hConv 
integer idTransaction 
end function DdeAbandonTransaction
end interface

!  * app server interface functions

interface
logical(4) function  DdePostAdvise (idInst ,hszTopic ,hszItem ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdePostAdvise@12' :: DdePostAdvise
integer idInst 
integer hszTopic 
integer hszItem 
end function DdePostAdvise
end interface

interface
logical(4) function  DdeEnableCallback (idInst ,hConv ,wCmd ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeEnableCallback@12' :: DdeEnableCallback
integer idInst 
integer hConv 
integer wCmd 
end function DdeEnableCallback
end interface

interface
logical(4) function  DdeImpersonateClient (hConv ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeImpersonateClient@4' :: DdeImpersonateClient
integer hConv 
end function DdeImpersonateClient
end interface


interface
integer(4) function  DdeNameService (idInst ,hsz1 ,hsz2 ,afCmd ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeNameService@16' :: DdeNameService
integer idInst 
integer hsz1 
integer hsz2 
integer afCmd 
end function DdeNameService
end interface

!  * app client interface functions

interface
integer(4) function  DdeClientTransaction (pData ,cbData ,hConv ,hszItem ,wFmt ,wType ,dwTimeout ,pdwResult ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeClientTransaction@32' :: DdeClientTransaction
integer pData 
integer cbData 
integer hConv 
integer hszItem 
integer wFmt 
integer wType 
integer dwTimeout 
integer pdwResult 
end function DdeClientTransaction
end interface

!  *data transfer functions

interface
integer(4) function  DdeCreateDataHandle (idInst ,pSrc ,cb ,cbOff ,hszItem ,wFmt ,afCmd ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeCreateDataHandle@28' :: DdeCreateDataHandle
integer idInst 
integer pSrc 
integer cb 
integer cbOff 
integer hszItem 
integer wFmt 
integer afCmd 
end function DdeCreateDataHandle
end interface

interface
integer*4 function  DdeAddData (hData ,pSrc ,cb ,cbOff ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeAddData@16' :: DdeAddData
integer hData 
integer pSrc 
integer cb 
integer cbOff 
end function DdeAddData
end interface

interface
integer(4) function  DdeGetData (hData ,pDst ,cbMax ,cbOff ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeGetData@16' :: DdeGetData
integer hData 
integer pDst 
integer cbMax 
integer cbOff 
end function DdeGetData
end interface

interface
integer(4) function  DdeAccessData (hData ,pcbDataSize ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeAccessData@8' :: DdeAccessData
integer hData 
integer pcbDataSize 
end function DdeAccessData
end interface

interface
logical(4) function  DdeUnaccessData (hData ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeUnaccessData@4' :: DdeUnaccessData
integer hData 
end function DdeUnaccessData
end interface

interface
logical(4) function  DdeFreeDataHandle (hData ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeFreeDataHandle@4' :: DdeFreeDataHandle
integer hData 
end function DdeFreeDataHandle
end interface

interface
integer(4) function  DdeGetLastError (idInst ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeGetLastError@4' :: DdeGetLastError
integer idInst 
end function DdeGetLastError
end interface

interface
integer(4) function  DdeCreateStringHandle (idInst ,psz ,iCodePage ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeCreateStringHandleA@12' :: DdeCreateStringHandle
!MS$ ATTRIBUTES REFERENCE :: psz
integer         idInst 
character*(*)   psz 
integer         iCodePage 
end function DdeCreateStringHandle
end interface

interface
integer(4) function  DdeQueryString (idInst ,hsz ,psz ,cchMax ,iCodePage ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeQueryStringA@20' :: DdeQueryString
!MS$ ATTRIBUTES REFERENCE :: psz
integer         idInst 
integer         hsz 
character*(*)   psz 
integer         cchMax 
integer         iCodePage 
end function DdeQueryString
end interface

interface
logical(4) function  DdeFreeStringHandle (idInst ,hsz ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeFreeStringHandle@8' :: DdeFreeStringHandle
integer idInst 
integer hsz 
end function DdeFreeStringHandle
end interface

interface
logical(4) function  DdeKeepStringHandle (idInst ,hsz ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeKeepStringHandle@8' :: DdeKeepStringHandle
integer idInst 
integer hsz 
end function DdeKeepStringHandle
end interface

interface
integer(4) function  DdeCmpStringHandles (hsz1 ,hsz2 ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DdeCmpStringHandles@8' :: DdeCmpStringHandles
integer hsz1 
integer hsz2 
end function DdeCmpStringHandles
end interface

!                               ***LZEXPAND*****

interface 
integer function LZStart ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LZStart@0' :: LZStart
end function
end interface

interface
integer function LZDone ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LZDone@0' :: LZDone
end function
end interface

interface 
integer function CopyLZFile (dummy1, dummy2)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_CopyLZFile@8' :: CopyLZFile 
integer dummy1
integer dummy2
end function
end interface

interface 
integer function LZCopy (dummy1, dummy2)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LZCopy@8' :: LZCopy
integer dummy1
integer dummy2
end function
end interface

interface
integer function LZInit (dummy)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LZInit@4' :: LZInit
integer dummy
end function
end interface

interface
integer function GetExpandedName (dummy1, dummy2)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetExpandedNameA@8' :: GetExpandedName
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy2
character*(*)   dummy1
character*(*)   dummy2
end function
end interface

interface
integer function LZOpenFile (dummy1, dummy2, dummy3)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LZOpenFileA@12' :: LZOpenFile
!MS$ ATTRIBUTES REFERENCE :: dummy1
!MS$ ATTRIBUTES REFERENCE :: dummy2
use msfwinty
character*(*)       dummy1
type(T_OFSTRUCT)    dummy2
integer*2           dummy3
end function
end interface

interface
integer function LZSeek (dummy1, dummy2, dummy3)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LZSeek@12' :: LZSeek
integer dummy1
integer dummy2
integer dummy3
end function
end interface

interface
integer function LZClose ()
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LZClose@0' :: LZClose
end function
end interface

!                               ****SCRNSAVE****

!  This function is the Window Procedure for the screen saver.  It is
!  * up to the programmer to handle any of the messages that wish to be
!  * interpretted.  Any unused messages are then passed back to
!  * DefScreenSaverProc if desired which will take default action on any
!  * unprocessed message...

!! User supplied.
!interface
!integer function  ScreenSaverProc  (hWnd ,message ,wParam ,lParam ) 
!!MS$ATTRIBUTES STDCALL, ALIAS : '_ScreenSaverProc@16' :: ScreenSaverProc  
!integer hWnd
!integer message
!integer wParam
!integer lParam
!end function ScreenSaverProc
!end interface

!  This function performs default message processing.  Currently handles
!  * the following messages:
!  *
!  * WM_SYSCOMMAND:   return FALSE if wParam is SC_SCREENSAVE or SC_CLOSE
!  *
!  * WM_DESTROY:      PostQuitMessage(0)
!  *
!  * WM_SETCURSOR:    By default, this will set the cursor to a null cursor,
!  *                  thereby removing it from the screen.
!  *
!  * WM_LBUTTONDOWN:
!  * WM_MBUTTONDOWN:
!  * WM_RBUTTONDOWN:
!  * WM_KEYDOWN:
!  * WM_KEYUP:
!  * WM_MOUSEMOVE:    By default, these will cause the program to terminate.
!  *                  Unless the password option is enabled.  In that case
!  *                  the DlgGetPassword() dialog box is brought up.
!  *
!  * WM_NCACTIVATE:
!  * WM_ACTIVATEAPP:
!  * WM_ACTIVATE:     By default, if the wParam parameter is FALSE (signifying
!  *                  that transfer is being taken away from the application),
!  *                  then the program will terminate.  Termination is
!  *                  accomplished by generating a WM_CLOSE message.  This way,
!  *                  if the user sets something up in the WM_CREATE, a
!  *                  WM_DESTROY will be generated and it can be destroyed
!  *                  properly.
!  *                  This message is ignored, however is the password option
!  *                  is enabled.
!  

interface
integer function  DefScreenSaverProc  (hWnd ,msg ,wParam ,lParam ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DefScreenSaverProc@16' :: DefScreenSaverProc  
integer hWnd
integer msg
integer wParam
integer lParam
end function DefScreenSaverProc
end interface

!  A function is also needed for configuring the screen saver.  The function
!  * should be exactly like it is below and must be exported such that the
!  * program can use MAKEPROCINSTANCE on it and call up a dialog box. Further-
!  * more, the template used for the dialog must be called
!  * ScreenSaverConfigure to allow the main function to access it...
!

! User supplied
!interface
!logical(4) function  ScreenSaverConfigureDialog  (hDlg ,message ,wParam ,lParam ) 
!!MS$ ATTRIBUTES STDCALL, ALIAS : '_ScreenSaverConfigureDialog@16' :: ScreenSaverConfigureDialog  
!integer hDlg
!integer message
!integer wParam
!integer lParam
!end function ScreenSaverConfigureDialog
!end interface

!  To allow the programmer the ability to register child control windows, this
!  * function is called prior to the creation of the dialog box.  Any
!  * registering that is required should be done here, or return TRUE if none
!  * is needed...

! User supplied
!interface
!logical(4) function  RegisterDialogClasses  (hInst ) 
!!MS$ ATTRIBUTES STDCALL, ALIAS : '_RegisterDialogClasses@4' :: RegisterDialogClasses  
!integer hInst
!end function RegisterDialogClasses
!end interface

!  The following functions are called by DefScreenSaverProc and must
!  * be exported by all screensavers using this model.
!  * There are only three other points that should be of notice:
!  * 1) The screen saver must have a string declared as 'szAppName' contaning the
!  *     name of the screen saver, and it must be declared as a global.
!  * 2) The screen saver EXE file should be renamed to a file with a SCR
!  *     extension so that the screen saver dialog from the control panel can
!  *     find it when is searches for screen savers.


!                               ****SHELLAPI****

!  API exports from the library

interface
integer function  DragQueryFile (dummy0,dummy1,dummy2,dummy3) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_DragQueryFileA@16' :: DragQueryFile  
!MS$ ATTRIBUTES REFERENCE :: dummy2
integer         dummy0
integer         dummy1
character*(*)   dummy2
integer         dummy3
end function DragQueryFile
end interface

interface
logical(4) function  DragQueryPoint (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_DragQueryPoint@8' :: DragQueryPoint  
!MS$ ATTRIBUTES REFERENCE :: dummy1
use msfwinty
integer     dummy0
type(T_POINT) dummy1  
end function DragQueryPoint
end interface

interface
subroutine  DragFinish (dummy0) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_DragFinish@4' :: DragFinish  
integer dummy0  
end subroutine DragFinish
end interface

interface
subroutine  DragAcceptFiles (dummy0,dummy1) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_DragAcceptFiles@8' :: DragAcceptFiles  
integer dummy0  
integer dummy1  
end subroutine DragAcceptFiles
end interface

interface
integer function  ExtractIcon (hInst ,lpszExeFileName ,nIconIndex ) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_ExtractIconA@24' :: ExtractIcon  
!MS$ ATTRIBUTES REFERENCE :: lpszExeFileName
integer         hInst  
character*(*)   lpszExeFileName  
integer         nIconIndex  
end function ExtractIcon
end interface


interface
integer function  ShellExecute (hwnd ,lpOperation ,lpFile ,lpParameters ,lpDirectory ,nShowCmd ) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_ShellExecuteA@24' :: ShellExecute  
!MS$ ATTRIBUTES REFERENCE :: lpFile
!MS$ ATTRIBUTES REFERENCE :: lpDirectory
!MS$ ATTRIBUTES REFERENCE :: lpParameters
!MS$ ATTRIBUTES REFERENCE :: lpOperation
integer         hwnd  
character*(*)   lpOperation  
character*(*)   lpFile  
character*(*)   lpParameters  
character*(*)   lpDirectory  
integer         nShowCmd  
end function ShellExecute
end interface


interface
integer function  FindExecutable (lpFile ,lpDirectory ,lpResult ) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_FindExecutableA@12' :: FindExecutable  
!MS$ ATTRIBUTES REFERENCE :: lpFile
!MS$ ATTRIBUTES REFERENCE :: lpResult
!MS$ ATTRIBUTES REFERENCE :: lpDirectory
character*(*)   lpFile  
character*(*)   lpDirectory  
character*(*)   lpResult  
end function FindExecutable
end interface

interface
integer function  ShellAbout (hWnd ,szApp ,szOtherStuff ,hIcon ) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_ShellAboutA@16' :: ShellAbout  
!MS$ ATTRIBUTES REFERENCE :: szApp
!MS$ ATTRIBUTES REFERENCE :: szOtherStuff 
integer         hWnd  
character*(*)   szApp  
character*(*)   szOtherStuff  
integer         hIcon  
end function ShellAbout
end interface


interface
integer function  DuplicateIcon (hInst ,hIcon ) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_DuplicateIcon@8' :: DuplicateIcon  
integer hInst  
integer hIcon  
end function DuplicateIcon
end interface


interface
integer function  ExtractAssociatedIcon (hInst ,lpIconPath ,lpiIcon ) 
!MS$ ATTRIBUTES STDCALL ,ALIAS : '_ExtractAssociatedIconA@16' :: ExtractAssociatedIcon  
!MS$ ATTRIBUTES REFERENCE :: lpIconPath
integer         hInst  
character*(*)   lpIconPath  
integer         lpiIcon  
end function ExtractAssociatedIcon
end interface


!                               *****MACRO*******

interface
integer(2) function HiWord (param) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HiWord@4' :: HiWord 
integer param
end function HiWord
end interface

interface
integer(2) function LoWord (param) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LoWord@4' :: LoWord 
integer param
end function LoWord
end interface

interface
integer(4) function RGB (red, green, blue) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Rgb@12' :: RGB 
BYTE  red
BYTE  green
BYTE  blue
end function RGB
end interface

interface
BYTE function GetRedValue(param) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetRedValue@4' :: GetRedValue
integer param
end function GetRedValue
end interface

interface
BYTE function GetGreenValue(param) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetGreenValue@4' :: GetGreenValue
integer param
end function GetGreenValue
end interface

interface
BYTE function GetBlueValue(param) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetBlueValue@4' :: GetBlueValue
integer param                                               
end function GetBlueValue
end interface

interface
BYTE function HiByte(param) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_HiByte@4' :: HiByte
integer(2)  param
end function HiByte
end interface

interface
BYTE function LoByte (param)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LoByte@4' :: LoByte 
integer(2)  param
end function LoByte
end interface

interface
integer(2)  function LangIDFromLCID (param) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LangIDFromLCID@4' :: LangIDFromLCID 
integer param
end function LangIDFromLCID
end interface

interface
integer(4) function MakeIntAtom (param) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeIntAtom@4' :: MakeIntAtom 
integer*2 param
end function MakeIntAtom
end interface

interface
integer(4) function MakeIntResource (param) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeIntResource@4' :: MakeIntResource 
integer(2) param
end function MakeIntResource
end interface

interface
integer(2) function MakeLangID (usPrimaryLanguage, usSubLanguage) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeLangID@8' :: MakeLangID 
integer*2 usPrimaryLanguage
integer*2 usSubLanguage
end function MakeLangID
end interface


interface
integer(4) function MakeLCID (wLanguageID, wSortID) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeLCID@8' :: MakeLCID 
integer*2 wLanguageID
integer*2 wSortID
end function MakeLCID
end interface

interface
integer(4) function MakeLong (wLow, wHigh) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeLong@8' :: MakeLong 
integer*2 wLow
integer*2 wHigh
end function MakeLong
end interface

interface
integer(4) function MakeLParam (wLow, wHigh) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeLParam@8' :: MakeLParam 
integer*2 wLow
integer*2 wHigh
end function MakeLParam
end interface

interface
integer(4) function MakeLResult (wLow, wHigh) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeLResult@8' :: MakeLResult 
integer wLow
integer wHigh
end function MakeLResult
end interface

interface
subroutine MakePointS (dword, ret_val) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakePoints@8' :: MakePointS 
integer dword
integer ret_val
end subroutine MakePointS
end interface

interface
integer(2) function MakeWord (bLow ,bHigh) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeWord@8' :: MakeWord 
BYTE bLow
BYTE bHigh
end function MakeWord
end interface

interface
integer(4) function MakeWparam (bLow, bHigh) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_MakeWparam@8' :: MakeWparam 
integer(2) bLow
integer(2) bHigh
end function MakeWparam
end interface

interface
integer(4) function PaletteIndex (PalIndex) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PaletteIndex@4' :: PaletteIndex 
integer(2)  PalIndex
end function PaletteIndex
end interface

interface
integer(4) function PaletteRGB (bred, bgreen, bblue)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PaletteRGB@12' :: PaletteRGB 
BYTE  bred, bgreen, bblue
end function PaletteRGB
end interface

interface
subroutine PointsTOPoint (pt, pts) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PointsTOPoint@8' :: PointsTOPoint 
use msfwinty
type (T_POINT)   pt
type (T_POINT)  pts
end subroutine PointsTOPoint
end interface

interface
integer*4 function PointTOPoints (pt) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PointTOPoints@4' :: PointTOPoints 
use msfwinty
type (T_POINT) pt
end function PointTOPoints
end interface

interface
BYTE function PrimaryLangID (usLanguageID)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrimaryLangID@4' :: PrimaryLangID 
integer*2 usLanguageID
end function PrimaryLangID
end interface

interface
BYTE function SubLangID (usLanguageID)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SubLangID@4' :: SubLangID 
integer*2 usLanguageID
end function SubLangID
end interface

interface
integer(2) function SortIDFromLCID (lcid)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SortIDFromLCID@4' :: SortIDFromLCID 
integer lcid
end function SortIDFromLCID
end interface


interface
integer(4) function BType (x) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_BType@4' :: BType 
integer x
end function BType
end interface

interface
integer(4) function IsPtr (x) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsPtr@4' :: IsPtr 
integer x
end function IsPtr
end interface

interface
integer(4) function IsFcn (x)  
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsFcn@4' :: IsFcn 
integer x
end function IsFcn
end interface


interface
integer(4) function IsAry (x)  
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsAry@4' :: IsAry 
integer x
end function IsAry
end interface

interface
integer(4) function IsTag (x)  
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsTag@4' :: IsTag 
integer x
end function IsTag
end interface


interface
integer(4) function IncRef (x)  
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IncRef@4' :: IncRef 
integer x
end function IncRef
end interface

interface
integer(4) function DecRef (x)  
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DecRef@4' :: DecRef 
integer x
end function DecRef
end interface

interface
integer(4) function Image_Snap_By_Ordinal (Ordinal)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Image_Snap_By_Ordinal@4' ::  Image_Snap_By_Ordinal
integer(4) Ordinal
end function Image_Snap_By_Ordinal
end interface


interface
integer(4) function Image_Ordinal (Ordinal)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_Image_Ordinal@4' :: Image_Ordinal
integer(4) Ordinal
end function Image_Ordinal
end interface


interface
integer(4) function SndAlias (c0, c1) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SndAlias@8' :: SndAlias 
character c0, c1
end function SndAlias
end interface

interface
character*4 function mmioFOURCC (c0, c1, c2, c3) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_mmioFOURCC@16' :: mmioFOURCC 
character   c0, c1, c2, c3
end function mmioFOURCC
end interface

interface
subroutine FD_ISSET (fd, set) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FD_ISSET@8' :: FD_ISSET 
integer fd, set
end subroutine FD_ISSET
end interface

interface
subroutine FD_ZERO (set) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FD_ZERO@4' :: FD_ZERO 
integer set
end subroutine FD_ZERO
end interface

interface
subroutine FD_SET (fd, set) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FD_SET@8' :: FD_SET 
integer fd, set
end subroutine FD_SET
end interface

interface
subroutine FD_CLR (fd, set) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FD_CLR@8' :: FD_CLR 
integer fd, set
end subroutine FD_CLR
end interface

interface 
integer*4 function CtlCode(DeviceType,Function,Method,Access) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CtlCode@16' :: CtlCode
integer*4 Devicetype 
integer*4 Function 
integer*4 Method 
integer*4 Access 
end function CtlCode
end interface

interface 
integer*4 function IOW_( x,y,t) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IOW_@12' :: IOW_
character    x 
integer      y 
integer      t 
end function IOW_
end interface


interface
integer*4 function IOR_( x,y,t) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_IOR_@12' :: IOR_
character    x 
integer      y 
integer      t 
end function IOR_
end interface

interface 
subroutine ConvertFilterString(buffer) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ConvertFilterString@4' ::  ConvertFilterString
!MS$ATTRIBUTES REFERENCE :: buffer
character*(*)   buffer 
end subroutine ConvertFilterString
end interface

interface 
real*4 function chartoreal (buffer) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_chartoreal@4' ::  chartoreal
integer*4 buffer 
end function chartoreal
end interface

interface 
integer*4 function chartoint (buffer) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_chartoint@4' :: chartoint
integer*4 buffer 
end function chartoint
end interface

interface 
integer*4 function inttochar (val, string, radix) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_inttochar@12' :: inttochar
!MS$ATTRIBUTES REFERENCE :: string
integer*4       val
character*(*)   string 
integer*4       radix 
end function inttochar
end interface

interface 
integer*4   function SetHandle (lParam) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetHandle@4' :: SetHandle
integer*4    lParam 
end function SetHandle
end interface 

interface
integer(4) function Image_First_Section (ntheader)
!MS$ATTRIBUTES STDCALL, ALIAS : '_Image_First_Section@4' :: Image_First_Section
integer(4)  ntheader
end function Image_First_Section
end interface

interface 
integer(4) function memcmp ( buf1, buf2, count)
!MS$ATTRIBUTES STDCALL, ALIAS : '_fmemcmpr@12' :: memcmp
integer*4   buf1 
integer*4   buf2 
integer*4   count 
end function memcmp
end interface

interface 
integer(4) function convertFtoCstring(cstring,fstring);
!MS$ATTRIBUTES STDCALL, ALIAS : '_convertFtoCstring@8' :: convertFtoCstring
!MS$ATTRIBUTES REFERENCE::cstring
character *(*)  cstring
integer       fstring 
end function convertFtoCstring
end interface

interface 
integer(4) function CheckIfNULL(Ptr)
!MS$ATTRIBUTES STDCALL, ALIAS : '_CheckIfNULL@4' :: CheckIfNULL
!MS$ATTRIBUTES REFERENCE::Ptr
integer       Ptr
end function CheckIfNULL
end interface


!                               ********WINVER*********

interface 
integer function VerFindFile ( uFlags, szFileName, szWindir, szAppDir, szCurDir, lpuCurDirLen, szDestDir, lpuDestDirLen)
!MS$ ATTRIBUTES STDCALL,ALIAS:"_VerFindFileA@32" :: VerFindFile 
!MS$ ATTRIBUTES REFERENCE :: szFileName
!MS$ ATTRIBUTES REFERENCE :: szWindir
!MS$ ATTRIBUTES REFERENCE :: szAppDir
!MS$ ATTRIBUTES REFERENCE :: szCurDir
!MS$ ATTRIBUTES REFERENCE :: szDestDir 
integer*4       uFlags 
character*(*)   szFileName 
character*(*)   szWinDir 
character*(*)   szAppDir 
character*(*)   szCurDir 
integer*4       lpuCurDirLen 
character*(*)   szDestDir 
integer*4       lpuDestDirLen 
end function  VerFindFile
end interface

interface 
integer function VerInstallFile ( uFlags, szSrcFileName, szDestFileName, szSrcDir, szDestDir, szCurDir, szTmpFile, &
         lpuTmpFileLen )
!MS$ATTRIBUTES STDCALL, ALIAS :"_VerInstallFileA@32" :: VerInstallFile 
!MS$ ATTRIBUTES REFERENCE :: szSrcFileName
!MS$ ATTRIBUTES REFERENCE :: szDestFileName
!MS$ ATTRIBUTES REFERENCE :: szSrcDir
!MS$ ATTRIBUTES REFERENCE :: szDestDir
!MS$ ATTRIBUTES REFERENCE :: szCurDir
!MS$ ATTRIBUTES REFERENCE :: szTmpFile
integer*4       uFlags 
character*(*)   szSrcFileName 
character*(*)   szDestFileName 
character*(*)   szSrcDir 
character*(*)   szDestDir
character*(*)   szCurDir 
character*(*)   szTmpFile
integer*4       lpuTmpFileLen 
end function VerInstallFile
end interface

interface 
integer function GetFileVersionInfoSize (lptstrFileName,  lpdwHandle)                                                                        
!MS$ATTRIBUTES STDCALL, ALIAS :"_GetFileVersionInfoSizeA@8" :: GetFileVersionInfoSize
!MS$ ATTRIBUTES REFERENCE :: lptstrFilename
character*(*)   lptstrFilename  !/* Filename of version stamped file */
integer*4       lpdwHandle 
end function GetFileVersionInfoSize
end interface

interface 
integer function GetFileVersionInfo(lptstrFileName,dwHandle, dwLen, lpData)
!MS$ATTRIBUTES STDCALL, ALIAS:"_GetFileVersionInfoA@16" :: GetFileVersionInfo
!MS$ ATTRIBUTES REFERENCE :: lptstrFilename
character*(*)   lptstrFilename  !/* Filename of version stamped file */
integer*4       dwHandle        !/* Information from GetFileVersionSize */
integer*4       dwLen           !/* Length of buffer for info */
integer*4       lpData          !/* Buffer to place the data structure */
end function GetFileVersionInfo
end interface

interface 
integer function VerLanguageName (wLang, szLang, nSize)
!MS$ATTRIBUTES STDCALL, ALIAS :"_VerLanguageNameA@12" :: VerLanguageName
!MS$ ATTRIBUTES REFERENCE :: szLang
integer*4       wLang  
character*(*)   szLang 
integer*4       nSize  
end function VerLanguageName
end interface

interface 
integer function VersionQueryValue (pBlock, lpSubBlock, lpBuffer, puLen)
!MS$ATTRIBUTES STDCALL, ALIAS :"_VersionQueryValueS@16" :: VersionQueryValue
integer*4   pBlock 
integer*4   lpSubBlock 
integer*4   lpBuffer 
integer*4   puLen 
end function VersionQueryValue
end interface

interface
logical(4) function VerQueryValue (pBlock, lpSubBlock, lplpBuffer, puLen)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VerQueryValueA@16' :: VerQueryValue
!MS$ ATTRIBUTES REFERENCE :: lpSubBlock
integer         pBlock
character*(*)   lpSubBlock
integer         lplpBuffer
integer         puLen
end function VerQueryValue
end interface


!                               *****WINNLS******


interface
logical(4) function  IsValidCodePage (CodePage ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsValidCodePage@4' :: IsValidCodePage
integer CodePage
end function IsValidCodePage
end interface

interface
integer(4) function  GetACP () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetACP@0' :: GetACP
end function GetACP
end interface

interface
integer(4) function  GetOEMCP () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetOEMCP@0' :: GetOEMCP 
end function GetOEMCP
end interface

interface
logical(4) function  GetCPInfo (CodePage ,lpCPInfo ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetCPInfo@8' :: GetCPInfo 
!MS$ ATTRIBUTES REFERENCE :: lpCPInfo
use msfwinty
integer         CodePage
type(T_CPINFO)  lpCPInfo
end function GetCPInfo
end interface

interface
logical(4) function  IsDBCSLeadByte (TestChar ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_IsDBCSLeadByte@4' :: IsDBCSLeadByte 
character TestChar
end function IsDBCSLeadByte
end interface

interface
integer(4) function CompareString (Locale, dwCmpFlags, lpStringa, cchCounta, lpStringb, cchCountb) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CompareStringA@24' :: CompareString
!MS$ ATTRIBUTES REFERENCE :: lpStringa
!MS$ ATTRIBUTES REFERENCE :: lpStringb
integer(4)      Locale
integer(4)      dwCmpFlags
character*(*)   lpStringa
integer(4)      cchCounta
character*(*)   lpStringb
integer(4)      cchCountb
end function CompareString
end interface

interface
integer(4) function LCMapString (Locale, dwMapFlags, lpSrcStr, cchSrc, lpDestStr, cchDest)
!MS$ATTRIBUTES STDCALL, ALIAS : '_LCMapStringA@24' :: LCMapString
!MS$ ATTRIBUTES REFERENCE :: lpSrcStr
!MS$ ATTRIBUTES REFERENCE :: lpDestStr
integer(4)      Locale
integer(4)      dwMapFlags
character*(*)   lpSrcStr
integer(4)      cchSrc
character*(*)   lpDestStr
integer(4)      cchDest
end function LCMapString
end interface

interface
integer(4) function GetLocaleInfo (Locale, LCType, lpLCData, cchData)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetLocaleInfoA@16' :: GetLocaleInfo
!MS$ ATTRIBUTES REFERENCE :: lpLCData
integer(4)      Locale
integer(4)      LCType
character*(*)   lpLCData
integer(4)  cchData
end function GetLocaleInfo
end interface

interface
logical(4) function SetLocaleInfo (Locale, LCType, lpLCData)
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetLocaleInfoA@12' :: SetLocaleInfo
!MS$ ATTRIBUTES REFERENCE :: lpLCData
integer(4)      Locale
integer(4)      LCType
character*(*)   lpLCData
end function SetLocaleInfo
end interface

interface
integer(4) function GetTimeFormat (Locale, dwFlags, lpTime, lpFormat, lpTimeStr, cchTime)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetTimeFormatA@24' :: GetTimeFormat
!MS$ATTRIBUTES REFERENCE :: lpTime
!MS$ATTRIBUTES REFERENCE :: lpFormat
!MS$ATTRIBUTES REFERENCE :: lpTimeStr
use msfwinty
integer(4)          Locale
integer(4)          dwFlags
type(T_SYSTEMTIME)  lpTime
character*(*)       lpFormat
character*(*)       lpTimeStr
integer(4)          cchTime
end function GetTimeFormat
end interface

interface
integer(4) function GetDateFormat (Locale, dwFlags, lpDate, lpFormat, lpDateStr, cchDate)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDateFormatA@24' :: GetDateFormat
!MS$ATTRIBUTES REFERENCE :: lpDate
!MS$ATTRIBUTES REFERENCE :: lpFormat
!MS$ATTRIBUTES REFERENCE :: lpDateStr
use msfwinty
integer(4)          Locale
integer(4)          dwFlags
type(T_SYSTEMTIME)  lpDate
character*(*)       lpFormat
character*(*)       lpDateStr
integer(4)          cchDate
end function GetDateFormat
end interface

interface 
integer(4) function GetNumberFormat (Locale, dwFlags, lpValue, lpFormat, lpNumberStr, cchNumber)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetNumberFormatA@24' :: GetNumberFormat
!MS$ATTRIBUTES REFERENCE :: lpValue
!MS$ATTRIBUTES REFERENCE :: lpFormat
!MS$ATTRIBUTES REFERENCE :: lpNumberStr
use msfwinty
integer(4)          Locale
integer(4)          dwFlags
character*(*)       lpValue
type(T_NUMBERFMT)   lpFormat
character*(*)       lpNumberStr
integer(4)          cchNumber
end function GetNumberFormat
end interface


interface 
integer(4) function GetCurrencyFormat (Locale, dwFlags, lpValue, lpFormat, lpCurrencyStr, cchCurrency)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetCurrencyFormatA@24' :: GetCurrencyFormat
!MS$ATTRIBUTES REFERENCE :: lpValue
!MS$ATTRIBUTES REFERENCE :: lpFormat
!MS$ATTRIBUTES REFERENCE :: lpCurrencyStr
use msfwinty
integer(4)          Locale
integer(4)          dwFlags
character*(*)       lpValue
type(T_CURRENCYFMT) lpFormat
character*(*)       lpCurrencyStr
integer(4)          cchCurrency
end function GetCurrencyFormat
end interface


interface
logical(4) function EnumCalendarInfo (lpCalInfoEnumProc, Locale, Calendar, CalType)
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumCalendarInfoA@16' :: EnumCalendarInfo
integer(4)  lpCalInfoEnumProc
integer(4)  Locale
integer(4)  Calendar
integer(4)  CalType
end function EnumCalendarInfo
end interface

interface
logical(4) function EnumTimeFormats (lpTimeFmtEnumProc, Locale, dwFlags)
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumTimeFormatsA@12' :: EnumTimeFormats
integer(4)  lpTimeFmtEnumProc
integer(4)  Locale
integer(4)  dwFlags
end function EnumTimeFormats
end interface


interface
logical(4) function EnumDateFormats (lpDateFmtEnumProc, Locale, dwFlags)
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumDateFormatsA@12' :: EnumDateFormats
integer(4)  lpDateFmtEnumProc
integer(4)  Locale
integer(4)  dwFlags
end function EnumDateFormats
end interface

interface
logical(4) function IsValidLocale (Locale, dwFlags)
!MS$ATTRIBUTES STDCALL, ALIAS : '_IsValidLocale@8' :: IsValidLocale
integer(4)  Locale
integer(4)  dwFlags
end function IsValidLocale
end interface

interface
integer(4) function ConvertDefaultLocale (Locale)
!MS$ATTRIBUTES STDCALL, ALIAS : '_ConvertDefaultLocale@4' :: ConvertDefaultLocale
integer(4) Locale
end function ConvertDefaultLocale
end interface

!  *  Locale Dependent APIs.

interface
integer(4) function  GetThreadLocale ( ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetThreadLocale@0' :: GetThreadLocale
end function GetThreadLocale
end interface

interface
logical(4) function  SetThreadLocale (Locale        ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetThreadLocale@4' :: SetThreadLocale
integer Locale   
end function SetThreadLocale
end interface

interface
integer(2) function  GetSystemDefaultLangID () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSystemDefaultLangID@0' :: GetSystemDefaultLangId
end function GetSystemDefaultLangID
end interface

interface
integer(2) function  GetUserDefaultLangID () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetUserDefaultLangID@0' :: GetUserDefaultLangID
end function GetUserDefaultLangID
end interface

interface
integer(4) function  GetSystemDefaultLCID () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetSystemDefaultLCID@0' :: GetSystemDefaultLCID
end function GetSystemDefaultLCID
end interface

interface
integer(4) function  GetUserDefaultLCID () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetUserDefaultLCID@0' :: GetUserDefaultLCID
end function GetUserDefaultLCID
end interface

!  *  Locale Independent APIs.

interface
logical(4) function GetStringTypeEx (Locale, dwInfoType, lpSrcStr, cchSrc, lpCharType)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetStringTypeExA@20' :: GetStringTypeEx
!MS$ATTRIBUTES REFERENCE :: lpSrcStr
integer(4)      Locale
integer(4)      dwInfoType
character*(*)   lpSrcStr
integer(4)      cchSrc
integer(4)      lpCharType
end function GetStringTypeEx
end interface

interface
logical(4) function GetStringType (Locale, dwInfoType, lpSrcStr, cchSrc, lpCharType)
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetStringTypeA@20' :: GetStringType
!MS$ATTRIBUTES REFERENCE :: lpSrcStr
integer(4)      Locale
integer(4)      dwInfoType
character*(*)   lpSrcStr
integer(4)      cchSrc
integer(4)      lpCharType
end function GetStringType
end interface


interface
integer(4) function FoldString (dwMapFlags, lpSrcStr, cchSrc, lpDestStr, cchDest)
!MS$ATTRIBUTES STDCALL, ALIAS : '_FoldStringA@20' :: FoldString
!MS$ATTRIBUTES REFERENCE :: lpSrcStr
!MS$ATTRIBUTES REFERENCE :: lpDestStr
integer(4)      dwMapFlags
character*(*)   lpSrcStr
integer(4)      cchSrc
character*(*)   lpDestStr
integer(4)      cchDest
end function FoldString
end interface


interface
logical(4) function EnumSystemLocales (lpLocalePageEnumProc, dwFlags)
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumSystemLocalesA@8' :: EnumSystemLocales
integer(4)  lpLocalePageEnumProc
integer(4)  dwFlags
end function EnumSystemLocales
end interface

interface
logical(4) function EnumSystemCodePages (lpCodePageEnumProc, dwFlags)
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumSystemCodePagesA@8' :: EnumSystemCodePages
integer(4)  lpCodePageEnumProc
integer(4)  dwFlags
end function EnumSystemCodePages
end interface


!                               *****WINSPOOL******

interface
logical(4) function  EnumPrinters (Flags ,Name ,Level ,pPrinterEnum ,cbBuf ,pcbNeeded ,pcReturned ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumPrintersA@28' :: EnumPrinters 
!MS$ ATTRIBUTES REFERENCE :: Name
integer         Flags
character*(*)   Name
integer         Level
integer         pPrinterEnum
integer         cbBuf
integer         pcbNeeded
integer         pcReturned   
end function EnumPrinters
end interface

interface
logical(4) function  OpenPrinter (pPrinterName ,phPrinter ,pDefault) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_OpenPrinterA@12' :: OpenPrinter 
!MS$ ATTRIBUTES REFERENCE  :: pPrinterName
!MS$ ATTRIBUTES REFERENCE  :: pDefault
use msfwinty
character*(*)               pPrinterName
integer                     phPrinter
type(T_PRINTER_DEFAULTS)    pDefault   
end function OpenPrinter
end interface

interface
logical(4) function  ResetPrinter (hPrinter ,pDefault ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ResetPrinterA@8' :: ResetPrinter 
!MS$ ATTRIBUTES REFERENCE :: pDefault
use msfwinty
integer                     hPrinter
type(T_PRINTER_DEFAULTS)    pDefault   
end function ResetPrinter
end interface


interface
logical(4) function  SetJob (hPrinter ,JobId ,Level ,pJob ,Command ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetJobA@20' :: SetJob
integer hPrinter
integer JobId
integer Level
integer pJob
integer Command   
end function SetJob
end interface


interface
logical(4) function  GetJob (hPrinter ,JobId ,Level ,pJob ,cbBuf ,pcbNeeded) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetJobA@24' :: GetJob 
integer hPrinter
integer JobId
integer Level
integer pJob
integer cbBuf
integer pcbNeeded   
end function GetJob
end interface

interface
logical(4) function  EnumJobs (hPrinter ,FirstJob ,NoJobs ,Level ,pJob ,cbBuf ,pcbNeeded ,pcReturned ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumJobsA@32' :: EnumJobs 
integer hPrinter
integer FirstJob
integer NoJobs
integer Level
integer pJob
integer cbBuf
integer pcbNeeded
integer pcReturned   
end function EnumJobs
end interface

interface
integer(4) function  AddPrinter (pName ,Level ,pPrinter ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddPrinterA@12' :: AddPrinter 
!MS$ ATTRIBUTES REFERENCE :: pName
character*(*)   pName
integer         Level
integer         pPrinter   
end function AddPrinter
end interface


interface
logical(4) function  DeletePrinter (hPrinter  ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeletePrinter' :: DeletePrinter 
integer hPrinter   
end function DeletePrinter
end interface

interface
logical(4) function  SetPrinter (hPrinter ,Level ,pPrinter ,Command ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetPrinterA@16' :: SetPrinter 
integer hPrinter
integer Level
integer pPrinter
integer Command   
end function SetPrinter
end interface


interface
logical(4) function  GetPrinter (hPrinter ,Level ,pPrinter ,cbBuf ,pcbNeeded ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPrinterA@20' :: GetPrinter 
integer hPrinter
integer Level
integer pPrinter
integer cbBuf
integer pcbNeeded   
end function GetPrinter
end interface


interface
logical(4) function  AddPrinterDriver (pName ,Level ,pDriverInfo) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddPrinterDriverA@12' :: AddPrinterDriver 
!MS$ ATTRIBUTES REFERENCE :: pName
character*(*)   pName
integer         Level
integer         pDriverInfo   
end function AddPrinterDriver
end interface


interface
logical(4) function  EnumPrinterDrivers (pName ,pEnvironment ,Level ,pDriverInfo ,cbBuf ,pcbNeeded ,pcReturned) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumPrinterDriversA@28' :: EnumPrinterDrivers 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
character*(*)   pName
character*(*)   pEnvironment
integer         Level
integer         pDriverInfo
integer         cbBuf
integer         pcbNeeded
integer         pcReturned   
end function EnumPrinterDrivers
end interface


interface
logical(4) function  GetPrinterDriver (hPrinter ,pEnvironment ,Level ,pDriverInfo ,cbBuf ,pcbNeeded ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPrinterDriverA@24' :: GetPrinterDriver 
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
integer         hPrinter
character*(*)   pEnvironment
integer         Level
integer         pDriverInfo
integer         cbBuf
integer         pcbNeeded   
end function GetPrinterDriver
end interface


interface
logical(4) function  GetPrinterDriverDirectory (pName ,pEnvironment ,Level ,pDriverDirectory ,cbBuf ,pcbNeeded ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPrinterDriverDirectoryA@24' :: GetPrinterDriverDirectory 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
character*(*)   pName
character*(*)   pEnvironment
integer         Level
integer         pDriverDirectory
integer         cbBuf
integer         pcbNeeded   
end function GetPrinterDriverDirectory
end interface


interface
logical(4) function  DeletePrinterDriver (pName ,pEnvironment ,pDriverName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeletePrinterDriverA@12' :: DeletePrinterDriver 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
!MS$ ATTRIBUTES REFERENCE :: pDriverName
character*(*)   pName
character*(*)   pEnvironment
character*(*)   pDriverName   
end function DeletePrinterDriver
end interface

interface
logical(4) function  AddPrintProcessor (pName ,pEnvironment ,pPathName ,pPrintProcessorName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddPrintProcessorA@16' :: AddPrintProcessor 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
!MS$ ATTRIBUTES REFERENCE :: pPathName
!MS$ ATTRIBUTES REFERENCE :: pPrintProcessorName
character*(*)   pName
character*(*)   pEnvironment
character*(*)   pPathName
character*(*)   pPrintProcessorName   
end function AddPrintProcessor
end interface


interface
logical(4) function  EnumPrintProcessors (pName ,pEnvironment ,Level ,pPrintProcessorInfo ,cbBuf ,pcbNeeded ,pcReturned ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumPrintProcessorsA@28' :: EnumPrintProcessors 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
character*(*)   pName
character*(*)   pEnvironment
integer         Level
integer         pPrintProcessorInfo
integer         cbBuf
integer         pcbNeeded
integer         pcReturned   
end function EnumPrintProcessors
end interface


interface
logical(4) function  GetPrintProcessorDirectory (pName ,pEnvironment ,Level ,pPrintProcessorInfo ,cbBuf ,pcbNeeded ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPrintProcessorDirectoryA@24' :: GetPrintProcessorDirectory 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
character*(*)   pName
character*(*)   pEnvironment
integer         Level
integer         pPrintProcessorInfo
integer         cbBuf
integer         pcbNeeded   
end function GetPrintProcessorDirectory
end interface


interface
logical(4) function EnumPrintProcessorDatatypes (pName,pEnvironment,Level,pPrintProcessorInfo,cbBuf,pcbNeeded,pcReturned) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumPrintProcessorDatatypesA@28' :: EnumPrintProcessorDatatypes 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
character*(*)   pName
character*(*)   pEnvironment
integer         Level
integer         pPrintProcessorInfo
integer         cbBuf
integer         pcbNeeded
integer         pcReturned
end function EnumPrintProcessorDatatypes
end interface


interface
logical(4) function  DeletePrintProcessor (pName ,pEnvironment ,pPrintProcessorName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeletePrintProcessorA@12' :: DeletePrintProcessor 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
!MS$ ATTRIBUTES REFERENCE :: pPrintProcessorName
character*(*)   pName
character*(*)   pEnvironment
character*(*)   pPrintProcessorName   
end function DeletePrintProcessor
end interface


interface
integer(4) function  StartDocPrinter (hPrinter ,Level ,pDocInfo ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StartDocPrinterA@12' :: StartDocPrinter 
integer hPrinter
integer Level
integer pDocInfo   
end function StartDocPrinter
end interface

interface
logical(4) function  StartPagePrinter (hPrinter) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_StartPagePrinter@4' :: StartPagePrinter 
integer hPrinter   
end function StartPagePrinter
end interface


interface
logical(4) function  WritePrinter (hPrinter ,pBuf ,cbBuf ,pcWritten ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WritePrinter@16' :: WritePrinter 
integer hPrinter
integer pBuf
integer cbBuf
integer pcWritten   
end function WritePrinter
end interface

interface
logical(4) function  EndPagePrinter (hPrinter) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EndPagePrinter@4' :: EndPagePrinter 
integer hPrinter   
end function EndPagePrinter
end interface


interface
logical(4) function  AbortPrinter (hPrinter)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AbortPrinter@4' :: AbortPrinter 
integer hPrinter   
end function AbortPrinter
end interface

interface
logical(4) function  ReadPrinter (hPrinter ,pBuf ,cbBuf ,pNoBytesRead ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ReadPrinter@16' :: ReadPrinter 
integer hPrinter
integer pBuf
integer cbBuf
integer pNoBytesRead   
end function ReadPrinter
end interface

interface
logical(4) function  EndDocPrinter (hPrinter ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EndDocPrinter@4' :: EndDocPrinter 
integer hPrinter   
end function EndDocPrinter
end interface


interface
logical(4) function  AddJob (hPrinter ,Level ,pData ,cbBuf ,pcbNeeded) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddJobA@20' :: AddJob 
integer hPrinter
integer Level
integer pData
integer cbBuf
integer pcbNeeded   
end function AddJob
end interface


interface
logical(4) function  ScheduleJob (hPrinter ,JobId ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ScheduleJob@8' :: ScheduleJob 
integer hPrinter
integer JobId   
end function ScheduleJob
end interface

interface
logical(4) function  PrinterProperties (hWnd ,hPrinter) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrinterProperties@8' :: PrinterProperties 
integer hWnd
integer hPrinter   
end function PrinterProperties
end interface

interface
integer(4) function  DocumentProperties (hWnd ,hPrinter ,pDeviceName ,pDevModeOutput ,pDevModeInput ,fMode ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DocumentPropertiesA@24' :: DocumentProperties 
!MS$ ATTRIBUTES REFERENCE :: pDeviceName
!MS$ ATTRIBUTES REFERENCE :: pDevModeOutput
!MS$ ATTRIBUTES REFERENCE :: pDevModeInput
use msfwinty
integer         hWnd
integer         hPrinter
character*(*)   pDeviceName
type(T_DEVMODE) pDevModeOutput
type(T_DEVMODE) pDevModeInput
integer         fMode   
end function DocumentProperties
end interface


interface
integer(4) function  AdvancedDocumentProperties (hWnd ,hPrinter ,pDeviceName ,pDevModeOutput ,pDevModeInput ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AdvancedDocumentPropertiesA@20' :: AdvancedDocumentProperties 
!MS$ ATTRIBUTES REFERENCE :: pDeviceName
!MS$ ATTRIBUTES REFERENCE :: pDevModeOutput
!MS$ ATTRIBUTES REFERENCE :: pDevModeInput
use msfwinty
integer         hWnd
integer         hPrinter
character*(*)   pDeviceName
type(T_DEVMODE) pDevModeOutput
type(T_DEVMODE) pDevModeInput
end function AdvancedDocumentProperties
end interface


interface
integer(4) function  GetPrinterData (hPrinter ,pValueName ,pType ,pData ,nSize ,pcbNeeded) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetPrinterDataA@24' :: GetPrinterData 
!MS$ ATTRIBUTES REFERENCE :: pValueName
integer         hPrinter
character*(*)   pValueName
integer         pType
integer         pData
integer         nSize
integer         pcbNeeded   
end function GetPrinterData
end interface


interface
integer(4) function  SetPrinterData (hPrinter ,pValueName ,Type ,pData ,cbData ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetPrinterDataA@20' :: SetPrinterData 
!MS$ ATTRIBUTES REFERENCE :: pValueName
integer         hPrinter
character*(*)   pValueName
integer         Type
integer         pData
integer         cbData   
end function SetPrinterData
end interface


interface
integer(4) function  WaitForPrinterChange (hPrinter ,Flags ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WaitForPrinterChange@8' :: WaitForPrinterChange 
integer hPrinter
integer Flags   
end function WaitForPrinterChange
end interface

interface
integer(4) function FindFirstPrnChangeNotification (hPrinter, fdwFlags, fdwOptions, pvReserved)
!MS$ATTRIBUTES STDCALL, ALIAS : '_FindFirstPrinterChangeNotification@16' :: FindFirstPrnChangeNotification
integer(4)     hPrinter
integer(4)     fdwFlags
integer(4)     fdwOptions
integer(4)     pvReserved
end function FindFirstPrnChangeNotification
end interface

interface
logical(4) function FindNextPrnChangeNotification (hChange, pdwChange, dwReserved, pvReserved)
!MS$ATTRIBUTES STDCALL, ALIAS : '_FindNextPrinterChangeNotification@16' :: FindNextPrnChangeNotification
integer(4)     hChange
integer(4)     pdwChange
integer(4)     dwReserved
integer(4)     pvReserved
end function FindNextPrnChangeNotification
end interface

interface 
logical(4) function FindClosePrnChangeNotification (hChange)
!MS$ATTRIBUTES STDCALL, ALIAS : '_FindClosePrinterChangeNotification@4' :: FindClosePrnChangeNotification
integer(4)  hChange
end function FindClosePrnChangeNotification
end interface


interface
integer(4) function  PrinterMessageBox (hPrinter ,Error ,hWnd ,pText ,pCaption ,dwType ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_PrinterMessageBoxA@24' :: PrinterMessageBox 
!MS$ ATTRIBUTES REFERENCE :: pText
!MS$ ATTRIBUTES REFERENCE :: pCaption
integer         hPrinter
integer         Error
integer         hWnd
character*(*)   pText
character*(*)   pCaption
integer         dwType   
end function PrinterMessageBox
end interface

interface
logical(4) function  ClosePrinter (hPrinter ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ClosePrinter@4' :: ClosePrinter 
integer hPrinter   
end function ClosePrinter
end interface


interface
logical(4) function  AddForm (hPrinter ,Level ,pForm ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddFormA@12' :: AddForm 
!MS$ ATTRIBUTES REFERENCE :: pForm
use msfwinty
integer             hPrinter
integer             Level
type(T_FORM_INFO_1) pForm   
end function AddForm
end interface


interface
logical(4) function  DeleteForm (hPrinter ,pFormName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteFormA@8' :: DeleteForm 
!MS$ ATTRIBUTES REFERENCE :: pFormName
integer         hPrinter
character*(*)   pFormName   
end function DeleteForm
end interface


interface
logical(4) function  GetForm (hPrinter ,pFormName ,Level ,pForm ,cbBuf ,pcbNeeded ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_GetFormA@24' :: GetForm 
!MS$ ATTRIBUTES REFERENCE :: pFormName
!MS$ ATTRIBUTES REFERENCE :: pForm
use msfwinty
integer             hPrinter
character*(*)       pFormName
integer             Level
type(T_FORM_INFO_1) pForm   
integer             cbBuf
integer             pcbNeeded   
end function GetForm
end interface

interface
logical(4) function  SetForm (hPrinter ,pFormName ,Level ,pForm ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_SetFormA@16' :: SetForm 
!MS$ ATTRIBUTES REFERENCE :: pFormName
!MS$ ATTRIBUTES REFERENCE :: pForm
use msfwinty
integer             hPrinter
character*(*)       pFormName
integer             Level
type(T_FORM_INFO_1) pForm   
end function SetForm
end interface

interface
logical(4) function  EnumForms (hPrinter ,Level ,pForm ,cbBuf ,pcbNeeded ,pcReturned ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumFormsA@24' :: EnumForms 
!MS$ ATTRIBUTES REFERENCE :: pForm
use msfwinty
integer             hPrinter
integer             Level
type(T_FORM_INFO_1) pForm   
integer             cbBuf
integer             pcbNeeded
integer             pcReturned   
end function EnumForms
end interface


interface
logical(4) function  EnumMonitors (pName ,Level ,pMonitors ,cbBuf ,pcbNeeded ,pcReturned ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumMonitorsA@24' :: EnumMonitors 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pMonitors
use msfwinty
character*(*)           pName
integer                 Level
type(T_MONITOR_INFO_1)  pMonitors
integer                 cbBuf
integer                 pcbNeeded
integer                 pcReturned   
end function EnumMonitors
end interface


interface
logical(4) function  AddMonitor (pName ,Level ,pMonitors ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddMonitorA@12' :: AddMonitor 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pMonitors
use msfwinty
character*(*)           pName
integer                 Level
type(T_MONITOR_INFO_2)  pMonitors   
end function AddMonitor
end interface


interface
logical(4) function  DeleteMonitor (pName ,pEnvironment ,pMonitorName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeleteMonitorA@12' :: DeleteMonitor 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
!MS$ ATTRIBUTES REFERENCE :: pMonitorName
character*(*)           pName
character*(*)           pEnvironment
character*(*)           pMonitorName   
end function DeleteMonitor
end interface


interface
logical(4) function  EnumPorts (pName ,Level ,pPorts ,cbBuf ,pcbNeeded ,pcReturned ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_EnumPortsA@24' :: EnumPorts 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pPorts
use msfwinty
character*(*)       pName
integer             Level
type(T_PORT_INFO_1) pPorts
integer             cbBuf
integer             pcbNeeded
integer             pcReturned   
end function EnumPorts
end interface


interface
logical(4) function  AddPort (pName ,hWnd ,pMonitorName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddPortA@12' :: AddPort 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pMonitorName
character*(*)       pName
integer             hWnd
character*(*)       pMonitorName   
end function AddPort
end interface


interface
logical(4) function  ConfigurePort (pName ,hWnd ,pPortName) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ConfigurePortA@12' :: ConfigurePort 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pPortName
character*(*)   pName
integer         hWnd
character*(*)   pPortName   
end function ConfigurePort
end interface


interface
logical(4) function  DeletePort (pName ,hWnd ,pPortName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeletePortA@12' :: DeletePort 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pPortName
character*(*)   pName
integer         hWnd
character*(*)   pPortName   
end function DeletePort
end interface


interface
logical(4) function  AddPrinterConnection (pName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddPrinterConnectionA@4' :: AddPrinterConnection 
!MS$ ATTRIBUTES REFERENCE :: pName
character*(*)   pName
end function AddPrinterConnection
end interface


interface
logical(4) function  DeletePrinterConnection (pName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeletePrinterConnectionA@4' :: DeletePrinterConnection 
!MS$ ATTRIBUTES REFERENCE :: pName
character*(*)   pName
end function DeletePrinterConnection
end interface


interface
integer(4) function  ConnectToPrinterDlg (hwnd ,Flags) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ConnectToPrinterDlg@8' :: ConnectToPrinterDlg 
integer hwnd
integer Flags   
end function ConnectToPrinterDlg
end interface

interface
logical(4) function  AddPrintProvidor (pName ,Level ,pProvidorInfo ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_AddPrintProvidorA@12' :: AddPrintProvidor 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pProvidorInfo
use msfwinty
character*(*)           pName
integer                 Level
type(T_PROVIDOR_INFO_1) pProvidorInfo   
end function AddPrintProvidor
end interface


interface
logical(4) function  DeletePrintProvidor (pName ,pEnvironment ,pPrintProvidorName ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DeletePrintProvidorA@12' :: DeletePrintProvidor 
!MS$ ATTRIBUTES REFERENCE :: pName
!MS$ ATTRIBUTES REFERENCE :: pEnvironment
!MS$ ATTRIBUTES REFERENCE :: pPrintProvidorName
character*(*)   pName
character*(*)   pEnvironment
character*(*)   pPrintProvidorName   
end function DeletePrintProvidor
end interface

!                               *****WINSVC******

!
!  Prototype for the Service Control Handler Function
! 

interface
logical(4) function  ChangeServiceConfig (hService ,dwServiceType ,dwStartType ,dwErrorControl ,lpBinaryPathName ,lpLoadOrderGroup ,  &
        lpdwTagId ,lpDependencies ,lpServiceStartName ,lpPassword ,lpDisplayName  ) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ChangeServiceConfigA@44' :: ChangeServiceConfig
!MS$ ATTRIBUTES REFERENCE :: lpBinaryPathName
!MS$ ATTRIBUTES REFERENCE :: lpLoadOrderGroup
!MS$ ATTRIBUTES REFERENCE :: lpDependencies
!MS$ ATTRIBUTES REFERENCE :: lpServiceStartName
!MS$ ATTRIBUTES REFERENCE :: lpPassword
!MS$ ATTRIBUTES REFERENCE :: lpDisplayName 
integer         hService
integer         dwServiceType
integer         dwStartType
integer         dwErrorControl
character*(*)   lpBinaryPathName
character*(*)   lpLoadOrderGroup
integer         lpdwTagId
character*(*)   lpDependencies
character*(*)   lpServiceStartName
character*(*)   lpPassword
character*(*)   lpDisplayName   
end function ChangeServiceConfig
end interface

interface
logical(4) function  CloseServiceHandle (hSCObject) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CloseServiceHandle@4' :: CloseServiceHandle
integer hSCObject   
end function CloseServiceHandle
end interface

interface
logical(4) function  ControlService (hService ,dwControl ,lpServiceStatus) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_ControlService@12' :: ControlService
!MS$ATTRIBUTES REFERENCE :: lpServiceStatus   
use msfwinty
integer                 hService
integer                 dwControl
type(T_SERVICE_STATUS)  lpServiceStatus   
end function ControlService
end interface

interface
integer(4) function  CreateService (hSCManager ,lpServiceName ,lpDisplayName ,dwDesiredAccess ,dwServiceType ,dwStartType ,dwErrorControl ,lpBinaryPathName ,lpLoadOrderGroup ,lpdwTagId ,lpDependencies ,lpServiceStartName ,lpPassword) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CreateServiceA@52' :: CreateService
!MS$ATTRIBUTES REFERENCE :: lpServiceName
!MS$ATTRIBUTES REFERENCE :: lpDisplayName
!MS$ATTRIBUTES REFERENCE :: lpBinaryPathName
!MS$ATTRIBUTES REFERENCE :: lpLoadOrderGroup
!MS$ATTRIBUTES REFERENCE :: lpDependencies
!MS$ATTRIBUTES REFERENCE :: lpServiceStartName
!MS$ATTRIBUTES REFERENCE :: lpPassword   
integer hSCManager
character*(*)   lpServiceName
character*(*)   lpDisplayName
integer         dwDesiredAccess
integer         dwServiceType
integer         dwStartType
integer         dwErrorControl
character*(*)   lpBinaryPathName
character*(*)   lpLoadOrderGroup
integer         lpdwTagId
character*(*)   lpDependencies
character*(*)   lpServiceStartName
character*(*)   lpPassword   
end function CreateService
end interface

interface
logical(4) function  DeleteService (hService) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_DeleteService@4' :: DeleteService
integer hService   
end function DeleteService
end interface

interface
logical(4) function  EnumDependentServices (hService ,dwServiceState ,lpServices ,cbBufSize ,pcbBytesNeeded ,lpServicesReturned) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumDependentServicesA@24' :: EnumDependentServices
!MS$ATTRIBUTES REFERENCE :: lpServices
use msfwinty
integer                     hService
integer                     dwServiceState
type(T_ENUM_SERVICE_STATUS) lpServices
integer                     cbBufSize
integer                     pcbBytesNeeded
integer                     lpServicesReturned   
end function EnumDependentServices
end interface


interface
logical(4) function  EnumServicesStatus (hSCManager ,dwServiceType ,dwServiceState ,lpServices ,cbBufSize ,pcbBytesNeeded ,lpServicesReturned ,lpResumeHandle) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_EnumServicesStatusA@32' :: EnumServicesStatus
!MS$ATTRIBUTES REFERENCE :: lpServices
use msfwinty
integer                     hSCManager
integer                     dwServiceType
integer                     dwServiceState
type(T_ENUM_SERVICE_STATUS) lpServices
integer                     cbBufSize
integer                     pcbBytesNeeded
integer                     lpServicesReturned
integer                     lpResumeHandle   
end function EnumServicesStatus
end interface


interface
logical(4) function  GetServiceKeyName (hSCManager ,lpDisplayName ,lpServiceName ,lpcchBuffer) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetServiceKeyNameA@16' :: GetServiceKeyName
!MS$ATTRIBUTES REFERENCE :: lpDisplayName
!MS$ATTRIBUTES REFERENCE :: lpServiceName
integer         hSCManager
character*(*)   lpDisplayName
character*(*)   lpServiceName
integer         lpcchBuffer   
end function GetServiceKeyName
end interface


interface
logical(4) function  GetServiceDisplayName (hSCManager ,lpServiceName ,lpDisplayName ,lpcchBuffer) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetServiceDisplayNameA@16' :: GetServiceDisplayName
!MS$ATTRIBUTES REFERENCE :: lpServiceName
!MS$ATTRIBUTES REFERENCE :: lpDisplayName
integer         hSCManager
character*(*)   lpServiceName
character*(*)   lpDisplayName
integer         lpcchBuffer   
end function GetServiceDisplayName
end interface

interface
integer(4) function  LockServiceDatabase (hSCManager) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_LockServiceDatabase@4' :: LockServiceDatabase
integer hSCManager   
end function LockServiceDatabase
end interface

interface
logical(4) function  NotifyBootConfigStatus (BootAcceptable) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_NotifyBootConfigStatus@4' :: NotifyBootConfigStatus
logical(4)  BootAcceptable   
end function NotifyBootConfigStatus
end interface

interface
integer(4) function  OpenSCManager (lpMachineName ,lpDatabaseName ,dwDesiredAccess) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OpenSCManagerA@12' :: OpenSCManager
!MS$ATTRIBUTES REFERENCE :: lpMachineName
!MS$ATTRIBUTES REFERENCE :: lpDatabaseName
character*(*)   lpMachineName
character*(*)   lpDatabaseName
integer         dwDesiredAccess   
end function OpenSCManager
end interface

interface
integer(4) function  OpenService (hSCManager ,lpServiceName ,dwDesiredAccess) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OpenServiceA@12' :: OpenService
!MS$ATTRIBUTES REFERENCE :: lpServiceName
integer         hSCManager
character*(*)   lpServiceName
integer         dwDesiredAccess   
end function OpenService
end interface

interface
logical(4) function  QueryServiceConfig (hService ,lpServiceConfig ,cbBufSize ,pcbBytesNeeded) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_QueryServiceConfigA@16' :: QueryServiceConfig
!MS$ATTRIBUTES REFERENCE :: lpServiceConfig
use msfwinty
integer                         hService
type(T_QUERY_SERVICE_CONFIG)    lpServiceConfig
integer                         cbBufSize
integer                         pcbBytesNeeded   
end function QueryServiceConfig
end interface

interface
logical(4) function  QueryServiceLockStatus (hSCManager ,lpLockStatus ,cbBufSize ,pcbBytesNeeded ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_QueryServiceLockStatusA@16' :: QueryServiceLockStatus
!MS$ATTRIBUTES REFERENCE :: lpLockStatus
use msfwinty
integer                             hSCManager
type(T_QUERY_SERVICE_LOCK_STATUS)   lpLockStatus
integer                             cbBufSize
integer                             pcbBytesNeeded   
end function QueryServiceLockStatus
end interface

interface
logical(4) function  QueryServiceObjectSecurity (hService ,dwSecurityInformation ,lpSecurityDescriptor ,cbBufSize ,pcbBytesNeeded ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_QueryServiceObjectSecurity@20' :: QueryServiceObjectSecurity
integer hService
integer dwSecurityInformation
integer lpSecurityDescriptor
integer cbBufSize
integer pcbBytesNeeded   
end function QueryServiceObjectSecurity
end interface

interface
logical(4) function  QueryServiceStatus (hService ,lpServiceStatus) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_QueryServiceStatus@8' :: QueryServiceStatus
!MS$ATTRIBUTES REFERENCE :: lpServiceStatus   
use msfwinty
integer                 hService
type(T_SERVICE_STATUS)  lpServiceStatus   
end function QueryServiceStatus
end interface

interface
integer(4) function  RegisterServiceCtrlHandler (lpServiceName ,lpHandlerProc) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_RegisterServiceCtrlHandlerA@8' :: RegisterServiceCtrlHandler
!MS$ATTRIBUTES REFERENCE :: lpServiceName
character*(*)   lpServiceName
integer         lpHandlerProc   
end function RegisterServiceCtrlHandler
end interface

interface
logical(4) function  SetServiceObjectSecurity (hService ,dwSecurityInformation ,lpSecurityDescriptor) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetServiceObjectSecurity@12' :: SetServiceObjectSecurity
integer hService
integer dwSecurityInformation
integer lpSecurityDescriptor   
end function SetServiceObjectSecurity
end interface

interface
logical(4) function  SetServiceStatus (hServiceStatus ,lpServiceStatus) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SetServiceStatus@8' :: SetServiceStatus
!MS$ATTRIBUTES REFERENCE :: lpServiceStatus
use msfwinty
integer                 hServiceStatus
type(T_SERVICE_STATUS)  lpServiceStatus   
end function SetServiceStatus
end interface

interface
logical(4) function  StartServiceCtrlDispatcher (lpServiceStartTable) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_StartServiceCtrlDispatcherA@4' :: StartServiceCtrlDispatcher
!MS$ATTRIBUTES REFERENCE :: lpServiceStartTable
use msfwinty
type(T_SERVICE_TABLE_ENTRY)  lpServiceStartTable
end function StartServiceCtrlDispatcher
end interface

interface
logical(4) function  StartService (hService ,dwNumServiceArgs ,lpServiceArgVectors) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_StartServiceA@12' :: StartService
!MS$ATTRIBUTES REFERENCE :: lpServiceArgVectors
integer         hService
integer         dwNumServiceArgs
character*(*)   lpServiceArgVectors   
end function StartService
end interface


interface
logical(4) function  UnlockServiceDatabase (ScLock) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_UnlockServiceDatabase@4' :: UnlockServiceDatabase
integer ScLock   
end function UnlockServiceDatabase
end interface


!                               *****MMSYSTEM******

!MS$IF .NOT. DEFINED (MMNODRV)
! ***************************************************************************
! 
!                         Installable driver support
! 
! ***************************************************************************
!

!MS$IF .NOT. DEFINED (DRV_LOAD)
!  installable driver function prototypes

interface
integer(4) function  CloseDriver (hDriver ,lParam1 ,lParam2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_CloseDriver@12' :: CloseDriver
integer hDriver 
integer lParam1 
integer lParam2 
end function CloseDriver
end interface

interface
integer(4) function  OpenDriver (szDriverName ,szSectionName ,lParam) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OpenDriver@12' :: OpenDriver
!MS$ATTRIBUTES REFERENCE :: szDriverName
!MS$ATTRIBUTES REFERENCE :: szSectionName
character*(*)   szDriverName 
character*(*)   szSectionName
integer lParam 
end function OpenDriver
end interface

interface
integer(4) function  SendDriverMessage (hDriver ,message ,lParam1 ,lParam2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_SendDriverMessage@16' :: SendDriverMessage
integer hDriver 
integer message 
integer lParam1 
integer lParam2 
end function SendDriverMessage
end interface

interface
integer(4) function  GetDriverModuleHandle (hDriver  ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_GetDriverModuleHandle@4' :: GetDriverModuleHandle
integer hDriver  
end function GetDriverModuleHandle
end interface

!MS$ENDIF   ! DRV_LOAD
!MS$ENDIF   ! MMNODRV


interface
integer(4) function  mmsystemGetVersion () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmsystemGetVersion@0' :: mmsystemGetVersion
end function mmsystemGetVersion
end interface

!  We should point people to using OutputDebugString

interface
subroutine  OutputDebugStr (lpszOutPutString) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_OutputDebugStringA@4' :: OutputDebugStr
!MS$ATTRIBUTES REFERENCE :: lpszOutPutString 
character*(*)   lpszOutPutString 
end subroutine OutputDebugStr
end interface



! ***************************************************************************
! *                           Sound support
! *  Note:  It may be fairly obvious that there are two very similar looking
! *  API calls to provide high level sound support.  The major difference is
! *  that PlaySound takes a module handle.  The position is to be reviewed.
! ***************************************************************************
!
interface
logical(4) function  sndPlaySound (lpszSoundName ,uFlags  ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_sndPlaySoundA@8' :: sndPlaySound
!MS$ATTRIBUTES REFERENCE :: lpszSoundName
character*(*)   lpszSoundName 
integer         uFlags  
end function sndPlaySound
end interface

interface
logical(4) function  PlaySound (lpszName ,hModule ,dwFlags  ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_PlaySoundA@12' :: PlaySound
!MS$ATTRIBUTES REFERENCE :: lpszName
character*(*)   lpszName 
integer         hModule 
integer         dwFlags  
end function PlaySound
end interface

!  waveform audio function prototypes


interface
integer(4) function  waveOutGetNumDevs () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutGetNumDevs@0' :: waveOutGetNumDevs
end function waveOutGetNumDevs
end interface

interface
integer(4) function  waveOutGetDevCaps (uDeviceID ,lpCaps ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutGetDevCapsA@12' :: waveOutGetDevCaps
!MS$ATTRIBUTES REFERENCE :: lpCaps
use msfwinty
integer             uDeviceID 
type(T_WAVEOUTCAPS) lpCaps 
integer             uSize 
end function waveOutGetDevCaps
end interface

interface
integer(4) function  waveOutGetVolume (uDeviceID ,lpdwVolume ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutGetVolume@8' :: waveOutGetVolume
integer uDeviceID 
integer lpdwVolume 
end function waveOutGetVolume
end interface

interface
integer(4) function  waveOutSetVolume (uDeviceID ,dwVolume ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutSetVolume@8' :: waveOutSetVolume
integer uDeviceID 
integer dwVolume 
end function waveOutSetVolume
end interface

interface
integer(4) function  waveOutGetErrorText (err ,lpText ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutGetErrorTextA@12' :: waveOutGetErrorText
!MS$ATTRIBUTES REFERENCE :: lpText
integer         err 
character*(*)   lpText 
integer         uSize 
end function waveOutGetErrorText
end interface

interface
integer(4) function  waveOutOpen (lphWaveOut ,uDeviceID ,lpFormat ,dwCallback ,dwInstance ,dwFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutOpen@24' :: waveOutOpen
!MS$ATTRIBUTES REFERENCE :: lpFormat
use msfwinty
integer             lphWaveOut 
integer             uDeviceID 
type(T_WAVEFORMAT)  lpFormat 
integer             dwCallback 
integer             dwInstance 
integer             dwFlags 
end function waveOutOpen
end interface

interface
integer(4) function  waveOutClose (hWaveOut ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutClose@4' :: waveOutClose
integer hWaveOut 
end function waveOutClose
end interface

interface
integer(4) function  waveOutPrepareHeader (hWaveOut ,lpWaveOutHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutPrepareHeader@12' :: waveOutPrepareHeader
!MS$ATTRIBUTES REFERENCE :: lpWaveOutHdr
use msfwinty
integer             hWaveOut 
type(T_WAVEHDR)  lpWaveOutHdr 
integer             uSize 
end function waveOutPrepareHeader
end interface

interface
integer(4) function  waveOutUnprepareHeader (hWaveOut ,lpWaveOutHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutUnprepareHeader@12' :: waveOutUnprepareHeader
!MS$ATTRIBUTES REFERENCE :: lpWaveOutHdr
use msfwinty
integer             hWaveOut 
type(T_WAVEHDR)  lpWaveOutHdr 
integer             uSize 
end function waveOutUnprepareHeader
end interface

interface
integer(4) function  waveOutWrite (hWaveOut ,lpWaveOutHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutWrite@12' :: waveOutWrite
!MS$ATTRIBUTES REFERENCE :: lpWaveOutHdr
use msfwinty
integer             hWaveOut 
type(T_WAVEHDR)  lpWaveOutHdr 
integer             uSize 
end function waveOutWrite
end interface

interface
integer(4) function  waveOutPause (hWaveOut ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutPause@4' :: waveOutPause
integer hWaveOut 
end function waveOutPause
end interface

interface
integer(4) function  waveOutRestart (hWaveOut ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutRestart@4' :: waveOutRestart
integer hWaveOut 
end function waveOutRestart
end interface

interface
integer(4) function  waveOutReset (hWaveOut ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutReset@4' :: waveOutReset
integer hWaveOut 
end function waveOutReset
end interface

interface
integer(4) function  waveOutBreakLoop (hWaveOut ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutBreakLoop@4' :: waveOutBreakLoop
integer hWaveOut 
end function waveOutBreakLoop
end interface

interface
integer(4) function  waveOutGetPosition (hWaveOut ,lpInfo ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutGetPosition@12' :: waveOutGetPosition
!MS$ATTRIBUTES REFERENCE :: lpInfo
use msfwinty
integer         hWaveOut 
type(T_MMTIME)  lpInfo 
integer         uSize 
end function waveOutGetPosition
end interface

interface
integer(4) function  waveOutGetPitch (hWaveOut ,lpdwPitch ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutGetPitch@8' :: waveOutGetPitch
integer hWaveOut 
integer lpdwPitch 
end function waveOutGetPitch
end interface

interface
integer(4) function  waveOutSetPitch (hWaveOut ,dwPitch ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutSetPitch@8' :: waveOutSetPitch
integer hWaveOut 
integer dwPitch 
end function waveOutSetPitch
end interface

interface
integer(4) function  waveOutGetPlaybackRate (hWaveOut ,lpdwRate ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutGetPlaybackRate@8' :: waveOutGetPlaybackRate
integer hWaveOut 
integer lpdwRate 
end function waveOutGetPlaybackRate
end interface

interface
integer(4) function  waveOutSetPlaybackRate (hWaveOut ,dwRate ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutSetPlaybackRate@8' :: waveOutSetPlaybackRate
integer hWaveOut 
integer dwRate 
end function waveOutSetPlaybackRate
end interface

interface
integer(4) function  waveOutGetID (hWaveOut ,lpuDeviceID ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutGetID@8' :: waveOutGetID
integer hWaveOut 
integer lpuDeviceID 
end function waveOutGetID
end interface

interface
integer(4) function  waveOutMessage (hWaveOut ,msg ,dw1 ,dw2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveOutMessage@16' :: waveOutMessage
integer hWaveOut 
integer msg 
integer dw1 
integer dw2 
end function waveOutMessage
end interface

interface
integer(4) function  waveInGetNumDevs () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInGetNumDevs@0' :: waveInGetNumDevs
end function waveInGetNumDevs
end interface

interface
integer(4) function  waveInGetDevCaps (uDeviceID ,lpCaps ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInGetDevCapsA@12' :: waveInGetDevCaps
!MS$ATTRIBUTES REFERENCE :: lpCaps
use msfwinty
integer             uDeviceID 
type(T_WAVEINCAPS)  lpCaps 
integer             uSize 
end function waveInGetDevCaps
end interface

interface
integer(4) function  waveInGetErrorText (err ,lpText ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInGetErrorTextA@12' :: waveInGetErrorText
!MS$ATTRIBUTES REFERENCE :: lpText
integer         err 
character*(*)   lpText 
integer         uSize 
end function waveInGetErrorText
end interface

interface
integer(4) function  waveInOpen (lphWaveIn ,uDeviceID ,lpFormat ,dwCallback ,dwInstance ,dwFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInOpen@24' :: waveInOpen
!MS$ATTRIBUTES REFERENCE :: lpFormat
use msfwinty
integer             lphWaveIn 
integer             uDeviceID 
type(T_WAVEFORMAT)  lpFormat 
integer             dwCallback 
integer             dwInstance 
integer             dwFlags 
end function waveInOpen
end interface

interface
integer(4) function  waveInClose (hWaveIn ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInClose@4' :: waveInClose
integer hWaveIn 
end function waveInClose
end interface

interface
integer(4) function  waveInPrepareHeader (hWaveIn ,lpWaveInHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInPrepareHeader@12' :: waveInPrepareHeader
!MS$ATTRIBUTES REFERENCE :: lpWaveInHdr
use msfwinty
integer         hWaveIn 
type(T_WAVEHDR) lpWaveInHdr 
integer         uSize 
end function waveInPrepareHeader
end interface

interface
integer(4) function  waveInUnprepareHeader (hWaveIn ,lpWaveInHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInUnprepareHeader@12' :: waveInUnprepareHeader
!MS$ATTRIBUTES REFERENCE :: lpWaveInHdr
use msfwinty
integer         hWaveIn 
type(T_WAVEHDR) lpWaveInHdr 
integer         uSize 
end function waveInUnprepareHeader
end interface

interface
integer(4) function  waveInAddBuffer (hWaveIn ,lpWaveInHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInAddBuffer@12' :: waveInAddBuffer
!MS$ATTRIBUTES REFERENCE :: lpWaveInHdr
use msfwinty
integer         hWaveIn 
type(T_WAVEHDR) lpWaveInHdr 
integer         uSize 
end function waveInAddBuffer
end interface

interface
integer(4) function  waveInStart (hWaveIn ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInStart@4' :: waveInStart
integer hWaveIn 
end function waveInStart
end interface

interface
integer(4) function  waveInStop (hWaveIn ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInStop@4' :: waveInStop
integer hWaveIn 
end function waveInStop
end interface

interface
integer(4) function  waveInReset (hWaveIn ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInReset@4' :: waveInReset
integer hWaveIn 
end function waveInReset
end interface

interface
integer(4) function  waveInGetPosition (hWaveIn ,lpInfo ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInGetPosition@12' :: waveInGetPosition
!MS$ATTRIBUTES REFERENCE :: lpInfo
use msfwinty
integer         hWaveIn 
type(T_MMTIME)  lpInfo 
integer         uSize 
end function waveInGetPosition
end interface

interface
integer(4) function  waveInGetID (hWaveIn ,lpuDeviceID ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInGetID@8' :: waveInGetID
integer hWaveIn 
integer lpuDeviceID 
end function waveInGetID
end interface

interface
integer(4) function  waveInMessage (hWaveIn ,msg ,dw1 ,dw2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_waveInMessage@16' :: waveInMessage
integer hWaveIn 
integer msg 
integer dw1 
integer dw2 
end function waveInMessage
end interface


!  MIDI function prototypes


interface
integer(4) function  midiOutGetNumDevs () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutGetNumDevs@0' :: midiOutGetNumDevs
end function midiOutGetNumDevs
end interface

interface
integer(4) function  midiOutGetDevCaps (uDeviceID ,lpCaps ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutGetDevCapsA@12' :: midiOutGetDevCaps
!MS$ATTRIBUTES REFERENCE :: lpCaps
use msfwinty
integer             uDeviceID 
type(T_MIDIOUTCAPS) lpCaps 
integer             uSize 
end function midiOutGetDevCaps
end interface

interface
integer(4) function  midiOutGetVolume (uDeviceID ,lpdwVolume ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutGetVolume@8' :: midiOutGetVolume
integer uDeviceID 
integer lpdwVolume 
end function midiOutGetVolume
end interface

interface
integer(4) function  midiOutSetVolume (uDeviceID ,dwVolume ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutSetVolume@8' :: midiOutSetVolume
integer uDeviceID 
integer dwVolume 
end function midiOutSetVolume
end interface

interface
integer(4) function  midiOutGetErrorText (err ,lpText ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutGetErrorTextA@12' :: midiOutGetErrorText
!MS$ATTRIBUTES REFERENCE :: lpText
integer         err 
character*(*)   lpText 
integer         uSize 
end function midiOutGetErrorText
end interface

interface
integer(4) function  midiOutOpen (lphMidiOut ,uDeviceID ,dwCallback ,dwInstance ,dwFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutOpen@20' :: midiOutOpen
integer lphMidiOut 
integer uDeviceID 
integer dwCallback 
integer dwInstance 
integer dwFlags 
end function midiOutOpen
end interface

interface
integer(4) function  midiOutClose (hMidiOut ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutClose@4' :: midiOutClose
integer hMidiOut 
end function midiOutClose
end interface

interface
integer(4) function  midiOutPrepareHeader (hMidiOut ,lpMidiOutHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutPrepareHeader@12' :: midiOutPrepareHeader
!MS$ATTRIBUTES REFERENCE :: lpMidiOutHdr
use msfwinty
integer         hMidiOut 
type(T_MIDIHDR) lpMidiOutHdr 
integer         uSize 
end function midiOutPrepareHeader
end interface

interface
integer(4) function  midiOutUnprepareHeader (hMidiOut ,lpMidiOutHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutUnprepareHeader@12' :: midiOutUnprepareHeader
!MS$ATTRIBUTES REFERENCE :: lpMidiOutHdr
use msfwinty
integer         hMidiOut 
type(T_MIDIHDR) lpMidiOutHdr 
integer         uSize 
end function midiOutUnprepareHeader
end interface

interface
integer(4) function  midiOutShortMsg (hMidiOut ,dwMsg ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutShortMsg@8' :: midiOutShortMsg
integer hMidiOut 
integer dwMsg 
end function midiOutShortMsg
end interface

interface
integer(4) function  midiOutLongMsg (hMidiOut ,lpMidiOutHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutLongMsg@12' :: midiOutLongMsg
!MS$ATTRIBUTES REFERENCE :: lpMidiOutHdr
use msfwinty
integer         hMidiOut 
type(T_MIDIHDR) lpMidiOutHdr 
integer         uSize 
end function midiOutLongMsg
end interface

interface
integer(4) function  midiOutReset (hMidiOut ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutReset@4' :: midiOutReset
integer hMidiOut 
end function midiOutReset
end interface

interface
integer(4) function  midiOutCachePatches (hMidiOut ,uBank ,lpPatchArray ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutCachePatches@16' :: midiOutCachePatches
integer hMidiOut 
integer uBank 
integer lpPatchArray 
integer uFlags 
end function midiOutCachePatches
end interface

interface
integer(4) function  midiOutCacheDrumPatches (hMidiOut ,uPatch ,lpKeyArray ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutCacheDrumPatches@16' :: midiOutCacheDrumPatches
integer hMidiOut 
integer uPatch 
integer lpKeyArray 
integer uFlags 
end function midiOutCacheDrumPatches
end interface

interface
integer(4) function  midiOutGetID (hMidiOut ,lpuDeviceID ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutGetID@8' :: midiOutGetID
integer hMidiOut 
integer lpuDeviceID 
end function midiOutGetID
end interface

interface
integer(4) function  midiOutMessage (hMidiOut ,msg ,dw1 ,dw2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiOutMessage@16' :: midiOutMessage
integer hMidiOut 
integer msg 
integer dw1 
integer dw2 
end function midiOutMessage
end interface

interface
integer(4) function  midiInGetNumDevs () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInGetNumDevs@0' :: midiInGetNumDevs
end function midiInGetNumDevs
end interface

interface
integer(4) function  midiInGetDevCaps (uDeviceID ,lpCaps ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInGetDevCapsA@12' :: midiInGetDevCaps
!MS$ATTRIBUTES REFERENCE :: lpCaps
use msfwinty
integer             uDeviceID 
type(T_MIDIINCAPS)  lpCaps 
integer             uSize 
end function midiInGetDevCaps
end interface

interface
integer(4) function  midiInGetErrorText (err ,lpText ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInGetErrorTextA@12' :: midiInGetErrorText
!MS$ATTRIBUTES REFERENCE :: lpText
integer         err 
character*(*)   lpText 
integer         uSize 
end function midiInGetErrorText
end interface

interface
integer(4) function  midiInOpen (lphMidiIn ,uDeviceID ,dwCallback ,dwInstance ,dwFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInOpen@20' :: midiInOpen
integer lphMidiIn 
integer uDeviceID 
integer dwCallback 
integer dwInstance 
integer dwFlags 
end function midiInOpen
end interface

interface
integer(4) function  midiInClose (hMidiIn ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInClose@4' :: midiInClose
integer hMidiIn 
end function midiInClose
end interface

interface
integer(4) function  midiInPrepareHeader (hMidiIn ,lpMidiInHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInPrepareHeader@12' :: midiInPrepareHeader
!MS$ATTRIBUTES REFERENCE :: lpMidiInHdr
use msfwinty
integer         hMidiIn 
type(T_MIDIHDR) lpMidiInHdr 
integer         uSize 
end function midiInPrepareHeader
end interface

interface
integer(4) function  midiInUnprepareHeader (hMidiIn ,lpMidiInHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInUnprepareHeader@12' :: midiInUnprepareHeader
!MS$ATTRIBUTES REFERENCE :: lpMidiInHdr
use msfwinty
integer         hMidiIn 
type(T_MIDIHDR) lpMidiInHdr 
integer         uSize 
end function midiInUnprepareHeader
end interface

interface
integer(4) function  midiInAddBuffer (hMidiIn ,lpMidiInHdr ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInAddBuffer@12' :: midiInAddBuffer
!MS$ATTRIBUTES REFERENCE :: lpMidiInHdr
use msfwinty
integer         hMidiIn 
type(T_MIDIHDR) lpMidiInHdr 
integer         uSize 
end function midiInAddBuffer
end interface

interface
integer(4) function  midiInStart (hMidiIn ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInStart@4' :: midiInStart
integer hMidiIn 
end function midiInStart
end interface

interface
integer(4) function  midiInStop (hMidiIn ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInStop@4' :: midiInStop
integer hMidiIn 
end function midiInStop
end interface

interface
integer(4) function  midiInReset (hMidiIn ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInReset@4' :: midiInReset
integer hMidiIn 
end function midiInReset
end interface

interface
integer(4) function  midiInGetID (hMidiIn ,lpuDeviceID ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInGetID@8' :: midiInGetID
integer hMidiIn 
integer lpuDeviceID 
end function midiInGetID
end interface

interface
integer(4) function  midiInMessage (hMidiIn ,msg ,dw1 ,dw2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_midiInMessage@16' :: midiInMessage
integer hMidiIn 
integer msg 
integer dw1 
integer dw2 
end function midiInMessage
end interface


!  auxiliary audio function prototypes


interface
integer(4) function  auxGetNumDevs () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_auxGetNumDevs@0' :: auxGetNumDevs
end function auxGetNumDevs
end interface

interface
integer(4) function  auxGetDevCaps (uDeviceID ,lpCaps ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_auxGetDevCapsA@12' :: auxGetDevCaps
!MS$ATTRIBUTES REFERENCE :: lpCaps
use msfwinty
integer         uDeviceID 
type(T_AUXCAPS) lpCaps 
integer         uSize 
end function auxGetDevCaps
end interface

interface
integer(4) function  auxSetVolume (uDeviceID ,dwVolume ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_auxSetVolume@8' :: auxSetVolume
integer uDeviceID 
integer dwVolume 
end function auxSetVolume
end interface

interface
integer(4) function  auxGetVolume (uDeviceID ,lpdwVolume ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_auxGetVolume@8' :: auxGetVolume
integer uDeviceID 
integer lpdwVolume 
end function auxGetVolume
end interface

interface
integer(4) function  auxOutMessage (uDeviceID ,msg ,dw1 ,dw2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_auxOutMessage@16' :: auxOutMessage
integer uDeviceID 
integer msg 
integer dw1 
integer dw2 
end function auxOutMessage
end interface


!  timer function prototypes

interface
integer(4) function  timeGetSystemTime (lpTime ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_timeGetSystemTime@8' :: timeGetSystemTime
!MS$ATTRIBUTES REFERENCE :: lpTime
use msfwinty
type(T_MMTIME)  lpTime 
integer         uSize 
end function timeGetSystemTime
end interface

interface
integer(4) function  timeGetTime () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_timeGetTime@0' :: timeGetTime
end function timeGetTime
end interface

interface
integer(4) function  timeSetEvent (uDelay ,uResolution ,lpFunction ,dwUser ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_timeSetEvent@20' :: timeSetEvent
integer uDelay 
integer uResolution 
integer lpFunction 
integer dwUser 
integer uFlags 
end function timeSetEvent
end interface

interface
integer(4) function  timeKillEvent (uId ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_timeKillEvent@4' :: timeKillEvent
integer uId 
end function timeKillEvent
end interface

interface
integer(4) function  timeGetDevCaps (lpTimeCaps ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_timeGetDevCaps@8' :: timeGetDevCaps
!MS$ATTRIBUTES REFERENCE :: lpTimeCaps
use msfwinty
type(T_TIMECAPS)    lpTimeCaps 
integer             uSize 
end function timeGetDevCaps
end interface

interface
integer(4) function  timeBeginPeriod (uPeriod ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_timeBeginPeriod@4' :: timeBeginPeriod
integer uPeriod 
end function timeBeginPeriod
end interface

interface
integer(4) function  timeEndPeriod (uPeriod ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_timeEndPeriod@4' :: timeEndPeriod
integer uPeriod 
end function timeEndPeriod
end interface


!  joystick function prototypes

interface
integer(4) function  joyGetDevCaps (id ,lpCaps ,uSize ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_joyGetDevCapsA@12' :: joyGetDevCaps
!MS$ATTRIBUTES REFERENCE :: lpCaps
use msfwinty
integer         id 
type(T_JOYCAPS) lpCaps 
integer         uSize 
end function joyGetDevCaps
end interface

!  joystick function prototypes
interface
integer(4) function  joyGetNumDevs () 
!MS$ATTRIBUTES STDCALL, ALIAS : '_joyGetNumDevs@0' :: joyGetNumDevs
end function joyGetNumDevs
end interface

interface
integer(4) function  joyGetPos (id ,lpInfo ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_joyGetPos@8' :: joyGetPos
!MS$ATTRIBUTES REFERENCE :: lpInfo
use msfwinty
integer         id 
type(T_JOYINFO) lpInfo 
end function joyGetPos
end interface

interface
integer(4) function  joyGetThreshold (id ,lpuThreshold ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_joyGetThreshold@8' :: joyGetThreshold
integer id 
integer lpuThreshold 
end function joyGetThreshold
end interface

interface
integer(4) function  joyReleaseCapture (id ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_joyReleaseCapture@4' :: joyReleaseCapture
integer id 
end function joyReleaseCapture
end interface

interface
integer(4) function  joySetCapture (hwnd ,uId ,uPeriod ,bChanged ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_joySetCapture@16' :: joySetCapture
integer     hwnd     
integer     uId 
integer     uPeriod 
logical(4)  bChanged 
end function joySetCapture
end interface

interface
integer(4) function  joySetThreshold (id ,uThreshold ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_joySetThreshold@8' :: joySetThreshold
integer id 
integer uThreshold 
end function joySetThreshold
end interface



!   MMIO prototypes   

interface
integer(4) function  mmioStringToFOURCC (sz ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioStringToFOURCCA@8' :: mmioStringToFOURCC
!MS$ATTRIBUTES REFERENCE :: sz
character*(*)   sz 
integer         uFlags 
end function mmioStringToFOURCC
end interface

interface
integer(4) function  mmioInstallIOProc (fccIOProc ,pIOProc ,dwFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioInstallIOProcA@12' :: mmioInstallIOProc
integer fccIOProc 
integer pIOProc 
integer dwFlags 
end function mmioInstallIOProc
end interface

interface
integer(4) function  mmioOpen (szFileName ,lpmmioinfo ,dwOpenFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioOpenA@12' :: mmioOpen
!MS$ATTRIBUTES REFERENCE :: szFileName 
!MS$ATTRIBUTES REFERENCE :: lpmmioinfo
use msfwinty
character*(*)       szFileName 
type(T_MMIOINFO)    lpmmioinfo 
integer             dwOpenFlags 
end function mmioOpen
end interface

interface
integer(4) function  mmioRename (szFileName ,szNewFileName ,lpmmioinfo ,dwRenameFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioRenameA@16' :: mmioRename
!MS$ATTRIBUTES REFERENCE :: szFileName 
!MS$ATTRIBUTES REFERENCE :: szNewFileName 
!MS$ATTRIBUTES REFERENCE :: lpmmioinfo
use msfwinty
character*(*)       szFileName 
character*(*)       szNewFileName 
type(T_MMIOINFO)    lpmmioinfo 
integer             dwRenameFlags 
end function mmioRename
end interface

interface
integer(4) function  mmioClose (hmmio ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioClose@8' :: mmioClose
integer hmmio 
integer uFlags 
end function mmioClose
end interface

interface
integer(4) function  mmioRead (hmmio ,pch ,cch ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioRead@12' :: mmioRead
!MS$ATTRIBUTES REFERENCE :: pch
integer         hmmio 
character*(*)   pch 
integer         cch 
end function mmioRead
end interface

interface
integer(4) function  mmioWrite (hmmio ,pch ,cch ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioWrite@12' :: mmioWrite
!MS$ATTRIBUTES REFERENCE :: pch
integer         hmmio 
character*(*)   pch 
integer         cch 
end function mmioWrite
end interface

interface
integer(4) function  mmioSeek (hmmio ,lOffset ,iOrigin ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioSeek@12' :: mmioSeek
integer hmmio 
integer lOffset 
integer iOrigin 
end function mmioSeek
end interface

interface
integer(4) function  mmioGetInfo (hmmio ,lpmmioinfo ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioGetInfo@12' :: mmioGetInfo
!MS$ATTRIBUTES REFERENCE :: lpmmioinfo
use msfwinty
integer             hmmio 
type(T_MMIOINFO)    lpmmioinfo 
integer             uFlags 
end function mmioGetInfo
end interface

interface
integer(4) function  mmioSetInfo (hmmio ,lpmmioinfo ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioSetInfo@12' :: mmioSetInfo
!MS$ATTRIBUTES REFERENCE :: lpmmioinfo
use msfwinty
integer             hmmio 
type(T_MMIOINFO)    lpmmioinfo 
integer             uFlags 
end function mmioSetInfo
end interface

interface
integer(4) function  mmioSetBuffer (hmmio ,pchBuffer ,cchBuffer ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioSetBuffer@16' :: mmioSetBuffer
!MS$ATTRIBUTES REFERENCE :: pchBuffer
integer         hmmio 
character*(*)   pchBuffer 
integer         cchBuffer 
integer         uFlags 
end function mmioSetBuffer
end interface

interface
integer(4) function  mmioFlush (hmmio ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioFlush@8' :: mmioFlush
integer hmmio 
integer uFlags 
end function mmioFlush
end interface

interface
integer(4) function  mmioAdvance (hmmio ,lpmmioinfo ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioAdvance@12' :: mmioAdvance
!MS$ATTRIBUTES REFERENCE :: lpmmioinfo
use msfwinty
integer             hmmio 
type(T_MMIOINFO)    lpmmioinfo 
integer             uFlags 
end function mmioAdvance
end interface

interface
integer(4) function  mmioSendMessage (hmmio ,uMsg ,lParam1 ,lParam2 ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioSendMessage@16' :: mmioSendMessage
integer hmmio 
integer uMsg 
integer lParam1 
integer lParam2 
end function mmioSendMessage
end interface



!   RIFF   O prototypes *!

interface
integer(4) function  mmioDescend (hmmio ,lpck ,lpckParent ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioDescend@16' :: mmioDescend
!MS$ATTRIBUTES REFERENCE :: lpck
!MS$ATTRIBUTES REFERENCE :: lpckParent
use msfwinty
integer             hmmio 
type(T_MMCKINFO)    lpck 
type(T_MMCKINFO)    lpckParent 
integer             uFlags 
end function mmioDescend
end interface

interface
integer(4) function  mmioAscend (hmmio ,lpck ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioAscend@12' :: mmioAscend
!MS$ATTRIBUTES REFERENCE :: lpck
use msfwinty
integer             hmmio 
type(T_MMCKINFO)    lpck 
integer             uFlags 
end function mmioAscend
end interface

interface
integer(4) function  mmioCreateChunk (hmmio ,lpck ,uFlags ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mmioCreateChunk@12' :: mmioCreateChunk
!MS$ATTRIBUTES REFERENCE :: lpck
use msfwinty
integer             hmmio 
type(T_MMCKINFO)    lpck 
integer             uFlags 
end function mmioCreateChunk
end interface

interface
integer(4) function  mciSendCommand (wDeviceID ,uMessage ,dwParam1 ,dwParam2  ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mciSendCommandA@16' :: mciSendCommand
integer wDeviceID 
integer uMessage 
integer dwParam1 
integer dwParam2  
end function mciSendCommand
end interface


! --------------------------------------------------------------------*\
!  *
!  *                           MCI functions
!  *
!  *--------------------------------------------------------------------
!  * msiSendCommand
! \*--------------------------------------------------------------------
!

interface
integer(4) function  mciSendString (lpstrCommand ,lpstrReturnString ,uReturnLength ,hwndCallback  ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mciSendStringA@16' :: mciSendString
!MS$ATTRIBUTES REFERENCE :: lpstrCommand
!MS$ATTRIBUTES REFERENCE :: lpstrReturnString
character*(*)   lpstrCommand 
character*(*)   lpstrReturnString 
integer         uReturnLength 
integer         hwndCallback  
end function mciSendString
end interface

interface
integer(4) function  mciGetCreatorTask (wDeviceID ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mciGetCreatorTask@4' :: mciGetCreatorTask
integer wDeviceID 
end function mciGetCreatorTask
end interface

interface
integer(4) function  mciGetDeviceID (lpstrName  ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mciGetDeviceIDA@4' :: mciGetDeviceID
!MS$ATTRIBUTES REFERENCE :: lpstrName
character*(*)   lpstrName  
end function mciGetDeviceID
end interface

interface
logical(4) function  mciGetErrorString (dwError ,lpstrBuffer ,uLength) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mciGetErrorStringA@12' :: mciGetErrorString
!MS$ATTRIBUTES REFERENCE :: lpstrBuffer
integer         dwError 
character*(*)   lpstrBuffer 
integer         uLength  
end function mciGetErrorString
end interface

interface
logical(4) function  mciSetYieldProc  (wDeviceID ,fpYieldProc,dwYieldData ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mciSetYieldProc@12' :: mciSetYieldProc 
integer wDeviceID   
integer fpYieldProc 
integer dwYieldData 
end function mciSetYieldProc
end interface

interface
integer(4) function  mciGetYieldProc  (wDeviceID ,lpdwYieldData ) 
!MS$ATTRIBUTES STDCALL, ALIAS : '_mciGetYieldProc@8' :: mciGetYieldProc 
integer wDeviceID   
integer lpdwYieldData 
end function mciGetYieldProc
end interface


!                               *****WINSOCK****
! 
!  * Windows Sockets errors redefined as regular Berkeley error constants.
!  * These are commented out in Windows NT to avoid conflicts with errno.h.
!  * Use the WSA constants instead.
!  
!

!   Socket function prototypes   

interface
integer(4) function  accept (s, addr, addrlen)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_accept@12'  :: accept 
integer s 
integer addr
integer   addrlen
end function accept
end interface

interface
integer(4) function   bind (s, addr, namelen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_bind@12' :: bind 
integer s
integer addr
integer namelen
end function bind
end interface

interface
integer(4) function closesocket (s) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_closesocket@4'  :: closesocket 
integer s
end function closesocket
end interface

interface
integer(4) function   connect (s, name, namelen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_connect@12'  :: connect 
integer s
integer name
integer namelen                                           
end function connect
end interface

interface
integer(4) function  ioctlsocket (s, cmd, argp) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ioctlsocket@12'  :: ioctlsocket 
integer s
integer cmd
integer argp
end function ioctlsocket
end interface

interface
integer(4) function getpeername (s, name,  namelen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_getpeername@12'  :: getpeername 
integer s 
integer name
integer   namelen
end function getpeername
end interface

interface
integer(4) function getsockname (s, name, namelen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_getsockname@12'  :: getsockname 
integer s
integer name
integer  namelen
end function getsockname
end interface

interface
integer(4) function getsockopt (s, level, optname, optval, optlen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_getsockopt@20'  :: getsockopt 
integer s
integer level
integer optname
integer optval 
integer optlen
end function getsockopt
end interface

interface
integer(4) function htonl (hostlong) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_htonl@4'  :: htonl 
integer hostlong
end function htonl
end interface

interface
integer(2) function htons (hostshort) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_htons@4'  :: htons 
integer*2 hostshort
end function htons 
end interface

interface
integer(4) function inet_addr ( cp) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_inet_addr@4'  :: inet_addr 
!MS$ ATTRIBUTES REFERENCE :: cp
character*(*)   cp
end function inet_addr 
end interface

interface
integer(4) function inet_ntoa (in)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_inet_ntoa@4'  :: inet_ntoa
integer(4)  in
end function inet_ntoa
end interface

interface
integer(4) function listen ( s, backlog) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_listen@8'  :: listen 
integer s
integer backlog
end function listen 
end interface

interface
integer(4) function  ntohl (netlong) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ntohl@4'  :: ntohl 
integer netlong
end function ntohl 
end interface

interface
integer(2) function  ntohs (netshort) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_ntohs@4'  :: ntohs 
integer*2 netshort
end function ntohs 
end interface

interface
integer(4) function recv (s,  buf, len,  flags) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_recv@16'  :: recv 
!MS$ ATTRIBUTES REFERENCE :: buf
integer         s 
character*(*)   buf
integer         len
integer         flags
end function recv 
end interface

interface
integer(4) function recvfrom (s,  buf, len, flags, from,  fromlen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_recvfrom@24'  :: recvfrom 
!MS$ ATTRIBUTES REFERENCE :: buf
integer         s 
character*(*)   buf
integer         len
integer         flags
integer         from
integer         fromlen
end function recvfrom 
end interface

interface
integer(4) function select (nfds, readfds, writefds, exceptfds, timeout) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_select@20'  :: select 
integer nfds
integer readfds
integer writefds
integer exceptfds
integer timeout
end function select 
end interface

interface
integer(4) function send (s,  buf,  len,  flags) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_send@16'  :: send 
!MS$ ATTRIBUTES REFERENCE :: buf
integer         s 
character*(*)   buf
integer         len
integer         flags
end function send 
end interface

interface
integer(4) function sendto (s,  buf,  len,  flags, to,  tolen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_sendto@24'  :: sendto 
!MS$ ATTRIBUTES REFERENCE :: buf
integer         s 
character*(*)   buf
integer         len
integer         flags
integer         to
integer         tolen
end function sendto 
end interface

interface
integer(4) function setsockopt (s, level, optname, optval, optlen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_setsockopt@20'  :: setsockopt 
!MS$ ATTRIBUTES REFERENCE :: optval
integer         s
integer         level
integer         optname
character*(*)   optval
integer         optlen
end function setsockopt 
end interface

interface
integer(4) function shutdown (s, how) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_shutdown@8'  :: shutdown 
integer s
integer how
end function shutdown 
end interface

interface
integer (4) function socket (af,type, protocol) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_socket@12'  :: socket 
integer af
integer type
integer protocol
end function socket 
end interface

!   Database function prototypes   

interface
integer(4) function gethostbyaddr( addr, len, type)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_gethostbyaddr@12'  :: gethostbyaddr
!MS$ ATTRIBUTES REFERENCE :: addr
character*(*)   addr
integer         len
integer         type
end function gethostbyaddr
end interface

interface
integer(4) function gethostbyname (name) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_gethostbyname@4'  :: gethostbyname 
!MS$ ATTRIBUTES REFERENCE :: name
character*(*)   name
end function gethostbyname 
end interface

interface
integer(4) function gethostname ( name, namelen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_gethostname@8'  :: gethostname 
!MS$ ATTRIBUTES REFERENCE :: name
character*(*)   name
integer         namelen
end function gethostname 
end interface

interface
integer(4) function getservbyport (port, proto) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_getservbyport@8'  :: getservbyport 
!MS$ ATTRIBUTES REFERENCE :: proto
integer         port
character*(*)   proto
end function getservbyport 
end interface

interface
integer(4) function getservbyname (name, proto) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_getservbyname@8'  :: getservbyname 
!MS$ ATTRIBUTES REFERENCE :: name
!MS$ ATTRIBUTES REFERENCE :: proto
character*(*)   name
character*(*)   proto
end function getservbyname 
end interface

interface
integer(4) function getprotobynumber (proto) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_getprotobynumber@4'  :: getprotobynumber 
integer proto
end function getprotobynumber 
end interface

interface
integer(4) function getprotobyname ( name) 
!MS$ ATTRIBUTES STDCALL, ALIAS :  '_getprotobyname@4'  :: getprotobyname 
!MS$ ATTRIBUTES REFERENCE :: name
character*(*)   name
end function getprotobyname 
end interface

!   Microsoft Windows Extension function prototypes   

interface
integer(4) function  WSAStartup (wVersionRequired, lpWSAData) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAStartup@8'  :: WSAStartup 
!MS$ ATTRIBUTES REFERENCE :: lpWSAData
use msfwinty
integer*2           wVersionRequired
type (T_WSADATA)    lpWSAData
end function WSAStartup 
end interface

interface
integer(4) function  WSACleanup () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSACleanup@0'  :: WSACleanup 
end function WSACleanup 
end interface

interface
subroutine WSASetLastError (iError) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSASetLastError@4'  :: WSASetLastError 
integer iError
end subroutine WSASetLastError 
end interface

interface
integer(4) function WSAGetLastError () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAGetLastError@0'  :: WSAGetLastError 
end function WSAGetLastError 
end interface

interface
logical(4) function WSAIsBlocking () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAIsBlocking@0'  :: WSAIsBlocking 
end function WSAIsBlocking 
end interface

interface
integer(4) function WSAUnhookBlockingHook () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAUnhookBlockingHook@0'  :: WSAUnhookBlockingHook 
end function WSAUnhookBlockingHook 
end interface

interface
integer(4) function WSASetBlockingHook ( lpBlockFunc) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSASetBlockingHook@4'  :: WSASetBlockingHook 
integer lpBlockFunc
end function WSASetBlockingHook 
end interface

interface
integer(4) function WSACancelBlockingCall () 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSACancelBlockingCall@0'  :: WSACancelBlockingCall 
end function WSACancelBlockingCall 
end interface

interface
integer(4) function WSAAsyncGetServByName(hWnd, wMsg, name,  proto,  buf, buflen) result(ret)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAAsyncGetServByName@20'  :: WSAAsyncGetServByName
!MS$ ATTRIBUTES REFERENCE :: name
!MS$ ATTRIBUTES REFERENCE :: proto
!MS$ ATTRIBUTES REFERENCE :: buf
integer         hWnd
integer         wMsg
character*(*)   name
character*(*)   proto
character*(*)   buf
integer         buflen
end function WSAAsyncGetServByName
end interface

interface
integer(4) function WSAAsyncGetServByPort (hWnd, wMsg, port, proto,  buf,buflen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAAsyncGetServByPort@6'  :: WSAAsyncGetServByPort 
!MS$ ATTRIBUTES REFERENCE :: proto
!MS$ ATTRIBUTES REFERENCE :: buf
integer         hWnd
integer         wMsg
integer         port
character*(*)   proto
character*(*)   buf
integer         buflen
end function WSAAsyncGetServByPort
end interface

interface
integer(4) function WSAAsyncGetProtoByName (hWnd, wMsg, name, buf,buflen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAAsyncGetProtoByName@20'  :: WSAAsyncGetProtoByName 
!MS$ ATTRIBUTES REFERENCE :: name
!MS$ ATTRIBUTES REFERENCE :: buf
integer         hWnd
integer         wMsg
character*(*)   name
character*(*)   buf
integer         buflen
end function WSAAsyncGetProtoByName
end interface

interface
integer(4) function WSAAsyncGetProtoByNumber (hWnd, wMsg, number,  buf, buflen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAAsyncGetProtoByNumber@20'  :: WSAAsyncGetProtoByNumber 
!MS$ ATTRIBUTES REFERENCE :: buf
integer         hWnd
integer         wMsg
integer         number
character*(*)   buf
integer         buflen
end function WSAAsyncGetProtoByNumber
end interface

interface
integer(4) function WSAAsyncGetHostByName ( hWnd,  wMsg,  name, buf, buflen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAAsyncGetHostByName@20'  :: WSAAsyncGetHostByName 
!MS$ ATTRIBUTES REFERENCE :: name
!MS$ ATTRIBUTES REFERENCE :: buf
integer         hWnd
integer         wMsg
character*(*)   name
character*(*)   buf
integer         buflen
end function WSAAsyncGetHostByName
end interface

interface
integer(4) function WSAAsyncGetHostByAddr (hWnd, wMsg, addr, len, type, buf, buflen) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAAsyncGetHostByAddr@28'  :: WSAAsyncGetHostByAddr 
!MS$ ATTRIBUTES REFERENCE :: addr
!MS$ ATTRIBUTES REFERENCE :: buf
integer         hWnd
integer         wMsg
character*(*)   addr
integer         len
integer         type
character*(*)   buf
integer         buflen
end function WSAAsyncGetHostByAddr 
end interface

interface
integer(4) function WSACancelAsyncRequest (hAsyncTaskHandle) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSACancelAsyncRequest@4'  :: WSACancelAsyncRequest 
integer hAsyncTaskHandle
end function WSACancelAsyncRequest 
end interface

interface
integer(4) function WSAAsyncSelect (s, hWnd, wMsg, lEvent) 
!MS$ ATTRIBUTES STDCALL, ALIAS : '_WSAAsyncSelect@16'  :: WSAAsyncSelect 
integer s
integer hWnd
integer wMsg
integer lEvent
end function WSAAsyncSelect
end interface

!                               *****BITSFUNC****
! The functions defined in these files are used to access the bits in 
! structures
! winnt
interface
integer*2 function FPO_DATA$cbProlog (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FPO_DATA$cbProlog@4' :: FPO_DATA$cbProlog
integer*2 Bits
end function FPO_DATA$cbProlog

integer*2 function FPO_DATA$cbRegs (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FPO_DATA$cbRegs@4' :: FPO_DATA$cbRegs
integer*2 Bits
end function FPO_DATA$cbRegs

integer*2 function FPO_DATA$fHasSEH (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FPO_DATA$fHasSEH@4' :: FPO_DATA$fHasSEH
integer*2 Bits
end function FPO_DATA$fHasSEH

integer*2 function FPO_DATA$fUseBP (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FPO_DATA$fUseBP@4' :: FPO_DATA$fUseBP
integer*2 Bits
end function FPO_DATA$fUseBP

integer*2 function FPO_DATA$reserved (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FPO_DATA$reserved@4' :: FPO_DATA$reserved
integer*2 Bits
end function FPO_DATA$reserved

integer*2 function FPO_DATA$cbFrame (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_FPO_DATA$cbFrame@4' :: FPO_DATA$cbFrame
integer*2 Bits
end function FPO_DATA$cbFrame

integer*4 function LDT_ENTRY$BaseMid (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$BaseMid@4' :: LDT_ENTRY$BaseMid
integer*4   Bits
end function LDT_ENTRY$BaseMid

integer*4 function LDT_ENTRY$Type (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$Type@4' :: LDT_ENTRY$Type
integer*4   Bits
end function LDT_ENTRY$Type

integer*4 function LDT_ENTRY$Dpl (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$Dpl@4' :: LDT_ENTRY$Dpl
integer*4   Bits
end function LDT_ENTRY$Dpl

integer*4 function LDT_ENTRY$Pres (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$Pres@4' :: LDT_ENTRY$Pres
integer*4   Bits
end function LDT_ENTRY$Pres

integer*4 function LDT_ENTRY$LimitHi (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$LimitHi@4' :: LDT_ENTRY$LimitHi
integer*4   Bits
end function LDT_ENTRY$LimitHi

integer*4 function LDT_ENTRY$Sys (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$Sys@4' :: LDT_ENTRY$Sys
integer*4   Bits
end function LDT_ENTRY$Sys

integer*4 function LDT_ENTRY$Reserved (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$Reserved@4' :: LDT_ENTRY$Reserved
integer*4   Bits
end function LDT_ENTRY$Reserved

integer*4 function LDT_ENTRY$Default_Big (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$Default_Big@4' :: LDT_ENTRY$Default_Big
integer*4   Bits
end function LDT_ENTRY$Default_Big

integer*4 function LDT_ENTRY$Granularity (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$Granularity@4' :: LDT_ENTRY$Granularity
integer*4   Bits
end function LDT_ENTRY$Granularity

integer*4 function LDT_ENTRY$BaseHi (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_LDT_ENTRY$BaseHi@4' :: LDT_ENTRY$BaseHi
integer*4   Bits
end function LDT_ENTRY$BaseHi

integer*4 function COMSTAT$fCtsHold (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_COMSTAT$fCtsHold@4' :: COMSTAT$fCtsHold
integer*4   Bits
end function COMSTAT$fCtsHold

integer*4 function COMSTAT$fDsrHold (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_COMSTAT$fDsrHold@4' :: COMSTAT$fDsrHold
integer*4   Bits
end function COMSTAT$fDsrHold

integer*4 function COMSTAT$fRlsHold (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_COMSTAT$fRlsHold@4' :: COMSTAT$fRlsHold
integer*4   Bits
end function COMSTAT$fRlsHold

integer*4 function COMSTAT$fXoffHold (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_COMSTAT$fXoffHold@4' :: COMSTAT$fXoffHold
integer*4   Bits
end function COMSTAT$fXoffHold

integer*4 function COMSTAT$fXoffSent (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_COMSTAT$fXoffSent@4' :: COMSTAT$fXoffSent
integer*4   Bits
end function COMSTAT$fXoffSent

integer*4 function COMSTAT$fEof (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_COMSTAT$fEof@4' :: COMSTAT$fEof
integer*4   Bits
end function COMSTAT$fEof

integer*4 function COMSTAT$fTxim (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_COMSTAT$fTxim@4' :: COMSTAT$fTxim
integer*4   Bits
end function COMSTAT$fTxim

integer*4 function COMSTAT$fReserved (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_COMSTAT$fReserved@4' :: COMSTAT$fReserved
integer*4   Bits
end function COMSTAT$fReserved

integer*4 function DCB$fBinary (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fBinary@4' :: DCB$fBinary
integer*4   Bits
end function DCB$fBinary

integer*4 function DCB$fParity (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fParity@4' :: DCB$fParity
integer*4   Bits
end function DCB$fParity

integer*4 function DCB$fOutxCtsFlow (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fOutxCtsFlow@4' :: DCB$fOutxCtsFlow
integer*4   Bits
end function DCB$fOutxCtsFlow

integer*4 function DCB$fOutxDsrFlow (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fOutxDsrFlow@4' :: DCB$fOutxDsrFlow
integer*4   Bits
end function DCB$fOutxDsrFlow

integer*4 function DCB$fDtrControl (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fDtrControl@4' :: DCB$fDtrControl
integer*4   Bits
end function DCB$fDtrControl

integer*4 function DCB$fDsrSensitivity (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fDsrSensitivity@4' :: DCB$fDsrSensitivity
integer*4   Bits
end function DCB$fDsrSensitivity

integer*4 function DCB$fTXContinueOnXOff (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fTXContinueOnXOff@4' :: DCB$fTXContinueOnXOff
integer*4   Bits
end function DCB$fTXContinueOnXOff

integer*4 function DCB$fOutX (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fOutX@4' :: DCB$fOutX
integer*4   Bits
end function DCB$fOutX

integer*4 function DCB$fInX (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fInX@4' :: DCB$fInX
integer*4   Bits
end function DCB$fInX

integer*4 function DCB$fErrorChar (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fErrorChar@4' :: DCB$fErrorChar
integer*4   Bits
end function DCB$fErrorChar

integer*4 function DCB$fNull (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fNull@4' :: DCB$fNull
integer*4   Bits
end function DCB$fNull

integer*4 function DCB$fRtsControl (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fRtsControl@4' :: DCB$fRtsControl
integer*4   Bits
end function DCB$fRtsControl

integer*4 function DCB$fAbortOnError (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fAbortOnError@4' :: DCB$fAbortOnError
integer*4   Bits
end function DCB$fAbortOnError

integer*4 function DCB$fDummy2 (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DCB$fDummy2@4' :: DCB$fDummy2
integer*4   Bits
end function DCB$fDummy2
end interface

!
! DDE.F90
!
interface
integer*4 function DDEPACK$bAppReturnedCode (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DDEPACK$bAppReturnedCode@4' :: DDEPACK$bAppReturnedCode
integer*4   Bits
end function DDEPACK$bAppReturnedCode

integer*4 function DDEPACK$reserved (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DDEPACK$reserved@4' :: DDEPACK$reserved
integer*4   Bits
end function DDEPACK$reserved

integer*4 function DDEPACK$fBusy (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DDEPACK$fBusy@4' :: DDEPACK$fBusy
integer*4   Bits
end function DDEPACK$fBusy

integer*4 function DDEPACK$fAck (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_DDEPACK$fAck@4' :: DDEPACK$fAck
integer*4   Bits
end function DDEPACK$fAck

integer*4 function T_DDEADVISE$reserved (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEADVISE$reserved@4' :: T_DDEADVISE$reserved
integer*4   Bits
end function T_DDEADVISE$reserved

integer*4 function T_DDEADVISE$fDeferUpd (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEADVISE$fDeferUpd@4' :: T_DDEADVISE$fDeferUpd
integer*4   Bits
end function T_DDEADVISE$fDeferUpd

integer*4 function T_DDEADVISE$fAckReq (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEADVISE$fAckReq@4' :: T_DDEADVISE$fAckReq
integer*4   Bits
end function T_DDEADVISE$fAckReq

integer*4 function T_DDEDATA$unused (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEDATA$unused@4' :: T_DDEDATA$unused
integer*4   Bits
end function T_DDEDATA$unused

integer*4 function T_DDEDATA$fResponse (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEDATA$fResponse@4' :: T_DDEDATA$fResponse
integer*4   Bits
end function T_DDEDATA$fResponse

integer*4 function T_DDEDATA$fRelease (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEDATA$fRelease@4' :: T_DDEDATA$fRelease
integer*4   Bits
end function T_DDEDATA$fRelease

integer*4 function T_DDEDATA$reserved (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEDATA$reserved@4' :: T_DDEDATA$reserved
integer*4   Bits
end function T_DDEDATA$reserved

integer*4 function T_DDEDATA$fAckReq (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEDATA$fAckReq@4' :: T_DDEDATA$fAckReq
integer*4   Bits
end function T_DDEDATA$fAckReq

integer*4 function T_DDEPOKE$unused (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEPOKE$unused@4' :: T_DDEPOKE$unused
integer*4   Bits
end function T_DDEPOKE$unused

integer*4 function T_DDEPOKE$fRelease (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEPOKE$fRelease@4' :: T_DDEPOKE$fRelease
integer*4   Bits
end function T_DDEPOKE$fRelease

integer*4 function T_DDEPOKE$fReserved (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEPOKE$fReserved@4' :: T_DDEPOKE$fReserved
integer*4   Bits
end function T_DDEPOKE$fReserved

integer*4 function T_DDELN$unused (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDELN$unused@4' :: T_DDELN$unused
integer*4   Bits
end function T_DDELN$unused

integer*4 function T_DDELN$fRelease (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDELN$fRelease@4' :: T_DDELN$fRelease
integer*4   Bits
end function T_DDELN$fRelease

integer*4 function T_DDELN$fDeferUpd (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDELN$fDeferUpd@4' :: T_DDELN$fDeferUpd
integer*4   Bits
end function T_DDELN$fDeferUpd

integer*4 function T_DDELN$fAckReq (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDELN$fAckReq@4' :: T_DDELN$fAckReq
integer*4   Bits
end function T_DDELN$fAckReq

integer*4 function T_DDEUP$unused (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEUP$unused@4' :: T_DDEUP$unused
integer*4   Bits
end function T_DDEUP$unused

integer*4 function T_DDEUP$fAck (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEUP$fAck@4' :: T_DDEUP$fAck
integer*4   Bits
end function T_DDEUP$fAck

integer*4 function T_DDEUP$fRelease (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEUP$fRelease@4' :: T_DDEUP$fRelease
integer*4   Bits
end function T_DDEUP$fRelease

integer*4 function T_DDEUP$fReserved (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEUP$fReserved@4' :: T_DDEUP$fReserved
integer*4   Bits
end function T_DDEUP$fReserved

integer*4 function T_DDEUP$fAckReq (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_T_DDEUP$fAckReq@4' :: T_DDEUP$fAckReq
integer*4   Bits
end function T_DDEUP$fAckReq

end interface

! **** VDMDBG

interface
integer*4 function VDMLDT_ENTRY$BaseMid (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$BaseMid@4' :: VDMLDT_ENTRY$BaseMid
integer*4   Bits
end function VDMLDT_ENTRY$BaseMid

integer*4 function VDMLDT_ENTRY$Type (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$Type@4' :: VDMLDT_ENTRY$Type
integer*4   Bits
end function VDMLDT_ENTRY$Type

integer*4 function VDMLDT_ENTRY$Dpl (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$Dpl@4' :: VDMLDT_ENTRY$Dpl
integer*4   Bits
end function VDMLDT_ENTRY$Dpl

integer*4 function VDMLDT_ENTRY$Pres (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$Pres@4' :: VDMLDT_ENTRY$Pres
integer*4   Bits
end function VDMLDT_ENTRY$Pres

integer*4 function VDMLDT_ENTRY$LimitHi (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$LimitHi@4' :: VDMLDT_ENTRY$LimitHi
integer*4   Bits
end function VDMLDT_ENTRY$LimitHi

integer*4 function VDMLDT_ENTRY$Sys (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$Sys@4' :: VDMLDT_ENTRY$Sys
integer*4   Bits
end function VDMLDT_ENTRY$Sys

integer*4 function VDMLDT_ENTRY$Reserved (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$Reserved@4' :: VDMLDT_ENTRY$Reserved
integer*4   Bits
end function VDMLDT_ENTRY$Reserved

integer*4 function VDMLDT_ENTRY$Default_Big (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$Default_Big@4' :: VDMLDT_ENTRY$Default_Big
integer*4   Bits
end function VDMLDT_ENTRY$Default_Big

integer*4 function VDMLDT_ENTRY$Granularity (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$Granularity@4' :: VDMLDT_ENTRY$Granularity
integer*4   Bits
end function VDMLDT_ENTRY$Granularity

integer*4 function VDMLDT_ENTRY$BaseHi (Bits)
!MS$ ATTRIBUTES STDCALL, ALIAS : '_VDMLDT_ENTRY$BaseHi@4' :: VDMLDT_ENTRY$BaseHi
integer*4   Bits
end function VDMLDT_ENTRY$BaseHi
end interface

contains

integer(4) function GlobalDiscard (h)
integer(4)  h
GlobalDiscard = GlobalReAlloc( (h), 0, GMEM_MOVEABLE )
end function GlobalDiscard

integer(4) function LocalDiscard (h)
integer(4)  h
LocalDiscard = LocalReAlloc( (h), 0, LMEM_MOVEABLE )
end function LocalDiscard

end module msfwin

module msfwina

! Because of a conflict between the WinMain in scrnsave.lib and the
! WinMain in qwin.lib (used by QuickWin applications), this 
! library search record has been moved to msfwina.  For this reason, 
! use caution when using QuickWin and scrnsave together.

!ms$objcomment lib:"scrnsave.lib"

! Because there are conflicts between the names of APIs in MSFWIN and 
! in MSFLIB, the affected APIs have been renamed to MSFWIN$... in 
! MSFWIN.  To use these Win32 APIs, either:
! a) Use the name as it appears here, such as MSFWIN$ARC instead of ARC
! b) Rename the MSFLIB version to something else (using a rename clause
!    on the USE statement), and then rename the MSFLIB version to the
!    original name.
! c) Only use what you need from MSFLIB with an ONLY clause on the USE
!    statement, and then use MSFWINA instead of MSFWIN (see below) which
!    has the renames for these APIs already done.
! d) The same as (c), but don't use MSFLIB at all if it can be avoided.
!
! Option (d) is often the easiest.

use msfwin, arc=>msfwin$arc, ellipse=>msfwin$ellipse, &
	    floodfill=>msfwin$floodfill, getbkcolor=>msfwin$getbkcolor, &
            getpixel=>msfwin$getpixel, gettextcolor=>msfwin$gettextcolor, &
            lineto=>msfwin$lineto, pie=>msfwin$pie, &
	    rectangle=>msfwin$rectangle, &
	    selectpalette=>msfwin$selectpalette, &
	    setbkcolor=>msfwin$setbkcolor, &
	    setpixel=>msfwin$setpixel, &
	    settextcolor=>msfwin$settextcolor, &
	    polygon=>msfwin$polygon

end module

!MS$ENDIF ! /* MSFWIN_ */

