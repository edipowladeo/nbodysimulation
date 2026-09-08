# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=demo - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to demo - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "demo - Win32 Release" && "$(CFG)" != "demo - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "demo.mak" CFG="demo - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "demo - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "demo - Win32 Debug" (based on "Win32 (x86) Application")
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
# PROP Target_Last_Scanned "demo - Win32 Debug"
RSC=rc.exe
MTL=mktyplib.exe
CPP=cl.exe
F90=fl32.exe

!IF  "$(CFG)" == "demo - Win32 Release"

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

ALL : "$(OUTDIR)\demo.exe"

CLEAN : 
	-@erase ".\Release\demo.exe"
	-@erase ".\Release\demoin.obj"
	-@erase ".\Release\demo.obj"
	-@erase ".\Release\demoin.mod"
	-@erase ".\Release\demo1.obj"
	-@erase ".\Release\demo.res"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/demo.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/demo.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/demo.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib release\select.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 release\select.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/demo.pdb" /machine:I386 /out:"$(OUTDIR)/demo.exe" 
LINK32_OBJS= \
	"$(INTDIR)/demoin.obj" \
	"$(INTDIR)/demo.obj" \
	"$(INTDIR)/demo1.obj" \
	"$(INTDIR)/demo.res"

"$(OUTDIR)\demo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "demo - Win32 Debug"

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

ALL : "$(OUTDIR)\demo.exe"

CLEAN : 
	-@erase ".\Debug\demo.exe"
	-@erase ".\Debug\demoin.obj"
	-@erase ".\Debug\demo.obj"
	-@erase ".\Debug\demoin.mod"
	-@erase ".\Debug\demo1.obj"
	-@erase ".\Debug\demo.res"
	-@erase ".\Debug\demo.ilk"
	-@erase ".\Debug\demo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/demo.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/demo.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/demo.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/demo.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib debug\select.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 debug\select.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/demo.pdb" /debug /machine:I386 /out:"$(OUTDIR)/demo.exe" 
LINK32_OBJS= \
	"$(INTDIR)/demoin.obj" \
	"$(INTDIR)/demo.obj" \
	"$(INTDIR)/demo1.obj" \
	"$(INTDIR)/demo.res"

"$(OUTDIR)\demo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "demo - Win32 Release"
# Name "demo - Win32 Debug"

!IF  "$(CFG)" == "demo - Win32 Release"

!ELSEIF  "$(CFG)" == "demo - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\demoin.f90
DEP_F90_DEMOI=\
	{$(INCLUDE)}"\MSFWIN.MOD"\
	

!IF  "$(CFG)" == "demo - Win32 Release"

F90_MODOUT=\
	"demoin" \
	"demoin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\demoin.obj" : $(SOURCE) $(DEP_F90_DEMOI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\demoin.mod" : $(SOURCE) $(DEP_F90_DEMOI) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "demo - Win32 Debug"

F90_MODOUT=\
	"demoin" \
	"demoin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\demoin.obj" : $(SOURCE) $(DEP_F90_DEMOI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\demoin.mod" : $(SOURCE) $(DEP_F90_DEMOI) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\demo1.f90

!IF  "$(CFG)" == "demo - Win32 Release"

DEP_F90_DEMO1=\
	{$(INCLUDE)}"\MSFWIN.MOD"\
	".\Debug/..\\select.fi"\
	{$(INCLUDE)}"\MSFWINTY.MOD"\
	".\Release\demoin.mod"\
	".\Release\selectin.mod"\
	

"$(INTDIR)\demo1.obj" : $(SOURCE) $(DEP_F90_DEMO1) "$(INTDIR)"\
 "$(INTDIR)\demoin.mod"


!ELSEIF  "$(CFG)" == "demo - Win32 Debug"

DEP_F90_DEMO1=\
	".\Debug\demoin.mod"\
	".\Debug\selectin.mod"\
	{$(INCLUDE)}"\MSFWIN.MOD"\
	".\Debug/..\\select.fi"\
	{$(INCLUDE)}"\MSFWINTY.MOD"\
	

"$(INTDIR)\demo1.obj" : $(SOURCE) $(DEP_F90_DEMO1) "$(INTDIR)"\
 "$(INTDIR)\demoin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\demo.rc
DEP_RSC_DEMO_=\
	".\demo.h"\
	

"$(INTDIR)\demo.res" : $(SOURCE) $(DEP_RSC_DEMO_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\demo.h

!IF  "$(CFG)" == "demo - Win32 Release"

!ELSEIF  "$(CFG)" == "demo - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\demo.f90

!IF  "$(CFG)" == "demo - Win32 Release"

DEP_F90_DEMO_F=\
	".\Release\demoin.mod"\
	".\Release\selectin.mod"\
	{$(INCLUDE)}"\MSFWIN.MOD"\
	".\Debug/..\\demo.fi"\
	".\Debug/..\\select.fi"\
	{$(INCLUDE)}"\MSFWINTY.MOD"\
	

"$(INTDIR)\demo.obj" : $(SOURCE) $(DEP_F90_DEMO_F) "$(INTDIR)"\
 "$(INTDIR)\demoin.mod"


!ELSEIF  "$(CFG)" == "demo - Win32 Debug"

DEP_F90_DEMO_F=\
	".\Debug\demoin.mod"\
	".\Debug\selectin.mod"\
	{$(INCLUDE)}"\MSFWIN.MOD"\
	".\Debug/..\\demo.fi"\
	".\Debug/..\\select.fi"\
	{$(INCLUDE)}"\MSFWINTY.MOD"\
	

"$(INTDIR)\demo.obj" : $(SOURCE) $(DEP_F90_DEMO_F) "$(INTDIR)"\
 "$(INTDIR)\demoin.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
