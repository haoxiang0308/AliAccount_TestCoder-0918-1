% Prolog predicate to check if a number is even
% Usage: is_even(Number) succeeds if Number is even, fails otherwise

is_even(Number) :-
    integer(Number),          % Ensure the input is an integer
    Number mod 2 =:= 0.       % Check if the number is divisible by 2

% Alternative implementation using recursion for educational purposes
% is_even(0).
% is_even(N) :-
%     N > 0,
%     N1 is N - 2,
%     is_even(N1).
% is_even(N) :-
%     N < 0,
%     N1 is N + 2,
%     is_even(N1).