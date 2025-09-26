Attribute VB_Name = "FormatSheetMacro"
Sub FormatSheet()
    '
    ' FormatSheet Macro
    ' This macro formats the active sheet with a title, headers, and basic styling.
    '

    ' Set the title in cell A1
    Range("A1").Value = "Monthly Sales Report"
    Range("A1").Font.Bold = True
    Range("A1").Font.Size = 16
    Range("A1").Interior.Color = RGB(79, 129, 189)
    Range("A1").Font.Color = RGB(255, 255, 255)
    Range("A1").HorizontalAlignment = xlCenter
    Range("A1").MergeArea.Address ' This merges A1 with B1 if needed, or just apply to A1

    ' Define headers in row 3
    Range("A3").Value = "Product"
    Range("B3").Value = "Sales"
    
    ' Format headers
    Range("A3:B3").Font.Bold = True
    Range("A3:B3").Interior.Color = RGB(198, 222, 252)
    Range("A3:B3").HorizontalAlignment = xlCenter
    
    ' Auto-fit columns
    Columns("A:B").AutoFit
    
    ' Add some sample data if cells are empty
    If Range("A4").Value = "" Then
        Range("A4").Value = "Apples"
        Range("B4").Value = 150
    End If
    If Range("A5").Value = "" Then
        Range("A5").Value = "Oranges"
        Range("B5").Value = 120
    End If
    
    ' Format the data range with borders
    Dim data_range As Range
    Set data_range = Range("A3:B" & Range("B" & Rows.Count).End(xlUp).Row)
    With data_range.Borders
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
    End With

End Sub