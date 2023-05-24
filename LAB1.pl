kobieta(maria).
kobieta(ewa).
kobieta(agata).
kobieta(anna).
kobieta(joanna).
kobieta(agnieszka).
kobieta(beata).
kobieta(iwona).

mê¿czyzna(piotr).
mê¿czyzna(adam).
mê¿czyzna(marek).
mê¿czyzna(robert).
mê¿czyzna(jan).
mê¿czyzna(krzysztof).
mê¿czyzna(radek).
mê¿czyzna(darek).
mê¿czyzna(tomek).
mê¿czyzna(jacek).

rodzic(maria,marek).
rodzic(piotr,marek).
rodzic(maria,agata).
rodzic(piotr,agata).
rodzic(maria,jan).
rodzic(piotr,jan).
rodzic(agata,beata).
rodzic(agata,radek).
rodzic(robert,radek).
rodzic(robert,beata).
rodzic(jan,darek).
rodzic(jan,tomek).
rodzic(anna,darek).
rodzic(anna,tomek).
rodzic(adam,anna).
rodzic(ewa,anna).
rodzic(adam,joanna).
rodzic(ewa,joanna).
rodzic(ewa,krzysztof).
rodzic(adam,krzysztof).
rodzic(krzysztof,jacek).
rodzic(krzysztof,iwona).
rodzic(agnieszka,jacek).
rodzic(agnieszka,iwona).

ma³¿eñstwo(maria,piotr).
ma³¿eñstwo(adam,ewa).
ma³¿eñstwo(robert,agata).
ma³¿eñstwo(jan,anna).
ma³¿eñstwo(krzysztof,agnieszka).

matka(X,Y) :- kobieta(X), rodzic(X,Y).
ojciec(X,Y) :- mê¿czyzna(X), rodzic(X,Y).
brat(X,Y) :- mê¿czyzna(X), rodzic(Z,X), rodzic(Z,Y), X\=Y.
siostra(X,Y) :- kobieta(X), rodzic(Z,X), rodzic(Z,Y), X\=Y.
babcia(X,Y) :- kobieta(X), rodzic(X,Z), rodzic(Z,Y).
dziadek(X,Y) :- mê¿czyzna(X), rodzic(X,Z), rodzic(Z,Y).
wuj(X,Y) :- mê¿czyzna(X), kobieta(Z), rodzic(Z,Y), brat(X,Z).
stryj(X,Y) :- mê¿czyzna(X), mê¿czyzna(Z), rodzic(Z,Y), brat(X,Z).
kuzyn(X,Y) :- rodzic(Z,Y), (brat(Z,C);siostra(Z,C)), mê¿czyzna(X), rodzic(C,X).
kuzynka(X,Y) :- rodzic(Z,Y), (brat(Z,C);siostra(Z,C)), kobieta(X), rodzic(C,X).
m¹¿(X,Y) :- mê¿czyzna(X), kobieta(Y), (ma³¿eñstwo(X,Y);ma³¿eñstwo(Y,X)).
szwagier(X,Y) :- (¿ona(Z,Y), brat(X,Z));(siostra(Z,Y), m¹¿(X,Z)).
¿ona(X,Y) :- kobieta(X), mê¿czyzna(Y), (ma³¿eñstwo(X,Y);ma³¿eñstwo(Y,X)).
teœciowa(X,Y) :- kobieta(X), kobieta(Z), ¿ona(Z,Y), rodzic(X,Z).
