# Banco de Preguntas Práctica - Final Paradigmas de Programación
## 5 Preguntas a Desarrollar (Formato Examen)

---

## CONJUNTO 1: Preguntas de Práctica

### PREGUNTA 1: Lenguajes y Paradigmas
**Nivel: Fundamental | Tiempo: 35 min | Puntaje: 5 puntos**

**Enunciado:**
"Explique la diferencia fundamental entre un lenguaje de programación y un paradigma de programación. ¿Existen lenguajes que implementan más de un paradigma? Justifique con ejemplos concretos."

#### Respuesta Modelo:

**1. Definiciones**

Un **lenguaje de programación** es una herramienta que proporciona:
- Sintaxis específica (reglas para escribir código)
- Semántica (qué significa el código)
- Compilador o intérprete (para ejecutar)
- Bibliotecas estándar

Un **paradigma de programación** es:
- Una forma de pensar/entender el problema
- Un conjunto de reglas y convenciones
- Una filosofía sobre cómo resolver problemas
- NO es una herramienta, sino una metodología

**Analogía:** Un paradigma es como una "escuela de pensamiento" y un lenguaje es como una "herramienta que implementa esa escuela".

**2. Relación entre ambos**

- Un paradigma se implementa a través de uno o más lenguajes
- Un lenguaje puede implementar uno o varios paradigmas
- No hay una relación 1-1

**Ejemplo correcto:**
- Paradigma: Funcional
- Lenguajes que lo implementan: Haskell, Lisp, Scheme, Clojure

**Ejemplo incorrecto (confusión común):**
- "Java es un paradigma" ❌ (Java es lenguaje)
- "Imperativo es un lenguaje" ❌ (Imperativo es paradigma)

**3. Lenguajes Híbridos**

Sí, existen lenguajes que implementan **múltiples paradigmas:**

| Lenguaje | Paradigmas | Ejemplo de uso |
|----------|-----------|---|
| **Python** | Imperativo + Funcional + OO | `map()`, `lambda`, `for`, clases |
| **JavaScript** | Imperativo + Funcional + OO | funciones anónimas, prototipos |
| **Scala** | OO + Funcional | case classes, pattern matching |
| **Kotlin** | OO + Funcional | lambdas, data classes |
| **Ruby** | Imperativo + Funcional + OO | bloques, símbolos, clases |

**4. Diferencia Paradigma-Lenguaje en Práctica**

Supongamos queremos calcular el doble de una lista:

```python
# Usando Python de forma IMPERATIVA
resultado = []
for numero in [1, 2, 3]:
    resultado.append(numero * 2)
print(resultado)  # [2, 4, 6]

# Usando Python de forma FUNCIONAL (mismo lenguaje)
resultado = list(map(lambda x: x * 2, [1, 2, 3]))
print(resultado)  # [2, 4, 6]
```

**El lenguaje es el mismo, pero el paradigma cambia.**

**5. Conclusión**

La diferencia es análoga a:
- Paradigma = Construcción (arquitectura)
- Lenguaje = Material de construcción (hormigón, acero, ladrillo)

Un mismo material se puede usar para diferentes construcciones, y una construcción puede usar varios materiales.

---

### PREGUNTA 2: Funciones en Paradigma Funcional
**Nivel: Fundamental | Tiempo: 35 min | Puntaje: 5 puntos**

**Enunciado:**
"Explique qué es transparencia referencial. ¿Por qué es una propiedad fundamental del paradigma funcional? Compare el comportamiento de una función con transparencia referencial versus una que no la tiene, usando ejemplos en Haskell y otro lenguaje."

#### Respuesta Modelo:

**1. Definición de Transparencia Referencial**

**Transparencia Referencial** significa que:
- Una función **solo depende de sus parámetros**
- El resultado es **siempre el mismo** para los mismos inputs
- **No depende** de variables globales, estado externo o tiempo
- **No produce efectos secundarios** (cambios en el ambiente)

Matemáticamente: `f(x) = y` siempre, para el mismo `x`.

**2. Propiedad Funcional: Expresión vs Aplicación**

Debido a transparencia referencial:

