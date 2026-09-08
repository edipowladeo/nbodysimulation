# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=setinfo - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to setinfo - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "setinfo - Win32 Release" && "$(CFG)" !=\
 "setinfo - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "setinfo.mak" CFG="setinfo - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "setinfo - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "setinfo - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "setinfo - Win32 Release"

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

ALL : "$(OUTDIR)\setinfo.exe"

CLEAN : 
	-@erase ".\Release\setinfo.exe"
	-@erase ".\Release\setinfob.obj"
	-@erase ".\Release\setinc.mod"
	-@erase ".\Release\setinfoa.obj"
	-@erase ".\Release\setinfo.res"
	-@erase ".\Release\setinfo.obj"
	-@erase ".\Release\setinc.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/setinfo.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/setinfo.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/setinfo.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/setinfo.pdb" /machine:I386 /out:"$(OUTDIR)/setinfo.exe" 
LINK32_OBJS= \
	"$(INTDIR)/setinfob.obj" \
	"$(INTDIR)/setinfoa.obj" \
	"$(INTDIR)/setinfo.obj" \
	"$(INTDIR)/setinc.obj" \
	"$(INTDIR)/setinfo.res"

"$(OUTDIR)\setinfo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "setinfo - Win32 Debug"

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

ALL : "$(OUTDIR)\setinfo.exe"

CLEAN : 
	-@erase ".\Debug\setinfo.exe"
	-@erase ".\Debug\setinfob.obj"
	-@erase ".\Debug\setinc.mod"
	-@erase ".\Debug\setinfoa.obj"
	-@erase ".\Debug\setinfo.res"
	-@erase ".\Debug\setinfo.obj"
	-@erase ".\Debug\setinc.obj"
	-@erase ".\Debug\setinfo.ilk"
	-@erase ".\Debug\setinfo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/setinfo.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/setinfo.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/setinfo.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/setinfo.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/setinfo.pdb" /debug /machine:I386 /out:"$(OUTDIR)/setinfo.exe" 
LINK32_OBJS= \
	"$(INTDIR)/setinfob.obj" \
	"$(INTDIR)/setinfoa.obj" \
	"$(INTDIR)/setinfo.obj" \
	"$(INTDIR)/setinc.obj" \
	"$(INTDIR)/setinfo.res"

"$(OUTDIR)\setinfo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "setinfo - Win32 Release"
# Name "setinfo - Win32 Debug"

!IF  "$(CFG)" == "setinfo - Win32 Release"

!ELSEIF  "$(CFG)" == "setinfo - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\setinfob.f90

!IF  "$(CFG)" == "setinfo - Win32 Release"

NODEP_F90_SETIN=\
	".\Release\setinc.mod"\
	

"$(INTDIR)\setinfob.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\setinc.mod"


!ELSEIF  "$(CFG)" == "setinfo - Win32 Debug"

NODEP_F90_SETIN=\
	".\Debug\setinc.mod"\
	

"$(INTDIR)\setinfob.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\setinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\setinfoa.f90

!IF  "$(CFG)" == "setinfo - Win32 Release"

NODEP_F90_SETINF=\
	".\Release\setinc.mod"\
	

"$(INTDIR)\setinfoa.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\setinc.mod"


!ELSEIF  "$(CFG)" == "setinfo - Win32 Debug"

NODEP_F90_SETINF=\
	".\Debug\setinc.mod"\
	

"$(INTDIR)\setinfoa.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\setinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\setinfo.rc
DEP_RSC_SETINFO=\
	".\setinfo.h"\
	

"$(INTDIR)\setinfo.res" : $(SOURCE) $(DEP_RSC_SETINFO) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\setinfo.h

!IF  "$(CFG)" == "setinfo - Win32 Release"

!ELSEIF  "$(CFG)" == "setinfo - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\setinfo.f90

!IF  "$(CFG)" == "setinfo - Win32 Release"

DEP_F90_SETINFO_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_SETINFO_=\
	".\Release\setinc.mod"\
	

"$(INTDIR)\setinfo.obj" : $(SOURCE) $(DEP_F90_SETINFO_) "$(INTDIR)"\
 "$(INTDIR)\setinc.mod"


!ELSEIF  "$(CFG)" == "setinfo - Win32 Debug"

DEP_F90_SETINFO_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_SETINFO_=\
	".\Debug\setinc.mod"\
	

"$(INTDIR)\setinfo.obj" : $(SOURCE) $(DEP_F90_SETINFO_) "$(INTDIR)"\
 "$(INTDIR)\setinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\setinc.f90
DEP_F90_SETINC=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "setinfo - Win32 Release"

F90_MODOUT=\
	"setinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\setinc.obj" : $(SOURCE) $(DEP_F90_SETINC) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\setinc.mod" : $(SOURCE) $(DEP_F90_SETINC) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "setinfo - Win32 Debug"

F90_MODOUT=\
	"setinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\setinc.obj" : $(SOURCE) $(DEP_F90_SETINC) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\setinc.mod" : $(SOURCE) $(DEP_F90_SETINC) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
