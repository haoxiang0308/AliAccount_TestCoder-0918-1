package Math_Operations is
   -- Функция для сложения двух чисел
   function Add (A, B : Integer) return Integer;

   -- Функция для вычитания двух чисел
   function Subtract (A, B : Integer) return Integer;

   -- Функция для умножения двух чисел
   function Multiply (A, B : Integer) return Integer;

   -- Функция для деления двух чисел (целочисленное деление)
   function Divide (A, B : Integer) return Integer;
   
   -- Процедура для вывода приветствия
   procedure Print_Greeting;
end Math_Operations;