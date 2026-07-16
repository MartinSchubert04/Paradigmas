# Corrección — Simulacro 2 (Paradigma Lógico y sus fundamentos)

**Nota total: 16 / 30 — Insuficiente**

| Pregunta | Nota |
| -------- | ---- |
| 1        | 2/5  |
| 2        | 3/5  |
| 3        | 1/5  |
| 4        | 4/5  |
| 5        | 4/5  |
| 6        | 2/5  |

---

## Pregunta 1

> Enumere las características principales de los lenguajes que pertenecen al paradigma lógico. ¿De qué rama de la lógica formal deriva Prolog y qué es el motor de inferencia?

**Tu respuesta:**
> Las caracteristicas son que poseen una base de conocimiento establecida con predicado y reglas, no exista la asignacion si no mas bien la unificacion que liga valores con estos hechos / reglas. Prolog deriva del algebra de Bool en matematicas. Un motor de inferencia es una implementacion que permite al lenguaje intuir los tipos utilizados en el programa basandose en los operadores utilizados y las funciones que lo implementan

**Corrección — 2/5**

- **[FLOJO]** Diste solo 2 características (base de conocimiento con hechos/reglas, y unificación en vez de asignación). Faltan otras que se esperan: que Prolog **consulta** en vez de ejecutar paso a paso, el **backtracking**, y la **Closed World Assumption**.
- **[ERROR]** "Prolog deriva del álgebra de Bool" no es lo que se busca. Prolog deriva de la **lógica de primer orden** y las **cláusulas de Horn**, no del álgebra booleana — son cosas relacionadas pero no lo mismo; el álgebra de Bool es cálculo proposicional con conectores, no el marco de resolución/unificación sobre el que se construye Prolog.
- **[ERROR grave]** Definiste "motor de inferencia" como algo que **infiere tipos** ("intuir los tipos... basándose en los operadores"). Eso es la **inferencia de tipos de Haskell**, un concepto totalmente distinto. El motor de inferencia de Prolog es el componente que aplica **resolución + unificación** para determinar si una consulta se deduce de la base de conocimiento. Esta es justo la confusión cruzada entre paradigmas que el profesor busca detectar — repasala bien porque es un error conceptual, no de redacción.

> 🔴 **Cómo la respondería yo:**
> Los lenguajes del paradigma lógico expresan un programa como una base de conocimiento compuesta por hechos y reglas, en lugar de una secuencia de instrucciones. No hay asignación destructiva: las variables se ligan mediante unificación. La ejecución consiste en formular consultas (metas) contra esa base de conocimiento, y el sistema busca demostrarlas mediante **backtracking**, probando distintas cláusulas hasta encontrar una solución o agotar las alternativas. Además asumen la **Closed World Assumption**: todo lo que no se puede demostrar verdadero se considera falso. Prolog deriva de la **lógica de primer orden**, específicamente del fragmento de las **cláusulas de Horn** (hechos y reglas con a lo sumo una conclusión). El **motor de inferencia** es el componente del intérprete que aplica resolución SLD y unificación para determinar, de forma automática, si una consulta puede deducirse de la base de conocimiento.

---

## Pregunta 2

> ¿Cuáles son las diferencias entre la Aplicación Parcial y la Composición de Funciones en Haskell? Enumere por lo menos 4 diferencias.

**Tu respuesta:**
> Aplicacion parcial es cuando se crea una funcion nueva en base a una previa pero con menos parametros para asi poder reutilizarla con parametros "fijos" y ahora a la nueva se la utiliza con menos parametros para evitar repetir codigo y la compocision de funciones se determina con la separacion de un "." se lee de derecha a izquierda, y el output de una pasa a la siguiente, asi tranformados el valor de forma secuencial de derecha a izquierda. Las diferencias son que, uno se implementa para clean code y el otro para una facilida a la hora de tranformar valores, en uno se crea una nueva funcion para el mecanismo y el otro se utilizan funciones ya declaradas, no se me ocurren mas

