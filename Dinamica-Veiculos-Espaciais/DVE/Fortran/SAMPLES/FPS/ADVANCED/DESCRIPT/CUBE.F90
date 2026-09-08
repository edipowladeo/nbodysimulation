
program go
	use msflib
	use bitmapdraw

      implicit none

! Scratch constants

	integer xoff, yoff, i2

      real quad,costheta,sintheta,cosphi,sinphi,thirdquad,pi,guess
      parameter (quad=3.14159/4,thirdquad=3.14159*3/4,pi=3.14159)
      parameter (guess=10*pi/180)

	type bitmaplist 
		type(bitmap), pointer :: bmap
		type(bitmaplist), pointer :: next
	end type
	type(bitmaplist), pointer :: head, p

! Constraints, dimensions, etc.

      integer*1 num_objects

! Object definitions

      structure /cartesian_coord/
         real x,y,z
      end structure

      structure /radial_coord/
         real theta,phi
         integer dist
      end structure

      structure /vertex_list/
         integer*1 count
         !record /cartesian_coord/ point[allocatable](:)
         record /cartesian_coord/ point(4)
      end structure

      structure /xycoord_list/
         integer*1 count
         !record /xycoord/ point[allocatable](:)
         record /xycoord/ point(4)
      end structure

      record /vertex_list/ object[allocatable](:)
      record /vertex_list/ object_eye[allocatable](:)
      record /radial_coord/ eye_pos
      record /xycoord_list/ object_scrn[allocatable](:)

! Scratch variables

      integer i, j, k
	type(windowconfig) wc
	type(qwinfo) sw

	type(cartesian_coord), parameter :: object_frame(4,6) = &
		reshape( &
	     (/ cartesian_coord( -5, -5, -6 ),  &
			cartesian_coord( -5, 5, -6 ), &
				cartesian_coord( 5, 5, -6 ), &
					cartesian_coord( 5, -5, -6 ), &
		cartesian_coord( 5, -6, 5 ), &
			cartesian_coord( -5, -6, 5 ), &
				cartesian_coord( -5, -6, -5 ), & 
					cartesian_coord( 5, -6, -5 ), &
		cartesian_coord( 5, 6, 5 ), &
			cartesian_coord( -5, 6, 5 ), &
				cartesian_coord( -5, 6, -5 ), &
					cartesian_coord( 5, 6, -5 ), &
		cartesian_coord( -5, -5, 6 ), &
			cartesian_coord( -5, 5, 6 ), &
				cartesian_coord( 5, 5, 6 ), &
					cartesian_coord( 5, -5, 6 ), &
		cartesian_coord( 6, -5, 5 ), &
			cartesian_coord( 6, 5, 5 ), &
				cartesian_coord( 6, 5, -5 ), &
					cartesian_coord( 6, -5, -5 ), &
		cartesian_coord( -6, -5, 5 ), &
			cartesian_coord( -6, 5, 5 ), &
				cartesian_coord( -6, 5, -5 ), &
					cartesian_coord( -6, -5, -5 ) /) &
		, (/ 4, 6 /) )
						 
! Read the data file

	nullify(head)

	eye_pos.dist = 100
	num_objects = 6

	xoff = -370
	yoff = -230
	
      allocate(object(num_objects))
      allocate(object_eye(num_objects))
      allocate(object_scrn(num_objects))
      do i=1,num_objects
	object(i).count = 4
         object_eye(i).count=4
         object_scrn(i).count=4
	object(i).point = object_frame(:,i)
      end do

! Set your eye position

      eye_pos.theta=quad
      eye_pos.phi=quad

      do k=0,36
	allocate( p )
	p%next => head
	head => p
	head%bmap => BitmapAllocate( 300, 300 )
	call BitmapSetPalette( head%bmap, (/ BitmapRGB( 255, 0, 0 ) /), 1 )
	call CubeDraw( head%bmap, k )
      end do

	open( 1, file='user' )
wc.numxpixels = 300
wc.numypixels = 300
wc.numtextcols = -1
wc.numtextrows = -1
wc.numcolors = -1
wc.fontsize = -1
wc.title = 'Spinning Cube'C
if( .not. setwindowconfig( wc ) ) then
	stop
endif

	sw.type = QWIN$MAX
	i2 = setwsizeqq( 1, sw )
	
      do while( .true. )
	p => head
	do while( associated( p ) )
		call BitmapPut( p%bmap, 0, 0 )	
		p => p%next
	end do
      end do	
contains

subroutine CubeDraw( bmap, k )
type(bitmap), pointer :: bmap
integer k
integer nextj

      eye_pos.phi=k*guess

      costheta=cos(eye_pos.theta)
      sintheta=sin(eye_pos.theta)
      cosphi=cos(eye_pos.phi)
      sinphi=sin(eye_pos.phi)
      do i=1,num_objects
         do j=1,object(i).count

 	    ! Compute eye X coordinate
            object_eye(i).point(j).x = -object(i).point(j).x*sintheta &
              + object(i).point(j).y*costheta
	    ! Compute eye Y coordinate
            object_eye(i).point(j).y = -object(i).point(j).x*costheta &
              *cosphi - object(i).point(j).y*sintheta*cosphi &
              + object(i).point(j).z*sinphi
	    ! Compute eye Z coordinate
            object_eye(i).point(j).z = -object(i).point(j).x*sinphi &
              *costheta - object(i).point(j).y*sintheta*sinphi &
              - object(i).point(j).z*cosphi + eye_pos.dist

	    ! Compute screen X coordinate
            object_scrn(i).point(j).xcoord = &
               1300*object_eye(i).point(j).x/object_eye(i).point(j).z  + 512
	    ! Compute screen Y coordinate
            object_scrn(i).point(j).ycoord = &
               -1300*object_eye(i).point(j).y/object_eye(i).point(j).z + 384

         end do
      end do



      do i=1,num_objects
	 do j = 1, object_scrn(i).count
		if( j == object_scrn(i).count )  then
			nextj = 1
		else
			nextj = j+1
		endif
	        call BitmapLine( bmap, 1, 				&
				 int4(object_scrn(i).point(j).xcoord)+xoff,	&
				 int4(object_scrn(i).point(j).ycoord)+yoff,	&
				 int4(object_scrn(i).point(nextj).xcoord)+xoff, &
				 int4(object_scrn(i).point(nextj).ycoord)+yoff )
	 end do
      end do

end subroutine 
end
