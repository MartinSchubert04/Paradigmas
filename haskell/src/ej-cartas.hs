{-
Teniendo un juego de cartas con superhéroes y para cada superhéroe se tiene información de sus poderes.

Se pide extender las cartas para incluir tags y definir funciones para cambiarlos

Dado un mazo de cartas:
Obtener los nombres de las cartas que comienzan con “bat”
Averiguar si hay cartas con los tags demasiado largos.
Corregir las cartas a las que pusieron tag #alguien en lugar de #alien
-}

data Carta = Carta {
    nombre :: String,
    velocidad :: Int,
    alutra :: Int,
    peso :: Int,
    fuerza :: Int,
    peleas :: Int,
    tags :: [String]
} deriving (Eq, Show)

cartas :: [Carta]
cartas = [ Carta "Superman" 9 8 8 10 132 ["#alien"],
           Carta "Batman"   7 7 8 8  210 ["#humano", "#alguien"],
           Carta "Flash" 10 9 7 9 31 ["#alguien"]]

removeTag :: String -> Carta -> Carta
removeTag tag carta = carta { tags = filter (\t -> tag /= t) (tags carta)}

addTag :: String -> Carta -> Carta
addTag tag carta = carta { tags = tag : tags carta }


cartasQueEmpiezanConBat :: [Carta] -> [Carta]
cartasQueEmpiezanConBat = filter (\c ->  take 3 (nombre c) == "bat") 

cartasConTagsLargos :: [Carta] -> Int -> [Carta]
cartasConTagsLargos cartas limite = filter(any (\t -> length t > limite) . tags) cartas

corregirCartasConTagAlguien :: [Carta] -> [Carta]
corregirCartasConTagAlguien = map(removeTag "#alguien" . addTag "#alien") . filter (elem "#alguien" . tags)

main :: IO()
main = do
    putStrLn("Cartas que arrancan con 'bat': " ++ show(cartasQueEmpiezanConBat cartas))
    putStrLn ""
    putStrLn("Cartas con tags largos: " ++ show(cartasConTagsLargos cartas 5))
    putStrLn ""
    putStrLn("Corregir cartas con tag #alguien: " ++ show(corregirCartasConTagAlguien cartas))
    putStrLn ""
    putStrLn("Cartas output: " ++ show cartas) -- haskell no modifica una referencia, siempre genera una copia del los objetos o data types
    


