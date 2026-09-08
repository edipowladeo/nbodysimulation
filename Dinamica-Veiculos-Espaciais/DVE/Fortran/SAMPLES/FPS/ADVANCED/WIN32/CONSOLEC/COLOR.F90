!************************************************************************
!*
!* PROGRAM   : COLOR.F90
!*
!* PURPOSE   : To demonstrate the use of the SetConsoleTextAttribute()
!*             and GetConsoleScreenBufferInfo() APIs to set the console
!*             text color attributes.
!*
!* FUNCTIONS : main()                     - Open the console, parse args,
!*                                          and change console colors
!*             Syntax()                   - Display the command syntax
!*                                          and color table if no args.
!*             GetConsoleTextAttribute()  - Get the previous console
!*                                          color attributes
!*
!* COMMENTS  : The open handle to the console is obtained by specifying
!*             CONOUT$ as the file name in the CreateFile() API call.
!*             The OPEN_EXISTING create flag is used to get the current
!*             console handle.
!*
!************************************************************************

use msfwin
use colorin 

interface 
integer*2 function GetConsoleTextAttribute( hConsole ) 
integer     hConsole
end function GetConsoleTextAttribute
end interface

interface 
integer function Syntax( hConsole ) 
integer hConsole
end function Syntax
end interface 

!************************************************************************
!*
!* FUNCTION    : main
!*
!* INPUTS      : __argc - argument count
!*               __argv - array of argument strings
!*
!* RETURNS     : 0 on success or -1 on failure.
!*
!* GLOBAL VARS : Color - array of text color attributes
!*
!* LOCAL VARS  : ForeColor  - foreground text color
!*               BackColor  - background text color
!*               ColorIndex - index in the Color array
!*               StrLen     - length of a command line argument string
!*               hConsole   - handle to the console
!*               ForeGround - string buffer containing the first argument
!*               BackGround - string buffer containing the second argument
!*
!* COMMENTS    :
!*
!************************************************************************

!integer Syntax[EXTERN]
!integer GetConsoleTextAttribute[EXTERN]

integer     ForeColor
integer     BackColor
integer     ColorIndex
integer     StrLen
integer     hConsole
character*8 ForeGround
character*8 BackGround
integer     argc, status
character*8 buffer
character*100  lpszFileName
!character*10 color(8)

!**********************************************************************
!* Open the current console input buffer
!**********************************************************************
   color(1) =  " BLACK"
   color(2) =  " BLUE"
   color(3) =  " GREEN"
   color(4) =  " CYAN"
   color(5) =  " RED"
   color(6) =  " MAGENTA"
   color(7) =  " YELLOW"
   color(8) =  " WHITE"
   lpszFileName = "CONOUT$"C
   hConsole = CreateFile(lpszFileName, IOR(GENERIC_WRITE , GENERIC_READ),                   &
                         IOR(FILE_SHARE_READ , FILE_SHARE_WRITE),                           &
                         NULL_SECURITY_ATTRIBUTES, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0)
   if( hConsole == -1 ) then
      ierror =  GetLastError ()
      if (ierror .eq. ERROR_ALREADY_EXISTS) then
        ierror = 1
      end if
      write(*,*)
      write (*,*) ("Error: Unable to open console.")
      write(*,*)
      stop 1
   end if

   ForeColor = 0
   BackColor = ishft(IAND( INT(GetConsoleTextAttribute(hConsole)) , BACKGROUND_COLOR ), -4)
   argc = nargs()
   if( argc < 2 ) then
      i = Syntax( hConsole )
   end if

!/**********************************************************************\
! * Get the first argument; the foreground text color
!\**********************************************************************/
   if( argc > 1 ) then
      call getarg(1, buffer, status)
      write (ForeGround, 100)  buffer
