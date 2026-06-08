<!-- Slide number: 1 -->
# Paradigmas de Programación

<!-- Slide number: 2 -->
# Paradigmas de Programación
Estrategias de Evaluación
Evaluación Eager
Realiza la evaluación de los parámetros primero y luego la evaluación de la función
Evaluación Lazy
Retrasa la evaluación de los parámetros hasta que no tiene otra opción. Comienza evaluando la función y dependiendo de ella va a evaluar uno o dos o N parámetros.

<!-- Slide number: 3 -->
# Paradigmas de Programación
Estrategias de Evaluación (Ejemplo)
Función
distancia unKM otroKM = abs (unKM - otroKM)
Evaluación Eager
Distancia (2*40) (div 600 3)
Distancia 80 200
Abs (80 -200)
Abs (-120)        120
Evaluación Lazy
Distancia (2*40)(div 600 3)
Abs (2*40 - div 600 3)
Si (2*40 - div 600 3) > 0  entonces calcula (80 – 200)
Retorna  - ( - 120)       120

<!-- Slide number: 4 -->
# Paradigmas de Programación
Estrategias de Evaluación (Ejemplo)
Función Fst
Evaluación Eager
fst (2*40, div 600 3)
Fst (80, 200)  80
Evaluación Lazy
fst (2*40, div 600 3)
Fst (2*40)  2*40
Fst (80)  80
En Haskell
Fst (2*40, div 600 0)
Error????
80

<!-- Slide number: 5 -->
# Paradigmas de Programación
Estrategias de Evaluación (Ejemplo)
Listas “infinitas”
Evaluación Eager
head (iterate (*2) 1)
No devuelve resultado
Evaluación Lazy
head (iterate (*2) 1)
Devuelve 2
Usando listas infinitas
head.map (3*).iterate (+1) 1
head (map(3*) [1 ..])

<!-- Slide number: 6 -->
# Paradigmas de Programación Funcional
Resolver un problema para una librería
¿Es cierto que alguien escribió una determinada obra?
¿Quién o quienes escribieron una obra?
¿Qué obra escribió cierta persona?
Si es cierto que cierta persona escribió alguna obra, sin importar cual.
Si es cierto que cierta obra existe.

<!-- Slide number: 7 -->
# Paradigmas de Programación Funcional
Resolver un problema para una librería
type Titulo = String
type Autor = String
data obra = UnaObra {titulo:: Titulo, autores:: [Autor]}

Base de DATOS
todasLasObras::[Obra]
todasLasObras = [UnaObra “sandman” [“gaiman”], UnaObra “socorro” [“ElsaBornemann”], UnaObra “buenos presagios” [“gaiman”, “pratchett”]]

<!-- Slide number: 8 -->
# Paradigmas de Programación Funcional
1) Resolver un problema para una librería
Escribio “ElsaBornemann” “Socorro” todasLasObras
True
Implementación
escribio :: Autor -> Titulo -> [Obra] -> Boolescribio unAutor unTitulo todasobras = any (tieneAutorYTitulo unAutor unTitulo) todasobras
tieneAutorYTitulo :: Autor -> Titulo -> Obra –> BooltieneAutorYTitulo unAutor unTitulo unaObra = titulo unaObra == unTitulo  && elem unAutor  (autores unaObra)
2) Resolver un problema para una librería
autoresDe  “buenos presagios” todasLasObras
[“gaiman”, “pratchett”]
Implementación
autoresDe :: Titulo -> [Obra]-> [Autor]autoresDe unTitulo todasobras = autores(head(filter((==unTitulo).titulo) todasobras))

<!-- Slide number: 9 -->
# Paradigmas de Programación Funcional
3) Resolver un problema para una librería
obrasDe “ElsaBornemann” todasLasObras
[“socorro”]
Implementación
obrasDe :: Autor -> [Obra]->[Titulo]obrasDe unAutor todasobras = map titulo (filter((elem unAutor).autores) todasobras)
4) Resolver un problema para una librería
escribioAlgo “ElsaBornemann” todasLasObras
True
Implementación
escribioAlgo :: Autor -> [Obra] -> BoolescribioAlgo unAutor todasobras =  elem unAutor (concatMap autores todasobras)

<!-- Slide number: 10 -->
# Paradigmas de Programación Funcional
5) Resolver un problema para una librería
existe “socorro” todasLasObras
True
Implementación
existe :: Titulo -> [Obra] -> Boolexiste unTitulo todasobras= elem unTitulo (map titulo todasobras)

![](Picture2.jpg)

<!-- Slide number: 11 -->
# Paradigma de Programación Funcional

![](Picture2.jpg)