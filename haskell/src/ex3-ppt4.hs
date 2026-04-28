data Estudiante = UnEstudiante {
    nombre :: String,
    legajo :: String,
    nota :: Int
} deriving (Eq, Show)

juan :: Estudiante
juan = UnEstudiante { legajo = "123", nombre = "juan", nota = 1}

juana :: Estudiante
juana = UnEstudiante { legajo = "123", nombre = "juan", nota = 2}

persona = [juan, juana]


main :: IO()
main = do

    putStrLn ( "Output: " ++ show (juan == juana))