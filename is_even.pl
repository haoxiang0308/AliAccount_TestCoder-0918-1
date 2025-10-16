% Prolog predicate to check if a number is even
is_even(N) :-
    integer(N),           % Ensure N is an integer
    N mod 2 =:= 0.        % Check if N is divisible by 2

% Alternative implementation using recursion
% is_even(0).
% is_even(N) :-
%     N > 0,
%     N1 is N - 2,
%     is_even(N1).
% is_even(N) :-
%     N < 0,
%     N1 is N + 2,
%     is_even(N1).