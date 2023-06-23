%3
glowyogony([],[],[]) :- !.
glowyogony([[H|O]|T],[H|LL],[O|LO]) :- glowyogony(T,LL,LO), !.
slad([[X]],X) :- !.
slad(M,X) :- glowyogony(M,[H|_],[_|LO]), slad(LO,XZ), X is XZ+H, !.

%4
rozszerzaj([X], X).
rozszerzaj([LL|PP], [M,N]) :- rozszerzaj(PP, [K,L]), LL = [X,Y], M is min(X,K), N is max(Y,L).

%6
rozmien(L,N,[N]) :- append(_,[X],L), N-X =:= 0, !.
rozmien(L,N,R) :- append(_,[X],L), N >= X, NN is N-X, rozmien(L,NN,RR), append(RR,[X],R), !.
rozmien(L,N,R) :- append(LL,[X],L), N < X, rozmien(LL,N,R), !.

%1
sumuj([],0).
sumuj([H|T], S) :- sumuj(T,SS), S is SS + H.
podzielniki(X,X,[]) :- !.
podzielniki(X,D,T):- D > 0, D < X, DD is D+1, X mod D > 0, podzielniki(X,DD,T).
podzielniki(X,D,[D|T]):- D > 0, D < X, DD is D+1, X mod D =:= 0, podzielniki(X,DD,T).
doskonala(X):- podzielniki(X,1,L),sumuj(L,X).

%2
przekroj([], _, []).
przekroj(_, [], []).
przekroj([H1|T1], [H2|T2], [H1|T]) :- H1 =:= H2, przekroj(T1,T2,T).
przekroj([H1|T1], [H2|T2], T) :- H1 < H2, przekroj(T1,[H2|T2],T).
przekroj([H1|T1], [H2|T2], T) :- H1 > H2, przekroj([H1|T1],T2,T).

%7
wpolu([],_,[]) :- !.
wpolu([[X,Y]|T],[[X1,Y1],[X2,Y2]],[[X,Y]|L]) :- X >= X1, X =< X2, Y >= Y1, Y =< Y2, wpolu(T,[[X1,Y1],[X2,Y2]],L), !.
wpolu([[X,_]|T],[[X1,Y1],[X2,Y2]],L) :- X < X1, wpolu(T,[[X1,Y1],[X2,Y2]],L), !.
wpolu([[X,_]|T],[[X1,Y1],[X2,Y2]],L) :- X > X2, wpolu(T,[[X1,Y1],[X2,Y2]],L), !.
wpolu([[_,Y]|T],[[X1,Y1],[X2,Y2]],L) :- Y < Y1, wpolu(T,[[X1,Y1],[X2,Y2]],L), !.
wpolu([[_,Y]|T],[[X1,Y1],[X2,Y2]],L) :- Y > Y2, wpolu(T,[[X1,Y1],[X2,Y2]],L), !.

%5
ciagliczb(M,M,[M]) :- !.
ciagliczb(M,N,[M|L]) :- M < N, M1 is M+1, ciagliczb(M1,N,L), !.
liczpodziel(X,X,0).
liczpodziel(X,D,RR) :- X > D, X mod D =:= 0, DD is D+1, liczpodziel(X,DD,R), RR is R+1.
liczpodziel(X,D,R) :- X > D, X mod D =\= 0, DD is D+1, liczpodziel(X,DD,R).
antyp([],_).
antyp([H|T],M) :- liczpodziel(H,1,D), D < M, antyp(T,M).
antypierwsza(N) :- X is N-1, ciagliczb(1,X,Y), liczpodziel(N,1,M), antyp(Y,M).

%8
minX([[X,_]],X) :- !.
minX([[X,_]|T],X) :- minX(T,X1), X<X1, !.
minX([[_,_]|T],X1) :- minX(T,X1), !.

minY([[_,Y]],Y) :- !.
minY([[_,Y]|T],Y) :- minY(T,Y1), Y<Y1, !.
minY([[_,_]|T],Y1) :- minY(T,Y1), !.

maxX([[X,_]],X) :- !.
maxX([[X,_]|T],X) :- maxX(T,X1), X>X1, !.
maxX([[_,_]|T],X1) :- maxX(T,X1), !.

maxY([[_,Y]],Y) :- !.
maxY([[_,Y]|T],Y) :- maxY(T,Y1), Y>Y1, !.
maxY([[_,_]|T],Y1) :- maxY(T,Y1), !.

minpole(L,[[X1,Y1],[X2,Y2]]) :- minX(L,X1), minY(L,Y1), maxX(L,X2), maxY(L,Y2), !.

%10
ciagFib(N,F1,_,[]) :- F1 > N, !.
ciagFib(N,F1,F2,[F1|L]) :- F1 =< N, F3 is F2 + F1, ciagFib(N,F2,F3,L), ! .

rozklad(LF,N,[N]) :- append(_,[X],LF), N-X =:= 0, !.
rozklad(LF,N,L) :- append(_,[X],LF), X =< N, N1 is N-X, rozklad(LF,N1,L1), append(L1,[X],L), ! .
rozklad(LF,N,L) :- append(LF1,[X],LF), X > N, rozklad(LF1,N,L),! .

rozklad_fib(N,L) :- ciagFib(N,0,1,L1), rozklad(L1,N,L).

%9
zamien_g([],[]).
zamien_g([X],[X]).
zamien_g([X,Y|T],[Y|L2]) :- X > Y, zamien_g([X|T],L2).
zamien_g([X,Y|T],[X|L2]) :- X =< Y, zamien_g([Y|T],L2).
zamien_d([],[]).
zamien_d([X],[X]).
zamien_d([X,Y|T],[Y|L2]) :- X =< Y, zamien_d([X|T],L2).
zamien_d([X,Y|T],[X|L2]) :- X > Y, zamien_d([Y|T],L2).
odwracaj([],[]).
odwracaj(L1,[T|L2]) :- append(L,[T],L1), odwracaj(L,L2).
koktajl([],[]).
koktajl([X],[X]).
koktajl(L,S) :- zamien_g(L,LL), odwracaj(LL,[B|L2]), zamien_d(L2,L3), odwracaj(L3,[SS|L4]), koktajl(L4,S1), append([SS|S1],[B],S), !.
