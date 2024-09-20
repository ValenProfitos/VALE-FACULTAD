------ EJERCICIO 1 ------
-- Programa las siguientes funciones:

--- 1 ---
-- esCero :: Int -> Bool, que verifica si un entero es igual a 0.

esCero :: Int -> Bool
esCero x = x == 0 

--- EJEMPLOS ---

-- ghci> esCero 5
-- False
-- ghci> esCero 0
-- True
-- ghci> esCero (-3)
-- False

--- 2 ---
-- esPositivo :: Int -> Bool, que verifica si un entero es estrictamente mayor a 0.

esPositivo :: Int -> Bool
esPositivo x = x > 0

--- EJEMPLOS ---

-- ghci> esPositivo 0
-- False
-- ghci> esPositivo 4
-- True
-- ghci> esPositivo (-2)
-- False

--- 3 ---
-- esVocal :: Char -> Bool, que verifica si un caracter es una vocal en minuscula

esVocal :: Char -> Bool
esVocal x = x `elem` "aeiou"

--- EJEMPLOS ---

-- ghci> esVocal 'a'
-- True
-- ghci> esVocal 'e'
-- True
-- ghci> esVocal 'E'
-- False
-- ghci> esVocal 'b'
-- False

--- 4 ---
-- valorAbsoluto :: Int -> Int, que devuelve el valor absoluto de un entero ingresado

valorAbsoluto :: Int -> Int
valorAbsoluto x | (x >= 0) = x
                | (x < 0) = -x

--- EJEMPLOS ---

-- ghci> valorAbsoluto (-4)
-- 4
-- ghci> valorAbsoluto 4
-- 4

------ EJERCICIO 2 ------
-- Implementa en Haskell las funciones definidas en el ejercicio anterior

--- A ---
-- paratodo :: [Bool] -> Bool, que verifica que todos los elementos de una lista sean True

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs 

--- EJEMPLOS ---

-- ghci> paratodo [True, True, True]
-- True
-- ghci> paratodo [True, True, False]
-- False

--- B ---
-- sumatoria :: [Int] -> Int, que calcula la suma de todos los elementos de una lista de enteros

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--- EJEMPLOS ---

-- ghci> sumatoria [2,3,4]
-- 9
-- ghci> sumatoria [2,3,(-5)]
-- 0

--- C ---
-- productoria :: [Int] -> Int, que calcula el producto de todos los elementos de la lista de enteros

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

--- EJEMPLOS ---

-- ghci> productoria [1,2,3]
-- 6
-- ghci> productoria [3,3,3]
-- 27

--- D ---
-- factorial :: Int -> Int, que toma un numero n y calcula n!

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

--- EJEMPLOS ---

-- ghci> factorial 5
-- 120
-- ghci> factorial 3
-- 6

--- E ---
-- Utiliza la funcion sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de numeros no vacia y calcula el valor promedio

promedio :: [Int] -> Int
promedio (x:xs) = div (sumatoria xs) (length xs)

--- EJEMPLOS ---

-- ghci> promedio [7,9,8]
-- 8
-- ghci> promedio [5,2,9,7]
-- 6

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


------ 5A ------
-- xs = [-5,-3,4,8]
--- 4A ---

-- ghci> todosMayoresQueCero [(-5),(-3),4,8]
-- False

--- 4B ---
-- x = 5

-- ghci> existeElemento 5 [(-5),(-3),4,8]
-- False

--- 4D ---

-- ghci> todosIgualesConsecutivos [(-5),(-3),4,8]
-- False

------ 5B ------
-- xs = [11,2,5,8]
--- 4A ---

-- ghci> todosMayoresQueCero [11,2,5,8]
-- True

--- 4B ---
-- x = 5

-- ghci> existeElemento 5 [11,2,5,8]
-- True

--- 4D ---

-- ghci> todosIgualesConsecutivos [11,2,5,8]
-- False

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

--- 8A ---

-- ghci> factorial' 5
-- 120

--- 8B ---

-- ghci> promedio [6,9,3,9,8]
-- 7

--- 8C ---

-- ghci> maxMenorQueMin [(-3),9,8] [6,7,8]
-- False

--- 8D ---

-- ghci> esPrimo 5
-- True

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

--- EJEMPLOS ---

-- ghci> esMaximo 5 [2,3,7]
-- False
-- ghci> esMaximo 5 [2,3,5]
-- True

--- 12C ---

