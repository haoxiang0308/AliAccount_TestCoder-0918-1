' VBA Macro to format an Excel sheet
Sub FormatExcelSheet()
    ' Declare variables
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
    
    ' Format alternate rows
    Dim lastRow As Long
    Dim lastCol As Long
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    Dim i As Long
    For i = 2 To lastRow
        If i Mod 2 = 0 Then ' Even rows
            ws.Rows(i).Interior.Color = RGB(242, 242, 242) ' Light gray
        End If
    Next i
    
    ' Add borders to the data range
    ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol)).Borders.LineStyle = xlContinuous
    
    ' Format date columns (if any) - assuming dates might be in columns with "date" in header
    Dim j As Long
    For j = 1 To lastCol
        If InStr(LCase(ws.Cells(1, j).Value), "date") > 0 Then
            ws.Columns(j).NumberFormat = "mm/dd/yyyy"
        End If
    Next j
    
    MsgBox "Excel sheet formatting completed!", vbInformation
End Sub