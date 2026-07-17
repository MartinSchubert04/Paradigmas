# Correcciones — Simulacros de Final (acumulado)

Este archivo es el **único lugar donde se acumulan todas las correcciones** de los simulacros en `Simulacros_Final_Formato_Real.md`. Fusiona lo que ya existía suelto (`Simulacro_1_Respuestas_Modelo.md`, `Correccion_Simulacro_2.md`) en un solo documento con el mismo formato, y de acá en adelante cada simulacro nuevo que respondas en `Simulacros_Mis_Respuestas.md` se agrega abajo con la misma estructura: nota por pregunta, `[BIEN]/[FLOJO]/[ERROR]`, y "🔴 Cómo la respondería yo".

**Estado actual:** Simulacros 1 y 2 corregidos. Simulacros 3 a 6 están pendientes — completá tus respuestas en `Simulacros_Mis_Respuestas.md` y avisame ("corregime el simulacro 3") para que agregue la corrección acá mismo.

---

## Resumen de notas

| Simulacro | Nota | Temas a repasar |
| --------- | ---- | ---------------- |
| 1 | 17/30 | Origen de Haskell (cálculo lambda, no "composición de funciones"); qué agregan las TypeClasses sobre cálculo lambda (no respondido); dar diferencias completas cuando piden N (P2 quedó a medio hacer) |
| 2 | 16/30 | Motor de inferencia vs. inferencia de tipos; deriva lógico (cláusulas de Horn, no álgebra de Bool); tuplas/data ↔ estructuras compuestas Prolog; orden superior en Prolog |
| 3 | — | pendiente |
| 4 | — | pendiente |
| 5 | — | pendiente |
| 6 | — | pendiente |

---

## Simulacro 1 — Calentamiento

**Nota total: 17 / 30 — Insuficiente**

| Pregunta | Nota |
| -------- | ---- |
| 1        | 2/5  |
| 2        | 1/5  |
| 3        | 3/5  |
| 4        | 3/5  |
| 5        | 4/5  |
| 6        | 4/5  |

### Pregunta 1

> Enumere las características principales de los lenguajes que pertenecen al paradigma funcional. ¿Qué agrega el sistema de TypeClasses sobre el cálculo lambda original, y de qué paradigma matemático deriva Haskell?

**Tu respuesta:**
> Las principales caracteristicas son que no existe la asignacion destructiva y todo se crontruye en base a funciones. Deriva de la composicion de funciones ej: f x g | f(g())

**Corrección — 2/5**

- **[FLOJO]** Dijiste solo 2 características (sin asignación destructiva, todo son funciones). La pregunta espera un listado más largo: funciones puras/transparencia referencial, ausencia de efectos secundarios, tipado fuerte con inferencia, recursividad en vez de control imperativo, orden superior, y (en Haskell) evaluación lazy.
- **[FALTA — no respondido]** No contestaste qué agrega el sistema de **TypeClasses** sobre el cálculo lambda original. Era una de las tres partes explícitas de la pregunta.
- **[ERROR]** "Deriva de la composición de funciones" no es el origen matemático de Haskell — la composición es una construcción *dentro* del lenguaje, no su fundamento. Haskell deriva del **Cálculo Lambda** de Alonzo Church (con su extensión tipada, base de la inferencia Hindley-Milner).

> 🔴 **Cómo la respondería yo:**
> Características principales del paradigma funcional: no existe asignación destructiva ni estado mutable (solo se define, no se "reescribe" una variable); las funciones son puras y con transparencia referencial (mismo input, mismo output siempre); no hay efectos secundarios; tipado fuerte con inferencia de tipos; no hay control imperativo (`for`/`while`), se reemplaza por recursividad; las funciones son de primera clase (orden superior); en Haskell, evaluación lazy por defecto. Las **TypeClasses** agregan **polimorfismo ad-hoc** sobre el cálculo lambda original (que no tiene noción de sobrecarga: cada función tiene un único tipo fijo): permiten definir una misma función/operador (`==`, `+`, `show`) con implementaciones distintas según el tipo, siempre que ese tipo sea instancia declarada de la clase, verificado en tiempo de compilación. Haskell deriva del **Cálculo Lambda** de Church.

