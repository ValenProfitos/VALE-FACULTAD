------ EJERCICIO 1 ------
-- Tipos enumerados. Cuando los distintos valores que debemos distinguir en un tipo son finitos, podemos ~enumerar~ cada uno de los valores del tipo. Por ejemplo, podriamos representar las carreras que se dictan en nuestra facultad definiendo el siguiente tipo:
-- data Carrera = Matematica | Fisica  | Computacion | Astronomia
-- Cada uno de estos valores es un contructor, ya que al utilizarlos en una expresión, generan un valor del tipo carrera

--- A ---
-- Implementá el tipo Carrera como está definido arriba

data Carrera = Matematica | Fisica | Computacion | Astronomia

--- B ---
-- Definí la siguiente función, usando pattern marching: titulo :: Carrera -> String, que devuelve el nombre completo de la carrera en forma de string

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Ciencias de la Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

-- Ejemplos:
-- ghci > titulo Matematica
-- "Licenciatura en Matematica"
-- ghci > titulo Computacion
-- "Licenciatura en Ciencias de la Computacion"

--- C ---
-- Para escribir música se utiliza la denominada notación musical, la cual consta de notas (do, re, mi, ...). Además, estas notas pueden presentar algún modificador #(sostenido) o b (bemol). Definir el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La y Si

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq, Ord, Bounded, Show)

--- D ---
-- El sistema de notación musical anglosajón, tambien conocido como notación o cifrado americano, relaciona las notas básicas con letras de la A a la G. Programar usando pattern matching la función: cifradoAmericano :: NotaBasica -> Char, que relaciona las notas Do, Re, Mi, Fa, Sol, La y Si con los caracteres 'C', 'D', 'E', 'F', 'G', 'A' y 'B' respectivamente

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

-- Ejemplos:
-- ghci > cifradoAmericano Do
-- 'C'
-- ghci > cifradoAmericano Re
-- 'D'
-- ghci > cifradoAmericano Mi
-- 'E'
-- ghci > cifradoAmericano Fa
-- 'F'

------ EJERCICIO 2 ------
-- Clases de tipos.
-- Una clase es un conjunto de tipos que proveen ciertas operaciones especiales:
-- Clase Eq: tipos que proveen una noción de igualdad (operador ==)
-- Clase Ord: tipos que proveen una noción de rden (operadores <=, =>, funciones min, max y más)
-- Clase Bounded: tipos que proveen una cota superior y una cota inferior para sus valores. Tienen entonces un elemento más grande, definido como la constante maxBound, y un elemento más chico, definido como minBound
-- Clase Show: tipos que proveen una representación en forma de texto (función show)
-- Podemos indicar al intérprete que interfiera automaticamente la definición de una clase para un tipo dado en el momento de su definición, usando deriving como se muestra acontinuación:
-- data Carrera = Mat | Fis | Compu | Astro deriving Eq

--- A ---
--- Completar la definición del tipo NotaBasica para que las expresiones: Do <= Re y Fa `min` Sol, sean válidas y no generen error. Ayuda: usar deriving con múltiples clases

-- Esto lo hice más arriba para que no cause conflicto crear dos veces un mismo tipo

------ Ejercicio 3 ------
-- Polimorfismo ad hoc

--- A ---
-- Definir usando polimorfismo ad hoc la función minimoElemento que calcula (de manera reversa) cuál es el menor de una lista de tipo [a]. Asegurarse que solo esté definida para listas no vacias

minimoElemento :: (Ord a) => [a] -> a
minimoElemento [x] = x
minimoElemento (x : xs) = min x (minimoElemento xs)

-- Ejemplos:
-- ghci > minimoElemento [5, 10, 3, 8, 2]
-- 2
-- ghci > minimoElemento ['c', 'a', 'b', 'e', 'd']
-- 'a'
-- ghci > minimoElemento ["perro", "gato", "elefante", "raton"]
-- "elefante" (la función devuelve "elefante" porque alfabéticamente precede a todas las demás)

--- B ---
-- Definir la función minimoElemento' de manera tal que el caso base de la recursión sea el de lista vacía. Para ello revisar la clase Bounded
-- Ayuda: Para probar esta función dentro de ghci con listas vacías, indicar el tipo concreto con tipos de la clases Bounded. ([] :: Bool)

minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x : xs) = min x (minimoElemento' xs)

-- Ejemplos:
-- ghci > minimoElemento' ([] :: [Bool])
-- True
-- ghci > minimoElemento' ([3, 14, 6, 7] :: [Int])
-- 3

--- C ---
-- Usar la función minimoElemento para determinar la nota más grave de la melodía: [Fa, La, Sol, Re, Fa]

-- ghci > minimoElemento [Fa, La, Sol, Re, Fa]
-- Re

------ Ejercicio 4 ------
-- Sinónimo de tipos: constructores con parámetros
-- Un sinónimo de tipo nos permite definir un nuevo nombre para un tipo ya existente

--- A ---
-- Implementá el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura, Zona, etc) tal como están definidos arriba

type Altura = Int 

type NumCamiseta = Int

data Zona = Arco | Defensa | Mediocampo | Delantera deriving Show

data TipoReves = DosManos | UnaMano deriving Show

data Modalidad = Carretera | Pista | Monte | BMX deriving Show

data PiernaHabil = Izquierda | Derecha deriving Show

type ManoHabil = PiernaHabil

data Deportista = Ajedrecista
    | Ciclista Modalidad
    | Velocista Altura
    | Tenista TipoReves ManoHabil Altura
    | Futbolista Zona NumCamiseta PiernaHabil Altura 

--- B ---
-- ¿Cuál es el tipo del constructor Ciclista?

-- ghci> :t Ciclista
-- Ciclista :: Modalidad -> Deportista

--- C ---
-- Programá la función contar_velocistas :: [Deportista] -> Int, que dada una lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs

-- Para resolver este ejercicio voy a necesitar hacer una función auxiliar llamada esVelocista :: Deportista -> Bool, que devuelve True cuando un Deportista es Velocista

--- FUNCION AUXILIAR esVelocista ---
esVelocista :: Deportista -> Bool
esVelocista (Velocista _) = True
esVelocista _ = False

-- Ejemplos para verificar que funcione correctamente:
-- ghci> esVelocista (Velocista 150)
-- True
-- ghci> esVelocista (Tenista  UnaMano Derecha 189)
-- False

-- contar_velocistas --
contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (x : xs)
    | esVelocista x = 1 + contar_velocistas xs
    | otherwise = contar_velocistas xs

-- Ejemplos:
-- ghci > contar_velocistas [Velocista 180, Tenista DosManos Izquierda 175, Velocista 160, Ciclista Pista, Futbolista Delantera 10 Izquierda 170]
-- 2
-- ghci > contar_velocistas [Tenista UnaMano Derecha 185, Ajedrecista, Velocista 175, Ciclista Monte]
-- 1

--- D ---
-- Programá la función contar_futbolistas :: [Deportista] -> Zona -> Int, que dada una lista de deportistas xs, y una zona z devuelve la cantidad de futbolistas incluidos en xs que juegan en la zona z. Programa contar_futbolistas sin usar igualdad, utilizando pattern matching

-- Para resolver este ejercicio voy a necesitar hacer una función auxiliar llamada comparaZonas :: Zona -> Zona -> Bool, que compara zonas

--- FUNCION AUXILIAR comparaZonas ---
comparaZonas :: Zona -> Zona -> Bool
comparaZonas Arco Arco = True
comparaZonas Defensa Defensa = True
comparaZonas Mediocampo Mediocampo = True
comparaZonas Delantera Delantera = True
comparaZonas _ _ = False

-- Ejemplos para ver que funcione:
-- ghci > comparaZonas Arco Arco
-- True
-- ghci > comparaZonas Arco Delantera
-- False

