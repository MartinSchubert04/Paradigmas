data Calificacion = Aprobado | Desaprobado | Promocionado deriving (Show, Eq)

califica :: Int -> Calificacion
califica n 
    | n <= 3 = Desaprobado
    | n >= 7 = Promocionado
    | otherwise = Aprobado


esCritica :: Int -> Bool
esCritica = (<= 3)

felicitarSi :: (Int -> Bool) -> Int -> String
felicitarSi condicion n
    | condicion  n = "Sigue intentando"
    | otherwise = "Felicitaciones"


data Producto = Producto {
    nombreP   :: String,
    precio    :: Double,
    categoria :: String,
    stock     :: Int
} deriving (Show, Eq)

productos :: [Producto]
productos = [ Producto "Manzana" 1.5 "Fruta"  100,
              Producto "Leche"   2.0 "Lacteo"  50,
              Producto "Banana"  0.8 "Fruta"    0,
              Producto "Queso"   5.0 "Lacteo"  30 ]

productosDisplonibles :: [Producto] -> [Producto]
productosDisplonibles  = filter (\p -> stock p > 0) 

productosDeLaCategoria :: String -> [Producto] -> [Producto]
productosDeLaCategoria cat  = filter (\p -> categoria p == cat) 

aplicarDescuento :: Double -> Producto -> Producto
aplicarDescuento desc prod = prod { precio = precio prod * (1 - desc) }

hayProductosCostosos :: Double -> [Producto] -> Bool
hayProductosCostosos limite = any (\p -> precio p > limite)

nombresDisponibles :: [Producto] -> [String]
nombresDisponibles = map nombreP . filter ((> 0) . stock)


data Superheroe = Superheroe {
    alias  :: String,
    poder  :: Int,
    equipo :: String,
    activo :: Bool
} deriving (Show)

heroes :: [Superheroe]
heroes = [ Superheroe "Iron Man" 95 "Avengers" True,
           Superheroe "Batman"   80 "JL"        True,
           Superheroe "Thor"     92 "Avengers" False,
           Superheroe "Flash"    88 "JL"        True ]

heroesActivos :: [Superheroe] -> [Superheroe]
heroesActivos = filter activo

poderPromedio :: [Superheroe] -> Double
poderPromedio heroes = fromIntegral(sum (map poder heroes)) / fromIntegral(length heroes)

equipoMasFuerte :: String -> [Superheroe] -> Double
equipoMasFuerte team = poderPromedio . filter (\h -> equipo h == team)

subirPoder :: Int -> Superheroe -> Superheroe
subirPoder pow s =  s { poder = poder s + pow }

potenciarEquipo :: String -> Int -> [Superheroe] -> [Superheroe]
potenciarEquipo team pow heroes = map (subirPoder pow) . filter (\h -> equipo h == team) $ heroes

hallarEquipo :: String -> [Superheroe] -> [Superheroe]
hallarEquipo team = filter (\h -> equipo h == team)

todosActivosDelEquipo :: String -> [Superheroe] -> Bool
todosActivosDelEquipo team = all activo . filter (\h -> equipo h == team)
-- todosActivosDelEquipo team heroes = length(filter activo  (hallarEquipo team heroes)) == length(hallarEquipo team heroes)



miSuma :: [Int] -> Int
miSuma [] = 0
miSuma (x:xs) = x + miSuma xs