---

### Pregunta 2

> ¿Cuáles son las diferencias entre el lenguaje Haskell y Prolog? Enumere por lo menos 5 diferencias.

**Tu respuesta:**
> 1. Uno es del paradigma funcional y otro del paradigma logico
> 2. ...

**Corrección — 1/5**

- **[FALTA — grave]** Diste 1 diferencia de 5 pedidas y dejaste el resto sin completar (literalmente "2. ..."). En el final real esto es una pregunta de "cantidad garantizada": si piden 5, hay que llegar a 5 aunque sea con diferencias más simples, nunca dejarla a medias.
- **[BIEN]** La única diferencia que diste (funcional vs. lógico) es correcta y es, de hecho, la más importante — buen punto de partida, pero insuficiente solo.

> 🔴 **Cómo la respondería yo:**
> 1. **Paradigma:** Haskell es funcional (transforma datos mediante funciones puras); Prolog es lógico (consulta relaciones mediante unificación y backtracking).
> 2. **Programa = qué:** en Haskell un programa es un conjunto de funciones; en Prolog es una base de conocimiento de hechos y reglas.
> 3. **Resultado de ejecutar:** una función de Haskell devuelve siempre un único valor determinístico; una consulta Prolog puede devolver cero, una o múltiples soluciones (vía backtracking).
> 4. **Tipado:** Haskell tiene tipado estático fuerte con inferencia; Prolog no tiene declaración de tipos (aunque existen predicados como `atom/1`, `number/1` para inspeccionar en tiempo de ejecución).
> 5. **Evaluación:** Haskell es lazy por defecto; Prolog resuelve metas secuencialmente guiado por unificación, entregando soluciones bajo demanda vía backtracking.
> 6. **Mutabilidad de la base de datos:** en Haskell no hay forma de modificar "el programa" en tiempo de ejecución; en Prolog, `assert`/`retract` sí modifican la base de conocimiento en caliente.

---

### Pregunta 3

> Indique la relación que existe entre las TypeClasses de Haskell y las Clases (predicados monádicos) en Prolog. Enumere 3 TypeClasses de Haskell y para cada una de ellas enumere dos tipos o predicados que las usan.

**Tu respuesta:**
> Las type classes crean un polimorfismo para aquellas que implementensus funciones y comparte las carateristicas asi como los predicados permiten asociar una caracteristica con ese valor "x". Tres serian Num, Eq y Show. Num es utilizada por float e double para realizar operaciones, Eq es implementada por strings y tambien por float o tipos aritmeticos para poder realizar comparaciones, y show es utilizada para strings y numeros para poder ser impresos en la terminal como

**Corrección — 3/5**

- **[BIEN]** La relación conceptual está bien encaminada: TypeClass = agrupar tipos por comportamiento compartido; predicado monádico = agrupar individuos por una propiedad. Es la idea correcta, aunque podría estar más explícita (falta decir que ambos son formas de "clasificar sin jerarquía rígida").
- **[FLOJO]** "Num es utilizada por float e double" — en Haskell no existe el tipo `float`; los nombres correctos son `Float` y `Double` (con mayúscula, son tipos, no palabras reservadas de otro lenguaje). Ojo con mezclar convenciones de otros lenguajes.
- **[FALTA]** La respuesta quedó cortada en la parte de `Show` ("...impresos en la terminal como" y ahí termina). Siempre revisá que la última oración cierre antes de entregar — una respuesta cortada resta aunque el contenido previo esté bien.
- **[FALTA]** No diste ningún predicado de Prolog como contraparte (la pregunta menciona "tipos o predicados que las usan" — del lado Prolog convenía dar un ejemplo como `comic/1` o `mamifero/1`).

> 🔴 **Cómo la respondería yo:**
> Una TypeClass agrupa **tipos** que comparten un comportamiento (una interfaz/contrato); un predicado monádico (aridad 1) en Prolog agrupa **individuos** que cumplen una propiedad — ambos son mecanismos de clasificación por comportamiento/pertenencia, sin necesidad de herencia. Ejemplos: `Eq` (igualdad) → usada por `Int`, `Bool`; `Ord` (orden) → usada por `Int`, `Char`; `Num` (aritmética) → usada por `Int`, `Double`. Del lado Prolog, `comic/1` o `mamifero/1` cumplen el rol de "clase de pertenencia" para un individuo.

