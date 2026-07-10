# COMPENDIO TEÓRICO EXHAUSTIVO
## Paradigmas de Programación: Funcional (Haskell) y Lógico (Prolog)

---

# PARTE 1: CONCEPTOS FUNDAMENTALES

## 1. PROGRAMA VS PARADIGMA

### 1.1 Definición de Programa
Un **programa** es una secuencia de instrucciones que resuelve un problema.

**Distintas perspectivas:**
- **Perspectiva imperativa:** Secuencia de instrucciones paso a paso
- **Perspectiva declarativa:** Especificación de qué se desea lograr
- **Perspectiva estructural:** Cómo está organizado internamente

### 1.2 Definición de Paradigma
Un **paradigma** es:
- Una forma de entender/pensar el mundo
- Una serie de reglas y convenciones
- Un marco conceptual para resolver problemas
- NO es una herramienta, sino una metodología

**Analogía de transporte:**
- **Paradigma imperativo:** Ir en auto (controlas cada paso: volante, acelerador, frenos)
- **Paradigma declarativo:** Ir en remis (solo indicas a dónde, el chofer se encarga)

### 1.3 Relación Lenguaje-Paradigma

**Lenguaje de Programación:**
- Herramienta concreta para escribir código
- Tiene sintaxis y semántica específicas
- Requiere compilador o intérprete
- Proporciona bibliotecas estándar

**Paradigma de Programación:**
- Marco conceptual abstracto
- Forma de pensar el problema
- Filosofía sobre cómo resolver problemas

**Relación:**
- Un paradigma se implementa a través de uno o más lenguajes
- Un lenguaje puede implementar uno o varios paradigmas
- NO hay relación 1-a-1

**Ejemplos:**

```
Paradigma Funcional:
├── Haskell (puro)
├── Lisp
├── Scheme
├── Clojure
└── Scala

Paradigma Lógico:
├── Prolog
├── Datalog
└── Mercury

Paradigma Orientado a Objetos:
├── Java
├── C++
├── Python (hybrid)
└── JavaScript (hybrid)
```

---

## 2. IMPERATIVO VS DECLARATIVO

### 2.1 Paradigma Imperativo

**Características:**
- Responde a la pregunta: **¿CÓMO?**
- Define paso a paso cómo resolver el problema
- Orden de ejecución explícito
- Mantiene estado global (variables)
- Asignación destructiva (reasignación de variables)
- Produce efectos secundarios

**Estructura:**
```
1. Inicializar estado
2. Realizar acción 1
3. Realizar acción 2
4. Realizar acción 3
...
n. Devolver resultado
```

**Ejemplo - Cocinar una pizza (imperativo):**
1. Precalienta el horno a 200°C
2. Extiende la masa
3. Agrega la salsa
4. Agrega los toppings
5. Hornea 15 minutos
6. Retira del horno

**Lenguajes:** C, Java, Python, JavaScript

### 2.2 Paradigma Declarativo

**Características:**
- Responde a la pregunta: **¿QUÉ?**
- Especifica QUIÉN debe hacer qué (delega)
- Flujo de control automático
- NO mantiene estado global
- NO hay asignación destructiva
- NO produce efectos secundarios

**Estructura:**
```
Especificar resultado deseado
→ Sistema/Motor determina cómo lograrlo
```

**Ejemplo - Cocinar una pizza (declarativo):**
- Compro una pizza lista en la pizzería
- Solo especifico: "Quiero una Margherita"
- El pizzero se encarga del proceso

**Lenguajes:** Haskell, Prolog, SQL

### 2.3 Comparación Directa

| Aspecto | Imperativo | Declarativo |
|---------|-----------|------------|
| Pregunta | ¿Cómo? | ¿Qué? |
| Control | Explícito | Implícito/Automático |
| Orden | Define programador | Motor decide |
| Estado | Mantiene estado global | Inmutable |
| Variables | Celdas de memoria | Incógnitas/Valores |
| Asignación | Reasigna (`x = x + 1`) | No existe |
| Efectos | Permite efectos secundarios | Evita efectos |
| Modelo mental | Algoritmo paso a paso | Especificación de relaciones |

### 2.4 Expresividad y Abstracción

**Expresividad:** El código comunica claramente qué hace sin necesidad de explicación adicional

**Ejemplo - Array de números:**

Imperativo (poco expresivo):
```java
int[] arr = {1, 2, 3, 4, 5};
int[] resultado = new int[arr.length];
for (int i = 0; i < arr.length; i++) {
    if (arr[i] > 2 && arr[i] % 2 == 0) {
        resultado[i] = arr[i] * 2;
    }
}
// ¿Qué hace? Necesito analizar el código
```

Declarativo (altamente expresivo):
```haskell
resultado = map (*2) (filter (\x -> x > 2 && even x) [1,2,3,4,5])
-- O aún más claro:
resultado = [x*2 | x <- [1,2,3,4,5], x > 2, even x]
-- Expresa claramente: mapear a doble, de números mayores a 2 y pares
```

**Abstracción:** Separación del QUÉ del CÓMO

---

## 3. LENGUAJES HÍBRIDOS (MULTIPARADIGMA)

Un lenguaje es **híbrido** cuando implementa características de múltiples paradigmas.

### 3.1 Ejemplos Principales

**Python:**
- Imperativo (for, while, if)
- Funcional (map, filter, lambda, comprehensions)
- Orientado a Objetos (clases)

```python
# Imperativo
for numero in [1, 2, 3]:
    print(numero * 2)

# Funcional
resultado = list(map(lambda x: x*2, [1, 2, 3]))

# OO
class Persona:
    def __init__(self, edad):
        self.edad = edad
```

**JavaScript:**
- Imperativo (for, while, if)
- Funcional (arrow functions, map, filter, reduce)
- Orientado a Objetos (prototipo)

```javascript
// Imperativo
for (let i = 0; i < 5; i++) {
    console.log(i * 2);
}

// Funcional
const resultado = [1, 2, 3].map(x => x * 2);

// OO
const obj = { nombre: "Ana", edad: 25 };
```

**Scala:**
- Orientado a Objetos (clases, herencia)
- Funcional (pattern matching, inmutabilidad, funciones de orden superior)

```scala
// OO + Funcional
val numeros = List(1, 2, 3, 4, 5)
val resultado = numeros.filter(_ > 2).map(_ * 2)
```

**Kotlin:**
- Orientado a Objetos (clases)
- Funcional (lambdas, extension functions)

```kotlin
val resultado = listOf(1, 2, 3, 4, 5)
    .filter { it > 2 }
    .map { it * 2 }
```

**Ruby:**
- Imperativo
- Funcional (bloques, symbols, procs)
- Orientado a Objetos

---

# PARTE 2: PARADIGMA FUNCIONAL (HASKELL)

## 4. FUNDAMENTOS DEL PARADIGMA FUNCIONAL

### 4.1 Similitud con Funciones Matemáticas

En matemática, una función es una relación entre conjuntos:

```
f: A → B
f(x) = y

Propiedades:
- Entrada (x) del dominio A
- Salida (y) de la imagen B
- Relación determinística: mismo x → mismo y
```

En programación funcional, las funciones siguen estos principios:

### 4.2 Propiedades de Funciones en Haskell

#### 4.2.1 Unicidad y Existencia

**Existencia:**
```
Para todo elemento ei del dominio,
existe una imagen Si en el codominio
```

**Unicidad:**
```
Para cada elemento ei del dominio,
existe una y solo una imagen Si
No hay dos imágenes distintas Si y Sj para el mismo ei
```

**Contraejemplo - Múltiples imágenes (Prolog):**
```prolog
% Un predicado puede tener múltiples soluciones
?- escribe(X, Y).
X = neil_gaiman, Y = sandman ;
X = neil_gaiman, Y = american_gods ;
```

**En Haskell (función):**
```haskell
-- Una función devuelve UN valor, no múltiples
doble :: Int -> Int
doble x = x * 2

doble 5 = 10  -- SIEMPRE 10, no otros valores
```

#### 4.2.2 Transparencia Referencial

**Definición:**
Una función tiene transparencia referencial cuando:
- **El resultado depende SOLO de sus parámetros**
- **NO depende de variables globales**
- **NO depende de estado externo**
- **NO depende del tiempo de ejecución**
- **NO produce efectos secundarios**

**Consecuencias matemáticas:**

El **Principio de Sustitución** es válido:

```haskell
-- Si x = 5, puedo sustituir x por 5 en cualquier expresión
x = 5
y = x + 3 + x

-- Es EQUIVALENTE a:
y = 5 + 3 + 5

-- Porque doble(x) SIEMPRE es x*2
doble x = x * 2
expresion = doble 10 + doble 10 + doble 10

-- Puede optimizarse a:
expresion = 20 + 20 + 20
-- O incluso:
expresion = doble 10 * 3
```

