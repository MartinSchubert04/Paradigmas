# Resumen Ejecutivo - Paradigmas de Programación
## Cheat Sheet para Repaso Rápido

---

## 🎯 CONCEPTOS CLAVE EN 60 SEGUNDOS

### Lenguaje vs Paradigma
- **Paradigma:** Forma de pensar (Funcional, Lógico, Imperativo)
- **Lenguaje:** Herramienta que implementa paradigma (Haskell, Prolog, Java)
- **Analogía:** Paradigma = escuela, Lenguaje = instrumento

### Imperativo vs Declarativo
| | Imperativo | Declarativo |
|---|---|---|
| Pregunta | ¿CÓMO? | ¿QUÉ? |
| Estilo | Paso a paso | Especifica resultado |
| Control | Explícito | Automático |
| Ejemplos | Java, C, Python | Haskell, Prolog, SQL |

---

## 📘 PARADIGMA FUNCIONAL (Haskell)

### Propiedades Fundamentales
```
✓ Funciones = Entidades de primer orden
✓ Transparencia Referencial (sin estado global)
✓ Determinísticas (mismo input = mismo output)
✓ Sin efectos secundarios
✓ Inmutabilidad de datos
```

### Conceptos Clave

**Pattern Matching:**
```haskell
factorial 0 = 1
factorial n = n * factorial(n-1)

esVacio [] = True
esVacio (_:_) = False
```

**Tipado & Inferencia:**
```haskell
doble :: Int -> Int          -- Declaración explícita
doble x = x * 2

-- Inferencia automática
id :: a -> a                 -- Variables de tipo (genéricas)
doble :: Num a => a -> a     -- Type Class restricción
```

**Aplicación Parcial:**
```haskell
esIgual5 = (== 5)           -- Nueva función
Mayor18 = (>= 18)           -- Nueva función
duplicar = (2 *)            -- Nueva función
```

**Composición:**
```haskell
f = not . even . length      -- (.) compone de derecha a izquierda
f "hola" = not(even(length("hola")))
```

**Funciones de Orden Superior:**
```haskell
-- MAP: Transforma cada elemento
map (\x -> x*2) [1,2,3] = [2,4,6]

-- FILTER: Selecciona elementos
filter (>2) [1,2,3,4] = [3,4]

-- FOLD: Reduce a un valor
foldr (+) 0 [1,2,3] = 6

-- ALL/ANY: Verifica condiciones
all (>0) [1,2,3] = True
any (>2) [1,2,3] = True
```

**Lambda (Función anónima):**
```haskell
\x -> x + 1
map (\x -> x*2) lista
```

**Recursividad:**
```haskell
-- Caso base + caso recursivo
longitud [] = 0
longitud (_:xs) = 1 + longitud xs
```

### Type Classes Importantes
| | Operaciones | Ejemplo |
|---|---|---|
| **Eq** | ==, /= | (==) :: Eq a => a -> a -> Bool |
| **Ord** | <, >, <=, >= | (<) :: Ord a => a -> a -> Bool |
| **Num** | +, -, *, /, abs | (+) :: Num a => a -> a -> a |
| **Show** | mostrar | show 42 = "42" |
| **Fractional** | / | (/) :: Fractional a => a -> a -> a |

### Estructuras de Datos

**Tuplas (tamaño fijo):**
```haskell
type Persona = (String, Int)      -- Alias de tipo
(nombre, edad) = ("Ana", 25)
fst (x, y) = x
snd (x, y) = y
```

**Data Types (más expresivo):**
```haskell
data Estudiante = UnEstudiante {
    nombre :: String,
    edad :: Int
} deriving (Show, Eq)

nota :: Estudiante -> Int
```

**Listas (tamaño variable):**
```haskell
[1, 2, 3] = 1 : [2, 3] = 1 : 2 : 3 : []
head [1,2,3] = 1
tail [1,2,3] = [2,3]
length [1,2,3] = 3
```

### Evaluación Lazy vs Eager

**Lazy (Haskell):**
- Retrasa evaluación hasta necesidad
- Permite listas infinitas
- `fst (2*40, error)` = 80 (no evalúa el error)

**Eager:**
- Evalúa todo antes
- `fst (2*40, error)` = ERROR

---

## 📗 PARADIGMA LÓGICO (Prolog)

### Base de Conocimiento

**Hechos (Axiomas):**
```prolog
escribe(neil_gaiman, sandman).
escribe(alan_moore, watchmen).
```

**Reglas:**
```prolog
esArtistaDeNovenoArte(Artista) :- 
    escribe(Artista, Obra), 
    esComic(Obra).
```

**Predicados:**
- **Monádicos (aridad 1):** Propiedades
  ```prolog
  esComic(sandman).
  ```
