' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Format headers
    With Range("A1:Z1")
        .Font.Bold = True
        .Interior.Color = RGB(51, 102, 255) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    Columns("A:Z").AutoFit
    
    ' Format the first column as an example
    Columns("A:A").ColumnWidth = 15
    
    ' Add borders to the used range
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format numbers in a specific range if they exist
    On Error Resume Next
    With Range("B2:Z100")
        .NumberFormat = "0.00"
    End With
    On Error GoTo 0
    
    MsgBox "Excel sheet formatted successfully!"
End Sub

' Optional: Auto-run formatting when the sheet is activated
Private Sub Worksheet_Activate()
    ' Uncomment the next line if you want automatic formatting when sheet is selected
    ' Call FormatExcelSheet
End Sub