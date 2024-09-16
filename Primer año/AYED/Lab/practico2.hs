------ EJERCICIO 1 ------
-- Defini en Haskell las funciones derivadas en el ejercicio 2 y evalua las mismas en los ejemplos utilizados en el ejercicio 3

--- 2A ---
--- 2B ---
--- 2C ---
--- 2D ---
--- 2E ---

--- 3A ---
--- 3B ---
--- 3C ---
--- 3D ---
--- 3E ---

------ EJERCICIO 2 ------
-- TIPOS ENUMERADOS

--- A ---
--  Implementa el tipo Carrera 5
data Carrera = Matematica | Fisica | Computacion | Astronomia deriving Show

--- B ---
-- Defini la siguiente funcion utilizando pattern matching titulo :: Carrera -> String que devuelve el nombre completo de la carrera en forma de String

titulo :: Carrera -> String
titulo x = "Licenciatura en " ++ show(x)

--- EJEMPLOS ---

-- ghci> titulo Computacion
-- "Licenciatura en Computacion"
-- ghci> titulo Matematica 
-- "Licenciatura en Matematica"
-- ghci> titulo Fisica 
-- "Licenciatura en Fisica"
-- ghci> titulo Astronomia 
-- "Licenciatura en Astronomia"

--- C ---
--Para escribir musica se utiliza la denominada notacion musical, la cual consta de notas (do, re, mi, fa, sol, la, si) Defini el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La, Si

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq, Ord, Show)

--- D ---
-- El sistema de notacion musical anglosajon, tambien conocido como cifrado americano, relaciona las notas basicas con las letras de la 5A a la G. Programa usando pattern matching la funcion: cifradoAmericano :: NotaBasica -> Char 

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C' 
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La =  'A'
cifradoAmericano Si =  'B' 

--- EJEMPLOS ---

-- ghci> cifradoAmericano Do
-- 'C'
-- ghci> cifradoAmericano Re
-- 'D'
-- ghci> cifradoAmericano Mi
-- 'E'
-- ghci> cifradoAmericano Fa
-- 'F'
-- ghci> cifradoAmericano Sol
-- 'G'
-- ghci> cifradoAmericano La
--  'A'
--  ghci> cifradoAmericano Si
--  'B' 
------ EJERCICIO 3 ------
-- CLASES DE TIPOS

-- Clase Eq: tipos que proveen una nocion de igualdad (operador ==).

-- Clase Ord: tipos que proveen una nocion de orden (operadores <=, >=, funciones min, max y mas).

-- Clase Bounded: tipos que proveen una cota superior y una cota inferior para sus valores. Tienen entonces un elemento mas grande, definido como la constante maxBound, y un elemento mas chico, definido como minBound.

-- Clase Show: tipos que proveen una representacion en forma de texto (funcion show).

--- A ---
--  Completa la definicion del tipo NotaBasica para que las expresiones Do <= Re , Fa `min` Sol sean validas y no generen error. 5
--  deriving (Eq, Ord, Show)

--- EJEMPLOS ---

-- ghci> Do <= Re
-- True
-- ghci> Fa `min` Sol
-- Fa

------ EJERCICIO 4 ------
-- Polimorfismo ad hoc

--- 5A ---
--  Defini usando polimorfismo ad hoc la funcion minimoElemento que calcula (de manera recursiva) cual es el menor valor de una lista de tipo [a]. Asegurate que solo este definida para listas no vacias 
minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

--- EJEMPLOS ---

-- ghci> minimoElemento [4,5,3,7,1]
-- 1
-- ghci> minimoElemento "are"
-- 'a'
-- ghci> minimoElemento [True,False,True]
-- False
-- ghci> minimoElemento []
-- *** Exception: practico2.hs:(105,1)-(106,49): Non-exhaustive patterns in function minimoElemento

--- B ---
-- Defini la funcion minimoElemento' de manera tal que el caso base de la recursion sea el de la lista vacia. Para ello revisa la clase Bounded.

