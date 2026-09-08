!-----------------------------------------------------------------------
!
!  PTEMPO.F90 - Tempo menu subroutines for QWPIANO
!
!  Routines in this source file:
!    Andante  = Slow
!    Moderato = Normal
!    Allegro  = Fast
!
!  All three of these routines set the global tempo variable to a value
!  appropriate to the name of the menu item selected.  Then they put a
!  check mark next to their menu item's name, and cancel any check mark
!  that may have existed for the others.
!
!-----------------------------------------------------------------------

SUBROUTINE Andante(checked)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)  checked

tempo = 3
checked = modifymenuflagsqq(3, 1, $MENUCHECKED)
checked = modifymenuflagsqq(3, 2, $MENUUNCHECKED)
checked = modifymenuflagsqq(3, 3, $MENUUNCHECKED)

return
end

!-----------------------------------------------------------------------

SUBROUTINE Moderato(checked)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)  checked

tempo = 2
checked = modifymenuflagsqq(3, 1, $MENUUNCHECKED)
checked = modifymenuflagsqq(3, 2, $MENUCHECKED)
checked = modifymenuflagsqq(3, 3, $MENUUNCHECKED)

return
end

!-----------------------------------------------------------------------

SUBROUTINE Allegro(checked)

USE MSFLIB
USE PIANOMOD

LOGICAL(4)  checked

tempo = 1
checked = modifymenuflagsqq(3, 1, $MENUUNCHECKED)
checked = modifymenuflagsqq(3, 2, $MENUUNCHECKED)
checked = modifymenuflagsqq(3, 3, $MENUCHECKED)

return
end

!-----------------------------------------------------------------------
