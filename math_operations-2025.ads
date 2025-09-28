-- math_operations.ads
-- Спецификация пакета для базовых математических операций

package Math_Operations is

  function Add (A, B : Integer) return Integer;
  function Subtract (A, B : Integer) return Integer;
  function Multiply (A, B : Integer) return Integer;
  function Divide (A, B : Integer) return Integer;

end Math_Operations;