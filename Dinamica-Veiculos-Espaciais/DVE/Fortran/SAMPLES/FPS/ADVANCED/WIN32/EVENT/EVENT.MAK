# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=event - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to event - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "event - Win32 Release" && "$(CFG)" != "event - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "event.mak" CFG="event - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "event - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "event - Win32 Debug" (based on "Win32 (x86) Console Application")
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
RSC=rc.exe
F90=fl32.exe

!IF  "$(CFG)" == "event - Win32 Release"

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

ALL : "$(OUTDIR)\event.exe"

CLEAN : 
	-@erase ".\Release\event.exe"
	-@erase ".\Release\asynioin.obj"
	-@erase ".\Release\asyn_io.obj"
	-@erase ".\Release\asynioin.mod"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/event.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/event.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/event.pdb" /machine:I386 /out:"$(OUTDIR)/event.exe" 
LINK32_OBJS= \
	"$(INTDIR)/asynioin.obj" \
	"$(INTDIR)/asyn_io.obj"

"$(OUTDIR)\event.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "event - Win32 Debug"

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

ALL : "$(OUTDIR)\event.exe"

CLEAN : 
	-@erase ".\Debug\event.exe"
	-@erase ".\Debug\asynioin.obj"
	-@erase ".\Debug\asyn_io.obj"
	-@erase ".\Debug\asynioin.mod"
	-@erase ".\Debug\event.ilk"
	-@erase ".\Debug\event.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/event.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/event.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/event.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/event.pdb" /debug /machine:I386 /out:"$(OUTDIR)/event.exe" 
LINK32_OBJS= \
	"$(INTDIR)/asynioin.obj" \
	"$(INTDIR)/asyn_io.obj"

"$(OUTDIR)\event.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "event - Win32 Release"
# Name "event - Win32 Debug"

!IF  "$(CFG)" == "event - Win32 Release"

!ELSEIF  "$(CFG)" == "event - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\asynioin.f90
DEP_F90_ASYNI=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "event - Win32 Release"

F90_MODOUT=\
	"asynioin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\asynioin.obj" : $(SOURCE) $(DEP_F90_ASYNI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\asynioin.mod" : $(SOURCE) $(DEP_F90_ASYNI) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "event - Win32 Debug"

F90_MODOUT=\
	"asynioin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\asynioin.obj" : $(SOURCE) $(DEP_F90_ASYNI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\asynioin.mod" : $(SOURCE) $(DEP_F90_ASYNI) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\asyn_io.f90

!IF  "$(CFG)" == "event - Win32 Release"

NODEP_F90_ASYN_=\
	".\Release\asynioin.mod"\
	

"$(INTDIR)\asyn_io.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\asynioin.mod"


!ELSEIF  "$(CFG)" == "event - Win32 Debug"

NODEP_F90_ASYN_=\
	".\Debug\asynioin.mod"\
	

"$(INTDIR)\asyn_io.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\asynioin.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