```haskell
doble :: Int -> Int
doble x = x * 2

-- Estas dos cosas son equivalentes:
resultado1 = doble 5          -- Aplicación
resultado2 = 10               -- Expresión (valor directo)

-- Se pueden intercambiar (sustitución):
f = doble 5 + doble 3
-- Se puede reescribir como:
f = 10 + 6
-- Porque doble 5 SIEMPRE es 10
```

**3. Importancia en Paradigma Funcional**

La transparencia referencial es fundamental porque:

a) **Facilita el razonamiento matemático**
   - Podemos pensar en funciones como en matemática
   - Sin sorpresas por estado oculto

b) **Permite optimización del compilador**
   - Puede cachear resultados
   - Puede ejecutar en paralelo sin problemas

c) **Simplifica pruebas**
   - No necesitas simular estado externo
   - El test es: entrada → salida esperada

d) **Código más mantenible**
   - Menos bugs por efectos inesperados
   - Más fácil entender qué hace una función

**4. Comparación: Transparencia Referencial vs Sin ella**

#### CON Transparencia Referencial (Haskell)

```haskell
-- Función pura
sumar :: Int -> Int -> Int
sumar x y = x + y

-- Siempre devuelve lo mismo
sumar 3 5  -- = 8
sumar 3 5  -- = 8
sumar 3 5  -- = 8 (millones de veces, siempre 8)

-- Puedo optimizar:
resultado = sumar 3 5 + sumar 3 5 + sumar 3 5
-- Compilador puede calcular sumar 3 5 una sola vez
```

#### SIN Transparencia Referencial (Java/C)

```java
// Variable global (estado)
static int contador = 0;

// Función impura
static int sumar(int x, int y) {
    contador++;  // Efecto secundario
    return x + y;
}

// NO es transparencia referencial
sumar(3, 5);  // = 8, contador ahora es 1
sumar(3, 5);  // = 8, contador ahora es 2
sumar(3, 5);  // = 8, contador ahora es 3
// El resultado es el mismo, pero el estado cambió!
// La función tiene "memoria"
```

O peor:

```java
class CuentaBancaria {
    private int saldo = 1000;
    
    public int obtenerSaldo() {
        return saldo;  // Mismo parámetro (none), 
                       // resultados diferentes!
    }
    
    public void extraer(int monto) {
        saldo -= monto;
    }
}

// Uso
CuentaBancaria cuenta = new CuentaBancaria();
cuenta.obtenerSaldo();  // 1000
cuenta.extraer(500);
cuenta.obtenerSaldo();  // 500 (¡cambió sin parámetros!)
```

**5. Por qué Haskell es transparente y Java no**

| Aspecto | Haskell | Java |
|---------|---------|------|
| Variables globales | No existen | Sí |
| Asignación | No existe (`=` es igualdad) | Sí (`=` reasigna) |
| Métodos que usan estado interno | No | Sí |
| Efectos secundarios | No permitidos | Permitidos |
| Resultado depende de | Solo parámetros | Parámetros + estado |

**6. Implicación del Principio de Sustitución**

Por transparencia referencial, el principio de sustitución es válido:

```haskell
-- Si x = 5, puedo sustituir x por 5 en cualquier lado
x = 5
y = x + 3 + x
-- Es equivalente a:
y = 5 + 3 + 5  -- Misma cosa
y = 13

-- En Java no se puede hacer esto si hay estado global
```

**7. Conclusión**

La transparencia referencial es lo que hace que el paradigma funcional sea:
- **Predecible:** No hay sorpresas
- **Testeable:** Solo input/output
- **Optimizable:** Compilador tiene libertad
- **Matemático:** Se parece a funciones de cálculo

Sin ella (como en lenguajes imperativos), el código depende del contexto y el tiempo de ejecución.

---

### PREGUNTA 3: Orden Superior en Haskell
**Nivel: Intermedio | Tiempo: 40 min | Puntaje: 5 puntos**

**Enunciado:**
"Explique qué son funciones de orden superior. ¿Cuál es la diferencia entre map, filter y fold? Proporcione un ejemplo práctico para cada una, y explique por qué estas funciones son importantes en el paradigma funcional."

#### Respuesta Modelo:

**1. Qué son Funciones de Orden Superior**

