/*----------------------Part 1----------------------*/

output :-
write('----159.202 Assignment 1----'), nl,
write('ID: 12232659, Name: Bilal Jumaah'), nl,
write('-----All 4 Parts solved-----'), nl.

/*----------------------Part 2----------------------*/

likes(tom,jerry).
likes(mary,john).
likes(mary,mary).
likes(tom,mouse).
likes(jerry,jerry).
likes(jerry, cheese).
likes(mary,fruit).
likes(john,book).
likes(mary,book).
likes(tom, john).

% I) A)

likes(john, X) :-
likes(mary, X).

% I) B)
likes(john, X) :-
likes(X, cheese).

% II)
% A) 
% Input..
% likes(mary, Answer).
% Output..
% Answer = john 
% Answer = mary 
% Answer = fruit 
% Answer = book.

% B) 
% Input..
% likes(john, Answer).
% Output..
% Answer = book 
% Answer = john 
% Answer = mary 
% Answer = fruit 
% Answer = book 
% Answer = jerry

% C)
% Input.. 
% likes(Answer, book).
% Output..
% Answer = john 
% Answer = mary 
% Answer = john

/*----------------------Part 3----------------------*/
% I)

% Some Greek gods

male(apollo).
male(ares).
male(cronus).
male(coeus).
male(hades).
male(hephaestus).
male(oceanus).
male(poseidon).
male(uranus).
male(zeus).

% Some Greek goddesses

female(aphrodite).
female(artemis).
female(demeter).
female(gaea).
female(hera).
female(hestia).
female(leto).
female(phoebe).
female(rhea).

% parents(person, father, mother)

parents(apollo, zeus,leto).
parents(cronus,uranus,gaea).
parents(coeus, uranus, gaea).
parents(ares, zeus,hera).
parents(phoebe, uranus, gaea).
parents(hestia,cronus,rhea).
parents(poseidon,cronus,rhea).
parents(hades,cronus,rhea).
parents(zeus,cronus,rhea).
parents(demeter,cronus,rhea).
parents(oceanus, uranus, gaea).
parents(hebe, zeus,hera).
parents(hephaestus, zeus,hera).
parents(artemis, zeus,leto).
parents(rhea, uranus,gaea).

brother(Person1, Person2) :-
	male(Person1),
    parents(Person1, Father, Mother),
    parents(Person2, Father, Mother),
    Person1 \= Person2.

% A)

sister(Person1, Person2) :-
	female(Person1),
    parents(Person1, Father, Mother),
    parents(Person2, Father, Mother),
    Person1 \= Person2.

% B)

aunt(Person, Aunt) :-
	female(Aunt),
    parents(Person, Father, _),
    sister(Aunt, Father),
    Person \= Aunt.

aunt(Person, Aunt) :-
    female(Aunt),
    parents(Person, _, Mother),
    sister(Aunt, Mother),
    Person \= Aunt.

% C)

son(Person, Father) :-
	male(Person),
	parents(Person, Father, _),
    Person \= Father.

% II)
% A) 
% Input..
% aunt(apollo, X).
% Output..
% X = demeter 
% X = hestia 

% B) 
% Input..
% son(X, zeus).
% Output..
% X = apollo 
% X = ares 
% X = hephaestus

/*----------------------Part 4----------------------*/

% I) A)

woman(anna).
woman(eve).
woman(julie).
woman(carmela).

% B)

man(luc).
man(max).
man(marc).
man(hector).

% C)

height(eve, 155).
height(julie,165).
height(carmela, 159).
height(luc,170).
height(marc, 190).

% D)

hair(anna, blonde).
hair(eve, brunette).
hair(julie, red-haired).
hair(carmela, blonde).

% II) A)

petite(anna).

petite(Person) :- 
    woman(Person),
    (height(Person, H), H<160).
% B)

prefers(luc, Female) :-
    woman(Female),
    hair(Female, red-haired).

prefers(max, Female) :-
    woman(Female),
    petite(Female),
    hair(Female, brunette).

prefers(marc, Female) :-
    woman(Female),
    hair(Female, brunette).

prefers(hector, Female) :-
    woman(Female),
    petite(Female),
    hair(Female, blonde).


prefers(anna, Male) :-
    man(Male).

prefers(carmela, Person) :-
    man(Person).

prefers(carmela, Person) :-
    woman(Person),
    Person \= carmela.
    %hot

prefers(julie, Male) :-
    man(Male),
    height(Male, X),
    X > 165.

prefers(eve, Male) :-
    man(Male),
    prefers(Male, Female),
    petite(Female),
    hair(Female, brunette).

% III)
match(Male, Female) :-
prefers(Male, Female),
prefers(Female, Male).

% IV) 
% Input..
% match(X, Y).
% Output..
% X = luc,
% Y = julie 
% X = max,
% Y = eve 
% X = marc,
% Y = eve 
% X = hector,
% Y = anna 
% X = hector,
% Y = carmela 
% X = anna,
% Y = hector 
% X = carmela,
% Y = hector 
% X = julie,
% Y = luc 
% X = eve,
% Y = max 
% X = eve,
% Y = marc 