**CON Transparencia Referencial (Haskell):**
```haskell
sumar :: Int -> Int -> Int
sumar x y = x + y

-- Múltiples llamadas al mismo valor
resultado = sumar 3 5 + sumar 3 5 + sumar 3 5

-- El compilador SABE que sumar 3 5 es siempre 8
-- Puede optimizar a:
resultado = 8 + 8 + 8

-- O incluso memoizar (cachear) el resultado
```

**SIN Transparencia Referencial (Java):**
```java
static int contador = 0;

static int sumar(int x, int y) {
    contador++;  // EFECTO SECUNDARIO
    return x + y;
}

// Mismo parámetro, diferente estado
sumar(3, 5);  // = 8, contador = 1
sumar(3, 5);  // = 8, contador = 2
sumar(3, 5);  // = 8, contador = 3

// No se puede sustituir: el resultado depende del contador
```

#### 4.2.3 Determinismo

Una función es **determinística** cuando:
- Siempre devuelve el mismo resultado para los mismos inputs
- Sin aleatoriedad
- Sin dependencias de tiempo

```haskell
-- Determinística
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

-- Siempre
fibonacci 5 = 5
fibonacci 5 = 5
fibonacci 5 = 5
```

#### 4.2.4 Ausencia de Efectos Secundarios

**Efectos Secundarios:** Cambios en el estado global o ambiente

```haskell
-- PURO (sin efectos)
doble x = x * 2

-- IMPURO (con efectos) - no se puede hacer en Haskell puro
incrementarContador() = {
    contador = contador + 1;  -- Efecto: modifica estado global
    return contador;
}

printAndDouble x = {
    print(x);                 -- Efecto: escribe en pantalla
    return x * 2;
}
```

### 4.3 Restricciones del Paradigma Funcional

En un programa funcional puro:

❌ **NO existen secuencias** (no hay "luego")
❌ **NO existen estructuras de control** (if/while/for tradicionales)
❌ **NO existen variables** (en sentido imperativo)
❌ **NO hay asignación destructiva** (reasignar valores)
❌ **NO hay estado global**

✅ **EN SU LUGAR:**
- Recursividad reemplaza loops
- Pattern matching reemplaza if/switch
- Funciones de orden superior reemplaza estructuras de control
- Composición de funciones reemplaza secuencias

---

## 5. SINTAXIS Y CONCEPTOS BÁSICOS DE HASKELL

### 5.1 Expresiones vs Aplicaciones

**Valor (Expresión):**
```haskell
4           -- Valor de tipo Int
True        -- Valor de tipo Bool
"hola"      -- Valor de tipo String
```

**Función (Expresión):**
```haskell
length      -- Función que calcula longitud
even        -- Función que verifica paridad
(+)         -- Función que suma
```

**Aplicación de función:**
```haskell
length "hola"    -- Aplicación: devuelve 4
even 5           -- Aplicación: devuelve False
3 + 5            -- Aplicación: devuelve 8

-- Tipo de la aplicación es el tipo de retorno
:t length "hola"
length "hola" :: Int
```

### 5.2 Tipado en Haskell

#### 5.2.1 Declaración Explícita de Tipos

**Sintaxis:**
```
nombreFuncion :: tipoParametro1 -> tipoParametro2 -> ... -> tipoRetorno
nombreFuncion parametros = cuerpo
```

**Ejemplos:**
```haskell
-- Función que recibe Int y devuelve Int
doble :: Int -> Int
doble x = x * 2

-- Función que recibe 2 Ints y devuelve Int
suma :: Int -> Int -> Int
suma x y = x + y

-- Función que recibe String y devuelve Int
longitud :: String -> Int
longitud s = length s

-- Función que recibe Int y devuelve Bool
esPar :: Int -> Bool
esPar n = n `mod` 2 == 0
```

#### 5.2.2 Inferencia de Tipos

Haskell puede deducir automáticamente el tipo sin declaración explícita:

```haskell
-- Haskell infiere el tipo automáticamente
doble x = x * 2

-- ¿Cuál es el tipo?
-- Como usamos *, Haskell sabe que x es Num a
-- :t doble
doble :: Num a => a -> a

-- Otro ejemplo
identidad x = x
-- :t identidad
identidad :: a -> a  -- Puede ser cualquier tipo
```

**Pasos de inferencia:**
```haskell
esIgual x y = x == y

-- (==) requiere tipo Eq a
-- Parámetros sin tipo pero usados con ==
-- Por lo tanto:
esIgual :: Eq a => a -> a -> Bool
```

#### 5.2.3 Variables de Tipo (Polimorfismo)

Una **variable de tipo** es un marcador para cualquier tipo:

```haskell
-- 'a' y 'b' son variables de tipo (se usan letras minúsculas)

id :: a -> a                     -- Identidad: devuelve lo que recibe
const :: a -> b -> a             -- Constante: devuelve primer argumento
fst :: (a, b) -> a               -- Primer elemento de tupla
snd :: (a, b) -> b               -- Segundo elemento de tupla
head :: [a] -> a                 -- Primer elemento de lista
tail :: [a] -> [a]               -- Resto de la lista
```

**Ejemplos de uso:**
```haskell
id 5            -- 5 (a = Int)
id "hola"       -- "hola" (a = String)
id True         -- True (a = Bool)

const 5 "ignorar"    -- 5
const "hola" False   -- "hola"

fst (10, "Ana")      -- 10
fst ("Ana", 25)      -- "Ana"
```

#### 5.2.4 Type Classes (Restricciones de Tipo)

Un **Type Class** es una restricción que limita qué tipos puede aceptar una función:

```haskell
-- La función (+) requiere que ambos parámetros sean del mismo tipo
-- Y que ese tipo pertenezca a Num (puede sumarse)
(+) :: Num a => a -> a -> a

-- Explicación:
-- Num a =>   "a debe ser una instancia de Num"
-- a -> a -> a  "toma dos 'a' y devuelve un 'a'"
```

**Type Classes Principales:**

1. **Eq** - Igualdad
```haskell
(==) :: Eq a => a -> a -> Bool
(/=) :: Eq a => a -> a -> Bool

-- Instancias: Int, Bool, String, Char, etc.
-- NO pueden ser: funciones (Int -> Int)
5 == 5              -- True
"hola" == "hola"    -- True
(\x -> x+1) == (\x -> x+1)  -- ERROR: no instancia de Eq
```

2. **Ord** - Ordenamiento
```haskell
(<)  :: Ord a => a -> a -> Bool
(>)  :: Ord a => a -> a -> Bool
(<=) :: Ord a => a -> a -> Bool
(>=) :: Ord a => a -> a -> Bool
compare :: Ord a => a -> a -> Ordering

-- Requiere que el tipo sea Eq también
-- Instancias: Int, Char, String, Bool, etc.
5 < 10              -- True
"abc" < "def"       -- True
```

3. **Num** - Operaciones Numéricas
```haskell
(+)  :: Num a => a -> a -> a
(-)  :: Num a => a -> a -> a
(*)  :: Num a => a -> a -> a
negate :: Num a => a -> a
abs :: Num a => a -> a

-- Instancias: Int, Float, Double, Rational, etc.
5 + 3               -- 8
5.2 + 3.1           -- 8.3
(-5)                -- -5
```

4. **Fractional** - División
```haskell
(/) :: Fractional a => a -> a -> a

-- Instancias: Float, Double, Rational
10 / 2              -- 5.0
10.0 / 3.0          -- 3.333...

-- NO instancia: Int (no puede dividir enteros así)
-- 10 / 3 produce error de tipo
```

5. **Integral** - Enteros
```haskell
div :: Integral a => a -> a -> a    -- División entera
mod :: Integral a => a -> a -> a    -- Módulo
quot, rem :: Integral a => a -> a -> a

-- Instancias: Int, Integer
div 10 3            -- 3
10 `mod` 3          -- 1
```

6. **Show** - Convertir a String
```haskell
show :: Show a => a -> String

show 42             -- "42"
show True           -- "True"
show "hola"         -- "\"hola\""
```

7. **Read** - Parsear desde String
```haskell
read :: Read a => String -> a

read "42" :: Int    -- 42
read "True" :: Bool -- True
read "hola" :: String -- "hola"
```

**Ejemplo - Type Class en Función:**
```haskell
-- Función genérica que solo funciona con tipos que puedan compararse
esMayor :: Ord a => a -> a -> Bool
esMayor x y = x > y

esMayor 5 3         -- True
esMayor 'a' 'z'     -- True
esMayor "Ana" "Bob" -- False

-- Si intento con tipo sin Ord:
esMayor (\x -> x+1) (\x -> x*2)  -- ERROR: No instance of (Ord (a -> a))
```

### 5.3 Alias de Tipos

Un **alias de tipo** es un nombre alternativo para un tipo existente:

```haskell
-- Define alias
type Edad = Int
type Nombre = String
type Persona = (Nombre, Edad)

-- Usa alias
informacion :: Persona -> String
informacion (nombre, edad) = nombre ++ " tiene " ++ show edad

-- Ejemplo
mi_datos :: Persona
mi_datos = ("Ana", 25)
informacion mi_datos  -- "Ana tiene 25"
```

