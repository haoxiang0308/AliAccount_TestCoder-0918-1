-- Ada package body for mathematical operations
package body Math_Ops_Pkg is

   -- Function to add two integers
   function Add(A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;
   
   -- Function to subtract two integers
   function Subtract(A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;
   
   -- Function to multiply two integers
   function Multiply(A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;
   
   -- Function to divide two integers (with division by zero check)
   function Divide(A, B : Integer) return Float is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return Float(A) / Float(B);
   end Divide;
   
   -- Function to calculate power of a number
   function Power(Base : Integer; Exponent : Natural) return Integer is
      Result : Integer := 1;
      Exp : Natural := Exponent;
   begin
      while Exp > 0 loop
         Result := Result * Base;
         Exp := Exp - 1;
      end loop;
      return Result;
   end Power;
   
   -- Function to calculate absolute value
   function Absolute_Value(Num : Integer) return Integer is
   begin
      if Num < 0 then
         return -Num;
      else
         return Num;
      end if;
   end Absolute_Value;
   
   -- Function to find maximum of two numbers
   function Max(A, B : Integer) return Integer is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Max;
   
   -- Function to find minimum of two numbers
   function Min(A, B : Integer) return Integer is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Min;

end Math_Ops_Pkg;