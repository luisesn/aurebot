VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
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
   ScaleHeight     =   6630
   ScaleWidth      =   9960
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer actualiza 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   3360
      Top             =   5040
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   9360
      Top             =   5400
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
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
      Width           =   495
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
      Height          =   255
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

Dim file_descarga As String
Dim descargando As Boolean
Dim configuracion As String

Public Sub logg(L As String, Optional c As Integer = 2)
    Dim txt As String
    
    'If log.Text <> "" Then If Mid$(log.Text, Len(log.Text), 1) <> vbLf And Mid$(log.Text, Len(log.Text), 1) <> vbCr Then log.Text = log.Text & vbCrLf
    
        'LockWindowUpdate (log.hWnd)
        txt = ">> " + L
        'log.SetFocus
        'log.Text = log.Text + txt + vbCrLf
        'log.SelStart = Len(log.Text) - Len(txt)
        'log.SelLength = Len(txt)
        log.SelColor = QBColor(c)
        log.SelText = txt + vbCrLf
        
        'If (Len(log.Text) > 2000) Then log.Text = Mid$(log.Text, Len(log.Text) - 2000, 2000)
        'log.SelStart = Len(log.Text) - 1
        'LockWindowUpdate (0)
    'Open App.Path & "\log" & Date$ & ".txt" For Append As #2
    'Write #2, Date$, Time$, Int(Timer), L
    'Close #2
End Sub

Public Function BytesLength(abBytes() As Byte) As Long
    ' Trap error if array is empty
    On Error Resume Next
    BytesLength = UBound(abBytes) - LBound(abBytes) + 1
End Function

Private Sub actualizar()
On Error GoTo Err_Sub
Dim b() As Byte
Dim url_version As String
Dim url_actualizador As String
Dim version As String

url_version = INIRead("SVN", "url_version", App.Path + "\configuracion.ini")
version = App.Major & "." & App.Minor & "." & App.Revision
    
If url_version <> "" Then
    DoEvents
    descargando = False
    file_descarga = ""
    version = Inet1.OpenURL(url_version, icString)
    Inet1.Cancel
    DoEvents
    If App.Revision <> version Then
        logg "¡Encontrada nueva version! " & version, 5
        DoEvents
        url_actualizador = INIRead("SVN", "url_actualizador", App.Path + "\configuracion.ini")
        logg "¡A descargarla!", 5
        DoEvents
        descargando = True
        file_descarga = "actualizador.exe"
        With Inet1
            .AccessType = icUseDefault
            'Indicamos el url del archivo
            .URL = url_actualizador
            'Indicamos que vamos a descargar o recuperar un archivo desde una url
            .Execute , "GET"
        End With
    Else
        logg "Tienes la última versión.", 2
    End If
Else
    logg "Ocurrió un error al cargar la configuración.", 4
End If
Exit Sub

Err_Sub:
    logg "[Actualizar]" & Err.Description, 4
    On Error Resume Next
End Sub

Private Sub actualiza_Timer()
actualiza.Enabled = False
actualizar
End Sub

Private Sub cmp_Timer()
On Error GoTo Err_Sub
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
        If b <> "" Then
            LockWindowUpdate (log.hWnd)
            log.Text = log.Text & b
            log.SelStart = Len(log.Text) - Len(b)
            log.SelLength = Len(b)
            log.SelColor = QBColor(1)
            'If (Len(log.Text) > 2000) Then log.Text = Mid$(log.Text, Len(log.Text) - 2000, 2000)
            On Error Resume Next
            log.SelStart = Len(log.Text) - 1
            log.SelLength = 1
            LockWindowUpdate (0)
        End If
    End If
    
Exit Sub