minimoElemento' :: (Ord a, Bounded a)=> [a] -> a 
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = min x (minimoElemento' xs)

--- EJEMPLOS ---

-- ghci> minimoElemento' []
-- ()
-- ghci> minimoElemento' [] :: Bool
-- True
-- ghci> minimoElemento' [] :: Int
-- 9223372036854775807

--- C ---
-- Usa la funcion minimoElemento para determinar la nota mas grave de la melodia [Fa, La, Sol, Re, Fa]

-- ghci> minimoElemento [Fa, La, Sol, Re, Fa]
-- Re

------ EJERCICIO 5 ------
-- SINONIMOS DE TIPOS, CONSTRUCTORES CON PARAMETROS

--- 5A ---
-- Implementa el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura, Zona, etc) que estan definidos en el practico

type Altura = Int
type NumCamiseta = Int 

data Zona = Arco | Defensa | Mediocampo | Delantera deriving Show
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

type ManoHabil = PiernaHabil 

data Deportista =     Ajedresista
                    | Ciclista Modalidad
                    | Velocista Altura
                    | Tenista TipoReves ManoHabil Altura
                    | Futbolista Zona NumCamiseta PiernaHabil Altura deriving Show

--- 5B ---
--  ¿Cual es el tipo del constructor Ciclista?

-- ghci> :t Ciclista 
-- Ciclista :: Modalidad -> Deportista

--- C ---
-- Programa la funcion contar_velocistas :: [Deportista] -> Int que dada una lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs. Programar contar_velocistas sin usar igualdad, utilizando pattern matching

-- auxiliar esVelocista

esVelocista :: Deportista -> Bool
esVelocista (Velocista _) = True
esVelocista (_) = False

contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (x:xs)    |esVelocista x = 1 + contar_velocistas xs
                            | otherwise = contar_velocistas xs

--- COMO LO HIZO EL PROFE ---
contar_velocistas' :: [Deportista] -> Int
contar_velocistas' [] = 0
contar_velocistas' (Velocista _ : xs) = 1 + contar_velocistas' xs
contar_velocistas' (_ : xs) = contar_velocistas' xs

--- D ---
-- Programar la funcion contar_futbolistas :: [Deportista] -> Zona -> Int que dada una lista de deportistas xs y una zona z, devuelve la cantidad de futbolistas incluidos en xs que juegan en la zona z. No usar igualdad, solo pattern matching

-- auxiliar comparaZona
comparaZona :: Zona -> Zona -> Bool
comparaZona Arco Arco = True
comparaZona Defensa Defensa = True
comparaZona Mediocampo Mediocampo = True
comparaZona Delantera Delantera = True
comparaZona _ _ = False

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas (Futbolista zone _ _ _ : xs) z   | comparaZona zone z = 1 + contar_futbolistas xs z
contar_futbolistas (_ : xs) z = contar_futbolistas xs z 

--- PARECIDO A VELOCISTAS' ---
contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' [] _ = 0
contar_futbolistas' ((Futbolista Arco _ _ _) : xs) Arco = 1 + contar_futbolistas' xs Arco
contar_futbolistas' ((Futbolista Delantera _ _ _) : xs) Delantera = 1 + contar_futbolistas' xs Delantera
contar_futbolistas' ((Futbolista Mediocampo _ _ _) : xs) Mediocampo = 1 + contar_futbolistas' xs Mediocampo
contar_futbolistas' ((Futbolista Defensa _ _ _) : xs) Defensa = 1 + contar_futbolistas' xs Defensa
contar_futbolistas' (_ : xs) z = contar_futbolistas' xs z

--- E ---
-- ¿La funcion anterior usa filter? Si no es asi, reprogramala para usarla

-- auxiliar esFutEnZona
esFutEnZona :: Deportista -> Zona -> Bool
esFutEnZona (Futbolista zone _ _ _) z = comparaZona zone z 
esFutEnZona _ _ = False

contar_futbolistas'' :: [Deportista] -> Zona -> Int
contar_futbolistas'' deportistas zona = length (filter (`esFutEnZona` zona) deportistas)

------ EJERCICIO 6 ------
-- Implementa en Haskell las funciones derivadas en el ejercicio 4

--- 4A ---
--- 4B ---
--- 4C ---
--- 4D ---

------ EJERCICIO 7 ------
-- Implementa en Haskell las funciones derivadas en el ejercicio 5

--- 5A ---
--- 5B ---
--- 5C ---
--- 5D ---

------ EJERCICIO 8 ------
-- Implementa en Haskell las funciones derivadas en el ejercicio 6

