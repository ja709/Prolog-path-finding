:-use_module(library(plunit)).
:-use_module(library(dif)).
:-use_module(library(clpfd)).

notmember(A,[]).
notmember(A,[X|Y]) :-
	dif(X,A),
	notmember(A,Y).
%---------------------------------------------------------

travel(Rel,A,B,[A,B],2,Visit) :-
	call(Rel,A,B).

travel(Rel,A,B,[A|[P1|P2]],Len,Visit) :-
	call(Rel,A,P1),
	%\+member(P1,Visit),
	notmember(P1,Visit),
	travel(Rel,P1,B,[P1|P2],L1,[P1|Visit]),
	Len #= L1 + 1.

path(Rel,A,B,Path,Len):-
	dif(A,B),
	travel(Rel,A,B,Path,Len,[A,B]).

%---------------------------------------------------------
/*
is_a(parallelogram, quadrilateral).
	is_a(trapezoid, quadrilateral).
	is_a(rhombus, parallelogram).
	is_a(rectangle, parallelogram).
	is_a(square, rhombus).
	is_a(square, rectangle).

friend(alice, bob).
	friend(bob, carol).
	friend(carol, daniel).
	friend(carol, eve).
	
	friends(A,B) :- friend(A,B).
	friends(A,B) :- friend(B,A).
*/
