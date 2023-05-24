klonuj([],[]).
klonuj([H|T],[[H,H]|X]):- klonuj(T,X).

srodek([X],X).
srodek([X|L],S) :- append(D,[_],L), srodek(D,S).

polowki([],[],[]).
polowki([X|Y],[X|T],P):- append(C,[B],Y), polowki(C,T,D), append(D,[B],P).

sumuj([],0).
sumuj([H|Y],X) :- sumuj(Y, Z), X is Z+H.

ile_wiekszych([],X,0).
ile_wiekszych([H|T],X,N) :- H > X, ile_wiekszych(T,X,Z), N is Z + 1.
ile_wiekszych([H|T],X,N) :- H =< X, ile_wiekszych(T,X,N).

plus_minus([],0).
plus_minus([H|T],S) :- plus_minus(T,S1), H = +, S is S1+1.
plus_minus([H|T],S) :- plus_minus(T,S1), H = -, S is S1-1.

wstawiaj([],X,1,[X]).
wstawiaj([H|T],X,1,[X,H|T]).
wstawiaj([H|T],X,I,[H|T1]) :- I > 1, I1 is I - 1, wstawiaj(T,X,I1,T1).

usuwaj([L],1,[]).
usuwaj([H|T],1,T).
usuwaj([H|T],I,L) :- usuwaj(T,Z,L), I is Z + 1.

rozdziel([],X,[],[]).
rozdziel([H|T],X,[H|L1],L2) :- H < X, rozdziel(T,X,L1,L2).
rozdziel([H|T],X,L1,[H|L2]) :- H >= X, rozdziel(T,X,L1,L2).

powiel([],[],[]).
powiel([H|T1],[I|T2],[H|L]) :- I > 1, I1 is I-1, powiel([H|T1],[I1|T2],L).
powiel([H|T1],[I|T2],[H|L]) :- powiel(T1,T2,L).
