# Microsoft Visual C++ Generated NMAKE File, Format Version 40000
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

!IF "$(CFG)" == ""
CFG=maskblt - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to maskblt - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "maskblt - Win32 Release" && "$(CFG)" !=\
 "maskblt - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "maskblt.mak" CFG="maskblt - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "maskblt - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "maskblt - Win32 Debug" (based on "Win32 (x86) Application")
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

!IF  "$(CFG)" == "maskblt - Win32 Release"

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

ALL : "$(OUTDIR)\maskblt.exe"

CLEAN : 
	-@erase ".\Release\maskblt.exe"
	-@erase ".\Release\trackin.obj"
	-@erase ".\Release\track.obj"
	-@erase ".\Release\trackin.mod"
	-@erase ".\Release\mskbltin.mod"
	-@erase ".\Release\mskbltin.obj"
	-@erase ".\Release\maskblt.res"
	-@erase ".\Release\maskblt.obj"
	-@erase ".\Release\mask21.obj"
	-@erase ".\Release\bitmap.obj"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo
# ADD F90 /Ox /I "Release/" /c /nologo
F90_PROJ=/Ox /I "Release/" /c /nologo /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/maskblt.pch" /YX /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\Release/
CPP_SBRS=
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/maskblt.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/maskblt.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/maskblt.pdb" /machine:I386 /out:"$(OUTDIR)/maskblt.exe" 
LINK32_OBJS= \
	"$(INTDIR)/trackin.obj" \
	"$(INTDIR)/track.obj" \
	"$(INTDIR)/mskbltin.obj" \
	"$(INTDIR)/maskblt.obj" \
	"$(INTDIR)/mask21.obj" \
	"$(INTDIR)/bitmap.obj" \
	"$(INTDIR)/maskblt.res"

"$(OUTDIR)\maskblt.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

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

ALL : "$(OUTDIR)\maskblt.exe"

CLEAN : 
	-@erase ".\Debug\maskblt.exe"
	-@erase ".\Debug\trackin.obj"
	-@erase ".\Debug\track.obj"
	-@erase ".\Debug\trackin.mod"
	-@erase ".\Debug\mskbltin.mod"
	-@erase ".\Debug\mskbltin.obj"
	-@erase ".\Debug\maskblt.res"
	-@erase ".\Debug\maskblt.obj"
	-@erase ".\Debug\mask21.obj"
	-@erase ".\Debug\bitmap.obj"
	-@erase ".\Debug\maskblt.ilk"
	-@erase ".\Debug\maskblt.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo
# ADD F90 /Zi /I "Debug/" /c /nologo
F90_PROJ=/Zi /I "Debug/" /c /nologo /Fo"Debug/" /Fd"Debug/maskblt.pdb" 
F90_OBJS=.\Debug/
# ADD BASE CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
# ADD CPP /nologo /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /YX /c
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)/maskblt.pch" /YX /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\Debug/
CPP_SBRS=
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/maskblt.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/maskblt.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386
LINK32_FLAGS=kernel32.lib \
 \
 /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/maskblt.pdb" /debug /machine:I386 /out:"$(OUTDIR)/maskblt.exe" 
LINK32_OBJS= \
	"$(INTDIR)/trackin.obj" \
	"$(INTDIR)/track.obj" \
	"$(INTDIR)/mskbltin.obj" \
	"$(INTDIR)/maskblt.obj" \
	"$(INTDIR)/mask21.obj" \
	"$(INTDIR)/bitmap.obj" \
	"$(INTDIR)/maskblt.res"

"$(OUTDIR)\maskblt.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "maskblt - Win32 Release"
# Name "maskblt - Win32 Debug"

!IF  "$(CFG)" == "maskblt - Win32 Release"

!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\trackin.f90
DEP_F90_TRACK=\
	{$(INCLUDE)}"\msfwin.mod"\
	

!IF  "$(CFG)" == "maskblt - Win32 Release"

F90_MODOUT=\
	"trackin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\trackin.obj" : $(SOURCE) $(DEP_F90_TRACK) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\trackin.mod" : $(SOURCE) $(DEP_F90_TRACK) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

