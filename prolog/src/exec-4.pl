/*
Ejercicio 4: Analizar la inversibilidad de los siguientes predicados:
%amigo(Uno, Otro)
amigo(nico, fernando).
amigo(axel, Persona) :- Amigo(Persona, nico).
amigo(alf, _).

%id(Algo, LoMismo).
id(X, X)

%mayorDeEdad(Persona)
mayorDeEdad(Persona) :- Edad > 18, edad(Persona, Edad).

TODOS SON INVERSIBLES.
*/

amigo(nico, fernando).
amigo(axel, Persona) :- amigo(Persona, nico).
amigo(alf, _).

id(X, X).
edad(pepe, 18).
mayorDeEdad(Persona) :- Edad > 18, edad(Persona, Edad).