Err_Sub:
    logg Err.Description, 4
    On Error Resume Next
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
log.SetFocus
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
    Dim a As Boolean
    Dim version As String
    configuracion = App.Path + "\configuracion.ini"
    version = App.Major & "." & App.Minor & "." & App.Revision
    logg App.Title & " versión: " & version
    logg "Cargando configuración..."
    If Dir(App.Path + "\actualizador.ini", vbHidden) <> "" Then
        velocidad.Text = INIRead("SERIE", "velocidad", configuracion)
        puerto.Text = INIRead("SERIE", "puerto", configuracion)
    Else
        a = INIWrite("SERIE", "velocidad", "9600", configuracion)
        a = INIWrite("SERIE", "puerto", "1", configuracion)
    End If
    logg "Puerto COM" & puerto.Text & ": a " & velocidad.Text & " baudios."
    abrir_puerto = False
    'actualiza.Enabled = True
    actualizar
End Sub

Private Sub Form_Terminate()
If com.PortOpen = True Then com.PortOpen = False
logg "Terminate.", 4
End Sub

Private Sub Form_Unload(Cancel As Integer)
If IsFormLoaded(panel) Then Unload panel
If IsFormLoaded(pnl_control) Then Unload pnl_control
If IsFormLoaded(barras_analogicas) Then Unload barras_analogicas
If IsFormLoaded(pnl_grafico) Then Unload pnl_grafico
logg "Unload", 4
End Sub

Private Sub Inet1_StateChanged(ByVal State As Integer)
'On Error GoTo Err_Sub
If descargando Then
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
            Open file_descarga For Binary As #1
        
            ' Leemos de a 1 Kbytes. El segundo parámetro indica _
            el tipo de fichero. Tipo texto o tipo Binario, en este caso binario
            vtData = Inet1.GetChunk(1024, icByteArray)
        
            'Si el tamaño del fichero es 0 ponemos bDone en _
            True para que no entre en el bucle
            If Len(vtData) = 0 Then
                bDone = True
            End If
            
            Me.Caption = "0% Descargada": DoEvents
            
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
                 Me.Caption = Int(size * 100 / filesize) & "% Descargada": DoEvents
                If Len(vtData) = 0 Then
                    bDone = True
                End If
            Loop

        Close #1
    
        logg "Actualizador descargado correctamente", 5
        DoEvents
        
        If filesize > 10 Then
            logg "Ejecutando actualizador...", 5
        'Shell App.Path + "\actualizador.exe"
        '    Unload Me
        'Else
        '    logg "No se pudo comprobar la actualización.", 4
        'End If
        '    a = "Borrando ficheros antiguos...": DoEvents
        '    On Error Resume Next
        '    Kill (path_ejecutable)
        '    On Error GoTo Err_Sub
        '    a = "Copiando...": DoEvents
        '    Name path_tmp As path_ejecutable
        '    a = "Ejecutando...": DoEvents
        '    Shell (path_ejecutable)
        '    a = "¡Adios!": DoEvents
        Else
            logg "Ocurrió un error al descargar el actualizador", 4
            DoEvents
        End If
    End Select

    Exit Sub
End If
Exit Sub
Err_Sub:
    MsgBox Err.Description, vbCritical
    On Error Resume Next
    Inet1.Cancel
End Sub

Private Sub log_KeyPress(KeyAscii As Integer)
enviar (Chr$(KeyAscii))
End Sub

Private Sub puerto_Change()
If INIWrite("SERIE", "puerto", puerto.Text, configuracion) Then
    logg "Cambiado parámetro de puerto"
Else
    logg "Ocurrió un error al guardar el parámetro", 4
End If
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
        'Abrir el puerto.
        com.PortOpen = True
        logg "Puerto abierto."
    Else
        If datos.FillColor <> QBColor(2) Then datos.FillColor = QBColor(14)
    End If
GoTo 31416
31415
    datos.FillColor = QBColor(4)
    logg "No se pudo abrir.", 4
31416
    On Error GoTo 0
End If

End Sub

Private Sub velocidad_Change()
If INIWrite("SERIE", "velocidad", puerto.Text, configuracion) Then
    logg "Cambiado parámetro de velocidad"
Else
    logg "Ocurrió un error al guardar el parámetro", 4
End If
End Sub
