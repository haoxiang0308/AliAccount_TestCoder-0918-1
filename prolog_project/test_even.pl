#!/usr/bin/env swipl

:- initialization(main).

main :-
    writeln('Testing is_even predicate:'),
    (is_even(4) -> 
        writeln('4 is even') ;
        writeln('4 is not even')
    ),
    (is_even(5) -> 
        writeln('5 is even') ;
        writeln('5 is not even')
    ),
    halt.

% Include our predicate
is_even(N) :- 0 is N mod 2.