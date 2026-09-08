/*======================================================================
 * 
 * DESCRIPT.H -- Microsoft Fortran PowerStation Descriptor defintions
 *               and routines for use from Microsoft Visual C++.
 *
 */

#include <stdarg.h>
#include <stdio.h>

#define DescriptorMaxRank 7

// See the descript.f90 file for more information on what each of these
// fields does.
//
struct DescriptorTriplet {
	long		Extent;		// Number of elements in this dimension
	long		Mult;		// Multiplier for this dimension
	long		LowerBound;	// LowerBound of this dimension
};

struct Descriptor {
	long		Base;		// Base address
	long		Len;		// Len of data type, used only for
					// character strings.
	long		Offset;
	long		Reserved;	// Reserved for future use.
	long		Rank;		// Rank of pointer
	struct DescriptorTriplet Dim[DescriptorMaxRank];
};

enum { DescriptRowOrder, DescriptColumnOrder };

void *DescriptorElementAddress( struct Descriptor *dp, int rank, ... );
void DescriptorAssign( struct Descriptor *dp, void *base, 
			long size, int columnorder, int rank, ... );
void DescriptorPrint( struct Descriptor *dp, long rank );

// #define DESCRIPTCODE in ONE of the files in which you include descript.h
#ifdef DESCRIPTCODE   

/*----------------------------------------------------------------------
 *
 * Function DescriptorElementAddress
 *
 * This routine will return the address of an element of a descriptor.
 *    
 */
void *DescriptorElementAddress( struct Descriptor *dp, int rank, ... )
{
	long p;
	va_list vl;
	int i;

	va_start( vl, rank );

	p = dp->Base + dp->Offset;
	for( i = 0; i < rank; i++ )
		p += (dp->Dim[i].Mult * va_arg( vl, long ));

	va_end( vl );
	return( (void *) p );
}

/*----------------------------------------------------------------------
 *
 * Function DescriptorAssign
 *
 * This routine will assign a descriptor to a piece of memory.  It is used
 * as the equivalent of a Fortran 90 pointer assignment, but gives one
 * more control over the assignment, allowing for example assignment to any
 * piece of memory.  Another use is to create an array which can be used
 * from both Fortran or C.
 *
 * Arguments are:
 *    dparg -- Address of Fortran 90 pointer
 *    base  -- Base address of memory to assign to pointer
 *    size  -- Datatype size (for example, 4 for Integer(4))
 *    dims  -- Information about each dimension (Array of information)
 *        LowerBound -- Lower bound for this dimension 
 *        UpperBound -- Upper bound for this dimension 
 *        Stride     -- Stride for this dimension
 *        RealSize   -- Actual extent of this dimension
 *    orderarg (optional) -- Either column order or row order
 *
 * The following use of DescriptorAssign from C:
 *    int arr[10][10]
 *    struct Descriptor dp;
 *    DescriptorAssign( &dp, &arr[0][0], sizeof(arr[0][0]),
 * 		        DescriptRowOrder, 2, 
 *		        l1, u1, s1, 10,
 *		        l2, u2, s2, 10 );
 *
 * is equivalent to the following Fortran 90 pointer assignment:
 *
 *    integer(4), target :: arr(10,10)
 *    integer(4), pointer :: dp(:,:)
 *    dp => arr(l1:u1:s1,l2:u2:s2)
 *
 */    
void DescriptorAssign( struct Descriptor *dp, void *base, 
			long size, int columnorder, int rank, ... )
{
	va_list vl;
	long lbound, ubound, stride, realsize;
	long mult, r, dir, todo;

	mult = size;
	dp->Base = (long) base;
	dp->Offset = 0;
	dp->Len = size;
	dp->Rank = rank;
	dp->Reserved = 0;

	if( columnorder ) 	{	dir = 1;	r = 0; 		}
	else			{ 	dir = -1; 	r = rank-1; 	}

	va_start( vl, rank );
	for( todo = 0; todo < rank; todo++ )
	{
		lbound = va_arg(vl,long);
		ubound = va_arg(vl,long);
		stride = va_arg(vl,long);
		realsize = va_arg(vl,long);

		dp->Base += ((lbound-1) * mult);
		dp->Dim[r].Extent = (ubound - lbound + stride) / stride;
		if( dp->Dim[r].Extent < 0 ) dp->Dim[r].Extent = 0;
		dp->Dim[r].Mult = stride * mult;
		dp->Dim[r].LowerBound = 1;
		dp->Offset = dp->Offset - dp->Dim[r].Mult;
		mult *= realsize;
		r += dir;
	}		

	va_end( vl );
}

/*----------------------------------------------------------------------
 * 
 * subroutine DescriptorPrint
 *
 * Prints the contents of a Descriptor.  Primarily used for debugging 
 * purposes, or to investigate what information a descriptor holds.
 *
 */
void DescriptorPrint( struct Descriptor *dp, long rank )
{
	int r;

 	printf( "Descriptor at Address:  0x%08x\n", (void *) dp );
	printf( "Base Address:           0x%08x\n", dp->Base );
	printf( "Length:                 %d\n", dp->Len );
	printf( "Offset:                 %d\n", dp->Offset );
	printf( "Rank:			 %d\n", dp->Rank );
	for( r = 0; r < rank; r++ )
	{
		printf( "  Dimension %d Extent:  %d\n", r, dp->Dim[r].Extent );
		printf( "                 Mult:	 %d\n", dp->Dim[r].Mult );
	       	printf( "           LowerBound:  %d\n", dp->Dim[r].LowerBound );
	}
}

#endif // DESCRIPTCODE
