# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

!IF "$(CFG)" == ""
CFG=tls - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to tls - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "tls - Win32 Release" && "$(CFG)" != "tls - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "tls.mak" CFG="tls - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "tls - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "tls - Win32 Debug" (based on "Win32 (x86) Console Application")
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
CPP=cl.exe
F90=fl32.exe

!IF  "$(CFG)" == "tls - Win32 Release"

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

ALL : "$(OUTDIR)\tls.exe"

CLEAN : 
	-@erase ".\Release\tls.exe"
	-@erase ".\Release\tlscall2.obj"
	-@erase ".\Release\tlscall.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/tls.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/tls.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib Release\tlsdll.lib /nologo /subsystem:console /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 Release\tlsdll.lib /nologo /subsystem:console /incremental:no\
 /pdb:"$(OUTDIR)/tls.pdb" /machine:I386 /out:"$(OUTDIR)/tls.exe" 
LINK32_OBJS= \
	"$(INTDIR)/tlscall2.obj" \
	"$(INTDIR)/tlscall.obj"

"$(OUTDIR)\tls.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "tls - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir tls___Wi
# PROP BASE Intermediate_Dir tls___Wi
# PROP BASE Target_Dir
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir Debug
# PROP Intermediate_Dir Debug
# PROP Target_Dir
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\tls.exe"

CLEAN : 
	-@erase ".\Debug\tls.exe"
	-@erase ".\Debug\tlscall2.obj"
	-@erase ".\Debug\tlscall.obj"
	-@erase ".\Debug\tls.ilk"
	-@erase ".\Debug\tls.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "tls___Wi/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/tls.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE"\
 /Fp"$(INTDIR)/tls.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/tls.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:console /debug /machine:I386
# ADD LINK32 kernel32.lib Debug\tlsdll.lib /nologo /subsystem:console /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 Debug\tlsdll.lib /nologo /subsystem:console /incremental:yes\
 /pdb:"$(OUTDIR)/tls.pdb" /debug /machine:I386 /out:"$(OUTDIR)/tls.exe" 
LINK32_OBJS= \
	"$(INTDIR)/tlscall2.obj" \
	"$(INTDIR)/tlscall.obj"

"$(OUTDIR)\tls.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "tls - Win32 Release"
# Name "tls - Win32 Debug"

!IF  "$(CFG)" == "tls - Win32 Release"

!ELSEIF  "$(CFG)" == "tls - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\tlscall2.f90
DEP_F90_TLSCA=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\Debug/..\\tls.fi"\
	

"$(INTDIR)\tlscall2.obj" : $(SOURCE) $(DEP_F90_TLSCA) "$(INTDIR)"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\tlscall.f90

!IF  "$(CFG)" == "tls - Win32 Release"

DEP_F90_TLSCAL=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\Debug/..\\tls.fi"\
	
NODEP_F90_TLSCAL=\
	".\Release\tlsin.mod"\
	

"$(INTDIR)\tlscall.obj" : $(SOURCE) $(DEP_F90_TLSCAL) "$(INTDIR)"


!ELSEIF  "$(CFG)" == "tls - Win32 Debug"

DEP_F90_TLSCAL=\
	{$(INCLUDE)}"\msfwin.mod"\
	".\Debug/tlsin.mod"\
	".\Debug/..\\tls.fi"\
	

"$(INTDIR)\tlscall.obj" : $(SOURCE) $(DEP_F90_TLSCAL) "$(INTDIR)"


!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