- **Poliádicos (aridad >1):** Relaciones
  ```prolog
  escribe(autor, obra).
  ```

### Tipos de Consultas

**Individual (verdad/falso):**
```prolog
?- escribe(gaiman, sandman).    % true
?- escribe(moore, sandman).      % false
```

**Existencial (encontrar valores):**
```prolog
?- escribe(gaiman, X).           % X = sandman, X = american_gods, ...
?- escribe(Y, sandman).          % Y = neil_gaiman
```

### Inversibilidad

**Definición:** Predicado funciona en múltiples direcciones

```prolog
% INVERSIBLE
padre(abraham, isaac).
padre(isaac, jacob).

?- padre(abraham, isaac).        % true ✓
?- padre(abraham, X).            % X = isaac ✓
?- padre(Y, jacob).              % Y = isaac ✓

% NO INVERSIBLE (con "is")
edad(maria, 25).
siguiente(N, S) :- S is N+1.

?- siguiente(41, X).             % X = 42 ✓
?- siguiente(X, 42).             % ERROR ✗
```

### Unificación

Proceso de hacer dos términos iguales:

```prolog
?- maestro(socrates, X).         % Unifica X = platon
?- maestro(Y, aristoteles).      % Unifica Y = platon
?- maestro(X, Y).                % Unifica ambas variables
```

### Backtracking

Prueba y error automático:

```prolog
numero(1).
numero(2).
numero(3).

siguiente(N, S) :- numero(N), S is N+1.

?- siguiente(X, 42).
% Intenta numero(1): 42 is 1+1? No
% Intenta numero(2): 42 is 2+1? No
% ... hasta numero(41): 42 is 41+1? SÍ
```

### Operadores Lógicos

**Conjunción (AND - coma):**
```prolog
?- escribe(X, Y), esComic(Y).
```

**Disyunción (OR - punto y coma):**
```prolog
?- esComic(X) ; esNovela(X).
```

**Negación:**
```prolog
\+ esComic(X).    % "No se puede probar que sea comic"
```

### Aritmética

**Problema:** Operadores no se evalúan automáticamente
```prolog
X = 5 + 3.    % X = +(5,3)  NO CALCULA
```

**Solución:** Usar "is" (unidireccional)
```prolog
X is 5 + 3.   % X = 8  CALCULA
8 is 5 + 3.   % true (verifica)
8 is Y + 3.   % ERROR (Y no ligado)
```

### Forall (Cuantificador Universal)

```prolog
forall(habitat(Animal, Bioma), templado(Bioma)).
% "Para todo animal que habita en un bioma, ese bioma es templado"
```

### Universo Cerrado

Todo lo que no está en la BD es falso:
```prolog
?- personaje(batman, dc).       % true (en BD)
?- personaje(batman, marvel).   % false (no en BD = falso)
```

---

## 🔄 COMPARACIÓN RÁPIDA: Haskell vs Prolog

| | Haskell | Prolog |
|---|---|---|
| **Tipo** | Funcional | Lógico |
| **Enfoque** | Transformar datos | Buscar soluciones |
| **Datos** | Estructurados (records) | Predicados |
| **Flujo** | Programador define | Motor decide (backtracking) |
| **Resultado** | Un valor | Múltiples soluciones |
| **Tipado** | Explícito e inferido | Implícito |
| **Estado** | Inmutable | Unificación variable/valor |
| **Recursividad** | Explícita | Implícita en búsqueda |

---

## 📊 MAPA CONCEPTUAL VISUAL

```
PARADIGMAS
├── IMPERATIVO (¿Cómo?)
│   ├── Java
│   ├── C
│   └── Python (híbrido)
│
├── FUNCIONAL (¿Transformar qué?)
│   ├── Haskell (puro)
│   ├── Lisp
│   ├── Python (hybrid)
│   └── JavaScript (hybrid)
│
└── LÓGICO (¿Buscar qué?)
    ├── Prolog
    ├── Datalog
    └── SQL (relacional)
```

---

## 💡 CONEXIONES ENTRE CONCEPTOS

### Transparencia Referencial → Determinismo
```
Sin estado global → Mismo input siempre = mismo output
→ Fácil razonar matemáticamente
→ Fácil paralelizar
```

### Pattern Matching → Unificación
```
Haskell: Patrones sobre estructuras
Prolog: Unificación de términos
SIMILITUD: Ambos especializan variables en valores
```

### Orden Superior → Abstracción
```
map, filter, fold encapsulan patrones comunes
→ Código más expresivo
→ Menos repetición
```

### Inversibilidad → Flexibilidad
```
Un predicado responde múltiples preguntas
→ Mismo código para múltiples usos
→ BD más flexible
```

