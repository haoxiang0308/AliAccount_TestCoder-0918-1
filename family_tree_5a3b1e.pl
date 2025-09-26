% База фактов Prolog о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)
% parent(X, Y) означает, что X - родитель Y

% Определение полов
male(john).
male(mike).
male(david).
female(eve).
female(jane).
female(lisa).

% Отношения родитель-ребенок
parent(john, mike).
parent(john, lisa).
parent(eve, mike).
parent(eve, lisa).
parent(mike, david).
parent(jane, david).