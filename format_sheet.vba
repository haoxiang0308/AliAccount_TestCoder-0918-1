Attribute VB_Name = "format_sheet"
Sub FormatSheet()
    '
    ' FormatSheet Macro
    ' Formats the active Excel sheet.
    '

    '
    ' Set the font name and size for the entire sheet
    Cells.Select
    With Selection.Font
        .Name = "Calibri"
        .Size = 11
    End With

    ' Auto-fit the column width
    Columns("A:Z").Select
    Columns("A:Z").AutoFit

    ' Format the header row (Row 1) if it exists
    Rows("1:1").Select
    With Selection
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light grey background
        .HorizontalAlignment = xlCenter
    End With

    ' Add borders to the used range
    Cells(Rows.Count, 1).End(xlUp).CurrentRegion.Select
    With Selection.Borders
        .LineStyle = xlContinuous
        .ColorIndex = 0
        .TintAndShade = 0
        .Weight = xlThin
    End With

    ' Deselect to clean up
    Range("A1").Select

End Sub