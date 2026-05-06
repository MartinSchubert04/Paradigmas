{-
Resolver un problema para una librería
¿Es cierto que alguien escribió una determinada obra?
¿Quién o quienes escribieron una obra?
¿Qué obra escribió cierta persona?
Si es cierto que cierta persona escribió alguna obra, sin importar cual.
Si es cierto que cierta obra existe.

-}

import Data.List (find)                                                                                                                  

type Titulo = String
type Autor = String
data Obra = Obra { titulo:: Titulo, autores:: [Autor]} deriving (Show)

-- data base

obras :: [Obra]
obras = [ Obra "WheelOfTime"  ["RobertJordan", "BrandonSanderson"],
          Obra "ASongOfIceAndFire" ["GeorgeRRMartin"] ]

hallarObraPorTitulo :: Titulo -> [Obra] -> Maybe Obra
hallarObraPorTitulo tituloObra = find (\obra -> titulo obra == tituloObra) 

alguienEscribioLaObra :: Titulo -> [Obra] -> Bool
alguienEscribioLaObra tituloObra obras = 
    maybe False (not . null . autores)  (hallarObraPorTitulo tituloObra obras)  



quienesEscribieronEstaObra :: Obra -> [Autor]
quienesEscribieronEstaObra = autores 

quienesEscribieronUnaObra :: Titulo -> [Obra] -> [Autor]
quienesEscribieronUnaObra myTitulo todasObras = quienesEscribieronEstaObra (head (filter (\ob -> titulo ob ==  myTitulo ) todasObras))


queObraEscribioEstaPersona :: Autor -> [Obra] -> Obra
queObraEscribioEstaPersona autor obras = head (filter (elem autor . autores) obras)

estaPersonaEscribioUnaObra :: Autor -> [Obra] -> Bool
estaPersonaEscribioUnaObra autor = any (elem autor . autores )

existeEstaObra :: Titulo -> [Obra] -> Bool
existeEstaObra tituloObra = any (\ob -> tituloObra == titulo ob)

main :: IO()
main = do
  putStrLn ("Alguien escribio cierta obra" ++ show(alguienEscribioLaObra "ASongOfIceAndFire" obras))
  putStrLn ("Quienes escribieron cierta obra" ++ show(quienesEscribieronUnaObra "WheelOfTime" obras))
  putStrLn ("Que obra escribio cierta persona" ++ show(queObraEscribioEstaPersona "RobertJordan" obras))
  putStrLn ("Cierta persona escribio una obra" ++ show(estaPersonaEscribioUnaObra "RobertJordan" obras))
  putStrLn ("Existe cierta obra" ++ show (existeEstaObra "WheelOfTimea" obras))


