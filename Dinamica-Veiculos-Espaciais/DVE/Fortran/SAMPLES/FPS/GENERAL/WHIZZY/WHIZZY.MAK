# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) QuickWin Application" 0x0107

!IF "$(CFG)" == ""
CFG=whizzy - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to whizzy - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "whizzy - Win32 Release" && "$(CFG)" != "whizzy - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "whizzy.mak" CFG="whizzy - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "whizzy - Win32 Release" (based on "Win32 (x86) QuickWin Application")
!MESSAGE "whizzy - Win32 Debug" (based on "Win32 (x86) QuickWin Application")
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
F90=fl32.exe
MTL=mktyplib.exe
RSC=rc.exe

!IF  "$(CFG)" == "whizzy - Win32 Release"

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

ALL : "$(OUTDIR)\whizzy.exe"

CLEAN : 
	-@erase ".\Release\whizzy.exe"
	-@erase ".\Release\whizzy.res"
	-@erase ".\Release\whizzy.obj"

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
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/whizzy.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/whizzy.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/whizzy.pdb" /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/whizzy.exe" 
LINK32_OBJS= \
	"$(INTDIR)/whizzy.obj" \
	"$(INTDIR)/whizzy.res"

"$(OUTDIR)\whizzy.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "whizzy - Win32 Debug"

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

ALL : "$(OUTDIR)\whizzy.exe"

CLEAN : 
	-@erase ".\Debug\whizzy.exe"
	-@erase ".\Debug\whizzy.res"
	-@erase ".\Debug\whizzy.obj"
	-@erase ".\Debug\whizzy.ilk"
	-@erase ".\Debug\whizzy.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo /MW
# ADD F90 /Zi /I "Debug/" /c /nologo /MW
F90_PROJ=/Zi /I "Debug/" /c /nologo /MW /Fo"Debug/" /Fd"Debug/whizzy.pdb" 
F90_OBJS=.\Debug/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/whizzy.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/whizzy.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/whizzy.pdb" /debug /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/whizzy.exe" 
LINK32_OBJS= \
	"$(INTDIR)/whizzy.obj" \
	"$(INTDIR)/whizzy.res"

"$(OUTDIR)\whizzy.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "whizzy - Win32 Release"
# Name "whizzy - Win32 Debug"

!IF  "$(CFG)" == "whizzy - Win32 Release"

!ELSEIF  "$(CFG)" == "whizzy - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\whizzy.rc
DEP_RSC_WHIZZ=\
	{$(INCLUDE)}"\AFXRES.H"\
	{$(INCLUDE)}"\WINRES.H"\
	

"$(INTDIR)\whizzy.res" : $(SOURCE) $(DEP_RSC_WHIZZ) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\whizzy.f90
DEP_F90_WHIZZY=\
	{$(INCLUDE)}"\DIALOGM.MOD"\
	".\whizzy.fd"\
	

"$(INTDIR)\whizzy.obj" : $(SOURCE) $(DEP_F90_WHIZZY) "$(INTDIR)"


# End Source File
# End Target
# End Project
################################################################################
