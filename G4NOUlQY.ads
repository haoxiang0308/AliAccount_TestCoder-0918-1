-- Спецификация пакета для математических операций
package Math_Pkg is
   -- Функция для сложения двух чисел
   function Add(A, B : Integer) return Integer;
   
   -- Функция для вычитания двух чисел
   function Subtract(A, B : Integer) return Integer;
   
   -- Функция для умножения двух чисел
   function Multiply(A, B : Integer) return Integer;
   
   -- Функция для деления двух чисел (с проверкой деления на ноль)
   function Divide(A, B : Integer) return Float;
   
   -- Функция для возведения в степень (целочисленная)
   function Power(Base, Exponent : Integer) return Integer;
end Math_Pkg;