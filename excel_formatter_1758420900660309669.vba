Sub FormatExcelSheet()
    ' Get the active worksheet
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format the header row
    With ws.Range("A1:E1")
        .Font.Bold = True
        .Font.Size = 12
        .Interior.Color = RGB(200, 200, 200)
        .Borders.LineStyle = xlContinuous
    End With
    
    ' Format the data range
    With ws.Range("A2:E100")
        .Borders.LineStyle = xlContinuous
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    ws.Columns("A:E").AutoFit
    
    ' Add a title
    ws.Range("A1").EntireRow.Insert
    ws.Range("A1").Value = "Formatted Data Report"
    ws.Range("A1").Font.Bold = True
    ws.Range("A1").Font.Size = 16
    
    ' Freeze the header row
    ws.Range("A2").Select
    ActiveWindow.FreezePanes = True
    
    ' Select the cell A1
    ws.Range("A1").Select
End Sub