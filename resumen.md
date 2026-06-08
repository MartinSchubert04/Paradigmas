# Resumen - Paradigmas de Programación

---

## 1. GENERAL

### Paradigma vs Lenguaje de Programación

| Lenguaje | Paradigma |
|---|---|
| Implementación concreta (Haskell, Prolog, Java) | Marco conceptual / forma de pensar |
| Sintaxis, herramientas, compilador | Reglas y convenciones de modelado |

**Dos diferencias clave:**
1. Un paradigma es una forma de pensar el problema; un lenguaje es una herramienta que lo implementa.
2. Un mismo lenguaje puede implementar varios paradigmas (lenguajes híbridos).

**Lenguajes híbridos:** Scala (funcional + OO), Python (imperativo + funcional + OO), Kotlin, C++.

**Paradigmas vistos en clase:**
- **Funcional** → Haskell
- **Lógico** → Prolog
- **Orientado a Objetos** → Java

### Imperativo vs Declarativo

- **Imperativo**: paso a paso, el programador indica *cómo* hacerlo. Hay secuencias, estructuras de control, variables y estado global.
- **Declarativo**: se especifica *qué* se quiere, se delega el cómo. Los paradigmas funcional y lógico son declarativos.

---

## 2. PARADIGMA FUNCIONAL - HASKELL

### Principios fundamentales

**Unicidad y Existencia** (como funciones matemáticas):
- **Existencia**: para todo valor de entrada existe una salida.
- **Unicidad**: para una entrada hay una y solo una salida posible.
- El paradigma lógico puede tener múltiples respuestas para una misma entrada.

**Transparencia Referencial → Principio de Sustitución:**
- La salida *solo* depende de la entrada (no hay estado global ni efecto).
- Las funciones son **independientes**, **determinísticas** y **sin efecto**.
- Dado que `f(x)` siempre devuelve lo mismo, se puede reemplazar `f(x)` por su resultado directamente.

### Tipos de datos en Haskell

```haskell
Number  -- Int, Float, Double   Ej: 4, 4.5
String  -- [Char]               Ej: "Hola"
Bool    -- True, False
Char    -- 'a', 'b'
```

### Inferencia de tipos

Haskell deduce el tipo de una función a partir de cómo se usan sus parámetros:

```haskell
ff x y = x && not y
-- y entra a not → Bool; x entra a && → Bool
-- ff :: Bool -> Bool -> Bool
```

`:t funcion` muestra el tipo. `:t funcion argumento` muestra el tipo de la aplicación parcial.

**Variables de tipo:** cuando el tipo es genérico se usa una letra minúscula.

```haskell
id :: a -> a
ignorarPrimero :: a -> b -> b
```

### Type Classes (restricciones de tipo)

```haskell
doble  :: Num a => a -> a
(==)   :: Eq a => a -> a -> Bool
(<)    :: Ord a => a -> a -> Bool
(/)    :: Fractional a => a -> a -> a
even   :: Integral a => a -> Bool
```

Las funciones no tienen clase asociada; no se pueden sumar ni comparar entre sí.

### Pattern Matching

Evalúa de arriba hacia abajo; primero constantes, luego variables. El orden importa.

```haskell
color "banana" = "amarillo"
color "manzana" = "rojo"
color _         = "gris"      -- caso default con variable anónima

factorial 0 = 1
factorial n = factorial (n-1) * n
```

Si ningún patrón matchea y no hay caso default, se lanza una excepción (función parcial → viola la existencia).

### Función Partida (Guardas)

```haskell
f :: Int -> Int
f x
  | x < -1            = -1
  | -1 <= x && x <= 1 = 1
  | otherwise         = -1
```

**Guarda vs Pattern Matching:** las guardas usan condiciones booleanas; el pattern matching usa la estructura o valor del dato.

### Función Parcial

Está definida solo en parte del dominio (viola la existencia). Ejemplo: `diaDeSemana 8` lanza excepción porque solo están definidos del 1 al 7.

### Precedencia de operadores

Las funciones **prefijas** tienen más precedencia que los operadores o funciones **infijas**.

```haskell
even length "alfonsina"    -- ERROR: se interpreta como (even length) "alfonsina"
even (length "alfonsina")  -- OK: primero length, luego even

8 + 7 * 2   -- = 22  (el * tiene más precedencia que el +)
```

Usar paréntesis para forzar el orden de evaluación deseado.

### Alias y Tipos propios

**Type (alias):** renombra un tipo existente para dar semántica.

```haskell
type Nombre = String
type Edad   = Int
```

**Tupla:** agrupa valores de tipos distintos. Anónima, pierde semántica.

```haskell
type Persona = (Nombre, Edad)
edad :: Persona -> Edad
edad (_, e) = e    -- pattern matching sobre tupla
fst (x, _) = x
snd (_, y) = y
```

