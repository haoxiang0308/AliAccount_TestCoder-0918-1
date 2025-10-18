package body Liyiwtqp is

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

   function Modulo(A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Modulo by zero";
      end if;
      return A mod B;
   end Modulo;

   function Power(Base, Exponent : Integer) return Integer is
      Result : Integer := 1;
      Exp : Integer := Exponent;
   begin
      if Exp < 0 then
         raise Constraint_Error with "Negative exponent not supported";
      end if;
      
      for I in 1..Exp loop
         Result := Result * Base;
      end loop;
      
      return Result;
   end Power;

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

   function Is_Prime(N : Integer) return Boolean is
   begin
      if N <= 1 then
         return False;
      end if;
      
      if N = 2 then
         return True;
      end if;
      
      if N mod 2 = 0 then
         return False;
      end if;
      
      for I in 3..N-1 loop
         exit when I*I > N;
         if N mod I = 0 then
            return False;
         end if;
      end loop;
      
      return True;
   end Is_Prime;

   function GCD(A, B : Integer) return Integer is
      Temp : Integer;
      X : Integer := A;
      Y : Integer := B;
   begin
      while Y /= 0 loop
         Temp := Y;
         Y := X mod Y;
         X := Temp;
      end loop;
      
      if X < 0 then
         return -X;
      else
         return X;
      end if;
   end GCD;

end Liyiwtqp;