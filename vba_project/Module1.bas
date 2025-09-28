Attribute VB_Name = "Module1"
' Функция для вычисления суммы ячеек
Function SumCells(rng As Range) As Double
    Dim cell As Range
    SumCells = 0
    For Each cell In rng
        If IsNumeric(cell.Value) Then
            SumCells = SumCells + cell.Value
        End If
    Next cell
End Function