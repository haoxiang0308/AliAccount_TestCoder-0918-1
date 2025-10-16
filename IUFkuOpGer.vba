' VBA Macro to Format an Excel Sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (assuming headers are in row 1)
    With ws.Range("1:1")
        .Font.Bold = True
        .Interior.Color = RGB(54, 96, 146) ' Dark blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Add borders to used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With
    
    ' Format date columns if any (assuming column with dates is identified)
    Dim cell As Range
    For Each cell In ws.UsedRange
        If IsDate(cell.Value) Then
            cell.NumberFormat = "mm/dd/yyyy"
        End If
    Next cell
    
    ' Format numbers with commas and 2 decimal places where appropriate
    Dim numCell As Range
    For Each numCell In ws.UsedRange
        If IsNumeric(numCell.Value) And numCell.Value <> "" Then
            If numCell.Value > 999 Then
                numCell.NumberFormat = "#,##0.00"
            End If
        End If
    Next numCell
    
    ' Set column widths for better readability
    ws.Columns("A:A").ColumnWidth = 15
    ws.Columns("B:B").ColumnWidth = 20
    ws.Columns("C:C").ColumnWidth = 15
    ws.Columns("D:D").ColumnWidth = 12
    
    ' Add filter to headers
    ws.Range("A1").AutoFilter
    
    MsgBox "Excel sheet has been formatted successfully!", vbInformation, "Format Complete"
End Sub