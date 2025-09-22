% Facts about people in the family
person(alex).
person(bob).
person(carol).
person(diana).
person(eric).
person(fiona).
person(george).
person(helen).

% Facts about gender (male or female)
male(alex).
male(bob).
male(eric).
male(george).
female(carol).
female(diana).
female(fiona).
female(helen).

% Facts about parent-child relationships
parent(alex, bob).
parent(alex, carol).
parent(diana, bob).
parent(diana, carol).
parent(bob, eric).
parent(bob, fiona).
parent(carol, george).
parent(eric, helen).

% Facts about marriage relationships
married(alex, diana).
married(bob, carol).
married(eric, fiona).