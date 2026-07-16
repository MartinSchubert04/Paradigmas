# TEMAS COMPLEMENTARIOS Y ADICIONALES
## Teoría que probablemente vendrá en el final

---

# 1. MOTOR DE INFERENCIA EN PROLOG

## 1.1 Qué es un Motor de Inferencia

Un **motor de inferencia** es un sistema automático que:
- Recibe premisas (hechos y reglas)
- Aplica reglas lógicas
- Deriva nuevos conocimientos (conclusiones)

```prolog
% Premisas
socrates es hombre.           % Hecho
todos los hombres son mortales. % Regla universal

% Motor de inferencia aplica la regla:
% Si X es hombre y todos los hombres son mortales
% Entonces X es mortal

% Conclusión derivada:
socrates es mortal.           % Conclusión automática
```

## 1.2 Inferencia en Prolog

```prolog
% Base de conocimiento
padre(abraham, isaac).
padre(isaac, jacob).

% Regla (inferencia)
abuelo(X, Z) :- padre(X, Y), padre(Y, Z).

% Consulta
?- abuelo(abraham, jacob).

% Motor de inferencia:
% 1. Recibe consulta: abuelo(abraham, jacob)
% 2. Busca regla: abuelo(X, Z) :- padre(X, Y), padre(Y, Z)
% 3. Unifica: X=abraham, Z=jacob
% 4. Intenta probar: padre(abraham, Y), padre(Y, jacob)
% 5. Busca Y: padre(abraham, isaac) ✓ con Y=isaac
% 6. Prueba: padre(isaac, jacob) ✓
% 7. Devuelve: true
```

---

# 2. TIPOS DE DATOS COMPLEJOS EN HASKELL

## 2.1 Tipos Anidados

```haskell
-- Estructura compleja
data Empresa = UnaEmpresa {
    nombre :: String,
    empleados :: [Persona],
    ubicacion :: Ubicacion
}

data Persona = UnaPer {
    nombre :: String,
    edad :: Int,
    departamento :: Departamento
}

data Departamento = IT | Ventas | HR

data Ubicacion = Ubicacion {
    ciudad :: String,
    pais :: String,
    calle :: String
}

-- Acceso a datos anidados
nombreEmpresa :: Empresa -> String
nombreEmpresa emp = nombre emp

primerEmpleado :: Empresa -> Maybe Persona
primerEmpleado emp = 
    case empleados emp of
        [] -> Nothing
        (p:_) -> Just p

ciudadEmpresa :: Empresa -> String
ciudadEmpresa emp = ciudad (ubicacion emp)
```

## 2.2 Tipos Algebraicos

```haskell
-- Suma de tipos (OR)
data Bool = True | False

-- Producto de tipos (AND)
data Persona = UnaPer String Int

-- Combinación
data Resultado = Exito String | Error String Int

procesarDatos datos 
    | valido datos = Exito "OK"
    | otherwise = Error "Inválido" 400

-- Pattern matching en tipos algebraicos
manejar :: Resultado -> String
manejar (Exito msg) = "Éxito: " ++ msg
manejar (Error msg codigo) = "Error " ++ show codigo ++ ": " ++ msg
```

## 2.3 Tipos Recursivos

```haskell
-- Árbol binario
data Arbol a = Vacio | Nodo a (Arbol a) (Arbol a)

-- Ejemplo
arbol = Nodo 1 
            (Nodo 2 Vacio Vacio) 
            (Nodo 3 Vacio Vacio)

-- Funciones recursivas sobre árboles
altura :: Arbol a -> Int
altura Vacio = 0
altura (Nodo _ izq der) = 1 + max (altura izq) (altura der)

suma :: Num a => Arbol a -> a
suma Vacio = 0
suma (Nodo val izq der) = val + suma izq + suma der

-- Lista vinculada
data Lista a = Vacia | Cons a (Lista a)

lista = Cons 1 (Cons 2 (Cons 3 Vacia))
```

---

# 3. MÓDULOS Y ORGANIZACIÓN EN HASKELL

## 3.1 Definición de Módulo

```haskell
-- Archivo: Geometria.hs

module Geometria
    ( 
        rectangulo,
        triangulo,
        circulo
    )
where

-- Función exportada
rectangulo base altura = base * altura

-- Función exportada
triangulo base altura = (base * altura) / 2

-- Función exportada
circulo radio = 3.14159 * radio^2

-- Función NO exportada (privada)
esMayorA1000 area = area > 1000
```

