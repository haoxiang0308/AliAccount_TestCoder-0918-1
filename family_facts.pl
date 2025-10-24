% База фактов Prolog о семье
% Родители
parent(anna, maria).
parent(anna, ivan).
parent(petr, maria).
parent(petr, ivan).
parent(maria, oleg).
parent(maria, svetlana).
parent(ivan, alex).
parent(ivan, nina).
parent(ivan, dima).
parent(ekaterina, oleg).
parent(ekaterina, svetlana).
parent(olga, alex).
parent(olga, nina).
parent(olga, dima).

% Пол
male(petr).
male(ivan).
male(oleg).
male(alex).
male(dima).

female(anna).
female(maria).
female(ekaterina).
female(olga).
female(svetlana).
female(nina).

% Брак
married(anna, petr).
married(petr, anna).
married(maria, ivan).
married(ivan, maria).
married(ekaterina, olga).
married(olga, ekaterina).

% Правила
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandfather(X, Z) :- grandparent(X, Z), male(X).
grandmother(X, Z) :- grandparent(X, Z), female(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).