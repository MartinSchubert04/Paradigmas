
{-
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


Ejercicios en Haskell
Queremos saber que velocidad alcanzará la pelota a los 5 segundos si se la deja caer desde una ventana ubicada en el último piso de un edificio.
Queremos saber que distancia recorre la pelota a los 5 segundos si se la deja caer desde una ventana ubicada en el último piso de un edificio.
Queremos saber si la pelota rebota contra el piso  a los 5 segundos si se la deja caer desde una ventana a 80 m de altura.
-}

esMayorDeEdad :: Integer  -> Bool
esMayorDeEdad x = x >= 18

esMenorDeEdad :: Integer  -> Bool
esMenorDeEdad x = not (esMayorDeEdad x)

nombreFormateado :: String -> String -> String
nombreFormateado x y = y ++ ", " ++ x


gravity :: Float
gravity = 9.81

freeFallSpeed :: Float -> Float
freeFallSpeed x = x * gravity 

freeFallDistance :: Float -> Float
freeFallDistance x = 1/2 * x*x * gravity


doesBounce :: Float -> Bool
doesBounce x = freeFallDistance x == 80



main :: IO ()
main = do
  print (esMayorDeEdad 19)
  print (esMayorDeEdad 17)
  
  print (esMenorDeEdad 19)
  print (esMenorDeEdad 17)
  print (nombreFormateado "Martin" "Schubert")
  
  putStrLn ("Velocidad en caida libre en 5 segundos: " ++ show (freeFallSpeed 5) ++ " m/s")
  
  putStrLn ("Distancia recorrida en 5 segundos " ++ show (freeFallDistance 5) ++ " m")
  
  putStrLn ("Rebota la pelota a los 5 seg si se tira a 80m de altura? " ++ show (doesBounce 5))
  
  