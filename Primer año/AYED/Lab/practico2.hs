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

--- 5A ---
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

data Zona = Arco | Defensa | Mediocampo | Delantera
data TipoReves = DosManos | UnaMano
data Modalidad = Carretera | Pista | Monte | BMX
data PiernaHabil = Izquierda | Derecha

type ManoHabil = PiernaHabil

data Deportista =     Ajedresista
                    | Ciclista Modalidad
                    | Velocista Altura
                    | Tenista TipoReves ManoHabil Altura
                    | Futbolista Zona NumCamiseta PiernaHabil Altura

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
--- B ---
-- Defini el tipo enumerado Alteracion que consta de los constructores Bemol, Natural y Sostenido
--- C ---
-- Defini el tipo algebraico NotaMusical que debe tener un solo constructor que llamaremos Nota el cual toma dos parametros. El primer parametro es de tipo NotaBasica y el segundo de tipo Alteracion. De esta manera cuando se quiera representar una nota alterada se puede usar como segundo parametro del constructor un Bemol o Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como seguno parametro
--- D ---
-- Defini la funcion sonidoCromatico :: NotaMusical -> Int que devuelve el sonido de una nota, incrementado en uno su valor si tienen la alteracion Sostenido, decrementando en uno si tiene la alteracion Bemol y dejando su valor intacto si la alteracion es Natural
--- E ---
-- Inclui el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el mismo valor de sonidoCromatico se consideren iguales
--- F ---
-- Inclui el tipo NotaMusical a la clase Ord definiendo el olperador <=. Se debe definir que una nota es menor o igual a otra si y solo si el valor de sonidoCromatico para la primera es menor o igual que el valor de sonidoCromatico para la segunda

------ EJERCICIO 11 ------
-- TIPO ENUMERADOS CON POLIMORFISMO

--- A ---
-- Defini la funcion primerElemento que devuelve el primer elemento de una lista no vacia, o Nothing si la lista es vacia

------ EJERCICIO 12 ------
-- TIPOS RECURSIVOS

------ 1 ------
-- Programa las siguientes funciones

--- A ---
-- atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que esta en la primer posicion de una cola, por haber sido atendida. Si la Cola esta vacia, devuelve Nothing

--- B ---
-- encolar :: Deportista -> Cola -> Cola, que agrega una persona a una cola de deportistas, en la ultima posicion

--- C ---
-- busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primera futbolista dentro de la cola que juega en la zona que se corresponde con el segundo parametro. Si no hay futbolistas jugando en esa zona devuelve Nothing

------ 2 ------
-- ¿A que otro tipo se parece Cola?

------ EJERCICIO 13 ------
-- TIPOS RECURSIVOS Y POLIMORFICOS

--- 1 ---
-- ¿Como se debe instanciar el tipo ListaAsoc para representar la informacion almacenada en una guia telefonica?

--- 2 ---
-- Programa las siguientes funciones:

--- A ---
-- la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una lista.

--- B ---
-- la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que devuelve la concatenacion de dos listas de asociaciones

--- C ---
-- la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que agrega un nodo a la lista de asociaciones si la clave no esta en la lista, o actualiza el valor si la clave ya se encontraba

--- D ---
-- la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asociaciones en una lista de pares clave-dato

--- E ---
-- la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista y una clae devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing

--- F ---
-- la_borrar :: Eq a  => a -> ListaAsoc a b -> ListaAsoc a b que dada una clase a elimina la entrada en la lista

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
