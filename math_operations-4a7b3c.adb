package body Math_Operations is
   
   function Add(A, B : in Float) return Float is
   begin
      return A + B;
   end Add;
   
   function Subtract(A, B : in Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   function Multiply(A, B : in Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   function Divide(A, B : in Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   function Power(Base, Exponent : in Float) return Float is
      Result : Float := 1.0;
      Abs_Exponent : Integer := Integer(abs Exponent);
   begin
      if Exponent = 0.0 then
         return 1.0;
      elsif Exponent > 0.0 then
         for I in 1 .. Abs_Exponent loop
            Result := Result * Base;
         end loop;
      else -- Exponent < 0
         for I in 1 .. Abs_Exponent loop
            Result := Result * Base;
         end loop;
         Result := 1.0 / Result;
      end if;
      return Result;
   end Power;
   
   function Square_Root(Value : in Float) return Float is
      X : Float := Value;
      Tolerance : constant Float := 0.00001;
      Temp : Float;
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      elsif Value = 0.0 then
         return 0.0;
      else
         loop
            Temp := X;
            X := 0.5 * (X + Value / X);  -- Newton's method
            exit when abs(X - Temp) < Tolerance;
         end loop;
         return X;
      end if;
   end Square_Root;
   
   function Absolute_Value(Value : in Float) return Float is
   begin
      if Value < 0.0 then
         return -Value;
      else
         return Value;
      end if;
   end Absolute_Value;

end Math_Operations;