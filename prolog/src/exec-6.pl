/*
Ejercicio 6: Dado los siguientes partidos responder:
Los Equipos africanos hacen muchos goles (goles>2).
Hubo una goleada (>3) entre dos Equipos?.
*/

partido(islandia,5,croacia,1).
partido(nigeria,0,argentina,1).
partido(croacia,0,argentina,6).
partido(brasil,5,costaRica,0).
partido(brasil,2,croacia,2).
partido(senegal,5,croacia,1).
continente(brasil,america).
continente(croacia,europa).
continente(argentina,america).
continente(costarica,america).
continente(islandia,europa).
continente(nigeria,africa).
continente(senegal,africa).
descalificado(brasil).
descalificado(alemania).

goleada(X, Y) :- 
    partido(X, GolesX, Y, GolesY), 
    GolesX - GolesY > 3.

goleada(X, Y) :- 
    partido(X, GolesX, Y, GolesY), 
    GolesY - GolesX > 3.

africanosConGoles(X) :- 
    continente(X, africa), 
    partido(X, Goles, _, _),  
    Goles > 2.

africanosConGoles(X) :- 
    continente(X, africa), 
    partido(_, _, X, Goles),   
    Goles > 2.