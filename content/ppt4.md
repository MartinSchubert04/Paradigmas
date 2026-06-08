<!-- Slide number: 1 -->
# Paradigmas de Programación

<!-- Slide number: 2 -->
# Paradigma Funcional - Haskell
Resumen:
Definición e implicancias de Funciones y Programa
Transparencia Referencial
Sintaxis básica de definición y consulta de funciones
Pattern Matching
Tipado, Inferencia y Variables de Tipo
Type Classes

<!-- Slide number: 3 -->
# Paradigma Funcional - Haskell
Precedencia de operadores
Las funciones prefijas tienen mas precedencia que los operadores o funciones infijas.
Uso de paréntesis
Even length “alfonsina”
Length “mar” > 10
8 + 7 * 2
Tipos nuevos
Type Dia = String
Type Hora = Int

<!-- Slide number: 4 -->
# Paradigma Funcional - Haskell
Ejemplo
Dado un día y un booleano  que indica si es feriado o no , se desea saber el horario de cierre del supermercado:
Los domingos feriados cierra a las 13, y los sabados no feriado cierra a las 21
El resto de los feriados cierra a las 20, y el resto de los días cierra a las 12 + la cantidad de letras del día

<!-- Slide number: 5 -->
# Paradigma Funcional - Haskell
Otro Ejemplo
Conjuncion :: Bool -> Bool -> Bool
Conjuncion True True -> True
Conjuncion True False -> False
Conjuncion False False -> False
Conjuncion False True -> False
Usando variable anónima (Ojo con el orden)
Conjuncion :: Bool -> Bool -> Bool
Conjuncion True True -> True
Conjuncion _  _ = False

<!-- Slide number: 6 -->
# Paradigma Funcional - Haskell
Función Parcial
Está definida en una parte del dominio y no tiene valores asociados para elementos fuera de dicha parte
diaDeSemana  :: Int -> String
diaDeSemana 1 = “Lunes”
diaDeSemana 2 = “Martes”
diaDeSemana 3 = “Miercoles”
diaDeSemana 4 = “Jueves”
diaDeSemana 5 = “Viernes”
diaDeSemana 6 = “Sabados”
diaDeSemana 7 = “Domingos”
Si se usa diaDeSemana 8

<!-- Slide number: 7 -->
# Paradigma Funcional - Haskell
Función Partida o con Guardas
f :: Int -> Int
f x
         | x < -1                            = -1
         | -1 <= x && x <= 1       = 1
         | x > 1                              =  -1
Dejar espacio delante de la guarda
Sigue una condición o  una expresión que pueda reducirse a un Bool
Se puede usar
     | otherwise                    = -1
Guarda vs Pattern Matching
Definición por extensión o por condición
Generar la misma función definida en dos líneas

<!-- Slide number: 8 -->
# Paradigma Funcional - Haskell
Función con Guardas para excluir del dominio
Dividir :: Int -> Int -> Int
Dividir  dividendo   divisor
         | divisor /=  0         =  div dividendo divisor
Función Fibonacci sin negativos
Factorial :: Int -> Int
Factorial 0 = 1
Factorial n
      | n>0  = n * Factorial (n-1)
Otra forma
Factorial n
      | n == 0       =  1
      | n>0            = n * Factorial (n-1)

<!-- Slide number: 9 -->
# Paradigma Funcional - Haskell
Tuplas (define datos compuestos)
type Persona = (Nombre, Edad)
Uso
edad :: Persona -> Edad
edad :: (Nombre, Edad) -> Edad
Pattern Matching
edad (n, e) = e
edad (_ , e) = e      “Variable Anónima”

<!-- Slide number: 10 -->
# Paradigma Funcional – Haskell
Tuplas
A partir de una cantidad X de caracteres deseados  y una palabra, se desea truncarla devolviendo los primeros X caracteres y la cantidad de caracteres borrados.
Resolución:
truncar :: Int -> String -> (String, Int)
truncar cantidadCar palabra = (take cantidadCar palabra, length palabra – cantidadCar)
Uso
truncar  3  “Hola”
(“Hol”,  1)
Funciones para Duplas:
Fst ( x, _ ) = x
Snd (_, y) = y

<!-- Slide number: 11 -->
# Paradigma Funcional – Haskell
Tuplas
Eq? , Show?, Ord?, Num?
Dependen de sus componentes
No pueden sumarse o aplicarle las operaciones de Num.
Resumen:
Data:  permite definir tipos propios y es mas expresiva
Tuplas:  tipos predefinidos, se pierde semantica, sirven para salir del paso.

<!-- Slide number: 12 -->
# Paradigma Funcional – Haskell
Ejemplo de DATA
Se desea modelar estudiantes de quienes se conocen su nombre, legajo y nota.
Se necesita saber si un estudiante aprobó
Resolución
aprobo :: Estudiante  Bool
Creación de tipo
data Estudiante = UnEstudiante {
nombre :: String,
legajo :: String,
nota :: Int
}

Constructor de valores de  tipo Estudiante

<!-- Slide number: 13 -->
# Paradigma Funcional – Haskell
Uso (asignación de valores)
juanita :: Estudiante
juanita = unEstudiante “Juana”  “L004100-3” 8
pedrito :: Estudiante
pedrito = unEstudiante {legajo = “L004101-4”,nombre = “Pedrito”, nota = 7}

