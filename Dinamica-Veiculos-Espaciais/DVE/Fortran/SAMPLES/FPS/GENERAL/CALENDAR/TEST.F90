!++++++++++++++++++++++++++++++++++++
!
!	DBCS QuickWin Sample
!
!	MODE
!
!++++++++++++++++++++++++++++++++++++

program qwin_test
USE DATAMOD   !Data Module
USE MSFLIB
USE MSFNLS

INTEGER(2) fontnum, numfonts
INTEGER(4) cp
type (xycoord) pos

character*50 lang, country


INTEGER(4) i4

TYPE (qwinfo)  qw


OPEN(3, file='user', title='QWMBCS Test')

! Clear the screen to the background color.
i4 = setbkcolor(BackColor)
call clearscreen($GCLEARSCREEN)
! Get the application's child window.
i4 = getwsizeqq(3,QWIN$SIZECURR, qw)
! maximize it.
qw.type = QWIN$MAX
i4 = setwsizeqq(3, qw)


call NLSGetLocale(lang, country, cp)   ! get Locale information

!+++++++ Initialize Font
numfonts = INITIALIZEFONTS ( )
if (cp .eq. 932) then
  fontnum = SETFONT ('t''ＭＳ ゴシック''h18b')
else
  fontnum = SETFONT ('t''Arial''h18b')
end if


CALL MOVETO (INT4(10), INT4(30), pos)
CALL OUTGTEXT('Language:')
CALL MOVETO (INT2(100), INT2(30), pos)
CALL OUTGTEXT(lang)
CALL MOVETO(INT2(210), INT2(30), pos)
CALL OUTGTEXT('Country :')
CALL MOVETO (INT2(300), INT2(30), pos)
CALL OUTGTEXT(country)


CALL PRINTTHISMONTH()


do while (.TRUE.)
end do

END


!+++++++++++++++++++++++++++++++++++++++++++++++++
!  InitialSettings ( )
!  This routine initializes Menu in Japanese
!
LOGICAL(4) FUNCTION InitialSettings()

USE MSFLIB
USE MSFNLS


LOGICAL(4)  l4
integer(4) cp

call NLSGetLocale(CODEPAGE = cp)   
! This routine is called automatically when the program begins.  It sets
! up the menu structure for the program, and connects "callback" routines
! with each menu item.
if (cp .eq. 932) then
   l4 = appendmenuqq(1, $MENUENABLED,   'ﾌｧｲﾙ(&F)'C,           NUL)			   
   l4 = appendmenuqq(1, $MENUENABLED,   '印刷(&P)...'C,       WINPRINT)
   l4 = appendmenuqq(1, $MENUENABLED,   '保存(&S)...'C,        WINSAVE)
   l4 = appendmenuqq(1, $MENUENABLED,   '終了(&X)'C,           WINEXIT)

   l4 = appendmenuqq(2, $MENUENABLED,   '編集(&E)'C,			NUL)
   l4 = appendmenuqq(2, $MENUENABLED,   'ﾃｷｽﾄを選択(&T)'C,	WINSELECTTEXT)
   l4 = appendmenuqq(2, $MENUENABLED,   'ｸﾞﾗﾌｨｯｸを選択(&G)'C,WINSELECTGRAPHICS)
   l4 = appendmenuqq(2, $MENUENABLED,   'すべて選択(&A)'C,		WINSELECTALL)
   l4 = appendmenuqq(2, $MENUENABLED,   'ｺﾋﾟｰ(&C)'C,			WINCOPY)
   l4 = appendmenuqq(2, $MENUENABLED,   '張り付け(&P)'C,			WINPASTE)

   l4 = appendmenuqq(3, $MENUENABLED,   '表示(&V)'C,           NUL)
   l4 = appendmenuqq(3, $MENUENABLED,   'ｳｨﾝﾄﾞｳｻｲｽﾞに縮小(&S)'C,    WINSIZETOFIT)
   l4 = appendmenuqq(3, $MENUENABLED,   'ﾌﾙｽｸﾘｰﾝ(&F)'C,    WINFULLSCREEN)

   l4 = appendmenuqq(4, $MENUENABLED,   '状態(&S)'C,          NUL)
   l4 = appendmenuqq(4, $MENUENABLED,   'Pause'C,          WINSTATE)

   l4 = appendmenuqq(5, $MENUENABLED,   'ｳｨﾝﾄﾞｳ(&W)'C,         NUL)
   l4 = appendmenuqq(5, $MENUENABLED,   '重ねて表示(&C)'C,        WINCASCADE)
   l4 = appendmenuqq(5, $MENUENABLED,   '並べて表示(&T)'C,           WINTILE)
   l4 = appendmenuqq(5, $MENUENABLED,   'ｱｲｺﾝ再配置(&A)'C,  WINARRANGE)
   l4 = appendmenuqq(5, $MENUENABLED,   '入力(&I)'C,          NUL)
   l4 = appendmenuqq(5, $MENUENABLED,   '張り付け消去(&L)'C,    WINCLEARPASTE)
   l4 = appendmenuqq(5, $MENUENABLED,   'ｽﾃｰﾀｽ ﾊﾞｰ(&S)'C,     WINSTATUS)

   l4 = appendmenuqq(6, $MENUENABLED,   'ﾍﾙﾌﾟ(&H)'C,           NUL)
   l4 = appendmenuqq(6, $MENUENABLED,   '目次(&C)'C,		NUL)
   l4 = appendmenuqq(6, $MENUENABLED,   'ﾍﾙﾌﾟの使い方(&H)'C,		WINUSING)
   l4 = appendmenuqq(6, $MENUENABLED,   'ﾊﾞｰｼﾞｮﾝ情報(&A)'C,			WINABOUT)
