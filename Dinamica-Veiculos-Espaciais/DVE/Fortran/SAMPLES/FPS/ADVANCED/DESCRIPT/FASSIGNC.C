
#include <stdio.h>

void CUseDescriptor( int farray[10][10] )
{
	int t, s;

	// Print array
	printf( "Fortran array looks like this from C:\n" );
	for( t = 0; t < 10; t++ )
	{
		for( s = 0; s < 10; s++ )
			printf( "%3d ", farray[t][s] );
		printf( "\n" );
	}
}			
	
