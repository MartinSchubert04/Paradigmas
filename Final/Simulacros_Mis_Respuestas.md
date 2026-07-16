# Mis Respuestas — Simulacros de Final

Completá tus respuestas debajo de cada pregunta, en el espacio marcado `> Tu respuesta:`. No mires `Simulacros_Final_Formato_Real.md` (ahí está la guía de corrección) hasta terminar el simulacro que estés rindiendo.

Cuando termines un simulacro (o una pregunta puntual), decime algo como "corregime el simulacro 2" o "corregime la pregunta 5 del simulacro 4" y te doy feedback comparando contra la guía.

Tip: cronometrate — 25-30 min por pregunta, como en el final real.

---

## Simulacro 1 — Calentamiento

**1.** Enumere las características principales de los lenguajes que pertenecen al paradigma funcional. ¿Qué agrega el sistema de TypeClasses sobre el cálculo lambda original, y de qué paradigma matemático deriva Haskell?

> Tu respuesta:
> Las principales caracteristicas son que no existe la asignacion destructiva y todo se crontruye en base a funciones. Deriva de la composicion de funciones ej: f x g | f(g())

**2.** ¿Cuáles son las diferencias entre el lenguaje Haskell y Prolog? Enumere por lo menos 5 diferencias.

> Tu respuesta:
>
> 1. Uno es del paradigma funcional y otro del paradigma logico
> 2. ...

**3.** Indique la relación que existe entre las TypeClasses de Haskell y las Clases (predicados monádicos) en Prolog. Enumere 3 TypeClasses de Haskell y para cada una de ellas enumere dos tipos o predicados que las usan.

> Tu respuesta:
> Las type classes crean un polimorfismo para aquellas que implementensus funciones y comparte las carateristicas asi como los predicados permiten asociar una caracteristica con ese valor "x". Tres serian Num, Eq y Show. Num es utilizada por float e double para realizar operaciones, Eq es implementada por strings y tambien por float o tipos aritmeticos para poder realizar comparaciones, y show es utilizada para strings y numeros para poder ser impresos en la terminal como

**4.** ¿Cuál es la diferencia entre el operador "=" y la Unificación en el lenguaje Prolog?

> Tu respuesta:
> El operador igual "=" se utiliza generalmente para asiganar un valor a una dada variable o reemplazar el de la misma, en cambio la unificacion crea una relacion estre un objeto y una propiedad o regla sin capacidad destructiva

**5.** ¿A qué se denomina Orden Superior y qué relación tiene con las funciones MAP y ELEM?

> Tu respuesta:
> Orden superior es aquella funcion que utiliza otra funcion como parametro y la aplica a otros parametros o variables que utilize la funcion, en el caso de MAP esta permite a una lista transformala en base a un filtro como funcion por ejemplo o el caso elem que te permite saber si un elemento esta dentro de una lista

**6.** El Pattern Matching se utiliza en el motor de inferencia de Haskell, ¿se utiliza también en Prolog? Explique qué es y qué relación tiene con las variables libres.

> Tu respuesta:
> SI se utiliza para permitir una busqueda en la base de conocimientos cuando se realiza una consulta para saber si una relacion existe, esto se itera de arriba hacia abajo para hallar en caso de que exista un valor que cumpla tambien ayudandose del backtracking que permite re iterar estos fallos. Las varables libres se utilizan para hallar estos valores que cumplan, entonces el motor itera con el pattermatching y backtraking para hallar estos "x" que cumplen con la relacion

---

## Simulacro 2 — Paradigma Lógico y sus fundamentos

**1.** Enumere las características principales de los lenguajes que pertenecen al paradigma lógico. ¿De qué rama de la lógica formal deriva Prolog y qué es el motor de inferencia?

> Tu respuesta: Las caracteristicas son que poseen una base de conocimiento establecida con predicado y reglas, no exista la asignacion si no mas bien la unificacion que liga valores con estos hechos / reglas. Prolog deriva del algebra de Bool en matematicas. Un motor de inferencia es una implementacion que permite al lenguaje intuir los tipos utilizados en el programa basandose en los operadores utilizados y las funciones que lo implementan

**2.** ¿Cuáles son las diferencias entre la Aplicación Parcial y la Composición de Funciones en Haskell? Enumere por lo menos 4 diferencias.