-- contar_futbolistas --
contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas (Futbolista z' _ _ _ : xs) z | comparaZonas z' z = 1 + contar_futbolistas xs z
contar_futbolistas (_ : xs) z = contar_futbolistas xs z

-- Ejemplos:
-- ghci > contar_futbolistas [Futbolista Arco 13 Izquierda 176, Futbolista Delantera 34 Derecha 187, Futbolista Arco 21 Derecha 187] Arco
-- 2
-- ghci > contar_futbolistas [Futbolista Arco 13 Izquierda 176, Futbolista Delantera 34 Derecha 187, Futbolista Arco 21 Derecha 187] Delantera
-- 1
-- ghci > contar_futbolistas [Futbolista Arco 13 Izquierda 176, Futbolista Defensa 34 Derecha 187, Futbolista Arco 21 Derecha 187] Delantera
-- 0

--- E ---
-- ¿La función anterior usa filter? Si no es así, reprogramala para usarla

-- Para resolver este ejercicio voy a necesitar una función auxiliar llamada esFutEnZona :: Deportista -> Zona -> Bool, que verifica si un deportista juega en una zona especifica

--- FUNCION AUXILIAR esFutEnZona ---
esFutEnZona :: Deportista -> Zona -> Bool
esFutEnZona (Futbolista z' _ _ _) z = comparaZonas z' z
esFutEnZona _ _ = False

-- Ejemplo para ver que funcione correctamente:
-- ghci > esFutEnZona (Futbolista Delantera 10 Izquierda 180) Delantera
-- True
-- ghci > esFutEnZona (Futbolista Delantera 10 Izquierda 180) Arco
-- False

-- contar_futbolistas' --
contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' d z = length (filter (`esFutEnZona` z) d)

-- Ejemplos:
-- ghci > contar_futbolistas' [Futbolista Delantera 10 Izquierda 180, Futbolista Delantera 6 Derecha 169, Futbolista Defensa 25 Derecha 202, Futbolista Delantera 5 Derecha 190] Delantera
-- 3
-- ghci > contar_futbolistas' [Futbolista Delantera 10 Izquierda 180, Futbolista Arco 6 Derecha 169, Futbolista Defensa 25 Derecha 202, Futbolista Arco 5 Derecha 190] Arco
-- 2

------ Ejercicio 5 ------
-- Definición de clases. Vamos a representar las notas musicales con sus alteraciones

--- A ---
-- Implementá la función sonidoNatural

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

--- B ---
-- Definir el tipo enumerado Alteracion que consta de los constructores Bemol, Natural y Sostenido

data Alteracion = Bemol | Natural | Sostenido deriving (Eq, Ord)

--- C ---
-- Definir el tipo NotaMusical que consta de un único constructor que toma dos parámetros. El primer parámetro es de tipo NotaBasica y el segundo de tipo Alteracion. De esta manera cuando se quiera representar una nota alterada se puede usar como segundo parámetro del constructor un Bemol o Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como segundo parámetro

data NotaMusical = Nota NotaBasica Alteracion

--- D ---
-- Definí la función sonidoCromatico :: NotaMusical -> Int, que devuelve el sonido de una nota, incrementando uno su valor si tiene la alteración Sostenido, decrementando en uno si tiene la alteración Bemol y dejando su valor intacto si la alteración es Natural

instance Eq NotaMusical where
    (Nota nota1 alt1) == (Nota nota2 alt2) = sonidoCromatico (Nota nota1 alt1) == sonidoCromatico (Nota nota2 alt2)

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nota Natural) = sonidoNatural nota
sonidoCromatico (Nota nota Bemol) = (sonidoNatural nota - 1) `mod` 12 -- `mod` 12 porque trabajamos del 0 al 11 (12 numeros)
sonidoCromatico (Nota nota Sostenido) = (sonidoNatural nota + 1) `mod` 12

-- Ejemplos:
-- ghci> notaDoBemol = Nota Do Bemol
-- ghci> sonidoCromatico notaDoBemol
-- 11
-- ghci> notaFaSostenido = Nota Fa Sostenido
-- ghci> sonidoCromatico notaFaSostenido
-- 6
-- ghci> notaMiNatural = Nota Mi Natural
-- ghci> sonidoCromatico notaMiNatural
-- 4
-- ghci> notaSiSostenido = Nota Si Sostenido
-- ghci> sonidoCromatico notaSiSostenido
-- 0
-- ghci> notaDoNatural = Nota Do Natural
-- ghci> sonidoCromatico notaDoNatural
-- 0

--- E ---
-- Incluí el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el mismmo valor de sonidoCromatico se consideren iguales

-- Para resolver este ejercicio podia dejarlo en aplicar deriving a mi tipo algebraico NotaMusical pero preferí ir un pasito más allá y crear funciones que me permitan comparar por ejemplo Do Natural y Si Sostenido (ambas son 0)

-- Empezamos con ajustarNota :: NotaMusical -> NotaMusical, obtiene el valor del sonido cromatico de la nota dada. Luego verifica si el valor cromatico esta entre 0 y 11. Si es así utiliza un `case` para determinar si la alteración de la nota es Sostenido o Natural. Si es Sostenido, ajusta la nota al siguiente Tono Natural, si es Natural la ajusta al tono anterior Sostenido. Si el valor de sonido no esta entre 0 y 11, devuelve la misma nota sin ajustes

--- FUNCION AUXILIAR ajustarNota ---
ajustarNota :: NotaMusical -> NotaMusical
ajustarNota (Nota nota alt) =
    if sonidoCromatico (Nota nota alt) `elem` [0, 11]
        then case alt of
            Sostenido -> Nota (siguienteNota nota) Natural
            Natural -> Nota (anteriorNota nota) Sostenido
            _ -> Nota nota alt
        else Nota nota alt

-- Ahora hacemos la funcion siguienteNota :: NotaBasica -> NotaBasica que toma una NotaBasica como entrada y devuelve la siguiente nota en la secuencia de tonos musicales. Utiliza coincidencia de patrones para determinar la siguiente nota en función de la nota dada. Si la nota es Si, devuelve Do. Sino utiliza siguienteNota' para obtener la siguiente nota

--- FUNCIONES AUXILIARES siguienteNota y siguienteNota' ---
siguienteNota :: NotaBasica -> NotaBasica
siguienteNota Si = Do
siguienteNota nota = siguienteNota' nota

siguienteNota' :: NotaBasica -> NotaBasica
siguienteNota' Do = Re
siguienteNota' Re = Mi
siguienteNota' Mi = Fa
siguienteNota' Fa = Sol
siguienteNota' Sol = La
siguienteNota' La = Si
siguienteNota' Si = undefined -- No hay siguiente para Si

-- Ahora hacemos anteriorNota :: NotaBasica -> NotaBasica que es como siguienteNota pero ahora devuelve la nota anteriror

--- FUNCIONES AUXILIARES anteriorNota y anteriorNota' ---
anteriorNota :: NotaBasica -> NotaBasica
anteriorNota Do = Si
anteriorNota nota = anteriorNota' nota

anteriorNota' :: NotaBasica -> NotaBasica
anteriorNota' Si = La
anteriorNota' La = Sol
anteriorNota' Sol = Fa
anteriorNota' Fa = Mi
anteriorNota' Mi = Re
anteriorNota' Re = Do
anteriorNota' Do = undefined -- No hay anterior para Do

-- EJEMPLOS:
-- ghci > doNat = Nota Do Natural
-- ghci > siSos = Nota Si Sostenido
-- ghci > doNat == siSos
-- True

-- ghci > reSos = Nota Re Sostenido
-- ghci > miBel = Nota Mi Bemol
-- ghci > reSos == miBel
-- True

-- ghci > reSos == doNat
-- False

--- F ---
-- Incluí el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir que una nota es menor o igual a otra si y sólo si el valor de sonidoCromatico para la primera es menor o igual al valor de sonidoCromatico para la segunda

-- Podria haberlo dejado en deriving Ord pero quise aprender mejor y hacerle un instance

instance Ord NotaMusical where
    (Nota nota1 alt1) <= (Nota nota2 alt2) = sonidoCromatico (Nota nota1 alt1) <= sonidoCromatico (Nota nota2 alt2)

-- Ejemplos:
-- ghci> doNat = Nota Do Natural
-- ghci> reNat = Nota Re Natural
-- ghci> doSos = Nota Do Sostenido
-- ghci> siBel = Nota Si Bemol
-- ghci> doNat <= reNat
-- True
-- ghci> reNat <= doSos
-- False
-- ghci> doSos <= siBel
-- True

------ Ejercicio 6 ------
-- Tipos enumerados con polimorfismo

--- A ---
-- Definir la función primerElemento que devuelve el primer elemento de una lista no vacía, o Nothing si la lista es vacía

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:_) = Just x

