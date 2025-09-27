-- math_operations.ads: Спецификация пакета Ada для математических операций

package Math_Operations is

   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (целочисленное деление)
   function Divide(A, B : Integer) return Integer
     with Pre => B /= 0; -- Предусловие: делитель не равен нулю

   -- Процедура для обмена значений двух переменных
   procedure Swap(X, Y : in out Integer);

end Math_Operations;