# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=cube5 - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to cube5 - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "cube5 - Win32 Release" && "$(CFG)" != "cube5 - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "cube5.mak" CFG="cube5 - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cube5 - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "cube5 - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "cube5 - Win32 Release"

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

ALL : "$(OUTDIR)\cube5.exe"

CLEAN : 
	-@erase ".\Release\cube5.exe"
	-@erase ".\Release\cubeinc.obj"
	-@erase ".\Release\cube5b.obj"
	-@erase ".\Release\cubeinc.mod"
	-@erase ".\Release\cube5a.obj"
	-@erase ".\Release\cube5.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/cube5.pch" /YX /Fo"$(INTDIR)/" /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cube5.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/cube5.pdb" /machine:I386 /out:"$(OUTDIR)/cube5.exe" 
LINK32_OBJS= \
	"$(INTDIR)/cubeinc.obj" \
	"$(INTDIR)/cube5b.obj" \
	"$(INTDIR)/cube5a.obj" \
	"$(INTDIR)/cube5.obj"

"$(OUTDIR)\cube5.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "cube5 - Win32 Debug"

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

ALL : "$(OUTDIR)\cube5.exe"

CLEAN : 
	-@erase ".\Debug\cube5.exe"
	-@erase ".\Debug\cubeinc.obj"
	-@erase ".\Debug\cube5b.obj"
	-@erase ".\Debug\cubeinc.mod"
	-@erase ".\Debug\cube5a.obj"
	-@erase ".\Debug\cube5.obj"
	-@erase ".\Debug\cube5.ilk"
	-@erase ".\Debug\cube5.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/cube5.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/cube5.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
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
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cube5.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/cube5.pdb" /debug /machine:I386 /out:"$(OUTDIR)/cube5.exe" 
LINK32_OBJS= \
	"$(INTDIR)/cubeinc.obj" \
	"$(INTDIR)/cube5b.obj" \
	"$(INTDIR)/cube5a.obj" \
	"$(INTDIR)/cube5.obj"

"$(OUTDIR)\cube5.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "cube5 - Win32 Release"
# Name "cube5 - Win32 Debug"

!IF  "$(CFG)" == "cube5 - Win32 Release"

!ELSEIF  "$(CFG)" == "cube5 - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\cubeinc.f90

!IF  "$(CFG)" == "cube5 - Win32 Release"

F90_MODOUT=\
	"cubeinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\cubeinc.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\cubeinc.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "cube5 - Win32 Debug"

F90_MODOUT=\
	"cubeinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\cubeinc.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\cubeinc.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cube5b.f90

!IF  "$(CFG)" == "cube5 - Win32 Release"

DEP_F90_CUBE5=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_CUBE5=\
	".\Release\cubeinc.mod"\
	

"$(INTDIR)\cube5b.obj" : $(SOURCE) $(DEP_F90_CUBE5) "$(INTDIR)"\
 "$(INTDIR)\cubeinc.mod"


!ELSEIF  "$(CFG)" == "cube5 - Win32 Debug"

DEP_F90_CUBE5=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_CUBE5=\
	".\Debug\cubeinc.mod"\
	

"$(INTDIR)\cube5b.obj" : $(SOURCE) $(DEP_F90_CUBE5) "$(INTDIR)"\
 "$(INTDIR)\cubeinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cube5a.f90

!IF  "$(CFG)" == "cube5 - Win32 Release"

DEP_F90_CUBE5A=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_CUBE5A=\
	".\Release\cubeinc.mod"\
	

"$(INTDIR)\cube5a.obj" : $(SOURCE) $(DEP_F90_CUBE5A) "$(INTDIR)"\
 "$(INTDIR)\cubeinc.mod"


!ELSEIF  "$(CFG)" == "cube5 - Win32 Debug"

DEP_F90_CUBE5A=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_CUBE5A=\
	".\Debug\cubeinc.mod"\
	

"$(INTDIR)\cube5a.obj" : $(SOURCE) $(DEP_F90_CUBE5A) "$(INTDIR)"\
 "$(INTDIR)\cubeinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cube5.f90

!IF  "$(CFG)" == "cube5 - Win32 Release"

DEP_F90_CUBE5_=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_CUBE5_=\
	".\Release\cubeinc.mod"\
	

"$(INTDIR)\cube5.obj" : $(SOURCE) $(DEP_F90_CUBE5_) "$(INTDIR)"\
 "$(INTDIR)\cubeinc.mod"


!ELSEIF  "$(CFG)" == "cube5 - Win32 Debug"

DEP_F90_CUBE5_=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_CUBE5_=\
	".\Debug\cubeinc.mod"\
	

"$(INTDIR)\cube5.obj" : $(SOURCE) $(DEP_F90_CUBE5_) "$(INTDIR)"\
 "$(INTDIR)\cubeinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
