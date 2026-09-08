# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=wxform - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to wxform - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "wxform - Win32 Release" && "$(CFG)" != "wxform - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "wxform.mak" CFG="wxform - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wxform - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "wxform - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "wxform - Win32 Release"

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

ALL : "$(OUTDIR)\wxform.exe"

CLEAN : 
	-@erase ".\Release\wxform.exe"
	-@erase ".\Release\wxfrminc.obj"
	-@erase ".\Release\wxform2.obj"
	-@erase ".\Release\wxfrminc.mod"
	-@erase ".\Release\wxform1.obj"
	-@erase ".\Release\wxform.res"
	-@erase ".\Release\wxform.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/wxform.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/wxform.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/wxform.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/wxform.pdb" /machine:I386 /out:"$(OUTDIR)/wxform.exe" 
LINK32_OBJS= \
	"$(INTDIR)/wxfrminc.obj" \
	"$(INTDIR)/wxform2.obj" \
	"$(INTDIR)/wxform1.obj" \
	"$(INTDIR)/wxform.obj" \
	"$(INTDIR)/wxform.res"

"$(OUTDIR)\wxform.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wxform - Win32 Debug"

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

ALL : "$(OUTDIR)\wxform.exe"

CLEAN : 
	-@erase ".\Debug\wxform.exe"
	-@erase ".\Debug\wxfrminc.obj"
	-@erase ".\Debug\wxform2.obj"
	-@erase ".\Debug\wxfrminc.mod"
	-@erase ".\Debug\wxform1.obj"
	-@erase ".\Debug\wxform.res"
	-@erase ".\Debug\wxform.obj"
	-@erase ".\Debug\wxform.ilk"
	-@erase ".\Debug\wxform.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/wxform.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/wxform.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/wxform.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/wxform.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/wxform.pdb" /debug /machine:I386 /out:"$(OUTDIR)/wxform.exe" 
LINK32_OBJS= \
	"$(INTDIR)/wxfrminc.obj" \
	"$(INTDIR)/wxform2.obj" \
	"$(INTDIR)/wxform1.obj" \
	"$(INTDIR)/wxform.obj" \
	"$(INTDIR)/wxform.res"

"$(OUTDIR)\wxform.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "wxform - Win32 Release"
# Name "wxform - Win32 Debug"

!IF  "$(CFG)" == "wxform - Win32 Release"

!ELSEIF  "$(CFG)" == "wxform - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\wxfrminc.f90
DEP_F90_WXFRM=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "wxform - Win32 Release"

F90_MODOUT=\
	"wxfrminc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\wxfrminc.obj" : $(SOURCE) $(DEP_F90_WXFRM) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\wxfrminc.mod" : $(SOURCE) $(DEP_F90_WXFRM) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "wxform - Win32 Debug"

F90_MODOUT=\
	"wxfrminc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\wxfrminc.obj" : $(SOURCE) $(DEP_F90_WXFRM) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\wxfrminc.mod" : $(SOURCE) $(DEP_F90_WXFRM) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\wxform2.f90

!IF  "$(CFG)" == "wxform - Win32 Release"

DEP_F90_WXFOR=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_WXFOR=\
	".\Release\wxfrminc.mod"\
	

"$(INTDIR)\wxform2.obj" : $(SOURCE) $(DEP_F90_WXFOR) "$(INTDIR)"\
 "$(INTDIR)\wxfrminc.mod"


!ELSEIF  "$(CFG)" == "wxform - Win32 Debug"

DEP_F90_WXFOR=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_WXFOR=\
	".\Debug\wxfrminc.mod"\
	

"$(INTDIR)\wxform2.obj" : $(SOURCE) $(DEP_F90_WXFOR) "$(INTDIR)"\
 "$(INTDIR)\wxfrminc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\wxform1.f90

!IF  "$(CFG)" == "wxform - Win32 Release"

DEP_F90_WXFORM=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_WXFORM=\
	".\Release\wxfrminc.mod"\
	

"$(INTDIR)\wxform1.obj" : $(SOURCE) $(DEP_F90_WXFORM) "$(INTDIR)"\
 "$(INTDIR)\wxfrminc.mod"


!ELSEIF  "$(CFG)" == "wxform - Win32 Debug"

DEP_F90_WXFORM=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_WXFORM=\
	".\Debug\wxfrminc.mod"\
	

"$(INTDIR)\wxform1.obj" : $(SOURCE) $(DEP_F90_WXFORM) "$(INTDIR)"\
 "$(INTDIR)\wxfrminc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\wxform.rc
DEP_RSC_WXFORM_=\
	".\wxform.ico"\
	".\wxform.h"\
	

"$(INTDIR)\wxform.res" : $(SOURCE) $(DEP_RSC_WXFORM_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\wxform.h

!IF  "$(CFG)" == "wxform - Win32 Release"

!ELSEIF  "$(CFG)" == "wxform - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\wxform.f90

!IF  "$(CFG)" == "wxform - Win32 Release"

DEP_F90_WXFORM_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_WXFORM_F=\
	".\Release\wxfrminc.mod"\
	

"$(INTDIR)\wxform.obj" : $(SOURCE) $(DEP_F90_WXFORM_F) "$(INTDIR)"\
 "$(INTDIR)\wxfrminc.mod"


!ELSEIF  "$(CFG)" == "wxform - Win32 Debug"

DEP_F90_WXFORM_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_WXFORM_F=\
	".\Debug\wxfrminc.mod"\
	

"$(INTDIR)\wxform.obj" : $(SOURCE) $(DEP_F90_WXFORM_F) "$(INTDIR)"\
 "$(INTDIR)\wxfrminc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
