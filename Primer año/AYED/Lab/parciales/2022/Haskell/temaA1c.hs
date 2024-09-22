data Forma = Piedra | Papel | Tijera deriving Show

le_gana :: Forma -> Forma -> Bool
le_gana Piedra Tijera = True
le_gana Tijera Papel = True
le_gana Papel Piedra = True
le_gana _ _ = False

-- ghci> le_gana Tijera Tijera 
-- False
-- ghci> le_gana Tijera Papel 
-- True
-- ghci> le_gana Tijera Piedra 
-- False
-- ghci> le_gana Piedra Piedra 
-- False
-- ghci> le_gana Piedra Papel 
-- False
-- ghci> le_gana Piedra Tijera 
-- True
-- ghci> le_gana Papel Papel 
-- False
-- ghci> le_gana Papel Tijera 
-- False
-- ghci> le_gana Papel Piedra 
-- True

type Nombre = String

data Jugador = Mano Nombre Forma deriving Show

ganador :: Jugador -> Jugador -> Maybe Nombre
ganador (Mano n1 f1) (Mano n2 f2)   | le_gana f1 f2 = Just n1
                                    | le_gana f2 f1 = Just n2
                                    | otherwise = Nothing

-- ghci> jugador1 = Mano "Vale" Piedra
-- ghci> jugador2 = Mano "Lauti" Tijera
-- ghci> jugador3 = Mano "Vicky" Papel
-- ghci> ganador jugador1 jugador2
-- Just "Vale"
-- ghci> ganador jugador1 jugador3
-- Just "Vicky"
-- ghci> ganador jugador2 jugador3
-- Just "Lauti"
-- ghci> ganador jugador3 jugador3
-- Nothing
-- ghci> ganador jugador1 jugador1
-- Nothing
-- ghci> ganador jugador2 jugador2
-- Nothing

quien_jugo :: Forma -> [Jugador] -> [Nombre]
quien_jugo _ [] = []
quien_jugo Piedra (Mano n Piedra : js) =  n : quien_jugo Piedra js 
quien_jugo Papel (Mano n Papel : js) =  n : quien_jugo Papel js 
quien_jugo Tijera (Mano n Tijera : js) =  n : quien_jugo Tijera js 
quien_jugo z (_ : js) = quien_jugo z js

-- ghci> jugador1 = Mano "Vale" Piedra
-- ghci> jugador2 = Mano "Lauti" Tijera
-- ghci> jugador3 = Mano "Vicky" Papel
-- ghci> jugadores = [jugador1, jugador2, jugador3]
-- ghci> quien_jugo Piedra jugadores 
-- ["Vale"]
-- ghci> quien_jugo Papel jugadores 
-- ["Vicky"]
-- ghci> quien_jugo Tijera jugadores 
-- ["Lauti"]

data NotaMusical = Do | Re | Mi | Fa | Sol | La | Si

data Figura = Negra | Corchea

data Melodia = Vacia | Entonar NotaMusical Figura Melodia

contar_tiempos ::  Melodia -> Int
contar_tiempos Vacia = 0
contar_tiempos (Entonar _ Negra melodia) = 2 + contar_tiempos melodia
contar_tiempos (Entonar _ Corchea melodia) = 1 + contar_tiempos melodia

-- ghci> pink = Entonar Re Negra (Entonar Mi Corchea (Entonar Fa Negra (Entonar Mi Negra Vacia)))
-- ghci> contar_tiempos pink 
-- 7