-- Ejemplos:
-- ghci > primerElemento []
-- Nothing
-- ghci > primerElemento [3, 4, 5]
-- Just 3

------ Ejercicio 7 ------
-- Tipos recursivos. Supongamos que queremos representar una cola de deportistas. El orden de atención respeta el orden de llegada

data Cola = VaciaC | Encolada Deportista Cola 

-- En esta definición, el tipo que estamos definindo aparece como un parámetro de uno de sus constructores, por ello se dice que el tipo es recursivos

--- A ---
-- 1) atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que está en la primer posición de una cola, por haber sido atendida. Si la cola está vacía devuelve Nothing

-- Para este ejercicio me pide tener un deriving Show

instance Show Deportista where
    show (Futbolista z numCamiseta piernaHabil altura) = "Futbolista " ++ show z ++ " " ++ show numCamiseta ++ " " ++ show piernaHabil ++ " " ++ show altura
    show (Ciclista modalidad) = "Ciclista " ++ show modalidad
    show (Velocista altura) = "Velocista " ++ show altura
    show (Tenista tipoReves manoHabil altura) = "Tenista " ++ show tipoReves ++ " " ++ show manoHabil ++ " " ++ show altura
    show Ajedrecista = "Ajedrecista" 

instance Show Cola where
    show VaciaC = "VaciaC"
    show (Encolada deportista cola) = "Encolada " ++ show deportista ++ " " ++ show cola


