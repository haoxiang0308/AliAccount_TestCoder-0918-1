% Prolog predicate to check if a number is even.
% Usage: even(N).
% This predicate succeeds if N is an even number, fails otherwise.

even(N) :-
    % Ensure the input N is an integer.
    integer(N),
    % Check if the remainder of N divided by 2 is zero.
    N mod 2 =:= 0.
