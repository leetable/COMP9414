% full name:Yixiao QIAN 
% student number:z5193543
% assignment name:Assignment 1 - Prolog Programming

%Question_1
is_even(Number):-
	0 is Number mod 2.

is_odd(Number):-
	not(is_even(Number)).

chengfang(Number,Result):-
	Result = Number * Number.

% if null,then return 0
sumsq_even([], 0).
sumsq_even([H|T],Sum):-
	is_odd(H),
	sumsq_even(T,Sum).
sumsq_even([H|T],Sum):-
	is_even(H),
	sumsq_even(T,Temp),
	chengfang(H,Cf),
	Sum is Cf + Temp.

%Question_2


same_name(Person1,Person2):-
	parent(Person1,Person2),
	male(Person1).

same_name(Person1,Person2):-
	parent(Person2,Person1),
	male(Person2).

same_name(Person1,Person2):-
	parent(Father1,Person1),
	male(Father1),
	Father1=Person2.

same_name(Person1,Person2):-
	parent(Father1,Person1),
	Father1 \= Person2,
	same_name(Father1,Person2).

same_name(Person1,Person2):-
	parent(Father2,Person2),
	male(Father2),
	Father2=Person1.

same_name(Person1,Person2):-
	parent(Father2,Person2),
	Father2 \= Person1,
	same_name(Person1,Father2).

%Question_3

sqrt_list([],[]).
sqrt_list([H|T], Result) :-
	sqrt_list(T, Sum),
	Sqrt is sqrt(H),
	Result = [[H, Sqrt]|Sum].

%Question_4
sign_runs([],[]).
sign_runs([Head | Tail],RunList):-
	sign_runs(Tail,RestList),
	tmp(Head, RestList, RunList).

tmp(Head, RestList, RunList):-
	RestList == [],
	RunList = [[Head]].

tmp(Head, RestList, RunList):-
	[[H | T] | Rest] = RestList,
	H>=0,
	Head >=0,
	RunList = [[Head | [H | T]] | Rest].


tmp(Head, RestList, RunList):-
	[[H | T] | Rest] = RestList,
	H <0,
	Head <0,
	RunList = [[Head | [H | T]] | Rest].

tmp(Head,RestList,RunList):-
	[[H | _] | _] = RestList,
	H>=0,
	Head=<0,
	RunList = [[Head]|RestList].
tmp(Head,RestList,RunList):-
	[[H | _] | _] = RestList,
	H=<0,
	Head>=0,
	RunList = [[Head]|RestList].

%Question_5
is_heap(empty).
is_heap(tree(empty,_,empty)).
is_heap(tree(empty,Value,Right)):-
	Right =tree(_,Right_value,_),
	Value=<Right_value,
	is_heap(Right).

is_heap(tree(Left,Value,empty)):-
	Left = tree(_,Left_value,_),
	Value=<Left_value,
	is_heap(Left).

is_heap(tree(Left,Value,Right)):-
	Left = tree(_,Left_value,_),
	Value=<Left_value,
	Right=tree(_,Right_value,_),
	Value=<Right_value,
	is_heap(Left),
	is_heap(Right).
  




	












