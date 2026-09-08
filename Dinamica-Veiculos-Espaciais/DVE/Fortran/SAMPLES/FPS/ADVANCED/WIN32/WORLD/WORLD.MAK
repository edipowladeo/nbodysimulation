# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=world - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to world - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "world - Win32 Release" && "$(CFG)" != "world - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "world.mak" CFG="world - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "world - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "world - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "world - Win32 Release"

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

ALL : "$(OUTDIR)\world.exe"

CLEAN : 
	-@erase ".\Release\world.exe"
	-@erase ".\Release\worldinc.obj"
	-@erase ".\Release\worldfnc.obj"
	-@erase ".\Release\world1.obj"
	-@erase ".\Release\worldinc.mod"
	-@erase ".\Release\world.res"
	-@erase ".\Release\world.obj"
	-@erase ".\Release\worldfnc.mod"
	-@erase ".\Release\dlg.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/world.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/world.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/world.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/world.pdb" /machine:I386 /out:"$(OUTDIR)/world.exe" 
LINK32_OBJS= \
	"$(INTDIR)/worldinc.obj" \
	"$(INTDIR)/worldfnc.obj" \
	"$(INTDIR)/world1.obj" \
	"$(INTDIR)/world.obj" \
	"$(INTDIR)/dlg.obj" \
	"$(INTDIR)/world.res"

"$(OUTDIR)\world.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "world - Win32 Debug"

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

ALL : "$(OUTDIR)\world.exe"

CLEAN : 
	-@erase ".\Debug\world.exe"
	-@erase ".\Debug\worldinc.obj"
	-@erase ".\Debug\worldfnc.obj"
	-@erase ".\Debug\world1.obj"
	-@erase ".\Debug\worldinc.mod"
	-@erase ".\Debug\world.res"
	-@erase ".\Debug\world.obj"
	-@erase ".\Debug\worldfnc.mod"
	-@erase ".\Debug\dlg.obj"
	-@erase ".\Debug\world.ilk"
	-@erase ".\Debug\world.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/world.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/world.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/world.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/world.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/world.pdb" /debug /machine:I386 /out:"$(OUTDIR)/world.exe" 
LINK32_OBJS= \
	"$(INTDIR)/worldinc.obj" \
	"$(INTDIR)/worldfnc.obj" \
	"$(INTDIR)/world1.obj" \
	"$(INTDIR)/world.obj" \
	"$(INTDIR)/dlg.obj" \
	"$(INTDIR)/world.res"

"$(OUTDIR)\world.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "world - Win32 Release"
# Name "world - Win32 Debug"

!IF  "$(CFG)" == "world - Win32 Release"

!ELSEIF  "$(CFG)" == "world - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\worldinc.f90
DEP_F90_WORLD=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "world - Win32 Release"

F90_MODOUT=\
	"worldinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\worldinc.obj" : $(SOURCE) $(DEP_F90_WORLD) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\worldinc.mod" : $(SOURCE) $(DEP_F90_WORLD) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "world - Win32 Debug"

F90_MODOUT=\
	"worldinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\worldinc.obj" : $(SOURCE) $(DEP_F90_WORLD) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\worldinc.mod" : $(SOURCE) $(DEP_F90_WORLD) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\worldfnc.f90

!IF  "$(CFG)" == "world - Win32 Release"

F90_MODOUT=\
	"worldfnc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\worldfnc.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\worldfnc.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "world - Win32 Debug"

F90_MODOUT=\
	"worldfnc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\worldfnc.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\worldfnc.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\world1.f90

!IF  "$(CFG)" == "world - Win32 Release"

NODEP_F90_WORLD1=\
	".\Release\worldinc.mod"\
	

"$(INTDIR)\world1.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\worldinc.mod"


!ELSEIF  "$(CFG)" == "world - Win32 Debug"

NODEP_F90_WORLD1=\
	".\Debug\worldinc.mod"\
	

"$(INTDIR)\world1.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\worldinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\world.rc
DEP_RSC_WORLD_=\
	".\world.ico"\
	".\world.h"\
	".\world.dlg"\
	

"$(INTDIR)\world.res" : $(SOURCE) $(DEP_RSC_WORLD_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\world.h

!IF  "$(CFG)" == "world - Win32 Release"

!ELSEIF  "$(CFG)" == "world - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\world.f90

!IF  "$(CFG)" == "world - Win32 Release"

DEP_F90_WORLD_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_WORLD_F=\
	".\Release\worldfnc.mod"\
	".\Release\worldinc.mod"\
	

"$(INTDIR)\world.obj" : $(SOURCE) $(DEP_F90_WORLD_F) "$(INTDIR)"\
 "$(INTDIR)\worldfnc.mod" "$(INTDIR)\worldinc.mod"


!ELSEIF  "$(CFG)" == "world - Win32 Debug"

DEP_F90_WORLD_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_WORLD_F=\
	".\Debug\worldfnc.mod"\
	".\Debug\worldinc.mod"\
	

"$(INTDIR)\world.obj" : $(SOURCE) $(DEP_F90_WORLD_F) "$(INTDIR)"\
 "$(INTDIR)\worldfnc.mod" "$(INTDIR)\worldinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\dlg.f90

!IF  "$(CFG)" == "world - Win32 Release"

NODEP_F90_DLG_F=\
	".\Release\worldinc.mod"\
	

"$(INTDIR)\dlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\worldinc.mod"


!ELSEIF  "$(CFG)" == "world - Win32 Debug"

NODEP_F90_DLG_F=\
	".\Debug\worldinc.mod"\
	

"$(INTDIR)\dlg.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\worldinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
