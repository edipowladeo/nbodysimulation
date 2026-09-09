program test_atmosphere_density
  use atmosphere_density, only: us76_density
  use, intrinsic :: ieee_arithmetic, only: ieee_is_finite
  implicit none
  double precision :: h,R,de,first
  double precision, parameter :: boundaries(18) = &
    [0D0,11D0,20D0,32D0,47D0,51D0,71D0,86D0,91D0,100D0,110D0,120D0,150D0,200D0,300D0,500D0,750D0,1000D0]
  ! Captured from the unmodified Arrasto density block, GNU Fortran 16.2.0,
  ! -std=legacy -ffree-line-length-none -O0. Ordered boundary-1e-6, boundary,
  ! boundary+1e-6 km. Sentinel -123 outside the legacy domain is intentional.
  double precision, parameter :: expected(54) = [ &
    -1.23000000000000000D+002, &
    5.51920797339540206D-005, &
    5.51920744266983548D-005, &
    1.63679767249937794D-005, &
    1.63679769788923187D-005, &
    1.63679743952870766D-005, &
    3.95397652636210949D-006, &
    3.95397793995082528D-006, &
    3.95397729758505654D-006, &
    5.92871760223737843D-007, &
    5.92871800873258099D-007, &
    5.92871704937948304D-007, &
    6.38461684723908988D-008, &
    6.38461865219668892D-008, &
    6.38461784529393263D-008, &
    3.85111559338343025D-008, &
    3.85111526104694651D-008, &
    3.85111481417610296D-008, &
    2.86112699132585064D-009, &
    2.86112807267729983D-009, &
    2.86112764352117578D-009, &
    2.53563574134816904D-010, &
    6.95816726121513649D-006, &
    6.95816602264527851D-006, &
    2.86004419787472061D-006, &
    2.85973182660569246D-006, &
    2.85973131873788663D-006, &
    5.60391708804111305D-007, &
    5.60184300122389761D-007, &
    5.60184201556988031D-007, &
    9.70945859648661493D-008, &
    9.70675372898443719D-008, &
    9.70675194546747211D-008, &
    2.22167839491140857D-008, &
    2.22055463430312753D-008, &
    2.22055437143337849D-008, &
    2.07626948680678123D-009, &
    2.07520840948772422D-009, &
    2.07520829349227129D-009, &
    2.54114041584846331D-010, &
    2.53995440464066217D-010, &
    2.53995432094374692D-010, &
    1.91604898247770158D-011, &
    1.91512264110507130D-011, &
    1.91512260039040824D-011, &
    5.21641938479002681D-013, &
    5.21285933241165570D-013, &
    5.21285924912483507D-013, &
    1.78896470156979443D-014, &
    1.78890988371387176D-014, &
    1.78890986582414852D-014, &
    3.55945128363857483D-015, &
    3.55945126846096438D-015, &
    -1.23000000000000000D+002 ]
  integer :: i,j,k
  k=0
  do i=1,size(boundaries)
    do j=-1,1
      h=boundaries(i)+j*1D-6
      R=(6371.200D0+h)*1000
      de=-123D0
      call us76_density(h,R,de)
      k=k+1
      if (de /= expected(k)) then
        print *, 'FAIL: boundary, side, actual, expected', boundaries(i),j,de,expected(k)
        stop 1
      endif
      if (h >= 0D0 .and. h <= 1000D0) then
        if (.not. ieee_is_finite(de) .or. de <= 0D0) stop 2
      endif
    enddo
  enddo
  call us76_density(10D0,6371200D0,first)
  call us76_density(10D0,12742400D0,de)
  if (de /= first/2) stop 3
  call us76_density(100D0,6371200D0,first)
  call us76_density(100D0,12742400D0,de)
  if (de /= first) stop 4
  print *, 'PASS: US76 density (54 boundary samples, domain sentinel, effective R)'
end program