atender :: Cola -> Maybe Cola 
atender VaciaC = Nothing
atender (Encolada a b) = Just b 

-- Ejemplos:
-- ghci > colaVacia = VaciaC
-- ghci > atender colaVacia
-- Nothing

-- ghci > dep1 = Futbolista Arco 10 Derecha 175
-- ghci > dep2 = Tenista DosManos Derecha 150
-- ghci > colaConGente = Encolada dep1 (Encolada dep2 colaVacia)

-- ghci > atender colaConGente
-- Just Encolada Tenista DosManos Derecha 150 VaciaC

-- 2) encolar :: Deportista -> Cola -> Cola,que agrega una persona a una cola de deportistas, en la ultima posicion

encolar :: Deportista -> Cola -> Cola
encolar deportista VaciaC = Encolada deportista VaciaC
encolar deportista (Encolada d cola) = Encolada d (encolar deportista cola)

-- Ejemplos:
-- ghci > colaVacia = VaciaC
-- ghci > dep1 = Futbolista Arco 10 Derecha 175
-- ghci > dep2 = Tenista DosManos Derecha 150
-- ghci > colaDep1 = encolar dep1 colaVacia

-- ghci > encolar dep2 colaDep1
-- Encolada Futbolista Arco 10 Derecha 175 Encolada Tenista DosManos Derecha 150 VaciaC

-- 3) busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera futbolista dentro de la cola que juega en la zona que se corresponde con el segundo parámetro. Si no hay futbolistas jugando en esa zona devuelve Nothing

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC _ = Nothing
busca (Encolada deportista cola) zona
    | esFutEnZona deportista zona = Just deportista
    | otherwise = busca cola zona

-- Ejemplos:
-- ghci > colaVacia = VaciaC
-- ghci > dep1 = Futbolista Arco 10 Derecha 175
-- ghci > dep2 = Futbolista Delantera 9 Izquierda 189
-- ghci > colaDep1 = encolar dep1 colaVacia
-- ghci > colaDep2 = encolar dep2 colaDep1
-- ghci > busca colaDep2 Delantera
-- Just Futbolista Delantera 9 Izquierda 189
-- ghci > busca colaDep2 Defensa
-- Nothing

--- B ---
-- ¿A qué tipo se parece Cola?

-- Cola se parece a una Lista

------ Ejercicio 8 ------
-- Tipos recursivos y polimórficos

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)

type Diccionario = ListaAsoc String String

type Padron = ListaAsoc Int String

--- A ---
-- ¿Como se debe instanciar el tipo ListaAsoc para representar la información almacenada en una guía telefónica?

type GuiaTelefonica = ListaAsoc String Int

