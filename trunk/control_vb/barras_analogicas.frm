VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form barras_analogicas 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Panel analógico"
   ClientHeight    =   2760
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7785
   Icon            =   "barras_analogicas.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2760
   ScaleWidth      =   7785
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "An7"
      ForeColor       =   &H00FFFFFF&
      Height          =   2655
      Index           =   7
      Left            =   6840
      TabIndex        =   21
      Top             =   0
      Width           =   855
      Begin MSComctlLib.ProgressBar barra 
         Height          =   1935
         Index           =   7
         Left            =   240
         TabIndex        =   22
         Top             =   240
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   3413
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Enabled         =   0   'False
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.Label num 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "88.88"
         BeginProperty Font 
            Name            =   "System"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Index           =   7
         Left            =   120
         TabIndex        =   23
         Top             =   2280
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "An6"
      ForeColor       =   &H00FFFFFF&
      Height          =   2655
      Index           =   6
      Left            =   5880
      TabIndex        =   18
      Top             =   0
      Width           =   855
      Begin MSComctlLib.ProgressBar barra 
         Height          =   1935
         Index           =   6
         Left            =   240
         TabIndex        =   19
         Top             =   240
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   3413
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Enabled         =   0   'False
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.Label num 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "88.88"
         BeginProperty Font 
            Name            =   "System"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Index           =   6
         Left            =   120
         TabIndex        =   20
         Top             =   2280
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "An5"
      ForeColor       =   &H00FFFFFF&
      Height          =   2655
      Index           =   5
      Left            =   4920
      TabIndex        =   15
      Top             =   0
      Width           =   855
      Begin MSComctlLib.ProgressBar barra 
         Height          =   1935
         Index           =   5
         Left            =   240
         TabIndex        =   16
         Top             =   240
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   3413
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Enabled         =   0   'False
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.Label num 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "88.88"
         BeginProperty Font 
            Name            =   "System"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   17
         Top             =   2280
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "An3"
      ForeColor       =   &H00FFFFFF&
      Height          =   2655
      Index           =   3
      Left            =   3000
      TabIndex        =   12
      Top             =   0
      Width           =   855
      Begin MSComctlLib.ProgressBar barra 
         Height          =   1935
         Index           =   3
         Left            =   240
         TabIndex        =   13
         Top             =   240
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   3413
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Enabled         =   0   'False
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.Label num 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "88.88"
         BeginProperty Font 
            Name            =   "System"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   14
         Top             =   2280
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "An4"
      ForeColor       =   &H00FFFFFF&
      Height          =   2655
      Index           =   4
      Left            =   3960
      TabIndex        =   9
      Top             =   0
      Width           =   855
      Begin MSComctlLib.ProgressBar barra 
         Height          =   1935
         Index           =   4
         Left            =   240
         TabIndex        =   10
         Top             =   240
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   3413
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Enabled         =   0   'False
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.Label num 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "88.88"
         BeginProperty Font 
            Name            =   "System"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   11
         Top             =   2280
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "An2"
      ForeColor       =   &H00FFFFFF&
      Height          =   2655
      Index           =   2
      Left            =   2040
      TabIndex        =   6
      Top             =   0
      Width           =   855
      Begin MSComctlLib.ProgressBar barra 
         Height          =   1935
         Index           =   2
         Left            =   240
         TabIndex        =   7
         Top             =   240
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   3413
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Enabled         =   0   'False
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.Label num 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "88.88"
         BeginProperty Font 
            Name            =   "System"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   8
         Top             =   2280
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "An1"
      ForeColor       =   &H00FFFFFF&
      Height          =   2655
      Index           =   1
      Left            =   1080
      TabIndex        =   3
      Top             =   0
      Width           =   855
      Begin MSComctlLib.ProgressBar barra 
         Height          =   1935
         Index           =   1
         Left            =   240
         TabIndex        =   4
         Top             =   240
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   3413
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Enabled         =   0   'False
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.Label num 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "88.88"
         BeginProperty Font 
            Name            =   "System"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   5
         Top             =   2280
         Width           =   615
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "An0"
      ForeColor       =   &H00FFFFFF&
      Height          =   2655
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   855
      Begin MSComctlLib.ProgressBar barra 
         Height          =   1935
         Index           =   0
         Left            =   240
         TabIndex        =   1
         Top             =   240
         Width           =   375
         _ExtentX        =   661
         _ExtentY        =   3413
         _Version        =   393216
         BorderStyle     =   1
         Appearance      =   0
         Enabled         =   0   'False
         Min             =   1e-4
         Max             =   256
         Orientation     =   1
         Scrolling       =   1
      End
      Begin VB.Label num 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         BackStyle       =   0  'Transparent
         Caption         =   "88.88"
         BeginProperty Font 
            Name            =   "System"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   2
         Top             =   2280
         Width           =   615
      End
   End
End
Attribute VB_Name = "barras_analogicas"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
