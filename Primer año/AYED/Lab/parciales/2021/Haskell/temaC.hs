data Deporte = Futbol | Basket | Tenis | Valorant | Dota2

type MinJugadores = Int

minimaCantidad :: Deporte -> MinJugadores
minimaCantidad Futbol = 22
minimaCantidad Basket = 10
minimaCantidad Tenis = 2
minimaCantidad Valorant = 10
minimaCantidad Dota2 = 4

-- ghci> minimaCantidad Futbol 
-- 22
-- ghci> minimaCantidad Basket 
-- 10
-- ghci> minimaCantidad Tenis 
-- 2
-- ghci> minimaCantidad Valorant 
-- 10
-- ghci> minimaCantidad Dota2 
-- 4

type NombrePersona = String

data PracticoDeporte = Ninguna | AgregaDeporte Deporte NombrePersona PracticoDeporte

deporte :: PracticoDeporte -> Deporte -> NombrePersona -> Bool
deporte Ninguna = False
deporte 