% База фактов о семье (Family facts database in Prolog)

% Предикаты родства (Relationship predicates)
% parent(X, Y) - X является родителем Y
parent(anna, maria).
parent(anna, ivan).
parent(petr, maria).
parent(petr, ivan).
parent(maria, dmitriy).
parent(maria, ekaterina).
parent(ivan, alexei).
parent(ivan, olga).
parent(dmitriy, svetlana).
parent(dmitriy, andrey).

% married(X, Y) - X женат/замужем на Y
married(anna, petr).
married(petr, anna).
married(maria, sergey).
married(sergey, maria).
married(ivan, natalia).
married(natalia, ivan).

% male(X) - X мужчина
male(petr).
male(ivan).
male(dmitriy).
male(alexei).
male(andrey).

% female(X) - X женщина
female(anna).
female(maria).
female(ekaterina).
female(olga).
female(natalia).
female(svetlana).

% Правила (Rules)
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
child(X, Y) :- parent(Y, X).
son(X, Y) :- child(X, Y), male(X).
daughter(X, Y) :- child(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandfather(X, Z) :- grandparent(X, Z), male(X).
grandmother(X, Z) :- grandparent(X, Z), female(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).