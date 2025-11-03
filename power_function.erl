-module(power_function).
-export([power/2]).

%% Función recursiva para calcular la potencia de un número
%% power(Base, Exponent) = Base ^ Exponent
power(_, 0) -> 1;
power(Base, Exp) when Exp > 0 ->
    Base * power(Base, Exp - 1);
power(Base, Exp) when Exp < 0 ->
    1 / power(Base, -Exp).