VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Actualizador"
   ClientHeight    =   615
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   615
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   4440
      Top             =   240
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   600
      Top             =   1560
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.Label a 
      BackStyle       =   0  'Transparent
      Caption         =   "Estado..."
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias _
    "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, _
    ByVal lpFile As String, ByVal lpParameters As String, _
    ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
    
Private Sub Timer1_Timer()
On Error Resume Next
ip = "192.168.1.36"
a = "Cerrando el proceso de acceso...": DoEvents
Timer1.Enabled = False
   Dim i As Integer
    Dim lista() As String
    Dim lista2 As String
    Set obj_Wmi = GetObject("winmgmts:")
    If IsNull(obj_Wmi) = False Then
        'instanciamos la variable para usar Wmi
        Set ListaProcesos = obj_Wmi.InstancesOf("win32_process")
        'ReDim lista(ListaProcesos.Count)
        For Each ProcesoACerrar In ListaProcesos
           If LCase(ProcesoACerrar.Name) = "acceso_local.exe" Then
            ProcesoACerrar.Terminate (0)
            a = "Cerrado el proceso...": DoEvents
           End If
        Next
    End If
    a = "Descargando actualizacion...": DoEvents
    Dim b() As Byte
    b = Inet1.OpenURL("http://" & ip & "/actualizacion/acceso_local.exe", icByteArray)
    a = "...descargada...": DoEvents
    a = "...borrando...": DoEvents
    a = "...instalando...": DoEvents
    Open "C:\Archivos de programa\Sistema de acceso\acceso_local_tmp.exe" For Binary Access Read As #2
        Put #2, , b()
    Close #2
    Open "C:\Archivos de programa\Sistema de acceso\acceso_local_tmp.exe" For Binary Access Read As #2
        tmn = 0
        Do While Not EOF(2)
            Get #2, , tmp
            tmn = tmn + 1
        Loop
        
    Close #2
    If tmn > 10 Then
    Kill ("C:\Archivos de programa\Sistema de acceso\acceso_local.exe")
    Kill ("C:\Archivos de programa\Sistema de acceso\acceso_local_tmp.exe")
    Open "C:\Archivos de programa\Sistema de acceso\acceso_local.exe" For Binary Access Read As #2
        Put #2, , b()
    Close #2
    
    a = "Ok. Ejecutando. Bye!": DoEvents
    Else
    MsgBox "Fallo al actualizar"
    DoEvents
    End If
    Shell ("C:\Archivos de programa\Sistema de acceso\acceso_local.exe")
    Unload Me
    

End Sub