--- 6A ---
--- 6B ---
--- 6C ---
--- 6D ---

------ EJERCICIO 9 ------
-- Implementa en Haskell las funciones derivadas en el ejercicio 7

--- 7A ---
--- 7B ---

------ EJERCICIO 10 ------
-- DEFINICION DE CLASES

--- A ---
-- Implementa la funcion sonidoNatural como esta definida en el pdf

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

--- EJEMPLOS ---

-- ghci> sonidoNatural Do
-- 0
-- ghci> sonidoNatural Re
-- 2
-- ghci> sonidoNatural Mi
-- 4
-- ghci> sonidoNatural Fa
-- 5
-- ghci> sonidoNatural Sol
-- 7
-- ghci> sonidoNatural La
-- 9
-- ghci> sonidoNatural Si
-- 11

--- B ---
-- Defini el tipo enumerado Alteracion que consta de los constructores Bemol, Natural y Sostenido

data Alteracion = Bemol | Natural | Sostenido deriving (Eq, Ord)

--- C ---
-- Defini el tipo algebraico NotaMusical que debe tener un solo constructor que llamaremos Nota el cual toma dos parametros. El primer parametro es de tipo NotaBasica y el segundo de tipo Alteracion. De esta manera cuando se quiera representar una nota alterada se puede usar como segundo parametro del constructor un Bemol o Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como seguno parametro

data NotaMusical = Nota NotaBasica Alteracion

--- D ---
-- Defini la funcion sonidoCromatico :: NotaMusical -> Int que devuelve el sonido de una nota, incrementado en uno su valor si tienen la alteracion Sostenido, decrementando en uno si tiene la alteracion Bemol y dejando su valor intacto si la alteracion es Natural

-- `mod` 12 porque trabajamos desde el 0 al 11 (12 numeros)

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota n Natural) = sonidoNatural n
sonidoCromatico (Nota n Bemol) = (sonidoNatural n - 1) `mod` 12
sonidoCromatico (Nota n Sostenido) = (sonidoNatural n + 1) `mod` 12

--- EJEMPLOS ---

-- ghci> notaDoBemol = Nota Do Bemol 
-- ghci> notaDoNatural = Nota Do Natural  
-- ghci> notaDoSostenido = Nota Do Sostenido  
-- ghci> notaReBemol = Nota Re Bemol 
-- ghci> notaReNatural = Nota Re Natural  
-- ghci> notaReSostenido = Nota Re Sostenido  
-- ghci> notaMiBemol = Nota Mi Bemol 
-- ghci> notaMiNatural = Nota Mi Natural  
-- ghci> notaMiSostenido = Nota Mi Sostenido  
-- ghci> notaFaBemol = Nota Fa Bemol 
-- ghci> notaFaNatural = Nota Fa Natural  
-- ghci> notaFaSostenido = Nota Fa Sostenido  
-- ghci> notaSolBemol = Nota Sol Bemol 
-- ghci> notaSolNatural = Nota Sol Natural  
-- ghci> notaSolSostenido = Nota Sol Sostenido  
-- ghci> notaLaBemol = Nota La Bemol 
-- ghci> notaLaNatural = Nota La Natural  
-- ghci> notaLaSostenido = Nota La Sostenido  
-- ghci> notaSiBemol = Nota Si Bemol 
-- ghci> notaSiNatural = Nota Si Natural  
-- ghci> notaSiSostenido = Nota Si Sostenido  

-- ghci> sonidoCromatico notaDoBemol 
-- 11
-- ghci> sonidoCromatico notaDoNatural 
-- 0
-- ghci> sonidoCromatico notaDoSostenido 
-- 1
-- ghci> sonidoCromatico notaReBemol 
-- 1
-- ghci> sonidoCromatico notaReNatural 
-- 2
-- ghci> sonidoCromatico notaReSostenido 
-- 3
-- ghci> sonidoCromatico notaMiBemol 
-- 3
-- ghci> sonidoCromatico notaMiNatural 
-- 4
-- ghci> sonidoCromatico notaMiSostenido 
-- 5
-- ghci> sonidoCromatico notaFaBemol 
-- 4
-- ghci> sonidoCromatico notaFaNatural 
-- 5
-- ghci> sonidoCromatico notaFaSostenido 
-- 6
-- ghci> sonidoCromatico notaSolBemol 
-- 6
-- ghci> sonidoCromatico notaSolNatural 
-- 7
-- ghci> sonidoCromatico notaSolSostenido 
-- 8
-- ghci> sonidoCromatico notaLaBemol 
-- 8
-- ghci> sonidoCromatico notaLaNatural 
-- 9
-- ghci> sonidoCromatico notaLaSostenido 
-- 10
-- ghci> sonidoCromatico notaSiBemol 
-- 10
-- ghci> sonidoCromatico notaSiNatural 
-- 11
-- ghci> sonidoCromatico notaSiSostenido 
-- 0

