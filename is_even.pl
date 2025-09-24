% Predicate to check if a number is even
is_even(N) :-
    % Check if the number is an integer
    integer(N),
    % Check if the remainder when divided by 2 is 0
    0 is N mod 2.

% Example usage:
% ?- is_even(4).
% true.
%
% ?- is_even(5).
% false.