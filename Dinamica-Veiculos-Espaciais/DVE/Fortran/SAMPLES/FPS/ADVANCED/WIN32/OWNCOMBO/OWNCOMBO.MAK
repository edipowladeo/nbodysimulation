# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=owncombo - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to owncombo - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "owncombo - Win32 Release" && "$(CFG)" !=\
 "owncombo - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "owncombo.mak" CFG="owncombo - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "owncombo - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "owncombo - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "owncombo - Win32 Release"

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

ALL : "$(OUTDIR)\owncombo.exe"

CLEAN : 
	-@erase ".\Release\owncombo.exe"
	-@erase ".\Release\owninc.obj"
	-@erase ".\Release\owncombo.res"
	-@erase ".\Release\owncombo.obj"
	-@erase ".\Release\owncbinc.mod"
	-@erase ".\Release\owncmboe.obj"
	-@erase ".\Release\owncmbod.obj"
	-@erase ".\Release\owncmboc.obj"
	-@erase ".\Release\owncmbob.obj"
	-@erase ".\Release\owncmboa.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/owncombo.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/owncombo.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/owncombo.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/owncombo.pdb" /machine:I386 /out:"$(OUTDIR)/owncombo.exe" 
LINK32_OBJS= \
	"$(INTDIR)/owninc.obj" \
	"$(INTDIR)/owncombo.obj" \
	"$(INTDIR)/owncmboe.obj" \
	"$(INTDIR)/owncmbod.obj" \
	"$(INTDIR)/owncmboc.obj" \
	"$(INTDIR)/owncmbob.obj" \
	"$(INTDIR)/owncmboa.obj" \
	"$(INTDIR)/owncombo.res"

"$(OUTDIR)\owncombo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

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

ALL : "$(OUTDIR)\owncombo.exe"

CLEAN : 
	-@erase ".\Debug\owncombo.exe"
	-@erase ".\Debug\owninc.obj"
	-@erase ".\Debug\owncombo.res"
	-@erase ".\Debug\owncombo.obj"
	-@erase ".\Debug\owncbinc.mod"
	-@erase ".\Debug\owncmboe.obj"
	-@erase ".\Debug\owncmbod.obj"
	-@erase ".\Debug\owncmboc.obj"
	-@erase ".\Debug\owncmbob.obj"
	-@erase ".\Debug\owncmboa.obj"
	-@erase ".\Debug\owncombo.ilk"
	-@erase ".\Debug\owncombo.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/owncombo.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/owncombo.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/owncombo.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/owncombo.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/owncombo.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/owncombo.exe" 
LINK32_OBJS= \
	"$(INTDIR)/owninc.obj" \
	"$(INTDIR)/owncombo.obj" \
	"$(INTDIR)/owncmboe.obj" \
	"$(INTDIR)/owncmbod.obj" \
	"$(INTDIR)/owncmboc.obj" \
	"$(INTDIR)/owncmbob.obj" \
	"$(INTDIR)/owncmboa.obj" \
	"$(INTDIR)/owncombo.res"

"$(OUTDIR)\owncombo.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "owncombo - Win32 Release"
# Name "owncombo - Win32 Debug"

!IF  "$(CFG)" == "owncombo - Win32 Release"

!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\owninc.f90

!IF  "$(CFG)" == "owncombo - Win32 Release"

F90_MODOUT=\
	"owncbinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\owninc.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\owncbinc.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

F90_MODOUT=\
	"owncbinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\owninc.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\owncbinc.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\owncombo.rc
DEP_RSC_OWNCO=\
	".\owncombo.ico"\
	".\owncombo.h"\
	".\owncombo.dlg"\
	

"$(INTDIR)\owncombo.res" : $(SOURCE) $(DEP_RSC_OWNCO) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\owncombo.h

!IF  "$(CFG)" == "owncombo - Win32 Release"

!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\owncombo.f90

!IF  "$(CFG)" == "owncombo - Win32 Release"

DEP_F90_OWNCOM=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCOM=\
	".\Release\owncbinc.mod"\
	

"$(INTDIR)\owncombo.obj" : $(SOURCE) $(DEP_F90_OWNCOM) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

DEP_F90_OWNCOM=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCOM=\
	".\Debug\owncbinc.mod"\
	

"$(INTDIR)\owncombo.obj" : $(SOURCE) $(DEP_F90_OWNCOM) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\owncmboe.f90

!IF  "$(CFG)" == "owncombo - Win32 Release"

DEP_F90_OWNCM=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCM=\
	".\Release\owncbinc.mod"\
	

"$(INTDIR)\owncmboe.obj" : $(SOURCE) $(DEP_F90_OWNCM) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

DEP_F90_OWNCM=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCM=\
	".\Debug\owncbinc.mod"\
	

"$(INTDIR)\owncmboe.obj" : $(SOURCE) $(DEP_F90_OWNCM) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\owncmbod.f90

!IF  "$(CFG)" == "owncombo - Win32 Release"

DEP_F90_OWNCMB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCMB=\
	".\Release\owncbinc.mod"\
	

"$(INTDIR)\owncmbod.obj" : $(SOURCE) $(DEP_F90_OWNCMB) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

DEP_F90_OWNCMB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCMB=\
	".\Debug\owncbinc.mod"\
	

"$(INTDIR)\owncmbod.obj" : $(SOURCE) $(DEP_F90_OWNCMB) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\owncmboc.f90

!IF  "$(CFG)" == "owncombo - Win32 Release"

DEP_F90_OWNCMBO=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCMBO=\
	".\Release\owncbinc.mod"\
	

"$(INTDIR)\owncmboc.obj" : $(SOURCE) $(DEP_F90_OWNCMBO) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

DEP_F90_OWNCMBO=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCMBO=\
	".\Debug\owncbinc.mod"\
	

"$(INTDIR)\owncmboc.obj" : $(SOURCE) $(DEP_F90_OWNCMBO) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\owncmbob.f90

!IF  "$(CFG)" == "owncombo - Win32 Release"

DEP_F90_OWNCMBOB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCMBOB=\
	".\Release\owncbinc.mod"\
	

"$(INTDIR)\owncmbob.obj" : $(SOURCE) $(DEP_F90_OWNCMBOB) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

DEP_F90_OWNCMBOB=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCMBOB=\
	".\Debug\owncbinc.mod"\
	

"$(INTDIR)\owncmbob.obj" : $(SOURCE) $(DEP_F90_OWNCMBOB) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\owncmboa.f90

!IF  "$(CFG)" == "owncombo - Win32 Release"

DEP_F90_OWNCMBOA=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCMBOA=\
	".\Release\owncbinc.mod"\
	

"$(INTDIR)\owncmboa.obj" : $(SOURCE) $(DEP_F90_OWNCMBOA) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ELSEIF  "$(CFG)" == "owncombo - Win32 Debug"

DEP_F90_OWNCMBOA=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_OWNCMBOA=\
	".\Debug\owncbinc.mod"\
	

"$(INTDIR)\owncmboa.obj" : $(SOURCE) $(DEP_F90_OWNCMBOA) "$(INTDIR)"\
 "$(INTDIR)\owncbinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
