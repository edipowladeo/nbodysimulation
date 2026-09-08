# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=cmndlg - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to cmndlg - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "cmndlg - Win32 Release" && "$(CFG)" != "cmndlg - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "cmndlg.mak" CFG="cmndlg - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cmndlg - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "cmndlg - Win32 Debug" (based on "Win32 (x86) Application")
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
MTL=mktyplib.exe

!IF  "$(CFG)" == "cmndlg - Win32 Release"

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

ALL : "$(OUTDIR)\cmndlg.exe"

CLEAN : 
	-@erase ".\Release\cmndlg.exe"
	-@erase ".\Release\cmndlgin.obj"
	-@erase ".\Release\cmndlg9.obj"
	-@erase ".\Release\cmndlgin.mod"
	-@erase ".\Release\cmndlg8.obj"
	-@erase ".\Release\cmndlg7.obj"
	-@erase ".\Release\cmndlg6.obj"
	-@erase ".\Release\cmndlg5.obj"
	-@erase ".\Release\cmndlg4.obj"
	-@erase ".\Release\cmndlg3.obj"
	-@erase ".\Release\cmndlg2.obj"
	-@erase ".\Release\cmndlg10.obj"
	-@erase ".\Release\cmndlg.res"
	-@erase ".\Release\cmndlg.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/cmndlg.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/cmndlg.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cmndlg.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/cmndlg.pdb" /machine:I386 /out:"$(OUTDIR)/cmndlg.exe" 
LINK32_OBJS= \
	"$(INTDIR)/cmndlgin.obj" \
	"$(INTDIR)/cmndlg9.obj" \
	"$(INTDIR)/cmndlg8.obj" \
	"$(INTDIR)/cmndlg7.obj" \
	"$(INTDIR)/cmndlg6.obj" \
	"$(INTDIR)/cmndlg5.obj" \
	"$(INTDIR)/cmndlg4.obj" \
	"$(INTDIR)/cmndlg3.obj" \
	"$(INTDIR)/cmndlg2.obj" \
	"$(INTDIR)/cmndlg10.obj" \
	"$(INTDIR)/cmndlg.obj" \
	"$(INTDIR)/cmndlg.res"

"$(OUTDIR)\cmndlg.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

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

ALL : "$(OUTDIR)\cmndlg.exe"

CLEAN : 
	-@erase ".\Debug\cmndlg.exe"
	-@erase ".\Debug\cmndlgin.obj"
	-@erase ".\Debug\cmndlg9.obj"
	-@erase ".\Debug\cmndlgin.mod"
	-@erase ".\Debug\cmndlg8.obj"
	-@erase ".\Debug\cmndlg7.obj"
	-@erase ".\Debug\cmndlg6.obj"
	-@erase ".\Debug\cmndlg5.obj"
	-@erase ".\Debug\cmndlg4.obj"
	-@erase ".\Debug\cmndlg3.obj"
	-@erase ".\Debug\cmndlg2.obj"
	-@erase ".\Debug\cmndlg10.obj"
	-@erase ".\Debug\cmndlg.res"
	-@erase ".\Debug\cmndlg.obj"
	-@erase ".\Debug\cmndlg.ilk"
	-@erase ".\Debug\cmndlg.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/cmndlg.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/cmndlg.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/cmndlg.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/cmndlg.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/cmndlg.pdb" /debug /machine:I386 /out:"$(OUTDIR)/cmndlg.exe" 
LINK32_OBJS= \
	"$(INTDIR)/cmndlgin.obj" \
	"$(INTDIR)/cmndlg9.obj" \
	"$(INTDIR)/cmndlg8.obj" \
	"$(INTDIR)/cmndlg7.obj" \
	"$(INTDIR)/cmndlg6.obj" \
	"$(INTDIR)/cmndlg5.obj" \
	"$(INTDIR)/cmndlg4.obj" \
	"$(INTDIR)/cmndlg3.obj" \
	"$(INTDIR)/cmndlg2.obj" \
	"$(INTDIR)/cmndlg10.obj" \
	"$(INTDIR)/cmndlg.obj" \
	"$(INTDIR)/cmndlg.res"

"$(OUTDIR)\cmndlg.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "cmndlg - Win32 Release"
# Name "cmndlg - Win32 Debug"

!IF  "$(CFG)" == "cmndlg - Win32 Release"

!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\cmndlgin.f90
DEP_F90_CMNDL=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "cmndlg - Win32 Release"

F90_MODOUT=\
	"cmndlgin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\cmndlgin.obj" : $(SOURCE) $(DEP_F90_CMNDL) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\cmndlgin.mod" : $(SOURCE) $(DEP_F90_CMNDL) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

F90_MODOUT=\
	"cmndlgin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\cmndlgin.obj" : $(SOURCE) $(DEP_F90_CMNDL) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\cmndlgin.mod" : $(SOURCE) $(DEP_F90_CMNDL) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg9.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

NODEP_F90_CMNDLG=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg9.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

NODEP_F90_CMNDLG=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg9.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg8.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

DEP_F90_CMNDLG8=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CMNDLG8=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg8.obj" : $(SOURCE) $(DEP_F90_CMNDLG8) "$(INTDIR)"\
 "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

DEP_F90_CMNDLG8=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CMNDLG8=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg8.obj" : $(SOURCE) $(DEP_F90_CMNDLG8) "$(INTDIR)"\
 "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg7.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

NODEP_F90_CMNDLG7=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg7.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

NODEP_F90_CMNDLG7=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg7.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg6.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

NODEP_F90_CMNDLG6=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg6.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

NODEP_F90_CMNDLG6=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg6.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg5.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

NODEP_F90_CMNDLG5=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg5.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

NODEP_F90_CMNDLG5=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg5.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg4.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

NODEP_F90_CMNDLG4=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg4.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

NODEP_F90_CMNDLG4=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg4.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg3.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

NODEP_F90_CMNDLG3=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg3.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

NODEP_F90_CMNDLG3=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg3.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg2.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

NODEP_F90_CMNDLG2=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg2.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

NODEP_F90_CMNDLG2=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg2.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg10.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

NODEP_F90_CMNDLG1=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg10.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

NODEP_F90_CMNDLG1=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg10.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg.rc
DEP_RSC_CMNDLG_=\
	".\cmndlg.h"\
	

"$(INTDIR)\cmndlg.res" : $(SOURCE) $(DEP_RSC_CMNDLG_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg.h

!IF  "$(CFG)" == "cmndlg - Win32 Release"

!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cmndlg.f90

!IF  "$(CFG)" == "cmndlg - Win32 Release"

DEP_F90_CMNDLG_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CMNDLG_F=\
	".\Release\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg.obj" : $(SOURCE) $(DEP_F90_CMNDLG_F) "$(INTDIR)"\
 "$(INTDIR)\cmndlgin.mod"


!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

DEP_F90_CMNDLG_F=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_CMNDLG_F=\
	".\Debug\cmndlgin.mod"\
	

"$(INTDIR)\cmndlg.obj" : $(SOURCE) $(DEP_F90_CMNDLG_F) "$(INTDIR)"\
 "$(INTDIR)\cmndlgin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cderr.h

!IF  "$(CFG)" == "cmndlg - Win32 Release"

!ELSEIF  "$(CFG)" == "cmndlg - Win32 Debug"

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