**Ventajas:**
- Más expresividad
- Claridad semántica
- Fácil de cambiar tipo globalmente

---

## 6. PATTERN MATCHING

### 6.1 Definición

**Pattern Matching** es el proceso de especificar un patrón (estructura) que un valor debe tener para que se ejecute una rama del código.

### 6.2 Patrones Literales

Especificar valores concretos:

```haskell
-- Valores constantes
color "banana" = "amarillo"
color "manzana" = "rojo"
color "limón" = "amarillo"
color _ = "desconocido"    -- Variable anónima: acepta cualquier cosa

-- Números
esPrimo 2 = True
esPrimo 3 = True
esPrimo 5 = True
esPrimo _ = False

-- Booleanos
negacion True = False
negacion False = True

-- Orden IMPORTA: se evalúan de arriba a abajo
resultado 1 = "primero"
resultado 1 = "otro"        -- Nunca se ejecuta
resultado _ = "default"
```

### 6.3 Patrones sobre Tuplas

```haskell
-- Tuplas
fst (x, y) = x
snd (x, y) = y

edad (_, e) = e             -- Ignora nombre, devuelve edad

-- Tuplas anidadas
nested ((x, y), z) = x + y + z

-- Ejemplo
es_adulto (_, edad) = edad >= 18
es_adulto ("Ana", 25) = True
es_adulto ("Bob", 15) = False
```

### 6.4 Patrones sobre Listas

```haskell
-- Lista vacía
longitud [] = 0

-- Lista con elementos
longitud (x:xs) = 1 + longitud xs
-- x es primer elemento
-- xs es resto de la lista

-- Primer elemento
primero (x:xs) = x
primero [] = error "Lista vacía"

-- Segundo elemento
segundo (x:y:xs) = y
segundo _ = error "Lista muy pequeña"

-- Lista con exactamente 3 elementos
esTriple [x, y, z] = True
esTriple _ = False

-- Reconstruir lista
agregarAlInicio x xs = x : xs
agregarAlInicio 1 [2, 3] = [1, 2, 3]
```

### 6.5 Patrones con Guardas

Se pueden agregar condiciones:

```haskell
-- Sin guardas
es_adulto (nombre, edad) = edad >= 18

-- Con guardas
es_adulto_verbose (nombre, edad)
    | edad >= 18 = nombre ++ " es adulto"
    | otherwise = nombre ++ " es menor"

-- Múltiples condiciones
categorizar edad
    | edad < 13 = "niño"
    | edad < 18 = "adolescente"
    | edad < 60 = "adulto"
    | otherwise = "adulto mayor"
```

### 6.6 Función Parcial vs Total

**Función Total:**
- Definida para TODOS los valores del dominio
- Maneja todos los casos posibles

```haskell
esPositivo :: Int -> Bool
esPositivo x
    | x > 0 = True
    | otherwise = False
```

**Función Parcial:**
- Definida solo para ALGUNOS valores del dominio
- NO maneja todos los casos
- Genera error si se invoca fuera del dominio

```haskell
-- PARCIAL: no está definida para negativos
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- factorial (-1) causa error o comportamiento indefinido
```

---

## 7. RECURSIVIDAD EN HASKELL

### 7.1 Definición

**Recursividad** es cuando una abstracción está definida en términos de sí misma.

### 7.2 Estructura de Función Recursiva

Toda recursión tiene:
1. **Caso base** - Detiene la recursión
2. **Caso recursivo** - Llamada a sí misma con parámetros más simples

```haskell
-- Estructura genérica
funcion parametro
    | es_caso_base parametro = resultado_directo
    | otherwise = operacion (funcion (parametro_simplificado))
```

### 7.3 Recursión sobre Estructuras de Datos

#### 7.3.1 Recursión sobre Listas

```haskell
-- Longitud de una lista
longitud :: [a] -> Int
longitud [] = 0                   -- Caso base
longitud (x:xs) = 1 + longitud xs -- Caso recursivo

-- Ejemplo paso a paso:
longitud [1, 2, 3]
= 1 + longitud [2, 3]
= 1 + (1 + longitud [3])
= 1 + (1 + (1 + longitud []))
= 1 + (1 + (1 + 0))
= 1 + (1 + 1)
= 1 + 2
= 3

-- Suma de elementos
suma :: [Int] -> Int
suma [] = 0
suma (x:xs) = x + suma xs

suma [1, 2, 3]
= 1 + suma [2, 3]
= 1 + (2 + suma [3])
= 1 + (2 + (3 + suma []))
= 1 + (2 + (3 + 0))
= 1 + (2 + 3)
= 1 + 5
= 6

-- Máximo de una lista
maximo :: [Int] -> Int
maximo [x] = x
maximo (x:xs) = max x (maximo xs)

-- Invertir lista
invertir :: [a] -> [a]
invertir [] = []
invertir (x:xs) = invertir xs ++ [x]
```

#### 7.3.2 Recursión sobre Números

```haskell
-- Factorial
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

factorial 5
= 5 * factorial 4
= 5 * (4 * factorial 3)
= 5 * (4 * (3 * factorial 2))
= 5 * (4 * (3 * (2 * factorial 1)))
= 5 * (4 * (3 * (2 * (1 * factorial 0))))
= 5 * (4 * (3 * (2 * (1 * 1))))
= 120

-- Potencia
potencia :: Int -> Int -> Int
potencia _ 0 = 1
potencia x n = x * potencia x (n-1)

potencia 2 3
= 2 * potencia 2 2
= 2 * (2 * potencia 2 1)
= 2 * (2 * (2 * potencia 2 0))
= 2 * (2 * (2 * 1))
= 8

-- Fibonacci
fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

fibonacci 4
= fibonacci 3 + fibonacci 2
= (fibonacci 2 + fibonacci 1) + (fibonacci 1 + fibonacci 0)
= ((fibonacci 1 + fibonacci 0) + 1) + (1 + 0)
= ((1 + 0) + 1) + 1
= 3
```

#### 7.3.3 Recursión sobre Múltiples Estructuras

```haskell
-- Concatenar dos listas
concatenar :: [a] -> [a] -> [a]
concatenar [] ys = ys
concatenar (x:xs) ys = x : concatenar xs ys

concatenar [1, 2] [3, 4]
= 1 : concatenar [2] [3, 4]
= 1 : (2 : concatenar [] [3, 4])
= 1 : (2 : [3, 4])
= [1, 2, 3, 4]

-- Compara si dos listas son iguales
sonIguales :: Eq a => [a] -> [a] -> Bool
sonIguales [] [] = True
sonIguales [] (_:_) = False
sonIguales (_:_) [] = False
sonIguales (x:xs) (y:ys) = (x == y) && sonIguales xs ys
```

### 7.4 Recursividad en Funciones

```haskell
-- Convertir número a binario
binario :: Int -> String
binario 0 = "0"
binario 1 = "1"
binario n = binario (div n 2) ++ show (mod n 2)

binario 5
= binario 2 ++ show 1
= (binario 1 ++ show 0) ++ "1"
= ((binario 0 ++ show 1) ++ "0") ++ "1"
= (("0" ++ "1") ++ "0") ++ "1"
= ("01" ++ "0") ++ "1"
= "010" ++ "1"
= "0101"
```

---

## 8. APLICACIÓN PARCIAL

### 8.1 Definición

**Aplicación Parcial** es invocar una función con MENOS parámetros de los que declare, obteniendo como resultado OTRA función.

```haskell
-- Función original recibe 2 parámetros
conjuncion :: Bool -> Bool -> Bool
conjuncion True True = True
conjuncion _ _ = False

-- Aplicación PARCIAL: dar solo el primer parámetro
conjuncionConTrue :: Bool -> Bool
conjuncionConTrue = conjuncion True

-- Uso
conjuncionConTrue True   -- True (conjuncion True True)
conjuncionConTrue False  -- False (conjuncion True False)
```

### 8.2 Currificación (Currying)

En Haskell, TODA función con múltiples parámetros es automáticamente currificada:

```haskell
-- Estas dos definiciones son EQUIVALENTES:

-- Notación normal
suma :: Int -> Int -> Int
suma x y = x + y

-- Notación currificada (explícita)
suma :: Int -> (Int -> Int)
suma x = \y -> x + y

-- Explicación:
-- suma toma un Int
-- y devuelve una función que toma otro Int
-- y devuelve Int

-- Uso:
suma 3 5              -- Aplicación completa: 8
(suma 3) 5            -- Mismo que arriba
suma 3                -- Aplicación parcial: función (Int -> Int)
```

### 8.3 Ejemplos de Aplicación Parcial

