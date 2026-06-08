<!-- Slide number: 1 -->
# Paradigmas de Programación

<!-- Slide number: 2 -->
# Paradigma Funcional - Haskell
Orden Superior
esMultiploDeDos nro = mod nro 2 == 0
esMultiploDeTres nro = mod nro 3 == 0
esMultiploDeDiez nro = mod nro 10 == 0
Se simplifica
esMultiploDe divisor  nro = mod nro divisor == 0
Ordenar alfabeticamente/por precio/ por calorias
ordenarAlfabeticamente  Lista
ordenarPorPrecio  Lista
ordenarPorCaloria  Lista

<!-- Slide number: 3 -->
# Paradigma Funcional - Haskell
Orden Superior
ordenarPor  nombre  Lista
ordenarPor  precio  Lista
ordenarPor  caloria  Lista
Las funciones son valores de primer orden.
Permite construir abstracciones más genéricas
Se separa el algorítmo de la implementación en particular.
Se logra mayor declaratividad.

<!-- Slide number: 4 -->
# Paradigma Funcional - Haskell
Ejemplo SUMA:
Realizar el promedio de edad de una lista de personas, sabiendo que la función sum hace la suma de una lista de números. Por lo tanto solo necesitamos generar una lista de edades y el resto ya está hecho.
promedioEdades personas = (sum . edades) personas / length personas
edades [] = []
edades [x:xs] = edad x : edades xs

<!-- Slide number: 5 -->
# Paradigma Funcional - Haskell
Ejemplo Doble:
Calcular el doble de una lista de números.
duplicarTodos  [] = []
duplicarTodos [x:xs] = doble x : duplicarTodos xs
Ejemplo Iniciales:
Obtener las iniciales de una lista de palabras
iniciales [] = []
iniciales [x: xs] = head x : iniciales xs

<!-- Slide number: 6 -->
# Paradigma Funcional - Haskell
Haciendo Factor Común
edades [] = []
edades [x:xs] = edad x : edades xs
duplicarTodos  [] = []
duplicarTodos [x:xs] = doble x : duplicarTodos xs
iniciales [] = []
iniciales [x: xs] = head x : iniciales xs
MAP
map  f [] = []
map  f [cabeza : cola] = f cabeza : map cola
f es función
Map :: (a->b)  -> [a] -> [b]

<!-- Slide number: 7 -->
# Paradigma Funcional - Haskell
Nos queda
edades personas = map edad personas
duplicarTodos  numeros = map  doble numeros
iniciales palabras =  map head palabras
Pasando a funcional
edades    		= map edad
duplicarTodos 	= map  doble
iniciales 		= map head

<!-- Slide number: 8 -->
# Paradigma Funcional - Haskell
Recursividad en Funciones (ejercicios)
Como implementaría head y tail
Como implementaría null y elem
Como implementaría TodosPares y TodosAprobados
Generalizando:
todosCumplen :: (a -> Bool) -> [a] -> Bool
todosCumplen criterio [] = True
todosCumplen criterio [x:xs] = criterio x && todosCumplen criterio xs

<!-- Slide number: 9 -->
# Paradigma Funcional - Haskell
Orden Superior
FILTER
filter :: (a->Bool) -> [a] -> [a]
filter _ [] = []
filter  condicion [x : xs] =
| condicion x =  x : filter condicion xs
| otherwise  = filter condicion xs
Nos queda
adultosMayores personas = filter  esMayor personas
esMayor persona = edad persona > 65
Pasando a funcional
adultosMayores = filter esMayor

<!-- Slide number: 10 -->
# Paradigma Funcional - Haskell
ALL  es similar a Filter
todosPrimos numeros = all esPrimo numeros
all :: (a->Bool) -> [a] -> Bool
all _ [] = True
all  condicion [x : xs] = condicion x  &&  all condicion xs
Pero cuando encuentra que uno de los elementos no cumple el criterio (False) no sigue con los próximos. Por la evaluación Laisy
ANY devuelve si alguno cumple
algunoEsVengador  superheroes = ANY esVengador superheroes
any :: (a->Bool) -> [a] -> Bool
any _ [] = False
any  condicion [x : xs] = condicion x  ||  any condicion xs

<!-- Slide number: 11 -->
# Paradigma Funcional - Haskell
ALL  y ANY distintos
all :: (a->Bool) -> [a] -> Bool
all condicion lista = (and . map condicion) lista
any :: (a->Bool) -> [a] -> Bool
any condicion lista = (or . map condicion) lista
zipWith
zipWith:: (a->a->a) -> [a] -> [a] -> [a]
zipWith (+) lista  lista = lista
Orden Superior permite
Funciones mas cohesivas, el parámetro se encarga de un objetivo y map de otro
Menor acoplamiento, un error en cualquiera de las funciones  mas difícil de mantener
Funciones mas declarativas  Menor detalle algorítmico
Funciones mas expresivas  se entiende mas facil

<!-- Slide number: 12 -->
# Paradigma Funcional - Haskell
Otras funciones de Orden Superior:
iterate (*2) 1
flip (/) 2 10
($) div 10 2
(.) (*2) (+1) 10
((*2).(+1).length) “HOLA”
Definición de funciones LAMBDA (función anonima)
(\x y)
map (\x -> x+1) [1,2,3]
otrasPalabras n palabras = map (\palabra -> length palabra + n) palabras

<!-- Slide number: 13 -->
# Paradigma Funcional - Haskell
Ejemplo: Cuales son los alimentos que tiene hasta 100 Calorias?

