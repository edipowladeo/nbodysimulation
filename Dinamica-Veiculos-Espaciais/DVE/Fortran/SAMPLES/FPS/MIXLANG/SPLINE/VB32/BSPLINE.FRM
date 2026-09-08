VERSION 4.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "VBSpline"
   ClientHeight    =   5820
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   9255
   DrawWidth       =   2
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   6225
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   388
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   617
   Top             =   1170
   Width           =   9375
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "DLL Load Error"
      BeginProperty Font 
         name            =   "MS Sans Serif"
         charset         =   0
         weight          =   700
         size            =   18
         underline       =   0   'False
         italic          =   -1  'True
         strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4575
      Left            =   840
      TabIndex        =   0
      Top             =   600
      Visible         =   0   'False
      Width           =   7455
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BeginProperty Font 
            name            =   "MS Sans Serif"
            charset         =   0
            weight          =   700
            size            =   18
            underline       =   0   'False
            italic          =   0   'False
            strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   3135
         Left            =   960
         TabIndex        =   1
         Top             =   840
         Visible         =   0   'False
         Width           =   5535
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Declare Sub SplineCalculate Lib "spline.dll" Alias "_SPLINECALCULATE@12" (ByRef X As Single, ByRef a As Single, ByRef n As Long)
Private Declare Sub SplineEvaluate Lib "spline.dll" Alias "_SPLINEEVALUATE@8" (ByRef X As Single, ByRef Y As Single)

' Global data (control points for the spline)
Dim numpoints As Long
Dim pointx(1000) As Single
Dim pointy(1000) As Single

' Error happened, don't let any other input happen
Dim ErrorWait As Integer


' Takes care of errors when loading the DLL
Private Sub ErrorHandler(msg)
    Beep
    label1.Caption = msg
    frame1.Visible = True
    label1.Visible = True
    ErrorWait = True
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
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

Private Sub Form_Load()
    ' Initialize Globals
    ErrorWait = False
    numpoints = 0
End Sub


Private Sub Form_MouseDown(button As Integer, Shift As Integer, X As Single, Y As Single)
    
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

Private Sub form_paint()
    Dim lastx As Single, lasty As Single, s As Single, ny As Single
    Form1.Cls
    If (numpoints >= 2) Then
        For t = 1 To numpoints - 1
            Form1.Line (pointx(t), pointy(t))-(pointx(t + 1), pointy(t + 1)), RGB(0, 0, 0)
        Next t
        If (numpoints > 2) Then
            Call SplineCalculate(pointx(1), pointy(1), numpoints)
            lastx = pointx(1)
            Call SplineEvaluate(lastx, lasty)
            For s = lastx + 1 To pointx(numpoints) - 1
                Call SplineEvaluate(s, ny)
                Form1.Line (lastx, lasty)-(s, ny), RGB(255, 0, 0)
                lastx = s
                lasty = ny
            Next s
        End If
    End If
End Sub


