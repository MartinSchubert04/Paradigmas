# Simulacro 1 — Respuestas Modelo (versión corregida)

Respuestas completas y correctas a las 6 preguntas del Simulacro 1, escritas como se esperaría en el final real (no solo los puntos clave). Pensadas para comparar contra tu intento en `Simulacros_Mis_Respuestas.md` y contra la corrección ya hecha.

---

### 1. Características del paradigma funcional, TypeClasses vs. cálculo lambda, y origen matemático de Haskell

**Características principales del paradigma funcional:**
- No existe asignación destructiva ni estado mutable: no se puede "reescribir" una variable, solo definirla.
- Las funciones son puras: dado el mismo input, siempre devuelven el mismo output (**transparencia referencial**).
- No hay efectos secundarios (no se modifica nada fuera del ámbito de la función).
- Tipado fuerte con **inferencia de tipos** (no siempre hace falta anotar el tipo a mano).
- No hay estructuras de control imperativas (`for`, `while`); se reemplazan por **recursividad**.
- Las funciones son ciudadanos de primera clase: se pueden pasar como parámetro o devolver como resultado (**orden superior**).
- En Haskell específicamente, **evaluación lazy** por defecto.

**Qué agrega TypeClasses sobre el cálculo lambda original:**
El cálculo lambda puro (y su versión tipada, base de Hindley-Milner) no tiene noción de sobrecarga: cada función tiene un único tipo fijo, sin distinción de comportamiento según el tipo concreto del argumento. Las **TypeClasses** agregan **polimorfismo ad-hoc**: permiten definir una misma función/operador (`==`, `+`, `show`) con implementaciones distintas según el tipo, siempre que ese tipo sea declarado instancia de la clase — y el compilador verifica en tiempo de compilación que esa instancia exista, a diferencia de la sobrecarga no controlada de otros lenguajes.

**Origen:** Haskell deriva del **Cálculo Lambda** de Alonzo Church (con su extensión tipada, sobre la que se apoya el sistema de inferencia de tipos Hindley-Milner).

---

### 2. Diferencias entre Haskell y Prolog (5 o más)

1. **Paradigma:** Haskell es funcional (transforma datos mediante funciones puras); Prolog es lógico (consulta relaciones mediante unificación y backtracking).
2. **Programa = qué:** en Haskell un programa es un conjunto de funciones; en Prolog es una base de conocimiento de hechos y reglas.
3. **Resultado de ejecutar:** una función de Haskell devuelve siempre un único valor determinístico; una consulta Prolog puede devolver cero, una o múltiples soluciones (vía backtracking).
4. **Tipado:** Haskell tiene tipado estático fuerte con inferencia; Prolog no tiene declaración de tipos (aunque existen predicados como `atom/1`, `number/1` para inspeccionar en tiempo de ejecución).
5. **Evaluación:** Haskell es lazy por defecto (no evalúa hasta que hace falta); Prolog resuelve metas de forma secuencial guiada por unificación, y entrega soluciones bajo demanda vía backtracking (parecido en espíritu, pero es otro mecanismo).
6. **Mutabilidad de la base de datos:** en Haskell no existe forma de modificar "el programa" en tiempo de ejecución; en Prolog, `assert`/`retract` permiten modificar la base de conocimiento mientras el programa corre.

---

### 3. Relación entre TypeClasses (Haskell) y Clases/predicados monádicos (Prolog)

**Relación:** una TypeClass agrupa **tipos** que comparten un comportamiento común: pertenecer a la clase significa "implementar cierto conjunto de funciones" (un contrato). Un predicado monádico (aridad 1) en Prolog cumple un rol análogo pero sobre **individuos**: agrupa/clasifica valores que cumplen una propiedad — pertenecer a esa "clase" significa "satisfacer el hecho o la regla que la define". En ambos casos el mecanismo es el mismo en espíritu: una forma de decir "estos elementos comparten algo" sin necesidad de herencia ni jerarquía de tipos rígida.

**3 TypeClasses y 2 tipos que las usan cada una:**
| TypeClass | Usada por |
|---|---|
| `Eq` (igualdad) | `Int`, `Bool` |
| `Ord` (orden) | `Int`, `Char` |
| `Num` (aritmética) | `Int`, `Double` |

---

### 4. Diferencia entre el operador "=" y la Unificación en Prolog

`=` es el operador que **invoca explícitamente** el mecanismo de unificación dentro del código: al escribir `X = termino`, Prolog intenta que ambos lados sean estructuralmente idénticos, ligando las variables libres necesarias para lograrlo. **No es asignación destructiva**: si `X` ya está ligada a un valor distinto, `X = nuevo_valor` no lo sobrescribe — directamente **falla**.

La **Unificación** es el mecanismo general subyacente, más amplio que el operador `=`: ocurre también de forma **implícita**, sin que se escriba `=` en ningún lado, cada vez que Prolog intenta hacer matching entre una consulta y la cabeza de una cláusula, o entre los argumentos pasados a un predicado y sus parámetros formales.

En una frase: `=` es la forma sintáctica explícita de pedir una unificación puntual; la Unificación es el mecanismo que corre todo el tiempo por debajo, se escriba `=` o no.

---

### 5. Orden Superior, y su relación con MAP y ELEM

**Orden Superior:** una función es de orden superior cuando **recibe** una o más funciones como argumento, y/o **devuelve** una función como resultado.

- **`map :: (a -> b) -> [a] -> [b]`** — SÍ es de orden superior: recibe una función como primer argumento y la aplica a cada elemento de la lista, devolviendo una lista nueva con los resultados.
- **`elem :: Eq a => a -> [a] -> Bool`** — NO es de orden superior: no recibe ninguna función como argumento, solo un valor y una lista, y devuelve si ese valor pertenece a la lista (comparando con `==`).

**Relación entre ambas:** aunque `elem` no es en sí de orden superior, sí puede **definirse** usando una función de orden superior, por ejemplo:
```haskell
elem' x xs = any (== x) xs
-- o equivalentemente
elem' x xs = foldr (\y acc -> x == y || acc) False xs
```
Esto muestra el patrón típico del paradigma: funciones "simples" como `elem` terminan expresándose en términos de funciones de orden superior más generales (`any`, `foldr`), que son las que realmente encapsulan el mecanismo de recorrido.

---

### 6. Pattern Matching en Prolog y su relación con las variables libres

**Qué es Pattern Matching:** mecanismo que compara la **estructura** de dos términos (o de un término contra un patrón) para ver si coinciden. Si tienen la misma forma (mismo functor y misma aridad), se comparan recursivamente sus componentes; las variables presentes se ligan al valor correspondiente del otro lado para que la coincidencia sea posible.

**¿Se usa en Prolog? Sí.** Cada vez que se lanza una consulta, el motor de inferencia intenta hacer matching (implementado mediante unificación) entre la consulta y la cabeza de cada cláusula de la base de conocimiento, probando en orden, de arriba hacia abajo.

**Relación con las variables libres:** cuando el patrón o la consulta contiene una variable libre (no instanciada), el matching la **liga (bind)** al valor necesario del otro término para lograr la coincidencia. Es exactamente ese mecanismo el que permite resolver **consultas existenciales**: Prolog encuentra qué valores, ligados a esas variables libres, hacen que la relación se cumpla.

**Aclaración importante (no confundir):** Pattern Matching y Backtracking son conceptos relacionados pero distintos. El matching decide si dos términos coinciden **ahora**; el backtracking es el mecanismo que, cuando un matching (o un objetivo posterior en el cuerpo de una regla) **falla**, deshace las ligaduras hechas y prueba la siguiente cláusula o el siguiente hecho disponible.
