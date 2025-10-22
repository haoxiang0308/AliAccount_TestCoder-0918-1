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
    
    SumCells = total
End Function

' Alternative VBA Function using the built-in Sum function
Function CalculateSum(rng As Range) As Double
    ' This function uses the built-in Excel worksheet function to calculate sum
    CalculateSum = Application.WorksheetFunction.Sum(rng)
End Function

' Subroutine to demonstrate how to use the function
Sub ExampleUsage()
    ' Example of how to use the SumCells function
    Dim result As Double
    result = SumCells(Range("A1:A10"))
    MsgBox "The sum of cells A1 to A10 is: " & result
End Sub