# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=cube - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to cube - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "cube - Win32 Release" && "$(CFG)" != "cube - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "cube.mak" CFG="cube - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cube - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "cube - Win32 Debug" (based on "Win32 (x86) Application")
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
F90=fl32.exe
MTL=mktyplib.exe

!IF  "$(CFG)" == "cube - Win32 Release"

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

ALL : "$(OUTDIR)\cube.exe"

CLEAN : 
	-@erase ".\Release\cube.exe"
	-@erase ".\Release\sharedat.obj"
	-@erase ".\Release\menu.res"
	-@erase ".\Release\main.obj"
	-@erase ".\Release\sharedata.mod"
	-@erase ".\Release\cube.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/menu.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cube.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/cube.pdb" /machine:I386 /out:"$(OUTDIR)/cube.exe" 
LINK32_OBJS= \
	"$(INTDIR)/sharedat.obj" \
	"$(INTDIR)/main.obj" \
	"$(INTDIR)/cube.obj" \
	"$(INTDIR)/menu.res"

"$(OUTDIR)\cube.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir cube___W
# PROP BASE Intermediate_Dir cube___W
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir cube___W
# PROP Intermediate_Dir cube___W
# PROP Target_Dir
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\cube.exe"

CLEAN : 
	-@erase ".\Debug\cube.exe"
	-@erase ".\Debug\sharedat.obj"
	-@erase ".\Debug\menu.res"
	-@erase ".\Debug\main.obj"
	-@erase ".\Debug/sharedata.mod"
	-@erase ".\Debug\cube.obj"
	-@erase ".\Debug\cube.ilk"
	-@erase ".\Debug\cube.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/cube.pdb" 
F90_OBJS=.\Debug/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/menu.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cube.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/cube.pdb" /debug /machine:I386 /out:"$(OUTDIR)/cube.exe" 
LINK32_OBJS= \
	"$(INTDIR)/sharedat.obj" \
	"$(INTDIR)/main.obj" \
	"$(INTDIR)/cube.obj" \
	"$(INTDIR)/menu.res"

"$(OUTDIR)\cube.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.for{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

.f90{$(F90_OBJS)}.obj:
   $(F90) $(F90_PROJ) $<  

################################################################################
# Begin Target

# Name "cube - Win32 Release"
# Name "cube - Win32 Debug"

!IF  "$(CFG)" == "cube - Win32 Release"

!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\sharedat.f90

!IF  "$(CFG)" == "cube - Win32 Release"

F90_MODOUT=\
	"sharedata"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sharedat.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\sharedata.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

F90_MODOUT=\
	"sharedata"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\sharedat.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\sharedata.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\menu.rc
DEP_RSC_MENU_=\
	".\cube.ico"\
	{$(INCLUDE)}"\winres.h"\
	

"$(INTDIR)\menu.res" : $(SOURCE) $(DEP_RSC_MENU_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\main.f90

!IF  "$(CFG)" == "cube - Win32 Release"

DEP_F90_MAIN_=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\msflib.mod"\
	{$(INCLUDE)}"\msfwina.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_MAIN_=\
	".\Release\sharedata.mod"\
	

"$(INTDIR)\main.obj" : $(SOURCE) $(DEP_F90_MAIN_) "$(INTDIR)"\
 "$(INTDIR)\sharedata.mod"


!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

DEP_F90_MAIN_=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\Debug/sharedata.mod"\
	{$(INCLUDE)}"\msflib.mod"\
	{$(INCLUDE)}"\msfwina.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	

"$(INTDIR)\main.obj" : $(SOURCE) $(DEP_F90_MAIN_) "$(INTDIR)"\
 "$(INTDIR)\sharedata.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cube.f90

!IF  "$(CFG)" == "cube - Win32 Release"

DEP_F90_CUBE_=\
	{$(INCLUDE)}"\opengl.mod"\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CUBE_=\
	".\Release\sharedata.mod"\
	

"$(INTDIR)\cube.obj" : $(SOURCE) $(DEP_F90_CUBE_) "$(INTDIR)"\
 "$(INTDIR)\sharedata.mod"


!ELSEIF  "$(CFG)" == "cube - Win32 Debug"

DEP_F90_CUBE_=\
	{$(INCLUDE)}"\opengl.mod"\
	".\Debug/sharedata.mod"\
	{$(INCLUDE)}"\msfwin.mod"\
	

"$(INTDIR)\cube.obj" : $(SOURCE) $(DEP_F90_CUBE_) "$(INTDIR)"\
 "$(INTDIR)\sharedata.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