---

### Pregunta 4

> ¿Cuál es la diferencia entre el operador "=" y la Unificación en el lenguaje Prolog?

**Tu respuesta:**
> El operador igual "=" se utiliza generalmente para asiganar un valor a una dada variable o reemplazar el de la misma, en cambio la unificacion crea una relacion estre un objeto y una propiedad o regla sin capacidad destructiva

**Corrección — 3/5**

- **[ERROR conceptual — repetido en Simulacro 2]** Describiste `=` como algo que "asigna un valor... o reemplaza el de la misma". Eso es exactamente la confusión que el profesor busca detectar: `=` **no** asigna ni reemplaza, **unifica** — si la variable ya está ligada a otro valor, `X = nuevo` **falla**, no sobreescribe. Esta misma imprecisión ("asignar" en vez de "unificar") aparece también en tu respuesta de la P4 del Simulacro 2 sobre `is` — es un patrón a corregir de raíz, no un error puntual.
- **[FLOJO]** La descripción de Unificación ("relación entre un objeto y una propiedad o regla, sin capacidad destructiva") es vaga y se parece más a la definición de un predicado/clase que a la de unificación en sí. Unificación es hacer que dos **términos** sean estructuralmente idénticos, ligando variables libres — no es una relación objeto-propiedad.
- **[FALTA]** No mencionaste que `=` es la forma **explícita** de invocar la unificación, y que la unificación además ocurre **implícitamente** (al hacer matching de una consulta contra la cabeza de una cláusula) — es el eje central que pide la pregunta.

> 🔴 **Cómo la respondería yo:**
> `=` es el operador que invoca **explícitamente** la unificación: al escribir `X = termino`, Prolog intenta que ambos lados sean estructuralmente idénticos, ligando las variables libres necesarias. No es asignación destructiva: si `X` ya está ligada a un valor distinto, `X = nuevo_valor` **falla**, no sobrescribe. La **Unificación** es el mecanismo general, más amplio que `=`: ocurre también de forma implícita, sin escribir `=`, cada vez que Prolog hace matching entre una consulta y la cabeza de una cláusula. En una frase: `=` es la forma sintáctica explícita de pedir una unificación puntual; la unificación es el mecanismo que corre todo el tiempo por debajo, se escriba `=` o no.

---

### Pregunta 5

> ¿A qué se denomina Orden Superior y qué relación tiene con las funciones MAP y ELEM?

**Tu respuesta:**
> Orden superior es aquella funcion que utiliza otra funcion como parametro y la aplica a otros parametros o variables que utilize la funcion, en el caso de MAP esta permite a una lista transformala en base a un filtro como funcion por ejemplo o el caso elem que te permite saber si un elemento esta dentro de una lista

**Corrección — 4/5**

- **[BIEN]** Definición de orden superior correcta y clara (recibe una función y la aplica).
- **[BIEN]** Descripción de `map` y `elem` correcta en sí misma.
- **[FLOJO]** No marcaste explícitamente que `elem` **no** es de orden superior (no recibe ninguna función) — la pregunta busca justamente ese contraste: `map` sí lo es, `elem` no, pero `elem` puede **definirse** en términos de una función de orden superior (`any`/`foldr`). Decir "map... en base a un filtro" además mezcla `map` con `filter`, que son funciones distintas — conviene no combinarlas en la misma frase.

> 🔴 **Cómo la respondería yo:**
> Orden Superior: una función que **recibe** una o más funciones como argumento, y/o **devuelve** una función como resultado. `map :: (a -> b) -> [a] -> [b]` **sí** es de orden superior: recibe una función y la aplica a cada elemento de la lista. `elem :: Eq a => a -> [a] -> Bool` **no** es de orden superior: solo recibe un valor y una lista, y devuelve si ese valor pertenece a la lista comparando con `==`. Relación: aunque `elem` no es en sí de orden superior, sí puede **definirse** con una: `elem' x xs = any (== x) xs` (o con `foldr`) — muestra el patrón típico de que funciones "simples" terminan expresándose en términos de funciones de orden superior más generales.

