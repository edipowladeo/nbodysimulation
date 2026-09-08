# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=exitwin - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to exitwin - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "exitwin - Win32 Release" && "$(CFG)" !=\
 "exitwin - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "exitwin.mak" CFG="exitwin - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "exitwin - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "exitwin - Win32 Debug" (based on "Win32 (x86) Application")
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
MTL=mktyplib.exe

!IF  "$(CFG)" == "exitwin - Win32 Release"

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

ALL : "$(OUTDIR)\exitwin.exe"

CLEAN : 
	-@erase ".\Release\exitwin.exe"
	-@erase ".\Release\exitwini.obj"
	-@erase ".\Release\exitwin.obj"
	-@erase ".\Release\exitinc.mod"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/exitwin.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/exitwin.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/exitwin.pdb" /machine:I386 /out:"$(OUTDIR)/exitwin.exe" 
LINK32_OBJS= \
	"$(INTDIR)/exitwini.obj" \
	"$(INTDIR)/exitwin.obj"

"$(OUTDIR)\exitwin.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "exitwin - Win32 Debug"

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

ALL : "$(OUTDIR)\exitwin.exe"

CLEAN : 
	-@erase ".\Debug\exitwin.exe"
	-@erase ".\Debug\exitwini.obj"
	-@erase ".\Debug\exitwin.obj"
	-@erase ".\Debug\exitinc.mod"
	-@erase ".\Debug\exitwin.ilk"
	-@erase ".\Debug\exitwin.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/exitwin.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/exitwin.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/exitwin.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/exitwin.pdb" /debug /machine:I386 /out:"$(OUTDIR)/exitwin.exe" 
LINK32_OBJS= \
	"$(INTDIR)/exitwini.obj" \
	"$(INTDIR)/exitwin.obj"

"$(OUTDIR)\exitwin.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "exitwin - Win32 Release"
# Name "exitwin - Win32 Debug"

!IF  "$(CFG)" == "exitwin - Win32 Release"

!ELSEIF  "$(CFG)" == "exitwin - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\exitwini.f90
DEP_F90_EXITW=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "exitwin - Win32 Release"

F90_MODOUT=\
	"exitinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\exitwini.obj" : $(SOURCE) $(DEP_F90_EXITW) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\exitinc.mod" : $(SOURCE) $(DEP_F90_EXITW) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "exitwin - Win32 Debug"

F90_MODOUT=\
	"exitinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\exitwini.obj" : $(SOURCE) $(DEP_F90_EXITW) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\exitinc.mod" : $(SOURCE) $(DEP_F90_EXITW) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\exitwin.f90

!IF  "$(CFG)" == "exitwin - Win32 Release"

NODEP_F90_EXITWI=\
	".\Release\exitinc.mod"\
	

"$(INTDIR)\exitwin.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\exitinc.mod"


!ELSEIF  "$(CFG)" == "exitwin - Win32 Debug"

NODEP_F90_EXITWI=\
	".\Debug\exitinc.mod"\
	

"$(INTDIR)\exitwin.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\exitinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