## 3.2 Importación

```haskell
-- Importar todo
import Geometria

-- Importar funciones específicas
import Geometria (rectangulo, triangulo)

-- Importar con alias
import Geometria as Geo

-- Uso
area_rect = rectangulo 5 10
area_tri = Geo.triangulo 5 10
```

---

# 4. OPERADORES PERSONALIZADOS EN HASKELL

## 4.1 Definición de Operadores

```haskell
-- Operador personalizado (infijo)
(+++) :: String -> String -> String
a +++ b = a ++ " " ++ b

-- Uso
resultado = "Hola" +++ "Mundo"  -- "Hola Mundo"

-- Operador para listas
(+:+) :: [a] -> [a] -> [a]
a +:+ b = a ++ reverse b

-- Uso
resultado = [1, 2] +:+ [3, 4]   -- [1, 2, 4, 3]

-- Precedencia
infixl 6 +++       -- Asociativity left, precedence 6
infixr 7 +*+       -- Associativity right, precedence 7
```

---

# 5. EXCEPCIONES EN HASKELL

## 5.1 Tipo Either

```haskell
-- Either es como Maybe pero con más información
data Either a b = Left a | Right b

-- Left: error/fallo
-- Right: éxito

-- Función que puede fallar
dividir :: Int -> Int -> Either String Int
dividir _ 0 = Left "División por cero"
dividir a b = Right (a `div` b)

-- Uso
resultado = dividir 10 2
-- Right 5

resultado = dividir 10 0
-- Left "División por cero"

-- Pattern matching
case dividir 10 2 of
    Left error -> putStrLn ("Error: " ++ error)
    Right valor -> putStrLn ("Resultado: " ++ show valor)
```

## 5.2 Maybe

```haskell
-- Maybe es para valores que podrían no existir
data Maybe a = Nothing | Just a

-- Buscar en lista
buscar :: Eq a => a -> [a] -> Maybe Int
buscar _ [] = Nothing
buscar x (y:ys) 
    | x == y = Just 0
    | otherwise = case buscar x ys of
        Nothing -> Nothing
        Just i -> Just (i + 1)

-- Uso
posicion = buscar 2 [1, 2, 3]  -- Just 1
posicion = buscar 5 [1, 2, 3]  -- Nothing

-- Operación segura
obtenerEdad :: String -> Maybe Int
obtenerEdad "Ana" = Just 25
obtenerEdad "Bob" = Just 30
obtenerEdad _ = Nothing

-- Composición segura
caso1 = case obtenerEdad "Ana" of
    Just edad -> Just (edad + 1)
    Nothing -> Nothing
```

---

# 6. OPERADORES Y MÉTODOS EN PROLOG

## 6.1 Operadores Especiales

```prolog
% Igualdad
?- X = 5.         % Unificación
X = 5.

?- X == 5.        % Igualdad (estructura idéntica)
% false (X no ligada)

?- 5 == 5.
true.

% Desigualdad
?- X \= 5.        % No unificable
% false si X no está ligada

?- 5 \= 5.
false.

% Aritmética
?- 5 =:= 5.0.     % Igualdad aritmética (5 y 5.0 son iguales)
true.

?- 5 =\= 5.0.     % Desigualdad aritmética
false.

% Comparación
?- 5 > 3.
true.

?- 5 >= 3.
true.

?- 5 < 3.
false.

?- 5 =< 3.        % Menor o igual
false.
```

## 6.2 Operadores Lógicos

```prolog
% Conjunción (AND) - coma
?- true, true.
true.

?- true, false.
false.

% Disyunción (OR) - punto y coma o múltiples cláusulas
padre(X, Y) :- es_biologico(X, Y) ; es_adoptivo(X, Y).

% Negación
?- \+ false.
true.

?- \+ true.
false.

?- \+ member(5, [1, 2, 3]).
true.
```

---

# 7. LISTAS EN PROLOG

## 7.1 Operaciones con Listas