> Tu respuesta: Aplicacion parcial es cuando se crea una funcion nueva en base a una previa pero con menos parametros para asi poder reutilizarla con parametros "fijos" y ahora a la nueva se la utiliza con menos parametros para evitar repetir codigo y la compocision de funciones se determina con la separacion de un "." se lee de derecha a izquierda, y el output de una pasa a la siguiente, asi tranformados el valor de forma secuencial de derecha a izquierda. Las diferencias son que, uno se implementa para clean code y el otro para una facilida a la hora de tranformar valores, en uno se crea una nueva funcion para el mecanismo y el otro se utilizan funciones ya declaradas, no se me ocurren mas

**3.** Indique la relación que existe entre las Tuplas/Data de Haskell y las estructuras compuestas (functor + aridad) de Prolog. Enumere 3 formas de construir datos en Haskell y para cada una indique el equivalente en Prolog.

> Tu respuesta: Las tuplas y los Data son una agrupacion de datos al mismo tiempo que las estructuras compuestas se encargan ligar valores con propiedades o caracteristicas compartidas, por lo cual realizan el agrupamiento al igual. En haskell se puede ... no se

**4.** ¿Cuál es la diferencia entre el operador "is" y el operador "=" en Prolog?

> Tu respuesta: El "=" en prolog es la declaracion explicita de la unificacion entre un valor y una variable, en cambio "is" es la forma aritmetica que utiliza prolog para asignar valores numericos a variables, "is" esta seguido siempre de una expresion aritmetica

**5.** ¿A qué se denomina Recursividad y qué relación tiene con las funciones foldr y foldl?

> Tu respuesta: Recursividad es la aplicacion de una funcion de forma reiterada sobre los valores que modifica, una vez llegado a el "caso base" que defina la funcion, se empezara a a volver iteradamente hacia atras en lo que a llamadas a si misma refiere, sacandolas del stack. La relacion con las funciones foldr y foldl es que estas reducen una lista de forma recusiva sobre la misma, aplicando la misma funcion una y otra vez.

**6.** El concepto de Orden Superior es central en Haskell, ¿existe algo equivalente en el paradigma lógico? Explique y relacione su respuesta con los functores y la aridad de los predicados.

> Tu respuesta: Si existe pero es implementado por funciones nativas del lenguajes en el caso de prolog, donde se tiene una regla que toma otras como para metros y las aplica sobre los valores. La relacion viene de que va a utilizar un functor como para metro y ese mismo debe tener la capacidad de tomar un valor por lo cual ambos deben ser aridad 2 (no estoy seguro de esta respuesta este bien)

---

## Simulacro 3 — Declarativo, evaluación y estructuras

**1.** Enumere las características principales del paradigma declarativo. ¿Cómo lo materializan de forma distinta Haskell y Prolog, y en qué paradigma más general se apoyan ambos?

> Tu respuesta:

**2.** ¿Cuáles son las diferencias entre una Tupla y un Data en Haskell? Enumere por lo menos 3 diferencias.

> Tu respuesta:

**3.** Indique la relación que existe entre las Guardas (`|`) de Haskell y las condiciones aritméticas dentro de las reglas de Prolog. Enumere 3 guardas típicas de Haskell y para cada una indique cómo se expresaría esa misma condición dentro de una regla de Prolog.

> Tu respuesta:

**4.** ¿Cuál es la diferencia entre Aplicación Parcial y Currificación (currying) en Haskell?

> Tu respuesta:

**5.** ¿A qué se denomina Evaluación Lazy y qué relación tiene con funciones como take y con las listas infinitas?

> Tu respuesta:

**6.** La Evaluación Lazy es propia de Haskell, ¿se aplica también en Prolog? Explique qué es y relacione su respuesta con el mecanismo de backtracking.

> Tu respuesta:

---

## Simulacro 4 — Consultas, inversibilidad y listas

**1.** Enumere las características principales de los lenguajes multiparadigma (híbridos). Dé dos ejemplos y para cada uno indique de qué paradigmas derivan sus construcciones principales.

> Tu respuesta:

**2.** ¿Cuáles son las diferencias entre una consulta individual y una consulta existencial en Prolog? Enumere por lo menos 3 diferencias.

