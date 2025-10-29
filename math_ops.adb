package body Math_Ops is
   
   function Add (A, B : Float) return Float is
   begin
      return A + B;
   end Add;
   
   function Subtract (A, B : Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   function Multiply (A, B : Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   function Divide (A, B : Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   function Power (Base : Float; Exponent : Integer) return Float is
      Result : Float := 1.0;
      Abs_Exponent : Natural := abs Exponent;
   begin
      for I in 1 .. Abs_Exponent loop
         Result := Result * Base;
      end loop;
      
      if Exponent < 0 then
         Result := 1.0 / Result;
      end if;
      
      return Result;
   end Power;
   
   function Square_Root (A : Float) return Float is
      X : Float := A;
      Tolerance : constant Float := 0.00001;
      New_X : Float;
   begin
      if A < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      end if;
      
      if A = 0.0 then
         return 0.0;
      end if;
      
      loop
         New_X := 0.5 * (X + A / X);
         exit when abs (New_X - X) < Tolerance;
         X := New_X;
      end loop;
      
      return New_X;
   end Square_Root;
   
   function Max (A, B : Float) return Float is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Max;
   
   function Min (A, B : Float) return Float is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Min;

end Math_Ops;