Una función de orden superior es una función que:
- **Recibe** otra función como parámetro, O
- **Devuelve** una función como resultado

```haskell
-- Ejemplo simple
aplicarDos :: (Int -> Int) -> Int -> Int
aplicarDos funcion x = funcion (funcion x)

-- "aplicarDos" recibe una función, es orden superior
```

**Por qué "orden superior":**
- Orden 0: Valores (Int, Bool)
- Orden 1: Funciones que trabajan con valores
- Orden 2: Funciones que trabajan con funciones (orden superior)

**2. MAP: Aplicar función a cada elemento**

```haskell
map :: (a -> b) -> [a] -> [b]

-- Significado: "Aplica la función a cada elemento de la lista"

-- Ejemplo 1: Duplicar lista
duplicar x = x * 2
numeros = [1, 2, 3]
resultado = map duplicar numeros
-- resultado = [2, 4, 6]

-- Ejemplo 2: Con lambda
resultado = map (\x -> x * 2) [1, 2, 3]
-- resultado = [2, 4, 6]

-- Ejemplo 3: Obtener edades de personas
data Persona = UnaPer { nombre :: String, edad :: Int }
personas = [UnaPer "Ana" 25, UnaPer "Bob" 30]
edades = map edad personas
-- edades = [25, 30]
```

**Patrón:** MAP transforma cada elemento → lista transformada

**3. FILTER: Seleccionar elementos**

```haskell
filter :: (a -> Bool) -> [a] -> [a]

-- Significado: "Mantiene solo elementos que cumplen la condición"

-- Ejemplo 1: Números pares
pares = filter even [1, 2, 3, 4, 5]
-- pares = [2, 4]

-- Ejemplo 2: Personas mayores de 25
mayoresDe25 = filter (\p -> edad p > 25) personas
-- mayoresDe25 = [UnaPer "Bob" 30]

-- Ejemplo 3: Palabras largas
palabrasLargas = filter (\p -> length p > 3) ["a", "hola", "ok"]
-- palabrasLargas = ["hola"]
```

**Patrón:** FILTER aplica condición → elementos que cumplen

**4. FOLD: Reducir a un valor**

```haskell
foldr :: (a -> b -> b) -> b -> [a] -> b

-- Significado: "Reduce la lista a un único valor combinando elementos"

-- Ejemplo 1: Suma
suma lista = foldr (+) 0 lista
suma [1, 2, 3]
-- = 1 + (2 + (3 + 0))
-- = 1 + (2 + 3)
-- = 1 + 5
-- = 6

-- Ejemplo 2: Producto
producto lista = foldr (*) 1 lista
producto [1, 2, 3]
-- = 1 * 2 * 3 * 1
-- = 6

-- Ejemplo 3: Longitud
longitud lista = foldr (\_ acc -> acc + 1) 0 lista
longitud [1, 2, 3]
-- = 1 (para cada elemento)
-- = 3

-- Ejemplo 4: Concatenar strings
resultado = foldr (++) "" ["hola", "mundo", "!"]
-- = "hola" ++ ("mundo" ++ ("!" ++ ""))
-- = "hola" ++ "mundo" ++ "!"
-- = "holamundo!"
```

**Patrón:** FOLD combina elementos → valor único

**5. Diferencias Clave**

| Función | Input | Output | Operación |
|---------|-------|--------|-----------|
| **MAP** | Lista de `a` | Lista de `b` | Transforma cada elemento |
| **FILTER** | Lista de `a` | Lista de `a` (más pequeña) | Selecciona elementos |
| **FOLD** | Lista de `a` | Valor `b` (único) | Reduce a un valor |

**6. Composición en Orden Superior**

El verdadero poder viene de combinar:

```haskell
-- Problema: "Suma de números pares mayores a 2"
numeros = [1, 2, 3, 4, 5, 6]

-- Paso a paso
step1 = filter (> 2) numeros           -- [3, 4, 5, 6]
step2 = filter even step1              -- [4, 6]
step3 = foldr (+) 0 step2              -- 10

-- Combinado (point-free)
resultado = foldr (+) 0 . filter even . filter (> 2) $ numeros
-- = 10
```

**7. Por qué son Importantes en Funcional**