> Tu respuesta:

**3.** Indique la relación que existe entre las funciones de lista de Haskell (map, filter, head, tail) y los predicados de lista de Prolog (member, length, append, reverse). Enumere 3 funciones de Haskell y para cada una indique el predicado de Prolog más parecido.

> Tu respuesta:

**4.** ¿Cuál es la diferencia entre el operador "=" (unificación) y el operador "==" (comparación) en Prolog?

> Tu respuesta:

**5.** ¿A qué se denomina Inversibilidad de un predicado y qué relación tiene con la Unificación? Dé un ejemplo con el predicado padre/2.

> Tu respuesta:

**6.** La Recursividad existe en Haskell sobre funciones, ¿funciona de la misma manera en Prolog sobre predicados? Explique y relacione el caso base de una función recursiva con el hecho (fact) base de un predicado recursivo.

> Tu respuesta:

---

## Simulacro 5 — Tipos, control y motor de inferencia

**1.** Enumere las características principales del sistema de tipos de Haskell. ¿Qué le agregan las TypeClasses al tipado, y de qué paradigma (o teoría) derivan los fundamentos del tipado en Haskell?

> Tu respuesta:

**2.** ¿Cuáles son las diferencias entre Evaluación Lazy y Evaluación Eager? Enumere por lo menos 4 diferencias.

> Tu respuesta:

**3.** Indique la relación que existe entre findall/bagof/setof de Prolog y las funciones de orden superior de Haskell que devuelven colecciones (map, filter). Enumere los 3 predicados de Prolog mencionados y para cada uno indique con qué combinación de funciones de Haskell se lograría un resultado equivalente.

> Tu respuesta:

**4.** ¿Cuál es la diferencia entre el corte (`!`, cut) y la negación como fallo (`\+`) en Prolog?

> Tu respuesta:

**5.** ¿A qué se denomina Transparencia Referencial y qué relación tiene con el Principio de Sustitución?

> Tu respuesta:

**6.** Prolog no tiene declaración explícita de tipos como Haskell, ¿existe algún mecanismo que cumpla un rol parecido? Explique y relacione su respuesta con los predicados var/1, atom/1, number/1 y compound/1.

> Tu respuesta:

---

## Simulacro 6 — Síntesis final / repaso integral

**1.** Enumere las características principales de Prolog como lenguaje basado en cláusulas de Horn. ¿De qué mecanismo de la lógica formal deriva la resolución de consultas y cómo se llama el componente que la ejecuta?

> Tu respuesta:

**2.** ¿Cuáles son las diferencias entre la Unificación y la Asignación destructiva ("=" de los lenguajes imperativos)? Enumere por lo menos 3 diferencias y explique por qué Prolog eligió unificación en lugar de asignación.

> Tu respuesta:

**3.** Indique la relación que existe entre las funciones recursivas típicas de Haskell (factorial, fibonacci, longitud de una lista) y los predicados recursivos de Prolog. Enumere 3 de esas funciones de Haskell y para cada una escriba el nombre y la aridad del predicado de Prolog equivalente.

> Tu respuesta:

**4.** ¿Cuál es la diferencia entre findall/3, bagof/3 y setof/3 en Prolog?

> Tu respuesta:

**5.** ¿A qué se denomina Point-Free Style y qué relación tiene con el operador de Composición (`.`)?

> Tu respuesta:

**6.** Prolog permite modificar la base de conocimiento en tiempo de ejecución con assert/retract, ¿esto rompe algún principio que sí se respeta en Haskell? Explique y relacione su respuesta con la Transparencia Referencial y con el operador "=".

> Tu respuesta:

---

## Registro de notas (opcional)

| Simulacro | Fecha rendido | Nota aprox. | Temas a repasar |
| --------- | ------------- | ----------- | --------------- |
| 1         |               |             |                 |
| 2         | 2026-07-13    | 16/30       | Motor de inferencia vs. inferencia de tipos; deriva lógico (cláusulas de Horn, no álgebra de Bool); tuplas/data ↔ estructuras compuestas Prolog; orden superior en Prolog |
| 3         |               |             |                 |
| 4         |               |             |                 |
| 5         |               |             |                 |
| 6         |               |             |                 |