---

### Pregunta 6

> El Pattern Matching se utiliza en el motor de inferencia de Haskell, ¿se utiliza también en Prolog? Explique qué es y qué relación tiene con las variables libres.

**Tu respuesta:**
> SI se utiliza para permitir una busqueda en la base de conocimientos cuando se realiza una consulta para saber si una relacion existe, esto se itera de arriba hacia abajo para hallar en caso de que exista un valor que cumpla tambien ayudandose del backtracking que permite re iterar estos fallos. Las varables libres se utilizan para hallar estos valores que cumplan, entonces el motor itera con el pattermatching y backtraking para hallar estos "x" que cumplen con la relacion

**Corrección — 4/5**

- **[BIEN]** Buena respuesta general: mencionás el recorrido de arriba hacia abajo, el backtracking, y la relación con variables libres — cubrís los puntos centrales.
- **[FLOJO]** No definiste explícitamente **qué es** el Pattern Matching en sí (comparar la estructura de dos términos, ligando variables cuando coinciden) antes de meterte en cómo se usa — la pregunta pide explícitamente "explique qué es", conviene abrir con la definición antes de aplicarla al caso de Prolog.
- **[FLOJO]** Pattern Matching y Backtracking terminan un poco mezclados en tu respuesta ("el motor itera con el pattern matching y backtracking"). Vale la pena distinguirlos: el matching decide si dos términos coinciden **ahora**; el backtracking es lo que pasa **después**, cuando algo falla y hay que deshacer y probar otra alternativa.

> 🔴 **Cómo la respondería yo:**
> Pattern Matching: mecanismo que compara la estructura de dos términos para ver si coinciden (mismo functor y aridad), ligando las variables presentes al valor correspondiente del otro lado. **Sí se usa en Prolog**: cada consulta hace matching (vía unificación) contra la cabeza de cada cláusula, de arriba hacia abajo. Relación con variables libres: cuando el patrón o la consulta tiene una variable no instanciada, el matching la **liga** al valor necesario para lograr la coincidencia — así se resuelven las consultas existenciales. Aclaración importante: Pattern Matching y Backtracking son distintos — el matching decide si dos términos coinciden ahora; el backtracking es lo que deshace ligaduras y prueba la siguiente cláusula cuando algo posterior falla.

---

## Simulacro 2 — Paradigma Lógico y sus fundamentos

**Nota total: 16 / 30 — Insuficiente**

| Pregunta | Nota |
| -------- | ---- |
| 1        | 2/5  |
| 2        | 3/5  |
| 3        | 1/5  |
| 4        | 4/5  |
| 5        | 4/5  |
| 6        | 2/5  |

### Pregunta 1

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

### Pregunta 2

> ¿Cuáles son las diferencias entre la Aplicación Parcial y la Composición de Funciones en Haskell? Enumere por lo menos 4 diferencias.

**Tu respuesta:**
> Aplicacion parcial es cuando se crea una funcion nueva en base a una previa pero con menos parametros para asi poder reutilizarla con parametros "fijos" y ahora a la nueva se la utiliza con menos parametros para evitar repetir codigo y la compocision de funciones se determina con la separacion de un "." se lee de derecha a izquierda, y el output de una pasa a la siguiente, asi tranformados el valor de forma secuencial de derecha a izquierda. Las diferencias son que, uno se implementa para clean code y el otro para una facilida a la hora de tranformar valores, en uno se crea una nueva funcion para el mecanismo y el otro se utilizan funciones ya declaradas, no se me ocurren mas

**Corrección — 3/5**

- **[BIEN]** Las definiciones de ambos conceptos están bien encaminadas: aplicación parcial fija parámetros de una función existente; composición encadena funciones con `.`, derecha a izquierda.
- **[BIEN]** "Se crea una función nueva vs. se usan funciones ya declaradas" es una diferencia real y apunta a algo correcto: aplicación parcial opera sobre **una sola** función, composición involucra **dos o más**.
- **[FALTA]** Pedían **4 diferencias** y vos mismo cortaste con "no se me ocurren más" después de dar 2 (y una de ellas, "clean code vs. facilidad para transformar valores", es vaga, no es una diferencia estructural). Te faltaron, por ejemplo: la **aridad resultante** de la función nueva, el **orden de evaluación** (lo mencionaste al pasar para composición pero no lo contrastaste explícitamente contra aplicación parcial), o el **propósito** (reutilizar vs. encadenar transformaciones). Cuando piden "al menos N", contalas 1, 2, 3, 4 mientras escribís — te asegurás de no quedarte corto.

