type Letras = (Char, Char, Char)

type Numeracion = Int

data Matricula = Patente Letras Numeracion deriving (Eq, Ord)

letra_valida :: Char -> Bool
letra_valida c = 'A' <= c && c <= 'Z'

-- ghci> letra_valida '3'
-- False
-- ghci> letra_valida '@'
-- False
-- ghci> letra_valida 'A'
-- True
-- ghci> letra_valida 'a'
-- False
-- ghci> letra_valida 'Z'
-- True
-- ghci> letra_valida 'z'
-- False
-- ghci> letra_valida 'B'
-- True
-- ghci> letra_valida 'R'
-- True

letras_validas :: Letras -> Bool
letras_validas (l1,l2,l3) = letra_valida l1 && letra_valida l2 && letra_valida l3

matricula_validada :: Matricula -> Bool
matricula_validada (Patente letrs num) = letras_validas letrs && 0 <= num && num <= 999

-- ghci> matricula_validada (Patente ('A','A','A') 123)
-- True
-- ghci> matricula_validada (Patente ('A','A','A') 0)
-- True
-- ghci> matricula_validada (Patente ('A','A','A') 1000)
-- False
-- ghci> matricula_validada (Patente ('A','A','g') 999)
-- False

filtrar_patentes :: [Matricula] -> Numeracion -> [Matricula]
filtrar_patentes [] _ = []
filtrar_patentes ((Patente letras num) : ps) n   | num == n = (Patente letras num) : filtrar_patentes ps n
                                            | otherwise = filtrar_patentes ps n

type Titular = String

data Estado = SinDeuda | ConDeuda

data Registro = SinRegs | AgregaReg Matricula Estado Titular Registro

mismo_estado :: Estado -> Estado -> Bool
mismo_estado SinDeuda SinDeuda = True
mismo_estado ConDeuda ConDeuda = True
mismo_estado _ _ = False

consulta :: Registro -> Titular -> Estado -> [Matricula]
consulta SinRegs _ _ = []
consulta (AgregaReg matricula estado titular resto) ti ei   | titular == ti && mismo_estado estado ei = matricula : consulta resto ti ei
                                                            | otherwise = consulta resto ti ei