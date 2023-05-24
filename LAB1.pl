kobieta(maria).
kobieta(ewa).
kobieta(agata).
kobieta(anna).
kobieta(joanna).
kobieta(agnieszka).
kobieta(beata).
kobieta(iwona).

m�czyzna(piotr).
m�czyzna(adam).
m�czyzna(marek).
m�czyzna(robert).
m�czyzna(jan).
m�czyzna(krzysztof).
m�czyzna(radek).
m�czyzna(darek).
m�czyzna(tomek).
m�czyzna(jacek).

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

ma��e�stwo(maria,piotr).
ma��e�stwo(adam,ewa).
ma��e�stwo(robert,agata).
ma��e�stwo(jan,anna).
ma��e�stwo(krzysztof,agnieszka).

matka(X,Y) :- kobieta(X), rodzic(X,Y).
ojciec(X,Y) :- m�czyzna(X), rodzic(X,Y).
brat(X,Y) :- m�czyzna(X), rodzic(Z,X), rodzic(Z,Y), X\=Y.
siostra(X,Y) :- kobieta(X), rodzic(Z,X), rodzic(Z,Y), X\=Y.
babcia(X,Y) :- kobieta(X), rodzic(X,Z), rodzic(Z,Y).
dziadek(X,Y) :- m�czyzna(X), rodzic(X,Z), rodzic(Z,Y).
wuj(X,Y) :- m�czyzna(X), kobieta(Z), rodzic(Z,Y), brat(X,Z).
stryj(X,Y) :- m�czyzna(X), m�czyzna(Z), rodzic(Z,Y), brat(X,Z).
kuzyn(X,Y) :- rodzic(Z,Y), (brat(Z,C);siostra(Z,C)), m�czyzna(X), rodzic(C,X).
kuzynka(X,Y) :- rodzic(Z,Y), (brat(Z,C);siostra(Z,C)), kobieta(X), rodzic(C,X).
m��(X,Y) :- m�czyzna(X), kobieta(Y), (ma��e�stwo(X,Y);ma��e�stwo(Y,X)).
szwagier(X,Y) :- (�ona(Z,Y), brat(X,Z));(siostra(Z,Y), m��(X,Z)).
�ona(X,Y) :- kobieta(X), m�czyzna(Y), (ma��e�stwo(X,Y);ma��e�stwo(Y,X)).
te�ciowa(X,Y) :- kobieta(X), kobieta(Z), �ona(Z,Y), rodzic(X,Z).
