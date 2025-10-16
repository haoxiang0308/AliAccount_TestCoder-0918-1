-- Ada package for mathematical operations
package Math_Pkg is
   -- Function to add two numbers
   function Add(A, B : Float) return Float;
   
   -- Function to subtract two numbers
   function Subtract(A, B : Float) return Float;
   
   -- Function to multiply two numbers
   function Multiply(A, B : Float) return Float;
   
   -- Function to divide two numbers
   function Divide(A, B : Float) return Float;
   
   -- Function to calculate power
   function Power(Base, Exponent : Float) return Float;
   
   -- Function to calculate square root
   function Square_Root(Value : Float) return Float;
   
   -- Function to calculate absolute value
   function Absolute_Value(Value : Float) return Float;
end Math_Pkg;

-- Package body
package body Math_Pkg is
   function Add(A, B : Float) return Float is
   begin
      return A + B;
   end Add;
   
   function Subtract(A, B : Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   function Multiply(A, B : Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   function Divide(A, B : Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   function Power(Base, Exponent : Float) return Float is
      Result : Float := 1.0;
      Exp : Integer := Integer(Exponent);
   begin
      -- Simple implementation for integer exponents
      for I in 1 .. Exp loop
         Result := Result * Base;
      end loop;
      return Result;
   end Power;
   
   function Square_Root(Value : Float) return Float is
      X : Float := Value;
      Tolerance : constant Float := 0.0001;
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      end if;
      
      -- Newton's method for finding square root
      loop
         exit when abs(X * X - Value) < Tolerance;
         X := (X + Value / X) / 2.0;
      end loop;
      return X;
   end Square_Root;
   
   function Absolute_Value(Value : Float) return Float is
   begin
      if Value < 0.0 then
         return -Value;
      else
         return Value;
      end if;
   end Absolute_Value;
end Math_Pkg;