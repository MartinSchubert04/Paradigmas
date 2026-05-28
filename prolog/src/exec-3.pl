/*
Ejercicio 3: Definir las reglas para resolver el siguiente problema:
En Haskell, la operación que está permitida sobre un tipo de dato depende de la TypeClass a la que pertenece. 
Cada type class tiene las siguientes operaciones permitidas.
La consulta es puedo usar tal operación en tal clase?

Los Num pueden ser sumados, restados, multiplicados.
Los Fractional pueden ser divididos
A los show se los puede mostrar

Relaciones: 
    Los Int son Num y Show
    Los Float y Double son Fractional y Show
    Los Bool son solo Show
    Y todos los Fractional son Num

Utilizar operacionPermitida(Operación, ClaseTipo) y pertenece(Clase, ClaseTipo).
*/

operacionPermitida(num, sumados).
operacionPermitida(num, restados).
operacionPermitida(num, multiplicados).
operacionPermitida(fractional, divididos).

pertenece(int, num).
pertenece(num, show).

pertenece(float, fractional).
pertenece(double, fractional).
pertenece(fractional, num).
pertenece(fractional, show).

pertenece(bool, show).

% pertenece transitivo — hereda typeclasses de typeclasses
perteneceA(Tipo, Clase) :- pertenece(Tipo, Clase).
perteneceA(Tipo, Clase) :- pertenece(Tipo, Intermedio), perteneceA(Intermedio, Clase).

puedeHacer(X, Y) :- perteneceA(X, Class), operacionPermitida(Class, Y).


