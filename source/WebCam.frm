VERSION 5.00
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "msinet.ocx"
Begin VB.Form webcam 
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   3255
   ClientLeft      =   4560
   ClientTop       =   3540
   ClientWidth     =   4275
   Icon            =   "WebCam.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3538.043
   ScaleMode       =   0  'User
   ScaleWidth      =   4275
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1920
      Top             =   1440
   End
   Begin VB.Timer timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   1440
      Top             =   1440
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   840
      Top             =   1440
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      Protocol        =   4
      URL             =   "http://"
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      CausesValidation=   0   'False
      Height          =   8175
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11565
      ExtentX         =   20399
      ExtentY         =   14420
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   0
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
End
Attribute VB_Name = "webcam"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim temp As String
Dim lastsized As Boolean
Dim CloseInterval As Integer
Dim FixupW As Integer
Dim FixupH As Integer
Dim TickTock As Integer
Dim PageTickTock As Integer
Dim PageClock As Integer

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
If Shift = 0 And KeyCode = vbKeyEscape Then
    Unload Me
End If
End Sub

Private Sub Form_Load()

lastsized = False
modSettings.Load_SizeAndPosition Me
CloseInterval = 0
TickTock = 0

If URL Like "webcamontop://*" = True Then
    URL = Right(URL, Len(URL) - 14)
    Open App.Path & "\webcam.ini" For Input As #1
    Do While Not EOF(1)
        Input #1, temp
        If temp <> "" And temp Like "AutoClose*" = True Then
            ticktemp = InStr(temp, "=")
            CloseInterval = Right(temp, Len(temp) - ticktemp)
        ElseIf temp <> "" And temp Like "FixupW*" = True Then
            sizewtemp = InStr(temp, "=")
            FixupW = Right(temp, Len(temp) - sizewtemp)
        ElseIf temp <> "" And temp Like "FixupH*" = True Then
            sizehtemp = InStr(temp, "=")
            FixupH = Right(temp, Len(temp) - sizehtemp)
        End If
    Loop
    Close #1
ElseIf URL = "" Then
    Open App.Path & "\webcam.ini" For Input As #1
    Do While Not EOF(1)
        Input #1, temp
        If temp <> "" And temp Like "AutoClose*" = True Then
            ticktemp = InStr(temp, "=")
            CloseInterval = Right(temp, Len(temp) - ticktemp)
        ElseIf temp <> "" And temp Like "FixupW*" = True Then
            sizewtemp = InStr(temp, "=")
            FixupW = Right(temp, Len(temp) - sizewtemp)
        ElseIf temp <> "" And temp Like "FixupH*" = True Then
            sizehtemp = InStr(temp, "=")
            FixupH = Right(temp, Len(temp) - sizehtemp)
        Else
            If Left(temp, 1) <> "#" And Left(temp, 1) <> "%" Then
                If URL = "" Then URL = temp
            End If
        End If
    Loop
    Close #1
End If
If CloseInterval <> 0 Then
    timer1.Enabled = True
End If
If Left(URL, 7) <> "http://" And Left(URL, 3) Like "?:\" = False Then URL = "http://" & URL
WebBrowser1.Navigate URL
Dim lR As Long
lR = SetTopMostWindow(webcam.hwnd, True)

End Sub

Private Sub Form_Resize()
WebBrowser1.Height = webcam.Height * 1.1
WebBrowser1.Width = webcam.Width * 1.06
End Sub

Private Sub Form_Unload(Cancel As Integer)
modSettings.Save_SizeAndPosition Me
End Sub

Private Sub timer1_Timer()
TickTock = TickTock + 1
If TickTock > CloseInterval Then
    Unload Me
End If
End Sub

Private Sub Timer2_Timer()
PageTickTock = PageTickTock + 1
If PageTickTock > PageClock Then
    Unload Me
End If
End Sub

Private Sub WebBrowser1_NavigateComplete2(ByVal pDisp As Object, URL As Variant)
On Error GoTo err
modSettings.Save_SizeAndPosition Me
If lastsized = True Then
    modSettings.Load_SizeAndPosition Me
End If
lastsized = False
    Timer2.Enabled = False
    If WebBrowser1.LocationURL Like "file://*" = False Then
        temp = Inet1.OpenURL(WebBrowser1.LocationURL)
    Else
        W = Right(WebBrowser1.LocationURL, Len(WebBrowser1.LocationURL) - 8)
        'fixup the path
        neww = ""
        For i = 1 To Len(W)
            currentchar = Mid(W, i, 1)
            'not sure what this next line was doing
            'If currentchar = "/" Then currentchar = "\"
            If currentchar = "%" Then
                'get the next two
                i = i + 2
                currentchar = currentchar & Mid(W, i - 1, 1) & Mid(W, i, 1)
                If currentchar = "%20" Then currentchar = " "
                If currentchar = "%21" Then currentchar = "!"
                If currentchar = "%23" Then currentchar = "#"
                If currentchar = "%24" Then currentchar = "$"
                If currentchar = "%25" Then currentchar = "%"
                If currentchar = "%26" Then currentchar = "&"
                If currentchar = "%2B" Then currentchar = "+"
                If currentchar = "%2F" Then currentchar = "/"
                If currentchar = "%3A" Then currentchar = ":"
                If currentchar = "%3B" Then currentchar = ";"
                If currentchar = "%3D" Then currentchar = "="
                If currentchar = "%3F" Then currentchar = "?"
                If currentchar = "%40" Then currentchar = "@"
                If currentchar = "%5C" Then currentchar = "\"
            End If
            neww = neww & currentchar
        Next i
        
        temp = ""
        Open neww For Input As #1
            Do While Not EOF(1)
                Input #1, b
                temp = temp & b
            Loop
        Close #1
    End If
    webtag = InStr(temp, "<webcamontop")
    If webtag <> 0 Then
        tagend = InStr(webtag, temp, ">")
        wholetag = Mid(temp, webtag + 13, tagend - webtag - 13)
        taghalf = Split(wholetag, " ")
        
        For k = 0 To UBound(taghalf)
            If taghalf(k) Like "width*" = True Then
                wwidth = Split(taghalf(k), "=")
                If wwidth(1) Like """*""" = True Then wwidth(1) = Mid(wwidth(1), 2, Len(wwidth(1)) - 2)
                If FixupW = 0 Then
                    webcam.Width = Screen.TwipsPerPixelX * (wwidth(1) + 10)
                Else
                    webcam.Width = Screen.TwipsPerPixelX * (wwidth(1) + FixupW + 10)
                End If
                lastsized = True
            End If
            If taghalf(k) Like "height*" = True Then
                hheight = Split(taghalf(k), "=")
                If hheight(1) Like """*""" = True Then hheight(1) = Mid(hheight(1), 2, Len(hheight(1)) - 2)
                    If FixupH = 0 Then
                        webcam.Height = Screen.TwipsPerPixelY * (hheight(1) + 29)
                    Else
                        webcam.Height = Screen.TwipsPerPixelY * (hheight(1) + FixupH + 29)
                    End If
                lastsized = True
            End If
            If taghalf(k) Like "close*" = True Then
                cclose = Split(taghalf(k), "=")
                If cclose(1) Like """*""" = True Then cclose(1) = Mid(cclose(1), 2, Len(cclose(1)) - 2)
                Timer2.Enabled = True
                PageTickTock = 0
                PageClock = cclose(1)
            End If
        Next k
        
    End If
    
err:
End Sub