F90_MODOUT=\
	"trackin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\trackin.obj" : $(SOURCE) $(DEP_F90_TRACK) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\trackin.mod" : $(SOURCE) $(DEP_F90_TRACK) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\track.h

!IF  "$(CFG)" == "maskblt - Win32 Release"

!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\track.f90

!IF  "$(CFG)" == "maskblt - Win32 Release"

DEP_F90_TRACK_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_TRACK_=\
	".\Release\trackin.mod"\
	".\Release\mskbltin.mod"\
	

"$(INTDIR)\track.obj" : $(SOURCE) $(DEP_F90_TRACK_) "$(INTDIR)"\
 "$(INTDIR)\trackin.mod" "$(INTDIR)\mskbltin.mod"


!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

DEP_F90_TRACK_=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_TRACK_=\
	".\Debug\trackin.mod"\
	".\Debug\mskbltin.mod"\
	

"$(INTDIR)\track.obj" : $(SOURCE) $(DEP_F90_TRACK_) "$(INTDIR)"\
 "$(INTDIR)\trackin.mod" "$(INTDIR)\mskbltin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mskbltin.f90

!IF  "$(CFG)" == "maskblt - Win32 Release"

NODEP_F90_MSKBL=\
	".\Release\trackin.mod"\
	
F90_MODOUT=\
	"mskbltin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\mskbltin.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\trackin.mod"
   $(BuildCmds)

"$(INTDIR)\mskbltin.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\trackin.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

NODEP_F90_MSKBL=\
	".\Debug\trackin.mod"\
	
F90_MODOUT=\
	"mskbltin"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\mskbltin.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\trackin.mod"
   $(BuildCmds)

"$(INTDIR)\mskbltin.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\trackin.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\maskblt.rc
DEP_RSC_MASKB=\
	".\maskblt.ico"\
	".\maskblt.h"\
	

"$(INTDIR)\maskblt.res" : $(SOURCE) $(DEP_RSC_MASKB) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\maskblt.h

!IF  "$(CFG)" == "maskblt - Win32 Release"

!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\maskblt.f90

!IF  "$(CFG)" == "maskblt - Win32 Release"

DEP_F90_MASKBL=\
	".\maskblt.fi"\
	".\bitmap.fi"\
	
NODEP_F90_MASKBL=\
	".\Release\trackin.mod"\
	".\Release\mskbltin.mod"\
	

"$(INTDIR)\maskblt.obj" : $(SOURCE) $(DEP_F90_MASKBL) "$(INTDIR)"\
 "$(INTDIR)\trackin.mod" "$(INTDIR)\mskbltin.mod"


!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

DEP_F90_MASKBL=\
	".\maskblt.fi"\
	".\bitmap.fi"\
	
NODEP_F90_MASKBL=\
	".\Debug\trackin.mod"\
	".\Debug\mskbltin.mod"\
	

"$(INTDIR)\maskblt.obj" : $(SOURCE) $(DEP_F90_MASKBL) "$(INTDIR)"\
 "$(INTDIR)\trackin.mod" "$(INTDIR)\mskbltin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\mask21.f90

!IF  "$(CFG)" == "maskblt - Win32 Release"

DEP_F90_MASK2=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MASK2=\
	".\Release\mskbltin.mod"\
	

"$(INTDIR)\mask21.obj" : $(SOURCE) $(DEP_F90_MASK2) "$(INTDIR)"\
 "$(INTDIR)\mskbltin.mod"


!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

DEP_F90_MASK2=\
	{$(INCLUDE)}"\msfwin.mod"\
	
NODEP_F90_MASK2=\
	".\Debug\mskbltin.mod"\
	

"$(INTDIR)\mask21.obj" : $(SOURCE) $(DEP_F90_MASK2) "$(INTDIR)"\
 "$(INTDIR)\mskbltin.mod"


!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\bitmap.h

!IF  "$(CFG)" == "maskblt - Win32 Release"

!ELSEIF  "$(CFG)" == "maskblt - Win32 Debug"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\bitmap.f90
DEP_F90_BITMA=\
	{$(INCLUDE)}"\msfwin.mod"\
	

"$(INTDIR)\bitmap.obj" : $(SOURCE) $(DEP_F90_BITMA) "$(INTDIR)"


# End Source File
# End Target
# End Project
################################################################################
