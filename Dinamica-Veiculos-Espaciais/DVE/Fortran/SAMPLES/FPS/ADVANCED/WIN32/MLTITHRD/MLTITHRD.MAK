# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=mltithrd - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to mltithrd - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "mltithrd - Win32 Release" && "$(CFG)" !=\
 "mltithrd - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "mltithrd.mak" CFG="mltithrd - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "mltithrd - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "mltithrd - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "mltithrd - Win32 Release"

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

ALL : "$(OUTDIR)\mltithrd.exe"

CLEAN : 
	-@erase ".\Release\mltithrd.exe"
	-@erase ".\Release\thrdinc.obj"
	-@erase ".\Release\mltthrdf.obj"
	-@erase ".\Release\thrdinc.mod"
	-@erase ".\Release\mltthrde.obj"
	-@erase ".\Release\mltthrdd.obj"
	-@erase ".\Release\mltthrdc.obj"
	-@erase ".\Release\mltthrdb.obj"
	-@erase ".\Release\mltthrda.obj"
	-@erase ".\Release\mltithrd.res"
	-@erase ".\Release\mltithrd.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/mltithrd.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/mltithrd.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/mltithrd.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/mltithrd.pdb" /machine:I386 /out:"$(OUTDIR)/mltithrd.exe" 
LINK32_OBJS= \
	"$(INTDIR)/thrdinc.obj" \
	"$(INTDIR)/mltthrdf.obj" \
	"$(INTDIR)/mltthrde.obj" \
	"$(INTDIR)/mltthrdd.obj" \
	"$(INTDIR)/mltthrdc.obj" \
	"$(INTDIR)/mltthrdb.obj" \
	"$(INTDIR)/mltthrda.obj" \
	"$(INTDIR)/mltithrd.obj" \
	"$(INTDIR)/mltithrd.res"

"$(OUTDIR)\mltithrd.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

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

ALL : "$(OUTDIR)\mltithrd.exe"

CLEAN : 
	-@erase ".\Debug\mltithrd.exe"
	-@erase ".\Debug\thrdinc.obj"
	-@erase ".\Debug\mltthrdf.obj"
	-@erase ".\Debug\thrdinc.mod"
	-@erase ".\Debug\mltthrde.obj"
	-@erase ".\Debug\mltthrdd.obj"
	-@erase ".\Debug\mltthrdc.obj"
	-@erase ".\Debug\mltthrdb.obj"
	-@erase ".\Debug\mltthrda.obj"
	-@erase ".\Debug\mltithrd.res"
	-@erase ".\Debug\mltithrd.obj"
	-@erase ".\Debug\mltithrd.ilk"
	-@erase ".\Debug\mltithrd.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/mltithrd.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/mltithrd.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/mltithrd.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/mltithrd.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/mltithrd.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/mltithrd.exe" 
LINK32_OBJS= \
	"$(INTDIR)/thrdinc.obj" \
	"$(INTDIR)/mltthrdf.obj" \
	"$(INTDIR)/mltthrde.obj" \
	"$(INTDIR)/mltthrdd.obj" \
	"$(INTDIR)/mltthrdc.obj" \
	"$(INTDIR)/mltthrdb.obj" \
	"$(INTDIR)/mltthrda.obj" \
	"$(INTDIR)/mltithrd.obj" \
	"$(INTDIR)/mltithrd.res"

"$(OUTDIR)\mltithrd.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "mltithrd - Win32 Release"
# Name "mltithrd - Win32 Debug"

!IF  "$(CFG)" == "mltithrd - Win32 Release"

!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\thrdinc.f90
DEP_F90_THRDI=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "mltithrd - Win32 Release"

