# Universidad de San Martín – EcyT

## Final de Paradigmas de Lenguajes de Programación

**Fecha:** 11-Dic-2024

1. Enumere las características principales de los lenguajes que pertenecen al paradigma funcional. ¿Cuáles son las extensiones que se les agregó a Haskell? Y en que paradigma derivaron la mayoría de dichos lenguajes.

>

2. ¿Cuáles son las diferencias entre el lenguaje Haskell y Prolog? Enumere por lo menos 5 diferencias.

   > Las diferencias son:
   >
   > - Haskell esta basado en el paradigma funcional y Prolog en el logico
   > - Haskell declara funciones y al ejecutar el codigo este da el output en cambio Prolog se realizan consulta en tiempo de ejecucion a una base de conocimientos
   > - Haskell posee un motor de inferencia de tipos para deducir en tiempo de compilacion en base a operadores e implementaciones de la funciones declaradas. Prolog posee un motor de inferencia en el sentido de poder relacionar objetos con los hechos y reglas establecidos
   > - Haskell es determinista una funcion devuelve siempre el mismo valor en cambio prolog puede tener varios valores de salida
   > - Mutabilidad de la base de datos: en Haskell no existe forma de modificar "el programa" en tiempo de ejecución; en Prolog, assert/retract permiten modificar la base de conocimiento mientras el programa corre.

3. Indique la relación que existe entre las TypeClasses de Haskell y las Clases en Prolog. Enumere 3 TypeClasses de Haskell y para cada una de ellas enumere dos Clases que las usan.

> Las TypeClasses de haskell declaran comportamientos para que puedan implementarse de forma polimorfica y las clases en prolog, se asignan como propiedades a un objeto del mismo modo que muchos pueden compartir esta propiedad
>
> - Eq (igualdad) - la usan Int y String
> - Num (aritmetica) - la usan Int y Float
> - Ord (ordenamiento) - la usan Int y Char

4. ¿Cuál es la diferencia entre el operador "=" y la Unificación en el lenguaje Prolog?

   > El "=" en prolog es la declaracion explicita de una union mientras que la unificacion es algo que todo el tipo el motor esta realizacion, desde que se declaran los predicados hasta cuando se realizan consultas, todo el tiempo el motor verifica relaciones e intenta realizar ligamientos al momento de las consultas (en caso de fallar realiza backtracking)

5. ¿A qué se denomina Orden Superior y cuál es la relación que tiene con las funciones MAP y ELEM?

   > Orden superior es cuando una funcion utiliza otras funciones como parametro o retorna funciones, el caos de MAP y ELEM, es que a estas se les puede pasar una funcion condicion en el caso de MAP para que transforme los datos en base a esta funcion. El caso de ELEM se le puede pasar una funcion para determinar que valores existen en una lista

6. El pattern matching se utiliza en el motor de inferencia de Haskell, ¿en Prolog también? Explique qué es y qué relación tiene con las variables libres.
   > El pattern matching es un mecanismo que compara la estructura de dos términos (o de un término contra un patrón) para ver si coinciden. Si tienen la misma forma (mismo functor y misma aridad), se comparan recursivamente sus componentes; las variables presentes se ligan al valor correspondiente del otro lado para que la coincidencia sea posible.