**Corrección — 3/5**

- **[BIEN]** Las definiciones de ambos conceptos están bien encaminadas: aplicación parcial fija parámetros de una función existente; composición encadena funciones con `.`, derecha a izquierda.
- **[BIEN]** "Se crea una función nueva vs. se usan funciones ya declaradas" es una diferencia real y apunta a algo correcto: aplicación parcial opera sobre **una sola** función, composición involucra **dos o más**.
- **[FALTA]** Pedían **4 diferencias** y vos mismo cortaste con "no se me ocurren más" después de dar 2 (y una de ellas, "clean code vs. facilidad para transformar valores", es vaga, no es una diferencia estructural). Te faltaron, por ejemplo: la **aridad resultante** de la función nueva, el **orden de evaluación** (lo mencionaste al pasar para composición pero no lo contrastaste explícitamente contra aplicación parcial), o el **propósito** (reutilizar código con valores fijos vs. encadenar transformaciones). Cuando piden "al menos N", contalas 1, 2, 3, 4 mientras escribís — te asegurás de no quedarte corto.

> 🔴 **Cómo la respondería yo:**
> La aplicación parcial toma una función existente y fija uno o más de sus argumentos, devolviendo una nueva función que espera los argumentos restantes (posible gracias al currying). La composición (`.`) combina dos o más funciones distintas, encadenando la salida de una como entrada de la siguiente, evaluándose de derecha a izquierda. Diferencias: **(1)** aplicación parcial opera sobre una sola función, composición combina dos o más; **(2)** aplicación parcial reduce la aridad fijando argumentos, composición no fija argumentos, encadena funciones completas; **(3)** el propósito es distinto — reutilizar una función con valores fijos vs. transformar un valor a través de una secuencia de pasos; **(4)** en composición el orden de evaluación es explícitamente derecha→izquierda (`f . g` aplica primero `g`), mientras que en aplicación parcial no existe esa noción de "orden" porque solo hay una función.

---

## Pregunta 3

> Indique la relación que existe entre las Tuplas/Data de Haskell y las estructuras compuestas (functor + aridad) de Prolog. Enumere 3 formas de construir datos en Haskell y para cada una indique el equivalente en Prolog.

**Tu respuesta:**
> Las tuplas y los Data son una agrupacion de datos al mismo tiempo que las estructuras compuestas se encargan ligar valores con propiedades o caracteristicas compartidas, por lo cual realizan el agrupamiento al igual. En haskell se puede ... no se

**Corrección — 1/5**

- **[FLOJO]** La relación general que das ("ambos agrupan datos") es cierta pero está mal fundamentada: decir que las estructuras compuestas de Prolog "ligan valores con propiedades o características compartidas" describe en realidad a los **predicados monádicos/clases** (como en la P3 del Simulacro 1), no a un término compuesto `functor(arg1,...,argN)`. Un término compuesto no expresa "pertenencia a una categoría": agrupa argumentos posicionales bajo un nombre — igual que `data Persona = P String Int` agrupa campos bajo un constructor.
- **[FALTA — grave]** La parte central de la pregunta, la **enumeración de 3 formas de construir datos en Haskell con su equivalente en Prolog**, quedó directamente sin responder ("En haskell se puede ... no se"). Esta enumeración anidada (3 de un lado, 1 equivalente de cada uno del otro) es el corazón de este tipo de pregunta en el final — es la que más peso tiene. Ejemplos que te servían: tupla `(a,b)` ≈ `par(A,B)`; `data Persona = P String Int` ≈ `persona(Nombre, Edad)`; lista `[1,2,3]` ≈ lista de Prolog (mismo azúcar sintáctico sobre `'.'/2`).