```haskell
-- Mayor o igual a 18
es_mayor_de_edad :: Int -> Bool
es_mayor_de_edad = (>= 18)

es_mayor_de_edad 25    -- True
es_mayor_de_edad 15    -- False

-- Duplicar
duplicar :: Int -> Int
duplicar = (2 *)

duplicar 5             -- 10
duplicar 100           -- 200

-- Iguala a 'a'
igualAA :: Char -> Bool
igualAA = (== 'a')

igualAA 'a'            -- True
igualAA 'b'            -- False

-- Máximo de 0
alMenosCero :: Int -> Int
alMenosCero = max 0

alMenosCero (-5)       -- 0
alMenosCero 10         -- 10

-- Filtrar con condición
datos = [1, 2, 3, 4, 5]
pares = filter even datos       -- [2, 4]
mayores_a_dos = filter (> 2) datos  -- [3, 4, 5]

-- Map con función parcial
numeros = [1, 2, 3]
duplicados = map (2 *) numeros  -- [2, 4, 6]
```

### 8.4 Currying en Operadores

Los operadores pueden usarse de forma prefija o infija para crear aplicación parcial:

```haskell
-- Función prefija
(+) 3 5        -- 8
(+) 3          -- Función que suma 3 a su parámetro

sumaConTres = (+) 3
sumaConTres 5  -- 8

-- Función infija
3 + 5          -- 8
(3 +) 5        -- 8 (sección: paréntesis + operador + argumento)
(+ 5) 3        -- 8 (sección: paréntesis + argumento + operador)

sumaTres = (+ 3)
sumaTres 10    -- 13

-- División
(/ 2) 10       -- 5.0 (divide por 2)
(10 /) 2       -- 5.0 (divide 10 entre)
dividePorDos = (/ 2)
dividePorDos 20  -- 10.0
```

---

## 9. COMPOSICIÓN DE FUNCIONES

### 9.1 El Operador (.)

**Composición** encadena funciones, pasando la salida de una como entrada de la siguiente:

```haskell
-- Operador (.)
(.) :: (b -> c) -> (a -> b) -> (a -> c)

-- Lectura:
-- (f . g) toma una función f de b -> c
-- y una función g de a -> b
-- y devuelve una función de a -> c

-- Uso:
(f . g) x = f (g x)

-- Ejemplo simple
f x = x * 2
g x = x + 3

(f . g) 5      -- f (g 5) = f 8 = 16
```

### 9.2 Composición con Múltiples Funciones

```haskell
-- Composición de 3 funciones
f x = x * 2
g x = x + 3
h x = x - 1

(f . g . h) 5
= (f . g) (h 5)
= (f . g) 4
= f (g 4)
= f 7
= 14

-- Composición se aplica de DERECHA A IZQUIERDA
not . even . length "hola"
= not (even (length "hola"))
= not (even 4)
= not True
= False
```

### 9.3 Composición en Aplicaciones Reales

```haskell
nota :: Alumno -> Int
esMenorAOcho :: Int -> Bool
not :: Bool -> Bool

-- Sin composición
promociona alumno = not (esMenorAOcho (nota alumno))

-- Con composición
promociona = not . esMenorAOcho . nota

-- Composición encadena transformaciones
-- nota: Alumno -> Int
-- esMenorAOcho: Int -> Bool
-- not: Bool -> Bool
-- Resultado: Alumno -> Bool
```

### 9.4 Point-Free Style (Eliminar Parámetro)

**Point-Free** significa definir funciones sin mencionar explícitamente los parámetros:

```haskell
-- CON parámetro (point-ful)
sumaListas xs = sum (map doble xs)

-- POINT-FREE: eliminar el parámetro
sumaListas = sum . map doble

-- Otro ejemplo
esMayorAl = filter (> 18)

-- Sin point-free
mayoresDeEdad personas = filter (> 18) personas

-- Point-free
mayoresDeEdad = filter (> 18)

-- Ejemplo completo
-- Sumar números pares
sumaPares nums = sum (filter even nums)

-- Sin parámetro
sumaPares = sum . filter even

-- Composición con aplicación parcial
-- map doble
-- filter (> 5)
-- sum

procesarDatos = sum . filter (> 5) . map (2 *)
```

---

## 10. FUNCIONES DE ORDEN SUPERIOR

### 10.1 Definición

Una **función de orden superior** es una función que:
- **Recibe** otra función como parámetro, O
- **Devuelve** una función como resultado

```haskell
-- Orden superior: recibe función
map :: (a -> b) -> [a] -> [b]

-- Orden superior: devuelve función
curry :: ((a, b) -> c) -> (a -> b -> c)

-- Orden superior: ambos
componer :: (b -> c) -> (a -> b) -> (a -> c)
```

### 10.2 MAP: Transformar Elementos

**Definición:**
```haskell
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs
```

**Significado:** Aplica una función a cada elemento de una lista

```haskell
-- Ejemplo 1: Duplicar números
map (\x -> x * 2) [1, 2, 3]
= [2, 4, 6]

-- Ejemplo 2: Obtener longitudes de palabras
map length ["hola", "mundo", "!"]
= [4, 5, 1]

-- Ejemplo 3: Convertir a string
map show [1, 2, 3]
= ["1", "2", "3"]

-- Con aplicación parcial
dobles = map (2 *)
dobles [1, 2, 3]       -- [2, 4, 6]

-- Pattern matching en map
data Persona = Per { nombre :: String, edad :: Int }
personas = [Per "Ana" 25, Per "Bob" 30]
edades = map edad personas  -- [25, 30]
```

### 10.3 FILTER: Seleccionar Elementos

**Definición:**
```haskell
filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter condicion (x:xs)
    | condicion x = x : filter condicion xs
    | otherwise = filter condicion xs
```

**Significado:** Selecciona elementos que cumplen una condición

```haskell
-- Ejemplo 1: Números pares
filter even [1, 2, 3, 4, 5]
= [2, 4]

-- Ejemplo 2: Números mayores a 3
filter (> 3) [1, 2, 3, 4, 5]
= [4, 5]

-- Ejemplo 3: Palabras largas
filter (\p -> length p > 3) ["a", "hola", "ok", "mundo"]
= ["hola", "mundo"]

-- Con aplicación parcial
mayores_a_10 = filter (> 10)
mayores_a_10 [5, 15, 8, 20]  -- [15, 20]

-- Combinado con map
numeros = [1, 2, 3, 4, 5]
resultado = map (2 *) (filter (> 2) numeros)
= map (2 *) [3, 4, 5]
= [6, 8, 10]
```

### 10.4 ALL y ANY

#### ALL: Verificar que Todos Cumplen

```haskell
all :: (a -> Bool) -> [a] -> Bool
all _ [] = True
all condicion (x:xs) = condicion x && all condicion xs

-- Ejemplo
all (> 0) [1, 2, 3]      -- True
all (> 0) [1, 2, -3]     -- False
all even [2, 4, 6]       -- True

-- Ventaja: Evaluación LAZY
all (> 0) [1, 2, -3, 4, 5, 6, ...]
-- Para en [1, 2, -3] porque encuentra False
-- No evalúa el resto
```

#### ANY: Verificar que Alguno Cumple

```haskell
any :: (a -> Bool) -> [a] -> Bool
any _ [] = False
any condicion (x:xs) = condicion x || any condicion xs

-- Ejemplo
any (> 5) [1, 2, 10]     -- True (10 > 5)
any (> 5) [1, 2, 3]      -- False
any even [1, 3, 5, 2]    -- True (2 es par)

-- Ventaja: Evaluación LAZY
any (> 10) [1, 20, 3, ...]
-- Para en [1, 20] porque encuentra True
-- No evalúa el resto
```

### 10.5 FOLD: Reducir a un Valor

**Conceptualmente:** Combina todos los elementos de una lista en un valor único.

#### FOLDR: Fold de Derecha a Izquierda

```haskell
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ semilla [] = semilla
foldr f semilla (x:xs) = f x (foldr f semilla xs)

-- Patrón: f x (foldr f semilla xs)
-- Se asocia a DERECHA

-- Ejemplo: Suma
sum nums = foldr (+) 0 nums

foldr (+) 0 [1, 2, 3]
= 1 + (foldr (+) 0 [2, 3])
= 1 + (2 + (foldr (+) 0 [3]))
= 1 + (2 + (3 + (foldr (+) 0 [])))
= 1 + (2 + (3 + 0))
= 6

-- Ejemplo: Producto
product nums = foldr (*) 1 nums

foldr (*) 1 [1, 2, 3]
= 1 * (2 * (3 * 1))
= 6

-- Ejemplo: Longitud
length nums = foldr (\_ acc -> acc + 1) 0 nums

foldr (\_ acc -> acc + 1) 0 [1, 2, 3]
= 1 + (2 + (3 + 0))      -- No, esto es conceptual
-- Realmente:
= (\_ acc -> acc + 1) 1 (foldr (\_ acc -> acc + 1) 0 [2, 3])
= (\_ acc -> acc + 1) 1 ((\_ acc -> acc + 1) 2 (foldr (\_ acc -> acc + 1) 0 [3]))
= (\_ acc -> acc + 1) 1 ((\_ acc -> acc + 1) 2 ((\_ acc -> acc + 1) 3 0))
= (\_ acc -> acc + 1) 1 ((\_ acc -> acc + 1) 2 1)
= (\_ acc -> acc + 1) 1 2
= 3

-- Ejemplo: Concatenar strings
foldr (++) "" ["hola", "mundo", "!"]
= "hola" ++ (foldr (++) "" ["mundo", "!"])
= "hola" ++ ("mundo" ++ (foldr (++) "" ["!"]))
= "hola" ++ ("mundo" ++ ("!" ++ ""))
= "holamundo!"
```

