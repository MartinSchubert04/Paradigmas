{-
─── Ejercicios en Haskell ─────────

- Elmayordelostres :: Ord a => a -> a -> a -> a
- Xor :: Bool -> Bool -> Bool
- Fibonacci :: Int -> Int
- Inferencia
    esMuchoMayor :: ???
    esMuchoMayor  n m = n – m > 10
    funcionRara  :: ???
    funcionRara  n m = esMuchoMayor  n  (not m)
    f  x  y  =  g ( h y ( i x y ) x ) y
        f  False “ ” = True
    funcionRara1  f  =  f  2 True
    funcionRara2  g = g.length
-}

elMayorDeLosTres :: Ord a => a -> a -> a -> a
elMayorDeLosTres x y z = max x (max y z)

xor :: Bool -> Bool -> Bool
xor a b 
 | a && b = False
 | a || b = True
 | otherwise = False

{- ─── Otras formas de hacer un xor ───

xor True False = True
xor False False = True
xor _ _ = False

xor a b = a /= b

xor a b = (a || b) && not (a && b)
-}

esMuchoMayor :: Int -> Int -> Bool
esMuchoMayor n m = n - m > 10

funcionRara  :: Int -> Int -> Bool
funcionRara n m = esMuchoMayor n (negate  m) -- no tiene sentido usar not como en la consigna


-- f  x  y  =  g ( h y ( i x y ) x ) y
-- f False " " = True


-- f toma dos valores un numerico (float, int, etc) y un true y devuelve un tipo b desconocido
f :: Num a => a -> Bool -> b
{- por ende funcionRara1 seria
ya que toma una funcion f que f toma un Num y un Bool 
Input = Num a => (a -> Bool -> b)

y va a retornar lo que f retorne
Output = b

funcionRara1 es un wrapper de f que esta aplicando 2 y True a f
-}
funcionRara1 :: Num a => (a -> Bool -> b) -> b 
funcionRara1  f  =  f  2 True


{-
funcionRara2 toma una funcion g y aplica 

-}

funcionRara2  g = g.length

-- Abstracion, type classes y pattern matching
type Edad = Int
type Nombre = String
edad :: Nombre -> Edad
edad "Martin" = 21
edad _ = 0 -- cualquier otro matchea con 0


main :: IO ()
main = do

    print (elMayorDeLosTres 3 10 1)
    print (xor False True)
    putStrLn ("Es mucho mayor, debe ser true: " ++ show (esMuchoMayor 21 10))
    putStrLn ("Es mucho mayor, debe ser false: " ++ show (esMuchoMayor 19 10))
    
    putStrLn ("Funcion rara, debe ser true: " ++ show (funcionRara 19 10))
    putStrLn ("Funcion rara, debe ser false: " ++ show (funcionRara 5 1))

    putStrLn ("Edad de Martin: " ++ show (edad "Martin"))