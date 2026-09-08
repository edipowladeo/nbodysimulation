
#define DESCRIPTCODE
#include "descript.h"

int carray[10][10];

void CCreateDescriptor( struct Descriptor *dp )
{
	int t, s;

	// Fill in descriptor passed from Fortran
	DescriptorAssign( dp, &carray[0][0], sizeof(carray[0][0]), 
			  DescriptRowOrder, 2,
			  1, 10, 1, 10,
			  1, 10, 1, 10 );

	// Fill in array	
	for( t = 0; t < 10; t++ )
		for( s = 0; s < 10; s++ )
			carray[t][s] = t*10 + s;

	// Print array
	printf( "C array looks like this from C:\n" );
	for( t = 0; t < 10; t++ )
	{
		for( s = 0; s < 10; s++ )
			printf( "%3d ", carray[t][s] );
		printf( "\n" );
	}

}			
	
