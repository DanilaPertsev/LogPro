%6 вариант
step(A,B):-
    append(Begin,["_","w"|Tail],A),
    append(Begin,["w","_"|Tail],B).

step(A,B):-
    append(Begin,["b","_"|Tail],A),
    append(Begin,["_","b"|Tail],B).

step(A,B):-
    append(Begin,["_","b","w"|Tail],A),
    append(Begin,["w","b","_"|Tail],B).

step(A,B):-
    append(Begin,["b","w","_"|Tail],A),
    append(Begin,["_","w","b"|Tail],B).

answer([]).
answer([H|Tail]):-
    answer(Tail),
    write(H), nl.

dFS(Fin,[Fin|Tail]) :-
    !, answer([Fin|Tail]).

dFS(Fin, [Curr|Tail]) :-
    step(Curr, Tmp),
    not(member(Tmp,Tail)),
    dFS(Fin, [Tmp, Curr|Tail]).

next(X, HasBeen, Y) :-
    step(X,Y),
    not(member(Y,HasBeen)).

bFS([First|_],Fin,First) :-
    First = [Fin|_].
bFS([[LastWay|HasBeen]|OtherWays],Finish,Way):-
    findall([Z,LastWay|HasBeen],
    next(LastWay, HasBeen, Z), List),
    append(List,OtherWays,NewWays),
    bFS(NewWays,Finish,Way).

prolong([X|T],[Y,X|T]) :-
    step(X,Y),
    not(member(Y,[X|T])).

iter([Fin|Tail],Fin,[Fin|Tail],0).

iter(TempWay,Fin,Way,N):-
    N > 0,
    prolong(TempWay,NewWay),
    N1 is N-1,
    iter(NewWay,Fin,Way,N1).

for(X, X, _).
for(I, X, Y):-
    X < Y,
    X1 is X + 1,
    for(I, X1 ,Y).

solve(Start, Fin):-
    write('ITERATION METHOD START'), nl,
    get_time(ITER),
    for(Lvl, 1, 20),
    iter([Start], Fin, Way, Lvl),
    answer(Way),
    get_time(ITER1),
    write('ITERATION METHOD END'), nl, nl,
    T is ITER1 - ITER,
    write('TIME IS '), write(T), nl, nl,

    write('DFS START'), nl,
    get_time(DFS),
    dFS(Fin, [Start]),
    get_time(DFS1),
    write('DFS'), nl, nl,
    T1 is DFS1 - DFS,
    write('TIME IS '), write(T1), nl, nl,

    write('BFS START'), nl,
    get_time(BFS),
    bFS([[Start]],Fin,Way),
    answer(Way),
    get_time(BFS1),
    write('BFS END'), nl, nl,
    T2 is BFS1 - BFS,
    write('TIME IS '), write(T2), nl, nl,
    !.