> 🔴 **Cómo la respondería yo:**
> Tanto las tuplas/data de Haskell como los términos compuestos de Prolog (functor + aridad) cumplen el mismo rol: agrupar varios valores bajo una única estructura con forma fija y conocida. La diferencia es que en Haskell esa forma está chequeada estáticamente por el sistema de tipos, mientras que en Prolog el functor y su aridad son la única "firma" del término, sin verificación de tipos. Tres formas de construir datos en Haskell y su equivalente en Prolog: **1)** una tupla `(a, b)` ≈ un término `par(A, B)`; **2)** un tipo algebraico `data Persona = P String Int` ≈ `persona(Nombre, Edad)`; **3)** una lista `[1,2,3]` ≈ una lista de Prolog `[1,2,3]`, que internamente es azúcar sintáctico sobre el functor `'.'/2` (cabeza y cola), igual que en Haskell es azúcar sobre `:`.

---

## Pregunta 4

> ¿Cuál es la diferencia entre el operador "is" y el operador "=" en Prolog?

**Tu respuesta:**
> El "=" en prolog es la declaracion explicita de la unificacion entre un valor y una variable, en cambio "is" es la forma aritmetica que utiliza prolog para asignar valores numericos a variables, "is" esta seguido siempre de una expresion aritmetica

**Corrección — 4/5**

- **[BIEN]** Distinción correcta y clara: `=` unifica, `is` evalúa una expresión aritmética. Buena observación que `is` siempre va seguido de una expresión aritmética.
- **[FLOJO]** Usar "asignar" para describir `is` es riesgoso — no es asignación destructiva, es "evaluar la expresión de la derecha y **unificar** el resultado con el término de la izquierda". Si el término de la izquierda ya está ligado a otro valor, `is` **falla** en vez de sobreescribir; convendría aclarar esto para no repetir el desliz conceptual de la P4 del Simulacro 1 (`=` como asignación).
- **[FALTA menor]** No mencionaste que `is` no es inversible (el lado derecho debe estar completamente instanciado). Suma pero no resta mucho acá.

> 🔴 **Cómo la respondería yo:**
> El operador `=` unifica dos términos: intenta hacerlos sintácticamente iguales, ligando las variables libres que haga falta, sin evaluar ninguna aritmética (`X = 2+3` liga `X` al término `2+3`, no a `5`). El operador `is` **evalúa** la expresión aritmética del lado derecho y unifica el resultado con el término de la izquierda (`X is 2+3` liga `X` a `5`). Por eso `is` exige que el lado derecho esté completamente instanciado —no es inversible—, mientras que `=` puede usarse con variables libres de cualquier lado.

---

## Pregunta 5

> ¿A qué se denomina Recursividad y qué relación tiene con las funciones foldr y foldl?

**Tu respuesta:**
> Recursividad es la aplicacion de una funcion de forma reiterada sobre los valores que modifica, una vez llegado a el "caso base" que defina la funcion, se empezara a a volver iteradamente hacia atras en lo que a llamadas a si misma refiere, sacandolas del stack. La relacion con las funciones foldr y foldl es que estas reducen una lista de forma recusiva sobre la misma, aplicando la misma funcion una y otra vez.

**Corrección — 4/5**

- **[BIEN]** Buena definición de recursividad, con caso base y desenrollado de la pila mencionado explícitamente — mejor nivel de detalle que en preguntas anteriores.
- **[BIEN]** Relación correcta: foldr/foldl como funciones de orden superior que capturan el patrón general de recorrer una lista recursivamente.
- **[FLOJO]** Te faltó un matiz que suma fácil: **foldr y foldl no son intercambiables**, difieren en la dirección de asociación (foldr combina empezando desde el final de la lista, foldl desde el principio) — mencionarlo demuestra que entendiste por qué existen las dos variantes y no solo una.

