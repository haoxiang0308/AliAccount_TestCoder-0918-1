% База фактов Prolog о семье

% Предикаты для определения родительских отношений
parent(иван, мария).
parent(иван, алексей).
parent(мария, дмитрий).
parent(алексей, анастасия).
parent(алексей, екатерина).

% Предикаты для определения пола
male(иван).
male(алексей).
male(дмитрий).
female(мария).
female(анастасия).
female(екатерина).

% Правила для определения отношений
father(Father, Child) :- parent(Father, Child), male(Father).
mother(Mother, Child) :- parent(Mother, Child), female(Mother).
grandfather(Grandfather, Grandchild) :- parent(Parent, Grandchild), parent(Grandfather, Parent), male(Grandfather).
grandmother(Grandmother, Grandchild) :- parent(Parent, Grandchild), parent(Grandmother, Parent), female(Grandmother).
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.