#### FOLDL: Fold de Izquierda a Derecha

```haskell
foldl :: (a -> b -> a) -> a -> [b] -> a
foldl _ semilla [] = semilla
foldl f semilla (x:xs) = foldl f (f semilla x) xs

-- Patrón: foldl f (f semilla x) xs
-- Se asocia a IZQUIERDA

-- Ejemplo: Suma
foldl (+) 0 [1, 2, 3]
= foldl (+) (0 + 1) [2, 3]
= foldl (+) 1 [2, 3]
= foldl (+) (1 + 2) [3]
= foldl (+) 3 [3]
= foldl (+) (3 + 3) []
= foldl (+) 6 []
= 6
```

#### Diferencia entre FOLDL y FOLDR

```haskell
-- Resta: más clara la diferencia

foldr (-) 0 [1, 2, 3]
= 1 - (foldr (-) 0 [2, 3])
= 1 - (2 - (foldr (-) 0 [3]))
= 1 - (2 - (3 - 0))
= 1 - (2 - 3)
= 1 - (-1)
= 2

foldl (-) 0 [1, 2, 3]
= foldl (-) (0 - 1) [2, 3]
= foldl (-) (-1) [2, 3]
= foldl (-) (-1 - 2) [3]
= foldl (-) (-3) [3]
= foldl (-) (-3 - 3) []
= foldl (-) (-6) []
= -6

-- Operadores conmutativos: (+, *, ++) dan mismo resultado
-- Operadores no conmutativos: (-, /, div) dan resultado DIFERENTE
```

#### FOLDL1 y FOLDR1: Sin Semilla

```haskell
-- Usa el primer elemento como semilla
foldr1 :: (a -> a -> a) -> [a] -> a
foldr1 f [x] = x
foldr1 f (x:xs) = f x (foldr1 f xs)

foldl1 :: (a -> a -> a) -> [a] -> a
foldl1 f (x:xs) = foldl f x xs

-- Ejemplo
foldr1 (+) [1, 2, 3]    -- 1 + (2 + 3) = 6
foldl1 (+) [1, 2, 3]    -- ((1 + 2) + 3) = 6
foldr1 (-) [1, 2, 3]    -- 1 - (2 - 3) = 2
foldl1 (-) [1, 2, 3]    -- ((1 - 2) - 3) = -4
```

### 10.6 LAMBDA: Funciones Anónimas

**Lambda** es una función sin nombre:

```haskell
-- Sintaxis: \parámetros -> cuerpo

-- Lambda simple
\x -> x + 1

-- Lambda con múltiples parámetros
\x y -> x + y

-- Uso con map
map (\x -> x * 2) [1, 2, 3]
= [2, 4, 6]

-- Uso con filter
filter (\x -> x > 3) [1, 2, 3, 4, 5]
= [4, 5]

-- Uso con fold
foldr (\x acc -> x + acc * 2) 0 [1, 2, 3]

-- Lambda en composición
procesarDatos = map (\x -> x * 2) . filter (\x -> x > 0)
```

---

## 11. EVALUACIÓN LAZY VS EAGER

### 11.1 Evaluación Eager (Estricta)

En evaluación **eager**:
- Se evalúan TODOS los parámetros ANTES de ejecutar la función
- Se calcula todo aunque no se use

```haskell
-- Lenguaje imperativo (Java)
static int fst(int x, int y) {
    return x;
}

int resultado = fst(2*40, div(600, 0));  // ERROR: Intenta calcular div(600, 0)
```

### 11.2 Evaluación Lazy (Perezosa)

En evaluación **lazy**:
- Se retrasa la evaluación hasta que sea absolutamente necesaria
- Solo se calcula lo que se usa

```haskell
-- Haskell
fst (2*40, div 600 0)  -- 80
-- div 600 0 NUNCA se evalúa porque no se necesita

-- Otro ejemplo
ifThenElse condicion valor_si valor_no
    | condicion = valor_si
    | otherwise = valor_no

ifThenElse True 42 (1/0)  -- 42 (no evalúa 1/0)
ifThenElse False 42 (1/0) -- ERROR (debe evaluar 1/0)
```

### 11.3 Ventajas de Lazy Evaluation

1. **Eficiencia:** No calcula lo innecesario
```haskell
head (map (*2) [1..1000000])  -- Solo calcula 1*2
```

2. **Listas infinitas:** Posible trabajar con secuencias infinitas
```haskell
infinitos = [1, 2, 3, ..]    -- Lista infinita
take 5 infinitos             -- [1, 2, 3, 4, 5]
-- Solo calcula los 5 primeros

head (filter (> 1000000) [1..])  -- Encuentra 1000001
-- Sin lazy evaluation, esto entraría en loop infinito
```

3. **Mejor paralelización:** Permite compilador optimizar

### 11.4 Limitaciones de Lazy Evaluation

```haskell
-- No se puede predecir cuándo se evalúa
lista = [1, 2, error "boom", 4]
head lista            -- 1 (OK)
take 3 lista          -- [1, 2] y luego ERROR
length lista          -- ERROR (debe contar todo)
```

---

## 12. TUPLAS Y DATA TYPES

### 12.1 Tuplas

Una **tupla** es una estructura que agrupa un número FIJO de elementos de tipos POSIBLEMENTE DIFERENTES.

```haskell
-- Tupla de 2 elementos (par)
(10, "Ana")
(True, 5, "hello")

-- Acceso
fst (10, "Ana")        -- 10
snd (10, "Ana")        -- "Ana"

-- Pattern matching
(x, y) = (10, "Ana")
x  -- 10
y  -- "Ana"

-- Tipos
:t (10, "Ana")
(10, "Ana") :: (Int, String)

:t (1, 2, 3)
(1, 2, 3) :: (Int, Int, Int)

:t (True, 'a', [1,2])
(True, 'a', [1,2]) :: (Bool, Char, [Int])

-- No son homogéneas en tipo
-- Listas SÍ: [1, 2, 3] todos Int
-- Tuplas NO: (1, "a", True) mix de tipos
```

### 12.2 Type Classes para Tuplas

```haskell
-- Eq? Depende de elementos
("Ana", 25) == ("Ana", 25)   -- True (ambos elementos iguales)
("Ana", 25) == ("Bob", 25)   -- False

-- Ord? Depende de elementos
("Ana", 25) < ("Bob", 30)    -- True
(1, 'a') < (2, 'a')          -- True

-- Show? SÍ
show (10, "Ana")             -- "(10,\"Ana\")"

-- Num? NO
(1, 2) + (3, 4)              -- ERROR

-- Fractional? NO
(1.0, 2.0) / (2.0, 2.0)      -- ERROR
```

### 12.3 Data Types

Un **data type** es una estructura más expresiva que una tupla:

```haskell
-- Definición
data Estudiante = UnEstudiante {
    nombre :: String,
    legajo :: String,
    nota :: Int
}

-- Crear valor
juan :: Estudiante
juan = UnEstudiante "Juan" "L004100-3" 8

-- O con sintaxis alternativa
ana :: Estudiante
ana = UnEstudiante {
    nombre = "Ana",
    legajo = "L004101-4",
    nota = 9
}

-- Acceso a campos
nombre juan              -- "Juan"
nota ana                 -- 9
legajo juan              -- "L004100-3"

-- Pattern matching
mostrarEstudiante (UnEstudiante n l no) = 
    n ++ " (" ++ l ++ "): " ++ show no

-- Modificar (crea nueva copia)
juan_mejorado = juan { nota = 9 }
nota juan                -- 8 (original sin cambiar)
nota juan_mejorado       -- 9 (copia modificada)
```

### 12.4 Type Classes para Data Types

```haskell
-- Sin deriving
data Persona = UnaPer String Int

mostrar (UnaPer n e) = n ++ ": " ++ show e

-- Con deriving
data Persona = UnaPer String Int deriving (Show, Eq, Ord)

show (UnaPer "Ana" 25)         -- "UnaPer \"Ana\" 25"
UnaPer "Ana" 25 == UnaPer "Ana" 25   -- True
UnaPer "Ana" 25 < UnaPer "Bob" 30    -- True (compara lexicográficamente)
```

### 12.5 Data Types Alternativos

Cuando hay opciones:

