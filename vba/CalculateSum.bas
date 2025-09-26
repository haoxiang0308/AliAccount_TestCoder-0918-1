Function CalculateSum(rng As Range) As Double
    ' Функция для вычисления суммы ячеек в заданном диапазоне
    CalculateSum = Application.WorksheetFunction.Sum(rng)
End Function