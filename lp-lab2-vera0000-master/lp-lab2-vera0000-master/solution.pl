%В педагогическом институте Аркадьева, Бабанова, Корсакова, Дашков, Ильин и Флеров
% преподают географию, английский язык, французский язык, немецкий язык,
% историю и математику. Преподаватель немецкого языка и преподаватель
% математики в студенческие годы занимались художественной гимнастикой.
% Ильин старше Флерова, но стаж работы у него меньше, чем у преподавателя
% географии. Будучи студентками, Аркадьева и Бабанова учились вместе в
% одном университете. Все остальные окончили педагогический институт.
% Флеров отец преподавателя французского языка. Преподаватель английского
% языка самый старший из всех и по возрасту и по стажу. Он работает в
% этом институте с тех пор, как окончил его. Преподаватели математики и
% истории его бывшие студенты. Аркадьева старше преподавателя немецкого
% языка. Кто какой предмет преподает?

%person(Surname,Sex,Subject,Graduating).

tutors(Result) :-
    length(Result, 6),

    % исходные данные
    member(person(_, _, math, _), Result),
    member(person(_, _, geography, _), Result),
    member(person(_, _, french, _), Result),
    member(person(_, _, deutsch, _), Result),
    member(person(_, _, history, _), Result),
    member(person(_, _, english, _), Result),


    member(person(arcadeva,female, _, _), Result),
    member(person(babanova,female, _, _), Result),
    member(person(korsakova,female, _, _), Result),
    member(person(dashkov, man, _, _), Result),
    member(person(ilin, man, _, _), Result),
    member(person(flerov, man, _, _), Result),

    %немецкий и математика - женщины
    member(person(_, female, math, _), Result),
    member(person(_, female, deutsch, _), Result),

    % англичанин самый старший и опытный,
    % Ильин старше флерова,но опыта меньше
    % чем у географа
    not(member(person(ilin, _, english, _), Result)),
    not(member(person(flerov, _, english, _), Result)),
    not(member(person(ilin, _, geography, _), Result)),

    % флеров не учитель французского
    not(member(person(flerov, _, french, _), Result)),


    % ильин не француз, т.к. старше флерова,
    % который является отцом француза
    not(member(person(ilin, _, french, _), Result)),

    % аркадьева и бабанова учились в одном институте, но не педе
    member(person(arcadeva,female, _, inst), Result),
    member(person(babanova,female, _, inst), Result),

    % остальные учились в педе
    member(person(ilin, man, _, ped), Result),
    member(person(flerov, man, _, ped), Result),
    member(person(korsakova,female, _, ped), Result),
    member(person(dashkov, man, _, ped), Result),

    % преподаватель английского мужчина
    member(person(_, man, english, ped), Result),

    %математик и историк учились в педе
    member(person(_, _, history, ped), Result),
    member(person(_, _, math, ped), Result),


    %Аркадьева старше преподавателя немецкого
    % языка
    not(member(person(arcadeva, _, deutsch, _), Result)).