**Data:** define un tipo propio con nombre, constructor y funciones de acceso generadas automáticamente. Más expresivo.

```haskell
data Estudiante = UnEstudiante {
  nombre :: String,
  legajo :: String,
  nota   :: Int
} deriving (Show, Eq)

-- Uso
juanita = UnEstudiante "Juana" "L004100-3" 8
nota juanita   -- 8

-- Crear una copia con campo modificado
cambiarNota nuevaNota (UnEstudiante n l _) = UnEstudiante n l nuevaNota
```

**Diferencia Tupla vs Data:** el Data tiene nombre propio, constructor con semántica y genera funciones de acceso; la tupla es anónima y menos expresiva. Para modelar entidades del dominio, preferir Data.

### Listas

```haskell
[1, 2, 3]
1 : [2, 3]        -- cons
1 : 2 : 3 : []

head, tail, last, init, length, reverse
take n lista, drop n lista
elem x lista
++ , sort, sum, maximum, minimum
```

Pattern matching sobre listas:

```haskell
length []     = 0
length (_:xs) = 1 + length xs
```

### Aplicación Parcial vs Composición

**Composición (`.`):** encadena funciones — la salida de una es la entrada de la siguiente.

```haskell
(.) :: (b->c) -> (a->b) -> (a->c)

promociona = not . esMenorAOcho . nota
-- equivale a: promociona alumno = not (esMenorAOcho (nota alumno))
```

**Aplicación Parcial:** llamar una función con *menos* argumentos de los que pide, generando una nueva función.

```haskell
esMayor     = (>= 18)
doble       = (2 *)
alMenosCero = (max 0)

-- Con funciones infijas se puede aplicar primer o segundo parámetro
(== 'a') :: Char -> Bool
(+ 5)    :: Num a => a -> a
```

**Diferencia clave:** la composición encadena funciones; la aplicación parcial fija uno o más parámetros generando otra función.

**Currificación:** toda función en Haskell recibe en realidad un parámetro a la vez. `f x y z` es equivalente a `((f x) y) z`. Esto es lo que hace posible la aplicación parcial.

**Point Free:** definición de función sin mencionar los parámetros, usando composición y aplicación parcial.

```haskell
edades         = map edad
adultosMayores = filter esMayor
```

### Recursividad

Una abstracción definida sobre sí misma. Dos tipos:
- Sobre **estructura de datos** (listas): caso base lista vacía.
- Sobre **valores numéricos**: caso base 0 o 1.

```haskell
factorial 0 = 1
factorial n = n * factorial (n-1)

length []     = 0
length (_:xs) = 1 + length xs

take 0 _      = []
take n []     = []
take n (x:xs) = x : take (n-1) xs
```

### Orden Superior

Funciones que **reciben o devuelven otras funciones**. Separan el algoritmo de la implementación particular. Permiten mayor declaratividad, cohesión y expresividad.

```haskell
map    :: (a->b) -> [a] -> [b]
-- aplica f a cada elemento
map doble [1,2,3]  -- [2,4,6]

filter :: (a->Bool) -> [a] -> [a]
-- conserva los que cumplen la condición
filter esMayor personas

all :: (a->Bool) -> [a] -> Bool
-- True si todos cumplen (lazy: corta al primer False)

any :: (a->Bool) -> [a] -> Bool
-- True si alguno cumple (lazy: corta al primer True)

foldr :: (b->a->a) -> a -> [b] -> a
-- reduce una lista con semilla, asociativo a derecha
foldr (+) 0 [1,2,3]  -- 6

foldl :: (a->b->a) -> a -> [b] -> a
-- reduce asociativo a izquierda
```

**Diferencia foldr vs foldl — asociatividad:**

```haskell
-- foldr: asocia a la derecha  (1 - (2 - 3))
foldr1 (-) [1,2,3]   -- = 1 - (2 - 3) = 2

-- foldl: asocia a la izquierda  ((1 - 2) - 3)
foldl1 (-) [1,2,3]   -- = (1 - 2) - 3 = -4
```

**foldl1 / foldr1:** igual que foldl/foldr pero sin semilla — usan el primer elemento como valor inicial. Fallan con lista vacía.

```haskell
foldl1 :: (a->a->a) -> [a] -> a
foldl1 f (x:xs) = foldl f x xs

foldr1 `max` [1,2,3]   -- 3
```

**concatMap:** aplica una función que devuelve lista a cada elemento y concatena los resultados.

```haskell
concatMap :: (a -> [b]) -> [a] -> [b]
concatMap autores todasLasObras   -- lista plana de todos los autores
```

**Otras funciones de Orden Superior útiles:**

