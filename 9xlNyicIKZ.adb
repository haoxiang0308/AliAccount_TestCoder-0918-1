package body Math_Operations is

   -- Function to add two numbers
   function Add(A, B : Float) return Float is
   begin
      return A + B;
   end Add;
   
   -- Function to subtract two numbers
   function Subtract(A, B : Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   -- Function to multiply two numbers
   function Multiply(A, B : Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   -- Function to divide two numbers
   function Divide(A, B : Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   -- Function to calculate power
   function Power(Base, Exponent : Float) return Float is
      Result : Float := 1.0;
      I : Integer;
   begin
      if Exponent = 0.0 then
         return 1.0;
      elsif Exponent > 0.0 then
         for I in 1 .. Integer(Exponent) loop
            Result := Result * Base;
         end loop;
      else
         for I in 1 .. abs(Integer(Exponent)) loop
            Result := Result * Base;
         end loop;
         Result := 1.0 / Result;
      end if;
      return Result;
   end Power;
   
   -- Function to calculate square root using Newton's method
   function Square_Root(Value : Float) return Float is
      X : Float := Value;
      Tolerance : constant Float := 0.0001;
      Temp : Float;
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      elsif Value = 0.0 then
         return 0.0;
      else
         loop
            Temp := X;
            X := 0.5 * (X + Value / X);
            exit when abs(X - Temp) < Tolerance;
         end loop;
         return X;
      end if;
   end Square_Root;
   
   -- Function to calculate absolute value
   function Absolute_Value(Value : Float) return Float is
   begin
      if Value < 0.0 then
         return -Value;
      else
         return Value;
      end if;
   end Absolute_Value;

end Math_Operations;