![](Picture2.jpg)

<!-- Slide number: 14 -->
# Paradigma Funcional - Haskell
Ejemplo: Cuales son los alimentos que tiene hasta 100 Calorias?
alimentosPocoCaloricos :: [InfoNutri] -> [Alimento]
alimentosPocoCaloricos = map alimento . filter  pocoCalorico
pocoCalorico = (<=100).calorias

<!-- Slide number: 15 -->
# Paradigma Funcional - Haskell
Se puede generalizar estos ejemplos:
length :: [a] -> Int
length [] =0
length x:xs = 1 + length xs

sum :: Num a => [a] -> a
sum [] =0
sum x:xs = x + sum xs

productoria :: Num a => [a] -> a
productoria [] =1
productoria x:xs = x * productoria xs

<!-- Slide number: 16 -->
# Paradigma Funcional - Haskell
Usando Foldeo o reducción:
foldr :: (b->a->a) -> a ->[b] -> a
foldr  f valor  [] = valor
foldr  f valor  (x:xs) = f x (foldr f valor xs)
Reescribiendo:
length :: [a] -> Int
length [] =0
length x:xs = 1 + length xs

productoria :: Num a => [a] -> a
productoria [] =1
productoria x:xs = x * productoria xs

length :: [a] -> Int
length’ = foldr ( \_ x -> x+1) 0

productoria’ :: Num a => [a] -> a
productoria ‘= foldr (*) 1

<!-- Slide number: 17 -->
# Paradigma Funcional - Haskell
Usando Foldeo o reducción para maximun:
foldr 1 `max` [1,2,3]    ----- 3
Se puede usar tambien foldl
foldl _ semilla [] = semilla
foldl f semilla (x:xs) = foldl f ( f semilla x) xs
Para foldr
foldr _ semilla [] = semilla
foldr f semilla (x:xs) = foldr f ( f x semilla ) xs

<!-- Slide number: 18 -->
# Paradigma Funcional - Haskell
Usando Foldeo sin semilla (usa primer elemento)
foldl1 :: (a->a->a) ->[a] -> a
foldl1  f (x:xs) = foldl f x xs
Diferencia entre foldl y foldr
Uno es asociativo a izquierda y el otro asociativo a derecha
Foldr1 (-) [1,2,3]
Foldr1 (-) [1,2] – (3)
Foldr1 (-) [1] - (2 - (3))
(1 - ( 2  - (3)))
Foldl1 (-) [1,2,3]
Foldl1 (-) (1) - [2,3]
Foldl1 (-) ((1) - 2) – [3]
(((1) - 2)  - 3)

<!-- Slide number: 19 -->
# Paradigma Funcional - Haskell
Usando Foldeo o reducción *:
foldr  (*) 7 []    ----- 7
foldr  (*) 7 [1,2,3]    ----- 42
Usando ++
foldr  (++) “.” [“hola”,”chau”,”adios”]  “holachauadios.”
foldl  (++)  “.” [“hola”,”chau”,”adios”] “.holachauadios”
Usando LambdaCalculo
foldr (\string num -> num + length string) 0 [“hola”, “chau”, “adios”]  --------- 13

<!-- Slide number: 20 -->
# Paradigma Funcional - Haskell
Ejemplo:
De entre los alimentos que no son pococaloricos, si hay alguno que tenga mas proteínas que grasas
Que alimente tiene mayor valor calorico, mas carbohidratos, mayor nombre, teniendo en cuenta que ya existe la siguiente función:
elDeMayor :: Ord b => (a -> b) ->a ->a ->a
elDeMayor ponderacion x y
| ponderacion x > ponderacion y  = x
otherwise  y

<!-- Slide number: 21 -->
# Paradigma Funcional - Haskell
Resolucion a)
Filtrado no poco caloricos
filter (not pocoCalorico)  infoNutricionales
Proteinas de alimentos
any (\infoNutricional -> proteinas infoNutricional > grasas infoNutricional)
Juntado:
any (\infoNutricional -> proteinas infoNutricional > grasas infoNutricional) . filter (not pocoCalorico)  infoNutricionales
Para ver la info
filter (\infoNutricional -> proteinas infoNutricional > grasas infoNutricional) . filter (not pocoCalorico)  infoNutricionales

<!-- Slide number: 22 -->
# Paradigma Funcional - Haskell
Resolucion b)
Filtrado no poco caloricos
elDeMayor calorias infoManzan infoBanana
Foldr1 (elDeMayor calorias) infoNutricionales

<!-- Slide number: 23 -->
# Paradigma Funcional - Haskell
Ejemplos interesantes
componer funciones = foldr1 (.) funciones
Con funciones una lista de funciones. No permite vacío
componer1 funciones = foldr (.) id funciones
Si acepta la lista vacía de funciones

<!-- Slide number: 24 -->
# Paradigma Funcional - Haskell

![](Picture2.jpg)

<!-- Slide number: 25 -->
# Paradigma Funcional
Teniendo un juego de cartas con superhéroes y para cada superhéroe se tiene información de sus poderes.
Se pide extender las cartas para incluir tags y definir funciones para cambiarlos
Dado un mazo de cartas:
Obtener los nombres de las cartas que comienzan con “bat”
Averiguar si hay cartas con los tags demasiado largos.
Corregir las cartas a las que pusieron tag #alguien en lugar de #alien

![](Picture2.jpg)