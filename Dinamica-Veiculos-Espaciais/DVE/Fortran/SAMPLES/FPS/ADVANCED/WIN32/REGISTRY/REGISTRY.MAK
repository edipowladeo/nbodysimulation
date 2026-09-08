# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=registry - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to registry - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "registry - Win32 Release" && "$(CFG)" !=\
 "registry - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "registry.mak" CFG="registry - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "registry - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "registry - Win32 Debug" (based on "Win32 (x86) Application")
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
CPP=cl.exe
F90=fl32.exe
RSC=rc.exe
MTL=mktyplib.exe

!IF  "$(CFG)" == "registry - Win32 Release"

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

ALL : "$(OUTDIR)\registry.exe"

CLEAN : 
	-@erase ".\Release\registry.exe"
	-@erase ".\Release\monkeyin.obj"
	-@erase ".\Release\monkey2.obj"
	-@erase ".\Release\monkeyin.mod"
	-@erase ".\Release\monkey1.obj"
	-@erase ".\Release\monkey.res"
	-@erase ".\Release\monkey.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/registry.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/monkey.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/registry.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/registry.pdb" /machine:I386 /out:"$(OUTDIR)/registry.exe" 
LINK32_OBJS= \
	"$(INTDIR)/monkeyin.obj" \
	"$(INTDIR)/monkey2.obj" \
	"$(INTDIR)/monkey1.obj" \
	"$(INTDIR)/monkey.obj" \
	"$(INTDIR)/monkey.res"

"$(OUTDIR)\registry.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "registry - Win32 Debug"

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

ALL : "$(OUTDIR)\registry.exe"

CLEAN : 
	-@erase ".\Debug\registry.exe"
	-@erase ".\Debug\monkeyin.obj"
	-@erase ".\Debug\monkey2.obj"
	-@erase ".\Debug\monkeyin.mod"
	-@erase ".\Debug\monkey1.obj"
	-@erase ".\Debug\monkey.res"
	-@erase ".\Debug\monkey.obj"
	-@erase ".\Debug\registry.ilk"
	-@erase ".\Debug\registry.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/registry.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/registry.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/monkey.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/registry.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/registry.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/registry.exe" 
LINK32_OBJS= \
	"$(INTDIR)/monkeyin.obj" \
	"$(INTDIR)/monkey2.obj" \
	"$(INTDIR)/monkey1.obj" \
	"$(INTDIR)/monkey.obj" \
	"$(INTDIR)/monkey.res"

"$(OUTDIR)\registry.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.for{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f90{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

################################################################################
# Begin Target

# Name "registry - Win32 Release"
# Name "registry - Win32 Debug"

!IF  "$(CFG)" == "registry - Win32 Release"

!ELSEIF  "$(CFG)" == "registry - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\resource.h

!IF  "$(CFG)" == "registry - Win32 Release"

!ELSEIF  "$(CFG)" == "registry - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\monkeyin.f90

!IF  "$(CFG)" == "registry - Win32 Release"

F90_MODOUT=\
	"monkeyin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\monkeyin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\monkeyin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "registry - Win32 Debug"

F90_MODOUT=\
	"monkeyin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\monkeyin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\monkeyin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\monkey2.f90

!IF  "$(CFG)" == "registry - Win32 Release"

DEP_F90_MONKE=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MONKE=\
	".\Release\monkeyin.mod"\
	

"$(INTDIR)\monkey2.obj" : $(SOURCE) $(DEP_F90_MONKE) "$(INTDIR)"\
 "$(INTDIR)\monkeyin.mod"


!ELSEIF  "$(CFG)" == "registry - Win32 Debug"

DEP_F90_MONKE=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MONKE=\
	".\Debug\monkeyin.mod"\
	

"$(INTDIR)\monkey2.obj" : $(SOURCE) $(DEP_F90_MONKE) "$(INTDIR)"\
 "$(INTDIR)\monkeyin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\monkey1.f90

!IF  "$(CFG)" == "registry - Win32 Release"

DEP_F90_MONKEY=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MONKEY=\
	".\Release\monkeyin.mod"\
	

"$(INTDIR)\monkey1.obj" : $(SOURCE) $(DEP_F90_MONKEY) "$(INTDIR)"\
 "$(INTDIR)\monkeyin.mod"


!ELSEIF  "$(CFG)" == "registry - Win32 Debug"

DEP_F90_MONKEY=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MONKEY=\
	".\Debug\monkeyin.mod"\
	

"$(INTDIR)\monkey1.obj" : $(SOURCE) $(DEP_F90_MONKEY) "$(INTDIR)"\
 "$(INTDIR)\monkeyin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\monkey.rc
DEP_RSC_MONKEY_=\
	".\monkey.h"\
	

"$(INTDIR)\monkey.res" : $(SOURCE) $(DEP_RSC_MONKEY_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\monkey.h

!IF  "$(CFG)" == "registry - Win32 Release"

!ELSEIF  "$(CFG)" == "registry - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\monkey.f90

!IF  "$(CFG)" == "registry - Win32 Release"

DEP_F90_MONKEY_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\monkey.fi"\
	
NODEP_F90_MONKEY_F=\
	".\Release\monkeyin.mod"\
	

"$(INTDIR)\monkey.obj" : $(SOURCE) $(DEP_F90_MONKEY_F) "$(INTDIR)"\
 "$(INTDIR)\monkeyin.mod"


!ELSEIF  "$(CFG)" == "registry - Win32 Debug"

DEP_F90_MONKEY_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\monkey.fi"\
	
NODEP_F90_MONKEY_F=\
	".\Debug\monkeyin.mod"\
	

"$(INTDIR)\monkey.obj" : $(SOURCE) $(DEP_F90_MONKEY_F) "$(INTDIR)"\
 "$(INTDIR)\monkeyin.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
