do i = 1, 6
   siaNullSidAuthority%Value(i) = 0
end do

do i = 1, 5
   siaWorldSidAuthority%Value(i) = 0
end do
siaWorldSidAuthority%Value(i) = 1


do i = 1, 5
   siaLocalSidAuthority%Value(i) = 0
end do
siaLocalSidAuthority%Value(i) = 2


do i = 1, 5
   siaCreatorSidAuthority%Value(i) = 0
end do
siaCreatorSidAuthority%Value(i) = 3


do i = 1, 5
   siaNonUniqueAuthority%Value(i) = 0
end do
siaNonUniqueAuthority%Value(i) = 4


do i = 1, 5
   siaNtAuthority%Value(i) = 0
end do
siaNtAuthority%Value(i) = 5
