
' Interfaces to Generic Thunk routines
Declare Function ThunkLoadLibrary Lib "kernel" Alias "LoadLibraryEx32W" (ByVal LibName As String, ByVal File As Long, ByVal flags As Long) As Long
Declare Function ThunkGetProcAddress Lib "kernel" Alias "GetProcAddress32W" (ByVal Handle As Long, ByVal ProcName As String) As Long
Declare Sub ThunkFreeLibrary Lib "kernel" Alias "FreeLibrary32W" (ByVal Handle As Long)

' Wrappers for calls to CallProc32W
Declare Sub SplineCalcTCP Lib "kernel" Alias "CallProc32W" (X As Single, a As Single, n As Long, ByVal ProcAddr As Long, ByVal AddrMask As Long, ByVal NumrArgs As Long)
Declare Sub SplineEvalTCP Lib "kernel" Alias "CallProc32W" (X As Single, Y As Single, ByVal ProcAddr As Long, ByVal AddrMask As Long, ByVal NumArgs As Long)

' Handle for Spline.DLL and function pointers for our two DLL routines
Dim SplineDll As Long
Dim SplineCalculateAddr As Long
Dim SplineEvaluateAddr As Long

' Global data (control points for the spline)
Dim numpoints As Long
Dim pointx(1000) As Single
Dim pointy(1000) As Single

' Error happened, don't let any other input happen
Dim ErrorWait As Integer


' Takes care of errors when loading the DLL
Sub ErrorHandler (msg)
    Beep
    label1.Caption = msg
    frame1.Visible = True
    label1.Visible = True
    ErrorWait = True
End Sub

Sub Form_KeyDown (KeyCode As Integer, Shift As Integer)
    If (ErrorWait) Then
        Exit Sub
    End If
    
    ' Delete a control point if 'DEL' key is pressed
    If ((KeyCode = 46) And (numpoints > 0)) Then
        numpoints = numpoints - 1
    Else
        Beep
    End If

    Call form_paint
End Sub

Sub Form_Load ()
    ' Initialize Globals
    ErrorWait = False
    numpoints = 0

    ' Load the library, and get function pointers to our two DLL entry points
    SplineDll = ThunkLoadLibrary("Spline.Dll", 0, 0)
    If (SplineDll = 0) Then
        Call ErrorHandler("Error loading 'spline.dll'.  Check that this dll is on the path or in the current directory.")
        Exit Sub
    End If
    SplineCalculateAddr = ThunkGetProcAddress(SplineDll, "_SPLINECALCULATE@12")
    If (SplineCalculateAddr = 0) Then
        Call ErrorHandler("Error finding entry point SplineCalculate in DLL spline.dll.")
        Exit Sub
    End If
    SplineEvaluateAddr = ThunkGetProcAddress(SplineDll, "_SPLINEEVALUATE@8")
    If (SplineEvaluateAddr = 0) Then
        Call ErrorHandler("Error finding entry point SplineEvaluate in DLL spline.dll.")
        Exit Sub
    End If
End Sub


Sub Form_MouseDown (button As Integer, Shift As Integer, X As Single, Y As Single)
    
    If (ErrorWait) Then
        Exit Sub
    End If
    
    If (button = 2) Then
        Call Form_KeyDown(46, 0)    ' Simulate "DEL" key
        Exit Sub
    End If
    
    ' Add control point
    If (numpoints >= 1) Then
        If (X > pointx(numpoints)) Then
            numpoints = numpoints + 1
            pointx(numpoints) = X
            pointy(numpoints) = Y
            Call form_paint
        Else
            Beep
        End If
    Else
        numpoints = 1
        pointx(1) = X
        pointy(1) = Y
        Call form_paint
    End If
End Sub

Sub form_paint ()
    Dim lastx As Single, lasty As Single, s As Single, ny As Single
    form1.Cls
    If (numpoints >= 2) Then
        For t = 1 To numpoints - 1
            form1.Line (pointx(t), pointy(t))-(pointx(t + 1), pointy(t + 1)), RGB(0, 0, 0)
        Next t
        If (numpoints > 2) Then
            Call SplineCalculate(pointx(1), pointy(1), numpoints)
            lastx = pointx(1)
            Call SplineEvaluate(lastx, lasty)
            For s = lastx + 1 To pointx(numpoints) - 1
                Call SplineEvaluate(s, ny)
                form1.Line (lastx, lasty)-(s, ny), RGB(255, 0, 0)
                lastx = s
                lasty = ny
            Next s
        End If
    End If
End Sub

Sub Form_Unload (Cancel As Integer)
    ' Free our DLL library before exiting
    Call ThunkFreeLibrary(SplineDll)
End Sub

Sub SplineCalculate (X As Single, a As Single, n As Long)
    Call SplineCalcTCP(X, a, n, SplineCalculateAddr, 7, 3)
End Sub

Sub SplineEvaluate (X As Single, Y As Single)
    ' 3 is the argument address translation mask
    ' 2 is the number of arguments other than the last three
    Call SplineEvalTCP(X, Y, SplineEvaluateAddr, 3, 2)
End Sub

