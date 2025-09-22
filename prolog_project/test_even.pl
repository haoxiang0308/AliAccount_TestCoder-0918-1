#!/usr/bin/env -S swipl -q -g main -f

% Load the predicates
:- [hOBPongZ1B].

% Main predicate to demonstrate usage
main :-
    write('Testing even/odd predicates:'), nl,
    test_number(4),
    test_number(7),
    test_number(0),
    test_number(-3),
    test_number(-8),
    halt.

% Helper predicate to test a number
test_number(N) :-
    write('Number: '), write(N), write(' - '),
    (is_even(N) -> 
        write('Even'), nl
    ; 
        write('Odd'), nl
    ).