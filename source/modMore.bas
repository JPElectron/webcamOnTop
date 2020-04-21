Attribute VB_Name = "modMore"
Public URL As String

Sub Main()

Select Case Command()

    Case ""
        Load webcam
        webcam.Show
        Exit Sub
    
    Case Else
        URL = Command
        Load webcam
        webcam.Show
        Exit Sub

End Select

End Sub