Genera automáticamente funciones de acceso
:t nombre
nombre :: Estudiante -> String
nombre  juanita
“Juana”

<!-- Slide number: 14 -->
# Paradigma Funcional – Haskell
Resolución
aprobo estudiante = nota estudiante >= 7
Funciones, data y Pattern Matching
legajoyNombre :: Estudiante -> String
legajoyNombre (unEstudiante nombre legajo _) = legajo ++ “,  “ ++ nombre
Otras funciones
lefueMejorA :: Estudiante -> Estudiante -> Bool
lefueMejorA (unEstudiante _ _ unaNota) (unEstudiante _ _ otraNota) = unaNota > otraNota
lefueMejorA estudianteMejor  estudianteNormal  = nota estudianteMejor   > nota estudianteNormal
La segunda función es mas abstracta, no muestra como está implementado al no usar Pattern Matching

<!-- Slide number: 15 -->
# Paradigma Funcional – Haskell
Se puede cambiar la nota a un alumno?
juanita :: Estudiante
juanita = unEstudiante “Juana”  “L004100-3” 8
cambiarNota :: Int -> Estudiante -> Estudiante
cambiarNota nuevaNota  (unEstudiante  nombre legajo _ ) = unEstudiante nombre legajo nuevaNota
Ojo:
Nota (cambiarNota 10 juanita )
10
Nota juanita
8
Ejemplo
subirNota :: Estudiante -> Estudiante
subirNota estudiante = cambiarNota ( nota estudiante +1) estudiante
nota ( subirNota (subirNota Juanita))
10

<!-- Slide number: 16 -->
# Paradigma Funcional – Haskell
Extensiones de Clases
juanita
Da error por no pertenecer a la clase Show
data Estudiante = unEstudiante {
nombre :: String,
legajo :: String,
nota :: Int
} deriving  (Show, Eq)
Ahora se pude mostrar y comparar
juanita  (Muestra contenido)
juanita == pedrito  (False)

<!-- Slide number: 17 -->
# Paradigma Funcional – Haskell
queAlumno :: Estudiante -> String
queAlumno (Estudiante _ _ 7) = “Sabe Algo”
queAlumno Estudiante {nota >= 7} = “Genio”
queAlumno _ = “Si que Sabe”

<!-- Slide number: 18 -->
# Paradigma Funcional – Haskell
Listas en Haskell [ …… ]
juan = (“Juan”, 9,”haedo”)
pedro = (“Pedro”, 9,”boedo”)
maria = (“Pedro”, 10,”boedo”)
Listas equivale a los arrays de C
Personas = [ juan , pedro, maria]
Funciones
last, head, maximum, ++, reverse, tail, a:[b,c], take n , lista||numero , minimum, sum,  sort
Las listas pueden ser de valores o de listas
Se pueden enumerar para PatternMatching
Tipos
grupo =  [Persona ]

<!-- Slide number: 19 -->
# Paradigma Funcional – Haskell
Ejercicio de Tipos

| snd(“hola”, 1) | snd(3.4 , 4.1) | snd (‘a’, even) | snd:: |
| --- | --- | --- | --- |
| id “hola” | id 34 | id even | id:: |
| length “hola” | length 7 | length [even, odd] | length:: |
| 2 : [3 , 4] | ‘a’ : “loha” | “a” : “loha” | (:) :: |
| 5.1 + 2.4 | 2.2 + length [ ] | ‘a’ + ‘b’ | (+) :: |
| sum [2,3,4] | sum [1.2, 3.4] | sum “Hola” | Sum :: |
| True > False | ‘a’ > 3 | even > odd | (>) :: |
| maximum “abc” | maximum [3,4] | maximum [even odd] | maximum :: |

<!-- Slide number: 20 -->
# Paradigma Funcional – Haskell - STACK
Guardas y Generación de Tests para f x
Definición de Clases de resultados
Por la primer guarda x< -1 nos da una clase que engloba a -2, -3, …
Con esto se puede generar el primer test para esta clase
En el archivo Spec.hs
Import PdePreludat
Import Library
Import Test.Hspec
Main = hspec $ do
Describe “Test funcion definida por partes” $ do
It “f 1” do
(f (0)) `Should be` -1
Stack test
Si da error es porque no está implementada “f”
Editar Library.hs y poner el código visto anteriormente.
Con la opción  --file-watch hace que cualquier cambio  en Spec.hs o en Library.hs, recargue el código automáticamente

![](Picture2.jpg)

<!-- Slide number: 21 -->
# Paradigma Funcional – Haskell - STACK
Test Development Driven
Import PdePreludat
Import Library
Import Test.Hspec
Main = hspec $ do
Describe “Test funcion definida por partes” $ do
It “f (-2)” do
(f (-2)) `Should be` (-1)
It “f (-1)” do
(f (-1)) `Should be` 1
It “f (1)” do
(f (1)) `Should be` 1
It “f (2)” do
(f (2)) `Should be`  (-1)
Con esto se logra tener test de regresión junto con la creación del código en Library.hs

![](Picture2.jpg)