# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

!IF "$(CFG)" == ""
CFG=select - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to select - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "select - Win32 Release" && "$(CFG)" != "select - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "select.mak" CFG="select - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "select - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "select - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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
# PROP Target_Last_Scanned "select - Win32 Debug"
RSC=rc.exe
MTL=mktyplib.exe
CPP=cl.exe
F90=fl32.exe

!IF  "$(CFG)" == "select - Win32 Release"

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

ALL : "$(OUTDIR)\select.dll"

CLEAN : 
	-@erase ".\Release\select.dll"
	-@erase ".\Release\selectin.obj"
	-@erase ".\Release\select1.obj"
	-@erase ".\Release\selectin.mod"
	-@erase ".\Release\select.obj"
	-@erase ".\Release\select.lib"
	-@erase ".\Release\select.exp"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo /MT
# ADD F90 /Ox /I "Release/" /c /nologo /MT
F90_PROJ=/Ox /I "Release/" /c /nologo /MT /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/select.pch" /YX /Fo"$(INTDIR)/" /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)/select.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /dll /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /dll /incremental:no\
 /pdb:"$(OUTDIR)/select.pdb" /machine:I386 /def:".\select.def"\
 /out:"$(OUTDIR)/select.dll" /implib:"$(OUTDIR)/select.lib" 
DEF_FILE= \
	".\select.def"
LINK32_OBJS= \
	"$(INTDIR)/selectin.obj" \
	"$(INTDIR)/select1.obj" \
	"$(INTDIR)/select.obj"

"$(OUTDIR)\select.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "select - Win32 Debug"

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

ALL : "$(OUTDIR)\select.dll"

CLEAN : 
	-@erase ".\Debug\select.dll"
	-@erase ".\Debug\select1.obj"
	-@erase ".\Debug\selectin.mod"
	-@erase ".\Debug\selectin.obj"
	-@erase ".\Debug\select.obj"
	-@erase ".\Debug\select.ilk"
	-@erase ".\Debug\select.lib"
	-@erase ".\Debug\select.exp"
	-@erase ".\Debug\select.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo /MT
# ADD F90 /Zi /I "Debug/" /c /nologo /MT
F90_PROJ=/Zi /I "Debug/" /c /nologo /MT /Fo"Debug/" /Fd"Debug/select.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/select.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)/select.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /dll /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /dll /incremental:yes\
 /pdb:"$(OUTDIR)/select.pdb" /debug /machine:I386 /def:".\select.def"\
 /out:"$(OUTDIR)/select.dll" /implib:"$(OUTDIR)/select.lib" 
DEF_FILE= \
	".\select.def"
LINK32_OBJS= \
	"$(INTDIR)/select1.obj" \
	"$(INTDIR)/selectin.obj" \
	"$(INTDIR)/select.obj"

"$(OUTDIR)\select.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "select - Win32 Release"
# Name "select - Win32 Debug"

!IF  "$(CFG)" == "select - Win32 Release"

!ELSEIF  "$(CFG)" == "select - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\selectin.f90

!IF  "$(CFG)" == "select - Win32 Release"

F90_MODOUT=\
	"selectin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\selectin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\selectin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "select - Win32 Debug"

F90_MODOUT=\
	"selectin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\selectin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\selectin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\select1.f90

!IF  "$(CFG)" == "select - Win32 Release"

DEP_F90_SELEC=\
	{$(INCLUDE)}"\MSFWIN.MOD"\
	".\Release\selectin.mod"\
	

"$(INTDIR)\select1.obj" : $(SOURCE) $(DEP_F90_SELEC) "$(INTDIR)"\
 "$(INTDIR)\selectin.mod"


!ELSEIF  "$(CFG)" == "select - Win32 Debug"

DEP_F90_SELEC=\
	".\Debug\selectin.mod"\
	{$(INCLUDE)}"\MSFWIN.MOD"\
	

"$(INTDIR)\select1.obj" : $(SOURCE) $(DEP_F90_SELEC) "$(INTDIR)"\
 "$(INTDIR)\selectin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\select.f90

!IF  "$(CFG)" == "select - Win32 Release"

DEP_F90_SELECT=\
	{$(INCLUDE)}"\MSFWIN.MOD"\
	{$(INCLUDE)}"\MSFWINTY.MOD"\
	".\Release\selectin.mod"\
	

"$(INTDIR)\select.obj" : $(SOURCE) $(DEP_F90_SELECT) "$(INTDIR)"\
 "$(INTDIR)\selectin.mod"


!ELSEIF  "$(CFG)" == "select - Win32 Debug"

DEP_F90_SELECT=\
	{$(INCLUDE)}"\MSFWIN.MOD"\
	{$(INCLUDE)}"\MSFWINTY.MOD"\
	".\Debug\selectin.mod"\
	

"$(INTDIR)\select.obj" : $(SOURCE) $(DEP_F90_SELECT) "$(INTDIR)"\
 "$(INTDIR)\selectin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\select.def

!IF  "$(CFG)" == "select - Win32 Release"

!ELSEIF  "$(CFG)" == "select - Win32 Debug"

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
