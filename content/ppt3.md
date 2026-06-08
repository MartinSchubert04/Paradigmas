<!-- Slide number: 1 -->
# Paradigmas de Programación

<!-- Slide number: 2 -->
# Paradigma Funcional - Haskell
Ingresar en repl.it/languages/haskell
Editar programas en línea
color "banana" = "amarillo“
color "manzana" = "rojo“
color "limon" = "amarillo“
Verificar en Consola
color “banana”
color "naranja“
*** Exception: app/Main.hs:(1,1)-(3,26): Non-exhaustive patterns in function color
Pattern Matching

<!-- Slide number: 3 -->
# Paradigma Funcional - Haskell
Pattern Matching
Ingresar en repl.it/languages/haskell
color "banana" = "amarillo"
color "manzana" = "rojo"
color "limon" = "amarillo“
color cualquiera = "gris"
El orden es importante (se va verificando de arriba hacia abajo hasta que se encuentra y se deja de verificar) [primero constantes luego variables]
factorial 0 = 1
factorial n  = factorial (n-1) * n
Cada función tiene una sola respuesta.
Factorial (-1) ??   Función parcial  Existencialidad
Números (positivos y negativos)  Tipado

<!-- Slide number: 4 -->
# Paradigma Funcional - Haskell
Tipado
Declaración  (:t  {variable/aplicación})
enesimocaracter n palabra = palabra !! N
enesimocaracter :: Int -> String -> Char
Chequeo
enesimocaracter True "hola“
<interactive>:11:17: error:    Couldn't match expected type ‘Int’ with actual type ‘Bool’
Inferencia
Como sabe el motor de Haskell saber que tipo es cada expresión
ff x y = x  &&  not  y
ff ::  ??
Recibe dos parámetros : :  dos flechas
y es la entrada de un not  Bool
X es el primer parámetro del &&
F :: Bool -> Bool -> Bool

<!-- Slide number: 5 -->
# Paradigma Funcional - Haskell
Tipado (variable de tipo) Que tipo es?
id x = x
id :: a -> a
Ignorarelprimero x y = y
Ignorarelprimero :: a -> b -> b
Type Classes (restricciones) no hay herencia
doble x = 2 * x
doble :: Int -> Int     o    Numero a Numero
doble :: Num a => a -> a
Doble True
No instance for (Num Bool)  arrising from a use of *
Num , Eq , Ord
Funciona?
doble 5.0
doble “Hola”
doble ‘b’

<!-- Slide number: 6 -->
# Paradigma Funcional - Haskell
Type Classes (restricciones) no hay herencia

Nota: Las funciones no tiene clase asociada
doble  + doble			(No es doble x + doble y)
identidad == identidad

![](Picture2.jpg)

<!-- Slide number: 7 -->
# Paradigma Funcional - Haskell
Ejemplos de Type Classes
:t (==)
(==) :: Eq a => a -> a -> Bool
:t (<)
(==) :: Ord a => a -> a -> Bool
:t (*)
(*) :: Num a => a -> a -> a
:t (/)
(/) :: Fractional  a => a -> a -> a
:t even
Even :: Integral a => a -> Bool
Solo se pueden comparar valores del mismo tipo.
No hay conversiones automáticas como en “C “

<!-- Slide number: 8 -->
# Paradigma Funcional - Haskell
Ejercicios en Haskell
Elmayordelostres :: Ord a => a -> a -> a -> a
Xor :: Bool -> Bool -> Bool
Fibonacci :: Int -> Int
Inferencia
esMuchoMayor :: ???
esMuchoMayor  n m = n – m > 10
funcionRara  :: ???
funcionRara  n m = esMuchoMayor  n  (not m)
f  x  y  =  g ( h y ( i x y ) x ) y
    f  False “ ” = True
funcionRara1  f  =  f  2 True
funcionRara2  g = g.length

<!-- Slide number: 9 -->
# Paradigma Funcional - Haskell
Alias de tipos de datos
edad “Mati” = 23
edad “Leo” = 26
El tipo de la función edad es:
edad :: String -> Number
Mas expresividad
Type Nombre = String
Type Edad= Number
edad :: Nombre -> Edad
String = [Char]

<!-- Slide number: 10 -->
# Paradigma Funcional - Haskell

![https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Base-classes.svg/510px-Base-classes.svg.png](Picture2.jpg)
Type Classes

<!-- Slide number: 11 -->
# Paradigma Funcional - Haskell
Resumen:
Definición e implicancias de Funciones y Programa
Transparencia Referencial
Sintaxis básica de definición y consulta de funciones
Pattern Matching
Tipado, Inferencia y Variables de Tipo
Type Classes