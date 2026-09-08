# Microsoft Developer Studio Generated NMAKE File, Format Version 40001
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) QuickWin Application" 0x0107

!IF "$(CFG)" == ""
CFG=poker - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to poker - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "poker - Win32 Release" && "$(CFG)" != "poker - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "poker.mak" CFG="poker - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "poker - Win32 Release" (based on "Win32 (x86) QuickWin Application")
!MESSAGE "poker - Win32 Debug" (based on "Win32 (x86) QuickWin Application")
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
MTL=mktyplib.exe
F90=fl32.exe
RSC=rc.exe

!IF  "$(CFG)" == "poker - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
OUTDIR=.\Release
INTDIR=.\Release

ALL : "$(OUTDIR)\poker.exe" "$(OUTDIR)\poker.mod" "$(OUTDIR)\CardBasic.mod"\
 "$(OUTDIR)\CardDeck.mod" "$(OUTDIR)\carddrawmod.mod"\
 "$(OUTDIR)\BitmapTypes.mod"

CLEAN : 
	-@erase ".\Release\poker.exe"
	-@erase ".\Release\subclass.obj"
	-@erase ".\Release\pokerregistry.mod"
	-@erase ".\Release\scoring.mod"
	-@erase ".\Release\layout.mod"
	-@erase ".\Release\cards.mod"
	-@erase ".\Release\BitmapDraw.mod"
	-@erase ".\Release\Descript.mod"
	-@erase ".\Release\dlock.mod"
	-@erase ".\Release\cardhand.mod"
	-@erase ".\Release\scoring.obj"
	-@erase ".\Release\registry.obj"
	-@erase ".\Release\poker.res"
	-@erase ".\Release\poker.obj"
	-@erase ".\Release\subclass.mod"
	-@erase ".\Release\testhand.mod"
	-@erase ".\Release\buttonmod.mod"
	-@erase ".\Release\misc.obj"
	-@erase ".\Release\descript.obj"
	-@erase ".\Release\cards.obj"
	-@erase ".\Release\button.obj"
	-@erase ".\Release\bitmap.obj"
	-@erase ".\Release\poker.mod"
	-@erase ".\Release\CardBasic.mod"
	-@erase ".\Release\CardDeck.mod"
	-@erase ".\Release\carddrawmod.mod"
	-@erase ".\Release\BitmapTypes.mod"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Ox /I "Release/" /c /nologo /MW
# ADD F90 /Ox /I "Release/" /c /nologo /MW
F90_PROJ=/Ox /I "Release/" /c /nologo /MW /Fo"Release/" 
F90_OBJS=.\Release/
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /win32
MTL_PROJ=/nologo /D "NDEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/poker.res" /d "NDEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/poker.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)/poker.pdb" /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/poker.exe" 
LINK32_OBJS= \
	"$(INTDIR)/subclass.obj" \
	"$(INTDIR)/scoring.obj" \
	"$(INTDIR)/registry.obj" \
	"$(INTDIR)/poker.obj" \
	"$(INTDIR)/misc.obj" \
	"$(INTDIR)/descript.obj" \
	"$(INTDIR)/cards.obj" \
	"$(INTDIR)/button.obj" \
	"$(INTDIR)/bitmap.obj" \
	"$(INTDIR)/poker.res"

"$(OUTDIR)\poker.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Target_Dir ""
OUTDIR=.\Debug
INTDIR=.\Debug

ALL : "$(OUTDIR)\poker.exe" "$(OUTDIR)\poker.mod" "$(OUTDIR)\CardBasic.mod"\
 "$(OUTDIR)\CardDeck.mod" "$(OUTDIR)\carddrawmod.mod"\
 "$(OUTDIR)\BitmapTypes.mod"

CLEAN : 
	-@erase ".\Debug\poker.exe"
	-@erase ".\Debug\subclass.obj"
	-@erase ".\Debug\pokerregistry.mod"
	-@erase ".\Debug\scoring.mod"
	-@erase ".\Debug\layout.mod"
	-@erase ".\Debug\cards.mod"
	-@erase ".\Debug\BitmapDraw.mod"
	-@erase ".\Debug\Descript.mod"
	-@erase ".\Debug\dlock.mod"
	-@erase ".\Debug\cardhand.mod"
	-@erase ".\Debug\scoring.obj"
	-@erase ".\Debug\registry.obj"
	-@erase ".\Debug\poker.res"
	-@erase ".\Debug\poker.obj"
	-@erase ".\Debug\subclass.mod"
	-@erase ".\Debug\testhand.mod"
	-@erase ".\Debug\buttonmod.mod"
	-@erase ".\Debug\misc.obj"
	-@erase ".\Debug\descript.obj"
	-@erase ".\Debug\cards.obj"
	-@erase ".\Debug\button.obj"
	-@erase ".\Debug\bitmap.obj"
	-@erase ".\Debug\poker.ilk"
	-@erase ".\Debug\poker.pdb"
	-@erase ".\Debug\poker.mod"
	-@erase ".\Debug\CardBasic.mod"
	-@erase ".\Debug\CardDeck.mod"
	-@erase ".\Debug\carddrawmod.mod"
	-@erase ".\Debug\BitmapTypes.mod"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE F90 /Zi /I "Debug/" /c /nologo /MW
