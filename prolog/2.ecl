%% utilities
read_lines(S, Mode, Lines) :-
	read_lines(S, Mode, [], Lines).

read_lines(S, Mode, Acc, Lines) :-
	read_string(S, end_of_line, _, Str),
	parse_line(Str, Mode, Line),
	read_lines(S, Mode, [Line|Acc], Lines).

read_lines(_, _, Acc, Lines) :-
	reverse(Acc, Lines).

parse_line(Line, numbers, Nums) :-
	split_string(Line, " ", "", Strs),
	maplist(number_string, Nums, Strs).

%% solution

adjacent_difference([_], []).

adjacent_difference([A, B|T], [D|R]) :-
	D is A - B,
	adjacent_difference([B|T], R).

all_in_range([], _, _).

all_in_range([H|T], Min, Max) :-
	abs(H, A),
	Min =< A,
	A =< Max,
	all_in_range(T, Min, Max).

all_same_sign([H|T]) :-
	all_same_sign(T, H).

all_same_sign([], _).

all_same_sign([H|T], First) :-
	H > 0,
	not First < 0,
	all_same_sign(T, First).

all_same_sign([H|T], First) :-
	H < 0,
	not First > 0,
	all_same_sign(T, First).

all_same_sign([], _).

valid(Row) :-
	adjacent_difference(Row, Adj),
	all_same_sign(Adj),
	all_in_range(Adj, 1, 3).

:- import select / 3 from lists.

valid_less_one(Row) :-
	valid(Row).

valid_less_one(Row) :-
	select(_, Row, Less),
	valid(Less).

count_if(_, [], 0).

count_if(Pred, [H|T], N) :-
	call(Pred, H),
	count_if(Pred, T, NN),
	N is NN + 1.

count_if(Pred, [H|T], N) :-
	not call(Pred, H),
	count_if(Pred, T, N).

solve :-
	open("input/2.in", read, S),
	read_lines(S, numbers, Rows),
	count_if(valid, Rows, Part1),
	count_if(valid_less_one, Rows, Part2),
	write("Part 1: "),
	write(Part1),
	nl,
	write("Part 2: "),
	write(Part2),
	nl.

