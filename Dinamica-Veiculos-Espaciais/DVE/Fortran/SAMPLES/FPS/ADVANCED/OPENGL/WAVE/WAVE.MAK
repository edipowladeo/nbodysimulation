# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=wave - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to wave - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "wave - Win32 Release" && "$(CFG)" != "wave - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "wave.mak" CFG="wave - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "wave - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "wave - Win32 Debug" (based on "Win32 (x86) Console Application")
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

!IF  "$(CFG)" == "wave - Win32 Release"

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

ALL : "$(OUTDIR)\wave.exe"

CLEAN : 
	-@erase ".\Release\wave.exe"
	-@erase ".\Release\twaveinc.obj"
	-@erase ".\Release\twaveg.obj"
	-@erase ".\Release\twaveinc.mod"
	-@erase ".\Release\twavef.obj"
	-@erase ".\Release\twavee.obj"
	-@erase ".\Release\twaved.obj"
	-@erase ".\Release\twavec.obj"
	-@erase ".\Release\twaveb.obj"
	-@erase ".\Release\twavea.obj"
	-@erase ".\Release\twave.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/wave.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/wave.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/wave.pdb" /machine:I386 /out:"$(OUTDIR)/wave.exe" 
LINK32_OBJS= \
	"$(INTDIR)/twaveinc.obj" \
	"$(INTDIR)/twaveg.obj" \
	"$(INTDIR)/twavef.obj" \
	"$(INTDIR)/twavee.obj" \
	"$(INTDIR)/twaved.obj" \
	"$(INTDIR)/twavec.obj" \
	"$(INTDIR)/twaveb.obj" \
	"$(INTDIR)/twavea.obj" \
	"$(INTDIR)/twave.obj"

"$(OUTDIR)\wave.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

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

ALL : "$(OUTDIR)\wave.exe"

CLEAN : 
	-@erase ".\Debug\wave.exe"
	-@erase ".\Debug\twaveinc.obj"
	-@erase ".\Debug\twaveg.obj"
	-@erase ".\Debug\twaveinc.mod"
	-@erase ".\Debug\twavef.obj"
	-@erase ".\Debug\twavee.obj"
	-@erase ".\Debug\twaved.obj"
	-@erase ".\Debug\twavec.obj"
	-@erase ".\Debug\twaveb.obj"
	-@erase ".\Debug\twavea.obj"
	-@erase ".\Debug\twave.obj"
	-@erase ".\Debug\wave.ilk"
	-@erase ".\Debug\wave.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/wave.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/wave.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/wave.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/wave.pdb" /debug /machine:I386 /out:"$(OUTDIR)/wave.exe" 
LINK32_OBJS= \
	"$(INTDIR)/twaveinc.obj" \
	"$(INTDIR)/twaveg.obj" \
	"$(INTDIR)/twavef.obj" \
	"$(INTDIR)/twavee.obj" \
	"$(INTDIR)/twaved.obj" \
	"$(INTDIR)/twavec.obj" \
	"$(INTDIR)/twaveb.obj" \
	"$(INTDIR)/twavea.obj" \
	"$(INTDIR)/twave.obj"

"$(OUTDIR)\wave.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "wave - Win32 Release"
# Name "wave - Win32 Debug"

!IF  "$(CFG)" == "wave - Win32 Release"

!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\twaveinc.f90
DEP_F90_TWAVE=\
	{$(INCLUDE)}"\opengl.mod"\
	

!IF  "$(CFG)" == "wave - Win32 Release"

