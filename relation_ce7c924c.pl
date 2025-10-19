% 定义父母关系
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父关系规则
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义祖母关系规则（可选，如果需要区分的话）
% 这里使用相同的规则，因为性别信息未提供
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 定义祖父关系规则（可选，如果需要区分的话）
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% 示例性别定义（如果需要区分祖父母性别）
female(liz).
female(ann).
female(pat).
male(tom).
male(bob).
male(jim).