else
   l4 = appendmenuqq(1, $MENUENABLED,   'File'C,           NUL)
   l4 = appendmenuqq(1, $MENUENABLED,   'Print...'C,       WINPRINT)
   l4 = appendmenuqq(1, $MENUENABLED,   'Save...'C,        WINSAVE)
   l4 = appendmenuqq(1, $MENUENABLED,   'Exit'C,           WINEXIT)

   l4 = appendmenuqq(2, $MENUENABLED,   'Edit'C,			NUL)
   l4 = appendmenuqq(2, $MENUENABLED,   'Select Text'C,	WINSELECTTEXT)
   l4 = appendmenuqq(2, $MENUENABLED,   'Select Graphics'C,WINSELECTGRAPHICS)
   l4 = appendmenuqq(2, $MENUENABLED,   'Select All'C,		WINSELECTALL)
   l4 = appendmenuqq(2, $MENUENABLED,   'Copy'C,			WINCOPY)
   l4 = appendmenuqq(2, $MENUENABLED,   'Paste'C,			WINPASTE)

   l4 = appendmenuqq(3, $MENUENABLED,   'View'C,           NUL)
   l4 = appendmenuqq(3, $MENUENABLED,   'Size to Fit'C,    WINSIZETOFIT)
   l4 = appendmenuqq(3, $MENUENABLED,   'Full Screen'C,    WINFULLSCREEN)

   l4 = appendmenuqq(4, $MENUENABLED,   'State'C,          NUL)
   l4 = appendmenuqq(4, $MENUENABLED,   'Pause'C,          WINSTATE)

   l4 = appendmenuqq(5, $MENUENABLED,   'Window'C,         NUL)
   l4 = appendmenuqq(5, $MENUENABLED,   'Cascade'C,        WINCASCADE)
   l4 = appendmenuqq(5, $MENUENABLED,   'Tile'C,           WINTILE)
   l4 = appendmenuqq(5, $MENUENABLED,   'Arrange Icons'C,  WINARRANGE)
   l4 = appendmenuqq(5, $MENUENABLED,   'Input'C,          NUL)
   l4 = appendmenuqq(5, $MENUENABLED,   'Clear Paste'C,    WINCLEARPASTE)
   l4 = appendmenuqq(5, $MENUENABLED,   'Status Bar'C,     WINSTATUS)

   l4 = appendmenuqq(6, $MENUENABLED,   'Help'C,           NUL)
   l4 = appendmenuqq(6, $MENUENABLED,   'Contents'C,		NUL)
   l4 = appendmenuqq(6, $MENUENABLED,   'Using Help'C,		WINUSING)
   l4 = appendmenuqq(6, $MENUENABLED,   'About'C,			WINABOUT)

end if

InitialSettings = l4

return
end



