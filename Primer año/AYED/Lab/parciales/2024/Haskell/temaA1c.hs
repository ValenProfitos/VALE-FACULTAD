data Categoria = Bulbosas | Rosales | Frutales | Trepadoras deriving (Eq, Show)

data Floracion = Primavera | Verano | Invierno deriving (Eq, Show)  

type Hoja = String

type Precio = Int

data TipoSemilla = Flores | Hortalizas | Aromaticas deriving (Eq, Show)

data Material = Plastico | Barro deriving (Eq, Show)

data ProductosVivero =    Planta Categoria Floracion Hoja Precio
                        | Semilla TipoSemilla Hoja Precio
                        | Maceta Material Precio deriving Show


--- funcion auxiliar ---
compara_categorias :: Categoria -> Categoria -> Bool
compara_categorias Bulbosas Bulbosas = True
compara_categorias Rosales Rosales = True
compara_categorias Frutales Frutales = True
compara_categorias Trepadoras Trepadoras = True
compara_categorias _ _ = False

cuantasPlantas :: [ProductosVivero] -> Categoria -> Int
cuantasPlantas [] _ = 0
cuantasPlantas ((Planta cat _ _ _) : ls) c  |compara_categorias cat c = 1 + cuantasPlantas ls c
                                            | otherwise = cuantasPlantas ls c

cuantasPlantas (_ : ls) c = cuantasPlantas ls c

-- ghci> plant1 = Planta Frutales Primavera "Verde" 120
-- ghci> plant2 = Planta Frutales Primavera "Verde" 200
-- ghci> plant3 = Planta Trepadoras Primavera "Verde" 200
-- ghci> semilla = Semilla Hortalizas "Verdes" 120
-- ghci> cuantasPlantas [plant1, plant2, plant3, semilla] Trepadoras 
-- 1
-- ghci> cuantasPlantas [plant1, plant2, plant3, semilla] Frutales 
-- 2


instance Eq ProductosVivero 
    where
        (Planta cat1 _ hoja1 _) == (Planta cat2 _ hoja2 _) = cat1 == cat2 && hoja1 == hoja2

        (Semilla ts1 hoja1 precio1) == (Semilla ts2 hoja2 precio2) = ts1 == ts2 && hoja1 == hoja2 && precio1 == precio2

        (Maceta mat1 precio1) == (Maceta mat2 precio2) = mat1 == mat2 && precio1 == precio2

-- ghci> plant1 = Planta Frutales Primavera "Verde" 120
-- ghci> plant2 = Planta Frutales Verano "Azul" 200
-- ghci> plant3 = Planta Bulbosas Verano "Verde" 200
-- ghci> plant4 = Planta Frutales Verano "Verde" 200
-- ghci> semilla = Semilla Hortalizas "Verdes" 120
-- ghci> semilla1 = Semilla Hortalizas "Verdes" 120
-- ghci> semilla2 = Semilla Hortalizas "Verdes" 12
-- ghci> semilla3 = Semilla Hortalizas "Azul" 120
-- ghci> semilla4 = Semilla Aromaticas  "Verdes" 120
-- ghci> maceta1 = Maceta Plastico 230
-- ghci> maceta2 = Maceta Plastico 230
-- ghci> maceta3 = Maceta Plastico 210
-- ghci> maceta4 = Maceta Barro 230
-- ghci> plant1 == plant4
-- True
-- ghci> plant1 == plant2
-- False
-- ghci> plant1 == plant3
-- False
-- ghci> semilla == semilla1
-- True
-- ghci> semilla == semilla2
-- False
-- ghci> semilla == semilla3
-- False
-- ghci> semilla == semilla4
-- False
-- ghci> maceta1 == maceta2
-- True
-- ghci> maceta1 == maceta3
-- False
-- ghci> maceta1 == maceta4
-- False

hayDosIguales :: [ProductosVivero] -> Bool
hayDosIguales [] = False
hayDosIguales [_] = False
hayDosIguales (x:y:ls)  | x == y = True
                        | otherwise = hayDosIguales (y:ls)

-- ghci> hayDosIguales [plant1, plant4, plant3, plant2]
-- True
-- ghci> hayDosIguales [plant1, plant3, plant3, plant2]
-- True
-- ghci> hayDosIguales [plant1, plant3, plant2, plant2]
-- True

type Titulo = String
type Megusta = Int

data Estado = Reproducido | SinReproducir

type Duracion = Int

data MovieList = SinMovie | Movie Titulo Megusta Estado Duracion Movi