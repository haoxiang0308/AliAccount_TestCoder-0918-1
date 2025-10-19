% 定义父母关系（示例事实）
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父母关系规则
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 定义孙子/孙女关系规则
grandchild(Z, X) :- grandparent(X, Z).

% 定义祖父关系（如果需要特别区分）
grandfather(X, Z) :- grandparent(X, Z), male(X).

% 定义祖母关系（如果需要特别区分）
grandmother(X, Z) :- grandparent(X, Z), female(X).

% 性别定义（示例）
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).