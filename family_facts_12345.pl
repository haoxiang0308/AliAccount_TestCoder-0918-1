% База фактов о семье (Family facts database in Prolog)

% Семья Смитов (The Smith Family)
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% Правила (Rules)
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandfather(X, Z) :- grandparent(X, Z), male(X).
grandmother(X, Z) :- grandparent(X, Z), female(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Более сложные отношения (More complex relationships)
uncle(X, Z) :- parent(Y, Z), sibling(X, Y), male(X).
aunt(X, Z) :- parent(Y, Z), sibling(X, Y), female(X).