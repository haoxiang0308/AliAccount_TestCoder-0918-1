with Ada.Text_IO; use Ada.Text_IO;
with Math_Ops; use Math_Ops;

procedure Main is
   Result : Float;
begin
   Put_Line("Math Operations Package Demo");
   Put_Line("============================");
   
   -- Test addition
   Result := Add(5.0, 3.0);
   Put_Line("5 + 3 = " & Float'Image(Result));
   
   -- Test subtraction
   Result := Subtract(10.0, 4.0);
   Put_Line("10 - 4 = " & Float'Image(Result));
   
   -- Test multiplication
   Result := Multiply(6.0, 7.0);
   Put_Line("6 * 7 = " & Float'Image(Result));
   
   -- Test division
   Result := Divide(15.0, 3.0);
   Put_Line("15 / 3 = " & Float'Image(Result));
   
   -- Test power
   Result := Power(2.0, 8);
   Put_Line("2 ^ 8 = " & Float'Image(Result));
   
   -- Test square root
   Result := Square_Root(16.0);
   Put_Line("Square root of 16 = " & Float'Image(Result));
   
   -- Test max
   Result := Max(12.5, 8.3);
   Put_Line("Max of 12.5 and 8.3 = " & Float'Image(Result));
   
   -- Test min
   Result := Min(12.5, 8.3);
   Put_Line("Min of 12.5 and 8.3 = " & Float'Image(Result));
   
   Put_Line("Demo completed successfully!");
end Main;