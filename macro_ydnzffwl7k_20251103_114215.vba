Attribute VB_Name = "FormatExcelMacro"
Sub FormatExcelSheet()
    ' Format Excel sheet with various formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(54, 95, 145) ' Dark blue background
        .Font.Color = RGB(255, 255, 255)   ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit column widths
    ws.Columns.AutoFit
    
    ' Add borders to the used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format alternate rows with light gray background
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count Step 2
        ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
    Next i
    
    ' Format numeric columns (assuming columns with numbers should be right-aligned)
    Dim cell As Range
    For Each cell In ws.UsedRange
        If IsNumeric(cell.Value) And cell.Value <> "" Then
            cell.HorizontalAlignment = xlRight
        End If
    Next cell
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub