-- Ada Math Operations Package
-- Generated random filename: math_ops_47b5.adb

package body Math_Ops is

   function Add (A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;

   function Subtract (A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;

   function Multiply (A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;

   function Divide (A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;

   function Power (Base : Integer; Exponent : Positive) return Integer is
      Result : Integer := 1;
   begin
      for I in 1 .. Exponent loop
         Result := Result * Base;
      end loop;
      return Result;
   end Power;

   function Factorial (N : Positive) return Integer is
      Result : Integer := 1;
   begin
      for I in 1 .. N loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

   function GCD (A, B : Integer) return Integer is
      X : Integer := abs A;
      Y : Integer := abs B;
   begin
      while Y /= 0 loop
         declare
            Temp : Integer := Y;
         begin
            Y := X mod Y;
            X := Temp;
         end;
      end loop;
      return X;
   end GCD;

   function LCM (A, B : Integer) return Integer is
   begin
      if A = 0 or B = 0 then
         return 0;
      end if;
      return abs (A * B) / GCD (A, B);
   end LCM;

end Math_Ops;
