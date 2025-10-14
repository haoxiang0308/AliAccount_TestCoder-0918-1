Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet by setting headers, applying borders, and auto-fitting columns.
    '

    ' Set the header row (row 1) to bold
    Rows("1:1").Font.Bold = True

    ' Apply borders to the used range on the active sheet
    With ActiveSheet.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With

    ' Auto-fit all columns in the used range
    ActiveSheet.UsedRange.Columns.AutoFit

    MsgBox "Excel sheet formatting complete!"
End Sub