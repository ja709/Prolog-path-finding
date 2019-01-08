# Prolog-path-finding

path/5, a relation that holds between a predicate,
two atoms, a path from the first atom to the second following that predicate,
and an integer that is the length of the path.

	path(:Rel, ?Source, ?Target, ?Path, ?Length)

Path must have Source as its first element and Target as its last element.
The total number of elements in Path must be Length. Each successive pair of
elements in Path must have the Rel relation. Thus, Path=[a,b,c] and Rel=foo,
implies foo(a,b), foo(b,c).

Importantly, no element may occur in Path more than once. That is, path/5 must
avoid getting stuck in cycles.

There is no restriction on the type of elements that may occur in Path, beyond
those implied by Rel.

	is_a(parallelogram, quadrilateral).
	is_a(trapezoid, quadrilateral).
	is_a(rhombus, parallelogram).
	is_a(rectangle, parallelogram).
	is_a(square, rhombus).
	is_a(square, rectangle).

	?- path(is_a, square, quadrilateral, 
		[square, rhombus, parallelogram, quadrilateral], 4).
	true.
	?- path(is_a, square, parallelogram, [square, trapezoid, parallelogram], 3).
	false.
	

	friend(alice, bob).
	friend(bob, carol).
	friend(carol, daniel).
	friend(carol, eve).
	
	friends(A,B) :- friend(A,B); friend(B,A).
	
	?- path(friends, eve, bob, [eve, carol, bob], 3).
	true.


Your definition of path/5 should work in as many modes as possible. You will
receive partial credit for those modes which you are able to implement.
You will receive credit for implementing these modes:

A) path(+Rel, +S, +T, ++P, +N)
	confirm that P is a path from S to T with length N (20 points)

B) path(+Rel, ?S, ?T, +P, ?N)
	confirm that P is a path, find source, target, and length (20 points)

C) path(+Rel, +S, +T, ?P, +N)
	find length-N paths from S to T (20 points)

D) path(+Rel, +S, +T, ?P, ?N)
	find paths from S to T (20 points)

E) path(+Rel, ?S, ?T, ?P, +N)
	find all length-N paths (10 points)

F) path(+Rel, ?S, ?T, ?P, ?N)
	find all paths (10 points)
