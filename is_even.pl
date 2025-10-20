% Prolog predicate to check if a number is even
% Usage: is_even(Number) succeeds if Number is even, fails otherwise

is_even(N) :-
    integer(N),           % Ensure N is an integer
    N mod 2 =:= 0.        % Check if N modulo 2 equals 0

% Alternative implementation using recursion for educational purposes
% is_even(0).
% is_even(N) :-
%     N > 0,
%     N2 is N - 2,
%     is_even(N2).
% is_even(N) :-
%     N < 0,
%     N2 is N + 2,
%     is_even(N2).