VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form pnl_grafico 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Panel gráfico"
   ClientHeight    =   4545
   ClientLeft      =   1635
   ClientTop       =   330
   ClientWidth     =   10215
   Icon            =   "grafica_analogica.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   10215
   Begin VB.CheckBox canal 
      Caption         =   "7"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   7
      Left            =   2160
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   3600
      Value           =   1  'Checked
      Width           =   255
   End
   Begin VB.CheckBox canal 
      Caption         =   "6"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   6
      Left            =   1920
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   3600
      Value           =   1  'Checked
      Width           =   255
   End
   Begin VB.CheckBox canal 
      Caption         =   "5"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   5
      Left            =   1680
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   3600
      Value           =   1  'Checked
      Width           =   255
   End
   Begin VB.CheckBox canal 
      Caption         =   "4"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   4
      Left            =   1440
      Style           =   1  'Graphical
      TabIndex        =   15
      Top             =   3600
      Value           =   1  'Checked
      Width           =   255
   End
   Begin VB.CheckBox canal 
      Caption         =   "3"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   3
      Left            =   1200
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   3600
      Value           =   1  'Checked
      Width           =   255
   End
   Begin VB.CheckBox canal 
      Caption         =   "2"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   2
      Left            =   960
      Style           =   1  'Graphical
      TabIndex        =   13
      Top             =   3600
      Value           =   1  'Checked
      Width           =   255
   End
   Begin VB.CheckBox canal 
      Caption         =   "1"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   1
      Left            =   720
      Style           =   1  'Graphical
      TabIndex        =   12
      Top             =   3600
      Value           =   1  'Checked
      Width           =   255
   End
   Begin VB.CheckBox canal 
      Caption         =   "0"
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   0
      Left            =   480
      Style           =   1  'Graphical
      TabIndex        =   11
      Top             =   3600
      Value           =   1  'Checked
      Width           =   255
   End
   Begin VB.CheckBox guardar_c 
      Caption         =   "Guardar"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   3600
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   3480
      Value           =   1  'Checked
      Width           =   975
   End
   Begin MSComctlLib.Slider Slider1 
      Height          =   255
      Left            =   0
      TabIndex        =   8
      Top             =   3960
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   450
      _Version        =   393216
      LargeChange     =   10000
      Min             =   1
      Max             =   60000
      SelStart        =   5000
      TickFrequency   =   1000
      Value           =   5000
   End
   Begin VB.CheckBox autoreset 
      Caption         =   "Auto-reset"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   4560
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   3480
      Value           =   1  'Checked
      Width           =   975
   End
   Begin VB.CommandButton volcar 
      Caption         =   "&Volcar"
      Enabled         =   0   'False
      Height          =   375
      Left            =   7200
      TabIndex        =   3
      Top             =   3480
      Width           =   1575
   End
   Begin VB.CheckBox afft 
      Caption         =   "&Activar F.F.T."
      Enabled         =   0   'False
      Height          =   375
      Left            =   5640
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   3480
      Width           =   1575
   End
   Begin VB.CommandButton guardar 
      Caption         =   "&Guardar captura"
      Height          =   375
      Left            =   8640
      TabIndex        =   1
      Top             =   3480
      Width           =   1575
   End
   Begin VB.Timer Timer4 
      Enabled         =   0   'False
      Interval        =   1500
      Left            =   9600
      Top             =   2760
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      ForeColor       =   &H00FFFFFF&
      Height          =   3255
      Left            =   360
      ScaleHeight     =   3195
      ScaleWidth      =   9795
      TabIndex        =   0
      Top             =   0
      Width           =   9855
      Begin VB.Timer aleat 
         Enabled         =   0   'False
         Interval        =   10
         Left            =   6240
         Top             =   2640
      End
      Begin VB.Label voltaje 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Label2"
         ForeColor       =   &H0000FF00&
         Height          =   195
         Left            =   720
         TabIndex        =   9
         Top             =   840
         Visible         =   0   'False
         Width           =   480
      End
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "0 v."
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   0
      TabIndex        =   6
      Top             =   3000
      Width           =   375
   End
   Begin VB.Label ymax 
      BackStyle       =   0  'Transparent
      Caption         =   "5 v."
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   375
   End
   Begin VB.Label Label7 
      BackStyle       =   0  'Transparent
      Caption         =   "Canal:"
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   480
      TabIndex        =   4
      Top             =   3360
      Width           =   495
   End
