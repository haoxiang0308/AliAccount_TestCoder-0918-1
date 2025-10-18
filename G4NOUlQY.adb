-- Тело пакета для математических операций
package body Math_Pkg is
   -- Реализация функции сложения
   function Add(A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;
   
   -- Реализация функции вычитания
   function Subtract(A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;
   
   -- Реализация функции умножения
   function Multiply(A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;
   
   -- Реализация функции деления
   function Divide(A, B : Integer) return Float is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return Float(A) / Float(B);
   end Divide;
   
   -- Реализация функции возведения в степень
   function Power(Base, Exponent : Integer) return Integer is
      Result : Integer := 1;
      Abs_Exponent : Natural := Natural(Exponent);
   begin
      if Exponent < 0 then
         raise Constraint_Error with "Negative exponents not supported in integer power";
      end if;
      
      for I in 1 .. Abs_Exponent loop
         Result := Result * Base;
      end loop;
      return Result;
   end Power;
end Math_Pkg;