a) **Abstracción:**
   - No repetimos lógica de iteración
   - `filter` encapsula "cómo iterar buscando condición"

b) **Expresividad:**
   ```haskell
   -- Imperativo (C)
   for (int i = 0; i < lista.size(); i++) {
       if (lista[i] % 2 == 0) {
           suma += lista[i];
       }
   }
   
   -- Funcional (Haskell)
   suma = foldr (+) 0 . filter even $ lista
   ```
   El versión funcional dice QUÉ, no CÓMO.

c) **Composabilidad:**
   - Fácil combinar map, filter, fold
   - Cada una hace una cosa bien

d) **Mantenimiento:**
   - Cambiar lógica es cambiar un parámetro
   - No modificar el loop

**8. Relación con Aplicación Parcial**

Las funciones de orden superior usan aplicación parcial:

```haskell
-- Esta definición:
map duplicar lista

-- Es equivalente a:
-- Aplicar "duplicar" parcialmente a map
(map duplicar) lista

-- map :: (a -> b) -> [a] -> [b]
-- (map duplicar) :: [Int] -> [Int]
```

**9. Conclusión**

Las funciones de orden superior son el corazón del paradigma funcional:
- Permiten código más declarativo
- Evitan repetición
- Hacen composición posible
- Transforman iteración en operaciones sobre colecciones

---

### PREGUNTA 4: Predicados e Inversibilidad en Prolog
**Nivel: Intermedio | Tiempo: 40 min | Puntaje: 5 puntos**

**Enunciado:**
"Explique qué es un predicado inversible en Prolog. ¿Cuál es la diferencia entre consultas individuales y existenciales? Proporcione ejemplos de un predicado inversible y otro que no lo es. Explique cómo el backtracking permite encontrar soluciones múltiples."

#### Respuesta Modelo:

**1. Predicados en Prolog**

Un predicado es una relación entre objetos.

```prolog
% Predicado monádico (propiedad)
esComic(sandman).

% Predicado poliádico (relación)
escribio(neil_gaiman, sandman).
```

**2. Consultas Individuales vs Existenciales**

```prolog
% CONSULTA INDIVIDUAL (determinar verdad/falso)
% Todos los argumentos están instanciados (ligados)

?- escribio(neil_gaiman, sandman).
true.

?- escribio(alan_moore, sandman).
false.

% CONSULTA EXISTENCIAL (encontrar individuos)
% Al menos un argumento es una VARIABLE (no instanciado)

?- escribio(neil_gaiman, X).
X = sandman ;
X = american_gods ;
X = buenos_presagios ;
false.

?- escribio(Y, sandman).
Y = neil_gaiman ;
false.

?- escribio(X, Y).
X = neil_gaiman, Y = sandman ;
X = neil_gaiman, Y = american_gods ;
% (múltiples soluciones)
```

**Analogía:**
- Individual: "¿Es verdad que Juan es ingeniero?" → Sí/No
- Existencial: "¿Quién es ingeniero?" → Juan, María, ...

**3. Inversibilidad: Definición**

Un predicado es **inversible** cuando:
- Puede usarse en modo "consulta individual" (verdad/falso)
- Puede usarse en modo "consulta existencial" (encontrar valores)

```prolog
% Predicado INVERSIBLE
padre(abraham, isaac).
padre(isaac, jacob).

% Modo individual
?- padre(abraham, isaac).  % true

% Modo existencial (hijo)
?- padre(abraham, X).      % X = isaac

% Modo existencial (padre)
?- padre(Y, jacob).        % Y = isaac

% Modo existencial (ambos)
?- padre(X, Y).            % X = abraham, Y = isaac ; ...
```

El predicado `padre` es inversible en casi todas sus direcciones.

**4. Predicado NO Inversible**

```prolog
edad(maria, 25).
edad(juan, 30).

% Consulta individual: OK
?- edad(maria, 25).       % true
?- edad(maria, 26).       % false

% Consulta existencial: Si queremos encontrar nombre por edad
?- edad(X, 25).           % X = maria (OK, inversible aquí)

% Ahora, consulta con el nombre ligado pero edad calculada
mayorEdad(Persona) :- 
    edad(Persona, Edad),    % edad es inversible aquí
    Edad > 18.

% Pero si hacemos:
?- mayorEdad(X).          % X = maria, X = juan (OK)

% Problema: "is" no es inversible
proxima_edad(Persona, ProximaEdad) :- 
    edad(Persona, Edad),
    ProximaEdad is Edad + 1.

?- proxima_edad(maria, X).  % X = 26 (OK, inversible)
?- proxima_edad(X, 26).     % ERROR: variable no ligada en "is"
```

