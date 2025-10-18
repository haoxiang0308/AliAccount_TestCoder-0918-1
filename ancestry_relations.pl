% 定义父子关系的基本事实
parent(john, mary).
parent(john, tom).
parent(mary, lisa).
parent(mary, paul).
parent(tom, ann).
parent(tom, sam).
parent(lisa, kate).
parent(paul, mike).
parent(ann, robert).
parent(sam, jessica).

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

% 定义祖父或祖母关系（统称为祖父母关系）
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 辅助谓词定义性别
male(john).
male(tom).
male(paul).
male(sam).
male(mike).
male(robert).

female(mary).
female(lisa).
female(ann).
female(kate).
female(jessica).