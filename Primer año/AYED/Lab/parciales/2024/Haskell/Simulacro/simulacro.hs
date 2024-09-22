type Altura = Int

data Modalidad = Carretera | Pista deriving Show

data Deportista = Velocista Altura | Ciclista Modalidad deriving Show

juan :: Deportista
juan = Velocista 172

-- ghci> juan
-- Velocista 172

esVelocistaAlto :: Deportista -> Int -> Bool
esVelocistaAlto (Velocista alt) n   | n < alt = True
                                    | otherwise = False

-- ghci> esVelocistaAlto juan 160
-- True
-- ghci> esVelocistaAlto juan 172
-- False
-- ghci> esVelocistaAlto juan 180
-- False

esVelocista :: Deportista -> Bool 
esVelocista (Velocista _) = True
esVelocista (_) = False

contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (x : xs)  | esVelocista x = 1 + contar_velocistas xs
                            | otherwise = contar_velocistas xs

-- ghci> deportistas = [juan, Ciclista Carretera, Velocista 150]
-- ghci> contar_velocistas deportistas 
-- 2

esCiclista :: Deportista -> Bool
esCiclista (Ciclista _) = True
esCiclista (_) = False

-- ghci> maria = Ciclista Carretera 
-- ghci> esCiclista juan 
-- False
-- ghci> esCiclista maria 
-- True

data Cola = VaciaC | Encolada Deportista Cola deriving Show

encolar :: Deportista -> Cola -> Cola
encolar dep VaciaC = Encolada dep VaciaC
encolar dep (Encolada dep1 res) = Encolada dep1 (encolar dep res)

-- ghci> maria = Ciclista Carretera 
-- ghci> colaVacia = VaciaC 
-- ghci> colaConJuan = encolar juan colaVacia 
-- ghci> colaConJuan 
-- Encolada (Velocista 172) VaciaC
-- ghci> colaConJuan = Encolada juan VaciaC
-- ghci> colaConMaria = encolar maria colaConJuan
-- ghci> colaConMaria 
-- Encolada (Velocista 172) (Encolada (Ciclista Carretera) VaciaC)
