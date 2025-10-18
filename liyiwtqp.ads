package Liyiwtqp is
   
   -- Базовые математические операции
   function Add(A, B : Integer) return Integer;
   function Subtract(A, B : Integer) return Integer;
   function Multiply(A, B : Integer) return Integer;
   function Divide(A, B : Integer) return Integer;
   function Modulo(A, B : Integer) return Integer;
   
   -- Возведение в степень для целых чисел
   function Power(Base, Exponent : Integer) return Integer;
   
   -- Вычисление факториала
   function Factorial(N : Integer) return Integer;
   
   -- Проверка, является ли число простым
   function Is_Prime(N : Integer) return Boolean;
   
   -- Нахождение наибольшего общего делителя
   function GCD(A, B : Integer) return Integer;

private
   -- Внутренние вспомогательные функции могут быть определены здесь
   
end Liyiwtqp;