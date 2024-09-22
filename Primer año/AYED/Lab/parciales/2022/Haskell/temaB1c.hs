data Palo = Espada | Basto | Oro | Copa deriving Show

mismo_palo :: Palo -> Palo -> Bool
mismo_palo Espada Espada = True
mismo_palo Basto Basto = True
mismo_palo Oro Oro = True
mismo_palo Copa Copa = True
mismo_palo _ _ = False

data Figura = Uno | Dos | Tres | Cuatro | Cinco | Seis | Siete | Sota | Caballo | Rey deriving Show

valor_figura :: Figura -> Int
valor_figura Uno = 1
valor_figura Dos = 2
valor_figura Tres = 3
valor_figura Cuatro = 4
valor_figura Cinco = 5
valor_figura Seis = 6
valor_figura Siete = 7
valor_figura Sota = 8
valor_figura Caballo = 9
valor_figura Rey = 10

data Carta = Naipe Figura Palo deriving Show

suma_cartas :: Carta -> Carta -> Maybe Int
suma_cartas (Naipe f1 p1) (Naipe f2 p2) | mismo_palo p1 p2 = Just (valor_figura f1 + valor_figura f2 )
                                        | otherwise = Nothing

-- ghci> carta1 = Naipe Rey Basto
-- ghci> carta2 = Naipe Seis Basto
-- ghci> carta3 = Naipe Sota Oro
-- ghci> suma_cartas carta1 carta2
-- Just 16
-- ghci> suma_cartas carta1 carta3
-- Nothing
-- ghci> suma_cartas carta2 carta3
-- Nothing

compatibles :: Carta -> [Carta] -> [Figura]
compatibles (Naipe f1 p1) [] = []
compatibles (Naipe f1 p1) ((Naipe f2 p2) : cs)  | mismo_palo p1 p2 && (valor_figura f1 + valor_figura f2 <= 15) = f2 : compatibles (Naipe f1 p1) cs
                                                | otherwise = compatibles (Naipe f1 p1) cs

type Duracion = Int
type Nombre =  String

data Cancion = Tema Nombre Duracion

data Estado = Escuchado | NoEscuchado

data Playlist = Vacia | EnLista Cancion Estado Playlist

tiempo_reproduccion :: Playlist -> Int
tiempo_reproduccion Vacia = 0
tiempo_reproduccion (EnLista (Tema _ duracion) Escuchado p) = duracion + tiempo_reproduccion p
tiempo_reproduccion (EnLista _ NoEscuchado p) = tiempo_reproduccion p

-- ghci> playlist = EnLista (Tema "Amor" 5) Escuchado (EnLista (Tema "Love" 2) NoEscuchado (EnLista (Tema "Azucar" 5) Escuchado Vacia))
-- ghci> tiempo_reproduccion playlist 
-- 10
