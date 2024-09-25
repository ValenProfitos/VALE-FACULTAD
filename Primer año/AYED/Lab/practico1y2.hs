-------- PRACTICO 1 --------

------ EJERCICIO 1 ------
-- Programa las siguientes funciones:

--- 1 ---
-- esCero :: Int -> Bool, que verifica si un entero es igual a 0.

esCero :: Int -> Bool
esCero x = x == 0 

--- 2 ---
-- esPositivo :: Int -> Bool, que verifica si un entero es estrictamente mayor a 0.

esPositivo :: Int -> Bool
esPositivo x = x > 0

--- 3 ---
-- esVocal :: Char -> Bool, que verifica si un caracter es una vocal en minuscula

esVocal :: Char -> Bool
esVocal x = x `elem` "aeiou"

--- 4 ---
-- valorAbsoluto :: Int -> Int, que devuelve el valor absoluto de un entero ingresado

valorAbsoluto :: Int -> Int
valorAbsoluto x | (x >= 0) = x
                | (x < 0) = -x

------ EJERCICIO 2 ------
-- Implementa en Haskell las funciones definidas en el ejercicio anterior

--- A ---
-- paratodo :: [Bool] -> Bool, que verifica que todos los elementos de una lista sean True

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs 

--- B ---
-- sumatoria :: [Int] -> Int, que calcula la suma de todos los elementos de una lista de enteros

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--- C ---
-- productoria :: [Int] -> Int, que calcula el producto de todos los elementos de la lista de enteros

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

--- D ---
-- factorial :: Int -> Int, que toma un numero n y calcula n!

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

--- E ---
-- Utiliza la funcion sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de numeros no vacia y calcula el valor promedio

promedio :: [Int] -> Int
promedio (x:xs) = div (sumatoria xs) (length xs)

------ EJERCICIO 3 ------
-- A partir de las expresiones de los ejercicios 4a, 4b y 4d

--- A ---
--Identifica las variables libres de cada expresion y el tipo de cada una

--- 4A ---

-- xs : [Int]

--- 4B ---

-- xs : [Int], x = Int

--- 4D ---

-- xs : [Int]

--- B ---
-- Defini las funciones que tomen como argumento las variables libres identificadas y devuelvan el resultado de la expresion.

--- 4A ---

todosMayoresQueCero :: [Int] -> Bool
todosMayoresQueCero [] = True
todosMayoresQueCero (x:xs) = (x > 0) && todosMayoresQueCero xs

--- 4B ---

existeElemento :: Int -> [Int] -> Bool
existeElemento _ [] = False
existeElemento x (y:ys) = (x == y) || existeElemento x ys

--- 4D ---

todosIgualesConsecutivos :: [Int] -> Bool
todosIgualesConsecutivos [] = True
todosIgualesConsecutivos [_] = True
todosIgualesConsecutivos (x:y:xs) = (x == y) && todosIgualesConsecutivos (y:xs)

--- C ---
-- Evalua las funciones tomando como argumento los valores señalados en 5 

------ EJERCICIO 4 ------
-- A partir de las expresiones en el ejercicio 7

--- A ---
-- Identifica las variables libres de cada expresion y el tipo de cada una

--- 7A ---

-- n : Int

--- 7B ---

-- xs : [Int]

--- 7C ---

--  xs : [Int], ys : [Int]

--- 7D ---

-- n : Int

--- B ---
-- Defini funciones que tomen como argumento las variables identificadas y devuelvan el resultado de la expresion

--- 7A ---

factorial' :: Int -> Int
factorial' x = productoria [1..x]

--- 7B ---

-- funcion promedio 

--- 7C ---

-- auxiliar maximo
maximo :: [Int] -> Int
maximo [x] = x 
maximo (x:xs)   | x > maximo xs = x 
                | otherwise = maximo xs 

-- auxiliar minimo
minimo :: [Int] -> Int
minimo [x] = x
minimo (x:xs)   | x < minimo xs = x 
                | otherwise = minimo xs

maxMenorQueMin :: [Int] -> [Int] -> Bool
maxMenorQueMin xs ys = maximo xs < minimo ys

--- 7D ---

-- Auxiliar esDivisor
existeDivisor :: [Int] -> Int -> Bool
existeDivisor [] _ = False
existeDivisor (x:xs) n = x `mod` n == 0 || existeDivisor xs n

-- Auxiliar esPrimo
esPrimo :: Int -> Bool
esPrimo n = n > 1 && not (existeDivisor [2..(n-1)] n)

--- C ---
-- Evalua las funciones tomando como argumento los valores señalados en el ejercicio 8

------ EJERCICIO 5 ------
-- Implementa en Haskell la funcion definida en el ejercicio 10

todos :: [Bool] -> Bool
todos [] = True
todos (x:xs) = x && todos xs 