---

## ✅ PUNTOS CLAVE PARA RECORDAR

### Haskell

1. **No hay variables (celdas de memoria)**
   - Variables = valores constantes
   - `x = 5` significa "x es 5", no "asignar 5 a x"

2. **Las funciones son valores**
   - Puedo pasarlas como parámetros
   - Puedo devolverlas

3. **Aplicación parcial es automática**
   - `f x y z` es en realidad `((f x) y) z`
   - Esto habilita composición

4. **Composición es clave**
   - `(.)` encadena funciones
   - Point-free style elimina parámetros innecesarios

5. **Lazy evaluation es invisible pero importante**
   - Permite programar sin preocuparse por evaluación
   - Permite estructuras infinitas

### Prolog

1. **No hay asignación, solo unificación**
   - Variables se ligan a valores
   - La unificación es bidireccional (si el predicado es inversible)

2. **El motor busca automáticamente**
   - No escribo loops
   - Backtracking explora opciones

3. **BD completa es fundamental**
   - Universo cerrado: no en BD = falso
   - Cambiar BD cambia respuestas

4. **Inversibilidad no es gratis**
   - Depende de cómo esté definido predicado
   - `is` y operadores aritméticos NO son inversibles

5. **Unificación es el mecanismo clave**
   - Variables se instancian mediante unificación
   - Permite múltiples soluciones

---

## 🎓 ERRORES COMUNES A EVITAR

### Conceptuales

❌ **"Haskell = Imperativo"**
✅ Haskell es totalmente declarativo/funcional

❌ **"En Prolog hay variables como en C"**
✅ En Prolog son incógnitas que se unifican

❌ **"Lazy = más lento"**
✅ Lazy puede ser más eficiente (calcula menos)

❌ **"Pattern matching = switch statement"**
✅ Pattern matching es especificación de patrones, no control de flujo

### En Código

❌ **Haskell:**
```haskell
x = 5
x = 10    % ERROR: no se puede reasignar
```

✅ **Correcto:**
```haskell
x = 5
y = 10
```

❌ **Prolog:**
```prolog
siguiente(X, Y) :- Y is X + 1.
?- siguiente(41, Z).      % OK
?- siguiente(X, 42).      % ERROR: Y no ligado en 'is'
```

✅ **Correcto:**
```prolog
siguiente(41, 42).
?- siguiente(X, 42).      % Busca en BD
```

---

## 📝 ESTRUCTURA DE RESPUESTA GANADORA

### Para Pregunta de 5 puntos (40 min):

1. **Párrafo intro (3 min)**
   - Una oración definición
   - Una oración contexto

2. **Desarrollo teórico (10 min)**
   - 3-4 puntos clave
   - Explicación clara

3. **Ejemplo 1 - Simple (8 min)**
   - Código simple
   - Explicación paso a paso

4. **Ejemplo 2 - Complejo (8 min)**
   - Caso más realista
   - Muestra concepto en contexto

5. **Relación con otros conceptos (5 min)**
   - ¿Cómo se conecta?
   - ¿Por qué importa?

6. **Conclusión (2 min)**
   - Resumen en 2-3 oraciones

**TOTAL:** 1-1.5 páginas, bien estructurado

---

## 🚀 TIPS PARA EL EXAMEN

1. **Lee bien las preguntas** (2-3 min)
   - Subraya lo importante
   - Identifica qué paradigma se pregunta

2. **Planifica respuesta** (2-3 min)
   - Lista puntos principales
   - Ejemplos que vas a usar

3. **Escribe sin parar** (30 min)
   - No borres mucho
   - Buena caligrafía

4. **Revisa al final** (3-5 min)
   - Gramática
   - Ejemplos completos
   - Coherencia

---

## 📚 RECURSOS DE REPASO ORDENADOS POR URGENCIA

### MÁXIMA PRIORIDAD (Estudia HUYENDO)
- [ ] Paradigma vs Lenguaje
- [ ] Funciones orden superior (map, filter, fold)
- [ ] Pattern matching
- [ ] Predicados e inversibilidad
- [ ] Transparencia referencial

### ALTA PRIORIDAD
- [ ] Aplicación parcial y composición
- [ ] Recursividad
- [ ] Type classes
- [ ] Unificación y backtracking
- [ ] Evaluación lazy

### MEDIA PRIORIDAD
- [ ] Data types vs tuplas
- [ ] Guardas en Haskell
- [ ] Aritmética en Prolog
- [ ] Universo cerrado

---

**¡Recuerda: Las preguntas más importantes son las que TE hacen pensar, no las que solo requieren memorizar!** 🧠