**Por qué "is" no es inversible:**
```prolog
% is es una operación unidireccional
% Lado derecho → Lado izquierdo

X is 5 + 3.    % X = 8 (OK)
8 is 5 + 3.    % OK (verifica)
Y is 5 + 3.    % Y = 8 (OK)

% Pero no al revés:
8 is Z + 3.    % ERROR: Z no está ligado
```

**5. Ejemplos Contrastantes**

```prolog
% BASE DE DATOS
padre(abraham, isaac).
padre(isaac, jacob).
madre(sara, isaac).
madre(rebeca, jacob).

% PREDICADO INVERSIBLE
bisabuelo(X, Z) :- 
    padre(X, Y), 
    padre(Y, Z).

?- bisabuelo(abraham, jacob).  % true ✓
?- bisabuelo(abraham, X).       % X = jacob ✓
?- bisabuelo(X, jacob).         % X = abraham ✓
?- bisabuelo(X, Y).             % Múltiples soluciones ✓
% Todos funcionan porque solo usa "padre" y variables

% PREDICADO NO INVERSIBLE
esHijo(Persona) :- 
    padre(_, Persona).

?- esHijo(isaac).               % true ✓
?- esHijo(X).                   % X = isaac, X = jacob ✓
% Sigue siendo inversible

% Ejemplo que NO es inversible:
edad(maria, 25).
mayor(Persona) :- edad(Persona, E), E > 18.

?- mayor(maria).                % true ✓
?- mayor(X).                    % X = maria ✓ (inversible)

% Pero esto NO es inversible:
cuadruple(N, C) :- C is N * 4.

?- cuadruple(5, X).             % X = 20 ✓
?- cuadruple(X, 20).            % ERROR ✗ (no inversible)
```

**6. Unificación e Inversibilidad**

La inversibilidad depende de **unificación**:

```prolog
% Unificación: hacer dos términos iguales ligando variables

maestro(socrates, platon).
maestro(platon, aristoteles).

?- maestro(socrates, X).
% Unifica maestro(socrates, X) con maestro(socrates, platon)
% X se liga a "platon"

?- maestro(X, aristoteles).
% Unifica maestro(X, aristoteles) con maestro(platon, aristoteles)
% X se liga a "platon"

?- maestro(X, Y).
% Unifica y liga ambas variables
% X = socrates, Y = platon ; X = platon, Y = aristoteles

% Para que esto funcione, el predicado debe estar
% completamente definido (todos sus hechos conocidos)
```

**7. Backtracking: Encontrar Múltiples Soluciones**

**Definición:** Proceso de prueba y error donde el sistema intenta diferentes caminos

```prolog
% BASE
libro(sandman, gaiman).
libro(watchmen, moore).
libro(v_for_vendetta, moore).

comic(sandman).
comic(watchmen).
comic(v_for_vendetta).

% REGLA
autor_comic(Autor, Obra) :- 
    libro(Obra, Autor), 
    comic(Obra).

% CONSULTA
?- autor_comic(moore, X).
```

**Proceso de Backtracking:**

```
Paso 1: libro(X, moore), comic(X)
        Intenta unificar con: libro(sandman, gaiman) - NO coincide
        
Paso 2: Intenta siguiente: libro(watchmen, moore) - SÍ coincide
        X = watchmen
        Ahora verifica: comic(watchmen) - SÍ
        SOLUCIÓN ENCONTRADA: X = watchmen
        
Paso 3: Usuario pide más (;) - Continúa búsqueda
        Intenta siguiente: libro(v_for_vendetta, moore) - SÍ
        X = v_for_vendetta
        Verifica: comic(v_for_vendetta) - SÍ
        SOLUCIÓN ENCONTRADA: X = v_for_vendetta
        
Paso 4: Usuario pide más - No hay más libros de moore
        Devuelve: false
```

