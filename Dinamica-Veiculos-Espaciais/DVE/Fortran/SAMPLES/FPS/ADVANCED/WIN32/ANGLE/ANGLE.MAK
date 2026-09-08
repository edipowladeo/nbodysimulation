# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=angle - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to angle - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "angle - Win32 Release" && "$(CFG)" != "angle - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "angle.mak" CFG="angle - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "angle - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "angle - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "angle - Win32 Release"

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

ALL : "$(OUTDIR)\angle.exe"

CLEAN : 
	-@erase ".\Release\angle.exe"
	-@erase ".\Release\anglea.obj"
	-@erase ".\Release\anginc.mod"
	-@erase ".\Release\angle.res"
	-@erase ".\Release\angle.obj"
	-@erase ".\Release\anginc.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/angle.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/angle.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/angle.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/angle.pdb" /machine:I386 /out:"$(OUTDIR)/angle.exe" 
LINK32_OBJS= \
	"$(INTDIR)/anglea.obj" \
	"$(INTDIR)/angle.obj" \
	"$(INTDIR)/anginc.obj" \
	"$(INTDIR)/angle.res"

"$(OUTDIR)\angle.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "angle - Win32 Debug"

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

ALL : "$(OUTDIR)\angle.exe"

CLEAN : 
	-@erase ".\Debug\angle.exe"
	-@erase ".\Debug\anglea.obj"
	-@erase ".\Debug\anginc.mod"
	-@erase ".\Debug\angle.res"
	-@erase ".\Debug\angle.obj"
	-@erase ".\Debug\anginc.obj"
	-@erase ".\Debug\angle.ilk"
	-@erase ".\Debug\angle.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/angle.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/angle.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/angle.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/angle.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/angle.pdb" /debug /machine:I386 /out:"$(OUTDIR)/angle.exe" 
LINK32_OBJS= \
	"$(INTDIR)/anglea.obj" \
	"$(INTDIR)/angle.obj" \
	"$(INTDIR)/anginc.obj" \
	"$(INTDIR)/angle.res"

"$(OUTDIR)\angle.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "angle - Win32 Release"
# Name "angle - Win32 Debug"

!IF  "$(CFG)" == "angle - Win32 Release"

!ELSEIF  "$(CFG)" == "angle - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\anglea.f90

!IF  "$(CFG)" == "angle - Win32 Release"

DEP_F90_ANGLE=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_ANGLE=\
	".\Release\anginc.mod"\
	

"$(INTDIR)\anglea.obj" : $(SOURCE) $(DEP_F90_ANGLE) "$(INTDIR)"\
 "$(INTDIR)\anginc.mod"


!ELSEIF  "$(CFG)" == "angle - Win32 Debug"

DEP_F90_ANGLE=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_ANGLE=\
	".\Debug\anginc.mod"\
	

"$(INTDIR)\anglea.obj" : $(SOURCE) $(DEP_F90_ANGLE) "$(INTDIR)"\
 "$(INTDIR)\anginc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\angle.rc
DEP_RSC_ANGLE_=\
	".\angle.ico"\
	".\ANGLE.H"\
	

"$(INTDIR)\angle.res" : $(SOURCE) $(DEP_RSC_ANGLE_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\ANGLE.H

!IF  "$(CFG)" == "angle - Win32 Release"

!ELSEIF  "$(CFG)" == "angle - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\angle.f90

!IF  "$(CFG)" == "angle - Win32 Release"

DEP_F90_ANGLE_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\angle.fi"\
	
NODEP_F90_ANGLE_F=\
	".\Release\anginc.mod"\
	

"$(INTDIR)\angle.obj" : $(SOURCE) $(DEP_F90_ANGLE_F) "$(INTDIR)"\
 "$(INTDIR)\anginc.mod"


!ELSEIF  "$(CFG)" == "angle - Win32 Debug"

DEP_F90_ANGLE_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\angle.fi"\
	
NODEP_F90_ANGLE_F=\
	".\Debug\anginc.mod"\
	

"$(INTDIR)\angle.obj" : $(SOURCE) $(DEP_F90_ANGLE_F) "$(INTDIR)"\
 "$(INTDIR)\anginc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\anginc.f90
DEP_F90_ANGIN=\
	{$(INCLUDE)}"\msfwinty.mod"\
	

!IF  "$(CFG)" == "angle - Win32 Release"

F90_MODOUT=\
	"anginc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\anginc.obj" : $(SOURCE) $(DEP_F90_ANGIN) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\anginc.mod" : $(SOURCE) $(DEP_F90_ANGIN) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "angle - Win32 Debug"

F90_MODOUT=\
	"anginc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\anginc.obj" : $(SOURCE) $(DEP_F90_ANGIN) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\anginc.mod" : $(SOURCE) $(DEP_F90_ANGIN) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
