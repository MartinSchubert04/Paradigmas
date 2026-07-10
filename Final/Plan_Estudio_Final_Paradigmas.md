# Plan de Estudio Final - Paradigmas de Programación
## Enfoque: Lenguajes, Funcional (Haskell) y Lógico (Prolog)

---

## 📋 ESTRUCTURA DEL FINAL
- **5 preguntas a desarrollar** (teóricas)
- **Duración estimada**: 2-3 horas
- **Temas**: Lenguajes, Paradigma Funcional, Paradigma Lógico

---

## 🎯 TEMAS CLAVE POR SECCIÓN

### SECCIÓN 1: LENGUAJES Y PARADIGMAS (25-30% del examen)

#### Conceptos Fundamentales
**Diferencias clave a dominar:**

1. **Lenguaje vs Paradigma**
   - Lenguaje: Herramienta de programación (sintaxis, semántica, compilador/intérprete)
   - Paradigma: Forma de pensar/entender el problema (conjunto de reglas y convenciones)
   - Ejemplo: Java es un lenguaje que implementa paradigma OO
   - Ejemplo: Haskell es un lenguaje que implementa paradigma Funcional

2. **Paradigma Imperativo vs Declarativo**
   - Imperativo: Paso a paso, cómo hacerlo (Java, C, Python)
   - Declarativo: Qué queremos (Haskell, Prolog, SQL)
   - Analogía: Imperativo = receta con pasos; Declarativo = pedir una pizza

3. **Lenguajes Híbridos**
   - Python: Imperativo + Funcional
   - JavaScript: Imperativo + OO + Funcional
   - Scala: OO + Funcional
   - Kotlin: OO + Funcional

#### Puntos a Memorizar
- [ ] Diferencias concretas entre lenguaje y paradigma con ejemplos
- [ ] Ejemplos de lenguajes imperativos: C, Java, Python
- [ ] Ejemplos de lenguajes declarativos: Haskell, Prolog
- [ ] Dos lenguajes híbridos y qué paradigmas combinan

---

### SECCIÓN 2: PARADIGMA FUNCIONAL - HASKELL (40-50% del examen)

#### 2.1 Conceptos Fundamentales de Programación Funcional

**1. Función Matemática vs Función en Lenguajes Imperativos**
```
Propiedades de una función en Haskell:
- Unicidad: Para cada entrada existe una y solo una salida
- Existencia: Para todo elemento del dominio hay una imagen
- Transparencia Referencial: Depende solo de sus parámetros
- Determinística: Siempre da el mismo resultado
- Sin efectos: No modifica el ambiente
```

**Preguntas típicas:**
- Qué es transparencia referencial y por qué es importante
- Qué significa que una función sea determinística
- Diferencia entre unicidad y existencia

**2. Cambio de Paradigma: De Imperativo a Declarativo**
```
Imperativo:     Secuencia de pasos, estructuras de control (if/for/while)
Funcional:      Expresiones, composición de funciones, recursividad
Restricción:    No hay variables en el sentido de "celda de memoria"
                No hay asignación destructiva
                No hay estado global
```

#### 2.2 Concepto de Expresividad y Abstracción

- **Expresividad**: El código es más legible, se entiende qué hace sin explicación
- **Abstracción**: Se separa el qué del cómo
- Ejemplo: `map doble [1,2,3]` es más expresivo que un for-loop

#### 2.3 Pattern Matching y Tipado

**Pattern Matching:**
```haskell
-- Definición por patrones
color "banana" = "amarillo"
color "manzana" = "rojo"
color _ = "desconocido"

-- Sobre tuplas
edad (_, e) = e

-- Sobre listas
primero (x:xs) = x
```

**Puntos clave:**
- El orden de los patrones importa (se evalúan de arriba a abajo)
- Las constantes se evalúan antes que las variables
- Variable anónima `_` para ignorar parámetros
- Las funciones parciales pueden no estar definidas en todo el dominio

**Tipado en Haskell:**
```haskell
-- Declaración explícita
esMayorDeEdad :: Int -> Bool

-- Inferencia de tipos
ff x y = x && not y
-- Haskell infiere: ff :: Bool -> Bool -> Bool

-- Variables de tipo (genéricas)
id :: a -> a
duplicar :: a -> [a]

-- Type Classes (restricciones)
doble :: Num a => a -> a
sumar :: Num a => a -> a -> a
```

