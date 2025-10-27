% 定义父子关系的基本事实
parent(tom, bob).
parent(bob, liz).
parent(liz, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖孙关系规则
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义祖先关系规则（可以处理任意代数的祖先）
ancestor(X, Z) :-
    parent(X, Z).

ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).