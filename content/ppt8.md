<!-- Slide number: 1 -->
# Paradigmas de Programación

<!-- Slide number: 2 -->
# Paradigmas de Programación
Paradigma de programación Lógico
Todo paradigma brinda un marco conceptual para resolver problemas, modelar estructuras de datos y generar algoritmos.
En el caso del paradigma lógico, se tiene una base de conocimiento que define el alcance, lo que forma el universo reconocido y el desconocido.
Se expresa mediante predicados, con aridad/1 (monádicos) se arma la base de conocimiento, expresando características o atributos de los individuos.
Los individuos son los elementos que forman parte del universo posible de predicados.

<!-- Slide number: 3 -->
# Paradigmas de Programación
Paradigma de programación Lógico
Al igual que el paradigma funcional, se utiliza la inferencia que permite derivar conclusiones a partir de las premisas, usando un motor de inferencia.
A diferencia del Haskell, cada consulta realizada debe terminar con un punto. Se puede escribir consultas de mas de una línea, solo se “ejecuta” cuando se utiliza el punto.
En resumen, una aplicación del Paradigma Lógico es una solución declarativa compuesta por:
Declaración de conocimiento via predicados
Consultas al motor de inferencias para sacar conclusiones.

<!-- Slide number: 4 -->
# Paradigmas de Programación
Paradigma de programación Lógico
Principio de Universo Cerrado
Al realizar un consulta sobre un individuo que no está en la base de conocimiento, se puede ver:
La afirmación consultada es FALSA
La afirmación consultada es DESCONOCIDAD
Si se tiene tres estados Verdadera, False y Desconocida  Universo Abierto
Si se considera a todo lo desconocido como FALSO  Universo Cerrado (Prolog, entre otros)
Todos los hechos son falsos si no están en la base de conocimiento.

<!-- Slide number: 5 -->
# Paradigmas de Programación
Paradigma de programación Lógico
Predicados poliádicos
come(juan, ravioles).come(brenda, fideos).gusta(brenda, fideos).
Un conjunto  de hechos para un mismo predicado forma una definición por extensión del predicado.
Se debe respetar el orden de la definición cuando se realiza las consultas.
En las consultas se puede usar variables
? come(_ Pastas)
Ante múltiples respuestas, con . o Enter se termina la consulta y con n o ; se piden las próximas respuestas.

<!-- Slide number: 6 -->
# Paradigmas de Programación
Paradigma de programación Lógico
Las consultas pueden ser de dos tipos:
Aquellas usadas para determinar si una relación específica se satisface o no, al instanciar todos los argumentos. (True / False)
Las existenciales, que permiten conocer los individuos que satisfacen una relación, o sea con algún argumento libre.
Un predicado es invertible cuando admite consultas con variables libres para sus argumentos.
Los predicados no devuelven valores. Una variable se transforma en incógnita que puede tener uno o mas valores.

<!-- Slide number: 7 -->
# Paradigmas de Programación Lógico
Resolver un problema para una librería
¿Es cierto que alguien escribió una determinada obra?
¿Quién o quienes escribieron una obra?
¿Qué obra escribió cierta persona?
Si es cierto que cierta persona escribió alguna obra, sin importar cual.
Si es cierto que cierta obra existe.

<!-- Slide number: 8 -->
# Paradigmas de Programación Lógico
Ingresar a: https://swish.swi-prolog.org/
Base de Conocimiento
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

<!-- Slide number: 9 -->
# Paradigmas de Programación Lógico
Resolver un problema para una librería
¿Es cierto que alguien escribió una determinada obra?
escribio (alanMoore , watchmen).	 True
escribio (alanMoore, elPadrino).	 False
Quién o quienes escribieron una obra
escribio (Artista, watchmen).  	 alanMoore.
escribio (Artista, buenosPresagios).  neilGaiman (r ó ;) terryPratchett.
Qué obra escribió cierta persona
escribio (isaacAsimov, Obra).   {Varias respuestas}.
Si es cierto que cierta persona escribió alguna obra, sin importar cual
escribio(jorgeLuisBorges, _).
Si es cierto que cierta obra existe
escribio(_, it).
NOTA: Las variables en prolog van en mayusculas

