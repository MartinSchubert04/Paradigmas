# Simulacros de Final — Paradigmas de Lenguajes de Programación

## Modelados sobre el formato real del final (11-Dic-2024)

---

## 0. Cómo está armado el final real (análisis del formato)

Antes de los simulacros, así es el "molde" que usa el profesor, extraído de `final.md`:

- **6 preguntas de desarrollo, sin incisos (a, b, c...)** — a diferencia de los parciales (que van por secciones General/Funcional/Lógico con muchos incisos cortos), el final son 6 preguntas compuestas, cada una de varias oraciones.
- **Casi ninguna pregunta pide solo "definir"**: cada una pide **relacionar** dos conceptos, casi siempre cruzando Haskell ↔ Prolog, o dos construcciones dentro del mismo lenguaje que se prestan a confusión.
- **Verbos y fórmulas que se repiten:**
  - "Enumere las características principales de..."
  - "¿Cuáles son las diferencias entre... ? Enumere por lo menos N..."
  - "Indique la relación que existe entre X e Y. Enumere N de X y para cada una enumere M de Y" (enumeración **anidada**)
  - "¿Cuál es la diferencia entre el operador/concepto A y B?"
  - "¿A qué se denomina X y qué relación tiene con Y (funciones puntuales)?"
  - "¿[Concepto propio de un paradigma] se usa también en el otro paradigma? Explique qué es y qué relación tiene con Z."
- **Estructura fija de 6 preguntas (lo que siempre aparece, en algún orden):**
  1. Características de un paradigma/familia de lenguajes + de dónde deriva o qué extensiones tiene.
  2. Diferencias generales Haskell vs Prolog (comparación amplia, cuantificada).
  3. Puente conceptual puntual entre una construcción de Haskell y una de Prolog, con enumeración anidada (3 de un lado, 2 de cada uno del otro lado).
  4. Distinción fina **dentro de un mismo lenguaje** entre dos cosas que se confunden (ej. `=` vs Unificación).
  5. Definición de un término + relación con funciones concretas nombradas (MAP, ELEM, foldr, etc.).
  6. Pregunta "puente de aplicabilidad": un concepto típico de un paradigma, ¿existe/aplica también en el otro? + definirlo + relacionarlo con otro concepto (ej. variables libres).
- **No pide escribir programas largos.** El foco es 100% conceptual/relacional — el profesor evalúa si entendés las conexiones entre paradigmas, no si sabés programar de memoria.

Los 6 simulacros de abajo repiten exactamente esta estructura (mismas 6 "ranuras" en cada examen), cambiando el contenido puntual para cubrir todo el programa. El **Simulacro 1** es el más parecido al final real (mismos temas, redactado distinto). Los simulacros 2 a 6 cubren el resto del programa con la misma lógica de preguntas.

**Cómo usarlos:** resolvé cada simulacro a libro cerrado, 25-30 min por pregunta, y recién después mirá la guía de respuestas (Parte 2, al final del documento).

---

## PARTE 1 — Los 6 simulacros

---

### Simulacro 1 — Calentamiento (más cercano al final real)

1. Enumere las características principales de los lenguajes que pertenecen al paradigma funcional. ¿Qué agrega el sistema de TypeClasses sobre el cálculo lambda original, y de qué paradigma matemático deriva Haskell?
2. ¿Cuáles son las diferencias entre el lenguaje Haskell y Prolog? Enumere por lo menos 5 diferencias.
3. Indique la relación que existe entre las TypeClasses de Haskell y las Clases (predicados monádicos) en Prolog. Enumere 3 TypeClasses de Haskell y para cada una de ellas enumere dos tipos o predicados que las usan.
4. ¿Cuál es la diferencia entre el operador "=" y la Unificación en el lenguaje Prolog?
5. ¿A qué se denomina Orden Superior y qué relación tiene con las funciones MAP y ELEM?
6. El Pattern Matching se utiliza en el motor de inferencia de Haskell, ¿se utiliza también en Prolog? Explique qué es y qué relación tiene con las variables libres.

---

### Simulacro 2 — Paradigma Lógico y sus fundamentos