# ADD F90 /Zi /I "Debug/" /c /nologo /MW
F90_PROJ=/Zi /I "Debug/" /c /nologo /MW /Fo"Debug/" /Fd"Debug/poker.pdb" 
F90_OBJS=.\Debug/
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /win32
MTL_PROJ=/nologo /D "_DEBUG" /win32 
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
RSC_PROJ=/l 0x409 /fo"$(INTDIR)/poker.res" /d "_DEBUG" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/poker.bsc" 
BSC32_SBRS=
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
# ADD LINK32 kernel32.lib /nologo /subsystem:windows /debug /machine:I386 /nodefaultlib:"console.lib"
LINK32_FLAGS=kernel32.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)/poker.pdb" /debug /machine:I386 /nodefaultlib:"console.lib"\
 /out:"$(OUTDIR)/poker.exe" 
LINK32_OBJS= \
	"$(INTDIR)/subclass.obj" \
	"$(INTDIR)/scoring.obj" \
	"$(INTDIR)/registry.obj" \
	"$(INTDIR)/poker.obj" \
	"$(INTDIR)/misc.obj" \
	"$(INTDIR)/descript.obj" \
	"$(INTDIR)/cards.obj" \
	"$(INTDIR)/button.obj" \
	"$(INTDIR)/bitmap.obj" \
	"$(INTDIR)/poker.res"

"$(OUTDIR)\poker.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
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

# Name "poker - Win32 Release"
# Name "poker - Win32 Debug"

!IF  "$(CFG)" == "poker - Win32 Release"

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\subclass.f90

!IF  "$(CFG)" == "poker - Win32 Release"

DEP_F90_SUBCL=\
	{$(INCLUDE)}"\msflib.mod"\
	
NODEP_F90_SUBCL=\
	".\Release\pokerregistry.mod"\
	".\Release\layout.mod"\
	
F90_MODOUT=\
	"subclass"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\subclass.obj" : $(SOURCE) $(DEP_F90_SUBCL) "$(INTDIR)"\
 "$(INTDIR)\pokerregistry.mod" "$(INTDIR)\layout.mod"
   $(BuildCmds)

"$(INTDIR)\subclass.mod" : $(SOURCE) $(DEP_F90_SUBCL) "$(INTDIR)"\
 "$(INTDIR)\pokerregistry.mod" "$(INTDIR)\layout.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

DEP_F90_SUBCL=\
	{$(INCLUDE)}"\msflib.mod"\
	
NODEP_F90_SUBCL=\
	".\Debug\pokerregistry.mod"\
	".\Debug\layout.mod"\
	
F90_MODOUT=\
	"subclass"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\subclass.obj" : $(SOURCE) $(DEP_F90_SUBCL) "$(INTDIR)"\
 "$(INTDIR)\pokerregistry.mod" "$(INTDIR)\layout.mod"
   $(BuildCmds)

"$(INTDIR)\subclass.mod" : $(SOURCE) $(DEP_F90_SUBCL) "$(INTDIR)"\
 "$(INTDIR)\pokerregistry.mod" "$(INTDIR)\layout.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\scoring.f90

!IF  "$(CFG)" == "poker - Win32 Release"

DEP_F90_SCORI=\
	{$(INCLUDE)}"\msflib.mod"\
	".\resource.fd"\
	
NODEP_F90_SCORI=\
	".\Release\cardhand.mod"\
	".\Release\dlock.mod"\
	".\Release\layout.mod"\
	
F90_MODOUT=\
	"scoring"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\scoring.obj" : $(SOURCE) $(DEP_F90_SCORI) "$(INTDIR)"\
 "$(INTDIR)\layout.mod" "$(INTDIR)\dlock.mod" "$(INTDIR)\cardhand.mod"
   $(BuildCmds)

"$(INTDIR)\scoring.mod" : $(SOURCE) $(DEP_F90_SCORI) "$(INTDIR)"\
 "$(INTDIR)\layout.mod" "$(INTDIR)\dlock.mod" "$(INTDIR)\cardhand.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