-- auxiliar esPar
esPar :: Int -> Bool
esPar x = (mod x 2 == 0)

productoPares :: [Int] -> Int
productoPares xs = productoria [x | x <- xs, esPar x]

--- EJEMPLOS ---

-- ghci> productoPares [3,2,4,7]
-- 8
-- ghci> productoPares [3,5,7,2]
-- 2

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

------ EJERCICIO 8 ------

-- ghci> paratodo' [0,0,0,0] esCero 
-- True
-- ghci> paratodo' [0,0,1,0] esCero 
-- False
-- ghci> paratodo' "hola" esVocal  
-- False
-- ghci> existe [0,0,1,0] esCero 
-- True
-- ghci> existe "hola" esVocal  
-- True
-- ghci> existe "tnt" esVocal  
-- False


------ EJERCICIO 9 ------
-- Utilizando las funciones del laboratorio 7, programa las siguientes funciones por composicion, sin usar recursion ni analisis por casos

--- A ---
-- -todosPares :: [Int] -> Bool, verifica que todos los numeros de una lista sean pares

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs esPar

--- EJEMPLOS ---

-- ghci> todosPares [2,4,8,6]
-- True
-- ghci> todosPares [2,4,8,7]
-- False

--- B ---
-- hayMultiplo :: Int -> [Int] -> Bool, verifica si existe algun numero dentro del segundo parametro que sea multiplo del primer parametro

-- auxiliar esMultiplo
esMultiplo :: Int -> Int -> Bool
esMultiplo x y = (mod y x == 0)

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo x xs = existe xs (esMultiplo x)

--- EJEMPLOS ---

-- ghci> hayMultiplo 5 [3,5,4]
-- True
-- ghci> hayMultiplo 5 [3,7,4]
-- False

--- C ---
-- sumaCuadrados :: Int -> Int, dado un numero no negativo n, calcula la suma de los primeros n cuadrados

sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [0..x-1] (^2)

--- EJEMPLOS ---

-- ghci> sumaCuadrados 3
-- 5
-- ghci> sumaCuadrados 2
-- 1
-- ghci> sumaCuadrados 4
-- 14

--- D ---
-- Programa la funcion existeDivisor' :: Int -> [Int] -> Bool, que dado un entero n y una lista ls devuelve True si y solo si existe algun elemento en ls que divida a n

-- auxiliar esDivisor
esDivisor :: Int -> Int -> Bool
esDivisor n x = n `mod` x == 0

existeDivisor' :: Int -> [Int] -> Bool
existeDivisor' n ls = existe ls (esDivisor n)

--- EJEMPLOS ---

-- ghci> existeDivisor' 2 [1,2,3,4]
-- True
-- ghci> existeDivisor' 3 [2,4,8,6]
-- False

--- E ---
-- Utilizando la funcion del apartado anterior defini esPrimo' :: Int -> Bool, que dado un entero n devuelve True si y solo si n es primo

esPrimo' :: Int -> Bool
esPrimo' n = not (existeDivisor' n [2..(n-1)] || (n<1))

--- EJEMPLOS ---

-- ghci> esPrimo' 17
-- True
-- ghci> esPrimo' 25
-- False

--- F ---
-- ¿Se te ocurre como redefinir factorial para evitar usar recursion?

factorial'' :: Int -> Int
factorial'' x = productoria' [1..x] id

--- EJEMPLOS ---

-- ghci> factorial'' 5
-- 120
-- ghci> factorial'' 3
-- 6

--- G ---
-- Progamar la funcion multiplicaPrimos :: [Int] -> Int que calcula el produto de todos los numeros primos de una lista

-- auxiliar listaPrimos
listaPrimos :: [Int] -> [Int]
listaPrimos [] = []
listaPrimos (x:xs)  | esPrimo' x = x : listaPrimos xs
                    | otherwise = listaPrimos xs

multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria' (listaPrimos xs) id 

--- EJEMPLOS ---

-- ghci> multiplicaPrimos [2,3,4,6,8]
-- 6
-- ghci> multiplicaPrimos [15,17,20]
-- 17

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

--- EJEMPLOS ---
-- Primeros 20 numeros de fib: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1.597, 2.584, 4.181, 6.765

-- ghci> fib 20
-- 6765

-- ghci> listaFibInv 20
-- [6765,4181,2584,1597,987,610,377,233,144,89,55,34,21,13,8,5,3,2,1,1,0]

-- ghci> esFib 17
-- False
-- ghci> esFib 377
-- True

