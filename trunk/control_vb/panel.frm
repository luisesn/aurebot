VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form panel 
   BackColor       =   &H00000000&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Panel de sensores"
   ClientHeight    =   3270
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4230
   Icon            =   "panel.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3270
   ScaleWidth      =   4230
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "AureBot"
      ForeColor       =   &H00FFFFFF&
      Height          =   3135
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   3975
      Begin VB.CommandButton Command6 
         Caption         =   "Led D"
         Height          =   255
         Left            =   3240
         TabIndex        =   2
         Top             =   600
         Width           =   615
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Led I"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   600
         Width           =   615
      End
      Begin MSComctlLib.ProgressBar sd 
         Height          =   1695
         Left            =   3240
         TabIndex        =   3
         Top             =   960
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   2990
         _Version        =   393216
         Appearance      =   0
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin MSComctlLib.ProgressBar si 
         Height          =   1695
         Left            =   480
         TabIndex        =   4
         Top             =   960
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   2990
         _Version        =   393216
         Appearance      =   0
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin MSComctlLib.ProgressBar cnyi 
         Height          =   1695
         Left            =   120
         TabIndex        =   5
         Top             =   960
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   2990
         _Version        =   393216
         Appearance      =   0
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin MSComctlLib.ProgressBar cnyd 
         Height          =   1695
         Left            =   3600
         TabIndex        =   6
         Top             =   960
         Width           =   255
         _ExtentX        =   450
         _ExtentY        =   2990
         _Version        =   393216
         Appearance      =   0
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.Image Image1 
         Height          =   1185
         Left            =   1200
         Picture         =   "panel.frx":1CCA
         Top             =   1080
         Width           =   1620
      End
      Begin VB.Label Label3 
         BackStyle       =   0  'Transparent
         Caption         =   "Pulsador"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1320
         TabIndex        =   16
         Top             =   2400
         Width           =   735
      End
      Begin VB.Shape pu 
         BorderColor     =   &H008080FF&
         FillColor       =   &H0000FFFF&
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   2160
         Shape           =   3  'Circle
         Top             =   2400
         Width           =   375
      End
      Begin VB.Label sni 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "000"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   480
         TabIndex        =   15
         Top             =   2640
         Width           =   255
      End
      Begin VB.Label Label2 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Obst. dcho."
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   2040
         TabIndex        =   14
         Top             =   240
         Width           =   975
      End
      Begin VB.Label asdasd 
         BackStyle       =   0  'Transparent
         Caption         =   "Obst. izdo."
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   960
         TabIndex        =   13
         Top             =   240
         Width           =   975
      End
      Begin VB.Shape obsd 
         BorderColor     =   &H008080FF&
         FillColor       =   &H0000FFFF&
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   2040
         Top             =   600
         Width           =   975
      End
      Begin VB.Shape obsi 
         BorderColor     =   &H008080FF&
         FillColor       =   &H0000FFFF&
         FillStyle       =   0  'Solid
         Height          =   255
         Left            =   960
         Top             =   600
         Width           =   975
      End
      Begin VB.Label snd 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "000"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   3120
         TabIndex        =   12
         Top             =   2640
         Width           =   495
      End
      Begin VB.Label cnynd 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "000"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   3600
         TabIndex        =   11
         Top             =   2640
         Width           =   255
      End
      Begin VB.Label cnyni 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "000"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   2640
         Width           =   255
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "CNY-LDR"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   2880
         Width           =   735
      End
      Begin VB.Label Label4 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "CNY-LDR"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   3120
         TabIndex        =   8
         Top             =   2880
         Width           =   735
      End
      Begin VB.Label umbral_ldr 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "000"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   1680
         TabIndex        =   7
         Top             =   2880
         Width           =   495
      End
   End
End
Attribute VB_Name = "panel"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command5_Click()
enviar "n"
End Sub

Private Sub Command6_Click()
enviar "m"
End Sub

Private Sub Form_Load()

' Establece el Backcolor
Color_Fondo sd.hWnd, RGB(0, 50, 0)
Color_Progreso sd.hWnd, RGB(0, 255, 0)

Color_Fondo si.hWnd, RGB(0, 50, 0)
Color_Progreso si.hWnd, RGB(0, 255, 0)


Color_Fondo cnyi.hWnd, RGB(0, 0, 50)
Color_Fondo cnyd.hWnd, RGB(0, 0, 50)
Color_Progreso cnyi.hWnd, RGB(0, 0, 255)
Color_Progreso cnyd.hWnd, RGB(0, 0, 255)

End Sub