```haskell
-- Un estudiante PUEDE ser:
-- - Presencial (asistencia, aula)
-- - Virtual (link, horario)

data Estudiante = 
    Presencial {
        nombre :: String,
        aula :: String
    } |
    Virtual {
        nombre :: String,
        link :: String
    }

-- Uso
juan = Presencial "Juan" "Aula 101"
maria = Virtual "Maria" "https://zoom.us/..."

-- Pattern matching
ubicacion (Presencial n aula) = "Aula: " ++ aula
ubicacion (Virtual n link) = "Link: " ++ link
```

---

## 13. LISTAS EN HASKELL

### 13.1 Estructura de Listas

```haskell
-- Definición recursiva:
-- Una lista es:
-- - Lista vacía []
-- - O un elemento seguido de una lista (x : xs)

[1, 2, 3]           -- Notación de azúcar sintáctico
1 : 2 : 3 : []      -- Forma explícita

-- Equivalencias:
[1, 2, 3] = 1 : [2, 3] = 1 : 2 : [3] = 1 : 2 : 3 : []

-- Operaciones básicas
head [1, 2, 3]      -- 1 (primer elemento)
tail [1, 2, 3]      -- [2, 3] (resto)
length [1, 2, 3]    -- 3
reverse [1, 2, 3]   -- [3, 2, 1]
sum [1, 2, 3]       -- 6
product [1, 2, 3]   -- 6
maximum [1, 2, 3]   -- 3
minimum [1, 2, 3]   -- 1
sort [3, 1, 2]      -- [1, 2, 3]

-- Concatenación
[1, 2] ++ [3, 4]    -- [1, 2, 3, 4]
"hola" ++ "mundo"   -- "holamundo"

-- Pertenencia
elem 2 [1, 2, 3]    -- True
2 `elem` [1, 2, 3]  -- True (notación infija)
```

### 13.2 Listas por Comprensión

Notación similar a matemática para generar listas:

```haskell
-- Básico
[x * 2 | x <- [1, 2, 3]]
= [2, 4, 6]

-- Con condición
[x * 2 | x <- [1, 2, 3, 4, 5], x > 2]
= [6, 8, 10]

-- Múltiples condiciones
[x * 2 | x <- [1..10], x > 2, x < 8, even x]
= [8, 12]

-- Múltiples generadores
[(x, y) | x <- [1, 2], y <- ['a', 'b']]
= [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b')]

-- Anidadas
[[y * 2 | y <- [1, 2]] | x <- [1, 2, 3]]
= [[2, 4], [2, 4], [2, 4]]

-- Combinatorias
pitagoricos = [(a, b, c) | a <- [1..20], b <- [a..20], c <- [b..20], a^2 + b^2 == c^2]
```

---

## 14. GUARDAS EN HASKELL

### 14.1 Sintaxis

Las **guardas** (guards) son condiciones sobre parámetros:

```haskell
funcion parametro
    | condicion1 = resultado1
    | condicion2 = resultado2
    | otherwise = resultado_default

-- Evaluación: de arriba a abajo, primera verdadera se ejecuta
```

### 14.2 Ejemplos

```haskell
-- Función simple
esAdulto edad
    | edad >= 18 = True
    | otherwise = False

-- Múltiples guardas
categorizar edad
    | edad < 13 = "niño"
    | edad < 18 = "adolescente"
    | edad < 60 = "adulto"
    | otherwise = "adulto mayor"

-- Con parámetros múltiples
maximo x y
    | x > y = x
    | otherwise = y

-- Combinar pattern matching y guardas
anio (dia, mes, anio)
    | anio < 2000 = "Pasado"
    | anio == 2000 = "Milenio"
    | otherwise = "Futuro"

-- Guards sin otherwise (función parcial)
dividir x y
    | y /= 0 = x / y
    -- Si y == 0, error
```

---

# PARTE 3: PARADIGMA LÓGICO (PROLOG)

## 15. FUNDAMENTOS DEL PARADIGMA LÓGICO

### 15.1 Diferencia Conceptual con Funcional

**Paradigma Funcional:**
- Preguntas: "¿CÓMO transformo datos?"
- Método: Aplicar transformaciones
- Flujo: Programador define explícitamente
- Resultado: Un valor único

**Paradigma Lógico:**
- Preguntas: "¿QUÉ datos cumplen esta relación?"
- Método: Búsqueda usando inferencia
- Flujo: Motor de inferencia busca
- Resultado: Múltiples soluciones posibles

### 15.2 Base de Conocimiento

Una **base de conocimiento** es un conjunto de hechos y reglas que definen lo que es verdadero en el universo del programa.

```prolog
% HECHOS: Afirmaciones sobre individuos
padre(abraham, isaac).
padre(isaac, jacob).
madre(sara, isaac).
madre(rebeca, jacob).

% REGLAS: Definiciones condicionales
abuelo(X, Z) :- padre(X, Y), padre(Y, Z).
ancestro(X, Y) :- padre(X, Y).
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).
```

### 15.3 Principio de Universo Cerrado

**Universo Cerrado (Closed World Assumption):**
```
Si un hecho NO está en la base de conocimiento,
entonces es FALSO.
```

```prolog
padre(abraham, isaac).  % true (en BD)

padre(abraham, isaac)   % true
padre(abraham, jacob)   % false (no en BD = falso)
padre(socrates, platon) % false (no está)
```

### 15.4 Predicados: Propiedades vs Relaciones

**Predicado monádico (aridad 1) = Propiedad:**
```prolog
% Propiedad: "es X"
esComic(sandman).
esComic(watchmen).
esNovela(fundacion).
esMayor(ana).

% Consultas
esComic(sandman).       % true
esMayor(pepe).          % false (no en BD)
```

**Predicado poliádico (aridad > 1) = Relación:**
```prolog
% Relación: "X se relaciona con Y"
escribio(neil_gaiman, sandman).
escribio(alan_moore, watchmen).
padre(abraham, isaac).
ama(juan, maria).

% Consultas
escribio(gaiman, sandman).  % true
padre(isaac, jacob).        % true
padre(jacob, isaac).        % false
```

---

## 16. CLÁUSULAS: HECHOS Y REGLAS

### 16.1 Hechos (Axiomas)

Un **hecho** es una afirmación sobre el mundo, sin condiciones:

```prolog
% Hechos simples
escritor(neil_gaiman).
escritor(alan_moore).

% Hechos relacionales
escribio(neil_gaiman, sandman).
escribio(neil_gaiman, american_gods).
escribio(alan_moore, watchmen).

% Hechos complejos
libro(sandman, neil_gaiman, 1989, comic).
% predicado(arg1, arg2, arg3, arg4)
```

### 16.2 Reglas

Una **regla** es una definición condicional:

```prolog
% Sintaxis: cabeza :- cuerpo.
% Si cuerpo es verdadero, entonces cabeza es verdadero

% Ejemplo 1: Simple
esAutor(Persona) :- escritor(Persona).

% Ejemplo 2: Múltiples condiciones (conjunción)
esArtistaDeNovenoArte(Artista) :- 
    escribio(Artista, Obra), 
    esComic(Obra).

% Traducción:
% "Artista es artista de noveno arte SI
%  existe una Obra tal que
%  Artista escribió Obra Y
%  Obra es comic"

% Ejemplo 3: Recursión
ancestro(X, Y) :- padre(X, Y).          % Caso base
ancestro(X, Y) :- padre(X, Z), ancestro(Z, Y).  % Caso recursivo
```

---

## 17. CONSULTAS: INDIVIDUAL VS EXISTENCIAL

### 17.1 Consulta Individual

Una **consulta individual** pregunta: "¿Es ESTO verdadero?"
- Todos los argumentos están INSTANCIADOS (ligados)
- Respuesta: true o false

```prolog
% Ejemplos
?- escribio(neil_gaiman, sandman).
true.

?- escribio(alan_moore, sandman).
false.

?- padre(abraham, isaac).
true.

?- padre(isaac, jacob).
true.

?- padre(jacob, isaac).
false.
```

### 17.2 Consulta Existencial

Una **consulta existencial** pregunta: "¿Quién/Qué...?"
- Al menos un argumento es VARIABLE (no instanciado)
- Respuesta: Valor(es) que satisfacen la consulta

```prolog
% Ejemplo 1: Variable en segunda posición
?- escribio(neil_gaiman, X).
X = sandman ;
X = american_gods ;
X = buenos_presagios ;
false.

% Ejemplo 2: Variable en primera posición
?- escribio(Y, sandman).
Y = neil_gaiman ;
false.

% Ejemplo 3: Múltiples variables
?- escribio(X, Y).
X = neil_gaiman, Y = sandman ;
X = neil_gaiman, Y = american_gods ;
X = neil_gaiman, Y = buenos_presagios ;
X = alan_moore, Y = watchmen ;
...
false.

% Ejemplo 4: Sin argumentos
?- escritor(X).
X = neil_gaiman ;
X = alan_moore ;
...
false.
```

### 17.3 Diferencia Clave

| Tipo | Descripción | Respuesta |
|------|-------------|----------|
| **Individual** | ¿Es verdadero este hecho específico? | true / false |
| **Existencial** | ¿Qué/quién satisface esta condición? | Valor(es) que cumplen |

