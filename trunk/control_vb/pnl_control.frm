VERSION 5.00
Begin VB.Form pnl_control 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Panel de control"
   ClientHeight    =   2835
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4755
   Icon            =   "pnl_control.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2835
   ScaleWidth      =   4755
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command9 
      Caption         =   " Act./Des. Servos"
      Height          =   255
      Left            =   1560
      TabIndex        =   14
      Top             =   1920
      Width           =   1575
   End
   Begin VB.CommandButton Command10 
      Caption         =   "Reiniciar Bot"
      Height          =   255
      Left            =   3120
      TabIndex        =   12
      Top             =   1680
      Width           =   1575
   End
   Begin VB.CommandButton Command8 
      Caption         =   "Evitar obstáculos"
      Height          =   255
      Left            =   1560
      TabIndex        =   11
      Top             =   1680
      Width           =   1575
   End
   Begin VB.CommandButton Command7 
      Caption         =   "Sigue luz"
      Height          =   255
      Left            =   0
      TabIndex        =   10
      Top             =   1680
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Claxon"
      Height          =   255
      Left            =   3120
      TabIndex        =   9
      Top             =   1440
      Width           =   1575
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Fila de leds"
      Height          =   255
      Left            =   1560
      TabIndex        =   8
      Top             =   1440
      Width           =   1575
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Sirena"
      Height          =   255
      Left            =   0
      TabIndex        =   7
      Top             =   1440
      Width           =   1575
   End
   Begin VB.CommandButton w 
      Height          =   615
      Left            =   2040
      Picture         =   "pnl_control.frx":1CCA
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   120
      Width           =   615
   End
   Begin VB.CommandButton q 
      Height          =   1335
      Left            =   0
      Picture         =   "pnl_control.frx":210C
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   0
      Width           =   1335
   End
   Begin VB.CommandButton a 
      Height          =   615
      Left            =   1440
      Picture         =   "pnl_control.frx":254E
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   720
      Width           =   615
   End
   Begin VB.CommandButton s 
      Height          =   615
      Left            =   2040
      Picture         =   "pnl_control.frx":2990
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   720
      Width           =   615
   End
   Begin VB.CommandButton d 
      Height          =   615
      Left            =   2640
      Picture         =   "pnl_control.frx":2DD2
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   720
      Width           =   615
   End
   Begin VB.HScrollBar servo1 
      Height          =   255
      LargeChange     =   10
      Left            =   0
      Max             =   180
      SmallChange     =   10
      TabIndex        =   1
      Top             =   2280
      Value           =   90
      Width           =   4695
   End
   Begin VB.HScrollBar servo2 
      Height          =   255
      LargeChange     =   10
      Left            =   0
      Max             =   180
      SmallChange     =   10
      TabIndex        =   0
      Top             =   2520
      Value           =   90
      Width           =   4695
   End
   Begin VB.Label Label1 
      Caption         =   "Control de servos:"
      Height          =   255
      Left            =   120
      TabIndex        =   13
      Top             =   2040
      Width           =   1935
   End
End
Attribute VB_Name = "pnl_control"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub q_Click()
enviar ("q")
End Sub

Private Sub s_Click()
enviar ("s")
End Sub


Private Sub servo1_Change()
enviar ("G" + Chr$(servo1.Value))
terminal.logg "Servo 1 a " & servo1.Value & " [" & Chr$(servo1.Value) & "]"
End Sub

Private Sub servo2_Change()
enviar ("H" + Chr$(servo2.Value))
End Sub


Private Sub Command2_Click()
enviar (",")
End Sub

Private Sub Command3_Click()
enviar ("v")
End Sub

Private Sub Command5_Click()
enviar ("n")
End Sub

Private Sub Command6_Click()
enviar ("m")
End Sub

Private Sub Command7_Click()
enviar ("2")
End Sub

Private Sub Command8_Click()
enviar ("1")
End Sub

Private Sub Command9_Click()
enviar ("+")
End Sub

Private Sub d_Click()
enviar ("d")
End Sub
Private Sub a_Click()
enviar ("a")
End Sub

Private Sub Command1_Click()
enviar ("b")
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Select Case KeyCode
    Case vbKeyA
        Call a_Click
    Case vbKeyS
        Call s_Click
    Case vbKeyD
        Call d_Click
    Case vbKeyW
        Call w_Click
    Case vbKeyQ
        Call q_Click
End Select
End Sub
Private Sub w_Click()
enviar ("w")
End Sub