1. Enumere las características principales de los lenguajes que pertenecen al paradigma lógico. ¿De qué rama de la lógica formal deriva Prolog y qué es el motor de inferencia?
2. ¿Cuáles son las diferencias entre la Aplicación Parcial y la Composición de Funciones en Haskell? Enumere por lo menos 4 diferencias.
3. Indique la relación que existe entre las Tuplas/Data de Haskell y las estructuras compuestas (functor + aridad) de Prolog. Enumere 3 formas de construir datos en Haskell y para cada una indique el equivalente en Prolog.
4. ¿Cuál es la diferencia entre el operador "is" y el operador "=" en Prolog?
5. ¿A qué se denomina Recursividad y qué relación tiene con las funciones foldr y foldl?
6. El concepto de Orden Superior es central en Haskell, ¿existe algo equivalente en el paradigma lógico? Explique y relacione su respuesta con los functores y la aridad de los predicados.

---

### Simulacro 3 — Declarativo, evaluación y estructuras

1. Enumere las características principales del paradigma declarativo. ¿Cómo lo materializan de forma distinta Haskell y Prolog, y en qué paradigma más general se apoyan ambos?
2. ¿Cuáles son las diferencias entre una Tupla y un Data en Haskell? Enumere por lo menos 3 diferencias.
3. Indique la relación que existe entre las Guardas (`|`) de Haskell y las condiciones aritméticas dentro de las reglas de Prolog. Enumere 3 guardas típicas de Haskell y para cada una indique cómo se expresaría esa misma condición dentro de una regla de Prolog.
4. ¿Cuál es la diferencia entre Aplicación Parcial y Currificación (currying) en Haskell?
5. ¿A qué se denomina Evaluación Lazy y qué relación tiene con funciones como take y con las listas infinitas?
6. La Evaluación Lazy es propia de Haskell, ¿se aplica también en Prolog? Explique qué es y relacione su respuesta con el mecanismo de backtracking.

---

### Simulacro 4 — Consultas, inversibilidad y listas

1. Enumere las características principales de los lenguajes multiparadigma (híbridos). Dé dos ejemplos y para cada uno indique de qué paradigmas derivan sus construcciones principales.
2. ¿Cuáles son las diferencias entre una consulta individual y una consulta existencial en Prolog? Enumere por lo menos 3 diferencias.
3. Indique la relación que existe entre las funciones de lista de Haskell (map, filter, head, tail) y los predicados de lista de Prolog (member, length, append, reverse). Enumere 3 funciones de Haskell y para cada una indique el predicado de Prolog más parecido.
4. ¿Cuál es la diferencia entre el operador "=" (unificación) y el operador "==" (comparación) en Prolog?
5. ¿A qué se denomina Inversibilidad de un predicado y qué relación tiene con la Unificación? Dé un ejemplo con el predicado padre/2.
6. La Recursividad existe en Haskell sobre funciones, ¿funciona de la misma manera en Prolog sobre predicados? Explique y relacione el caso base de una función recursiva con el hecho (fact) base de un predicado recursivo.

---

### Simulacro 5 — Tipos, control y motor de inferencia

1. Enumere las características principales del sistema de tipos de Haskell. ¿Qué le agregan las TypeClasses al tipado, y de qué paradigma (o teoría) derivan los fundamentos del tipado en Haskell?
2. ¿Cuáles son las diferencias entre Evaluación Lazy y Evaluación Eager? Enumere por lo menos 4 diferencias.
3. Indique la relación que existe entre findall/bagof/setof de Prolog y las funciones de orden superior de Haskell que devuelven colecciones (map, filter). Enumere los 3 predicados de Prolog mencionados y para cada uno indique con qué combinación de funciones de Haskell se lograría un resultado equivalente.
4. ¿Cuál es la diferencia entre el corte (`!`, cut) y la negación como fallo (`\+`) en Prolog?
5. ¿A qué se denomina Transparencia Referencial y qué relación tiene con el Principio de Sustitución?
6. Prolog no tiene declaración explícita de tipos como Haskell, ¿existe algún mecanismo que cumpla un rol parecido? Explique y relacione su respuesta con los predicados var/1, atom/1, number/1 y compound/1.

---

### Simulacro 6 — Síntesis final / repaso integral