**Type Classes importantes:**
- `Eq`: Igualdad y desigualdad (==, /=)
- `Ord`: Orden (<, >, <=, >=)
- `Num`: Operaciones numéricas (+, -, *, /)
- `Show`: Convertir a String
- `Integral`: Números enteros
- `Fractional`: Números con decimales

#### 2.4 Guardas y Funciones Parciales

**Guardas (Guards):**
```haskell
-- Función definida por condiciones
f :: Int -> Int
f x
  | x < -1 = -1
  | -1 <= x && x <= 1 = 1
  | x > 1 = -1

-- Comparar con Pattern Matching
diaDeSemana 1 = "Lunes"
diaDeSemana 2 = "Martes"
...
```

**Función Parcial:**
- Función que no está definida en todo su dominio
- Ejemplo: `factorial` no definido para negativos
- Problema: Genera error en tiempo de ejecución si se invoca fuera del dominio

#### 2.5 Estructuras de Datos

**Tuplas:**
```haskell
-- Definen datos compuestos de tamaño fijo
type Persona = (Nombre, Edad)

-- Pattern Matching
edad (_, e) = e

-- Funciones predefinidas
fst (x, _) = x
snd (_, y) = y
```

**Data Types:**
```haskell
-- Más expresivo que tuplas
data Estudiante = UnEstudiante {
  nombre :: String,
  legajo :: String,
  nota :: Int
}

-- Genera automáticamente funciones de acceso
nombre :: Estudiante -> String
```

**Listas:**
```haskell
-- Estructura recursiva
[1, 2, 3] = 1 : [2, 3] = 1 : 2 : 3 : []

-- Pattern Matching
primero (x:xs) = x
longitud [] = 0
longitud (_:xs) = 1 + longitud xs
```

#### 2.6 Recursividad

**Definición:** Una abstracción está definida en términos de sí misma

**Tipos:**
- Recursividad sobre estructura de datos (listas, árboles)
- Recursividad sobre funciones (factorial)

**Ejemplos:**
```haskell
-- Recursividad sobre listas
length [] = 0
length (_:xs) = 1 + length xs

-- Recursividad sobre números
factorial 0 = 1
factorial n = n * factorial (n-1)

-- Caso base + caso recursivo
```

#### 2.7 Aplicación Parcial y Composición

**Aplicación Parcial:**
```haskell
-- Función con múltiples parámetros
conjuncion :: Bool -> Bool -> Bool

-- Aplicación parcial (dejar sin instanciar algunos parámetros)
conjuncionConTrue = conjuncion True  -- Nueva función: Bool -> Bool

-- Usando operadores
esIgual5 = (== 5)       -- :: Int -> Bool
duplicar = (2 *)        -- :: Num a => a -> a
Mayor18 = (>= 18)       -- :: Int -> Bool
```

**Composición de Funciones:**
```haskell
-- Operador (.)
(.) :: (b -> c) -> (a -> b) -> (a -> c)

-- Ejemplo
f = not . even . length
f "hola" = not (even (length "hola"))

-- Point-free style (eliminar parámetro)
promociona alumno = (not . esMenorAOcho . nota) alumno
-- Puede escribirse como:
promociona = not . esMenorAOcho . nota
```

#### 2.8 Funciones de Orden Superior

**MAP:** Aplica función a cada elemento
```haskell
map :: (a -> b) -> [a] -> [b]
map doble [1, 2, 3] = [2, 4, 6]

-- Equivalente a:
edades personas = map edad personas
-- Que puede simplificarse (point-free):
edades = map edad
```

**FILTER:** Selecciona elementos que cumplen condición
```haskell
filter :: (a -> Bool) -> [a] -> [a]
adultos = filter esMayor personas
-- Point-free:
adultos = filter esMayor
```

**ALL:** Verifica que todos cumplen condición
```haskell
all :: (a -> Bool) -> [a] -> Bool
all esPrimo [2, 3, 5] = True
-- Nota: Evaluación LAZY - para si encuentra falso
```

**ANY:** Verifica que existe alguno que cumple
```haskell
any :: (a -> Bool) -> [a] -> Bool
any esVengador superheroes = True
-- Nota: Evaluación LAZY - para si encuentra verdadero
```

**FOLD (Reducción):**
```haskell
-- Foldr (asociativo a derecha)
foldr :: (b -> a -> a) -> a -> [b] -> a
foldr f semilla [] = semilla
foldr f semilla (x:xs) = f x (foldr f semilla xs)

-- Ejemplos
sum lista = foldr (+) 0 lista
product lista = foldr (*) 1 lista
length lista = foldr (\_ x -> x+1) 0 lista

-- Foldl (asociativo a izquierda)
foldl :: (a -> b -> a) -> a -> [b] -> a
```