```haskell
zipWith :: (a->a->a) -> [a] -> [a] -> [a]
zipWith (+) [1,2,3] [4,5,6]   -- [5,7,9]

iterate :: (a->a) -> a -> [a]   -- genera lista infinita aplicando f repetidamente
iterate (*2) 1   -- [1,2,4,8,16,...]

flip :: (a->b->c) -> b -> a -> c   -- invierte el orden de los dos primeros parámetros
flip (/) 2 10   -- 10/2 = 5.0

($) :: (a->b) -> a -> b   -- aplicación de función, menor precedencia que todo
($) div 10 2   -- equivale a div 10 2 = 5
not . even $ length "hola"   -- aplica (not.even) al resultado de length "hola"
```

**Lambda (función anónima):**

```haskell
map (\x -> x + 1) [1,2,3]
filter (\p -> edad p > 18) personas
```

**Ejemplo completo con Orden Superior:**

```haskell
alimentosPocoCaloricos = map alimento . filter pocoCalorico
pocoCalorico = (<= 100) . calorias
```

### Evaluación Lazy vs Eager

- **Eager:** evalúa los argumentos *antes* de ejecutar la función.
- **Lazy** (Haskell): retrasa la evaluación hasta que es estrictamente necesaria. Permite listas infinitas.

```haskell
-- Lazy: no evalúa el segundo elemento de la tupla
fst (2*40, div 600 0)  -- devuelve 80 sin error

-- Lazy: toma solo el primer elemento de una lista infinita
head (iterate (*2) 1)  -- devuelve 1
```

---

## 3. PARADIGMA LÓGICO - PROLOG

### Conceptos fundamentales

**Universo Cerrado:** todo lo que no está en la base de conocimiento es **FALSO** (no existe "desconocido").

**Taxonomía completa de individuos y predicados:**

```
Individuo
├── Simple
│   ├── Átomo     (empieza con minúscula: juan, sandman)
│   └── Número    (42, 3.14)
└── Compuesto
    ├── Lista     ([a, b, c])
    └── Functor   (punto(3, 4), fecha(2024, junio, 8))

Predicado
├── Propiedad   (aridad 1: esComic(sandman).)
└── Relación    (aridad >1: escribio(gaiman, sandman).)

Cláusula
├── Hecho (Axioma)   (verdad directa)
└── Regla            (conclusión inferida: cabeza :- cuerpo.)

Consulta
├── Individual   (todos instanciados → V/F)
└── Existencial  (con variables libres → liga individuos)
```

### Base de Conocimiento

```prolog
escribio(elsaBornemann, socorro).
escribio(neilGaiman, sandman).
escribio(neilGaiman, buenosPresagios).
escribio(terryPratchett, buenosPresagios).

esComic(sandman).
esComic(watchmen).
```

### Consultas

**Individual** (todos los argumentos instanciados → V/F):

```prolog
?- escribio(neilGaiman, sandman).    % true
?- escribio(neilGaiman, it).         % false
```

**Existencial** (variables libres → Prolog liga individuos):

```prolog
?- escribio(Artista, sandman).       % Artista = neilGaiman
?- escribio(neilGaiman, Obra).       % Obra = sandman ; Obra = buenosPresagios
?- escribio(_, buenosPresagios).     % true
```

**Diferencia clave:** la consulta individual verifica si una relación se cumple para individuos dados; la existencial busca qué individuos satisfacen la relación.

Las variables en Prolog van en **Mayúscula**. La variable anónima `_` ignora el valor.

### Reglas

```prolog
% P ^ Q => R  se escribe  R :- P, Q.
esArtistaDeNovenoArte(Artista) :-
    escribio(Artista, Obra),
    esComic(Obra).
```

La coma `,` es conjunción (Y lógico).

**Tipos de variables en una regla:**
- **Libre**: no está instanciada todavía al momento de la consulta. Ej: `Artista` cuando preguntamos quién escribió algo.
- **Ligada**: ya tiene un valor asignado por unificación. Ej: `Obra` queda ligada al iterar sobre la base de conocimiento.

```prolog
esArtistaDeNovenoArte(Artista) :-
    escribio(Artista, Obra),   % Obra queda ligada al unificarse con cada hecho
    esComic(Obra).
```

### Inversibilidad

Capacidad de un predicado de funcionar con variables libres en cualquiera de sus argumentos.

```prolog
% escribio es inversible: se puede preguntar por Artista u Obra
?- escribio(Artista, sandman).
?- escribio(gaiman, Obra).

% is NO es inversible: el lado derecho debe estar completamente ligado
siguiente(N, S) :- S is N + 1.
?- siguiente(41, S).   % S = 42  → OK
?- siguiente(N, 42).   % ERROR: N no está ligado
```

### Desigualdad en Prolog

```prolog
\=   % desigualdad: se cumple si los dos términos NO unifican
hermano(Uno, Otro) :- padre(Alguien, Uno), padre(Alguien, Otro), Uno \= Otro.
```

