%Вариант 3 :Реализовать синтаксический анализатор арифметического выражения и
%вычислить его числовое значение. В выражении допустимы операции +,-,*,/,
%степень ^. Учитывать приоритеты операций.


calculate(List, Result):-
    sum_differ(List, Result),!.

sum_differ(E, Result):-
    append(T, ['+'| E1], E),
    sum_differ(T, Result1),
    multi_division(E1, Result2),
    Result is Result1 + Result2.

sum_differ(E, Result):-
    append(T, ['-'| E1], E),
    sum_differ(T, Result1),
    multi_division(E1, Result2),
    Result is Result1 - Result2.

sum_differ(E, Result):-
    multi_division(E, Result).

multi_division(T, Result):-
    append(N, ['*' | T1], T),
    multi_division(N, Result1),
    new_power(T1, Result2),
    Result is Result1 * Result2.

multi_division(T, Result):-
    append(N, ['/' | T1], T),
    multi_division(N, Result1),
    new_power(T1, Result2),
    Result is Result1 / Result2.

multi_division(T, Result):-
    new_power(T, Result).

new_power(T, Result):-
    append(N, ['^', T2], T),
    new_power(N, T1),
    Result is T1 ** T2.

new_power([Result], Result):-
    number(Result).








