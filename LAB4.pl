ostatni(X,[X|[]]).
ostatni(X,[Head|Tail]) :- ostatni(X,Tail).

przedostatni(X,[X,Tail|[]]).
przedostatni(X,[Head|Tail]) :- przedostatni(X,Tail).

bezostatniego([X],[]).
bezostatniego([Head|Tail],[Head|L]) :- bezostatniego(Tail,L).

nakoniec(X,[],[X]).
nakoniec(X,[Head|Tail],[Head|L]) :- nakoniec(X,Tail,L).

zakazdym([],X,[]).
zakazdym([Head|Tail],X,[Head,X|L]) :- zakazdym(Tail,X,L).

codrugi([],[]).
codrugi([Head|[]],[]).
codrugi([Head,X|Tail],[X|L]) :- codrugi(Tail,L).

wstaw_za([X|Tail], X, Y, [X,Y|Tail]).
wstaw_za([H|Tail], X, Y, [H|L]) :- wstaw_za(Tail, X, Y, L).

lewoprawo(X,[X|LP],[],LP).
lewoprawo(X,[Head|L],[Head|LL],LP) :- lewoprawo(X,L,LL,LP).

wymiana(_,_,[],[]).
wymiana(X,Y,[X|L1],[Y|L2]) :- wymiana(X,Y,L1,L2).
wymiana(X,Y,[Head|L1],[Head|L2]) :- wymiana(X,Y,L1,L2).

polacz([],[]).
polacz([Head|Tail],L) :- polacz(Tail,L1), append(Head,L1,L).
