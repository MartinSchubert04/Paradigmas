/*
* Resolver un problema para una librería
*  ¿Es cierto que alguien escribió una determinada obra?
*       - escribio(stephenKing, it) -> true
*       - escribio(stephenKing, socorro) -> false
*  ¿Quién o quienes escribieron una obra?
*       - escribio(X, it) -> stephenKing
*       - escribio(X, watchmen) -> alanMoore
*  ¿Qué obra escribió cierta persona?
*       - escribio(elsaBornemann, Obra) -> socorro
*  Si es cierto que cierta persona escribió alguna obra, sin importar cual.
*       - escribio(elsaBornemann, _) -> true
*  Si es cierto que cierta obra existe.
*       - escribio(_, it) -> true
*/

escribio (elsaBornemann, socorro).
escribio (neilGaiman, sandman).
escribio (alanMoore, watchmen).
escribio (neilGaiman, americanGods).
escribio (neilGaiman, buensoPresagios).
escribio (terryPratchett, buensoPresagios).
escribio (brianAzarello, cienBalas).
escribio (warenElis, planetary).
escribio (frankMiller, elCaballeroOscuroRegresa).
escribio (frankMiller, batmanAnioUno).
escribio(isaacAsimov, fundacion).
escribio(isaacAsimov, yoRobot).
escribio(isaacAsimov, elFinDeLaEternidad).
escribio(isaacAsimov, laBusquedaDeLosElementos).
escribio(joseHernandez, martinFierro).
escribio(stephenKing, it).
escribio(stephenKing, misery).
escribio(stephenKing, carrie).
escribio(stephenKing, elJuegoDeGerald).
escribio(julioCortazar, rayuela).
escribio(jorgeLuisBorges, ficciones).
escribio(jorgeLuisBorges, elAleph).
escribio(horacioQuiroga, cuentosDeLaSelva).
escribio(horacioQuiroga, cuentosDeLocuraAmorYMuerte).


escritoPor(Y, X) :- escribio(X, Y). 