F90_MODOUT=\
	"thrdinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\thrdinc.obj" : $(SOURCE) $(DEP_F90_THRDI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\thrdinc.mod" : $(SOURCE) $(DEP_F90_THRDI) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

F90_MODOUT=\
	"thrdinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\thrdinc.obj" : $(SOURCE) $(DEP_F90_THRDI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\thrdinc.mod" : $(SOURCE) $(DEP_F90_THRDI) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mltthrdf.f90

!IF  "$(CFG)" == "mltithrd - Win32 Release"

NODEP_F90_MLTTH=\
	".\Release\thrdinc.mod"\
	

"$(INTDIR)\mltthrdf.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

NODEP_F90_MLTTH=\
	".\Debug\thrdinc.mod"\
	

"$(INTDIR)\mltthrdf.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mltthrde.f90

!IF  "$(CFG)" == "mltithrd - Win32 Release"

NODEP_F90_MLTTHR=\
	".\Release\thrdinc.mod"\
	

"$(INTDIR)\mltthrde.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

NODEP_F90_MLTTHR=\
	".\Debug\thrdinc.mod"\
	

"$(INTDIR)\mltthrde.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mltthrdd.f90

!IF  "$(CFG)" == "mltithrd - Win32 Release"

NODEP_F90_MLTTHRD=\
	".\Release\thrdinc.mod"\
	

"$(INTDIR)\mltthrdd.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

NODEP_F90_MLTTHRD=\
	".\Debug\thrdinc.mod"\
	

"$(INTDIR)\mltthrdd.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mltthrdc.f90

!IF  "$(CFG)" == "mltithrd - Win32 Release"

NODEP_F90_MLTTHRDC=\
	".\Release\thrdinc.mod"\
	

"$(INTDIR)\mltthrdc.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

NODEP_F90_MLTTHRDC=\
	".\Debug\thrdinc.mod"\
	

"$(INTDIR)\mltthrdc.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mltthrdb.f90

!IF  "$(CFG)" == "mltithrd - Win32 Release"

NODEP_F90_MLTTHRDB=\
	".\Release\thrdinc.mod"\
	

"$(INTDIR)\mltthrdb.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

NODEP_F90_MLTTHRDB=\
	".\Debug\thrdinc.mod"\
	

"$(INTDIR)\mltthrdb.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\thrdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mltthrda.f90

!IF  "$(CFG)" == "mltithrd - Win32 Release"

DEP_F90_MLTTHRDA=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MLTTHRDA=\
	".\Release\thrdinc.mod"\
	

"$(INTDIR)\mltthrda.obj" : $(SOURCE) $(DEP_F90_MLTTHRDA) "$(INTDIR)"\
 "$(INTDIR)\thrdinc.mod"


!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

DEP_F90_MLTTHRDA=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MLTTHRDA=\
	".\Debug\thrdinc.mod"\
	

"$(INTDIR)\mltthrda.obj" : $(SOURCE) $(DEP_F90_MLTTHRDA) "$(INTDIR)"\
 "$(INTDIR)\thrdinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mltithrd.rc
DEP_RSC_MLTIT=\
	".\mltithrd.ico"\
	".\mltithrd.h"\
	

"$(INTDIR)\mltithrd.res" : $(SOURCE) $(DEP_RSC_MLTIT) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\mltithrd.h

!IF  "$(CFG)" == "mltithrd - Win32 Release"

!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mltithrd.f90

!IF  "$(CFG)" == "mltithrd - Win32 Release"

DEP_F90_MLTITH=\
	".\data.f90"\
	
NODEP_F90_MLTITH=\
	".\Release\thrdinc.mod"\
	

"$(INTDIR)\mltithrd.obj" : $(SOURCE) $(DEP_F90_MLTITH) "$(INTDIR)"\
 "$(INTDIR)\thrdinc.mod" ".\data.f90"


!ELSEIF  "$(CFG)" == "mltithrd - Win32 Debug"

DEP_F90_MLTITH=\
	".\data.f90"\
	
NODEP_F90_MLTITH=\
	".\Debug\thrdinc.mod"\
	

"$(INTDIR)\mltithrd.obj" : $(SOURCE) $(DEP_F90_MLTITH) "$(INTDIR)"\
 "$(INTDIR)\thrdinc.mod" ".\data.f90"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
