Attribute VB_Name = "FormatExcelSheet"
Sub FormatExcelSheet()
    ' Format an Excel sheet with various formatting options
    
    Dim ws As Worksheet
    Set ws = ActiveSheet
    
    ' Format headers (row 1)
    With ws.Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(79, 129, 189)
        .Font.Color = RGB(255, 255, 255)
        .HorizontalAlignment = xlCenter
    End With
    
    ' Auto-fit all columns
    ws.Columns.AutoFit
    
    ' Format the entire sheet with borders
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1
    End With
    
    ' Format alternate rows with light gray background
    Dim i As Long
    For i = 2 To ws.UsedRange.Rows.Count Step 2
        ws.Rows(i).Interior.Color = RGB(240, 240, 240)
    Next i
    
    ' Format date columns (assuming dates might be in columns containing "date" in the header)
    Dim j As Long
    For j = 1 To ws.UsedRange.Columns.Count
        If InStr(LCase(Cells(1, j).Value), "date") > 0 Then
            ws.Columns(j).NumberFormat = "mm/dd/yyyy"
        End If
    Next j
    
    MsgBox "Excel sheet has been formatted successfully!", vbInformation, "Format Complete"
End Sub