End
Attribute VB_Name = "pnl_grafico"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim colores(8) As Long

Const valores = 10000
Dim contador(8) As Integer
Dim valor(8, valores) As Integer
Dim tiempo(8, valores) As Single


Dim Send_Buf(0 To 64) As Byte
Dim Rec_Buf(0 To 129) As Byte

Dim REX(100000) 'REX[ ] holds the real part of the frequency domain
Dim IMX(100000) 'IMX[ ] holds the imaginary part of the frequency domain
Const sep = 1


Public Sub fft()
Dim pi As Long
Dim nm1%, nd2%, i%, TR, TI, K%, j%, LE%, LE2%, m%, UR, UI, SR, si, L%, JM1%, IP%
pi = 3.14159265 'Set constants
Dim n% 'valores iniciales

1000 'THE FAST FOURIER TRANSFORM
'copyright © 1997-1999 by California Technical Publishing
'published with  permission from Steven W Smith, www.dspguide.com
'GUI by logix4u , www.logix4u.net
'modified by logix4u, www.logix4.net
1010 'Upon entry, N% contains the number of points in the DFT, REX[ ] and
1020 'IMX[ ] contain the real and imaginary parts of the input. Upon return,
1030 'REX[ ] and IMX[ ] contain the DFT output. All signals run from 0 to N%-1.
1060 nm1% = n% - 1
1070 nd2% = n% / 2
1080 m% = CInt(log(n%) / log(2))
1090 j% = nd2%
1100 '
1110 For i% = 1 To n% - 2 'Bit reversal sorting
1120 If i% >= j% Then GoTo 1190
1130 TR = REX(j%)
1140 TI = IMX(j%)
1150 REX(j%) = REX(i%)
1160 IMX(j%) = IMX(i%)
1170 REX(i%) = TR
1180 IMX(i%) = TI
1190 K% = nd2%
1200 If K% > j% Then GoTo 1240
1210 j% = j% - K%
1220 K% = K% / 2
1230 GoTo 1200
1240 j% = j% + K%
1250 Next i%
1260 '
1270 For L% = 1 To m% 'Loop for each stage
1280 LE% = CInt(2 ^ L%)
1290 LE2% = LE% / 2
1300 UR = 1
1310 UI = 0
1320 SR = Cos(pi / LE2%) 'Calculate sine & cosine values
1330 si = -Sin(pi / LE2%)
1340 For j% = 1 To LE2% 'Loop for each sub DFT
1350 JM1% = j% - 1
1360 For i% = JM1% To nm1% Step LE% 'Loop for each butterfly
1370 IP% = i% + LE2%
1380 TR = REX(IP%) * UR - IMX(IP%) * UI 'Butterfly calculation
1390 TI = REX(IP%) * UI + IMX(IP%) * UR
1400 REX(IP%) = REX(i%) - TR
1410 IMX(IP%) = IMX(i%) - TI
1420 REX(i%) = REX(i%) + TR
1430 IMX(i%) = IMX(i%) + TI
DoEvents
1440 Next i%
1450 TR = UR
1460 UR = TR * SR - UI * si
1470 UI = TR * si + UI * SR
1480 Next j%
1490 Next L%
1500 '
End Sub