DEP_F90_SCORI=\
	{$(INCLUDE)}"\msflib.mod"\
	".\resource.fd"\
	
NODEP_F90_SCORI=\
	".\Debug\cardhand.mod"\
	".\Debug\dlock.mod"\
	".\Debug\layout.mod"\
	
F90_MODOUT=\
	"scoring"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\scoring.obj" : $(SOURCE) $(DEP_F90_SCORI) "$(INTDIR)"\
 "$(INTDIR)\layout.mod" "$(INTDIR)\dlock.mod" "$(INTDIR)\cardhand.mod"
   $(BuildCmds)

"$(INTDIR)\scoring.mod" : $(SOURCE) $(DEP_F90_SCORI) "$(INTDIR)"\
 "$(INTDIR)\layout.mod" "$(INTDIR)\dlock.mod" "$(INTDIR)\cardhand.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\registry.f90

!IF  "$(CFG)" == "poker - Win32 Release"

NODEP_F90_REGIS=\
	".\Release\scoring.mod"\
	
F90_MODOUT=\
	"pokerregistry"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\registry.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\scoring.mod"
   $(BuildCmds)

"$(INTDIR)\pokerregistry.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\scoring.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

NODEP_F90_REGIS=\
	".\Debug\scoring.mod"\
	
F90_MODOUT=\
	"pokerregistry"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\registry.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\scoring.mod"
   $(BuildCmds)

"$(INTDIR)\pokerregistry.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\scoring.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\poker.rc
DEP_RSC_POKER=\
	".\poker.ico"\
	".\POINTER.ICO"\
	

"$(INTDIR)\poker.res" : $(SOURCE) $(DEP_RSC_POKER) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\poker.f90

!IF  "$(CFG)" == "poker - Win32 Release"

DEP_F90_POKER_=\
	{$(INCLUDE)}"\msflib.mod"\
	".\resource.fd"\
	
NODEP_F90_POKER_=\
	".\Release\layout.mod"\
	".\Release\cards.mod"\
	".\Release\scoring.mod"\
	".\Release\buttonmod.mod"\
	".\Release\pokerregistry.mod"\
	".\Release\subclass.mod"\
	".\Release\testhand.mod"\
	
F90_MODOUT=\
	"poker"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\poker.obj" : $(SOURCE) $(DEP_F90_POKER_) "$(INTDIR)"\
 "$(INTDIR)\scoring.mod" "$(INTDIR)\pokerregistry.mod" "$(INTDIR)\subclass.mod"\
 "$(INTDIR)\layout.mod" "$(INTDIR)\testhand.mod" "$(INTDIR)\cards.mod"\
 "$(INTDIR)\buttonmod.mod"
   $(BuildCmds)

"$(INTDIR)\poker.mod" : $(SOURCE) $(DEP_F90_POKER_) "$(INTDIR)"\
 "$(INTDIR)\scoring.mod" "$(INTDIR)\pokerregistry.mod" "$(INTDIR)\subclass.mod"\
 "$(INTDIR)\layout.mod" "$(INTDIR)\testhand.mod" "$(INTDIR)\cards.mod"\
 "$(INTDIR)\buttonmod.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

DEP_F90_POKER_=\
	{$(INCLUDE)}"\msflib.mod"\
	".\resource.fd"\
	
NODEP_F90_POKER_=\
	".\Debug\layout.mod"\
	".\Debug\cards.mod"\
	".\Debug\scoring.mod"\
	".\Debug\buttonmod.mod"\
	".\Debug\pokerregistry.mod"\
	".\Debug\subclass.mod"\
	".\Debug\testhand.mod"\
	
F90_MODOUT=\
	"poker"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\poker.obj" : $(SOURCE) $(DEP_F90_POKER_) "$(INTDIR)"\
 "$(INTDIR)\scoring.mod" "$(INTDIR)\pokerregistry.mod" "$(INTDIR)\subclass.mod"\
 "$(INTDIR)\layout.mod" "$(INTDIR)\testhand.mod" "$(INTDIR)\cards.mod"\
 "$(INTDIR)\buttonmod.mod"
   $(BuildCmds)

"$(INTDIR)\poker.mod" : $(SOURCE) $(DEP_F90_POKER_) "$(INTDIR)"\
 "$(INTDIR)\scoring.mod" "$(INTDIR)\pokerregistry.mod" "$(INTDIR)\subclass.mod"\
 "$(INTDIR)\layout.mod" "$(INTDIR)\testhand.mod" "$(INTDIR)\cards.mod"\
 "$(INTDIR)\buttonmod.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\misc.f90

!IF  "$(CFG)" == "poker - Win32 Release"

