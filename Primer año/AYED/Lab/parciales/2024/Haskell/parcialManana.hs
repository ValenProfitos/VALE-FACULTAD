type Nombre = String
type Director = String
type Duracion = Int
type Estreno = Int 
type NroCapitulo = Int
type Temporada = Int

data Video = Pelicula Nombre Director Duracion Estreno | CapSerie Nombre NroCapitulo Temporada Estreno deriving Show

elPadrino :: Video
elPadrino = Pelicula "El Padrino" "Francis Ford Coppola" 177 1972

breakingBadS01E01 :: Video
breakingBadS01E01 = CapSerie "Breaking Bad" 1 1 2008

esPrimerCapitulo :: Video -> Bool
esPrimerCapitulo (Pelicula _ _ _ _ ) = False
esPrimerCapitulo (CapSerie _ nroCap _ _)    | nroCap == 1 = True
                                            | otherwise = False

esEstreno :: Video -> Bool
esEstreno (CapSerie _ _ _ _) = False
esEstreno (Pelicula _ _ _ estreno)  | estreno == 2024 = True
                                    | otherwise = False

deadPool3 :: Video
deadPool3 = Pelicula "DeadPool3" "Marvel" 190 2024

duracionPeliMasLarga :: [Video] -> Int 
duracionPeliMasLarga [] = 0
duracionPeliMasLarga ((Pelicula _ _ duracion _):ls) = max duracion (duracionPeliMasLarga ls)
duracionPeliMasLarga (_:ls) = duracionPeliMasLarga ls

data ColaVideo =   Vacia
            | Encolada Video ColaVideo deriving Show

colaReproduccion :: ColaVideo
colaReproduccion = Encolada elPadrino (Encolada breakingBadS01E01 Vacia)

pelisDelDirector :: ColaVideo -> String -> ColaVideo
pelisDelDirector Vacia _ = Vacia
pelisDelDirector (Encolada (Pelicula titulo dir año duracion) q) ndir
    | dir == ndir = Encolada (Pelicula titulo dir año duracion) (pelisDelDirector q ndir)
    | otherwise   = pelisDelDirector q ndir
pelisDelDirector (Encolada (_) q) ndir = pelisDelDirector q ndir