```prolog
% Pertenencia
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).

% Uso
?- member(2, [1, 2, 3]).
true.

?- member(X, [1, 2, 3]).
X = 1 ;
X = 2 ;
X = 3 ;
false.

% Longitud
longitud([], 0).
longitud([_|T], N) :- longitud(T, N1), N is N1 + 1.

% Concatenación
concatenar([], L, L).
concatenar([H|T], L, [H|R]) :- concatenar(T, L, R).

% Reversa
reversa([], []).
reversa([H|T], R) :- reversa(T, RT), concatenar(RT, [H], R).

% Ordenamiento
ordenada([]).
ordenada([_]).
ordenada([X, Y|T]) :- X =< Y, ordenada([Y|T]).
```

## 7.2 Búsqueda en Listas

```prolog
% Encontrar máximo
maximo([X], X).
maximo([H|T], Max) :- 
    maximo(T, MaxT),
    (H > MaxT -> Max = H ; Max = MaxT).

% Elemento en posición
elemento_en(1, [X|_], X).
elemento_en(N, [_|T], X) :- 
    N > 1,
    N1 is N - 1,
    elemento_en(N1, T, X).
```

---

# 8. ARITMÉTICA AVANZADA EN PROLOG

## 8.1 Funciones Matemáticas

```prolog
% Factorial
factorial(0, 1).
factorial(N, F) :- 
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

% Fibonacci
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :- 
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

% Máximo Común Divisor (Euclides)
mcd(X, 0, X).
mcd(X, Y, G) :- 
    Y > 0,
    R is X mod Y,
    mcd(Y, R, G).

% Suma de 1 a N
suma_hasta(0, 0).
suma_hasta(N, S) :- 
    N > 0,
    N1 is N - 1,
    suma_hasta(N1, S1),
    S is N + S1.
```

## 8.2 Búsqueda Numérica

```prolog
% Búsqueda de soluciones en rango
numero(1).
numero(2).
numero(3).
numero(4).
numero(5).

% Encontrar número mayor a 3
?- numero(X), X > 3.
X = 4 ;
X = 5 ;
false.

% Generar números en rango (usando backtracking)
en_rango(N, Min, Max) :- 
    numero(N),
    N >= Min,
    N =< Max.

?- en_rango(X, 2, 4).
X = 2 ;
X = 3 ;
X = 4 ;
false.
```

---

# 9. CONTROL DE FLUJO EN HASKELL

## 9.1 Condicional (if-then-else)

```haskell
-- Sintaxis
if condicion then valor_si else valor_no

-- Ejemplos
es_adulto edad = 
    if edad >= 18 
    then "Adulto" 
    else "Menor"

-- Anidadas
categoria edad = 
    if edad < 13 
    then "Niño"
    else if edad < 18
         then "Adolescente"
         else if edad < 60
              then "Adulto"
              else "Adulto Mayor"

-- Con pattern matching es más idiomático
categoria_mejor edad
    | edad < 13 = "Niño"
    | edad < 18 = "Adolescente"
    | edad < 60 = "Adulto"
    | otherwise = "Adulto Mayor"
```

## 9.2 Recursión vs Iteración

```haskell
-- En Haskell, no hay loops (for, while)
-- Se usa recursividad

-- Tradicional (no existe en Haskell)
-- for i = 1 to 10:
--     print i

-- En Haskell
imprimir [] = return ()
imprimir (x:xs) = do
    print x
    imprimir xs

-- O mejor con mapeo
imprimir nums = mapM_ print nums

-- O con fold
imprimir nums = foldr (\x _ -> print x) (return ()) nums
```

---

# 10. DIFERENCIA ENTRE PREDICADOS PRIMITIVOS

## 10.1 Predicados Built-in de Prolog

```prolog
% Estructurales
var(X).             % ¿X es variable sin ligar?
nonvar(X).          % ¿X está ligada?
atom(X).            % ¿X es un átomo?
number(X).          % ¿X es un número?
compound(X).        % ¿X es una estructura compuesta?
is_list(X).         % ¿X es una lista?

% Comparación
X = Y.              % Unificación
X == Y.             % Identidad (sin unificación)
X \= Y.             % No unificable
X =:= Y.            % Igualdad aritmética
X =\= Y.            % Desigualdad aritmética
X @< Y.             % Orden de términos
X @> Y.
X @=< Y.
X @>= Y.

% Tipo
functor(Termino, Functor, Aridad).
arg(N, Termino, Argumento).
=..(Termino, Lista).        % Deconstructo

% Ejemplos
?- var(X).
true.

?- nonvar(5).
true.

?- atom(hola).
true.

?- number(5).
true.

?- compound(f(a, b)).
true.

?- functor(f(a, b), F, A).
F = f, A = 2.
```

