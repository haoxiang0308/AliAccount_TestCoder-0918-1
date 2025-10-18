% 定义父子关系的基本事实
parent(john, mary).
parent(john, tom).
parent(mary, lisa).
parent(mary, jack).
parent(tom, ann).
parent(tom, sam).
parent(lisa, ben).
parent(jack, rose).

% 定义祖父关系规则
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系规则
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖父母关系规则（不区分性别）
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义男性基本事实
male(john).
male(tom).
male(jack).
male(sam).
male(ben).

% 定义女性基本事实
female(mary).
female(lisa).
female(ann).
female(rose).