**Lambda (Funciones Anónimas):**
```haskell
-- Sintaxis: \parámetros -> expresión
\x -> x + 1
\x y -> x + y

-- Uso
map (\x -> x+1) [1, 2, 3] = [2, 3, 4]
filter (\persona -> edad persona > 65) personas
```

#### 2.9 Evaluación Lazy vs Eager

**Eager (Estricta):**
- Evalúa parámetros antes de ejecutar la función
- Calcula todo aunque no sea necesario

**Lazy (Perezosa):**
- Retrasa evaluación hasta que es absolutamente necesaria
- Solo evalúa lo que se usa
- Permite trabajar con listas "infinitas"

**Ejemplo:**
```haskell
fst (2*40, div 600 0)
-- Eager: Error porque intenta calcular div 600 0
-- Lazy: Devuelve 80 sin evaluar el segundo elemento
```

---

### SECCIÓN 3: PARADIGMA LÓGICO - PROLOG (40-50% del examen)

#### 3.1 Conceptos Fundamentales

**Declarativo vs Imperativo:**
- En Prolog: Especificas relaciones entre objetos
- El motor hace la búsqueda (inferencia)
- No hay orden de ejecución definido por el programador

**Base de Conocimiento:**
```prolog
% Predicados monádicos (propiedades)
esComic(sandman).
esComic(watchmen).

% Predicados poliádicos (relaciones)
escribio(neil_gaiman, sandman).
escribio(alan_moore, watchmen).

% Reglas
esArtistaDeNovenoArte(Artista) :- 
    escribio(Artista, Obra), 
    esComic(Obra).
```

#### 3.2 Conceptos Clave

**1. Universo Cerrado vs Abierto**
```
Universo Cerrado (Prolog):
- Todo lo que no está en la BD es falso
- Principio de Universo Cerrado

Universo Abierto:
- Lo que no está en la BD es desconocido
```

**2. Predicados**
- **Monádicos (Aridad 1):** Propiedades de un individuo
  ```prolog
  esComic(sandman).
  ```
- **Poliádicos (Aridad > 1):** Relaciones entre individuos
  ```prolog
  escribio(gaiman, sandman).
  ```

**3. Cláusulas**
```prolog
% Hecho (Axioma) - sin condiciones
escribio(gaiman, sandman).

% Regla - con antecedente
esArtistaDeNovenoArte(Artista) :- 
    escribio(Artista, Obra), 
    esComic(Obra).
```

#### 3.3 Tipos de Consultas

**Consulta Individual (determinar verdadero/falso):**
```prolog
?- escribio(gaiman, sandman).
true.

?- escribio(gaiman, watchmen).
false.
```

**Consulta Existencial (encontrar individuos):**
```prolog
?- escribio(Autor, sandman).
Autor = neil_gaiman ;
Autor = otro_autor ;
false.

?- escribio(gaiman, Obra).
Obra = sandman ;
Obra = american_gods ;
% ... más soluciones
```

**Punto clave:** Las variables (mayúsculas) permiten hacer preguntas existenciales

#### 3.4 Inversibilidad

**Definición:** Un predicado es inversible cuando admite consultas con variables libres

**Ejemplo inversible:**
```prolog
padre(abraham, isaac).
padre(isaac, jacob).

% Consulta normal: ?- padre(abraham, isaac). --> true
% Consulta inversa: ?- padre(abraham, X). --> X = isaac
% Consulta mixta: ?- padre(X, jacob). --> X = isaac
```

**Ejemplo no inversible:**
```prolog
edad(maria, 25).

mayorEdad(Persona) :- 
    edad(Persona, Edad), 
    Edad > 18.

% ?- mayorEdad(maria). --> true (bien)
% ?- mayorEdad(X). --> Error (no inversible)
```

#### 3.5 Unificación

**Definición:** Proceso de hacer que dos términos sean iguales ligando variables

```prolog
?- maestro(Mestre, Discipulo).
Mestre = socrates, Discipulo = platon ;
Mestre = platon, Discipulo = aristoteles ;
false.
```

**Puntos clave:**
- La unificación liga variables a valores
- Es el mecanismo de inferencia de Prolog
- Las variables se instancian cuando se unifican con valores

#### 3.6 Aritmética en Prolog

**Problema:** Los operadores aritméticos no se evalúan automáticamente

