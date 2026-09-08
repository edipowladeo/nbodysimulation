module sharedata
    real(8):: g_vAngle = 25.0_8
    integer g_axisOn
    integer:: g_rSpeed = 3
    real:: g_cSize = 1.48
    real:: g_vSpeed = 10.0
    real:: g_vStep = 10.0

    integer:: g_hPalette=0
    real g_identity(4,4)
    type tCube
	real    ort(4,4)
    end type
    type(tCube) g_cube(3,3,3)

    type tSlot
	integer    cId(3)
    end type
    type(tSlot) g_slot(3,3,3)

    real(4) g_sin_tab(0:90)
    real(4) g_cos_tab(0:90)
    integer G_ROTATE_X
    integer G_ROTATE_Y
    integer G_ROTATE_Z
    integer G_ROTATE_LEV
    integer G_ROTATE_CW
    parameter (G_ROTATE_X =   #00000210)
    parameter (G_ROTATE_Y =   #00000220)
    parameter (G_ROTATE_Z =   #00000240)
    parameter (G_ROTATE_LEV = #00000003)
    parameter (G_ROTATE_CW =  #00000004)
    type stack
        integer, pointer, dimension(:):: buf
        integer size
        integer top
        integer count
    end type
    type(stack) cmdStack
end