> 🔴 **Cómo la respondería yo:**
> La recursividad es la técnica por la cual una función se define en términos de sí misma, resolviendo un caso base de forma directa y reduciendo los demás casos a llamadas sobre una versión más pequeña del problema. `foldr` y `foldl` son en sí mismas funciones recursivas de orden superior que capturan el patrón general de "recorrer una lista combinando sus elementos con una función": `foldr` recorre asociando desde el final (`f x1 (f x2 (... (f xn z)))`), mientras que `foldl` acumula desde el principio (`f (... (f (f z x1) x2) ...) xn`). Cualquier recursión simple sobre listas (suma, longitud, map) puede reescribirse en términos de un fold.

---

## Pregunta 6

> El concepto de Orden Superior es central en Haskell, ¿existe algo equivalente en el paradigma lógico? Explique y relacione su respuesta con los functores y la aridad de los predicados.

**Tu respuesta:**
> Si existe pero es implementado por funciones nativas del lenguajes en el caso de prolog, donde se tiene una regla que toma otras como para metros y las aplica sobre los valores. La relacion viene de que va a utilizar un functor como para metro y ese mismo debe tener la capacidad de tomar un valor por lo cual ambos deben ser aridad 2 (no estoy seguro de esta respuesta este bien)

**Corrección — 2/5**

- **[FLOJO]** Arrancás con un "Sí existe" categórico que no es lo más preciso — la respuesta esperada es más matizada: "no en el sentido estricto de pasar predicados como valores de primera clase, pero hay un paralelo". Tu intuición de que "una regla toma otras como parámetros" apunta en la dirección correcta (algo como `call/N` o meta-predicados), pero no nombrás ningún mecanismo concreto de Prolog.
- **[ERROR]** "Ambos deben ser aridad 2" no tiene un fundamento claro — no hay una razón por la que el functor "parámetro" y el que lo "recibe" deban compartir aridad 2 específicamente. Vos mismo marcás que no estás seguro de esta parte; en el final, ante la duda, mejor quedarse en lo general que arriesgar un número inventado — un dato falso resta más que una afirmación más cauta.
- **[FALTA]** No conectaste la idea con el eje que pedía la pregunta: "la aridad de un functor en Prolog es fija y conocida, mientras que el orden superior en Haskell abstrae justamente ese conocimiento fijo (recibe la función-comportamiento como dato)".

> 🔴 **Cómo la respondería yo:**
> No existe orden superior en el sentido estricto de pasar predicados como valores de primera clase de forma nativa y simple, pero hay un paralelo interesante: la aridad de un functor/predicado en Prolog es fija y se conoce de antemano, mientras que una función de orden superior en Haskell "abstrae" justamente ese conocimiento fijo, recibiendo el comportamiento (la función) como un dato más. En Prolog, el efecto de "orden superior" se logra con mecanismos como `call/N` (que invoca dinámicamente un predicado dado como término, agregándole argumentos) o construyendo predicados con la misma aridad que resultan intercambiables entre sí — no hay una noción de "función que toma función" incorporada al lenguaje como en Haskell.

---

## Para la próxima vuelta

1. Ojo con **confundir conceptos entre paradigmas** (motor de inferencia ↔ inferencia de tipos): fue el error más grave de este simulacro (P1) y es exactamente el tipo de trampa que arma el profesor.
2. Cuando la pregunta pide una **enumeración anidada** ("3 formas... y para cada una el equivalente", P3), no la dejes en blanco ni a medias — es la parte de mayor peso en ese tipo de pregunta. Si no te acordás un ejemplo perfecto, arriesgá uno aproximado antes que dejarlo vacío.
3. Cuando piden "al menos N diferencias" (P2), contalas explícitamente mientras escribís para no quedarte corto.
4. Te fue mejor en las preguntas de **distinción fina dentro de un mismo lenguaje** (P4, P5) que en las de **puente con enumeración anidada** (P3) o **aplicabilidad cruzada entre paradigmas** (P6). Reforzá esos dos tipos particularmente de cara al próximo simulacro.
