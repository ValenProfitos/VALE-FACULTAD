data EmpresaTelefono = Claro | Movistar | Personal | Tuenti deriving (Eq, Show)

type Frase = String

fraseEmpresa :: EmpresaTelefono -> Frase
fraseEmpresa Claro = "Claro. La red mas poderosa"
fraseEmpresa Movistar = "Movistar. Compartida la vida es mas..."
fraseEmpresa Personal = "Personal, es como vos"
fraseEmpresa Tuenti = "Tuenti es la mas economica"

-- ghci> fraseEmpresa Claro
-- "Claro. La red mas poderosa"
-- ghci> fraseEmpresa Movistar 
-- "Movistar. Compartida la vida es mas..."
-- ghci> fraseEmpresa Personal 
-- "Personal, es como vos"
-- ghci> fraseEmpresa Tuenti 
-- "Tuenti es la mas economica"

type NombrePersona = String

data MisEmpresas = Ninguna | AgregaEmpresa EmpresaTelefono NombrePersona MisEmpresas deriving Show

tengoEmpresa :: MisEmpresas -> EmpresaTelefono -> NombrePersona -> Bool
tengoEmpresa Ninguna _ _ = False
tengoEmpresa (AgregaEmpresa e n r) empresab nombreb = (e == empresab && n == nombreb) || tengoEmpresa r empresab nombreb

-- ghci> empresitas = AgregaEmpresa Personal "Lautaro Ruiz Carpintero" (AgregaEmpresa Claro "Valentina M Profitos" Ninguna)
-- ghci> tengoEmpresa empresitas Personal "Valentina M Profitos"
-- False
-- ghci> tengoEmpresa empresitas Claro  "Valentina M Profitos"
-- True
-- ghci> tengoEmpresa empresitas Movistar "Lautaro Ruiz Carpintero"
-- False

type NroTel = Int

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

agregaLA :: ListaAsoc EmpresaTelefono NroTel -> EmpresaTelefono -> NroTel -> ListaAsoc EmpresaTelefono NroTel
agregaLA Vacia emp tel = Nodo emp tel Vacia
agregaLA (Nodo emp tel res) empresa nro
    | emp == empresa = Nodo emp nro res
    | otherwise = Nodo emp tel (agregaLA res empresa nro)

-- ghci> listaEjemplo = Nodo Claro 123456789 (Nodo Movistar 987654321 Vacia)
-- ghci> nuevaLista = agregaLa listaEjemplo Tuenti 1357924680
-- ghci> nuevaLista = agregaLA listaEjemplo Tuenti 1357924680
-- ghci> nuevaLista
-- Nodo Claro 123456789 (Nodo Movistar 987654321 (Nodo Tuenti 1357924680 Vacia))
