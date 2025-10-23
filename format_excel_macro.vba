' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(51, 102, 255) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim i As Integer
    For i = 2 To ws.UsedRange.Rows.Count Step 2
        ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
    Next i
    
    ' Add borders to used range
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
    End With
    
    ' Format numbers in columns that contain numbers
    Dim cell As Range
    For Each cell In ws.UsedRange
        If IsNumeric(cell.Value) And cell.Value <> "" Then
            If InStr(cell.Value, ".") > 0 Then
                cell.NumberFormat = "#,##0.00" ' Format decimals
            Else
                cell.NumberFormat = "#,##0" ' Format integers
            End If
        End If
    Next cell
    
    MsgBox "Excel sheet has been formatted successfully!"
End Sub