--- I ---
-- Utilizando la funcion del apartado anterior, defini la funcion todosFib :: [Int] -> Bool que dada una lista xs de enteros, devuelva si todos los elementos de la lista pertenecen a la sucesion de Fibonacci

todosFib :: [Int] -> Bool
todosFib xs = paratodo' xs esFib

--- EJEMPLOS ---

-- ghci> todosFib [0,1,17,377]
-- False
-- ghci> todosFib [0,1,13,377]
-- True

------ EJERCICIO 10 ------
-- Implementa en Haskell las funciones definidas en el ejercicio anterior

--- 9A ---
--Usando recursion
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = x * 2 : duplica xs

--- EJEMPLOS ---

-- ghci> duplica [1,2,3,4]
-- [2,4,6,8]
-- ghci> duplica [5,6,7,8]
-- [10,12,14,16]

--- 9B --- 
-- Usando la funcion map

duplica' :: [Int] -> [Int]
duplica' xs = map (*2) xs

--- EJEMPLOS ---

-- ghci> duplica' [1,2,3,4]
-- [2,4,6,8]
-- ghci> duplica' [5,6,7,8]
-- [10,12,14,16]

------ EJERCICIO 11 ------
-- Programa una funcion que dada una lista de numeros xs, calcula una lista que tiene como elementos aquellos numeros de xs que son primos

--- A ---
-- Definila usando recursion

sonPrimos :: [Int] -> [Int]
sonPrimos [] = []
sonPrimos (x:xs)    | esPrimo' x = x : sonPrimos xs
                    | otherwise = sonPrimos xs

--- EJEMPLOS ---

-- ghci> sonPrimos [1,2,3,4]
-- [1,2,3]
-- ghci> sonPrimos [4,5,6,7]
-- [5,7]

--- B ---
-- Definila utilizando la funcion filter

sonPrimos' :: [Int] -> [Int]
sonPrimos' xs = filter esPrimo' xs

--- EJEMPLOS ---

-- ghci> sonPrimos' [1,2,3,4]
-- [1,2,3]
-- ghci> sonPrimos' [4,5,6,7]
-- [5,7]

--- C ---
-- Revisa tu definicion del ejercicio 6g. ¿Como podes mejorarla?

multiplicaPrimos' :: [Int] -> Int
multiplicaPrimos' xs = productoria' (filter esPrimo' xs) id 

--- EJEMPLOS ---

-- ghci> multiplicaPrimos' [1,2,3,4]
-- 6
-- ghci> multiplicaPrimos' [4,5,6,7]
-- 35

------ EJERCICIO 12 ------
-- La funcion primIgualesA toma un valor y una lista, y calcula el tramo inicial mas largo de lista cuyos elementos son iguales a ese valor

--- A ---
-- Programa primIgualesA por recursion

primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA _ [] = []
primIgualesA n (x:xs)   | n == x = x : primIgualesA n xs
                        | otherwise = []

--- EJEMPLOS ---

-- ghci> primIgualesA 'e' "eaaee"
-- "e"
-- ghci> primIgualesA 'e' "eegge"
-- "ee"

--- B ---
-- Programa nuevamente la funcion utilizando takeWhile

primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (==n) xs 

--- EJEMPLOS ---

-- ghci> primIgualesA' 3 [3,3,3,5,3]
-- [3,3,3]
-- ghci> primIgualesA' 3 [3,5,5,5,3]
-- [3]

------ EJERCICIO 13 ------
-- La funcion primIguales toma una lista y devuelve el mayor tramo inicial de la lista cuyos elementos son todos iguales entre si

--- A ---
-- Programa primIguales por recursion

primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:y:xs)    | x == y = x : primIguales (y:xs)
                        | otherwise = [x]

--- EJEMPLOS ---

-- ghci> primIguales "llla"
-- "lll"
-- ghci> primIguales [3,4,3,3]
-- [3]

--- B ---
-- Usa cualquier version de primIgualesA para programar primIguales. Esta permitido dividir en casos, pero no usar recursion.

primIguales' :: Eq a => [a] -> [a]
primIguales' [] = []
primIguales' (x:xs) = primIgualesA' x (x:xs)

--- EJEMPLOS ---

-- ghci> primIguales' [3,4,3,3]
-- [3]
-- ghci> primIguales' "llla"
-- "lll"

------ EJERCICIO 14 (*) ------

------ EJERCICIO 15 (*) ------
