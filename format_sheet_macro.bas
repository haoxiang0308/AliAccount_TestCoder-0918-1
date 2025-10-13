Attribute VB_Name = "format_sheet_macro"
Sub FormatSheet()
    ' Disable screen updating for better performance
    Application.ScreenUpdating = False

    ' Format header row (Row 1)
    With Rows(1)
        .Font.Bold = True
        .Interior.Color = RGB(200, 200, 200) ' Light gray background
        .HorizontalAlignment = xlCenter
    End With

    ' Auto-fit all columns
    Cells.EntireColumn.AutoFit

    ' Format the used range border
    Dim ws As Worksheet
    Set ws = ActiveSheet
    With ws.UsedRange.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = 0 ' Black
    End With

    ' Re-enable screen updating
    Application.ScreenUpdating = True

    MsgBox "Sheet formatting completed!"
End Sub