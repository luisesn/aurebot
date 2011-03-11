VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form terminal 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Control de AUREBot"
   ClientHeight    =   6630
   ClientLeft      =   -135
   ClientTop       =   360
   ClientWidth     =   9960
   Icon            =   "terminal.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6630
   ScaleWidth      =   9960
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox imprimir 
      Caption         =   "Salida"
      Height          =   255
      Left            =   3480
      Style           =   1  'Graphical
      TabIndex        =   14
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton Command5 
      Caption         =   "P. Gráfico"
      Height          =   255
      Left            =   6720
      TabIndex        =   13
      Top             =   6360
      Width           =   1095
   End
   Begin RichTextLib.RichTextBox log 
      Height          =   6135
      Left            =   0
      TabIndex        =   12
      Top             =   0
      Width           =   9975
      _ExtentX        =   17595
      _ExtentY        =   10821
      _Version        =   393217
      BackColor       =   16777215
      HideSelection   =   0   'False
      ReadOnly        =   -1  'True
      ScrollBars      =   2
      Appearance      =   0
      TextRTF         =   $"terminal.frx":1CCA
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "System"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.CommandButton Command4 
      Caption         =   "P. Digital"
      Height          =   255
      Left            =   8880
      TabIndex        =   11
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   "P. Analógico"
      Height          =   255
      Left            =   7800
      TabIndex        =   10
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton Command12 
      Caption         =   "Limpiar"
      Height          =   255
      Left            =   7800
      TabIndex        =   9
      Top             =   6120
      Width           =   2175
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Sensores"
      Height          =   255
      Left            =   5640
      TabIndex        =   8
      Top             =   6360
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "P. Control"
      Height          =   255
      Left            =   4560
      TabIndex        =   7
      Top             =   6360
      Width           =   1095
   End
   Begin VB.TextBox velocidad 
      Height          =   285
      Left            =   1200
      TabIndex        =   6
      Text            =   "9600"
      Top             =   6240
      Width           =   615
   End
   Begin MSComDlg.CommonDialog cd 
      Left            =   1560
      Top             =   5520
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      Filter          =   "*.hex"
   End
   Begin VB.CommandButton Command13 
      Caption         =   "Cargar archivo"
      Height          =   255
      Left            =   5640
      TabIndex        =   5
      Top             =   6120
      Width           =   2175
   End
   Begin VB.TextBox puerto 
      Height          =   285
      Left            =   720
      TabIndex        =   3
      Text            =   "3"
      Top             =   6240
      Width           =   375
   End
   Begin VB.CommandButton Command11 
      Caption         =   "Conectar"
      Height          =   255
      Left            =   3480
      TabIndex        =   2
      Top             =   6120
      Width           =   2175
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   1080
      Top             =   5640
   End
   Begin MSCommLib.MSComm com 
      Left            =   0
      Top             =   5520
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.Timer cmp 
      Interval        =   1
      Left            =   600
      Top             =   5640
   End
   Begin VB.TextBox log1 
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "System"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   1335
      Left            =   7200
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "terminal.frx":1D47
      Top             =   3000
      Width           =   1215
   End
   Begin VB.Label Label5 
      BackStyle       =   0  'Transparent
      Caption         =   "COM:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   6240
      Width           =   495
   End
   Begin VB.Label data 
      BackStyle       =   0  'Transparent
      Caption         =   "Conexión:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   1920
      TabIndex        =   1
      Top             =   6240
      Width           =   1335
   End
   Begin VB.Shape datos 
      BorderColor     =   &H008080FF&
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   255
      Left            =   3000
      Shape           =   5  'Rounded Square
      Top             =   6240
      Width           =   495
   End
End
Attribute VB_Name = "terminal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
 Option Explicit
Dim fps As Integer



Dim t_grafica(8) As Single
Dim buffer As String
Dim abrir_puerto As Boolean



Public Sub logg(L As String)
If log.Text <> "" Then If Mid$(log.Text, Len(log.Text), 1) <> vbLf And Mid$(log.Text, Len(log.Text), 1) <> vbCr Then log.Text = log.Text & vbCrLf

    LockWindowUpdate (log.hWnd)
    log.Text = log.Text + Time$ + ">>" + L + vbCrLf
    'If (Len(log.Text) > 2000) Then log.Text = Mid$(log.Text, Len(log.Text) - 2000, 2000)
    log.SelStart = Len(log.Text) - 1
    log.SelLength = 1
    LockWindowUpdate (0)
