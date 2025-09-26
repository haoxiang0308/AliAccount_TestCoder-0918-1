-- math_operations-d4e8f1a.ads
-- Пакет Ada для базовых математических операций

package Math_Operations is

   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (возвращает результат и остаток)
   procedure Divide(Dividend : Integer; Divisor : Integer; Quotient : out Integer; Remainder : out Integer);

end Math_Operations;