1. Enumere las características principales de Prolog como lenguaje basado en cláusulas de Horn. ¿De qué mecanismo de la lógica formal deriva la resolución de consultas y cómo se llama el componente que la ejecuta?
2. ¿Cuáles son las diferencias entre la Unificación y la Asignación destructiva ("=" de los lenguajes imperativos)? Enumere por lo menos 3 diferencias y explique por qué Prolog eligió unificación en lugar de asignación.
3. Indique la relación que existe entre las funciones recursivas típicas de Haskell (factorial, fibonacci, longitud de una lista) y los predicados recursivos de Prolog. Enumere 3 de esas funciones de Haskell y para cada una escriba el nombre y la aridad del predicado de Prolog equivalente.
4. ¿Cuál es la diferencia entre findall/3, bagof/3 y setof/3 en Prolog?
5. ¿A qué se denomina Point-Free Style y qué relación tiene con el operador de Composición (`.`)?
6. Prolog permite modificar la base de conocimiento en tiempo de ejecución con assert/retract, ¿esto rompe algún principio que sí se respeta en Haskell? Explique y relacione su respuesta con la Transparencia Referencial y con el operador "=".

---

---

## PARTE 2 — Guía de respuestas (puntos clave, no son la respuesta completa)

Están pensadas como checklist: si en tu respuesta escrita tocaste todos los puntos, vas bien encaminado. Desarrollalos con tus propias palabras y ejemplos de código en el examen real.

### Simulacro 1

