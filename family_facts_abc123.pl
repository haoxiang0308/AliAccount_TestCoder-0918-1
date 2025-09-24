% База фактов Prolog о семье

% Предикаты: parent(Родитель, Ребенок), male(Имя), female(Имя)
% Отношения: father, mother, son, daughter, sibling, grandparent, uncle, aunt

% Мужчины
male(alex).
male(bob).
male(charlie).
male(david).

% Женщины
female(anna).
female(beth).
female(diana).
female(eva).

% Родительские отношения
parent(alex, bob).
parent(alex, diana).
parent(beth, bob).
parent(beth, diana).
parent(charlie, anna).
parent(charlie, eva).
parent(david, anna).
parent(david, eva).

% Правила
father(Father, Child) :- parent(Father, Child), male(Father).
mother(Mother, Child) :- parent(Mother, Child), female(Mother).
son(Child, Parent) :- parent(Parent, Child), male(Child).
daughter(Child, Parent) :- parent(Parent, Child), female(Child).
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.
grandparent(GP, GC) :- parent(GP, P), parent(P, GC).
uncle(Uncle, Nephew) :- male(Uncle), parent(P, Nephew), sibling(Uncle, P).
aunt(Aunt, Niece) :- female(Aunt), parent(P, Niece), sibling(Aunt, P).