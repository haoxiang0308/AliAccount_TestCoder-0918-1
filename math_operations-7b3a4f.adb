-- math_operations.adb: Тело пакета Ada для математических операций

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
      return A / B;
   end Divide;

   procedure Swap(X, Y : in out Integer) is
      Temp : Integer := X;
   begin
      X := Y;
      Y := Temp;
   end Swap;

end Math_Operations;