## 10.2 Predicados de Control

```prolog
% Cut (corte)
% ! detiene el backtracking

% Ejemplo sin cut
color(rojo).
color(azul).
color(verde).

?- color(X).
X = rojo ;      % Usuario pide más
X = azul ;      % Usuario pide más
X = verde ;
false.

% Ejemplo con cut
primer_color(X) :- color(X), !.

?- primer_color(X).
X = rojo.       % No hay más opciones

% true/false
?- true.
true.

?- false.
false.

% fail (siempre falla)
?- fail.
false.

% Combinación
valido(X) :- X > 0, !.     % Si X > 0, éxito y para
valido(_) :- false.        % Si no, falla
```

---

# 11. TÉCNICAS AVANZADAS DE COMPOSICIÓN

## 11.1 Función (.)

```haskell
-- La composición es muy poderosa

-- Composición simple
f = not . even . length

-- Composición con aplicación parcial
dobles = map (2*)
filtrados = filter (> 5)
sumado = sum

procesarDatos = sumado . filtrados . dobles

-- Composición en diferentes direcciones
-- Derecha a izquierda
resultado1 = (f . g . h) x

-- Usando ($) para izquierda a derecha
resultado2 = x & h & g & f  -- Nota: & es usuario-definido

-- Función auxiliar para operador pipelike
(&) = flip (.)
infixl 1 &

-- Uso
resultado = 5 & (+3) & (*2) & not . even
```

## 11.2 Función (>>)

```haskell
-- En mónadas, >>= permite encadenar operaciones

-- Tipo Maybe con bind
Just 5 >>= \x -> Just (x * 2)
-- Just 10

Nothing >>= \x -> Just (x * 2)
-- Nothing

-- Sintaxis do
resultado = do
    x <- Just 5
    y <- Just 3
    return (x + y)
-- Just 8
```

---

# 12. CONCEPTOS AVANZADOS DE PROLOG

## 12.1 Assert y Retract (Modificación Dinámica)

```prolog
% assert: agregar un hecho a la BD
?- assert(padre(juan, carlo)).

% ahora padre(juan, carlo) es verdadero

% retract: remover un hecho
?- retract(padre(juan, carlo)).

% ahora ya no existe

% Útil para simulaciones
simular :-
    assert(estado(inicial)),
    assert(paso(1)),
    assert(paso(2)),
    % ... procesamiento
    retract(estado(inicial)),
    assert(estado(final)).
```

## 12.2 Findall (Recolectar Soluciones)

```prolog
% findall(Template, Goal, List)
% Encuentra TODAS las soluciones

padre(abraham, isaac).
padre(isaac, jacob).
padre(jacob, jose).

% Encontrar todos los padres
?- findall(X, padre(X, _), Padres).
Padres = [abraham, isaac, jacob].

% Encontrar todos los pares padre-hijo
?- findall((P, H), padre(P, H), Pares).
Pares = [(abraham, isaac), (isaac, jacob), (jacob, jose)].

% Con condición
?- findall(H, padre(isaac, H), Hijos).
Hijos = [jacob].
```

## 12.3 Bagof y Setof

```prolog
% bagof: similar a findall pero con variables libres
% setof: como bagof pero ordena y elimina duplicados

% Ejemplo
estudiante(juan, 25, informatica).
estudiante(maria, 23, informatica).
estudiante(carlos, 22, economia).
estudiante(ana, 24, economia).

% Con bagof (agrupa por carrera)
?- bagof(Nombre, estudiante(Nombre, _, Carrera), Nombres).
Carrera = economia, Nombres = [carlos, ana] ;
Carrera = informatica, Nombres = [juan, maria].

% Con setof (ordena)
?- setof(Nombre, Carrera^estudiante(Nombre, _, Carrera), Todos).
Todos = [ana, carlos, juan, maria].  % Ordenado
```

---

# 13. ERRORES CONCEPTUALES COMUNES

## 13.1 En Haskell

