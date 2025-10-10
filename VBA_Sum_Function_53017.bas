' Функция для вычисления суммы значений в заданном диапазоне ячеек
Function SumRange(rng As Range) As Double
    ' Объявление переменной для хранения суммы
    Dim total As Double
    ' Инициализация суммы нулем
    total = 0
    
    ' Цикл по каждой ячейке в диапазоне
    Dim cell As Range
    For Each cell In rng
        ' Проверка, является ли значение в ячейке числовым
        If IsNumeric(cell.Value) Then
            ' Добавление значения ячейки к общей сумме
            total = total + cell.Value
        End If
    Next cell
    
    ' Возврат вычисленной суммы
    SumRange = total
End Function