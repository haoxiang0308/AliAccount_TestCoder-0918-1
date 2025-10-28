% 定义父母关系的事实
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父母关系规则
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义祖先关系规则（更通用的版本，可以处理任意代际）
ancestor(X, Z) :-
    parent(X, Z).

ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).

% 定义孙子/孙女关系规则
grandchild(Z, X) :-
    grandparent(X, Z).

% 定义曾祖父母关系规则（三代关系）
greatgrandparent(X, Z) :-
    parent(X, Y),
    parent(Y, A),
    parent(A, Z).