**8. Por qué es Importante Entender Inversibilidad**

```prolog
% Bien: Predicado inversible
conectado(A, B) :- carretera(A, B).
conectado(A, B) :- carretera(B, A).

% ?- conectado(santiago, buenos_aires). % true ✓
% ?- conectado(santiago, X).             % Soluciones ✓
% ?- conectado(X, buenos_aires).         % Soluciones ✓

% Mal: Predicado que solo funciona en una dirección
distancia_km(santiago, buenos_aires, 1500).

?- distancia_km(santiago, buenos_aires, X).  % X = 1500 ✓
?- distancia_km(santiago, X, 1500).          % FALLA ✗
```

**9. Resumen Comparativo**

| Aspecto | Individual | Existencial | Inversible |
|---------|-----------|------------|-----------|
| Todos argumentos ligados | Sí | No | Puede ser ambos |
| Devuelve true/false | Sí | No, devuelve valores | N/A |
| Permite variables | No | Sí | Sí |
| Backtracking necesario | No | Sí | Sí |
| Requiere BD completa | No | Sí | Sí |

**10. Conclusión**

- **Inversibilidad** es la capacidad de usar un predicado en múltiples direcciones
- **Consultas individuales** verifican hechos (verdad/falso)
- **Consultas existenciales** encuentran soluciones
- **Backtracking** permite explorar todas las soluciones posibles
- La inversibilidad depende de cómo está definido el predicado

---

### PREGUNTA 5: Síntesis - Diferencias Paradig...

**Nivel: Avanzado | Tiempo: 45 min | Puntaje: 5 puntos**

**Enunciado:**
"Compare cómo se resuelve el siguiente problema en Haskell vs Prolog: 'Dada una lista de personas con edad y estado civil, obtener los nombres de personas solteras mayores de 18 años.' Explique cómo los paradigmas funcional y lógico abordan el problema de manera distinta. ¿Cuáles son las ventajas y desventajas de cada enfoque?"

#### Respuesta Modelo:

**1. Planteo del Problema**

**Datos:**
```
Personas: [
  (Ana, 25, soltera),
  (Bob, 20, casado),
  (Carol, 30, soltera),
  (Dave, 17, soltero)
]

Resultado esperado: ["Ana", "Carol"]
```

**2. Solución en Haskell (Paradigma Funcional)**

```haskell
-- Definir el tipo de dato
data Persona = UnaPer {
    nombre :: String,
    edad :: Int,
    estCivil :: String
} deriving (Show, Eq)

-- Base de datos
personas = [
    UnaPer "Ana" 25 "soltera",
    UnaPer "Bob" 20 "casado",
    UnaPer "Carol" 30 "soltera",
    UnaPer "Dave" 17 "soltero"
]

-- Solución 1: Paso a paso
solteras_mayores_v1 personas =
    let solteras = filter (\p -> estCivil p == "soltera") personas
        mayores = filter (\p -> edad p >= 18) solteras
    in map nombre mayores

-- Solución 2: Composición (más funcional)
solteras_mayores_v2 personas =
    map nombre 
    . filter (\p -> edad p >= 18)
    . filter (\p -> estCivil p == "soltera")
    $ personas

-- Solución 3: Predicado reutilizable
esSOlteraYMayor p = 
    estCivil p == "soltera" && edad p >= 18

solteras_mayores_v3 personas =
    map nombre (filter esSolteraYMayor personas)

-- Uso
resultado = solteras_mayores_v1 personas  
-- resultado = ["Ana", "Carol"]
```

**Análisis del enfoque Haskell:**

a) **Transformaciones:**
   - Filtra por estado civil
   - Filtra por edad
   - Extrae nombres

b) **Orden explícito:**
   - Primero filtra estado civil
   - Luego filtra edad
   - Finalmente mapea nombre

c) **Punto-free style:**
   ```haskell
   solteras_mayores = map nombre . filter (\p -> edad p >= 18) . filter (\p -> estCivil p == "soltera")
   ```

**3. Solución en Prolog (Paradigma Lógico)**

