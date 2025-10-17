' VBA function to calculate the sum of cells
Function SumCells(rng As Range) As Double
    Dim cell As Range
    Dim total As Double
    
    total = 0
    
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            total = total + cell.Value
        End If
    Next cell
    
    SumCells = total
End Function

' Alternative VBA function using built-in Sum method
Function CalculateSum(rng As Range) As Double
    CalculateSum = Application.WorksheetFunction.Sum(rng)
End Function