package body Math_Pkg_HPkmUZMnb6 is

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
   
   function Divide(A, B : Integer) return Float is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return Float(A) / Float(B);
   end Divide;
   
   function Power(Base : Integer; Exponent : Natural) return Integer is
      Result : Integer := 1;
      Exp    : Natural := Exponent;
   begin
      while Exp > 0 loop
         Result := Result * Base;
         Exp := Exp - 1;
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

end Math_Pkg_HPkmUZMnb6;