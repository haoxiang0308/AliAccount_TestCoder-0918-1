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

' Alternative VBA Function using Excel's built-in SUM function
Function SimpleSum(rng As Range) As Double
    ' This function uses Excel's built-in SUM function to calculate the sum
    SimpleSum = Application.WorksheetFunction.Sum(rng)
End Function