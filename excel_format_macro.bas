Attribute VB_Name = "ExcelFormatMacro"
Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro applies formatting to the active Excel sheet.
    '

    ' Set the font name and size for the entire sheet
    Cells.Font.Name = "Calibri"
    Cells.Font.Size = 11

    ' Auto-fit column widths
    Columns.AutoFit

    ' Format the header row (Row 1) if it exists
    With Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(217, 225, 242) ' Light blue background
        .HorizontalAlignment = xlCenter
    End With

    ' Add borders to the used range
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 1 ' Black
    End With

    ' Format numbers in a specific range (e.g., D:D) as currency if the header is "Price" or "Cost"
    ' This is an example of conditional formatting based on header name
    Dim col As Range
    For Each col In ActiveSheet.UsedRange.Rows(1).Columns
        If UCase(Trim(col.Value)) = "PRICE" Or UCase(Trim(col.Value)) = "COST" Then
            Columns(col.Column).NumberFormat = "$#,##0.00"
        End If
    Next col

End Sub