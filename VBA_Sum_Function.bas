' Функция для вычисления суммы ячеек в заданном диапазоне
Function SumCells(rng As Range) As Double
    ' Объявление переменной для хранения суммы
    Dim total As Double
    ' Инициализация переменной
    total = 0
    
    ' Цикл по каждой ячейке в диапазоне
    Dim cell As Range
    For Each cell In rng
        ' Проверка, является ли значение в ячейке числом
        If IsNumeric(cell.Value) Then
            ' Добавление значения ячейки к сумме
            total = total + cell.Value
        End If
    Next cell
    
    ' Возврат вычисленной суммы
    SumCells = total
End Function