!+++++++++++++++++++++++++++++++++++++++++++++++++
!  PrintBox ( )
!  box : 0,1,2, ...
!
subroutine PrintBox(box, day)  
  USE DATAMOD			!Data Module
  USE MSFLIB
  INTEGER(2) box, col, row, day, color
  type (xycoord) pos
  

  row = box / 7
  col = mod(box, 7)

  i4 = setcolorrgb(GridColor)    
  i4 = rectangle( $GBORDER, Calender(col+1)%numx, ColYOff*row+Calender(col+1)%numy, &
				 Calender(col+1)%numx+ColXOff, ColYOff*row+Calender(col+1)%numy+ColYOff )

  if (day > 0) then
    SELECT CASE  (mod(box,7))
	  CASE (0) 
	     color = WeekendColor
	  CASE (1) 
	     color = WeekdayColor
	  CASE (2) 
	     color = WeekdayColor
	  CASE (3) 
	     color = WeekdayColor
	  CASE (4) 
	     color = WeekdayColor
	  CASE (5) 
	     color = WeekdayColor
	  CASE (6) 
	     color = WeekendColor
      CASE DEFAULT
	     color = WeekendColor
    END SELECT
    i4 = setcolorrgb(color)    
    CALL MOVETO(Calender(col+1)%numx+3, ColYOff*row+Calender(col+1)%numy+3,pos)
    CALL OUTGTEXT(DayString(day))
  end if
	
end subroutine



!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
!  PRINTTHISMONTH( )
!
!

subroutine PRINTTHISMONTH()
USE DATAMOD   !Data Module
USE MSFLIB
USE MSFNLS


character*8 date
character*10 time
character*5 zone
character*50 str
INTEGER(4) DateTime(8), tm, cp
INTEGER(2) day, day1st, box, color
INTEGER(2) fontnum
type (xycoord) pos

call NLSGetLocale(CODEPAGE = cp)   

i4 = setcolorrgb(TextColor)    
call date_and_time(date, time, zone, DateTime)
call PackTimeQQ(tm, INT2(DateTime(1)), INT2(DateTime(2)),&
        INT2(DateTime(3)), INT2(DateTime(5)), INT2(DateTime(6)),&
        INT2(DateTime(7)) )
rtn = NLSFormatDate(str, tm, NLS$LongDate)
CALL MOVETO (INT2(10), INT2(80), pos)
CALL OUTGTEXT('Long Format  : ')
CALL MOVETO (INT2(140), INT2(80), pos)
CALL OUTGTEXT(str)

rtn = NLSFormatDate(str, tm, NLS$UseAltCalendar)
CALL MOVETO (INT2(10), INT2(100), pos)
CALL OUTGTEXT('Short Format :')
CALL MOVETO (INT2(140), INT2(100), pos)
CALL OUTGTEXT(str)

i4 = NLSGetLocaleInfo(NLS$LI_SDAYNAME1, str)

CALL SetNameOfMonth(DateTime(2), Str)
CALL MOVETO(INT2(40), INT2(ColY-60), pos)
CALL OUTGTEXT('Calender of')
CALL MOVETO(INT2(160), INT2(ColY-60), pos)
CALL OUTGTEXT(str)


CALL Get1stDayWeek(day1st)  !0:SUN, 1:MON,...
CALL SetNameOfDay(day1st, Str)
CALL MOVETO(INT2(40), INT2(ColY-40), pos)
CALL OUTGTEXT('Starting at ')
CALL MOVETO(INT2(160), INT2(ColY-40), pos)
CALL OUTGTEXT(str)

!Here we have 
!   day1st : indicates a day of week of 1st of this month
!            0:SUN, 1:MON, ..., 6:SAT
!   


! So Print each day of a month
if (cp .eq. 932) then
  fontnum = SETFONT ('t''ＭＳ ゴシック''h14b')
else
  fontnum = SETFONT ('t''Arial''h14b')
end if
DO day=0,6
  SELECT CASE  (day)
	  CASE (0) 
	     color = WeekendColor
	  CASE (1) 
	     color = WeekdayColor
	  CASE (2) 
	     color = WeekdayColor
	  CASE (3) 
	     color = WeekdayColor
	  CASE (4) 
	     color = WeekdayColor
	  CASE (5) 
	     color = WeekdayColor
	  CASE (6) 
	     color = WeekendColor
      CASE DEFAULT
	     color = WeekendColor
   END SELECT
   i4 = setcolorrgb(color)    
   CALL SetNameOfDayShort(day, str)
   CALL MOVETO(Calender(day+1)%numx, Calender(day+1)%numy-20,pos)
   CALL OUTGTEXT(str)
END DO    
   
box = 0
Do WHILE(box < day1st)
  CALL PrintBox(box, 0)
  box = box + 1
END DO


