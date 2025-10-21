% Prolog predicate to check if a number is even
is_even(X) :-
    X mod 2 =:= 0.

% Alternative implementation using recursion for non-negative integers
is_even_recursive(0).
is_even_recursive(X) :-
    X > 0,
    X mod 2 =:= 0.

% For negative numbers
is_even_negative(X) :-
    X < 0,
    Y is -X,
    Y mod 2 =:= 0.

% Combined predicate that handles positive, negative, and zero
is_even_complete(X) :-
    (X >= 0 -> X mod 2 =:= 0 ; Y is -X, Y mod 2 =:= 0).