
father('Makarenkov Mikhail', 'Vasilev Konstantin').
mother('Viktorova Olga', 'Vasilev Konstantin').
father('Makarenkov Mikhail', 'Makarenkova Vera').
mother('Viktorova Olga', 'Makarenkova Vera').
father('Viktorov Viktor', 'Viktorova Olga').
mother('Kobzeva Rose', 'Viktorova Olga').
father('Viktorov Viktor', 'Viktorov Aleksander').
mother('Kobzeva Rose', 'Viktorov Aleksander').
father('Makarenkov Alexander', 'Makarenkov Mikhail').
mother('Makarenkova Anna', 'Makarenkov Mikhail').
father('Makarenkov Alexander', 'Makarenkova Ludmila').
mother('Makarenkova Anna', 'Makarenkova Ludmila').
father('Vasilev Konstantin', 'Vasilev Artem').
mother('Lebedeva Tatyana', 'Vasilev Artem').

%зять,теща
motherInLaw(P1,P3):-
    father(P1, Child),
    mother(P2, Child),
    mother(P3,P2);
    P1 \= P2.