> 🔴 **Cómo la respondería yo:**
> La aplicación parcial toma una función existente y fija uno o más de sus argumentos, devolviendo una nueva función que espera los argumentos restantes (posible gracias al currying). La composición (`.`) combina dos o más funciones distintas, encadenando la salida de una como entrada de la siguiente, evaluándose de derecha a izquierda. Diferencias: **(1)** aplicación parcial opera sobre una sola función, composición combina dos o más; **(2)** aplicación parcial reduce la aridad fijando argumentos, composición no fija argumentos, encadena funciones completas; **(3)** el propósito es distinto — reutilizar una función con valores fijos vs. transformar un valor a través de una secuencia de pasos; **(4)** en composición el orden de evaluación es explícitamente derecha→izquierda (`f . g` aplica primero `g`), mientras que en aplicación parcial no existe esa noción de "orden" porque solo hay una función.

---

### Pregunta 3

> Indique la relación que existe entre las Tuplas/Data de Haskell y las estructuras compuestas (functor + aridad) de Prolog. Enumere 3 formas de construir datos en Haskell y para cada una indique el equivalente en Prolog.

**Tu respuesta:**
> Las tuplas y los Data son una agrupacion de datos al mismo tiempo que las estructuras compuestas se encargan ligar valores con propiedades o caracteristicas compartidas, por lo cual realizan el agrupamiento al igual. En haskell se puede ... no se

**Corrección — 1/5**

- **[FLOJO]** La relación general que das ("ambos agrupan datos") es cierta pero está mal fundamentada: decir que las estructuras compuestas de Prolog "ligan valores con propiedades o características compartidas" describe en realidad a los **predicados monádicos/clases** (como en la P3 del Simulacro 1), no a un término compuesto `functor(arg1,...,argN)`. Un término compuesto no expresa "pertenencia a una categoría": agrupa argumentos posicionales bajo un nombre — igual que `data Persona = P String Int` agrupa campos bajo un constructor.
- **[FALTA — grave]** La parte central de la pregunta, la **enumeración de 3 formas de construir datos en Haskell con su equivalente en Prolog**, quedó directamente sin responder ("En haskell se puede ... no se"). Esta enumeración anidada (3 de un lado, 1 equivalente de cada uno del otro) es el corazón de este tipo de pregunta en el final — es la que más peso tiene. Ejemplos que te servían: tupla `(a,b)` ≈ `par(A,B)`; `data Persona = P String Int` ≈ `persona(Nombre, Edad)`; lista `[1,2,3]` ≈ lista de Prolog (mismo azúcar sintáctico sobre `'.'/2`).

> 🔴 **Cómo la respondería yo:**
> Tanto las tuplas/data de Haskell como los términos compuestos de Prolog (functor + aridad) cumplen el mismo rol: agrupar varios valores bajo una única estructura con forma fija y conocida. La diferencia es que en Haskell esa forma está chequeada estáticamente por el sistema de tipos, mientras que en Prolog el functor y su aridad son la única "firma" del término, sin verificación de tipos. Tres formas de construir datos en Haskell y su equivalente en Prolog: **1)** una tupla `(a, b)` ≈ un término `par(A, B)`; **2)** un tipo algebraico `data Persona = P String Int` ≈ `persona(Nombre, Edad)`; **3)** una lista `[1,2,3]` ≈ una lista de Prolog `[1,2,3]`, que internamente es azúcar sintáctico sobre el functor `'.'/2` (cabeza y cola), igual que en Haskell es azúcar sobre `:`.

---

### Pregunta 4

> ¿Cuál es la diferencia entre el operador "is" y el operador "=" en Prolog?

**Tu respuesta:**
> El "=" en prolog es la declaracion explicita de la unificacion entre un valor y una variable, en cambio "is" es la forma aritmetica que utiliza prolog para asignar valores numericos a variables, "is" esta seguido siempre de una expresion aritmetica

