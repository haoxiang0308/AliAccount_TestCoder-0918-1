Sub FormatExcelSheet()
    '
    ' FormatExcelSheet Macro
    ' This macro formats the active Excel sheet by setting headers, applying bold formatting, and auto-fitting columns.
    '

    ' Set headers in the first row
    Cells(1, 1).Value = "Name"
    Cells(1, 2).Value = "Age"
    Cells(1, 3).Value = "City"
    
    ' Make the header row bold
    Rows(1).Font.Bold = True
    
    ' Auto-fit the columns to the content
    Columns("A:C").AutoFit
    
    ' Optional: Add some sample data
    Cells(2, 1).Value = "John Doe"
    Cells(2, 2).Value = 30
    Cells(2, 3).Value = "New York"
    
    Cells(3, 1).Value = "Jane Smith"
    Cells(3, 2).Value = 25
    Cells(3, 3).Value = "Los Angeles"
    
    MsgBox "Excel sheet formatted successfully!"
End Sub