```prolog
% Base de datos
persona(ana, 25, soltera).
persona(bob, 20, casado).
persona(carol, 30, soltera).
persona(dave, 17, soltero).

% Reglas
esSolteraYMayor(Nombre) :- 
    persona(Nombre, Edad, EstCivil),
    EstCivil = soltera,
    Edad >= 18.

% Consulta: encontrar todas las que cumplen
?- esSolteraYMayor(X).
X = ana ;
X = carol ;
false.
```

**Análisis del enfoque Prolog:**

a) **Declaración de relaciones:**
   - Define qué es una "soltera mayor"
   - NO describe pasos

b) **Motor de inferencia:**
   - Automáticamente busca todas las personas que cumplen
   - Usa backtracking

c) **Múltiples consultas posibles:**
   ```prolog
   % Individual
   ?- esSolteraYMayor(ana).        % true
   
   % Existencial
   ?- esSolteraYMayor(X).          % Encuentra todas
   
   % Diferentes direcciones
   ?- persona(X, 25, soltera).     % Encuentra por edad
   ?- persona(ana, Y, Z).          % Encuentra datos de ana
   ```

**4. Diferencias Fundamentales**

| Aspecto | Haskell | Prolog |
|---------|---------|--------|
| **Enfoque** | Transformar datos | Consultar relaciones |
| **Pasos** | Explícitos (filter, map) | Implícitos (motor busca) |
| **Orden** | Programador define orden | Motor decide orden |
| **Resultado** | Valor computado | Todas las soluciones encontradas |
| **Data Structure** | Estructurado (records, lists) | Predicados y cláusulas |
| **Lenguaje** | Imperativo transformado | Declarativo puro |

**5. Cómo Resuelven Diferente**

**Haskell:**
```
Entrada: [Persona]
  ↓ (filter estado civil)
Lista menor: [Persona solteras]
  ↓ (filter edad)
Lista menor: [Persona solteras mayores]
  ↓ (map nombre)
Salida: [String]
```

**Prolog:**
```
Pregunta: "¿Quién es soltera y mayor?"
  ↓ (unificación con persona/3)
Intenta cada persona
  ↓ (verifica condiciones)
Si cumple: agrega a resultados
  ↓ (backtracking)
Sigue buscando
Salida: Todas las soluciones
```

**6. Ventajas de Haskell (Funcional)**

✅ **Control explícito del flujo:**
   - Sé exactamente en qué orden sucede
   - Fácil de depurar

✅ **Eficiencia:**
   - Sin backtracking innecesario
   - Puede optimizar

✅ **Reutilización de predicados:**
   ```haskell
   adultos = filter (\p -> edad p >= 18) personas
   solteros = filter (\p -> estCivil p == "soltero") personas
   solteras_mayores = map nombre (filter (\p -> edad p >= 18) (filter (\p -> estCivil p == "soltera") personas))
   ```

✅ **Tipos explícitos:**
   - Compilador detecta errores temprano

**7. Desventajas de Haskell**

❌ **Repetición:**
   - Si quiero todas las solteras (sin filtro edad), tengo que reescribir

❌ **Orden rígido:**
   - Si cambio la lógica, tengo que reescribir

❌ **Menos flexibilidad para consultas:**
   ```haskell
   % Problema: No puedo preguntar "¿Quién es mayor de 18?" fácilmente
   % Tengo que escribir una función nueva
   
   mayores_18 = filter (\p -> edad p >= 18) personas
   ```

**8. Ventajas de Prolog (Lógico)**

✅ **Inversibilidad:**
   ```prolog
   % Mismo predicado para múltiples preguntas
   ?- persona(X, 25, soltera).     % Quién tiene 25 y es soltero
   ?- persona(ana, Y, Z).          % Cuántos años tiene Ana y su estado
   ?- persona(X, Y, soltera).      % Quiénes son solteros
   ```

✅ **Simplicidad declarativa:**
   - Defino relaciones una sola vez
   - El motor busca automáticamente

✅ **Múltiples soluciones:**
   - Backtracking automático
   - No necesito escribir loops

✅ **BD más flexible:**
   - Puedo agregar más hechos
   - Consultas adaptables

**9. Desventajas de Prolog**

❌ **Menos control del flujo:**
   - Backtracking puede ser lento
   - Difícil predecir eficiencia