---

## 18. INVERSIBILIDAD

### 18.1 Definición

Un **predicado es inversible** cuando puede usarse en múltiples "direcciones":

```prolog
% Predicado inversible
padre(X, Y)

% Dirección 1: Dado padre, encontrar hijo
?- padre(abraham, X).
X = isaac.

% Dirección 2: Dado hijo, encontrar padre
?- padre(Y, isaac).
Y = abraham.

% Dirección 3: Verificar relación
?- padre(abraham, isaac).
true.

% Dirección 4: Enumerar todas las relaciones
?- padre(X, Y).
X = abraham, Y = isaac ;
X = isaac, Y = jacob ;
...
```

### 18.2 Predicado NO Inversible

```prolog
% Con "is"
edad(maria, 25).
siguiente(N, S) :- S is N+1.

% Funcionan:
?- siguiente(41, X).
X = 42.            % OK: ligamos X

?- siguiente(41, 42).
true.              % OK: verificamos

% NO funcionan:
?- siguiente(X, 42).
ERROR: unbounded variable
% "is" no puede deshacer la operación
```

### 18.3 Causas de No Inversibilidad

1. **Operadores aritméticos (is):**
```prolog
cuadruple(N, C) :- C is N * 4.
?- cuadruple(5, X).      % OK
?- cuadruple(X, 20).     % ERROR
```

2. **Funciones no inversibles:**
```prolog
mayor(X, Y) :- X > Y.
?- mayor(10, 5).         % OK
?- mayor(10, X).         % ERROR: X no se puede despejar de X < 10
```

3. **Operadores built-in no inversibles:**
```prolog
:- X = 5.               % OK: unificación
:- 5 = X.               % OK: unificación
:- 5 is 2+3.            % OK: verificación
:- X is 2+3.            % OK: cálculo
:- 5 is X+3.            % ERROR: X no ligado
```

---

## 19. UNIFICACIÓN

### 19.1 Definición

**Unificación** es el proceso de hacer que dos términos sean IDÉNTICOS ligando variables a valores:

```prolog
% Unificación simple
?- X = 5.
X = 5.

% Unificación con estructura
?- (X, Y) = (10, ana).
X = 10,
Y = ana.

% Unificación con lista
?- [H|T] = [1, 2, 3].
H = 1,
T = [2, 3].

% Unificación en consulta
?- padre(abraham, X).
X = isaac.   % X se unifica con isaac

% Unificación múltiple
?- padre(X, Y).
X = abraham, Y = isaac ;
X = isaac, Y = jacob ;
...
```

### 19.2 Algoritmo de Unificación

```
Para unificar dos términos A y B:

1. Si A == B, éxito (ya son iguales)

2. Si A es variable:
   - Si A ya está ligada a X, intenta unificar X con B
   - Si A no está ligada, liga A a B, éxito

3. Si B es variable (similar a 2)

4. Si ambos son estructuras:
   - Deben tener mismo functor y aridad
   - Intenta unificar sus argumentos

5. Si nada coincide, fallo
```

### 19.3 Ejemplos de Unificación

```prolog
% Éxito
?- f(X, a) = f(b, a).
X = b.

?- [H|T] = [1, 2, 3].
H = 1, T = [2, 3].

?- (X, X) = (a, a).
X = a.

% Fallo
?- f(X) = g(X).
false.   % Diferentes functores

?- [1, 2] = [1, 2, 3].
false.   % Diferentes estructuras

?- (X, X) = (a, b).
false.   % X no puede ser a y b simultáneamente
```

---

## 20. BACKTRACKING

### 20.1 Definición

**Backtracking** es el proceso automático de exploración de alternativas cuando una rama falla.

```
Cuando una consulta falla:
1. Retrocede al último punto de elección
2. Intenta la siguiente alternativa
3. Continúa explorando
4. Si todas fallan, devuelve false
```

### 20.2 Ejemplo Simple

```prolog
% Base de datos
color(rojo).
color(azul).
color(verde).

% Consulta
?- color(X).
X = rojo ;       % Primera solución
X = azul ;       % Backtracking: intenta siguiente
X = verde ;      % Backtracking: intenta siguiente
false.           % No hay más alternativas
```

**Proceso:**
```
?- color(X).

Paso 1: Intenta unificar con color(rojo)
        X = rojo → true, devuelve primer resultado

Usuario pide más (;)

Paso 2: Backtracking: descarta rojo
        Intenta unificar con color(azul)
        X = azul → true, devuelve segundo resultado

Usuario pide más (;)

Paso 3: Backtracking: descarta azul
        Intenta unificar con color(verde)
        X = verde → true, devuelve tercer resultado

Usuario pide más (;)

Paso 4: Backtracking: descarta verde
        No hay más hechos
        false.
```

### 20.3 Backtracking en Reglas

```prolog
% Base de datos
padre(abraham, isaac).
padre(isaac, jacob).
madre(sara, isaac).
madre(rebeca, jacob).

% Regla
abuelo(X, Z) :- padre(X, Y), padre(Y, Z).

% Consulta
?- abuelo(X, jacob).
```

**Proceso:**
```
?- abuelo(X, jacob).

Paso 1: Intenta primera cláusula: abuelo(X, Z) :- padre(X, Y), padre(Y, Z).
        Unifica: Z = jacob
        Ahora debe probar: padre(X, Y), padre(Y, jacob)

Paso 2: Intenta padre(X, Y)
        Primera solución: X = abraham, Y = isaac
        Continúa con: padre(isaac, jacob)?

Paso 3: Prueba padre(isaac, jacob)
        true (en BD)
        Devuelve: X = abraham ✓

Usuario pide más (;)

Paso 4: Backtracking en padre(Y, jacob)
        Siguiente solución: Y = isaac (segunda entrada de padre)
        Ahora prueba: padre(X, isaac)?

Paso 5: Prueba padre(X, isaac)
        Primera solución: X = abraham
        Prueba padre(abraham, jacob)?
        false

Paso 6: Backtracking, siguiente solución de padre(X, isaac)
        X = isaac
        Prueba padre(isaac, jacob)?
        true
        Pero este ya se probó arriba

... continúa explorando todas las combinaciones
```

### 20.4 Importancia del Backtracking

```prolog
% Sin backtracking explícito:
% Prolog lo hace automáticamente

% Encontrar todos los
% que satisfacen un predicado

empleado(juan).
empleado(maria).
empleado(carlos).

sueldo(juan, 30000).
sueldo(maria, 35000).
sueldo(carlos, 32000).

% Consulta: empleados y sus sueldos
?- empleado(E), sueldo(E, S).
E = juan, S = 30000 ;
E = maria, S = 35000 ;
E = carlos, S = 32000 ;
false.

% Backtracking explora:
% 1. E = juan, ¿sueldo(juan, S)? → S = 30000
% 2. E = maria, ¿sueldo(maria, S)? → S = 35000
% 3. E = carlos, ¿sueldo(carlos, S)? → S = 32000
```

---

## 21. ARITMÉTICA EN PROLOG

### 21.1 El Operador (=)

El operador `=` es **unificación**, NO asignación:

```prolog
% Unificación
?- X = 5.
X = 5.

?- 5 = 5.
true.

?- 5 = 6.
false.

?- X = 5, Y = X.
X = 5, Y = 5.

% NO es evaluación aritmética
?- X = 5 + 3.
X = +(5, 3).   % X es la ESTRUCTURA (5 + 3), no 8
```

### 21.2 El Operador "is"

`is` **evalúa** la expresión aritmética:

```prolog
% Evaluación aritmética
?- X is 5 + 3.
X = 8.

?- Y is 2 * 4.
Y = 8.

?- Z is 10 / 2.
Z = 5.0.

?- W is 10 mod 3.
W = 1.

?- V is abs(-5).
V = 5.

?- sqrt_val is sqrt(25).
sqrt_val = 5.0.
```

### 21.3 Limitación: "is" NO es Inversible

```prolog
% Funciona (lado derecho sin variables)
?- X is 5 + 3.
X = 8.

?- 8 is 5 + 3.
true.    % Verifica que 8 es 5+3

% NO funciona (lado derecho con variables)
?- Y is X + 3.
ERROR: Arguments are not sufficiently instantiated

% Porque "is" solo evalúa de derecha a izquierda
% No puede resolver ecuaciones
?- 8 is Y + 3.
ERROR: Cannot evaluate Y (no está ligada)
```

### 21.4 Operadores de Comparación Aritmética

```prolog
% Estos requieren que ambos lados sean expresiones evaluables

?- 5 > 3.
true.

?- 5 < 3.
false.

?- 5 =:= 5.
true.   % Igualdad aritmética

?- 5 =\= 3.
true.   % Desigualdad aritmética

?- X is 5, X > 3.
true.   % Primero evalúa X, luego compara

?- X > 3.
ERROR: X not instantiated
```

---

## 22. CONJUNCIÓN Y DISYUNCIÓN

### 22.1 Conjunción (AND) - Coma

