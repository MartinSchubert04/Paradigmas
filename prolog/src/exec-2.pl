/*
Ejercicio 2: Se pide armar el árbol familiar Real Inglés, usando la relación “esHijoDe”
    ¿Es cierto que la reina Isabel tiene hijos?	
        esHijoDe(_, isabelII).
    ¿Quién o quienes son hijos de la reina Isabel?
        esHijoDe(x, isabelII).
    ¿Quiénes son los nietos del Carlos III?
        esHijoDe(x, carlosIII).
    ¿Es cierto que Archie es primo del príncipe Jorge?
        esPrimoDe(archie, jorge).
    ¿Quienes son primos?
        esPrimoDe(X, Y).
*/

esHijoDe(carlosIII, isabelII).
esHijoDe(ana, isabelII).
esHijoDe(andrew, isabelII).
esHijoDe(edward, isabelII).
esHijoDe(henry, carlosIII).
esHijoDe(archie, henry).
esHijoDe(willy, carlosIII).
esHijoDe(jorge, willy).

x = 4.
x = 2.


esNietoDe(X, Y) :- esHijoDe(X, Z), esHijoDe(Z, Y).
esPrimoDe(X, Y) :- esNietoDe(X, Z), esNietoDe(Y, Z), esHijoDe(X, PadreX), esHijoDe(Y, PadreY), PadreX \= PadreY.