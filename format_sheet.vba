Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet with a title, bold headers, and auto-fits columns.
    '

    ' Set the title in cell A1 and merge it across the header row
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "Formatted Report"
    With Range("A1:H1").MergeArea
        .Merge
        .HorizontalAlignment = xlCenter
        .Font.Name = "Calibri"
        .Font.Size = 18
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200)
    End With

    ' Format the header row (Row 2)
    Range("A2").Select
    ' Assuming headers are already in A2:H2, make them bold and add a background color
    With Range("A2:H2")
        .Font.Bold = True
        .Interior.Color = RGB(220, 220, 220)
        .Borders.LineStyle = xlContinuous
    End With

    ' Auto-fit all columns from A to H
    Columns("A:H").AutoFit

    ' Add some sample data if the sheet is empty below the header
    If IsEmpty(Range("A3")) Then
        Range("A3").Value = "Sample Data Row 1"
        Range("A4").Value = "Sample Data Row 2"
    End If

    MsgBox "Excel sheet formatted successfully!"
End Sub