DEP_F90_MISC_=\
	{$(INCLUDE)}"\msflib.mod"\
	
NODEP_F90_MISC_=\
	".\Release\cards.mod"\
	
F90_MODOUT=\
	"layout" \
	"dlock" \
	"testhand"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\misc.obj" : $(SOURCE) $(DEP_F90_MISC_) "$(INTDIR)"\
 "$(INTDIR)\cards.mod"
   $(BuildCmds)

"$(INTDIR)\layout.mod" : $(SOURCE) $(DEP_F90_MISC_) "$(INTDIR)"\
 "$(INTDIR)\cards.mod"
   $(BuildCmds)

"$(INTDIR)\dlock.mod" : $(SOURCE) $(DEP_F90_MISC_) "$(INTDIR)"\
 "$(INTDIR)\cards.mod"
   $(BuildCmds)

"$(INTDIR)\testhand.mod" : $(SOURCE) $(DEP_F90_MISC_) "$(INTDIR)"\
 "$(INTDIR)\cards.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

DEP_F90_MISC_=\
	{$(INCLUDE)}"\msflib.mod"\
	
NODEP_F90_MISC_=\
	".\Debug\cards.mod"\
	
F90_MODOUT=\
	"layout" \
	"dlock" \
	"testhand"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\misc.obj" : $(SOURCE) $(DEP_F90_MISC_) "$(INTDIR)"\
 "$(INTDIR)\cards.mod"
   $(BuildCmds)

"$(INTDIR)\layout.mod" : $(SOURCE) $(DEP_F90_MISC_) "$(INTDIR)"\
 "$(INTDIR)\cards.mod"
   $(BuildCmds)

"$(INTDIR)\dlock.mod" : $(SOURCE) $(DEP_F90_MISC_) "$(INTDIR)"\
 "$(INTDIR)\cards.mod"
   $(BuildCmds)

"$(INTDIR)\testhand.mod" : $(SOURCE) $(DEP_F90_MISC_) "$(INTDIR)"\
 "$(INTDIR)\cards.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\descript.f90

!IF  "$(CFG)" == "poker - Win32 Release"

F90_MODOUT=\
	"descript"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\descript.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\descript.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

F90_MODOUT=\
	"descript"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\descript.obj" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\descript.mod" : $(SOURCE) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cards.f90

!IF  "$(CFG)" == "poker - Win32 Release"

NODEP_F90_CARDS=\
	".\Release\BitmapDraw.mod"\
	
F90_MODOUT=\
	"CardBasic" \
	"CardHand" \
	"CardDeck" \
	"carddrawmod" \
	"cards"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\cards.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\CardBasic.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\cardhand.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\CardDeck.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\carddrawmod.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\cards.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

NODEP_F90_CARDS=\
	".\Debug\BitmapDraw.mod"\
	
F90_MODOUT=\
	"CardBasic" \
	"CardHand" \
	"CardDeck" \
	"carddrawmod" \
	"cards"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\cards.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\CardBasic.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\cardhand.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\CardDeck.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\carddrawmod.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

"$(INTDIR)\cards.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\BitmapDraw.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\button.f90
DEP_F90_BUTTO=\
	{$(INCLUDE)}"\msflib.mod"\
	

!IF  "$(CFG)" == "poker - Win32 Release"

F90_MODOUT=\
	"ButtonMod"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\button.obj" : $(SOURCE) $(DEP_F90_BUTTO) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\buttonmod.mod" : $(SOURCE) $(DEP_F90_BUTTO) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

F90_MODOUT=\
	"ButtonMod"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\button.obj" : $(SOURCE) $(DEP_F90_BUTTO) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\buttonmod.mod" : $(SOURCE) $(DEP_F90_BUTTO) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\bitmap.f90

!IF  "$(CFG)" == "poker - Win32 Release"

NODEP_F90_BITMA=\
	".\Release\Descript.mod"\
	
F90_MODOUT=\
	"BitmapTypes" \
	"BitmapDraw"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\bitmap.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

"$(INTDIR)\BitmapTypes.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

"$(INTDIR)\BitmapDraw.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "poker - Win32 Debug"

NODEP_F90_BITMA=\
	".\Debug\Descript.mod"\
	
F90_MODOUT=\
	"BitmapTypes" \
	"BitmapDraw"


BuildCmds= \
	$(F90) $(F90_PROJ) $(SOURCE) \
	

"$(INTDIR)\bitmap.obj" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

"$(INTDIR)\BitmapTypes.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

"$(INTDIR)\BitmapDraw.mod" : $(SOURCE) "$(INTDIR)" "$(INTDIR)\descript.mod"
   $(BuildCmds)

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