<!-- Slide number: 10 -->
# Paradigmas de Programación
Paradigma de programación Lógico
Se platea en principio como relacional.
Establece relaciones entre elementos
No se compara con el paradigma funcional y dependerá del problema a resolver
Se trabaja con predicados
Cada oración con escribio son clausulas.
Dan información sobre los individuos simples (átomos) (No son strings)
Todos empiezan con minusculas.
Se trabaja con consultas
Consultas individuales  (Sobre un individuo)  Bool
Consultas existenciales  (Existe alguien/algo)  Bool
Prolog responde cosas y no devuelve resultados/cosas

<!-- Slide number: 11 -->
# Paradigmas de Programación
Se trabaja con consultas
Al usar variables siempre se hace preguntas sobre Existe Persona o Alguien.
Esto se logra gracias a la propiedad de Inversibilidad
Se pueden usar variables dentro de las consultas.
Se puede extender la base de datos
Es Comic?
esComic(sandman)
esComic(cienBalas)
esComic(watchman)
esComic(planetary)
esComic(elCaballeroOscuroRegresa)
esComic(batmanAnioUno)

<!-- Slide number: 12 -->
# Paradigmas de Programación
Se trabaja con consultas
esComic(rayuela)  False (No esta en la BdC)
esComic(_)  True  (Porque hay comics en la BdC)
esComic(Obra)  Devuelve una obra.
Propiedades y Relaciones

![](Picture2.jpg)

<!-- Slide number: 13 -->
# Paradigmas de Programación
EsArtistaDeNovenoArte?
P => R  y  P ^ Q => R
Es equivalente R <= P ^ Q
Se declara que es artista de noveno arte si es artista y escribió un comic
esArtistaDeNovenoArte :- escribio(Artista, Obra), esComic(Obra).
Tipos de Variables
Libres : Artista
Ligada o Unificada: Obra

<!-- Slide number: 14 -->
# Paradigmas de Programación
Los predicados relacionan Individuos
Un predicado con Aridad 1 es una Propiedad
Con Aridad mayor a 1 es una Relación

La Base de Conocimiento está formada por Cláusulas que componen un Predicado.
Una Cláusula puede ser un Hecho o una Regla

Las consultas no devuelven nada. Solo tienen un valor de Verdad asociado (V o F)
Se puede consultar si ciertos individuos cumplen cierta propiedad o una relación (Consulta Individual) o bien se puede consultar si existe algún individuo que cumpla algo (Consulta Existencial)
Resumen:
Individuo
Simple
Átomo
Número
Compuesto
Lista
Functor
Predicado
Propiedad
Relación
Clausula
Hecho (Axioma)
Regla
Consulta
Individual
Existencial

<!-- Slide number: 15 -->
# Paradigmas de Programación
Conceptos Básicos

![](Picture2.jpg)

<!-- Slide number: 16 -->
# Paradigmas de Programación Lógico
Relaciones

Propiedades

![](Picture3.jpg)

![](Picture4.jpg)

![](Picture6.jpg)

![](Picture5.jpg)

<!-- Slide number: 17 -->
# Paradigmas de Programación
Consultas sobre la Base de Conocimiento

![](Picture2.jpg)
Consulta Individual
Consulta Existencial

<!-- Slide number: 18 -->
# Paradigmas de Programación
Ligar variables y unificación

![](Picture2.jpg)
? maestro(Mestre, Discipulo).
Mestre= socrates, Discipulo=platon;
Mestre=platón, Discipulo=aristoteles;
false.

INVERTIBILIDAD: Capacidad de ligar a una variable un individuo.

No siempre es posible tener la invertibilidad. Ej = predicado odia.
odia(platon, diogenes).
odia(diogenes, _).

? Odia(diogenes, platon)  true.
? Odia (Alguien, platon)  diogenes.
? Odia(diogenes, Alguien)  true.

<!-- Slide number: 19 -->
# Paradigmas de Programación Lógico
Aritmética
%siguiente(Anterior, Siguiente)
siguiente(N, N+1)
? siguiente(41, Siguiente)
Siguiente = 41 + 1
Modificación “is”
siguiente(N, S) :- S is N+1.
? siguiente(41, Siguiente)
Siguiente = 42
?siguiente(41,43)
False
?siguiente(Anterior, 42).
Da error: “is” no es inversible
Hay un elemento no ligado que hace imposible hacer la operación	siguiente(N, S) :- S is N + 1