❌ **Aritmética limitada:**
   ```prolog
   % No es inversible
   X is 5 + 3.      % OK (X = 8)
   8 is Y + 3.      % ERROR (Y no ligado)
   ```

❌ **Tipado implícito:**
   - Errores menos detectables

❌ **Menos expresivo para transformaciones:**
   - Mejor para consultas, peor para transformar datos

**10. Elección del Paradigma**

**Usar Haskell si:**
- Necesitas transformar datos compleja
- Eficiencia es crítica
- Flujo de datos lineal y predecible
- Ejemplo: Procesar imágenes, análisis de datos

**Usar Prolog si:**
- Necesitas explorar múltiples soluciones
- Los datos son relaciones complejas
- Flexibilidad de consultas es importante
- Ejemplo: Bases de datos, lógica de reglas, IA

**11. Síntesis Comparativa**

```
Haskell: "¿Cómo transformo datos?" → Imperativo funcional
Prolog: "¿Qué datos cumplen esta relación?" → Declarativo puro

Haskell: Datos fluyen → Transformaciones encadenadas
Prolog: Preguntas buscan → Unificación y backtracking

Haskell: Resultado único (lista transformada)
Prolog: Múltiples resultados (todas las soluciones)
```

**12. Conclusión**

Ambos resuelven el problema, pero:
- **Haskell:** Pensamos en transformaciones (pipeline de datos)
- **Prolog:** Pensamos en relaciones (búsqueda de soluciones)

La elección depende de la naturaleza del problema:
- Problema de transformación → Funcional
- Problema de búsqueda/consulta → Lógico

---

## CONJUNTO 2: Preguntas Adicionales de Práctica

### PREGUNTA 6: Pattern Matching (Alternativa)
**Enunciado:** "Explique qué es pattern matching en Haskell. ¿Cómo se relaciona con el principio de sustitución y con la transparencia referencial? Proporcione ejemplos de su uso en funciones recursivas."

### PREGUNTA 7: Aplicación Parcial vs Composición (Alternativa)
**Enunciado:** "Diferencie entre aplicación parcial y composición de funciones. Muestre cómo una función puede beneficiarse de ambas técnicas. Proporcione un ejemplo donde composición es más clara que el pipeline manual."

### PREGUNTA 8: Backtracking en Prolog (Alternativa)
**Enunciado:** "Explique cómo funciona el backtracking en Prolog. ¿Por qué es importante para encontrar múltiples soluciones? Proporcione un ejemplo paso a paso mostrando cómo el motor de inferencia explora diferentes caminos."

### PREGUNTA 9: Lazy Evaluation (Alternativa)
**Enunciado:** "Explique la diferencia entre evaluación lazy y eager. ¿Cuál es el impacto en la eficiencia y expresividad de Haskell? Muestre cómo la evaluación lazy permite trabajar con estructuras infinitas."

### PREGUNTA 10: Tipos y Type Classes (Alternativa)
**Enunciado:** "Explique qué son type classes en Haskell. ¿Cómo difieren de la herencia en OO? Proporcion ejemplos de type classes (Eq, Ord, Num) y cómo las restricciones permiten escribir funciones genéricas."

---

## 📋 ESTRATEGIA DE RESPUESTA POR PREGUNTA

### Estructura General Recomendada

1. **Párrafo introductorio (2 min):** Define el concepto
2. **Explicación teórica (8-10 min):** Desarrolla idea
3. **Ejemplo 1 (8 min):** Caso simple
4. **Ejemplo 2 (7 min):** Caso más complejo
5. **Analogía/Conexión (3 min):** Relaciona con otros conceptos
6. **Conclusión (2 min):** Resume importancia

**Objetivo total:** 1-1.5 páginas por pregunta

### Checklist por Pregunta

- [ ] ¿Comienza con una definición clara?
- [ ] ¿Incluye al menos 2 ejemplos de código?
- [ ] ¿Explica por qué es importante?
- [ ] ¿Relaciona con otros conceptos del curso?
- [ ] ¿Hay conclusión que resume lo dicho?
- [ ] ¿La escritura es clara y concisa?

---

**¡Éxito en tu examen! Recuerda practicar escribiendo respuestas completas, no solo leer.** 📝
