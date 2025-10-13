% База фактов о семье

% Предикаты: parent(Родитель, Ребенок), male(Имя), female(Имя)

% Определяем родителей
parent(anna, bob).
parent(anna, clara).
parent(bob, grace).
parent(bob, john).
parent(clara, kate).
parent(mike, bob).
parent(mike, clara).
parent(john, lisa).

% Определяем пол
male(bob).
male(john).
male(mike).
female(anna).
female(clara).
female(grace).
female(kate).
female(lisa).