<!-- Slide number: 20 -->
# Paradigmas de Programación Lógico
Backtracking
siguiente(N,S) :- numero(N), S is N + 1.
(Generar para ligar e invertir)
Con numero() una función inversible, o sea que puede ligarse a por ejemplo al valor 1, quedando
Siguiente(N,42):- numero(1), 42 is 1+1 que es erroneo. Vuelve a ligar a N con 2 y asi hasta llegar a ligar a N con 41 dando el resultado correcto.     A ESTE PROCESO DE PRUEBA y ERROR se lo conoce como BACKTRACKING

<!-- Slide number: 21 -->
# Paradigmas de Programación Lógico
Cuantificador Universal
forall/2

forall(habitat(Animal, Bioma), templado(Bioma))

![](Picture2.jpg)

![](Picture4.jpg)

![](Picture5.jpg)

<!-- Slide number: 22 -->
# Paradigmas de Programación Lógico
Ejercicio 1: Resolver un problema para una consultora
¿Es cierto que alguien programa en Cobol?
¿Quién o quienes programan en Cobol?
¿Qué lenguajes maneja María?
¿Maria y Mario son colegas?
¿Quienes son colegas de lenguajes?
BD:
programaEn(maria, cobol).
programaEn(maria, java).
programaEn(mario, cobol).
programaEn(mario, python).
programaEn(jose, cobol).
programaEn(jorge,java).
programaEn(jorge,python).

<!-- Slide number: 23 -->
# Paradigmas de Programación Lógico
Ejercicio 2: Se pide armar el árbol familiar Real Inglés, usando la relación “esHijoDe”
¿Es cierto que la reina Isabel tiene hijos?
¿Quién o quienes son hijos de la reina Isabel?
¿Quiénes son los nietos del Carlos III?
¿Es cierto que Archie es primo del príncipe Jorge?
¿Quienes son primos?
BD:
esHijoDe(carlosIII, isabelII).
esHijoDe(ana, isabelII).
esHijoDe(andrew, isabelII).
esHijoDe(edward, isabelII).
esHijoDe(henry, carlosII).
……….

![](Picture2.jpg)

<!-- Slide number: 24 -->
# Paradigmas de Programación Lógico
Ejercicio 3: Definir las reglas para resolver el siguiente problema:
En Haskell, la operación que está permitida sobre un tipo de dato depende de la TypeClass a la que pertenece. Cada type class tiene las siguientes operaciones permitidas.
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

<!-- Slide number: 25 -->
# Paradigmas de Programación Lógico
Ejercicio 4: Analizar la inversibilidad de los siguientes predicados:
%amigo(Uno, Otro)
amigo(nico, fernando).
amigo(axel, Persona) :- Amigo(Persona, nico).
amigo(alf, _).

%id(Algo, LoMismo).
id(X, X)

%mayorDeEdad(Persona)
mayorDeEdad(Persona) :- Edad > 18, edad(Persona, Edad).

<!-- Slide number: 26 -->
# Paradigmas de Programación Lógico
Ejercicio 5: Dado el predicado inversible padre/2 definir los predicados abuelo/2, hermano/2 y ancestro/2

El siguiente predicado hermano es inversible?
hermano(Uno, Otro) :- padre(Alguien,Uno), Uno \= Otro, padre(Alguien,Otro).

Como serían los predicados de Primo? Y de Tio?

<!-- Slide number: 27 -->
# Paradigmas de Programación Lógico
Ejercicio 6: Dado los siguientes partidos responder:
Los Equipos africanos hacen muchos goles (goles>2).
Hubo una goleada (>3) entre dos Equipos?.
BD:
partido(islandia,5,croacia,1).
partido(nigeria,0,argentina,1).
partido(croacia,0,argentina,6).
partido(brasil,5,costaRica,0).
partido(brasil,2,croacia,2).
continente(brasil,america).
continente(croacia,europa).
continente(argentina,america).
continente(costarica,america).
continente(islandia,europa).
continente(nigeria,africa).
descalificado(brasil).
descalificado(alemania).