Open App.Path & "\log" & Date$ & ".txt" For Append As #2
Write #2, Date$, Time$, Int(Timer), L
Close #2
End Sub


Private Sub cmp_Timer()
Dim pos, t As Integer
Dim b As String
If com.PortOpen = True Then
    fps = fps + 1
'Do While com.InBufferCount > 0
    b = com.Input
    If b <> "" Then
        If Len(buffer) > 25 Then buffer = ""
        buffer = buffer & b
    End If
'Loop
End If
    pos = InStr(1, buffer, "<", vbTextCompare)
    If pos > 0 And Len(buffer) >= pos + 5 And Mid(buffer, pos + 5, 1) = ">" Then
            'logg "|" & Mid(buffer, pos + 1, 2) & "|"
            Select Case Mid(buffer, pos + 1, 1)
                Case "A" 'Hay que cambiar esta letra!
                    If IsFormLoaded(barras_analogicas) = True Then
                        t = Asc(Mid(buffer, pos + 2, 1)) - Asc("0")
                        barras_analogicas.num(t).Caption = Asc(Mid(buffer, pos + 4, 1)) * 2 / 100
                    End If
                    If IsFormLoaded(pnl_grafico) = True Then
                        t = Asc(Mid(buffer, pos + 2, 1)) - Asc("0")
                        If Abs(Timer - t_grafica(t)) > 0.5 Then t_grafica(t) = Timer
                        pnl_grafico.anadir_pto t, Asc(Mid(buffer, pos + 4, 1)), (Timer - t_grafica(t))
                        t_grafica(t) = Timer
                    End If

            End Select
            Select Case Mid(buffer, pos + 1, 2)
                Case "SI"
                    panel.si.Value = Val(Asc(Mid(buffer, pos + 4, 1))) + 1
                    panel.sni.Caption = Str(Asc(Mid(buffer, pos + 4, 1)))
                Case "SD"
                    panel.sd.Value = Asc(Mid(buffer, pos + 4, 1)) + 1
                    panel.snd.Caption = Str(Asc(Mid(buffer, pos + 4, 1)))
                    panel.umbral_ldr.Caption = Val(Abs(panel.sd.Value - panel.si.Value))
                Case "CI"
                    t = Asc(Mid(buffer, pos + 4, 1))
                    panel.cnyi.Value = t + 1
                    Color_Progreso panel.cnyi.hWnd, RGB(t, t, t)
                    panel.cnyni.Caption = Str(t)
                Case "CD"
                    t = Asc(Mid(buffer, pos + 4, 1))
                    panel.cnyd.Value = t + 1
                    Color_Progreso panel.cnyd.hWnd, RGB(t, t, t)
                    panel.cnynd.Caption = Str(t)
                Case "PU"
                    If (Mid(buffer, pos + 4, 1)) = "L" Then panel.pu.FillColor = QBColor(2) Else panel.pu.FillColor = QBColor(4)
                Case "BI"
                    If (Mid(buffer, pos + 4, 1)) = "L" Then panel.obsi.FillColor = QBColor(2) Else panel.obsi.FillColor = QBColor(4)
                Case "BD"
                    If (Mid(buffer, pos + 4, 1)) = "L" Then panel.obsd.FillColor = QBColor(2) Else panel.obsd.FillColor = QBColor(4)
            End Select
        buffer = Mid$(buffer, pos + 5)
        datos.FillColor = QBColor(2)
        DoEvents
End If
If imprimir.Value = Unchecked Then
      LockWindowUpdate (log.hWnd)
      log.Text = log.Text & b
'      If (Len(log.Text) > 2000) Then log.Text = Mid$(log.Text, Len(log.Text) - 2000, 2000)
On Error Resume Next
      log.SelStart = Len(log.Text) - 1
      log.SelLength = 1
      LockWindowUpdate (0)
End If
End Sub







Private Sub Command1_Click()
pnl_control.Show
End Sub

Private Sub Command11_Click()
If abrir_puerto = True Then
abrir_puerto = False
If com.PortOpen = True Then com.PortOpen = False
datos.FillColor = QBColor(4)
Command11.Caption = "Conectar"
Else
abrir_puerto = True
Command11.Caption = "Desconectar"
End If
End Sub

