Sub FormatExcelSheet()
    ' VBA Macro to format an Excel sheet
    
    Dim ws As Worksheet
    Dim rng As Range
    Dim randomFileName As String
    Dim filePath As String
    
    ' Set the worksheet to format (active sheet)
    Set ws = ActiveSheet
    
    ' Add sample data if sheet is empty
    If Application.WorksheetFunction.CountA(ws.Cells) = 0 Then
        ' Add headers
        ws.Range("A1").Value = "ID"
        ws.Range("B1").Value = "Name"
        ws.Range("C1").Value = "Date"
        ws.Range("D1").Value = "Amount"
        
        ' Add sample data
        ws.Range("A2").Value = 1
        ws.Range("B2").Value = "John Doe"
        ws.Range("C2").Value = Date
        ws.Range("D2").Value = 1000
        
        ws.Range("A3").Value = 2
        ws.Range("B3").Value = "Jane Smith"
        ws.Range("C3").Value = Date
        ws.Range("D3").Value = 2500
        
        ws.Range("A4").Value = 3
        ws.Range("B4").Value = "Bob Johnson"
        ws.Range("C4").Value = Date
        ws.Range("D4").Value = 1750
    End If
    
    ' Define the range to format (used range)
    Set rng = ws.UsedRange
    
    ' Format headers
    With ws.Range("A1:D1")
        .Font.Bold = True
        .Font.Color = RGB(255, 255, 255)
        .Interior.Color = RGB(68, 114, 196)
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .Borders.LineStyle = xlContinuous
        .Borders.Color = RGB(0, 0, 0)
    End With
    
    ' Format data cells
    With rng
        .Font.Name = "Calibri"
        .Font.Size = 11
        .HorizontalAlignment = xlLeft
        .VerticalAlignment = xlCenter
        .RowHeight = 20
    End With
    
    ' Format numeric columns (ID and Amount)
    ws.Columns("A:A").HorizontalAlignment = xlCenter
    ws.Columns("D:D").NumberFormat = "$#,##0.00"
    ws.Columns("D:D").HorizontalAlignment = xlRight
    
    ' Format date column
    ws.Columns("C:C").NumberFormat = "mm/dd/yyyy"
    ws.Columns("C:C").HorizontalAlignment = xlCenter
    
    ' Add borders to all cells
    With rng.Borders
        .LineStyle = xlContinuous
        .Color = RGB(128, 128, 128)
        .Weight = xlThin
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Freeze top row
    ws.Range("A2").Select
    ActiveWindow.FreezePanes = True
    
    ' Generate random filename
    Randomize Timer
    randomFileName = "FormatMacro_" & Int((999999 - 100000 + 1) * Rnd + 100000) & ".vba"
    
    ' Save this macro code to a random named file
    filePath = Environ$("USERPROFILE") & "\Documents\" & randomFileName
    
    ' Note: VBA cannot directly save its own code to a file without additional setup
    ' This would typically require saving the entire workbook or using FileSystemObject
    ' The following is a placeholder for demonstration
    
    MsgBox "Excel sheet formatted successfully!" & vbCrLf & _
           "Random filename generated: " & randomFileName & vbCrLf & _
           "Note: To save this macro code, export it manually via VBE (Alt+F11) -> File -> Export", _
           vbInformation, "Format Complete"
    
End Sub
