poziomy(odcinek(punkt(X1,Y),punkt(X2,Y))).
pionowy(odcinek(punkt(X,Y1),punkt(X,Y2))).

regularny(prostok¹t(punkt(X1,Y1),punkt(X2,Y1),punkt(X2,Y2),punkt(X1,Y2))).
%rolnik,wilk,koza,kapusta -> koza kapuste, wilk koze

safe(state(Z,_,Z,_)).
safe(state(Z,Z,_,Z)).
%state(west,west,west,west).

move(state(west,west,G,C),farmer_east_wolf,state(east,east,G,C)) :- safe(state(east,east,G,C)).
move(state(west,W,G,west),farmer_east_cabbage,state(east,W,G,east)) :- safe(state(east,W,G,east)).
move(state(west,W,west,C),farmer_east_goat,state(east,W,east,C)) :- safe(state(east,W,east,C)).
move(state(west,W,G,C),farmer_east_alone,state(east,W,G,C)) :- safe(state(east,W,G,C)).
move(state(east,W,G,C),farmer_west_alone,state(west,W,G,C)) :- safe(state(west,W,G,C)).
move(state(east,W,east,C),farmer_west_goat,state(west,W,west,C)) :- safe(state(west,W,west,C)).
move(state(east,W,G,east),farmer_west_cabbage,state(west,W,G,west)) :- safe(state(west,W,G,west)).
move(state(east,east,G,C),farmer_west_wolf,state(west,west,G,C)) :- safe(state(west,west,G,C)).


can_get(state(east, east, east, east)).
can_get(StateBefore) :- move(StateBefore,Move,StateAfter), can_get(StateAfter).
