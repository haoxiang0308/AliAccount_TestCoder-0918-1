package Math_Operations is
   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (целочисленное деление)
   function Divide(A, B : Integer) return Integer;
   
   -- Функция для вычисления факториала
   function Factorial(N : Integer) return Integer;

end Math_Operations;

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

   function Factorial(N : Integer) return Integer is
      Result : Integer := 1;
   begin
      if N < 0 then
         raise Constraint_Error with "Factorial of negative number is not defined";
      end if;

      for I in 1 .. N loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

end Math_Operations;