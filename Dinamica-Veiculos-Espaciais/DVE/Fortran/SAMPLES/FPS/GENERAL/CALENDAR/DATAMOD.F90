module datamod

INTEGER(2), Parameter :: BackColor=2
INTEGER(2), Parameter :: TextColor=#FFFFFF   !RGB Color in (B G R order)
INTEGER(2), Parameter :: GridColor=#FFFFFF   !RGB Color in (B G R order)
INTEGER(2), Parameter :: WeekendColor=#0000FF   !RGB Color in (B G R order)
INTEGER(2), Parameter :: WeekdayColor=#00FF00   !RGB Color in (B G R order)


INTEGER(2) ,Parameter :: ColX=100
INTEGER(2) ,Parameter :: ColY=220
INTEGER(2) ,Parameter :: ColXOff = 30
INTEGER(2) ,Parameter :: ColYOff = 30




type table 
	integer numx, numy
end type

! Calender(i) points the upper left corner 
Type(table) :: Calender(7) = &
				(/ table(30, ColY), table(30+ColXOff,ColY), &
				   table(30+ColXOff*2, ColY), table(30+ColXOff*3,ColY), &
				   table(30+ColXOff*4, ColY), table(30+ColXOff*5,ColY), &
				   table(30+ColXOff*6, ColY)   /)


CHARACTER(2) :: DayString(31) = &
				(/ ' 1',' 2',' 3',' 4',' 5', &
				   ' 6',' 7',' 8',' 9','10', &
				   '11','12','13','14','15', &
				   '16','17','18','19','20', &
				   '21','22','23','24','25', &
				   '26','27','28','29','30','31' /)

INTEGER(2) :: EndOfMonth(12) = &
				(/ 31, 30, 28, 30, 31, &
				   30, 31, 31, 30, 31, &
				   30, 31 /)

end module
				   