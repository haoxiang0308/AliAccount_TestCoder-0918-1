% Prolog predicate to check if a number is even
is_even(0).
is_even(N) :-
    N > 0,
    N mod 2 =:= 0.
is_even(N) :-
    N < 0,
    N1 is -N,
    N1 mod 2 =:= 0.