------ EJERCICIO 6 ------
-- A partir de las expresiones del ejercicio anterior 12b, 12c y 12d

--- A ---
-- Identifica las variables libres de cada expresion y el tipo de cada una

--- 12B ---

-- n : Int, xs : [Int]

--- 12C ---

-- xs : [Int]

--- 12D ---

-- xs : [Int]

--- B ---
-- Defini funciones que tomen como argumento las variables libres identificadas y devuelvan el resultado de la expresion

--- 12B ---

esMaximo :: Int -> [Int] -> Bool
esMaximo n xs = n == maximo xs

--- 12C ---

-- auxiliar esPar
esPar :: Int -> Bool
esPar x = (mod x 2 == 0)

productoPares :: [Int] -> Int
productoPares xs = productoria [x | x <- xs, esPar x]


--- 12D ---


------ EJERCICIO 7 ------
-- Proframa las funciones definidas en el ejercicio 27. Para definir los tipos en haskell lo podes hacer de la siguiente manera:

--- A ---

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t

--- B ---

existe :: [a] -> (a -> Bool) -> Bool
existe [] t = False
existe (x:xs) t = t x || existe xs t

--- C ---

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = t x + sumatoria' xs t

--- D ---

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x:xs) t = t x * productoria' xs t

------ EJERCICIO 9 ------
-- Utilizando las funciones del laboratorio 7, programa las siguientes funciones por composicion, sin usar recursion ni analisis por casos

--- A ---
-- -todosPares :: [Int] -> Bool, verifica que todos los numeros de una lista sean pares

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs esPar

--- B ---
-- hayMultiplo :: Int -> [Int] -> Bool, verifica si existe algun numero dentro del segundo parametro que sea multiplo del primer parametro

-- auxiliar esMultiplo
esMultiplo :: Int -> Int -> Bool
esMultiplo x y = (mod y x == 0)

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo x xs = existe xs (esMultiplo x)

--- C ---
-- sumaCuadrados :: Int -> Int, dado un numero no negativo n, calcula la suma de los primeros n cuadrados

sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [0..x-1] (^2)

--- D ---
-- Programa la funcion existeDivisor' :: Int -> [Int] -> Bool, que dado un entero n y una lista ls devuelve True si y solo si existe algun elemento en ls que divida a n

-- auxiliar esDivisor
esDivisor :: Int -> Int -> Bool
esDivisor n x = n `mod` x == 0

existeDivisor' :: Int -> [Int] -> Bool
existeDivisor' n ls = existe ls (esDivisor n)

--- E ---
-- Utilizando la funcion del apartado anterior defini esPrimo' :: Int -> Bool, que dado un entero n devuelve True si y solo si n es primo

esPrimo' :: Int -> Bool
esPrimo' n = not (existeDivisor' n [2..(n-1)] || (n<1))

--- F ---
-- ¿Se te ocurre como redefinir factorial para evitar usar recursion?

factorial'' :: Int -> Int
factorial'' x = productoria' [1..x] id

--- G ---
-- Progamar la funcion multiplicaPrimos :: [Int] -> Int que calcula el produto de todos los numeros primos de una lista

-- auxiliar listaPrimos
listaPrimos :: [Int] -> [Int]
listaPrimos [] = []
listaPrimos (x:xs)  | esPrimo' x = x : listaPrimos xs
                    | otherwise = listaPrimos xs

multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria' (listaPrimos xs) id 

--- H ---
-- Programar la funcion esFib :: Int -> Bool que dado un entero n, devuelve True si y solo si n esta en la sucesion de Fibonacci

-- auxiliar fib
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib(n-1) + fib(n-2)

-- auxiliar listaFibInv
listaFibInv :: Int -> [Int]
listaFibInv 0 = [0]
listaFibInv 1 = [1,0]
listaFibInv 2 = [1,1,0]
listaFibInv n = fib n : listaFibInv (n-1)

esFib :: Int -> Bool
esFib t = existe (listaFibInv 20) (==t)

--- I ---
-- Utilizando la funcion del apartado anterior, defini la funcion todosFib :: [Int] -> Bool que dada una lista xs de enteros, devuelva si todos los elementos de la lista pertenecen a la sucesion de Fibonacci

todosFib :: [Int] -> Bool
todosFib xs = paratodo' xs esFib

------ EJERCICIO 10 ------
-- Implementa en Haskell las funciones definidas en el ejercicio anterior

--- 9A ---
--Usando recursion
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = x * 2 : duplica xs

--- 9B --- 
-- Usando la funcion map

duplica' :: [Int] -> [Int]
duplica' xs = map (*2) xs

------ EJERCICIO 11 ------
-- Programa una funcion que dada una lista de numeros xs, calcula una lista que tiene como elementos aquellos numeros de xs que son primos

--- A ---
-- Definila usando recursion