--- B ---
-- Programá las siguientes funciones

-- 1) la_long :: ListaAsoc a b -> Int, que devuelve la cantidad de datos en una lista

la_long :: ListaAsoc a b -> Int
la_long (Vacia) = 0
la_long (Nodo a b c) = 1 + la_long c 

-- Ejemplos:
-- ghci > lista1 = Nodo "Lauti" 12345689 (Nodo "Valen" 987654321 Vacia)

-- ghci > la_long lista1
-- 2

-- 2) la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que devuelve la concatenación de dos listas asociaciones

instance (Show a, Show b) => Show (ListaAsoc a b) where
    show Vacia = "Vacia"
    show (Nodo a b Vacia) = "Nodo " ++ show a ++ " " ++ show b ++ "(Vacia)"
    show (Nodo a b restante) = "Nodo " ++ show a ++ " " ++ show b ++ " (" ++ show restante ++ ")"

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia c = c
la_concat (Nodo a b d) e = Nodo a b (la_concat d e)

-- Ejemplos:
-- ghci > lista1 = Nodo "Lauti" 12345689 (Nodo "Valen" 987654321 Vacia)
-- ghci > lista2 = Nodo "Gaston" 135792468 Vacia

-- ghci > la_concat lista1 lista2
-- Nodo "Lauti" 12345689 (Nodo "Valen" 987654321 (Nodo "Gaston" 135792468 (Vacia)))


-- 3) la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que agrega un nodo a la lista de asociaciones si la clave no está en la lista, o actualiza el valor si la clave ya se encontraba

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b 
la_agregar Vacia a b = (Nodo a b Vacia)
la_agregar (Nodo a b c) d e
    | a == d = Nodo a e c
    | otherwise = Nodo a b (la_agregar c d e)

-- Ejemplos:
-- ghci > lista1 = Nodo "Lauti" 12345689 (Nodo "Valen" 987654321 Vacia)

-- ghci > la_agregar lista1 "Luli" 3512320824
-- Nodo "Lauti" 12345689 (Nodo "Valen" 987654321 (Nodo "Luli" 3512320824 (Vacia)))
-- ghci > la_agregar lista1 "Lauti" 21436576980
-- Nodo "Lauti" 21436576980 (Nodo "Valen" 987654321 (Vacia))

-- 4) la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asociaciones en una lista de pares clave-dato

la_pares :: ListaAsoc a b -> [(a, b)] 
la_pares Vacia = []
la_pares (Nodo a b c) = (a, b):la_pares c

-- Ejemplos:
-- ghci > lista1 = Nodo "Lauti" 12345689 (Nodo "Valen" 987654321 Vacia)
-- ghci > lista2 = Nodo "Gaston" 135792468 Vacia

-- ghci > la_pares lista1
-- [("Lauti", 12345689), ("Valen", 987654321)]
-- ghci > la_pares lista2
-- [("Gaston", 135792468)]

-- 5) la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b, que dada una lista y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia c = Nothing
la_busca (Nodo a b d) e
    | a == e = Just b
    | otherwise = la_busca d e 

-- Ejemplos:
-- ghci > lista1 = Nodo "Lauti" 12345689 (Nodo "Valen" 987654321 Vacia)
-- ghci > lista2 = Nodo "Gaston" 135792468 Vacia

-- ghci > la_busca lista1 "Valen"
-- Just 987654321
-- ghci > la_busca lista2 "Azul"
-- Nothing

-- 6) la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b, que dada una clave a elimina la entrada en la lista

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a Vacia = Vacia
la_borrar a (Nodo b c d)
    | b == a = la_borrar a d
    | b /= a = Nodo b c (la_borrar a d)

-- Ejemplos:
-- ghci > lista1 = Nodo "Lauti" 12345689 (Nodo "Valen" 987654321 Vacia)
-- ghci > lista2 = Nodo "Gaston" 135792468 Vacia

-- ghci > la_borrar "Lauti" lista1
-- Nodo "Valen" 987654321 (Vacia)
-- ghci > la_borrar "Gaston" lista1
-- Nodo "Lauti" 12345689 (Nodo "Valen" 987654321 (Vacia))