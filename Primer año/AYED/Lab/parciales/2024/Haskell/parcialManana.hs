type Nombre = String
type Director = String
type Duracion = Int
type Estreno = Int 
type NroCapitulo = Int
type Temporada = Int

data Video = Pelicula Nombre Director Duracion Estreno | CapSerie Nombre NroCapitulo Temporada Estreno

