# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) QuickWin Application" 0x0107

!IF "$(CFG)" == ""
CFG=calendar - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to calendar - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "calendar - Win32 Release" && "$(CFG)" !=\
 "calendar - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "calendar.mak" CFG="calendar - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "calendar - Win32 Release" (based on\
 "Win32 (x86) QuickWin Application")
!MESSAGE "calendar - Win32 Debug" (based on "Win32 (x86) QuickWin Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
RSC=rc.exe
MTL=mktyplib.exe
F90=fl32.exe

!IF  "$(CFG)" == "calendar - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir Release
# PROP BASE Intermediate_Dir Release
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir Release
# PROP Intermediate_Dir Release
# PROP Target_Dir
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\calendar.exe"

CLEAN : 
	-@erase ".\Release\calendar.exe"
	-@erase ".\Release\TEST.OBJ"
	-@erase ".\Release\DATAMOD.mod"
	-@erase ".\Release\DATAMOD.OBJ"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo /MW
# ADD F90 /Ox /I "Release/" /c /nologo /MW
F90_PROJ=/Ox /I "Release/" /c /nologo /MW /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/calendar.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/calendar.pdb" /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/calendar.exe" 
LINK32_OBJS= \
	"$(INTDIR)/TEST.OBJ" \
	"$(INTDIR)/DATAMOD.OBJ"

"$(OUTDIR)\calendar.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "calendar - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir Debug
# PROP BASE Intermediate_Dir Debug
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir Debug
# PROP Intermediate_Dir Debug
# PROP Target_Dir
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\calendar.exe"

CLEAN : 
	-@erase ".\Debug\calendar.exe"
	-@erase ".\Debug\TEST.OBJ"
	-@erase ".\Debug\DATAMOD.mod"
	-@erase ".\Debug\DATAMOD.OBJ"
	-@erase ".\Debug\calendar.ilk"
	-@erase ".\Debug\calendar.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo /MW
# ADD F90 /Zi /I "Debug/" /c /nologo /MW
F90_PROJ=/Zi /I "Debug/" /c /nologo /MW /Fo"Debug/" /Fd"Debug/calendar.pdb" 
F90_OBJS=.\Debug/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/calendar.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/calendar.pdb" /debug /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/calendar.exe" 
LINK32_OBJS= \
	"$(INTDIR)/TEST.OBJ" \
	"$(INTDIR)/DATAMOD.OBJ"

"$(OUTDIR)\calendar.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.for{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f90{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

################################################################################
# Begin Target

# Name "calendar - Win32 Release"
# Name "calendar - Win32 Debug"

!IF  "$(CFG)" == "calendar - Win32 Release"

!ELSEIF  "$(CFG)" == "calendar - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\TEST.F90

!IF  "$(CFG)" == "calendar - Win32 Release"

DEP_F90_TEST_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\msfnls.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_TEST_=\
	".\Release\DATAMOD.mod"\
	

"$(INTDIR)\TEST.OBJ" : $(SOURCE) $(DEP_F90_TEST_) "$(INTDIR)"\
 "$(INTDIR)\DATAMOD.mod"


!ELSEIF  "$(CFG)" == "calendar - Win32 Debug"

DEP_F90_TEST_=\
	{$(INCLUDE)}"\MSFLIB.mod"\
	{$(INCLUDE)}"\msfnls.mod"\
	{$(INCLUDE)}"\MSFWIN.mod"\
	
NODEP_F90_TEST_=\
	".\Debug\DATAMOD.mod"\
	

"$(INTDIR)\TEST.OBJ" : $(SOURCE) $(DEP_F90_TEST_) "$(INTDIR)"\
 "$(INTDIR)\DATAMOD.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\DATAMOD.F90

!IF  "$(CFG)" == "calendar - Win32 Release"

F90_MODOUT=\
	"datamod"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\DATAMOD.OBJ" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\DATAMOD.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "calendar - Win32 Debug"

F90_MODOUT=\
	"datamod"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\DATAMOD.OBJ" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\DATAMOD.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