```haskell
-- ERROR 1: Confundir (=) con (==)
-- x = 5       -- Definición
-- x == 5      -- Comparación

-- ERROR 2: Creer que las variables cambian
x = 5
x = 10      -- ERROR: x ya está definido como 5
            -- No se puede reasignar

-- ERROR 3: Olvidar que todo es una expresión
resultado = if edad >= 18 
    then "Adulto"  
    else "Menor"
-- "resultado" es una expresión que se evalúa a un String

-- ERROR 4: Confundir composición con aplicación
(f . g) x    -- Composición: f(g(x))
f (g x)      -- Aplicación: f(g(x)) - MISMO RESULTADO
f . g        -- Composición: nueva función
             -- es diferente de f y de g

-- ERROR 5: Pensar en "estado" en funciones puras
contador x = x + 1
contador 5   -- 6
contador 5   -- 6 (no incrementó, no hay estado)
```

## 13.2 En Prolog

```prolog
% ERROR 1: Confundir = con ==
X = 5.          % Unificación: liga X a 5
5 == 5.         % Identidad: true
X == 5.         % Identidad: false (X está ligada a 5 pero la estructura es distinta)

% ERROR 2: Pensar que el orden no importa
persona(juan, 25).      % juan es la primera persona
persona(maria, 23).     % maria es la segunda

% Pero en la BD no hay "orden", son hechos
% Sin embargo, Prolog busca de arriba a abajo en cláusulas

% ERROR 3: Creer que is es inversible
X is 5 + 3.         % OK: X = 8
8 is 5 + 3.         % OK: verifica
8 is Y + 3.         % ERROR: Y no ligada
% is SOLO evalúa de derecha a izquierda

% ERROR 4: Olvidar el backtracking
color(rojo).
color(azul).
color(verde).

obtener_color(X) :- color(X).

% Esto devuelve TODAS las soluciones en backtracking
% No solo la primera

% ERROR 5: Negación por fallo
\+ padre(X, Y).      % "No existe relación padre"
% Pero si no hay BD vacía, esto es false
% Porque existen padres
```

---

# 14. RESUMEN COMPARATIVO DE CONCEPTOS

## 14.1 Recursión

**Haskell:**
```haskell
-- Explícita en función
factorial 0 = 1
factorial n = n * factorial (n-1)
```

**Prolog:**
```prolog
% Explícita en predicado
factorial(0, 1).
factorial(N, F) :- N > 0, N1 is N-1, factorial(N1, F1), F is N*F1.
```

## 14.2 Búsqueda

**Haskell:**
```haskell
-- Manual con filter/map
pares = filter even [1..10]
```

**Prolog:**
```prolog
% Automática con backtracking
?- number(X), X > 5, even(X).
```

## 14.3 Transformación de Datos

**Haskell:**
```haskell
-- Composición y orden superior
resultado = map (2*) . filter (>5) $ [1..10]
```

**Prolog:**
```prolog
% Predicado que relaciona input/output
transforma(Lista, Resultado) :-
    findall(X, (member(X, Lista), X > 5), Filtrados),
    findall(Y, (member(Z, Filtrados), Y is Z*2), Resultado).
```

---

# 15. PREGUNTAS TIPO FINAL MÁS ESPECÍFICAS

### Pregunta: "Explique la diferencia entre unificación y asignación. ¿Por qué Prolog usa unificación en lugar de asignación?"

**Respuesta esperada incluye:**
- Definición de unificación (bidireccional, ligadura reversible)
- Definición de asignación (unidireccional, destructiva)
- Ventajas: permite búsqueda en múltiples direcciones
- Ejemplo: padre(X, Y) funciona para encontrar padres O hijos

### Pregunta: "¿Cómo afecta la evaluación lazy a la expresividad de Haskell?"

**Respuesta esperada incluye:**
- Definición de lazy evaluation
- Permite listas infinitas
- Mejora eficiencia (calcula solo lo necesario)
- Posibilita composición más declarativa
- Ejemplo de lista infinita

### Pregunta: "Explique pattern matching en Haskell. ¿Cuál es su relación con unificación en Prolog?"

**Respuesta esperada incluye:**
- Pattern matching: especifica estructura de parámetros
- Unificación: hace términos idénticos
- Similitud: ambos "especializan" variables
- Diferencia: pattern matching en Haskell es más restringido (no busca alternativas automáticamente)

---

**Este documento complementa los anteriores con temas específicos, técnicas avanzadas y errores comunes a evitar.** 📚✨

