Sub FormatSheet()
    ' Declare variables
    Dim ws As Worksheet
    Dim lastRow As Long
    Dim lastCol As Long
    Dim rng As Range
    
    ' Set the worksheet to the active sheet
    Set ws = ActiveSheet
    
    ' Find the last row and column with data
    lastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
    lastCol = ws.Cells(1, ws.Columns.Count).End(xlToLeft).Column
    
    ' Define the range to format (from A1 to the last cell with data)
    Set rng = ws.Range(ws.Cells(1, 1), ws.Cells(lastRow, lastCol))
    
    ' Apply formatting
    With rng
        ' Bold the entire range
        .Font.Bold = True
        ' Center align horizontally and vertically
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        ' Add a thin border around each cell
        .Borders.LineStyle = xlContinuous
        .Borders.Weight = xlThin
        ' Apply a background color (light blue)
        .Interior.Color = RGB(173, 216, 230)
    End With
    
    ' Auto-fit rows and columns
    ws.Columns.AutoFit
    ws.Rows.AutoFit
    
    ' Notify the user
    MsgBox "Sheet formatted successfully!", vbInformation
End Sub