```prolog
siguiente(N, N+1).
?- siguiente(41, X).
X = 41+1.  % No calcula, solo devuelve la expresión

% Solución: usar "is"
siguiente(N, S) :- S is N+1.
?- siguiente(41, X).
X = 42.  % Ahora sí calcula
```

**Limitación:** `is` no es inversible
```prolog
siguiente(N, S) :- S is N+1.
?- siguiente(N, 42).
Error: Unbounded variable.
```

#### 3.7 Backtracking

**Definición:** Proceso de prueba y error cuando falla una rama

```prolog
numero(1).
numero(2).
numero(3).
% ...

siguiente(N, S) :- numero(N), S is N+1.

% ?- siguiente(X, 42).
% Intenta numero(1), calcula 42 = 1+1? No
% Intenta numero(2), calcula 42 = 2+1? No
% ... hasta numero(41), calcula 42 = 41+1? Sí
```

**Ventaja:** Permite búsqueda automática de soluciones

#### 3.8 Operadores Lógicos

**Conjunción (AND) - coma:**
```prolog
?- escribio(Autor, Obra), esComic(Obra).
```

**Disyunción (OR) - punto y coma:**
```prolog
?- esComic(X) ; esNovela(X).
```

**Negación:**
```prolog
% No es lo mismo que negación lógica
\+ esComic(X).  % "Falla si se puede demostrar que es cómico"
```

#### 3.9 Forall (Cuantificador Universal)

```prolog
forall(habitat(Animal, Bioma), templado(Bioma)).
% "Para todo Animal cuyo hábitat es Bioma, 
%  ese Bioma es templado"
```

---

## 📝 PREGUNTAS TÍPICAS DEL FINAL

### Tipo 1: Comparación Conceptual
**Ejemplo:** "Explique la diferencia entre una función en Haskell y un predicado en Prolog. Incluya ejemplos concretos."

**Estructura de respuesta:**
- Qué es una función (Haskell)
- Qué es un predicado (Prolog)
- Diferencias fundamentales (3-4 puntos)
- Ejemplo en cada lenguaje
- Cuándo usar cada uno

### Tipo 2: Conceptos de Haskell
**Ejemplos:**
- "Explique qué es aplicación parcial y composición de funciones. ¿Cuál es la diferencia? Use ejemplos."
- "¿Qué es Pattern Matching? Proporcione ejemplos de su uso en funciones recursivas."
- "Explique transparencia referencial y qué ventajas tiene."
- "¿Cómo funciona la evaluación Lazy? Dé un ejemplo donde sea beneficiosa."

**Estructura de respuesta:**
- Definición clara
- Explicación del mecanismo
- Ejemplos de código
- Aplicaciones o ventajas

### Tipo 3: Conceptos de Prolog
**Ejemplos:**
- "Explique qué es inversibilidad en un predicado. ¿Por qué es importante?"
- "¿Qué es unificación? Explique con un ejemplo."
- "Diferencie entre consultas individuales y existenciales."
- "Explique el principio de universo cerrado."

### Tipo 4: Análisis de Código
**Formato:** Dado un programa, explicar qué hace, encontrar errores, o predecir resultado

**Ejemplo en Haskell:**
```haskell
filtroEspecial lista = 
    filter (\x -> x > 5 && even x) lista
```
Explicar: Qué hace, qué es la lambda, qué tipo tiene

**Ejemplo en Prolog:**
```prolog
hermano(X, Y) :- padre(Z, X), padre(Z, Y), X \= Y.
```
Explicar: Cómo funciona, qué buscará, si es inversible

### Tipo 5: Resolución de Problema
**Ejemplo:** "Dado un predicado `escribio(Autor, Obra)`, escriba consultas Prolog para:"
- "Quién escribió 'Sandman'"
- "Qué escribió Neil Gaiman"
- "¿Existe alguien que escribió algo?"

---

## 📚 TEMAS A PRIORIZAR

### MÁXIMA PRIORIDAD (aparecerá seguro)
- [ ] Diferencia entre lenguaje y paradigma
- [ ] Imperativo vs Declarativo
- [ ] Pattern Matching en Haskell
- [ ] Funciones de orden superior (map, filter, fold) en Haskell
- [ ] Aplicación parcial vs Composición
- [ ] Transparencia referencial
- [ ] Predicados en Prolog
- [ ] Hechos, reglas y consultas en Prolog
- [ ] Inversibilidad
- [ ] Unificación

### ALTA PRIORIDAD
- [ ] Type Classes en Haskell
- [ ] Recursividad
- [ ] Data types vs tuplas
- [ ] Guardas
- [ ] Evaluación Lazy vs Eager
- [ ] Backtracking en Prolog
- [ ] Universo cerrado

