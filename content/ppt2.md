<!-- Slide number: 1 -->
# Paradigmas de Programación

<!-- Slide number: 2 -->
# Que es un programa vs un paradigma
Programa: Una secuencia de instrucciones que resuelve un problema (vista imperativo)
Programa: Como está organizado internamente?
Se resuelve de varias maneras
Restricciones
Paradigma (forma de entender/pensar el mundo)
Ir en auto (semáforos, licencia, gmap)
Ir en transporte público (sube, horarios, paradas)
Paradigma (serie de reglas, serie de convenciones)
Distintas formas de programar (interpretar, entender unidades de código)

<!-- Slide number: 3 -->
# Imperativo o Declarativo
Pizza
Imperativo (yo cocinando)
Paso a paso
Declarativo (yo comprando la pizza)
Se delega a otro. Solo debo especificar como la quiero.

<!-- Slide number: 4 -->
# Declaratividad
Viaje en auto vs colectivo

Viaje en remis
Solo indicar a donde se desea ir.

![](Picture2.jpg)

<!-- Slide number: 5 -->
# Análisis de un programa
Que hace el programa?
Cual es el rol de cada variable?
Cuanto tiempo tomó darse cuenta que hace la función?

![](Picture2.jpg)
Invocar a la función:
int arreglo[5] = {21, 10,8,15,3}
R=hacealgo(arreglo, 5);

R=2?

<!-- Slide number: 6 -->
# Expresividad
Se mejora la lectura del código

![](Picture2.jpg)

![](Picture2.jpg)

<!-- Slide number: 7 -->

![](Picture2.jpg)
# Abstracción

![](Picture5.jpg)

![](Picture6.jpg)
Declaratividad

<!-- Slide number: 8 -->
# Imperativo a Declarativo
Tips a tener en cuenta:
Orden de ejecución
Producir Efecto
(Mantener estado global)
Asignación destructiva
(Asignar una valor nuevo a una variable)
Sería una restricción
Cada paradigma da ciertas ventajas y tiene sus reglas – nueva forma de pensar.

<!-- Slide number: 9 -->
# Lenguaje vs Paradigma
Haskell
Paradigma Funcional
Prolog
Paradigma Lógico
Java
Paradigma Orientada a Objeto

<!-- Slide number: 10 -->
# Paradigma Funcional
Muy similar al paradigma lógico
Distante del paradigma imperativo y OO
No existen Secuencias, Estructuras de control ni Variables.
No se modifica un estado global.
Variable como celda de memoria (NO)
Valores que entran y valores que salen
No existe un proceso de recordar información

<!-- Slide number: 11 -->
# Paradigma Funcional
Similar a las funciones matemáticas
E    F()    S
E1    S1
Unicidad y Existencia
Existencia:  Para todo Ei  Hay una Si
Unicidad:    No hay Si y Sj para una Ei
A diferencia del Paradigma Lógico que puede tener muchas imágenes de salida (respuestas alternativas).
Ejemplo: Periodista puede generar un relato de un hecho real y otro periodista tiene un relato distinto.

<!-- Slide number: 12 -->
# Paradigma Funcional
Transparencia referencial:
La salida solo depende de la entrada. No hay otro elemento del que depende.
En objetos al enviar un mensaje la respuesta puede cambiar porque usar el estado interno del objeto para dar la respuesta.
Transparencia referencial  Principio de sustitución.
X+Y   y si X vale 2 entonces se puede sustituir 2+Y
Siempre la función devuelve lo mismo  se puede reemplazar la función por la imagen.

<!-- Slide number: 13 -->
# Paradigma Funcional - Representación
Diagrama de Venn (Conjuntos)

Eje cartesiano

![](Picture2.jpg)

![](Picture2.jpg)

<!-- Slide number: 14 -->
# Paradigma Funcional
Transparencia referencial:
Independientes
Solo depende de los parámetros
Determinísticas
Siempre da el mismo resultado ante los mismos datos
Sin Efecto
No modifica el ambiente
Contraejemplo en C
= no es asignación

![](Picture2.jpg)

<!-- Slide number: 15 -->
# Uso de interface STACK – para HASKELL
STACK
Ver como instalar stack
Es un entorno para automatizar tareas
Se tiene pdepreludat.hsfiles
Es una modificación de preludat.hsfiles, para hacer mas sencillo el uso de haskell que puede ser muy aspero.
Comando para crear el ambiente de desarrollo
stack new proyecto-test https://github.com/10Pines/pdepreludat/releases/download/2.0.2/pdepreludat.hsfiles
cd proyecto-test; stack build –test
Comando para levantar el VSC
code .

<!-- Slide number: 16 -->
# Uso de interface STACK – para HASKELL
VisualStudioCode
Es un entorno de desarrollo - gráfico
Comando para levantar el VSC ubicados dentro de la carpeta del proyecto
code .
Archivos relevantes:
library.hs, spec.hs y readme
En library.hs se declara una función DOBLE y en spec.hs se verifica que 2 sea el DOBLE de 1 usando el framework hspec.

<!-- Slide number: 17 -->
# Uso de interface STACK – para HASKELL
VSC y HASKELL
VSC usa extensiones (ver @install)
Extensión Simple GHC y Haskell Syntax Highlighting
Extensión Haskutil (para importar otras funciones)
Sin buscar en que biblioteca se encuentra la función.
Primeras funciones
Dentro de Library.hs
F :: Number -> Bool
F “3” = True
F _ = False         {De cualquier cosa}
Marcar un error en forma interactiva en lugar de guardar y compilar solo con guardar
Por eso va a marcar la segunda línea un error sin salir del entorno de desarrollo y si se selecciona el archivo library aparece un panel nuevo con los errores.