**1.** Funcional: funciones puras, sin efectos secundarios, sin asignación destructiva, transparencia referencial, orden superior, tipado fuerte con inferencia. TypeClasses agregan polimorfismo acotado (ad-hoc) sobre el cálculo lambda tipado, que originalmente no tenía sobrecarga de operadores. Haskell deriva del cálculo lambda (Church); muchos lenguajes funcionales modernos (Scala, F#, Clojure) terminan derivando hacia multiparadigma, incorporando rasgos de OO/imperativo.

**2.** Ejemplos válidos: tipado estático vs dinámico/sin tipos explícitos; evaluación lazy vs eager (salvo backtracking); funciones puras vs predicados con backtracking; asignación inexistente en ambos pero Prolog "liga" variables vía unificación mientras Haskell solo evalúa expresiones; un resultado (valor) vs múltiples soluciones; transformación de datos vs consulta de relaciones; recursión explícita vs recursión + búsqueda con backtracking.

**3.** Relación: una TypeClass agrupa tipos que comparten comportamiento (una interfaz); un predicado monádico (aridad 1) en Prolog agrupa individuos que cumplen una propiedad — ambos son mecanismos de "clasificación por comportamiento/pertenencia". Ejemplos: `Eq` → usada por `Int`, `Bool`; `Ord` → usada por `Int`, `Char`; `Show` → usada por `Int`, listas. Del lado Prolog: `comic/1`, `mamifero/1` como "clases" de pertenencia.

**4.** `=` unifica dos términos (bidireccional, liga variables, puede fallar si no unifican); no es una asignación destructiva. La Unificación es el mecanismo general del que `=` es la forma explícita de invocarlo; también ocurre implícitamente al hacer matching de una consulta contra la cabeza de una cláusula.

**5.** Orden Superior: función que recibe y/o devuelve otra función. `map` aplica una función a cada elemento (orden superior porque recibe una función como argumento); `elem` verifica pertenencia de un valor en una lista — no es de orden superior en sí (no recibe función), pero se usa junto a `map`/`filter` en pipelines de orden superior, y su implementación puede expresarse con `foldr`/`any`.

**6.** Sí: Prolog usa Pattern Matching (vía unificación) para decidir qué cláusula aplica ante una consulta. Relación con variables libres: al hacer matching, las variables libres (no instanciadas) de la consulta o de la cláusula se **ligan** a los valores necesarios para que ambos términos coincidan — es la misma idea que en Haskell (destructurar `x:xs`), pero en Prolog puede fallar y disparar backtracking, y puede ligar en cualquier dirección.

---

### Simulacro 2

**1.** Lógico: programas = base de conocimiento (hechos + reglas); se consulta, no se ejecuta paso a paso; resolución automática de metas; backtracking; Closed World Assumption. Deriva de la lógica de primer orden y las cláusulas de Horn; el motor de inferencia es el componente que aplica resolución/unificación para determinar si una consulta se deduce de la base de conocimiento.

**2.** Aplicación parcial: fijar algunos argumentos de **una** función y obtener otra función con menos argumentos (currying); es sobre una sola función. Composición (`.`): combinar **dos o más funciones distintas** para que la salida de una sea la entrada de la siguiente; no fija argumentos, encadena funciones completas. Diferencias: aridad resultante, número de funciones involucradas, orden de evaluación (composición es derecha→izquierda), propósito (reutilizar vs encadenar transformaciones).

**3.** `data`/tuplas en Haskell agrupan valores con una forma fija conocida en tiempo de compilación; en Prolog el equivalente es un término compuesto `functor(arg1, ..., argN)`, donde el functor+aridad cumplen el rol del constructor. Ejemplos: tupla `(a,b)` ≈ `par(A,B)`; `data Persona = P String Int` ≈ `persona(Nombre, Edad)`; lista `[1,2,3]` ≈ lista Prolog `[1,2,3]` (mismo azúcar sintáctico sobre `'.'/2`).

**4.** `is` **evalúa** una expresión aritmética del lado derecho y unifica el resultado con el término de la izquierda (no es inversible: el lado derecho debe estar completamente instanciado). `=` solo **unifica** dos términos sin evaluar aritmética; `X = 2+3` liga `X` al término `2+3` sin reducirlo a `5`.

**5.** Recursividad: una función se define en términos de sí misma, con casos base y casos recursivos. `foldr`/`foldl` son en sí mismas funciones recursivas de orden superior que capturan el patrón general de "recorrer una lista combinando elementos" — cualquier recursión simple sobre listas (suma, longitud, map) puede reescribirse como un fold.

**6.** No existe "orden superior" en el sentido estricto de pasar predicados como argumentos de forma nativa simple, pero hay un paralelo: la aridad de un functor en Prolog es fija y conocida, mientras que en Haskell una función de orden superior "abstrae" justamente ese conocimiento fijo (recibe la función-comportamiento como dato). La relación que se espera remarcar: en Prolog el comportamiento variable se logra teniendo predicados con la misma aridad intercambiables entre sí (o vía `=..`/`call/N` si se vio en el curso), en lugar de pasar funciones como valores de primera clase.

---

### Simulacro 3

**1.** Declarativo: se especifica **qué** se quiere lograr, no **cómo** paso a paso; sin control de flujo imperativo explícito (sin `for`/`while` con estado mutable); mayor nivel de abstracción. Haskell lo materializa como transformación de datos vía funciones puras encadenadas; Prolog lo materializa como consulta de relaciones vía unificación y backtracking. Ambos se apoyan en el paradigma declarativo general, pero desde ramas distintas (funcional matemática vs lógica formal).

**2.** Tupla: tamaño y tipos fijos, sin nombre de constructor propio, pensada para agrupar valores heterogéneos de forma anónima. `data`: define un tipo nuevo con nombre, puede tener varios constructores alternativos (suma de tipos), puede llevar campos con nombre (record syntax), puede derivar instancias de TypeClasses (`deriving (Show, Eq)`), y puede ser recursivo (árboles, listas propias).

**3.** Una guarda de Haskell es una condición booleana evaluada antes de elegir la ecuación (`| edad > 18 = ...`); en Prolog el equivalente es agregar esa condición como un objetivo más en el cuerpo de la regla (`mayor(P) :- persona(P, Edad), Edad > 18.`). Ejemplos: `| x > 0 = ...` ≈ `X > 0`; `| otherwise = ...` ≈ cláusula alternativa sin esa condición (o cut); `| x == y = ...` ≈ `X =:= Y` (si es numérico) o `X = Y` (si es unificación).

**4.** Currificación: propiedad estructural de Haskell por la cual toda función de N argumentos es en realidad una cadena de N funciones de 1 argumento (`f :: a -> b -> c` es `a -> (b -> c)`). Aplicación parcial: la **técnica** de aprovechar esa currificación para fijar solo algunos argumentos y obtener una función nueva. Currying es lo que lo hace posible; aplicación parcial es el uso concreto que se le da.

**5.** Lazy: las expresiones no se evalúan hasta que su valor es efectivamente necesario. Relación con `take`: permite definir listas infinitas (`[1..]`, `repeat x`) porque solo se calculan los elementos que `take n` efectivamente consume — sin lazy evaluation, construir una lista infinita nunca terminaría.

**6.** Sí, en un sentido distinto: Prolog no "retrasa" la evaluación de expresiones como Haskell, pero el backtracking es "perezoso" en cuanto a que solo genera la siguiente solución cuando se la pide (con `;`), no calcula todas las soluciones por adelantado — es una forma de evaluación incremental/bajo demanda, aunque el mecanismo de fondo (búsqueda con vuelta atrás) es distinto del thunk/grafo de evaluación lazy de Haskell.

---

### Simulacro 4

**1.** Multiparadigma: combinan construcciones de más de un paradigma en el mismo lenguaje, permitiendo elegir el estilo según el problema. Ejemplos: Python (imperativo + funcional vía `map`/`lambda` + OO vía clases — lo funcional deriva del cálculo lambda, lo OO deriva de Simula/Smalltalk); Scala (funcional + OO, corre sobre la JVM combinando cálculo lambda con el modelo de objetos de Java).

**2.** Individual: todos los argumentos están instanciados/ligados; la respuesta es `true`/`false`. Existencial: al menos un argumento es variable libre; la respuesta son los valores que hacen verdadera la consulta (posiblemente varios, vía backtracking). Diferencias: forma de la respuesta, necesidad de backtracking, si requiere la base de conocimiento completa para enumerar soluciones.

**3.** `map` (aplica función a cada elemento) ≈ no hay un predicado 1:1, pero se logra recorriendo con recursión o con `maplist` si se vio; `filter` (selecciona por condición) ≈ recorrer con backtracking pidiendo soluciones que cumplen una condición extra en el cuerpo de la regla; `head`/`tail` (primer elemento / resto) ≈ desestructurar `[H|T]` en la cabeza de una cláusula, igual que en Haskell `x:xs`; `length` de Haskell ≈ `length/2` de Prolog (predicado, no función, con dos argumentos: lista y resultado).

**4.** `=` unifica dos términos (puede ligar variables, no evalúa nada, es bidireccional). `==` compara si dos términos ya son **sintácticamente idénticos**, sin ligar variables — si alguno no está instanciado, generalmente falla en vez de unificar. `X = Y` con `X` libre liga `X`; `X == Y` con `X` libre no liga nada y es `false` (salvo que `Y` también sea la misma variable libre).

**5.** Un predicado es inversible cuando puede usarse en más de una "dirección" (con distintos argumentos como variables) y seguir dando resultados correctos, gracias a que la unificación no distingue "entrada" de "salida". Ejemplo: `padre(abraham, isaac).` permite `?- padre(abraham, X).` (encontrar el hijo) y `?- padre(Y, isaac).` (encontrar el padre) con el mismo hecho, porque la unificación liga la variable esté donde esté.

**6.** No exactamente igual: en Haskell la recursión opera sobre valores y siempre termina en un caso base determinístico (una función recursiva calcula un único resultado). En Prolog, la "recursión" sobre predicados puede producir múltiples soluciones vía backtracking en cada nivel, no solo un valor. El paralelo es: el caso base de una función recursiva (ej. `factorial 0 = 1`) cumple el mismo rol estructural que el hecho base de un predicado recursivo (ej. `ancestro(P,H) :- padre(P,H).`) — ambos detienen la recursión, pero en Prolog además puede haber más de un hecho base aplicable.

---

### Simulacro 5

**1.** Tipado estático, fuerte, con inferencia de tipos (no siempre hace falta anotar `::`), polimorfismo paramétrico (variables de tipo como en `id :: a -> a`) y polimorfismo ad-hoc vía TypeClasses. Las TypeClasses agregan sobrecarga controlada de funciones/operadores según el tipo (algo que el tipado paramétrico puro no permite). El sistema deriva del cálculo lambda tipado (system F / Hindley-Milner para la inferencia).

**2.** Lazy: no evalúa hasta que se necesita el valor; permite estructuras infinitas; puede evitar cómputo innecesario; dificulta razonar sobre uso de memoria/tiempo. Eager: evalúa apenas se liga el valor (argumentos antes de entrar a la función); más predecible en performance; no permite estructuras infinitas; es el modelo por defecto en la mayoría de lenguajes imperativos.

**3.** `findall(X, Objetivo, Lista)` recolecta **todas** las soluciones (con duplicados) ≈ equivalente aproximado a construir una lista con `filter`/recorrido completo en Haskell. `bagof/3` como `findall` pero falla si no hay soluciones y agrupa por variables libres no cuantificadas ≈ similar a `filter` seguido de agrupamiento (`groupBy`). `setof/3` como `bagof` pero ordena y elimina duplicados ≈ equivalente a `sort . nub` aplicado sobre el resultado de un `filter`/`map`.

**4.** El corte `!` congela las decisiones tomadas hasta ese punto: descarta las alternativas pendientes de las metas anteriores y de la cláusula actual, podando el árbol de backtracking. `\+` (negación como fallo) intenta probar un objetivo; si **falla**, `\+ Objetivo` tiene éxito (y viceversa), sin podar backtracking de metas anteriores — son mecanismos de control distintos: uno poda alternativas, el otro invierte el resultado de una prueba.

**5.** Transparencia referencial: toda expresión puede reemplazarse por su valor sin cambiar el comportamiento del programa, porque una función pura siempre devuelve lo mismo para los mismos argumentos. Relación con el Principio de Sustitución: es justamente lo que **habilita** ese principio — si `doble 5` siempre es `10`, puedo sustituir uno por otro en cualquier expresión sin alterar el resultado; sin transparencia referencial (estado global, efectos), esa sustitución sería inválida.

**6.** No hay declaración de tipos, pero existen predicados de introspección que permiten preguntar por la "naturaleza" de un término en tiempo de ejecución: `var/1` (¿es variable libre?), `atom/1` (¿es átomo?), `number/1` (¿es número?), `compound/1` (¿es término compuesto?). Cumplen un rol parecido al chequeo de tipos, pero **dinámico** (en tiempo de ejecución) y opcional, en vez de **estático** (en tiempo de compilación) y obligatorio como en Haskell.

---

### Simulacro 6

**1.** Prolog: programas como conjuntos de cláusulas de Horn (hechos y reglas con a lo sumo una conclusión), consultas resueltas por refutación; Closed World Assumption; backtracking para explorar alternativas. La resolución de consultas deriva del algoritmo de **resolución SLD** sobre lógica de primer orden (unificación + resolución de Robinson); el componente que la ejecuta es el **motor de inferencia**.

**2.** Unificación: bidireccional, no destruye el valor anterior de una variable ya ligada (solo falla si no coincide), puede ligar dos variables entre sí, es reversible con backtracking. Asignación destructiva: unidireccional (derecha a izquierda), sobrescribe el valor anterior, no falla por "no coincidir", no es reversible automáticamente. Prolog elige unificación porque le permite usar el mismo predicado en múltiples direcciones (inversibilidad) y encontrar soluciones por búsqueda, algo que la asignación destructiva no permite.

**3.** `factorial n` (Haskell, recursión sobre `Int`) ≈ `factorial/2` (Prolog: primer argumento entrada, segundo argumento resultado); `fibonacci n` ≈ `fibonacci/2`; `length xs` / longitud de lista recursiva ≈ `longitud/2` (o `length/2` built-in). En los tres casos, el "argumento de salida" de Haskell (el valor devuelto) pasa a ser un argumento más en Prolog, ligado por unificación en vez de devuelto con `return`.

**4.** `findall/3` trae todas las soluciones, con duplicados, y nunca falla (si no hay soluciones devuelve lista vacía). `bagof/3` trae todas las soluciones pero **falla** si no hay ninguna, y agrupa resultados según las variables libres no cuantificadas con `^`. `setof/3` es como `bagof/3` pero además ordena el resultado y elimina duplicados.

**5.** Point-free style: definir una función **sin mencionar explícitamente sus argumentos**, componiendo funciones directamente. Relación con `.`: la composición es la herramienta principal que lo habilita — `f x = (g . h) x` se puede escribir directamente como `f = g . h`, eliminando el argumento `x` de la definición.

**6.** Sí: `assert`/`retract` modifican la base de conocimiento en tiempo de ejecución, así que dos consultas idénticas pueden dar resultados distintos según lo que se haya asertado/retractado entre medio — esto es exactamente lo que la Transparencia Referencial prohíbe en Haskell (una función pura siempre da el mismo resultado). Se relaciona con `=`/unificación en que la unificación en sí sigue siendo pura y no destructiva; el efecto secundario está en la modificación de la base de conocimiento, no en el mecanismo de unificación.

---

## Nota final

Estos simulacros están pensados para practicar la **forma** de responder (relación + enumeración + ejemplo), no para memorizar. Para el desarrollo largo tipo ensayo de cada tema (con código completo), complementá con `Preguntas_Practica_Con_Respuestas.md` en esta misma carpeta.
