# Microsoft Developer Studio Generated NMAKE File, Format Version 40001
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=cspline - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to cspline - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "cspline - Win32 Release" && "$(CFG)" !=\
 "cspline - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "cspline.mak" CFG="cspline - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cspline - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "cspline - Win32 Debug" (based on "Win32 (x86) Application")
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
# PROP Target_Last_Scanned "cspline - Win32 Debug"
CPP=cl.exe
RSC=rc.exe
MTL=mktyplib.exe
F90=fl32.exe

!IF  "$(CFG)" == "cspline - Win32 Release"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\cspline.exe"

CLEAN : 
	-@erase ".\Release\cspline.exe"
	-@erase ".\Release\StdAfx.obj"
	-@erase ".\Release\spline.obj"
	-@erase ".\Release\scribvw.obj"
	-@erase ".\Release\scribdoc.obj"
	-@erase ".\Release\scribble.res"
	-@erase ".\Release\scribble.obj"
	-@erase ".\Release\MainFrm.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /D "LINKDIRECT" /I "Release/" /c /nologo /MT /Zl
F90_PROJ=/Ox /D "LINKDIRECT" /I "Release/" /c /nologo /MT /Zl /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /c
CPP_PROJ=/nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D\
 "_MBCS" /Fp"$(INTDIR)/cspline.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/scribble.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cspline.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /machine:I386
# ADD LINK32 libf.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=libf.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/cspline.pdb" /machine:I386 /out:"$(OUTDIR)/cspline.exe" 
LINK32_OBJS= \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/spline.obj" \
	"$(INTDIR)/scribvw.obj" \
	"$(INTDIR)/scribdoc.obj" \
	"$(INTDIR)/scribble.obj" \
	"$(INTDIR)/MainFrm.obj" \
	"$(INTDIR)/scribble.res"

"$(OUTDIR)\cspline.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "cspline - Win32 Debug"

# PROP BASE Use_MFC 5
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 5
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\cspline.exe"

CLEAN : 
	-@erase ".\Debug\cspline.exe"
	-@erase ".\Debug\StdAfx.obj"
	-@erase ".\Debug\spline.obj"
	-@erase ".\Debug\scribvw.obj"
	-@erase ".\Debug\scribdoc.obj"
	-@erase ".\Debug\scribble.res"
	-@erase ".\Debug\scribble.obj"
	-@erase ".\Debug\MainFrm.obj"
	-@erase ".\Debug\cspline.ilk"
	-@erase ".\Debug\cspline.pdb"
	-@erase ".\Debug\vc40.pdb"
	-@erase ".\Debug\vc40.idb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /D "LINKDIRECT" /I "Debug/" /c /nologo /MT /Zl
F90_PROJ=/Zi /D "LINKDIRECT" /I "Debug/" /c /nologo /MT /Zl /Fo"Debug/"\
 /Fd"Debug/cspline.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /c
# SUBTRACT CPP /YX /Yc /Yu
CPP_PROJ=/nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /D "_MBCS" /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/scribble.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cspline.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 libf.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=libf.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/cspline.pdb" /debug /machine:I386 /out:"$(OUTDIR)/cspline.exe" 
LINK32_OBJS= \
	"$(INTDIR)/StdAfx.obj" \
	"$(INTDIR)/spline.obj" \
	"$(INTDIR)/scribvw.obj" \
	"$(INTDIR)/scribdoc.obj" \
	"$(INTDIR)/scribble.obj" \
	"$(INTDIR)/MainFrm.obj" \
	"$(INTDIR)/scribble.res"

"$(OUTDIR)\cspline.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "cspline - Win32 Release"
# Name "cspline - Win32 Debug"

!IF  "$(CFG)" == "cspline - Win32 Release"

!ELSEIF  "$(CFG)" == "cspline - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\StdAfx.cpp
DEP_CPP_STDAF=\
	".\stdafx.h"\
	

"$(INTDIR)\StdAfx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\spline.for

"$(INTDIR)\spline.obj" : $(SOURCE) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\scribvw.cpp
DEP_CPP_SCRIB=\
	".\scribble.h"\
	".\scribdoc.h"\
	".\scribvw.h"\
	".\stdafx.h"\
	

"$(INTDIR)\scribvw.obj" : $(SOURCE) $(DEP_CPP_SCRIB) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\scribdoc.cpp
DEP_CPP_SCRIBD=\
	".\scribble.h"\
	".\scribdoc.h"\
	".\stdafx.h"\
	

"$(INTDIR)\scribdoc.obj" : $(SOURCE) $(DEP_CPP_SCRIBD) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\scribble.rc
DEP_RSC_SCRIBB=\
	".\res\scribble.ico"\
	".\res\scribdoc.ico"\
	".\res\toolbar.bmp"\
	".\res\scribble.rc2"\
	

"$(INTDIR)\scribble.res" : $(SOURCE) $(DEP_RSC_SCRIBB) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\scribble.cpp
DEP_CPP_SCRIBBL=\
	".\MainFrm.h"\
	".\scribble.h"\
	".\scribdoc.h"\
	".\scribvw.h"\
	".\stdafx.h"\
	

"$(INTDIR)\scribble.obj" : $(SOURCE) $(DEP_CPP_SCRIBBL) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\MainFrm.cpp
DEP_CPP_MAINF=\
	".\MainFrm.h"\
	".\scribble.h"\
	".\stdafx.h"\
	

"$(INTDIR)\MainFrm.obj" : $(SOURCE) $(DEP_CPP_MAINF) "$(INTDIR)"


# End Source File
# End Target
# End Project
################################################################################
