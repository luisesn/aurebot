VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form AURE_Actualizador 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Actualizador"
   ClientHeight    =   255
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4680
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   255
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   2640
      Top             =   120
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
Attribute VB_Name = "AURE_Actualizador"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim url As String
Dim ejecutable As String
Dim path_tmp As String
Dim path_ejecutable As String


Private Declare Function ShellExecute Lib "shell32.dll" Alias _
    "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, _
    ByVal lpFile As String, ByVal lpParameters As String, _
    ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
    
Private Sub Form_Load()
a.Caption = "Leyendo configuración..."
    
If Dir(App.Path + "\actualizador.ini", vbHidden) <> "" Then
    url = INIRead("Actualizador", "url", App.Path + "\actualizador.ini")
    ejecutable = INIRead("Actualizador", "ejecutable", App.Path + "\actualizador.ini")
    path_tmp = App.Path + "\tmp.tmp"
    path_ejecutable = App.Path + "\" + ejecutable
    Timer1.Enabled = True
    
    'Cerramos la interfaz si está activa
    a = "Cerrando el proceso de acceso...": DoEvents
    Dim i As Integer
    Dim obj_Wmi
    Dim ListaProcesos
    Set obj_Wmi = GetObject("winmgmts:")
    If IsNull(obj_Wmi) = False Then
        'instanciamos la variable para usar Wmi
        Set ListaProcesos = obj_Wmi.InstancesOf("win32_process")
        Dim ProcesoACerrar
        'ReDim lista(ListaProcesos.Count)
        For Each ProcesoACerrar In ListaProcesos
           If LCase(ProcesoACerrar.Name) = LCase(ejecutable) Then
            ProcesoACerrar.Terminate (0)
            a = "Cerrado el proceso...": DoEvents
           End If
        Next
    End If
    
    'Descargamos la actualización
    a = "Descargando actualización..."
    
    With Inet1
        .AccessType = icUseDefault
        'Indicamos el url del archivo
        .url = url
        'Indicamos que vamos a descargar o recuperar un archivo desde una url
        .Execute , "GET"
    End With
    
Else
    a.Caption = "No se encontró archivo de configuración."
    MsgBox "No se encontró archivo de configuración.", vbCritical
    Unload Me
End If

End Sub

Private Sub Inet1_StateChanged(ByVal State As Integer)
On Error GoTo Err_Sub
    Dim tempArray() As Byte ' Un array para grabar los datos en un archivo
    Dim bDone As Boolean
    'Para el tamaño del archivo en bytes que se usa para el array
    Dim filesize As Long
    ' Acá almacenamos los datos
    Dim vtData As Variant
    Dim size As Long
    Select Case State
        Case icResponseCompleted
            bDone = False
            'Para saber el tamaño del fichero en bytes
            filesize = Inet1.GetHeader("Content-length")
            'Creamos y abrimos un nuevo archivo en modo binario
            Open path_tmp For Binary As #1
        
            ' Leemos de a 1 Kbytes. El segundo parámetro indica _
            el tipo de fichero. Tipo texto o tipo Binario, en este caso binario
            vtData = Inet1.GetChunk(1024, icByteArray)

            DoEvents
         
            'Si el tamaño del fichero es 0 ponemos bDone en _
            True para que no entre en el bucle
            If Len(vtData) = 0 Then
                bDone = True
            End If
            
            a = "0%": DoEvents
            
            Do While Not bDone
                'Almacenamos en un array el contenido del archivo que se va leyendo
                tempArray = vtData
                'Escribimos los datos en el archivo
                Put #1, , tempArray
                'Leemos  datos de a 1 kb (1024 bytes)
                vtData = Inet1.GetChunk(1024, icByteArray)
         
                DoEvents
                'Aumentamos la barra de progreso
                 
                size = size + (Len(vtData) * 2)
                a = Int(size * 100 / filesize) & "%": DoEvents
                If Len(vtData) = 0 Then
                    bDone = True
                End If
            Loop

        Close #1
    
        a = "Actualización descargada correctamente": DoEvents
        
    If filesize > 10 Then
        a = "Borrando ficheros antiguos...": DoEvents
        On Error Resume Next
        Kill (path_ejecutable)
        On Error GoTo Err_Sub
        a = "Copiando...": DoEvents
        Name path_tmp As path_ejecutable
        a = "Ejecutando...": DoEvents
        Shell (path_ejecutable)
        a = "¡Adios!": DoEvents
    Else
        MsgBox "Fallo al actualizar", vbCritical
        DoEvents
    End If
    Unload Me
        
    End Select

Exit Sub

Err_Sub:
    MsgBox Err.Description, vbCritical
    On Error Resume Next
    Inet1.Cancel
End Sub

