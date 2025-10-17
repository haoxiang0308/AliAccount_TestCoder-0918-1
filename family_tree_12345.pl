% База фактов Prolog о семье

% Мужчины
male(иван).
male(пётр).
male(семён).
male(александр).
male(дмитрий).
male(никита).

% Женщины
female(мария).
female(анна).
female(екатерина).
female(ольга).
female(татьяна).
female(наташа).

% Родительские отношения
% Иван и Мария - родители Петра и Александра
parent(иван, пётр).
parent(иван, александр).
parent(мария, пётр).
parent(мария, александр).

% Пётр и Анна - родители Дмитрия и Никиты
parent(пётр, дмитрий).
parent(пётр, никита).
parent(анна, дмитрий).
parent(анна, никита).

% Семён и Екатерина - родители Татьяны
parent(семён, татьяна).
parent(екатерина, татьяна).

% Александра и Ольга - родители Наташи
parent(александр, наташа).
parent(ольга, наташа).

% Правила для определения отношений

% Отец - это мужчина, которая является родителем
father(Father, Child) :- male(Father), parent(Father, Child).

% Мать - это женщина, которая является родителем
mother(Mother, Child) :- female(Mother), parent(Mother, Child).

% Ребёнок
child(Child, Parent) :- parent(Parent, Child).

% Брат - это мужчина, у которого тот же родитель
brother(Brother, Sibling) :- male(Brother), parent(Parent, Brother), parent(Parent, Sibling), Brother \= Sibling.

% Сестра - это женщина, у которой тот же родитель
sister(Sister, Sibling) :- female(Sister), parent(Parent, Sister), parent(Parent, Sibling), Sister \= Sibling.

% Дедушка - это отец родителя
grandfather(Grandfather, Grandchild) :- male(Grandfather), parent(Grandfather, Parent), parent(Parent, Grandchild).

% Бабушка - это мать родителя
grandmother(Grandmother, Grandchild) :- female(Grandmother), parent(Grandmother, Parent), parent(Parent, Grandchild).

% Дядя - это брат родителя или муж тёти
uncle(Uncle, NieceNephew) :- male(Uncle), (parent(Parent, NieceNephew), brother(Uncle, Parent); parent(Parent, NieceNephew), sister(Sister, Parent), married(Uncle, Sister)).

% Тётя - это сестра родителя или жена дяди
aunt(Aunt, NieceNephew) :- female(Aunt), (parent(Parent, NieceNephew), sister(Aunt, Parent); parent(Parent, NieceNephew), brother(Brother, Parent), married(Brother, Aunt)).

% Женаты
married(иван, мария).
married(пётр, анна).
married(семён, екатерина).
married(александр, ольга).