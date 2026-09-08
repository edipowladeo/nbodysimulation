# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=input - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to input - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "input - Win32 Release" && "$(CFG)" != "input - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "input.mak" CFG="input - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "input - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "input - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "input - Win32 Release"

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

ALL : "$(OUTDIR)\input.exe"

CLEAN : 
	-@erase ".\Release\input.exe"
	-@erase ".\Release\inputin.obj"
	-@erase ".\Release\inputgl.obj"
	-@erase ".\Release\input3.obj"
	-@erase ".\Release\inputgl.mod"
	-@erase ".\Release\input1.obj"
	-@erase ".\Release\input.res"
	-@erase ".\Release\input.obj"
	-@erase ".\Release\inputin.mod"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/input.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/input.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/input.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/input.pdb" /machine:I386 /out:"$(OUTDIR)/input.exe" 
LINK32_OBJS= \
	"$(INTDIR)/inputin.obj" \
	"$(INTDIR)/inputgl.obj" \
	"$(INTDIR)/input3.obj" \
	"$(INTDIR)/input1.obj" \
	"$(INTDIR)/input.obj" \
	"$(INTDIR)/input.res"

"$(OUTDIR)\input.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "input - Win32 Debug"

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

ALL : "$(OUTDIR)\input.exe"

CLEAN : 
	-@erase ".\Debug\input.exe"
	-@erase ".\Debug\inputin.obj"
	-@erase ".\Debug\inputgl.obj"
	-@erase ".\Debug\input3.obj"
	-@erase ".\Debug\inputgl.mod"
	-@erase ".\Debug\input1.obj"
	-@erase ".\Debug\input.res"
	-@erase ".\Debug\input.obj"
	-@erase ".\Debug\inputin.mod"
	-@erase ".\Debug\input.ilk"
	-@erase ".\Debug\input.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/input.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/input.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/input.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/input.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/input.pdb" /debug /machine:I386 /out:"$(OUTDIR)/input.exe" 
LINK32_OBJS= \
	"$(INTDIR)/inputin.obj" \
	"$(INTDIR)/inputgl.obj" \
	"$(INTDIR)/input3.obj" \
	"$(INTDIR)/input1.obj" \
	"$(INTDIR)/input.obj" \
	"$(INTDIR)/input.res"

"$(OUTDIR)\input.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "input - Win32 Release"
# Name "input - Win32 Debug"

!IF  "$(CFG)" == "input - Win32 Release"

!ELSEIF  "$(CFG)" == "input - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\inputin.f90

!IF  "$(CFG)" == "input - Win32 Release"

F90_MODOUT=\
	"inputin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\inputin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\inputin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "input - Win32 Debug"

F90_MODOUT=\
	"inputin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\inputin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\inputin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\inputgl.f90
DEP_F90_INPUT=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "input - Win32 Release"

F90_MODOUT=\
	"inputgl"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\inputgl.obj" : $(SOURCE) $(DEP_F90_INPUT) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\inputgl.mod" : $(SOURCE) $(DEP_F90_INPUT) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "input - Win32 Debug"

F90_MODOUT=\
	"inputgl"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\inputgl.obj" : $(SOURCE) $(DEP_F90_INPUT) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\inputgl.mod" : $(SOURCE) $(DEP_F90_INPUT) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\input3.f90

!IF  "$(CFG)" == "input - Win32 Release"

NODEP_F90_INPUT3=\
	".\Release\inputgl.mod"\
	

"$(INTDIR)\input3.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\inputgl.mod"


!ELSEIF  "$(CFG)" == "input - Win32 Debug"

NODEP_F90_INPUT3=\
	".\Debug\inputgl.mod"\
	

"$(INTDIR)\input3.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\inputgl.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\input1.f90

!IF  "$(CFG)" == "input - Win32 Release"

DEP_F90_INPUT1=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_INPUT1=\
	".\Release\inputgl.mod"\
	

"$(INTDIR)\input1.obj" : $(SOURCE) $(DEP_F90_INPUT1) "$(INTDIR)"\
 "$(INTDIR)\inputgl.mod"


!ELSEIF  "$(CFG)" == "input - Win32 Debug"

DEP_F90_INPUT1=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_INPUT1=\
	".\Debug\inputgl.mod"\
	

"$(INTDIR)\input1.obj" : $(SOURCE) $(DEP_F90_INPUT1) "$(INTDIR)"\
 "$(INTDIR)\inputgl.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\input.rc
DEP_RSC_INPUT_=\
	".\input.h"\
	

"$(INTDIR)\input.res" : $(SOURCE) $(DEP_RSC_INPUT_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\input.h

!IF  "$(CFG)" == "input - Win32 Release"

!ELSEIF  "$(CFG)" == "input - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\input.f90

!IF  "$(CFG)" == "input - Win32 Release"

DEP_F90_INPUT_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_INPUT_F=\
	".\Release\inputgl.mod"\
	".\Release\inputin.mod"\
	

"$(INTDIR)\input.obj" : $(SOURCE) $(DEP_F90_INPUT_F) "$(INTDIR)"\
 "$(INTDIR)\inputgl.mod" "$(INTDIR)\inputin.mod"


!ELSEIF  "$(CFG)" == "input - Win32 Debug"

DEP_F90_INPUT_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_INPUT_F=\
	".\Debug\inputgl.mod"\
	".\Debug\inputin.mod"\
	

"$(INTDIR)\input.obj" : $(SOURCE) $(DEP_F90_INPUT_F) "$(INTDIR)"\
 "$(INTDIR)\inputgl.mod" "$(INTDIR)\inputin.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
