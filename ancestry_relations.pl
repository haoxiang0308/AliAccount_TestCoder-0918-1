% 定义父子/父女关系的基本事实
parent(john, mary).
parent(john, tom).
parent(mary, ann).
parent(mary, sam).
parent(tom, lisa).
parent(tom, jack).
parent(ann, kate).
parent(sam, paul).
parent(lisa, rick).
parent(jack, sara).

% 定义祖父关系：如果X是Y的父亲，Y是Z的父亲，则X是Z的祖父
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系：如果X是Y的母亲，Y是Z的父亲或母亲，则X是Z的祖母
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖孙关系（不区分性别）：如果X是Y的祖先且间隔一代，则X是Z的祖父母
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义男性
male(john).
male(tom).
male(sam).
male(jack).
male(paul).
male(rick).

% 定义女性
female(mary).
female(ann).
female(lisa).
female(kate).
female(sara).