**Corrección — 4/5**

- **[BIEN]** Distinción correcta y clara: `=` unifica, `is` evalúa una expresión aritmética. Buena observación que `is` siempre va seguido de una expresión aritmética.
- **[FLOJO]** Usar "asignar" para describir `is` es riesgoso — no es asignación destructiva, es "evaluar la expresión de la derecha y **unificar** el resultado con el término de la izquierda". Si el término de la izquierda ya está ligado a otro valor, `is` **falla** en vez de sobreescribir; convendría aclarar esto para no repetir el desliz conceptual de la P4 del Simulacro 1 (`=` como asignación) — **es el mismo patrón de error en los dos simulacros, ver nota abajo**.
- **[FALTA menor]** No mencionaste que `is` no es inversible (el lado derecho debe estar completamente instanciado). Suma pero no resta mucho acá.

> 🔴 **Cómo la respondería yo:**
> El operador `=` unifica dos términos: intenta hacerlos sintácticamente iguales, ligando las variables libres que haga falta, sin evaluar ninguna aritmética (`X = 2+3` liga `X` al término `2+3`, no a `5`). El operador `is` **evalúa** la expresión aritmética del lado derecho y unifica el resultado con el término de la izquierda (`X is 2+3` liga `X` a `5`). Por eso `is` exige que el lado derecho esté completamente instanciado —no es inversible—, mientras que `=` puede usarse con variables libres de cualquier lado.

---

### Pregunta 5

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

### Pregunta 6

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

## Simulacro 3 — Declarativo, evaluación y estructuras

*Pendiente — completá las respuestas en `Simulacros_Mis_Respuestas.md` y avisame para corregir.*

---

## Simulacro 4 — Consultas, inversibilidad y listas

*Pendiente — completá las respuestas en `Simulacros_Mis_Respuestas.md` y avisame para corregir.*

---

## Simulacro 5 — Tipos, control y motor de inferencia

*Pendiente — completá las respuestas en `Simulacros_Mis_Respuestas.md` y avisame para corregir.*

---

## Simulacro 6 — Síntesis final / repaso integral

*Pendiente — completá las respuestas en `Simulacros_Mis_Respuestas.md` y avisame para corregir.*

---

## Patrones recurrentes a corregir (across simulacros 1-2)

1. **"Asignar/reemplazar" para describir `=` o `is` en Prolog** — apareció en Simulacro 1 P4 y Simulacro 2 P4. Ninguno de los dos es asignación destructiva: ambos **unifican** (y `is` además evalúa antes de unificar). Si la variable ya está ligada a otro valor, la operación **falla**, no sobrescribe. Repetilo hasta que salga automático: "unifica", nunca "asigna", en Prolog.
2. **Confundir conceptos entre paradigmas** (motor de inferencia ↔ inferencia de tipos de Haskell): el error más grave de Simulacro 2 P1. Es exactamente el tipo de trampa que arma el profesor cruzando Haskell/Prolog — repasar bien qué término pertenece a qué paradigma.
3. **Enumeraciones anidadas dejadas a medias o en blanco** (Sim 1 P2, Sim 2 P3): son la parte de mayor peso en las preguntas puente. Si no te acordás un ejemplo perfecto, arriesgá uno aproximado antes que dejarlo vacío — y contá explícitamente 1, 2, 3... mientras escribís para no quedarte corto cuando piden "al menos N".
4. **Preguntas de aplicabilidad cruzada** ("¿existe X del otro paradigma?", Sim 1 P1 parte de TypeClasses, Sim 2 P6): tendés a responder de forma general sin nombrar el mecanismo concreto (`call/N`, cálculo lambda, etc.). Reforzar nombrando siempre el mecanismo específico, no solo la idea abstracta.
5. **Fortalezas a mantener:** las preguntas de "distinción fina dentro de un mismo lenguaje" (Sim 1 P4/P5/P6, Sim 2 P4/P5) te salen mejor — seguí con ese nivel de detalle (caso base, desenrollado de pila, backtracking vs. pattern matching) también en las preguntas de puente entre paradigmas.
