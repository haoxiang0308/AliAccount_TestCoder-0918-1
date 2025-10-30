' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(51, 102, 204) ' Blue background
        .Font.Color = RGB(255, 255, 255) ' White text
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit columns
    ws.Columns.AutoFit
    
    ' Format alternating row colors
    Dim i As Integer
    Dim lastRow As Integer
    Dim lastCol As Integer
    
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    For i = 2 To lastRow
        If i Mod 2 = 0 Then
            ws.Rows(i).Interior.Color = RGB(240, 240, 240) ' Light gray
        End If
    Next i
    
    ' Add borders to the data range
    ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol)).Borders.LineStyle = xlContinuous
    
    ' Format date columns (if any) - assuming dates might be in columns with "date" in header
    Dim j As Integer
    For j = 1 To lastCol
        If InStr(LCase(ws.Cells(1, j).Value), "date") > 0 Then
            ws.Columns(j).NumberFormat = "mm/dd/yyyy"
        End If
    Next j
    
    MsgBox "Excel sheet formatting completed successfully!", vbInformation
End Sub