La **coma** representa AND (todos deben ser verdaderos):

```prolog
% Si A y B, entonces C
resultado(X) :- condicion_a(X), condicion_b(X).

% Ejemplo
persona(juan, 25).
persona(ana, 17).

es_adulto(X) :- persona(X, Edad), Edad >= 18.

?- es_adulto(juan).
true.

?- es_adulto(ana).
false.
```

### 22.2 Disyunción (OR) - Punto y Coma

El **punto y coma** representa OR (al menos uno debe ser verdadero):

```prolog
% Si A o B, entonces C (en el cuerpo de regla)
% Nota: En Haskell la disyunción se expresa diferente
% En Prolog se hace con múltiples cláusulas o con (;)

% Opción 1: Múltiples cláusulas
genero_film(X) :- accion(X).
genero_film(X) :- drama(X).
genero_film(X) :- comedia(X).

% Equivalente a: accion(X) ; drama(X) ; comedia(X)

% Opción 2: Punto y coma dentro de consulta
?- accion(X) ; drama(X).
% Devuelve todas las películas que son acción O drama
```

### 22.3 Negación

La **negación** `\+` significa "no se puede demostrar":

```prolog
% \+ es negación por fallo (Negation as Failure)

soltero(juan).
soltero(carlos).
casado(maria).

esUniversitario(maria).
esUniversitario(juan).

% "Persona desempleada es que no trabaja"
desempleado(X) :- \+ trabaja(X).

% "Persona que no es casada"
noEsCasada(X) :- \+ casado(X).

?- noEsCasada(juan).
true.

?- noEsCasada(maria).
false.
```

---

## 23. FORALL: CUANTIFICADOR UNIVERSAL

### 23.1 Sintaxis y Significado

```prolog
forall(Condicion, Accion)

% Significa:
% "Para TODO X que satisface Condicion,
%  X también satisface Accion"

% Equivalentemente:
% "NO existe X que satisface Condicion
%  pero NO satisface Accion"
```

### 23.2 Ejemplos

```prolog
% Base de datos
habitat(leon, sabana).
habitat(oso, bosque).
habitat(pinguino, polo).

templado(sabana).
templado(bosque).
% polo NO es templado

% Verificación
?- forall(habitat(Animal, Bioma), templado(Bioma)).
false.   % Porque pinguino habita en polo que NO es templado

% Agregar el dato
templado(polo).

?- forall(habitat(Animal, Bioma), templado(Bioma)).
true.   % Ahora todos los hábitats son templados
```

### 23.3 Equivalencia Lógica

```prolog
% forall(Cond, Acc) es equivalente a:
\+ (Cond, \+ Acc)

% Es decir:
% "NO existe X que satisface Cond pero NO satisface Acc"

% Ejemplo:
forall(habitat(A, B), templado(B))
≡
\+ (habitat(A, B), \+ templado(B))

% "NO existe un animal cuyo hábitat NO es templado"
```

---

# PARTE 4: COMPARACIONES Y SÍNTESIS

## 24. COMPARACIÓN HASKELL VS PROLOG

### 24.1 Tabla Comparativa Completa

| Aspecto | Haskell | Prolog |
|---------|---------|--------|
| **Tipo** | Funcional | Lógico |
| **Enfoque** | Transformación de datos | Búsqueda de soluciones |
| **Pregunta** | ¿Cómo transformo datos? | ¿Qué cumple esta relación? |
| **Resultado** | Valor único | Múltiples soluciones (backtracking) |
| **Flujo** | Programador define | Motor de inferencia decide |
| **Recursividad** | Explícita en funciones | Implícita en búsqueda |
| **Variables** | Valores constantes | Incógnitas a unificar |
| **Asignación** | NO existe | NO existe (unificación) |
| **Estado** | Inmutable | Unificación variable/valor |
| **Tipado** | Explícito e inferido | Implícito |
| **Orden de ejecución** | Claro y determinista | Automático (busca alternativas) |
| **Efectos secundarios** | NO permitidos | Evitados |
| **Estructura datos** | Tuplas, listas, data types | Predicados, términos |
| **Abstracción** | Funciones | Predicados |

### 24.2 Ejemplo Paralelo: Encontrar Números Pares

**En Haskell:**
```haskell
-- Definir qué es un número par
esPar :: Int -> Bool
esPar n = n `mod` 2 == 0

-- Filtrar números pares
numeros = [1, 2, 3, 4, 5]
pares = filter esPar numeros
-- pares = [2, 4]

-- O como función
obtenerPares :: [Int] -> [Int]
obtenerPares = filter esPar
```

**En Prolog:**
```prolog
% Definir números en BD
numero(1).
numero(2).
numero(3).
numero(4).
numero(5).

% Definir qué es un par
esPar(N) :- numero(N), N mod 2 =:= 0.

% Consultar
?- esPar(X).
X = 2 ;
X = 4 ;
false.
```

**Diferencias conceptuales:**
- Haskell: Función que filtra lista existente
- Prolog: Predicado que se consulta sobre BD

---

## 25. EJERCICIOS TIPO PARCIAL Y FINAL

### 25.1 Problemas de Aplicación

**Problema Librería:**

**En Haskell:**
```haskell
data Obra = UnaObra {
    titulo :: String,
    autores :: [String]
}

todasLasObras = [
    UnaObra "sandman" ["gaiman"],
    UnaObra "watchmen" ["moore"],
    UnaObra "buenos_presagios" ["gaiman", "pratchett"]
]

-- ¿Escribió "gaiman" "sandman"?
escribio :: String -> String -> [Obra] -> Bool
escribio autor titulo obras = 
    any (\obra -> titulo obra == titulo && elem autor (autores obra)) obras

-- ¿Quién escribió "sandman"?
autoresDe :: String -> [Obra] -> [String]
autoresDe titulo obras = 
    autores (head (filter (\o -> titulo o == titulo) obras))

-- ¿Qué escribió "gaiman"?
obrasDe :: String -> [Obra] -> [String]
obrasDe autor obras = 
    map titulo (filter (\o -> elem autor (autores o)) obras)
```

**En Prolog:**
```prolog
% Base de conocimiento
escribio(gaiman, sandman).
escribio(gaiman, american_gods).
escribio(gaiman, buenos_presagios).
escribio(moore, watchmen).
escribio(pratchett, buenos_presagios).

% ¿Escribió gaiman sandman?
?- escribio(gaiman, sandman).
true.

% ¿Quién escribió sandman?
?- escribio(X, sandman).
X = gaiman.

% ¿Qué escribió gaiman?
?- escribio(gaiman, X).
X = sandman ;
X = american_gods ;
X = buenos_presagios ;
false.
```

---

## 26. CONCEPTOS TEÓRICOS AVANZADOS

### 26.1 Laziness y Evaluación

**Lazy Evaluation permite:**
```haskell
-- Listas infinitas
infinitos = [1..]                    -- Lista infinita

-- Usar solo lo necesario
take 5 infinitos                     -- [1, 2, 3, 4, 5]
take 5 (map (*2) infinitos)          -- [2, 4, 6, 8, 10]

-- Iteración infinita con criterio de parada
head (filter (> 1000000) [1..])      -- 1000001
-- Sin lazy evaluation, sería loop infinito

-- Eficiencia
head (map (*2) [1..1000000])         -- 2 (calcula solo el primero)

-- En eager evaluation, calcularía todo
```

### 26.2 Mónadas (Concepto Avanzado)

Las **mónadas** son una forma de encadenar operaciones que podrían fallar:

```haskell
-- Tipo Maybe
data Maybe a = Nothing | Just a

-- Operaciones que podrían fallar
obtener :: String -> Maybe Persona
convertir :: String -> Maybe Int

-- Composición segura (con mónadas)
resultado = do
    persona <- obtener "datos.txt"
    edad <- convertir (edadStr persona)
    return (nombre persona, edad)

-- Equivalente a:
resultado = 
    obtener "datos.txt" >>= \persona ->
    convertir (edadStr persona) >>= \edad ->
    return (nombre persona, edad)
```

---

## RESUMEN DE TEORÍA ESENCIAL

### Conceptos Máxima Prioridad:
1. ✓ Paradigma vs Lenguaje
2. ✓ Imperativo vs Declarativo
3. ✓ Transparencia Referencial
4. ✓ Pattern Matching
5. ✓ Funciones de Orden Superior (map, filter, fold)
6. ✓ Aplicación Parcial y Composición
7. ✓ Predicados e Inversibilidad
8. ✓ Unificación y Backtracking
9. ✓ Consultas Individual vs Existencial
10. ✓ Evaluación Lazy vs Eager

### Conceptos Alta Prioridad:
- Recursividad en ambos paradigmas
- Type Classes en Haskell
- Guardas en Haskell
- Reglas en Prolog
- Aritmética en Prolog (is)
- Lenguajes Híbridos

---

**Este compendio cubre TODA la teoría vista en clase y la expandida. Es material exhaustivo para estudio y referencia.** 📚

