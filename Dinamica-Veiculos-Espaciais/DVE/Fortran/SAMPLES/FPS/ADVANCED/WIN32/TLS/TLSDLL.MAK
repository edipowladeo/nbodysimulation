# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

!IF "$(CFG)" == ""
CFG=tlsdll - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to tlsdll - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "tlsdll - Win32 Release" && "$(CFG)" != "tlsdll - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "tlsdll.mak" CFG="tlsdll - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "tlsdll - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "tlsdll - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
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
CPP=cl.exe
F90=fl32.exe

!IF  "$(CFG)" == "tlsdll - Win32 Release"

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

ALL : "$(OUTDIR)\tlsdll.dll"

CLEAN : 
	-@erase ".\Release\tlsdll.dll"
	-@erase ".\Release\tlsin.obj"
	-@erase ".\Release\tlsdll2.obj"
	-@erase ".\Release\tlsin.mod"
	-@erase ".\Release\tlsdll.obj"
	-@erase ".\Release\tlsdll.lib"
	-@erase ".\Release\tlsdll.exp"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo /MT
# ADD F90 /Ox /I "Release/" /c /nologo /MT
F90_PROJ=/Ox /I "Release/" /c /nologo /MT /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/tlsdll.pch" /YX /Fo"$(INTDIR)/" /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)/tlsdll.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /dll /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /dll /incremental:no\
 /pdb:"$(OUTDIR)/tlsdll.pdb" /machine:I386 /def:".\tlsdll.def"\
 /out:"$(OUTDIR)/tlsdll.dll" /implib:"$(OUTDIR)/tlsdll.lib" 
DEF_FILE= \
	".\tlsdll.def"
LINK32_OBJS= \
	"$(INTDIR)/tlsin.obj" \
	"$(INTDIR)/tlsdll2.obj" \
	"$(INTDIR)/tlsdll.obj"

"$(OUTDIR)\tlsdll.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "tlsdll - Win32 Debug"

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

ALL : "$(OUTDIR)\tlsdll.dll"

CLEAN : 
	-@erase ".\Debug\tlsdll.dll"
	-@erase ".\Debug\tlsin.obj"
	-@erase ".\Debug\tlsdll2.obj"
	-@erase ".\Debug\tlsin.mod"
	-@erase ".\Debug\tlsdll.obj"
	-@erase ".\Debug\tlsdll.ilk"
	-@erase ".\Debug\tlsdll.lib"
	-@erase ".\Debug\tlsdll.exp"
	-@erase ".\Debug\tlsdll.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo /MT
# ADD F90 /Zi /I "Debug/" /c /nologo /MT
F90_PROJ=/Zi /I "Debug/" /c /nologo /MT /Fo"Debug/" /Fd"Debug/tlsdll.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/tlsdll.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)/tlsdll.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /dll /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /dll /incremental:yes\
 /pdb:"$(OUTDIR)/tlsdll.pdb" /debug /machine:I386 /def:".\tlsdll.def"\
 /out:"$(OUTDIR)/tlsdll.dll" /implib:"$(OUTDIR)/tlsdll.lib" 
DEF_FILE= \
	".\tlsdll.def"
LINK32_OBJS= \
	"$(INTDIR)/tlsin.obj" \
	"$(INTDIR)/tlsdll2.obj" \
	"$(INTDIR)/tlsdll.obj"

"$(OUTDIR)\tlsdll.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "tlsdll - Win32 Release"
# Name "tlsdll - Win32 Debug"

!IF  "$(CFG)" == "tlsdll - Win32 Release"

!ELSEIF  "$(CFG)" == "tlsdll - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\tlsin.f90

!IF  "$(CFG)" == "tlsdll - Win32 Release"

F90_MODOUT=\
	"tlsin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\tlsin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\tlsin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "tlsdll - Win32 Debug"

F90_MODOUT=\
	"tlsin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\tlsin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\tlsin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\tlsdll2.f90

!IF  "$(CFG)" == "tlsdll - Win32 Release"

DEP_F90_TLSDL=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_TLSDL=\
	".\Release\tlsin.mod"\
	

"$(INTDIR)\tlsdll2.obj" : $(SOURCE) $(DEP_F90_TLSDL) "$(INTDIR)"\
 "$(INTDIR)\tlsin.mod"


!ELSEIF  "$(CFG)" == "tlsdll - Win32 Debug"

DEP_F90_TLSDL=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_TLSDL=\
	".\Debug\tlsin.mod"\
	

"$(INTDIR)\tlsdll2.obj" : $(SOURCE) $(DEP_F90_TLSDL) "$(INTDIR)"\
 "$(INTDIR)\tlsin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\tlsdll.f90
DEP_F90_TLSDLL=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\Debug/..\\tls.fi"\
	

"$(INTDIR)\tlsdll.obj" : $(SOURCE) $(DEP_F90_TLSDLL) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\tlsdll.def

!IF  "$(CFG)" == "tlsdll - Win32 Release"

!ELSEIF  "$(CFG)" == "tlsdll - Win32 Debug"

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