if (cp .eq. 932) then
  fontnum = SETFONT ('t''ＭＳ ゴシック''h18b')
else
  fontnum = SETFONT ('t''Arial''h18b')
end if

DO day=1, EndOfMonth(DateTime(2))
   CALL PrintBox(box, day)
   box = box + 1
   
END DO

END subroutine



!+++++++++++++++++++++++++++++++++++++++++++++++++
! Return a day of week for specified day
!
!
! Parameter : 0:SUN, 1:MON, 2:Tue, ...
!
subroutine Get1stDayWeek(day)
USE MSFWIN

INTEGER(2) day

type (T_SYSTEMTIME) systime


CALL GETLOCALTIME(systime)  !0:Sun, 1:Mon...

day = mod(systime.wDayOfWeek+7 - mod(systime.wDay, 7) + 1, 7)

END subroutine


!+++++++++++++++++++++++++++++++++++++++++++++++++

subroutine SetNameOfDay(day, name)
USE MSFNLS
INTEGER(2) day
CHARACTER(*) name
INTEGER(4) NameOfDay

Select Case (day)
   case (0)
      NameOfDay = NLS$LI_SDAYNAME7   !SUN
   case (1)
      NameOfDay = NLS$LI_SDAYNAME1   !MON
   case (2) 
      NameOfDay = NLS$LI_SDAYNAME2   !TUE
   case (3) 
      NameOfDay = NLS$LI_SDAYNAME3   !WED
   case (4) 
      NameOfDay = NLS$LI_SDAYNAME4   !THU
   case (5) 
      NameOfDay = NLS$LI_SDAYNAME5   !FRI
   case (6) 
      NameOfDay = NLS$LI_SDAYNAME6   !SAT
   case DEFAULT
      NameOfDay = NLS$LI_SDAYNAME7 
end select

i4 = NLSGetLocaleInfo(NameOfDay, name)


end subroutine

!+++++++++++++++++++++++++++++++++++++++++++++++++

subroutine SetNameOfDayShort(day, name)
USE MSFNLS
INTEGER(2) day
CHARACTER(*) name
INTEGER(4) NameOfDay

Select Case (day)
   case (0)
      NameOfDay = NLS$LI_SABBREVDAYNAME7   !SUN
   case (1)
      NameOfDay = NLS$LI_SABBREVDAYNAME1   !MON
   case (2) 
      NameOfDay = NLS$LI_SABBREVDAYNAME2   !TUE
   case (3) 
      NameOfDay = NLS$LI_SABBREVDAYNAME3   !WED
   case (4) 
      NameOfDay = NLS$LI_SABBREVDAYNAME4   !THU
   case (5) 
      NameOfDay = NLS$LI_SABBREVDAYNAME5   !FRI
   case (6) 
      NameOfDay = NLS$LI_SABBREVDAYNAME6   !SAT
   case DEFAULT
      NameOfDay = NLS$LI_SABBREVDAYNAME7 
end select

i4 = NLSGetLocaleInfo(NameOfDay, name)


end subroutine


!+++++++++++++++++++++++++++++++++++++++++++++++++

subroutine SetNameOfMonth(month, name)
USE MSFNLS

INTEGER(4) month, NameOfMonth
CHARACTER*(*) name

Select Case (month)
   case (1) 
      NameOfMonth = NLS$LI_SMONTHNAME1
   case (2) 
      NameOfMonth = NLS$LI_SMONTHNAME2   
   case (3) 
      NameOfMonth = NLS$LI_SMONTHNAME3
   case (4) 
      NameOfMonth = NLS$LI_SMONTHNAME4
   case (5) 
      NameOfMonth = NLS$LI_SMONTHNAME5
   case (6) 
      NameOfMonth = NLS$LI_SMONTHNAME6
   case (7) 
      NameOfMonth = NLS$LI_SMONTHNAME7
   case (8) 
      NameOfMonth = NLS$LI_SMONTHNAME8
   case (9) 
      NameOfMonth = NLS$LI_SMONTHNAME9
   case (10) 
      NameOfMonth = NLS$LI_SMONTHNAME10
   case (11) 
      NameOfMonth = NLS$LI_SMONTHNAME11
   case (12) 
      NameOfMonth = NLS$LI_SMONTHNAME12
   case DEFAULT
      NameOfMonth = NLS$LI_SMONTHNAME1
end select

i4 = NLSGetLocaleInfo(NameOfMonth, name)

end subroutine
