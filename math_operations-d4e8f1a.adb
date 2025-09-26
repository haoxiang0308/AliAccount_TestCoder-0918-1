-- math_operations-d4e8f1a.adb
-- Тело пакета Ada для базовых математических операций

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

   procedure Divide(Dividend : Integer; Divisor : Integer; Quotient : out Integer; Remainder : out Integer) is
   begin
      if Divisor = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      Quotient := Dividend / Divisor;
      Remainder := Dividend rem Divisor;
   end Divide;

end Math_Operations;