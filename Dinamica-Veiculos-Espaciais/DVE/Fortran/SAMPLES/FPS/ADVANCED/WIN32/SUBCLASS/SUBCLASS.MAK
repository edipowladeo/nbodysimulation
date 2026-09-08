# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=subclass - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to subclass - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "subclass - Win32 Release" && "$(CFG)" !=\
 "subclass - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "subclass.mak" CFG="subclass - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "subclass - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "subclass - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "subclass - Win32 Release"

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

ALL : "$(OUTDIR)\subclass.exe"

CLEAN : 
	-@erase ".\Release\subclass.exe"
	-@erase ".\Release\subclinc.obj"
	-@erase ".\Release\subclass.res"
	-@erase ".\Release\subclass.obj"
	-@erase ".\Release\subclinc.mod"
	-@erase ".\Release\subclasc.obj"
	-@erase ".\Release\subclasb.obj"
	-@erase ".\Release\subclasa.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/subclass.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/subclass.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/subclass.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/subclass.pdb" /machine:I386 /out:"$(OUTDIR)/subclass.exe" 
LINK32_OBJS= \
	"$(INTDIR)/subclinc.obj" \
	"$(INTDIR)/subclass.obj" \
	"$(INTDIR)/subclasc.obj" \
	"$(INTDIR)/subclasb.obj" \
	"$(INTDIR)/subclasa.obj" \
	"$(INTDIR)/subclass.res"

"$(OUTDIR)\subclass.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "subclass - Win32 Debug"

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

ALL : "$(OUTDIR)\subclass.exe"

CLEAN : 
	-@erase ".\Debug\subclass.exe"
	-@erase ".\Debug\subclinc.obj"
	-@erase ".\Debug\subclass.res"
	-@erase ".\Debug\subclass.obj"
	-@erase ".\Debug\subclinc.mod"
	-@erase ".\Debug\subclasc.obj"
	-@erase ".\Debug\subclasb.obj"
	-@erase ".\Debug\subclasa.obj"
	-@erase ".\Debug\subclass.ilk"
	-@erase ".\Debug\subclass.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/subclass.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/subclass.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/subclass.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/subclass.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/subclass.pdb" /debug /machine:I386\
 /out:"$(OUTDIR)/subclass.exe" 
LINK32_OBJS= \
	"$(INTDIR)/subclinc.obj" \
	"$(INTDIR)/subclass.obj" \
	"$(INTDIR)/subclasc.obj" \
	"$(INTDIR)/subclasb.obj" \
	"$(INTDIR)/subclasa.obj" \
	"$(INTDIR)/subclass.res"

"$(OUTDIR)\subclass.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "subclass - Win32 Release"
# Name "subclass - Win32 Debug"

!IF  "$(CFG)" == "subclass - Win32 Release"

!ELSEIF  "$(CFG)" == "subclass - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\subclinc.f90
DEP_F90_SUBCL=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "subclass - Win32 Release"

F90_MODOUT=\
	"subclinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\subclinc.obj" : $(SOURCE) $(DEP_F90_SUBCL) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\subclinc.mod" : $(SOURCE) $(DEP_F90_SUBCL) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "subclass - Win32 Debug"

F90_MODOUT=\
	"subclinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\subclinc.obj" : $(SOURCE) $(DEP_F90_SUBCL) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\subclinc.mod" : $(SOURCE) $(DEP_F90_SUBCL) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\subclass.rc
DEP_RSC_SUBCLA=\
	".\subclass.ico"\
	".\subclass.h"\
	

"$(INTDIR)\subclass.res" : $(SOURCE) $(DEP_RSC_SUBCLA) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\subclass.h

!IF  "$(CFG)" == "subclass - Win32 Release"

!ELSEIF  "$(CFG)" == "subclass - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\subclass.f90

!IF  "$(CFG)" == "subclass - Win32 Release"

NODEP_F90_SUBCLAS=\
	".\Release\subclinc.mod"\
	

"$(INTDIR)\subclass.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\subclinc.mod"


!ELSEIF  "$(CFG)" == "subclass - Win32 Debug"

NODEP_F90_SUBCLAS=\
	".\Debug\subclinc.mod"\
	

"$(INTDIR)\subclass.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\subclinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\subclasc.f90

!IF  "$(CFG)" == "subclass - Win32 Release"

NODEP_F90_SUBCLASC=\
	".\Release\subclinc.mod"\
	

"$(INTDIR)\subclasc.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\subclinc.mod"


!ELSEIF  "$(CFG)" == "subclass - Win32 Debug"

NODEP_F90_SUBCLASC=\
	".\Debug\subclinc.mod"\
	

"$(INTDIR)\subclasc.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\subclinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\subclasb.f90

!IF  "$(CFG)" == "subclass - Win32 Release"

NODEP_F90_SUBCLASB=\
	".\Release\subclinc.mod"\
	

"$(INTDIR)\subclasb.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\subclinc.mod"


!ELSEIF  "$(CFG)" == "subclass - Win32 Debug"

NODEP_F90_SUBCLASB=\
	".\Debug\subclinc.mod"\
	

"$(INTDIR)\subclasb.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\subclinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\subclasa.f90

!IF  "$(CFG)" == "subclass - Win32 Release"

NODEP_F90_SUBCLASA=\
	".\Release\subclinc.mod"\
	

"$(INTDIR)\subclasa.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\subclinc.mod"


!ELSEIF  "$(CFG)" == "subclass - Win32 Debug"

NODEP_F90_SUBCLASA=\
	".\Debug\subclinc.mod"\
	

"$(INTDIR)\subclasa.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\subclinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