Private Sub Command12_Click()
log.Text = ""
End Sub

Private Sub Command13_Click()
Dim f, buffer, buffer2 As String
Dim a, b, c, j As Integer
Dim t, r As Long

If com.PortOpen = False Then
    logg "El puerto no está abierto." & vbCrLf & " Conecte la AureBoard al puerto USB y póngala en modo programación"
    Exit Sub
End If
cd.ShowOpen
f = cd.FileName
If f = "" Then Exit Sub
Timer1.Enabled = False
cmp.Enabled = False

Open f For Input As #3
    a = 0
    Do While Not EOF(3)
        Input #3, buffer
        If Mid$(buffer, 1, 1) = ":" Then a = a + 1
    Loop
Close #3
logg "Archivo con " & a & " líneas."
r = Timer
Open f For Input As #3
    b = 0
    Do While Not EOF(3)
        b = b + 1
        Input #3, buffer
        If Mid$(buffer, 1, 1) = ":" Then
            com.Output = buffer & vbCr
            c = 0
            t = Timer
            Me.Caption = "Enviada línea: " & b & " quedan " & Int(((Timer - r) / b) * (a - b)) & " segundos. " & "(" & Int(b / a * 100) & "%)"
            Do While (Timer - t) < 5
                DoEvents
                buffer2 = com.Input
                For j = 1 To Len(buffer2)
                    c = Asc(Mid$(buffer2, j, 1))
                    If c = 6 Then Exit Do
                    If c = 13 Then Exit Do
                Next j
            Loop
            If c <> 6 And c <> 11 And c <> 13 Then logg "TIMEOUT": Exit Do
            If c = 11 Or c = 13 Then Exit Do
        End If
    Loop
Close #3
Me.Caption = App.Title
If c = 6 Or c = 19 Then
    logg "Carga correcta. En " & Int(Timer - r) & " segundos."
    Command11_Click
    If com.PortOpen = True Then com.PortOpen = False
Else
    logg "Ocurrió un error."
End If
Timer1.Enabled = True
cmp.Enabled = True
End Sub


Private Sub Command2_Click()
panel.Show
End Sub

Private Sub Command3_Click()
barras_analogicas.Show
End Sub

Private Sub Command4_Click()
    MsgBox "On it!"
End Sub

Private Sub Command5_Click()
    pnl_grafico.Show
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
    Case 112
        Command11_Click
    Case 113
        Command13_Click
    Case 116
        Command1_Click
    Case 117
        Command2_Click
    Case 118
        Command3_Click
    Case 119
        Command4_Click
End Select

End Sub

Private Sub Form_Load()
log.Text = ""
logg "Iniciando: " & App.Title & " Versión:" & App.Major & "." & App.Minor & "." & App.Revision
logg "Cargado"
abrir_puerto = False
logg "Inicio Ok."
End Sub

Private Sub Form_Terminate()
If com.PortOpen = True Then com.PortOpen = False
logg "Terminate."
End Sub

Private Sub Form_Unload(Cancel As Integer)
If IsFormLoaded(panel) Then Unload panel
If IsFormLoaded(pnl_control) Then Unload pnl_control
If IsFormLoaded(barras_analogicas) Then Unload barras_analogicas
If IsFormLoaded(pnl_grafico) Then Unload pnl_grafico
logg "Unload"
End Sub

Private Sub log_KeyPress(KeyAscii As Integer)
enviar (Chr$(KeyAscii))
End Sub

Private Sub Timer1_Timer()
data = "Datos (" & fps * 2 & "):"
fps = 0
If abrir_puerto = True Then
    On Error GoTo 31415
    If com.PortOpen = False Then
        datos.FillColor = QBColor(4)
         logg "Abriendo puerto..."
         com.CommPort = puerto.Text
        ' 9600 baudios, sin paridad, 8 bits de datos y 1
         ' bit de parada.
         com.Settings = velocidad.Text & ",N,8,1"
        ' Indicar al control que lea todo el búfer al usar
         ' Input.
         com.InputLen = 0
        ' Abrir el puerto.
         com.PortOpen = True
         logg "Puerto abierto."
    Else
        If datos.FillColor <> QBColor(2) Then datos.FillColor = QBColor(14)
    End If
GoTo 31416
31415
    datos.FillColor = QBColor(4)
    logg "No se pudo abrir."
31416
    On Error GoTo 0
End If

End Sub