100   format (A8)
      StrLen = len( ForeGround )
      do ColorIndex = 1, MAXCOLORS 
         if( index( Color(ColorIndex), ForeGround, .FALSE.) .ne. 0 ) then
            ForeColor = ColorIndex-1
            exit
         end if
      end do
      if( ColorIndex == MAXCOLORS+1 ) then
         write(*,*)
         write (*,*) ("Error: Invalid foreground color.")
         write(*,*)
         i = Syntax( hConsole )
      end if
   end if

!**********************************************************************
!* Get the second (optional) argument; the background text color
!**********************************************************************
   if( argc > 2 ) then
      call getarg(2, buffer, status)
      write (BackGround, 100) buffer
      StrLen = len( BackGround )
      do ColorIndex = 1, MAXCOLORS 
         if( index(Color(ColorIndex),BackGround,.FALSE.) .ne. 0) then
            BackColor = ColorIndex-1
            exit
         end if
      end do
      if( ColorIndex == MAXCOLORS+1 ) then
         write(*,*)
         write (*,*) ("Error: Invalid background color.")
         write(*,*)
         i = Syntax( hConsole )
      end if
   end if

!**********************************************************************
!* Check if foreground and backgroud colors are the same; issue a error
!* and exit if they are
!**********************************************************************
   if( BackColor == ForeColor) then
      write(*,*)
      write (*,*) ("Error: Foreground and background color cannot be the same.")
      write(*,*)
      i = Syntax( hConsole )
   end if

!**********************************************************************
!* Set the new console text colors
!**********************************************************************
    i = SetConsoleTextAttribute( hConsole, INT2(IOR (ForeColor , ishft(BackColor , 4)))) 
end



!/************************************************************************\
!*
!* FUNCTION    : Syntax
!*
!* INPUTS      : hConsole - handle to an open console
!*
!* RETURNS     : 0 and exits the process.
!*
!* GLOBAL VARS : Color - array of text color attributes
!*
!* LOCAL VARS  : ForeColor      - foreground text color
!*               BackColor      - background text color
!*               wAttributesOld - previous text attributes
!*
!* COMMENTS    : Displays the command syntax, a text color table and
!*               exits the process at completion.
!*
!\************************************************************************/
integer function Syntax( hConsole )
use msfwin
use colorin

interface 
integer*2 function GetConsoleTextAttribute( hConsole ) 
integer hConsole
end function GetConsoleTextAttribute
end interface

integer hConsole
!integer GetConsoleTextAttribute[extern]
integer ForeColor
integer BackColor
integer*2 wAttributesOld, iTemp

   write (*,*) ("Console Window Text Color Setter, Version 1.00")
   write(*,*)
   write (*,*) ("Microsoft Developer Support")
   write(*,*)
   write (*,*) ("Copyright (c) 1992, 1993 Microsoft Corp.")
   write(*,*)
   write(*,*)
   write (*,*) ("Syntax: COLOR FOREGROUND [BACKGROUND]")
   write(*,*)
   write(*,*)
   write (*,*) ("Available colors are:")
   write(*,*)

   wAttributesOld = GetConsoleTextAttribute( hConsole )

   write (*,200) 
200   FORMAT('                                      BACKGROUND ')
   write(*,*)
   write(*,*)
   write (*,'(A13\)') ' FOREGROUND  '

   do BackColor = 1, MAXCOLORS 
      write (*,300) Color(BackColor)
300   format (A8\)
   end do

   write (*,'(/)') 

   do ForeColor = 1, MAXCOLORS 
      write (*,400) Color(ForeColor)
400   format (A13\)

      do BackColor = 1, MAXCOLORS 
         iTemp = INT2(IOR(ishft(BackColor-1, 4), ForeColor-1))
         i = SetConsoleTextAttribute( hConsole, itemp);
         write (*,'(A8 \)') " XxXxXx "
      end do
      i = SetConsoleTextAttribute( hConsole, wAttributesOld )
      write (*,*) 
   end do
   i = SetConsoleTextAttribute( hConsole, INT2(wAttributesOld ))
   stop 1
   Syntax = TRUE
end 


