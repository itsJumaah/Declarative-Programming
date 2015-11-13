/*----------------------- Part A -----------------------*/

output :-
	write("---------------------------------"), nl,
	write("ID: 12232659 - Name: Bilal jumaah"), nl,
	write("     159.202 - Assignment 2      "), nl,
	write("        All Parts Solved         "), nl,
	write("---------------------------------"), nl.

/*----------------------- Part B -----------------------*/

:- op(700, xfy, =>>).
	=>>(X, Y) :-
		X is (Y*2).

:- op(1200, fy, isSingleton).
	isSingleton [_].

/*----------------------- Part C -----------------------*/
% A)
totalInList([], 0).
totalInList([L|N], Total) :-
	totalInList(N, Sum),
	Total is L + Sum.

% B)
count(_, [], 0).
count(Word, [Word|List], N) :- 
	count(Word, List, N1),
	N is N1+1.
count(Word, [X|List], N) :- 
	count(Word, List, N),
	Word \= X.

% C)
adjAve([] ,[]).
adjAve([_],[]).             
adjAve([X,Y|XYs],[A|As]) :-
   A is (X+Y)/2,
   adjAve(XYs,As).


% D)
% I)

word(one, un).
word(two, deux).
word(three, trois).
word(four, quatre).
word(five, cinq).
word(six, six).
word(seven, sept).
word(eight, huit).
word(nine, neuf).
word(ten, dix).

% II)
translate([],[]).
translate([EnglishNr|FrenchNr], [X|Y]) :-
	word(EnglishNr, X),
	translate(FrenchNr, Y).

/*----------------------- Part D -----------------------*/

generateSq(X) :-
	fillSq(X),
	testSq(X),
	write(" "), nl, line,
	displaySq(X).


fillSq([Row1, Row2, Row3, Row4]):-
	permutation([a, b, c, d], Row1),
	permutation([a, b, c, d], Row2),
	permutation([a, b, c, d], Row3),
	permutation([a, b, c, d], Row4).


testSq([[],[],[],[]]).
testSq([[X1|Y1],[X2|Y2],[X3|Y3],[X4|Y4]]):-
	X1 \= Y1,
	X2 \= Y2,
	X3 \= Y3,
	X4 \= Y4,

	X1 \= X2,
	X1 \= X3,
	X1 \= X4,

	X2 \= X3,
	X2 \= X4,

	X3 \= X4,

	testSq([Y1, Y2, Y3, Y4]).



displaySq([]).
displaySq([X|Y]):-
	display(X),
	line,
	displaySq(Y).


display([A, B, C, D]):-
	write("| "), 
	write(A), 
	write(" | "), 
	write(B),
	write(" | "), 
	write(C), 
	write(" | "), 
	write(D),
	write(" |"), nl.


line:-
	tab(10), write(" ---------------"), nl, tab(10).

