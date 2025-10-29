% 定义父子关系的基本事实
parent(tom, bob).
parent(bob, liz).
parent(tom, ann).
parent(ann, pat).
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

% 定义祖父母关系规则：X是Z的祖父母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 辅助谓词定义性别
male(tom).
male(bob).
male(jim).
female(ann).
female(liz).
female(pat).

% 祖孙关系（通用）：X是Z的祖父母，如果X通过parent关系连接到Z，跨越两代
ancestor(X, Z) :-
    parent(X, Z).
    
ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).

% 三代祖先关系（祖父/祖母级别）
great_ancestor(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 祖父关系（仅男性）
grandfather(X, Z) :-
    grandparent(X, Z),
    male(X).

% 祖母关系（仅女性）
grandmother(X, Z) :-
    grandparent(X, Z),
    female(X).