--- E ---
-- Inclui el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el mismo valor de sonidoCromatico se consideren iguales

instance Eq NotaMusical 
    where
        n1 == n2 = sonidoCromatico n1 == sonidoCromatico n2

--- F ---
-- Inclui el tipo NotaMusical a la clase Ord definiendo el olperador <=. Se debe definir que una nota es menor o igual a otra si y solo si el valor de sonidoCromatico para la primera es menor o igual que el valor de sonidoCromatico para la segunda

instance Ord NotaMusical 
    where
        n1 <= n2 = sonidoCromatico n1 <= sonidoCromatico n2

------ EJERCICIO 11 ------
-- TIPO ENUMERADOS CON POLIMORFISMO

--- A ---
-- Defini la funcion primerElemento que devuelve el primer elemento de una lista no vacia, o Nothing si la lista es vacia

primerElemento :: [a] -> Maybe a
primerElemento [] = Nothing
primerElemento (x:_) = Just x

--- EJEMPLOS ---

-- ghci> primerElemento []
-- Nothing
-- ghci> primerElemento [3,4,5]
-- Just 3

------ EJERCICIO 12 ------
-- TIPOS RECURSIVOS

data Cola = VaciaC | Encolada Deportista Cola deriving Show

------ 1 ------
-- Programa las siguientes funciones

--- Los proximos ejemplos son los genericos que voy a usar

-- dep1 = Futbolista Arco 23 Derecha 193
-- dep2 = Tenista DosManos Izquierda 186
-- dep3 = Futbolista Delantera 15 Izquierda 178
-- colaVacia = VaciaC

--- A ---
-- atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que esta en la primer posicion de una cola, por haber sido atendida. Si la Cola esta vacia, devuelve Nothing

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada a b) = Just b

--- EJEMPLOS ---

-- ghci> colaEncolada = Encolada dep1 (Encolada dep2 VaciaC)
-- ghci> atender colaVacia 
-- Nothing
-- ghci> atender colaEncolada 
-- Just (Encolada (Tenista DosManos Izquierda 186) VaciaC)

--- B ---
-- encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola de deportistas, en la ultima posicion

encolar :: Deportista -> Cola -> Cola
encolar a VaciaC = Encolada a VaciaC
encolar a (Encolada b c) = Encolada b (encolar a c)

--- EJEMPLOS ---

-- ghci> encolar dep1 VaciaC
-- Encolada (Futbolista Arco 23 Derecha 193) VaciaC
-- ghci> encolar dep3 colaEncolada 
-- Encolada (Futbolista Arco 23 Derecha 193) (Encolada (Tenista DosManos Izquierda 186) (Encolada (Futbolista Delantera 15 Izquierda 178) VaciaC))

--- C ---
-- busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera futbolista dentro de la cola que juega en la zona que se corresponde con el segundo parametro. Si no hay futbolistas jugando en esa zona devuelve Nothing

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC _ = Nothing
busca (Encolada a b) zona   | esFutEnZona a zona = Just a
                            | otherwise = busca b zona

--- EJEMPLOS ---

-- ghci> colaEncolada = Encolada dep1 (Encolada dep2 (Encolada dep3 VaciaC))
-- ghci> busca colaVacia Arco
-- Nothing
-- ghci> busca colaEncolada  Arco
-- Just (Futbolista Arco 23 Derecha 193)
-- ghci> busca colaEncolada  Delantera
-- Just (Futbolista Delantera 15 Izquierda 178)
-- ghci> busca colaEncolada  Defensa
-- Nothing
-- ghci> colaTenista = (Encolada dep2 VaciaC)
-- ghci> busca colaTenista Arco
-- Nothing

