<!-- Slide number: 1 -->
# Paradigmas de Programación

<!-- Slide number: 2 -->
# Paradigma Funcional
La idea fundamental

![](Picture2.jpg)

<!-- Slide number: 3 -->
# Paradigma Funcional - Haskell
Repaso:
Aplicación y Expresión
esMayor 17  -- FALSE
:t esMayor 17 :: Bool
Inferencia, Variable de Tipo y TypeClasses
Auto decubrimiento
Alias de Tipos
Type Edad=Int
Data
Tuplas y Listas

<!-- Slide number: 4 -->
# Paradigma Funcional - Haskell
Aplicación Parcial
Invocar a una función con menos parámetros (M) que los declarados (N) en su definición.
Quedaría otra función con N-M parámetros
Ejemplo
:t conjuncion True
Da una función (conjuncion True):: Bool -> Bool
Se puede usar una función prefija como infija (` `) y así dejar otra función
True `conjuncion`  False  retorna False

<!-- Slide number: 5 -->
# Paradigma Funcional - Haskell
Conjuncion :: Bool -> Bool -> Bool
Conjuncion True True -> True
Conjuncion _  _ = False

Aplicación Parcial
Genera otra función
Los parámetros se usan en el orden en que lo pide la función.
Con las funciones infijas se puede generar otra función completando el primer o el segundo parámetro.
Recordar que se puede usar una función prefija como infija y viceversa. Con ello se pude usar en forma parcial con el primer o segundo parámetro. Ej: `max` o `truncar`
Ejemplos para ver los tipos de aplicación parcial
(==) :: Eq a => a -> a -> a
(+) :: Num a => a -> a -> a
:t (== ‘a’)  ?
:t (+ 5)  ?

<!-- Slide number: 6 -->
# Paradigma Funcional - Haskell
Aplicación Parcial (usos)
(==) :: Eq a => a -> a -> a
(+) :: Num a => a -> a -> a
:t (== ‘a’)  ?
:t (+ 5)  ?
esMayor::Edad->Bool
esMayor = (>= 18)
doble:: Num a => a -> a
doble = (2 *)
alMenosCero :: (Num a, Ord a) => a -> a
alMenosCero= (max 0)

<!-- Slide number: 7 -->
# Paradigma Funcional - Haskell

![](Picture2.jpg)

nota:: Alumno -> Int
esMenorAOcho :: Int -> Bool
not :: Bool -> Bool
promociona:: Alumno -> Bool
promociona alumno =          not (esMenorAOcho (nota alumno))
promociona alumno =          (not . esMenorAOcho  . nota) alumno
Ojo nota alumno  es un entero y no una función por lo tanto no se puede componer entonces los () son importantes

<!-- Slide number: 8 -->
# Paradigma Funcional - Haskell
Función (.)
(.) :: (b->c) -> (a-> b) -> (a->c)
Aplicación Parcial (composición)
(not .even ) .length “hola”
not . (even . length) “hola”
not . even . length “hola”
not . even . length $ “hola”
not  (even (length “hola”))     Esta no es una función
Definición de función vs Aplicación

<!-- Slide number: 9 -->
# Paradigma Funcional - Haskell
Aplicación parcial
f :: a -> b ->c ->d
f x y z es equivalente a la “currificación”
((f x) y) z
Point Free (se elimina parametro alumno)
promociona alumno=  (not . (<8)  . nota) alumno
vaAFinal nota = ((nota >=6 &&) . (<8)) nota

<!-- Slide number: 10 -->
# Paradigma Funcional - Haskell
Recursividad ejemplo:
esCapicua ([]) = True
esCapicua ([_]) = True
esCapicua ([x , y]) = (x == y)
esCapicua ([x,_,y]) = (x == y)
esCapicua cabeza:cola = cabeza== last cola
Completar usando init
Recursividad sobre estructura de datos (esCapicua)
Recursividad sobre funciones (factorial)

<!-- Slide number: 11 -->
# Paradigma Funcional - Haskell
Recursividad
Cuando una abstracción está definida sobre si misma.
Estructuras de Datos
Listas
Conjuntos de elementos
Cantidad variable de elementos
Lista vacía []
Lista con elementos  primero : restoDeElementos
Ejemplos:
[1, 2, 3]
1: [2, 3]
1: 2 : [3]
1: 2 : 3 : []

<!-- Slide number: 12 -->
# Paradigma Funcional - Haskell
Funciones sobre Listas (Recursividad)
Ejemplo length ( 1: [2,3])
Definición
length [] = 0
length (_:xs) = 1 + length(xs)
Ejemplo take 2 “hola”
Definición
take 0 _  = []
take n [] = []
take n (x:xs) = x : take (n-1) xs
String = Lista de caracteres
“h” = [‘h’]
Listas de Data
[ Persona “Tom”, 25 ]

<!-- Slide number: 13 -->
# Paradigma Funcional - Haskell
Recursividad en Funciones
Ejemplo  42 == 4 ## 2
Definición
(##) _ 0 = 1
(##) num pot = num * ( num  ## (pot-1))
Ejemplo 65 = 10001
binario 0 = 0
binario 1 = 1
binario n =  mod n 2  + binario (div n 2) * 10

<!-- Slide number: 14 -->
# Paradigma Funcional - Haskell
Recursividad en Funciones (ejercicios)
Genere la función sumatoria de los elementos de una lista
Genere la función longitud de una lista
Numero elevado a otro numero
Mientras no supera el tope muestra el elemento de la lista.
Mostrar los n elementos primeros de la lista.