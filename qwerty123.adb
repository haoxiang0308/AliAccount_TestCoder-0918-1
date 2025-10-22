package body Math_Ops is
   
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
   
   function Power(Base, Exponent : Integer) return Integer is
      Result : Integer := 1;
      Abs_Exponent : Integer := Exponent;
   begin
      if Exponent < 0 then
         raise Constraint_Error with "Negative exponents not supported";
      end if;
      
      for I in 1..Exponent loop
         Result := Result * Base;
      end loop;
      
      return Result;
   end Power;
   
   function Absolute_Value(Value : Integer) return Integer is
   begin
      if Value < 0 then
         return -Value;
      else
         return Value;
      end if;
   end Absolute_Value;
   
   function Max(A, B : Integer) return Integer is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Max;
   
   function Min(A, B : Integer) return Integer is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Min;
   
   function Factorial(N : Integer) return Integer is
      Result : Integer := 1;
   begin
      if N < 0 then
         raise Constraint_Error with "Factorial of negative number not defined";
      end if;
      
      for I in 1..N loop
         Result := Result * I;
      end loop;
      
      return Result;
   end Factorial;
   
end Math_Ops;