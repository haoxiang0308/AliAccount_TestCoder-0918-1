' VBA Function to calculate the sum of cells
Function SumCells(rng As Range) As Double
    ' This function takes a range of cells and returns their sum
    SumCells = Application.WorksheetFunction.Sum(rng)
End Function

' Alternative version that sums cells specified by address
Function SumCellRange(cellRange As String) As Double
    ' This function takes a cell range as a string (e.g., "A1:A10") and returns their sum
    Dim rng As Range
    Set rng = Range(cellRange)
    SumCellRange = Application.WorksheetFunction.Sum(rng)
End Function

' Example usage:
' =SumCells(A1:A10) in a cell would sum the values in that range
' =SumCellRange("B1:B5") in a cell would sum the values in that range