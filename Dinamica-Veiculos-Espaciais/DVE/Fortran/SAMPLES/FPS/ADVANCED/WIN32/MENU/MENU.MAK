# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=menu - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to menu - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "menu - Win32 Release" && "$(CFG)" != "menu - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "menu.mak" CFG="menu - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "menu - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "menu - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "menu - Win32 Release"

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

ALL : "$(OUTDIR)\menu.exe"

CLEAN : 
	-@erase ".\Release\menu.exe"
	-@erase ".\Release\menuinc.obj"
	-@erase ".\Release\menud.obj"
	-@erase ".\Release\menuinc.mod"
	-@erase ".\Release\menuc.obj"
	-@erase ".\Release\menub.obj"
	-@erase ".\Release\menua.obj"
	-@erase ".\Release\menu.res"
	-@erase ".\Release\menu.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/menu.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/menu.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/menu.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/menu.pdb" /machine:I386 /out:"$(OUTDIR)/menu.exe" 
LINK32_OBJS= \
	"$(INTDIR)/menuinc.obj" \
	"$(INTDIR)/menud.obj" \
	"$(INTDIR)/menuc.obj" \
	"$(INTDIR)/menub.obj" \
	"$(INTDIR)/menua.obj" \
	"$(INTDIR)/menu.obj" \
	"$(INTDIR)/menu.res"

"$(OUTDIR)\menu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "menu - Win32 Debug"

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

ALL : "$(OUTDIR)\menu.exe"

CLEAN : 
	-@erase ".\Debug\menu.exe"
	-@erase ".\Debug\menuinc.obj"
	-@erase ".\Debug\menud.obj"
	-@erase ".\Debug\menuinc.mod"
	-@erase ".\Debug\menuc.obj"
	-@erase ".\Debug\menub.obj"
	-@erase ".\Debug\menua.obj"
	-@erase ".\Debug\menu.res"
	-@erase ".\Debug\menu.obj"
	-@erase ".\Debug\menu.ilk"
	-@erase ".\Debug\menu.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/menu.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/menu.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/menu.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/menu.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/menu.pdb" /debug /machine:I386 /out:"$(OUTDIR)/menu.exe" 
LINK32_OBJS= \
	"$(INTDIR)/menuinc.obj" \
	"$(INTDIR)/menud.obj" \
	"$(INTDIR)/menuc.obj" \
	"$(INTDIR)/menub.obj" \
	"$(INTDIR)/menua.obj" \
	"$(INTDIR)/menu.obj" \
	"$(INTDIR)/menu.res"

"$(OUTDIR)\menu.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "menu - Win32 Release"
# Name "menu - Win32 Debug"

!IF  "$(CFG)" == "menu - Win32 Release"

!ELSEIF  "$(CFG)" == "menu - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\menuinc.f90
DEP_F90_MENUI=\
	{$(INCLUDE)}"\msfwinty.mod"\
	

!IF  "$(CFG)" == "menu - Win32 Release"

F90_MODOUT=\
	"menuinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\menuinc.obj" : $(SOURCE) $(DEP_F90_MENUI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\menuinc.mod" : $(SOURCE) $(DEP_F90_MENUI) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "menu - Win32 Debug"

F90_MODOUT=\
	"menuinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\menuinc.obj" : $(SOURCE) $(DEP_F90_MENUI) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\menuinc.mod" : $(SOURCE) $(DEP_F90_MENUI) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\menud.f90

!IF  "$(CFG)" == "menu - Win32 Release"

DEP_F90_MENUD=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\msfwinty.mod"\
	
NODEP_F90_MENUD=\
	".\Release\menuinc.mod"\
	

"$(INTDIR)\menud.obj" : $(SOURCE) $(DEP_F90_MENUD) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ELSEIF  "$(CFG)" == "menu - Win32 Debug"

DEP_F90_MENUD=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\msfwinty.mod"\
	
NODEP_F90_MENUD=\
	".\Debug\menuinc.mod"\
	

"$(INTDIR)\menud.obj" : $(SOURCE) $(DEP_F90_MENUD) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\menuc.f90

!IF  "$(CFG)" == "menu - Win32 Release"

DEP_F90_MENUC=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MENUC=\
	".\Release\menuinc.mod"\
	

"$(INTDIR)\menuc.obj" : $(SOURCE) $(DEP_F90_MENUC) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ELSEIF  "$(CFG)" == "menu - Win32 Debug"

DEP_F90_MENUC=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MENUC=\
	".\Debug\menuinc.mod"\
	

"$(INTDIR)\menuc.obj" : $(SOURCE) $(DEP_F90_MENUC) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\menub.f90

!IF  "$(CFG)" == "menu - Win32 Release"

DEP_F90_MENUB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MENUB=\
	".\Release\menuinc.mod"\
	

"$(INTDIR)\menub.obj" : $(SOURCE) $(DEP_F90_MENUB) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ELSEIF  "$(CFG)" == "menu - Win32 Debug"

DEP_F90_MENUB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MENUB=\
	".\Debug\menuinc.mod"\
	

"$(INTDIR)\menub.obj" : $(SOURCE) $(DEP_F90_MENUB) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\menua.f90

!IF  "$(CFG)" == "menu - Win32 Release"

DEP_F90_MENUA=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MENUA=\
	".\Release\menuinc.mod"\
	

"$(INTDIR)\menua.obj" : $(SOURCE) $(DEP_F90_MENUA) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ELSEIF  "$(CFG)" == "menu - Win32 Debug"

DEP_F90_MENUA=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MENUA=\
	".\Debug\menuinc.mod"\
	

"$(INTDIR)\menua.obj" : $(SOURCE) $(DEP_F90_MENUA) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\menu.rc
DEP_RSC_MENU_=\
	".\checkon.bmp"\
	".\checkoff.bmp"\
	".\menu.h"\
	".\menu.dlg"\
	

"$(INTDIR)\menu.res" : $(SOURCE) $(DEP_RSC_MENU_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\menu.h

!IF  "$(CFG)" == "menu - Win32 Release"

!ELSEIF  "$(CFG)" == "menu - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\menu.f90

!IF  "$(CFG)" == "menu - Win32 Release"

DEP_F90_MENU_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MENU_F=\
	".\Release\menuinc.mod"\
	

"$(INTDIR)\menu.obj" : $(SOURCE) $(DEP_F90_MENU_F) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ELSEIF  "$(CFG)" == "menu - Win32 Debug"

DEP_F90_MENU_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MENU_F=\
	".\Debug\menuinc.mod"\
	

"$(INTDIR)\menu.obj" : $(SOURCE) $(DEP_F90_MENU_F) "$(INTDIR)"\
 "$(INTDIR)\menuinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
