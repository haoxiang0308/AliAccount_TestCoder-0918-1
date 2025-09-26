-- math_operations.ads
-- Пакет Ada для базовых математических операций

package Math_Operations is
   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (деление нацело)
   function Divide(A, B : Integer) return Integer;

   -- Процедура для вычисления факториала
   procedure Calculate_Factorial(N : Integer; Result : out Integer);

end Math_Operations;

-- math_operations.adb
-- Тело пакета

package body Math_Operations is

   function Add(A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;

   function Subtract(A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;

   function Multiply(A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;

   function Divide(A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;

   procedure Calculate_Factorial(N : Integer; Result : out Integer) is
      Temp : Integer := 1;
   begin
      if N < 0 then
         raise Constraint_Error with "Factorial of negative number is undefined";
      end if;
      for I in 1 .. N loop
         Temp := Temp * I;
      end loop;
      Result := Temp;
   end Calculate_Factorial;

end Math_Operations;