### Aritmética en Prolog

El `=` en Prolog **unifica**, no asigna ni compara numéricamente.

Para cálculos numéricos se usa `is`:

```prolog
siguiente(N, S) :- S is N + 1.
?- siguiente(41, S).  % S = 42
```

**Backtracking:** cuando Prolog no puede satisfacer una condición, vuelve al punto de elección anterior y prueba otra alternativa. Es el mecanismo de búsqueda de soluciones del motor de inferencia.

### Cuantificador Universal

```prolog
% forall(Condición, Propiedad): todos los que cumplen Condición, cumplen Propiedad
?- forall(habitat(Animal, Bioma), templado(Bioma)).
```

### Diferencias Predicado Prolog vs Función Haskell

| | Función Haskell | Predicado Prolog |
|---|---|---|
| Retorna | Un valor (unicidad) | Nada (solo V/F) |
| Respuestas | Exactamente una | Puede tener múltiples |
| Variables | Parámetros tipados | Incógnitas ligables |
| Inversible | No aplica | Sí (cuando es posible) |

### Relación Functores con Orden Superior

Los **functores** en Prolog encapsulan individuos compuestos (como `punto(3, 4)`), análogamente a cómo el orden superior en Haskell trata funciones como valores de primer orden. Ambos mecanismos permiten abstraer sobre estructura o comportamiento pasándolos como datos.

---

## 4. PREGUNTAS TIPO PARCIAL - RESPUESTAS DIRECTAS

**Dos diferencias Lenguaje vs Paradigma:**
1. El paradigma es una forma de pensar; el lenguaje es su implementación concreta.
2. Un lenguaje puede implementar múltiples paradigmas (lenguajes híbridos).

**Lenguajes híbridos:** Scala, Python, Kotlin, C++.

**Función partida:** función definida por condiciones (guardas) en lugar de por extensión.
```haskell
f x | x > 0 = x | otherwise = -x
```

**Dominio e imagen:**
- `mealcanza largo = largo <= largoDeListon` → dominio: `Number`, imagen: `Bool`
- `cuantoMesobra cantidad = largoDeListon - cantidad` → dominio: `Number`, imagen: `Number`

**Unicidad y Existencia:** garantizan que las funciones se comporten como funciones matemáticas — siempre hay una respuesta (existencia) y es única por entrada (unicidad).

**Principio de Sustitución:** como una función siempre devuelve lo mismo ante los mismos argumentos, se puede reemplazar cualquier aplicación por su resultado (consecuencia de la transparencia referencial).

**Pattern Matching:** mecanismo que selecciona qué cláusula aplicar comparando los argumentos con patrones de arriba hacia abajo.

**Inferencia de tipos:** Haskell deduce automáticamente el tipo de una función analizando cómo se usan sus parámetros y qué operaciones se aplican sobre ellos.

**Diferencia Tupla vs Data:** la tupla agrupa valores sin nombre propio (pierde semántica); el Data define un tipo con nombre, constructor y funciones de acceso automáticas — es más expresivo.

**Aplicación Parcial vs Composición:** la aplicación parcial fija parámetros de una función generando otra con menos parámetros; la composición encadena funciones para que la salida de una sea la entrada de la siguiente.

**Recursividad:** función definida en términos de sí misma con un caso base que corta la recursión.
```haskell
factorial 0 = 1
factorial n = n * factorial (n-1)
```

**Orden Superior:** funciones que reciben o retornan otras funciones. Ejemplos: `map`, `filter`, `foldr`, `any`, `all`.

**Predicado vs Función Haskell:** el predicado no devuelve valor, solo tiene valor de verdad y puede tener múltiples soluciones; la función siempre retorna exactamente un valor.

**Evaluación EAGER:** evalúa todos los argumentos antes de ejecutar la función (contrario a Lazy de Haskell).

**Átomo, Hechos y Reglas:**
- Átomo: individuo simple en Prolog (`juan`, `sandman`).
- Hecho: cláusula que expresa una verdad directa (`escribio(gaiman, sandman).`).
- Regla: cláusula que infiere una conclusión a partir de condiciones (`esComic(X) :- ...`).

**Consultas individuales vs existenciales:** la individual instancia todos los argumentos y devuelve V/F; la existencial deja variables libres y Prolog retorna los individuos que las satisfacen.

**Aritmética y `=` en Prolog:** `=` unifica (no compara numéricamente ni asigna). Para operar numéricamente se usa `is`. El `is` no es invertible: el lado derecho debe estar completamente ligado.

**Functores vs Orden Superior:** ambos permiten tratar estructura o comportamiento como dato — en funcional son funciones de primer orden pasadas como argumento; en lógico son términos compuestos que encapsulan individuos dentro de un predicado.