------ 2 ------
-- ¿A que otro tipo se parece Cola?

-- Cola es similar al tipo Lista

------ EJERCICIO 13 ------
-- TIPOS RECURSIVOS Y POLIMORFICOS

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String

--- 1 ---
-- ¿Como se debe instanciar el tipo ListaAsoc para representar la informacion almacenada en una guia telefonica?

type GuiaTelefonica = ListaAsoc String Int

--- 2 ---
-- Programa las siguientes funciones:

-- ghci> lista1 = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 Vacia)
-- ghci> listaVacia = Vacia
-- ghci> lista2 = Nodo "Gaston" 135792468 Vacia

--- A ---
-- la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una lista.

la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo _ _ z) = 1 + la_long z

--- EJEMPLOS ---

-- ghci> la_long listaVacia 
-- 0
-- ghci> la_long lista1
-- 2

--- B ---
-- la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que devuelve la concatenacion de dos listas de asociaciones

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia c = c 
la_concat (Nodo a b d) e = Nodo a b (la_concat d e)

--- EJEMPLOS ---

-- ghci> la_concat lista1 lista2
-- Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 (Nodo "Gaston" 135792468 Vacia))
-- ghci> 
-- ghci> la_concat lista1 listaVacia 
-- Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 Vacia)
-- ghci> la_concat listaVacia listaVacia 
-- Vacia

--- C ---
-- la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que agrega un nodo a la lista de asociaciones si la clave no esta en la lista, o actualiza el valor si la clave ya se encontraba

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b
la_agregar Vacia a b = (Nodo a b Vacia)
la_agregar (Nodo a b c) d e | a == d = Nodo a e c 
                            | otherwise = Nodo a b (la_agregar c d e)

--- EJEMPLOS ---

-- ghci> la_agregar lista1 "Luli" 3512320824 
-- Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 (Nodo "Luli" 3512320824 Vacia))
-- ghci> la_agregar lista1 "Lauti" 3512320824 
-- Nodo "Lauti" 3512320824 (Nodo "Valen" 987654321 Vacia)

--- D ---
-- la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asociaciones en una lista de pares clave-dato

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b c) = (a, b):la_pares c

--- EJEMPLOS ---

-- ghci> la_pares listaVacia 
-- []
-- ghci> la_pares lista1
-- [("Lauti",123456789),("Valen",987654321)]
-- ghci> la_pares lista2
-- [("Gaston",135792468)]

--- E ---
-- la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista y una clae devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia a = Nothing
la_busca (Nodo b c d) e | b == e = Just c
                        | otherwise = la_busca d e 

--- EJEMPLOS ---

-- ghci> la_busca listaVacia "Lauti"
-- Nothing
-- ghci> la_busca lista1 "Lauti"
-- Just 123456789
-- ghci> la_busca lista1 "Luli"
-- Nothing

--- F ---
-- la_borrar :: Eq a  => a -> ListaAsoc a b -> ListaAsoc a b que dada una clase a elimina la entrada en la lista

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b
la_borrar a Vacia = Vacia
la_borrar a (Nodo b c d)    | b == a = la_borrar a d
                            | b /= a = (Nodo b c (la_borrar a d))


--- EJEMPLOS ---

-- ghci> la_borrar "Valen" lista1
-- Nodo "Lauti" 123456789 Vacia
-- ghci> la_borrar "Gaston" lista2
-- Vacia

------ EJERCICIO 14 ------
-- Implementaa en Haskell las funciones derivadas en el ejercicio 10

--- A ---
--- B ---
--- C ---
--- D ---
--- E ---
--- F ---

------ EJERCICIO 15 ------
-- Implementa en Haskell las funciones derivadas en el ejercicio 11

--- A ---
--- B ---
--- C ---

------ EJERCICIO 16 ------
-- Implementa en Haskell las funciones derivadas en el ejercicio 13

--- A ---
--- B ---
--- C ---
--- D ---
--- E ---

------ EJERCICIO 17 ------
-- Implementa en Haskell la funciones derivadas en el ejercicio 15

--- A ---
--- B ---
--- C ---
--- D ---
--- E ---
--- F ---