<!-- Slide number: 18 -->
# Uso de interface STACK – para HASKELL
Entorno
Se tiene paneles donde se ven los errores,  una terminal entre otros.
Seleccionando la terminal se puede acceder a un shell donde se ejecutan comandos
Un comando que permite testear el programa (ejecutar)
stack ghci
Dentro del ghci, se puede testear el programa invocando:
F 3         (por ejemplo)
Si se modifica el programa se debe recargar desde la terminal usando
:r
Para salir de la consola
:q

<!-- Slide number: 19 -->
# Uso de interface HASKELL
Haskell Interpretado
ghci   desde linea de comando
3+4		(operador infijo)
3*4
even 5
div 5 2
Para definir funciones propias se genera un archivo XX.hs
esPar = even	       (es una igualdad matemática no asigna)
Cuadruple nro = 4 * nro
Se carga XX.hs y prueba el programa usando
:load XX.hs
esPar 4

<!-- Slide number: 20 -->
# Modelar Maderera - Composición
Crear maderera.hs
Dentro crear las funciones
Cuadruple nro = 4 * nro
largoDeListon = 300
maderaCuadro = cuadruple
Mealcanza largo = largo <= largoDeListon
Otra Función Compuesta
PuedohacerCuadroDe lado = Mealcanza (maderaCuadro  lado)
PuedohacerCuadroDe lado = Mealcanza.maderaCuadro

Nota:
F = G o H
F = G.H

<!-- Slide number: 21 -->
# Modelar Maderera - Ejercicio
Que porcentaje de listón sobraría para armar un cuadro de tamaño 50 de lado.
MaderaCuadro 50 200
Cuantomesobra 200 -> 100
Queporcentaje 100 -> 100/300
Archivo maderera.hs
Dentro crear las funciones
Cuadruple nro = 4 * nro
largoDeListon = 300
maderaCuadro = cuadruple
Mealcanza largo = largo <= largoDeListon
Queporcentaje.CuantoMeSobra.maderaCuadro
CuantoMesobra cantidad = largoDeListon – cantidad
Queporcentaje cantidad = cantidad / largoDeListon * 100 100
Nota:
F = G o H
F = G.H

<!-- Slide number: 22 -->
# Paradigma Funcional - Haskell
Valores: siempre tienen un tipo asociado:
Valores primitivos (Son grupos de elementos)
Number	4.5 4 800.99
String		“Hola” “#plp”
Bool		True  False
Char		‘a’ ‘b’
Number puede se Int, Float, Double
:t “hola”   [Char]  que es un String
Funciones:
Transforman un valor en otro valor (dominio-> imagen)
Length
(+)
Not
Negate
Length :: String -> Number

<!-- Slide number: 23 -->
# Paradigma Funcional
Ejemplo en Haskell
Convención
Doble :: Number -> Number
Doble  unnumero  = unnumero * 2
Ejemplo
Div Number Number -> Number
Plantillas:
Conveción		esPar :: Number -> Bool
De otra función		esPar = even
Con un parámetro	esPar  nro = nro % 2 == 0
Con parámetros		esDiv :: Number -> Number -> Bool
 	    EsDiv divisor dividendo  =  divisor % dividendo == 0
Uso:
EsPar 4
3+4     o   (+) 3 4

<!-- Slide number: 24 -->
# Paradigma Funcional
Cuando los tipos no concuerdan

Que es una expresión
4  		   -- Valor  	   -- Int
Longitud	   -- Valor	   -- String -> Int
Longitud “Hola” -- Aplicación  -- Int (4)
Nota: Las expresiones se pueden reducir.

![](Picture2.jpg)

<!-- Slide number: 25 -->
# Paradigma Funcional - Haskell
Ejercicios en Haskell
Definir la función esMayorDeEdad (edad>=18)
Definir la función esMenorDeEdad (edad<18)
Definir NombreFormateado que toma un nombre y un apellido y devuelve el Apellido, Nombre.
Verificar
EsMayorDeEdad   19
EsMayorDeEdad  17
:t EsMayorDeEdad
:t EsMayorDeEdad 17
Definir esMenorDeEdad partiendo de esMayorDeEdad

<!-- Slide number: 26 -->
# Paradigma Funcional
Ejercicios en Haskell
Queremos saber que velocidad alcanzará la pelota a los 5 segundos si se la deja caer desde una ventana ubicada en el último piso de un edificio.
Queremos saber que distancia recorre la pelota a los 5 segundos si se la deja caer desde una ventana ubicada en el último piso de un edificio.
Queremos saber si la pelota rebota contra el piso  a los 5 segundos si se la deja caer desde una ventana a 80 m de altura.
V = t * g
D = ½ * t 2 * g

![](Picture2.jpg)

<!-- Slide number: 27 -->
# Paradigma Funcional - Haskell
Ingresar en TryHaskell.org
Ejecutar ejemplos
2+2
reverse “Hola”
even
odd
“hola” ++ “chau”
elem ‘f’ “elefante”
sqrt 3.3
round 3.5    Integral
take 3 “hola”
drop 3 “hola”

<!-- Slide number: 28 -->
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