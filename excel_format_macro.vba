Attribute VB_Name = "ExcelFormatMacro"
Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro applies formatting to the active Excel sheet.
    '

    ' Set the font name and size for the entire sheet
    Cells.Font.Name = "Calibri"
    Cells.Font.Size = 11

    ' Auto-fit all columns
    Columns.AutoFit

    ' Format the header row (Row 1) if it exists
    If Cells(1, 1).Value <> "" Then
        With Rows(1)
            .Font.Bold = True
            .Interior.Color = RGB(217, 225, 242) ' Light blue background
            .HorizontalAlignment = xlCenter
        End With
    End If

    ' Add borders to the used range
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With

    ' Format any date columns found (this is a simple example assuming common date formats)
    Dim cell As Range
    For Each cell In UsedRange.Columns ' Loop through each column in the used range
        If IsDate(cell.Cells(2).Value) Then ' Check if the second cell in the column is a date
            Columns(cell.Column).NumberFormat = "mm/dd/yyyy" ' Apply date format
        End If
    Next cell

    MsgBox "Formatting complete!", vbInformation
End Sub