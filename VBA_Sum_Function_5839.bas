' VBA Function to calculate the sum of cells
Function SumCells(rng As Range) As Double
    ' This function takes a range of cells and returns their sum
    Dim cell As Range
    Dim total As Double
    
    total = 0
    
    ' Loop through each cell in the range and add its value to the total
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    ' Return the calculated sum
    SumCells = total
End Function

' Alternative more efficient version using Excel's built-in SUM function
Function SumCellsSimple(rng As Range) As Double
    ' This function uses Excel's built-in SUM function to calculate the sum
    SumCellsSimple = Application.WorksheetFunction.Sum(rng)
End Function

' Subroutine to demonstrate how to use the function
Sub ExampleUsage()
    ' Example: Calculate the sum of cells A1:A10
    Dim result As Double
    result = SumCells(Range("A1:A10"))
    
    ' Output the result to cell B1
    Range("B1").Value = result
    
    ' Also show a message box with the result
    MsgBox "The sum of cells A1:A10 is: " & result
End Sub