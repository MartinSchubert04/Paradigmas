/*
Ejercicio 5: Dado el predicado inversible padre/2 definir los predicados abuelo/2, hermano/2 y ancestro/2

El siguiente predicado hermano es inversible?
hermano(Uno, Otro) :- padre(Alguien,Uno), Uno \= Otro, padre(Alguien,Otro).

Como serían los predicados de Primo? Y de Tio?
*/
padre(hijo, padre).
hermano(Uno, Otro) :- padre(Alguien,Uno), Uno \= Otro, padre(Alguien,Otro).
primo(X, Y) :- padre(X, PadreX), padre(Y, PadreY), hermano(PadreX, PadreY).
tio(X, Y) :- padre(X, PadreX), hermano(PadreX, Y).