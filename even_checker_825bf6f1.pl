% Prolog predicate to check if a number is even
% Usage: is_even(Number) succeeds if Number is even, fails otherwise

is_even(Number) :-
    Number mod 2 =:= 0.