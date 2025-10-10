-- math_operations.ads
-- Пакет для базовых математических операций

package Math_Operations is

   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (возвращает результат и остаток)
   procedure Divide(Dividend, Divisor : Integer; Quotient, Remainder : out Integer);

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

   procedure Divide(Dividend, Divisor : Integer; Quotient, Remainder : out Integer) is
   begin
      if Divisor = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      Quotient := Dividend / Divisor;
      Remainder := Dividend rem Divisor;
   end Divide;

end Math_Operations;