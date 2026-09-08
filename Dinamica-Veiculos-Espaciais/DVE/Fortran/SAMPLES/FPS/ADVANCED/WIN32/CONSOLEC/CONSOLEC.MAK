# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=consolec - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to consolec - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "consolec - Win32 Release" && "$(CFG)" !=\
 "consolec - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "consolec.mak" CFG="consolec - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "consolec - Win32 Release" (based on\
 "Win32 (x86) Console Application")
!MESSAGE "consolec - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "consolec - Win32 Release"

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

ALL : "$(OUTDIR)\consolec.exe"

CLEAN : 
	-@erase ".\Release\consolec.exe"
	-@erase ".\Release\colorin.obj"
	-@erase ".\Release\color.obj"
	-@erase ".\Release\colorin.mod"
	-@erase ".\Release\col2.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/consolec.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/consolec.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/consolec.pdb" /machine:I386 /out:"$(OUTDIR)/consolec.exe" 
LINK32_OBJS= \
	"$(INTDIR)/colorin.obj" \
	"$(INTDIR)/color.obj" \
	"$(INTDIR)/col2.obj"

"$(OUTDIR)\consolec.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "consolec - Win32 Debug"

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

ALL : "$(OUTDIR)\consolec.exe"

CLEAN : 
	-@erase ".\Debug\consolec.exe"
	-@erase ".\Debug\colorin.obj"
	-@erase ".\Debug\color.obj"
	-@erase ".\Debug\colorin.mod"
	-@erase ".\Debug\col2.obj"
	-@erase ".\Debug\consolec.ilk"
	-@erase ".\Debug\consolec.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/consolec.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/consolec.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/consolec.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/consolec.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/consolec.exe" 
LINK32_OBJS= \
	"$(INTDIR)/colorin.obj" \
	"$(INTDIR)/color.obj" \
	"$(INTDIR)/col2.obj"

"$(OUTDIR)\consolec.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "consolec - Win32 Release"
# Name "consolec - Win32 Debug"

!IF  "$(CFG)" == "consolec - Win32 Release"

!ELSEIF  "$(CFG)" == "consolec - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\colorin.f90

!IF  "$(CFG)" == "consolec - Win32 Release"

F90_MODOUT=\
	"colorin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\colorin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\colorin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "consolec - Win32 Debug"

F90_MODOUT=\
	"colorin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\colorin.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\colorin.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\color.f90

!IF  "$(CFG)" == "consolec - Win32 Release"

DEP_F90_COLOR=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_COLOR=\
	".\Release\colorin.mod"\
	

"$(INTDIR)\color.obj" : $(SOURCE) $(DEP_F90_COLOR) "$(INTDIR)"\
 "$(INTDIR)\colorin.mod"


!ELSEIF  "$(CFG)" == "consolec - Win32 Debug"

DEP_F90_COLOR=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_COLOR=\
	".\Debug\colorin.mod"\
	

"$(INTDIR)\color.obj" : $(SOURCE) $(DEP_F90_COLOR) "$(INTDIR)"\
 "$(INTDIR)\colorin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\col2.f90

!IF  "$(CFG)" == "consolec - Win32 Release"

DEP_F90_COL2_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_COL2_=\
	".\Release\colorin.mod"\
	

"$(INTDIR)\col2.obj" : $(SOURCE) $(DEP_F90_COL2_) "$(INTDIR)"\
 "$(INTDIR)\colorin.mod"


!ELSEIF  "$(CFG)" == "consolec - Win32 Debug"

DEP_F90_COL2_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_COL2_=\
	".\Debug\colorin.mod"\
	

"$(INTDIR)\col2.obj" : $(SOURCE) $(DEP_F90_COL2_) "$(INTDIR)"\
 "$(INTDIR)\colorin.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
