package body Math_Pkg_ZoulDHEcwZpo is

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
      Exp : Natural := Exponent;
      Base_Val : Integer := Base;
   begin
      if Exp = 0 then
         return 1;
      end if;
      
      while Exp > 0 loop
         if Exp mod 2 = 1 then
            Result := Result * Base_Val;
         end if;
         Base_Val := Base_Val * Base_Val;
         Exp := Exp / 2;
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

end Math_Pkg_ZoulDHEcwZpo;