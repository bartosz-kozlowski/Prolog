najwiekszy([X],X) :- !.
najwiekszy([H1,H2|T],MX) :- H1 >= H2, najwiekszy([H1|T],MX).
najwiekszy([H1,H2|T],MX) :- H1 < H2, najwiekszy([H2|T],MX).

liniowa([X,Y]) :- !.
liniowa([X,Y,Z|T]) :- Z-Y =:= Y-X, liniowa([Y,Z|T]).

oddziel([H|T],1,[H],T) :- !.
oddziel([H|T],I,[H|P],R) :- II is I-1, oddziel(T,II,P,R), !.
rozbij([],[],[]) :- !.
rozbij(LL,[I|T2],[P|L]) :- oddziel(LL,I,P,R), rozbij(R,T2,L), !.

decnabin(0, [0]).
decnabin(1, [1]).
decnabin(N,B) :- N > 1, X is N mod 2, Y is N div 2, decnabin(Y,F), append(F,[X],B).

unikalne([],[]) :- !.
unikalne([H|T],[H|L]) :- not(member(H,T)), unikalne(T,L), !.
unikalne([H|T],L) :- member(H,T), unikalne(T,L), !.

przynaleznosc([],W,[],[]) :- !.
przynaleznosc([H|T],[L,P],[H|LW],LZ) :- H >= L, H =< P, przynaleznosc(T,[L,P],LW,LZ), !.
przynaleznosc([H|T],[L,P],LW,[H|LZ]) :- H < L, przynaleznosc(T,[L,P],LW,LZ), !.
przynaleznosc([H|T],[L,P],LW,[H|LZ]) :- H > P, przynaleznosc(T,[L,P],LW,LZ), !.

najblizszy(X,[L],L) :- !.
najblizszy(X,[L1,L2|T],M) :- D1 is abs(L1-X), D2 is abs(L2-X), D1 =< D2, najblizszy(X,[L1|T],M).
najblizszy(X,[L1,L2|T],M) :- D1 is abs(L1-X), D2 is abs(L2-X), D1 > D2, najblizszy(X,[L2|T],M).

doposort([],X,[X]).
doposort([H|T],X,[X,H|T]) :- H > X.
doposort([H|T],X,[H|L]) :- doposort(T,X,L).
wstawsort([],[]).
wstawsort([H|T],S) :- wstawsort(T,W), doposort(W,H,S).

rozdziel([],_,[],[]) :- !.
rozdziel([H|T],X,[H|L1],L2) :- H < X, rozdziel(T,X,L1,L2), !.
rozdziel([H|T],X,L1,[H|L2]) :- H >= X, rozdziel(T,X,L1,L2), !.
szybkisort([],[]) :- !.
szybkisort([H|T],S) :- rozdziel(T,H,M,W), szybkisort(M,F), szybkisort(W,WW), append(F,[H|WW],S), !.

ciagliczb(M,M,[M]) :- !.
ciagliczb(M,N,[M|L]) :- M < N, M1 is M+1, ciagliczb(M1,N,L), !.
odsiewaj(_,[],[]).
odsiewaj(X,[H|T],L) :- mod(H,X) =:= 0, odsiewaj(X,T,L), !.
odsiewaj(X,[H|T],[H|L]) :- odsiewaj(X,T,L), !.
sito([],[]) :- !.
sito([H|T],[H|L]) :- odsiewaj(H,T,L1), sito(L1,L), !.
eratostenes(N,L) :- ciagliczb(2,N,C), sito(C,L).
