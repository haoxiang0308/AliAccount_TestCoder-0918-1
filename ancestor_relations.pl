% 定义父子关系的示例事实
parent(tom, bob).
parent(bob, liz).
parent(sue, tom).
parent(joe, bob).
parent(mary, liz).

% 定义祖父关系规则：如果X是Y的父亲，Y是Z的父亲，则X是Z的祖父
grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).

% 定义祖母关系规则：如果X是Y的母亲，Y是Z的父亲或母亲，则X是Z的祖母
grandmother(X, Z) :- parent(X, Y), parent(Y, Z), female(X).

% 定义祖先关系规则：X是Y的祖先，如果X是Y的直接父母或通过中间人
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

% 定义祖孙关系规则：X是Z的祖父母（不管性别）
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 辅助谓词定义性别（用于区分祖父/祖母）
male(tom).
male(bob).
male(joe).

female(sue).
female(liz).
female(mary).