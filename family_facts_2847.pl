% База фактов о семье (Family facts database in Russian)

% Мужчины (Males)
male(alex).
male(bob).
male(charlie).
male(david).
male(edward).

% Женщины (Females)
female(anna).
female(beth).
female(clara).
female(diana).
female(elena).

% Родители (Parents)
parent(alex, bob).     % alex - родитель bob
parent(anna, bob).     % anna - родитель bob
parent(alex, clara).   % alex - родитель clara
parent(anna, clara).   % anna - родитель clara
parent(bob, david).    % bob - родитель david
parent(beth, david).   % beth - родитель david
parent(bob, elena).    % bob - родитель elena
parent(beth, elena).   % beth - родитель elena

% Супруги (Spouses)
spouse(alex, anna).
spouse(anna, alex).
spouse(bob, beth).
spouse(beth, bob).

% Правила (Rules)
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandfather(X, Z) :- grandparent(X, Z), male(X).
grandmother(X, Z) :- grandparent(X, Z), female(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).