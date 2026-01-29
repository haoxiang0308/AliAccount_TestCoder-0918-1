-- Ada Math Operations Package Specification
-- Generated random filename: math_ops_47b5.ads

package Math_Ops is

   function Add (A, B : Integer) return Integer;
   -- Returns the sum of A and B

   function Subtract (A, B : Integer) return Integer;
   -- Returns the difference of A and B

   function Multiply (A, B : Integer) return Integer;
   -- Returns the product of A and B

   function Divide (A, B : Integer) return Integer;
   -- Returns the quotient of A divided by B
   -- Raises Constraint_Error if B is zero

   function Power (Base : Integer; Exponent : Positive) return Integer;
   -- Returns Base raised to the power of Exponent

   function Factorial (N : Positive) return Integer;
   -- Returns N! (factorial of N)

   function GCD (A, B : Integer) return Integer;
   -- Returns the Greatest Common Divisor of A and B

   function LCM (A, B : Integer) return Integer;
   -- Returns the Least Common Multiple of A and B

end Math_Ops;
