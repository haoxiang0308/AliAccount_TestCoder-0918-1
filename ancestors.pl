% 定义父子关系的示例事实
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父关系规则：X是Z的祖父，如果X是Y的父亲，且Y是Z的父亲
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 定义祖母关系规则：X是Z的祖母，如果X是Y的母亲，且Y是Z的父亲或母亲
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖孙关系规则（不区分性别）：X是Z的祖父母，如果X是Y的父亲或母亲，且Y是Z的父亲或母亲
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义男性
male(tom).
male(bob).
male(jim).

% 定义女性
female(liz).
female(ann).
female(pat).