### MEDIA PRIORIDAD
- [ ] Lambda en Haskell
- [ ] Aritmética en Prolog (is)
- [ ] Forall
- [ ] Lenguajes híbridos

---

## 🎓 PLAN SEMANAL DE ESTUDIO

### Semana 1: Fundamentos
- **Días 1-2:** Lenguajes vs Paradigmas, Imperativo vs Declarativo
- **Días 3-4:** Pattern Matching y Tipado en Haskell
- **Días 5-6:** Predicados y consultas en Prolog
- **Día 7:** Revisión y resumen

### Semana 2: Profundización - Haskell
- **Días 1-2:** Aplicación parcial y composición
- **Días 3-4:** Funciones de orden superior (map, filter, fold)
- **Días 5-6:** Recursividad y estructuras de datos
- **Día 7:** Ejercicios integradores

### Semana 3: Profundización - Prolog
- **Días 1-2:** Inversibilidad y unificación
- **Días 3-4:** Backtracking y reglas complejas
- **Días 5-6:** Aritmética y consultas avanzadas
- **Día 7:** Ejercicios integradores

### Semana 4: Integración y Práctica
- **Días 1-3:** Comparar conceptos entre Haskell y Prolog
- **Días 4-5:** Resolución de problemas y ejercicios
- **Días 6-7:** Simulacro de examen

---

## ✍️ EJERCICIOS RECOMENDADOS

### Haskell - Nivel Básico
1. Crear funciones con pattern matching
2. Resolver factorial, fibonacci con recursividad
3. Usar aplicación parcial en operadores
4. Componer funciones simples

### Haskell - Nivel Intermedio
1. Usar map, filter, fold
2. Crear funciones de orden superior
3. Trabajar con data types personalizados
4. Predicados complejos con guardas

### Prolog - Nivel Básico
1. Crear base de conocimiento simple
2. Hacer consultas individuales y existenciales
3. Crear reglas simples
4. Entender backtracking con ejemplos

### Prolog - Nivel Intermedio
1. Predicados complejos con múltiples condiciones
2. Usar forall
3. Resolver problemas con inversibilidad
4. Unificación en casos complejos

---

## 🎯 CHECKLIST FINAL ANTES DEL EXAMEN

### Conceptos Básicos
- [ ] Explico qué es un paradigma
- [ ] Diferencio lenguaje de paradigma
- [ ] Defino imperativo y declarativo
- [ ] Doy ejemplos de lenguajes híbridos

### Haskell
- [ ] Entiendo transparencia referencial
- [ ] Sé qué es pattern matching
- [ ] Domino aplicación parcial
- [ ] Entiendo composición (.)
- [ ] Sé cómo funcionan map, filter, fold
- [ ] Puedo escribir funciones recursivas
- [ ] Entiendo type classes
- [ ] Sé la diferencia entre tuplas y data

### Prolog
- [ ] Sé qué es un predicado
- [ ] Diferencio hechos de reglas
- [ ] Entiendo consultas individuales
- [ ] Entiendo consultas existenciales
- [ ] Sé qué es inversibilidad
- [ ] Entiendo unificación
- [ ] Conozco el backtracking
- [ ] Sé usar "is" en aritmética

### Práctica
- [ ] Resuelvo ejercicios de ambos paradigmas
- [ ] Puedo comparar conceptos
- [ ] Doy ejemplos claros
- [ ] Escribo código correcto

---

## 📖 ESTRUCTURA SUGERIDA PARA RESPUESTAS

### Para preguntas de 5 puntos (aprox. 30-40 minutos cada una):

1. **Introducción (2 min):** Define el concepto en una oración
2. **Explicación teórica (10 min):** Desarrolla el concepto
3. **Ejemplo 1 (8 min):** Código o situación concreta
4. **Ejemplo 2 (8 min):** Contraste o aplicación alternativa
5. **Conclusión (2 min):** Resume y/o explica importancia

**Objetivo:** Respuestas de 1-1.5 páginas por pregunta, bien estructuradas.

---

## 🚀 ÚLTIMO DÍA ANTES DEL EXAMEN

- ✅ Repasar definiciones clave (15 min)
- ✅ Revisar ejemplos de código (20 min)
- ✅ Hacer mentalmente 2-3 preguntas de muestra (30 min)
- ✅ Listar palabras clave importantes (10 min)
- ✅ Descansar bien (crucial para el rendimiento)

---

**¡Éxito en tu examen!** 🎓