sonPrimos :: [Int] -> [Int]
sonPrimos [] = []
sonPrimos (x:xs)    | esPrimo' x = x : sonPrimos xs
                    | otherwise = sonPrimos xs

--- B ---
-- Definila utilizando la funcion filter

sonPrimos' :: [Int] -> [Int]
sonPrimos' xs = filter esPrimo' xs

--- C ---
-- Revisa tu definicion del ejercicio 6g. ¿Como podes mejorarla?

multiplicaPrimos' :: [Int] -> Int
multiplicaPrimos' xs = productoria' (filter esPrimo' xs) id 

------ EJERCICIO 12 ------
-- La funcion primIgualesA toma un valor y una lista, y calcula el tramo inicial mas largo de lista cuyos elementos son iguales a ese valor

--- A ---
-- Programa primIgualesA por recursion

primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA _ [] = []
primIgualesA n (x:xs)   | n == x = x : primIgualesA n xs
                        | otherwise = []

--- B ---
-- Programa nuevamente la funcion utilizando takeWhile

primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (==n) xs 

------ EJERCICIO 13 ------
-- La funcion primIguales toma una lista y devuelve el mayor tramo inicial de la lista cuyos elementos son todos iguales entre si

--- A ---
-- Programa primIguales por recursion

primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:y:xs)    | x == y = x : primIguales (y:xs)
                        | otherwise = [x]

--- B ---
-- Usa cualquier version de primIgualesA para programar primIguales. Esta permitido dividir en casos, pero no usar recursion.

primIguales' :: Eq a => [a] -> [a]
primIguales' [] = []
primIguales' (x:xs) = primIgualesA' x (x:xs)

-------- PRACTICO 2 --------

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


---- EJERCICIOS PRACTICOS VIEJOS UTILES ---

-- Otro tipo de datos muy util y que se puede usar para representar muchas situaciones es el arbol.

--En este ejercicio consideramos arboles binarios, es decir cada rama tiene solo dos descendientes inmediatos

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

-- a_long devuelve la cantidad de datos almacenados
a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama izq _ der) = 1 + a_long izq + a_long der

-- a_hojas que dado un arbol devuelve la cantidad de hojas

a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama izq _ der) = a_hojas izq + a_hojas der

-- a_inc que dado un arbol que contiene numeros, los incrementa en uno

a_inc :: Num a => Arbol a -> Arbol a 
a_inc Hoja = Hoja
a_inc (Rama izq valor der) = Rama (a_inc izq) (valor +1) (a_inc der)

--- simfdf---

type Altura = Int

data Modalidad = Carretera | Pista deriving Show

data Deportista = Velocista Altura | Ciclista Modalidad deriving Show

juan :: Deportista
juan = Velocista 172

-- ghci> juan
-- Velocista 172

esVelocistaAlto :: Deportista -> Int -> Bool
esVelocistaAlto (Ciclista _) = False
esVelocistaAlto (Velocista alt) n   | n < alt = True
                                    | otherwise = False

-- ghci> esVelocistaAlto juan 160
-- True
-- ghci> esVelocistaAlto juan 172
-- False
-- ghci> esVelocistaAlto juan 180
-- False

esVelocista :: Deportista -> Bool 
esVelocista (Velocista _) = True
esVelocista (_) = False

contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (x : xs)  | esVelocista x = 1 + contar_velocistas xs
                            | otherwise = contar_velocistas xs

-- ghci> deportistas = [juan, Ciclista Carretera, Velocista 150]
-- ghci> contar_velocistas deportistas 
-- 2

esCiclista :: Deportista -> Bool
esCiclista (Ciclista _) = True
esCiclista (_) = False

-- ghci> maria = Ciclista Carretera 
-- ghci> esCiclista juan 
-- False
-- ghci> esCiclista maria 
-- True

data Cola = VaciaC | Encolada Deportista Cola deriving Show

encolar :: Deportista -> Cola -> Cola
encolar dep VaciaC = Encolada dep VaciaC
encolar dep (Encolada dep1 res) = Encolada dep1 (encolar dep res)

-- ghci> maria = Ciclista Carretera 
-- ghci> colaVacia = VaciaC 
-- ghci> colaConJuan = encolar juan colaVacia 
-- ghci> colaConJuan 
-- Encolada (Velocista 172) VaciaC
-- ghci> colaConJuan = Encolada juan VaciaC
-- ghci> colaConMaria = encolar maria colaConJuan
-- ghci> colaConMaria 
-- Encolada (Velocista 172) (Encolada (Ciclista Carretera) VaciaC)

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

---- mamamama ----

duracionPeliMasLarga :: [Video] -> Int 
duracionPeliMasLarga [] = 0
duracionPeliMasLarga ((Pelicula _ _ duracion _):ls) = max duracion (duracionPeliMasLarga ls)
duracionPeliMasLarga (_:ls) = duracionPeliMasLarga ls