F90_MODOUT=\
	"twaveinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\twaveinc.obj" : $(SOURCE) $(DEP_F90_TWAVE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\twaveinc.mod" : $(SOURCE) $(DEP_F90_TWAVE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

F90_MODOUT=\
	"twaveinc"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\twaveinc.obj" : $(SOURCE) $(DEP_F90_TWAVE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\twaveinc.mod" : $(SOURCE) $(DEP_F90_TWAVE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\twaveg.f90

!IF  "$(CFG)" == "wave - Win32 Release"

DEP_F90_TWAVEG=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVEG=\
	".\Release\twaveinc.mod"\
	

"$(INTDIR)\twaveg.obj" : $(SOURCE) $(DEP_F90_TWAVEG) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

DEP_F90_TWAVEG=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVEG=\
	".\Debug\twaveinc.mod"\
	

"$(INTDIR)\twaveg.obj" : $(SOURCE) $(DEP_F90_TWAVEG) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\twavef.f90

!IF  "$(CFG)" == "wave - Win32 Release"

DEP_F90_TWAVEF=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVEF=\
	".\Release\twaveinc.mod"\
	

"$(INTDIR)\twavef.obj" : $(SOURCE) $(DEP_F90_TWAVEF) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

DEP_F90_TWAVEF=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVEF=\
	".\Debug\twaveinc.mod"\
	

"$(INTDIR)\twavef.obj" : $(SOURCE) $(DEP_F90_TWAVEF) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\twavee.f90

!IF  "$(CFG)" == "wave - Win32 Release"

DEP_F90_TWAVEE=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVEE=\
	".\Release\twaveinc.mod"\
	

"$(INTDIR)\twavee.obj" : $(SOURCE) $(DEP_F90_TWAVEE) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

DEP_F90_TWAVEE=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVEE=\
	".\Debug\twaveinc.mod"\
	

"$(INTDIR)\twavee.obj" : $(SOURCE) $(DEP_F90_TWAVEE) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\twaved.f90

!IF  "$(CFG)" == "wave - Win32 Release"

DEP_F90_TWAVED=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVED=\
	".\Release\twaveinc.mod"\
	

"$(INTDIR)\twaved.obj" : $(SOURCE) $(DEP_F90_TWAVED) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

DEP_F90_TWAVED=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVED=\
	".\Debug\twaveinc.mod"\
	

"$(INTDIR)\twaved.obj" : $(SOURCE) $(DEP_F90_TWAVED) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\twavec.f90
DEP_F90_TWAVEC=\
	{$(INCLUDE)}"\opengl.mod"\
	

"$(INTDIR)\twavec.obj" : $(SOURCE) $(DEP_F90_TWAVEC) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\twaveb.f90

!IF  "$(CFG)" == "wave - Win32 Release"

DEP_F90_TWAVEB=\
	{$(INCLUDE)}"\opengl.mod"\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_TWAVEB=\
	".\Release\twaveinc.mod"\
	

"$(INTDIR)\twaveb.obj" : $(SOURCE) $(DEP_F90_TWAVEB) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

DEP_F90_TWAVEB=\
	{$(INCLUDE)}"\opengl.mod"\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_TWAVEB=\
	".\Debug\twaveinc.mod"\
	

"$(INTDIR)\twaveb.obj" : $(SOURCE) $(DEP_F90_TWAVEB) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\twavea.f90

!IF  "$(CFG)" == "wave - Win32 Release"

DEP_F90_TWAVEA=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVEA=\
	".\Release\twaveinc.mod"\
	

"$(INTDIR)\twavea.obj" : $(SOURCE) $(DEP_F90_TWAVEA) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

DEP_F90_TWAVEA=\
	{$(INCLUDE)}"\msfwin.mod"\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVEA=\
	".\Debug\twaveinc.mod"\
	

"$(INTDIR)\twavea.obj" : $(SOURCE) $(DEP_F90_TWAVEA) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\twave.f90

!IF  "$(CFG)" == "wave - Win32 Release"

DEP_F90_TWAVE_=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVE_=\
	".\Release\twaveinc.mod"\
	

"$(INTDIR)\twave.obj" : $(SOURCE) $(DEP_F90_TWAVE_) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ELSEIF  "$(CFG)" == "wave - Win32 Debug"

DEP_F90_TWAVE_=\
	{$(INCLUDE)}"\opengl.mod"\
	
NODEP_F90_TWAVE_=\
	".\Debug\twaveinc.mod"\
	

"$(INTDIR)\twave.obj" : $(SOURCE) $(DEP_F90_TWAVE_) "$(INTDIR)"\
 "$(INTDIR)\twaveinc.mod"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
