/*
Ejercicio 1: Resolver un problema para una consultora
    ¿Es cierto que alguien programa en Cobol?
        programaEn(_, cobol).
    ¿Quién o quienes programan en Cobol?
        programaEn(X, cobol).
    ¿Qué lenguajes maneja María?
        programaEn(maria, X).
    ¿Maria y Mario son colegas?
        colegas(maria, mario).
    ¿Quienes son colegas de lenguajes?
        colegas(maria, mario).
*/

programaEn(maria, cobol).
programaEn(maria, java).
programaEn(mario, cobol).
programaEn(mario, python).
programaEn(jose, cobol).
programaEn(jorge,java).
programaEn(jorge,python).

colegas(X, Y) :- programaEn(X, Lang),  programaEn(Y, Lang).
