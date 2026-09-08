!     DERIVED.F90      Define a derived-type structure, type variables,
!                      and assign values

      TYPE member
       INTEGER age
       CHARACTER (LEN = 20) name
      END TYPE member

      TYPE (member) :: george
      TYPE (member) :: ernie

      george     = member( 33, 'George Brown' )
      ernie%age  = 56
      ernie%name = 'Ernie Brown'

      WRITE (*,*) george
      WRITE (*,*) ernie
      END