Private Sub Command3_Click()
'Dim max, cnt, va, vc As Long
'Dim tim As Long
''Me.Caption = "Realizando FFT..."
''Check3.Value = 0
''Timer4.Enabled = False
'If n = 0 Then n = pm
''xmax = Str(Int(1000 / Abs((Timer - Timer2)))) + "Hz."
'For cnt = 0 To 100000
'    REX(cnt) = 0
'    IMX(cnt) = 0
'Next
'For cnt = 1 To n
'    REX(cnt) = py(0, cnt)
'    IMX(cnt) = 0
'Next cnt
'fft
''Call Picture1_Click
'max = 0
'For cnt = 1 To n
'    va = Sqr((IMX(cnt) * IMX(cnt)) + (REX(cnt) * REX(cnt)))
'    If va > max Then max = va
'Next
'If max = 0 Then max = 1
'ymax = max
'For cnt = 1 To n
'    va = Sqr((IMX(cnt) * IMX(cnt)) + (REX(cnt) * REX(cnt))) * CLng(Picture1.Height) / max
'    Picture1.Line (cnt * sep, Picture1.Height - va)-((cnt - 1) * sep, Picture1.Height - vc), RGB(255, 255, 255)
'    vc = va
'Next cnt
'Me.Caption = "FFT Realizada"
End Sub

Public Sub anadir_pto(n As Integer, v As Integer, t As Single)
Dim cv, cav As Integer
Dim cx, cax As Single
tiempo(n, contador(n)) = Timer
valor(n, contador(n)) = v
If guardar_c.Value = Checked Then
    Open App.Path & "\valores_" & Date$ & ".csv" For Append As #3
    Write #3, n, contador(n), valor(n, contador(n))
    Close #3
End If
If (contador(n) = 0) Then
    cax = 0
    cav = valor(n, 0)
Else
    cax = tiempo(n, contador(n) - 1) - tiempo(n, 0)
    cav = valor(n, contador(n) - 1)
End If
If canal(n).Value = Checked Then
    cx = tiempo(n, contador(n)) - tiempo(n, 0)
    cax = cax * Picture1.Width / Slider1.Value * 1000
    cx = cx * Picture1.Width / Slider1.Value * 1000
    cav = Picture1.Height - cav * (Picture1.Height / 255)
    cv = Picture1.Height - valor(n, contador(n)) * (Picture1.Height / 255)
    If contador(n) < valores Then contador(n) = contador(n) + 1
    
    If cx > Picture1.Width Then
        If autoreset.Value = Checked Then inicializar
    Else
        Picture1.Line (cax, cav)-(cx, cv), colores(n)
    End If
End If
End Sub

Private Sub inicializar()
Dim j As Integer
For j = 0 To 8
    contador(j) = 0
Next j
limpiar
End Sub

Private Sub aleat_Timer()
anadir_pto 0, Rnd() * 255, 0.05
End Sub

Private Sub Form_Load()
colores(0) = RGB(255, 255, 255)
colores(1) = RGB(255, 0, 0)
inicializar
limpiar
End Sub

Private Sub guardar_Click()
SavePicture Picture1.Image, "./captura.bmp"
End Sub

Private Sub limpiar()
    Picture1.Cls
    Dim Y As Integer
    For Y = 0 To 20
        Picture1.Line (0, Y * Picture1.Height / 20)-Step(Picture1.Width, 0), RGB(0, 64, 0)
    Next
    For Y = 0 To 5
        Picture1.Line (0, Y * Picture1.Height / 5)-Step(Picture1.Width, 0), RGB(0, 128, 0)
    Next
End Sub


Private Sub Picture1_Click()
    limpiar
End Sub


Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
voltaje.Top = Picture1.Top + Y
voltaje.Left = Picture1.Left + X
voltaje.Caption = Int((500 / Picture1.Height) * (Picture1.Height - Y)) / 100 & " V.  -  " & Int(X / Slider1.Value * 100) / 100 & "s."
voltaje.Visible = True
Timer4.Enabled = True
End Sub




Private Sub Slider1_Change()
inicializar
End Sub


Private Sub Timer4_Timer()
voltaje.Visible = False
End Sub

Private Sub volcar_Click()
Dim j As Integer
Open "./volcado.txt" For Output As #4
    For j = 0 To 128
        Print #4, Rec_Buf(j)
    Next
Close #4
End Sub

