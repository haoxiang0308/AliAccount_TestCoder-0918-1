' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (Row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189) ' Blue background
        .Font.Color = RGB(255, 255, 255)    ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format alternate rows
    Dim lastRow As Long
    Dim lastCol As Long
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Apply alternating row colors
    Dim i As Long
    For i = 2 To lastRow Step 2
        ws.Range(ws.Cells(i, 1), ws.Cells(i, lastCol)).Interior.Color = RGB(217, 225, 242)
    Next i
    
    ' Add borders to the data range
    ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol)).Borders.LineStyle = xlContinuous
    
    ' Format numbers in columns with currency or number formatting where appropriate
    Dim rng As Range
    For Each rng In ws.UsedRange.Columns
        If IsNumeric(Application.WorksheetFunction.Sum(rng)) And rng.Row = 1 Then
            rng.NumberFormat = "#,##0.00"
        End If
    Next rng
    
    ' Adjust row height
    ws.Rows.RowHeight = 15
    
    MsgBox "Excel sheet has been formatted successfully!", vbInformation
End Sub

' Optional: A subroutine to run the formatting automatically when the sheet is activated
Sub AutoFormatSheet()
    Call FormatExcelSheet
End Sub