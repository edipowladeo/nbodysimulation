!-----------------------------------------------------------------------
!
!  PIANOMOD.F90 - Module file for QWPIANO
!
!  This module contains global data declarations and initializations.
!
!  Because of the initializations, this module's object file is needed
!  by the rest of the program.  If a module contains only declarations,
!  then only its MOD file is needed.
!
!-----------------------------------------------------------------------

MODULE PIANOMOD

! You can change the limit on the number of notes that can be remembered
! and played back with the following parameter.
PARAMETER   (NoteLimit = 500)

LOGICAL     recording
INTEGER(4)  KeyUnit, RecUnit, scale, third, tempo
INTEGER(2)  BackColor, Ebony, Ivory, Ebonydown, Ivorydown
INTEGER(4)  NumNotes, MemNotes(NoteLimit,2)
INTEGER(4)  EbonyNotes(0:29), IvoryNotes(0:29)

! Initialize global variables

DATA recording / .FALSE. /
DATA KeyUnit   / 3  /
DATA RecUnit   / 4  /
DATA scale     / 15 /
DATA third     / 5  /
DATA tempo     / 2  /
DATA BackColor / 6  / ! You can change the colors used for the
DATA Ebony     / 0  / ! keyboard by changing these 5 variables.
DATA Ivory     / 15 / ! But make sure that none of the 5 are
DATA Ebonydown / 5  / ! the same, or the program may get confused
DATA Ivorydown / 13 / ! since it makes decisions based on color.
DATA NumNotes  / 0  /

! Here are the frequencies in Hertz of four octaves of the tempered scale.

DATA EbonyNotes / 0, 117,    0,  139,  156,    0,  185,  208, &
                     233,    0,  277,  311,    0,  370,  415, &
                     466,    0,  554,  622,    0,  740,  831, &
                     932,    0, 1109, 1245,    0, 1480, 1661, 0 /

DATA IvoryNotes / 0, 110,  123,  131,  147,  165,  175,  196, &
                     220,  247,  262,  294,  330,  349,  392, &
                     440,  494,  523,  587,  659,  698,  784, &
                     880,  988, 1047, 1175, 1319, 1397, 1568, 1760 /

END MODULE PIANOMOD

!-----------------------------------------------------------------------
