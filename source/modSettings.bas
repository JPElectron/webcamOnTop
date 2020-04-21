Attribute VB_Name = "modSettings"
Option Explicit

Sub Load_SizeAndPosition(F As Form)
Dim WasMaximized As Boolean
Dim H As Single
Dim W As Single
Dim T As Single
Dim L As Single
    
    On Error Resume Next
    L = GetSetting(App.Title, F.Name & "_Settings", "FormLeft", F.Left)
    T = GetSetting(App.Title, F.Name & "_Settings", "FormTop", F.Top)
    
    If F.BorderStyle = vbSizable Then
        W = GetSetting(App.Title, F.Name & "_Settings", "FormWidth", F.Width)
        H = GetSetting(App.Title, F.Name & "_Settings", "FormHeight", F.Height)
        F.Move L, T, W, H
    Else
        F.Move L, T
    End If

    WasMaximized = _
    CBool(GetSetting(App.Title, F.Name & "_Settings", "WasMaximized", False) = "True")
    
    If WasMaximized = True Then
        F.WindowState = vbMaximized
    End If
End Sub

Sub Save_SizeAndPosition(F As Form)

    If (F.WindowState <> vbMinimized) And _
        (F.WindowState <> vbMaximized) Then
            SaveSetting App.Title, F.Name & "_Settings", "FormLeft", F.Left
            SaveSetting App.Title, F.Name & "_Settings", "FormTop", F.Top
            SaveSetting App.Title, F.Name & "_Settings", "FormWidth", F.Width
            SaveSetting App.Title, F.Name & "_Settings", "FormHeight", F.Height
    End If

    SaveSetting App.Title, F.Name & "_Settings", _
    "WasMaximized", (F.WindowState = vbMaximized)
End Sub
