{-# LANGUAGE NPlusKPatterns #-}

------ EJERCICIO 1 ------
-- Programá las siguientes funciones:

--- A ---
-- esCero :: Int -> Bool, que verifica si un numero entero es igual a 0

esCero :: Int -> Bool
esCero x = (x == 0)

-- Ejemplos:
--  ghci> esCero 2
-- False
-- ghci > esCero 0
-- True

--- B ---
-- esPositivo :: Int -> Bool, que verifica si un enteero es estrictamente mayor a 0

esPositivo :: Int -> Bool
esPositivo x = x > 0

-- Ejemplos:
-- ghci > esPositivo 2
-- True
-- ghci > esPositivo (-4)
-- Falseghci > esPositivo 0
-- False

--- C ---
-- esVocal :: Char -> Bool, que verifica si un caracter es una vocal en minúscula

esVocal :: Char -> Bool
esVocal x = (x == 'a') || (x == 'e') || (x == 'i') || (x == 'o') || (x == 'u')

-- Ejemplos:
-- ghci > esVocal 'a'
-- True
-- ghci > esVocal 'e'
-- True
-- ghci > esVocal 'i'
-- True
-- ghci > esVocal 'o'
-- True
-- ghci > esVocal 'u'
-- True
-- ghci > esVocal 't'
-- False
-- ghci > esVocal 'b'
-- False

--- D ---
-- valorAbsoluto :: Int -> Int, que devuelve el valor absoluto de un entero ingresado

valorAbsoluto :: Int -> Int
valorAbsoluto x
  | x >= 0 = x
  | x < 0 = -x

-- Ejemplos:
-- ghci> valorAbsoluto 4
-- 4
-- ghci> valorAbsoluto (-4)
-- 4
-- ghci> valorAbsoluto 0
-- 0

------ EJERCICIO 2 ------
-- Programá las siguientes funciones usando recursión o composición:

--- A ---
-- paratodo :: [Bool] -> Bool, que verifica que todos los elementos de una lista sean True

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x : xs) = x && paratodo xs

-- Ejemplos:
-- ghci > paratodo [False, True, False]
-- False
-- ghci > paratodo [True, True, True]
-- True
-- ghci > paratodo [False, False, False]
-- False

--- B ---
-- sumatoria :: [Int] -> Int, que calcula la suma de todos los elementos de una lista de enteros

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x : xs) = x + sumatoria xs

-- Ejemplos:
-- ghci > sumatoria [3, 4, 5]
-- 12
-- ghci > sumatoria [7, 7, 7]
-- 21
-- ghci > sumatoria [23, (-1)]
-- 22

--- C ---
-- productoria :: [Int] -> Int, que calcula el producto de todos los elementos de la lista de enteros

productoria :: [Int] -> Int
productoria [] = 1
productoria (x : xs) = x * productoria xs

-- Ejemplos:
-- ghci> productoria [1,2,3,4]
-- 24
-- ghci> productoria [0,2,3,4]
-- 0
-- ghci> productoria [2,3,(-4)]
-- -24

--- D ---
--  factorial :: Int -> Int, que toma un número n y calcula n!

factorial :: Int -> Int
factorial 0 = 1
factorial 1 = 1
factorial n = n * factorial (n - 1)

-- Ejemplos:
-- ghci > factorial 5
-- 120
-- ghci > factorial 4
-- 24
-- ghci > factorial 6
-- 720
-- ghci > factorial 0
-- 1
-- ghci > factorial 1
-- 1

--- E ---
-- Utilizá la función sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de números no vacia y calcula el valor promedio (truncado, usando division entera)

promedio :: [Int] -> Int
promedio (x : xs) = div (sumatoria xs) (length xs)

-- Ejemplos:
-- ghci> promedio [7,6,10]
-- 8
-- ghci> promedio [6,6,10]
-- 8
-- ghci> promedio [7,6,6]
-- 6

------ EJERCICIO 3 ------
-- Programá la función pertenece :: Int -> [Int] -> Bool, que verifica si un número se encuentra en una lista

pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x : xs) = (n == x) || pertenece n xs

-- Ejemplos:
-- ghci> pertenece 4 [1,2,3,4]
-- True
-- ghci> pertenece 4 [1,2,3]
-- False

------ EJERCICIO 4 ------
-- Programá las siguientes funciones que implementan los cuantificadores generales. Notá que el segundo parametro de cada función, es otra función

--- A ---
-- paratodo' :: [a] -> (a -> Bool) -> Bool, dada una lista de xs de tipo [a] y un predicado t :: a -> Bool, determina si todos los elementos de xs satisface el predicado t

paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo' [] t = True
paratodo' (x : xs) t = t x && paratodo' xs t

-- Ejemplos:
-- ghci > paratodo' [1, 2, 3, (-4)] esPositivo
-- False
-- ghci > paratodo' [1, 2, 3] esPositivo
-- True

--- B ---
-- existe' :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un predicado t :: a -> Bool, determina si algun elemento de xs satisface el predicado t

existe' :: [a] -> (a -> Bool) -> Bool
existe' [] t = False
existe' (x : xs) t = t x || existe' xs t

-- Ejemplos:
-- ghci > existe' ['b', 'f', 'f'] esVocal
-- False
-- ghci > existe' ['b', 'f', 'a'] esVocal
-- True

--- C ---
-- sumatoria' :: [a] -> (a -> Int) -> Int, dada una lista xs de tipo [a] y una funcion t :: a -> Int (toma elementos de tipo a y devuelve enteros), calcula la suma de valores que resultan de la aplicaciòn de t a los elementos de xs

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x : xs) t = t x + sumatoria' xs t

-- Ejemplos:
-- ghci > sumatoria' [1, 2, 3, 4] factorial
-- 33

--- D ---
-- productoria' :: [a] -> (a -> Int) -> Int, dada una lista de xs de tipo [a] y una función t :: a -> Int, calcula el producto de los valores que resultan de la aplicacion de t a los elementos de xs

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x : xs) t = t x * productoria' xs t

-- Ejemplos:
-- ghci > productoria' [1, 2, 3, 4] factorial
-- 288
-- ghci > productoria' [0, 2, 3, 4] factorial
-- 288

------ EJERCICIO 5 ------
-- Definí nuevamente la funcion paratodo, pero esta vez usando la funcion paratodo' (sin recursion ni analisis por casos!)

paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs id

-- Ejemplos:
-- ghci > paratodo'' [True, False]
-- False
-- ghci > paratodo'' [True, True]
-- True
-- ghci > paratodo'' [False, False]
-- False

------ EJERCICIO 6 ------
-- Utilizando las funciones el ejercicio 4, programá las siguientes funciones por composición, sin usar recursión ni analisis por casos

--- A ---
-- - todosPares :: [Int] -> Bool, verifica que todos los números de una lista sean pares

-- Para resolver este ejercicio voy a necesitar hacer una función auxiliar llamada esPar :: Int -> Bool, dado un entero verifica si este es par o no, devuelve True cuando lo es y False cuando no

--- FUNCION AUXILIAR esPar ---
esPar :: Int -> Bool
esPar x = (mod x 2) == 0

-- Ejemplos de esPar para verificar que funcione correctamente: 
-- ghci > esPar 1
-- False
-- ghci > esPar 2
-- True
-- ghci > esPar 0
-- True

-- -todosPares- --

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs esPar

-- Ejemplos:
-- ghci > todosPares [1, 2, 3, 4]
-- False
-- ghci > todosPares [2, 4, 6, 8]
-- True

--- B ---
-- hayMultiplo :: Int -> [Int] -> Bool verifica si existe algún número dentro del segundo parametro que sea múltiplo del primer parametro

-- Para resolver este ejercicio voy a necesitar hacer una función auxiliar llamada esMultiplo :: Int -> Int -> Bool, dado dos enteros verifica si el segundo es multiplo del primero

--- FUNCION AUXILIAR esMultiplo ---
esMultiplo :: Int -> Int -> Bool
esMultiplo x y = mod x y == 0

-- Ejemplos de esMultiplo para verificar que funcione correcamente:
-- ghci > esMultiplo 25 5
-- True
-- ghci > esMultiplo 3 15
-- False
-- ghci > esMultiplo 15 3
-- True

-- hayMultiplo --
hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo n xs = existe' xs (esMultiplo n)  

-- Ejemplos: 
-- ghci > hayMultiplo 20 [3, 7, 5]
-- True
-- ghci > hayMultiplo 27 [2, 4, 6]
-- False
-- ghci > hayMultiplo 27 [2, 4, 9]
-- True

--- C ---
-- sumaCuadrados :: Int -> Int, dado un numero no negativo n, calcula la suma de los primeros cuadrados
-- Ayuda: En Haskell se puede escribir la lista que contiene el rango de números entre n y m como [n..m] 

sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [0..x] (^2)

-- Ejemplos:
-- ghci > sumaCuadrados 0
-- 0
-- ghci > sumaCuadrados 1
-- 1
-- ghci > sumaCuadrados 2
-- 5
-- ghci > sumaCuadrados 3
-- 14

--- D ---
-- Programar la funcion existeDivisor :: Int -> [Int] -> Bool, que dado un entero n y una lista ls, devuelve True si y solo si, existe algún elemento en ls que divida a n

-- Para resolver este ejercicio voy a necesitar hacer una función auxiliar llamada esDivisor :: Int -> Int -> Bool, dado dos enteros verifica si el segundo es divisor del primero

--- FUNCION AUXILIAR esDivisor ---
esDivisor :: Int -> Int -> Bool
esDivisor x y = mod x y == 0

-- Ejemplo para ver que funcione:
-- ghci > esDivisor 2 4
-- False
-- ghci > esDivisor 4 2
-- True
-- ghci > esDivisor 25 5
-- True

-- existeDivisor --
existeDivisor :: Int -> [Int] -> Bool
existeDivisor n ls = existe' ls (esDivisor n)

-- Ejemplos:
-- ghci > existeDivisor 4 [3, 5]
-- False
-- ghci > existeDivisor 15 [3, 5]
-- True

--- E ---
-- Utilizando la función del apartado antenior, defini la funcion esPrimo :: Int -> Bool, que dado un entero n, devuelve True si y solo n es primo
-- Ayuda: En Haskell se puede escribir la lista que contiene el rango de números entre n y m como [n..m]

esPrimo :: Int -> Bool
esPrimo n = not (existeDivisor n [2..(n-1)] || (n<1))

-- Ejemplos:
-- ghci > esPrimo 1
-- True
-- ghci > esPrimo 2
-- True
-- ghci > esPrimo 3
-- True
-- ghci > esPrimo 4
-- False
-- ghci > esPrimo 5
-- True
-- ghci > esPrimo 6
-- False

--- F ---
-- ¿Se te ocurre como redefinir factorial para evitar usar recursión?

factorial' :: Int -> Int
factorial' x = productoria' [1..x] id

-- Ejemplos:
-- ghci > factorial' 3
-- 6
-- ghci > factorial' 5
-- 120

--- G ---
-- Programar la funcion multiplicaPrimos :: [Int] -> Int, que calcula el producto de todos los números primos de una lista

-- Para resolver este ejercicio voy a necesitar hacer una función auxiliar llamada listaDePrimos :: [Int] -> [Int], que dada una lista de números me devuelve otra lista que contenga solo los que son primos de la primera

--- FUNCION AUXILIAR listaDePrimos ---
listaDePrimos :: [Int] -> [Int]
listaDePrimos [] = []
listaDePrimos (x:xs)  | esPrimo x = x : listaDePrimos xs 
                      | otherwise = listaDePrimos xs 

-- Ejemplos para ver que funciona correctamente:
-- ghci > listaDePrimos [1, 2, 3, 4, 5, 6]
-- [1, 2, 3, 5]
-- ghci > listaDePrimos [4, 6, 8, 9, 7]
-- [7]

-- multiplicaPrimos --
multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria' (listaDePrimos xs) id 

-- Ejemplos:
-- ghci > multiplicaPrimos [1, 3, 5, 6]
-- 15
-- ghci > multiplicaPrimos [1, 3, 2, 7, 9]
-- 42

--- H ---
-- Programar la funcion esFib :: Int -> Bool, que dado un entero n, devuelve True si y solo si n está en la suceción de Fibonnacci
-- Ayuda: Realizar una función auxiliar fib :: Int -> Int, que dado un n devuelva el n-esimo elemento de la suceción

--- FUNCION AUXILIAR fib ---
fib :: Int -> Int
fib n | n <= 1 = n
      | otherwise = fib(n-1) + fib(n-2)

-- Ejemplos probando que la función funcione correctamente:
-- ghci > fib 2
-- 1
-- ghci > fib 4
-- 3
-- ghci > fib 5
-- 5
-- ghci > fib 20
-- 6765

-- Para encontrar la solución a este problema voy a necesitar crear otra función auxiliar llamada listaFib :: Int -> [Int], que genere una lista de los primeros n elementos de la sucesión (en orden inverso y que incluye al 0)

listaFib :: Int -> [Int]
listaFib 0 = [0]
listaFib 1 = [1, 0]
listaFib 2 = [1, 1, 0]
listaFib n = fib n : listaFib (n-1)

-- Ejemplos para verificar que funcione correctamente:
-- ghci > listaFib 3
-- [2, 1, 1, 0]
-- ghci > listaFib 5
-- [5, 3, 2, 1, 1, 0]
-- ghci > listaFib 7
-- [13, 8, 5, 3, 2, 1, 1, 0]
-- ghci > listaFib 9
-- [34, 21, 13, 8, 5, 3, 2, 1, 1, 0]
-- ghci > listaFib 10
-- [55, 34, 21, 13, 8, 5, 3, 2, 1, 1, 0]
-- ghci > listaFib 20
-- [6765, 4181, 2584, 1597, 987, 610, 377, 233, 144, 89, 55, 34, 21, 13, 8, 5, 3, 2, 1, 1, 0]

-- esFib --
esFib :: Int -> Bool
esFib t = existe' (listaFib 20) (==t) -- Limito la función a 20 números por una cuestion de recursos de la computadora

-- Ejemplos:
-- ghci > esFib 4
-- False
-- ghci > esFib 10
-- False
-- ghci > esFib 13
-- True
-- ghci > esFib 144
-- True

--- I ---
-- Utilizando la función del apartado anterior, defini la función todosFib :: [Int] -> Bool que dada una lista de xs de enteros, devuelva si todos los elementos de la lista pertenecen (o no) a la sucesión de Fibonnaci

todosFib :: [Int] -> Bool
todosFib xs = paratodo' xs esFib

-- Ejemplos:
-- ghci > todosFib [0, 1, 2, 3, 5]
-- True
-- ghci > todosFib [0, 1, 2, 4, 10]
-- False

------ EJERCICIO 7 ------
-- Indagar en Hoogle sobre las funciones map y filter. Tambien podemos consultar su tipo en ghci con el comando :t

-- ¿Qué hacen estas funciones?

-- map :: (a -> b) -> [a] -> [b]
-- Esta función se utiliza para aplicar una función dada a cada elemento de una lsta y devuelve una lista con los resultados de aplicar esa función a cada elemento

-- filter :: (a -> Bool) -> [a] -> [a]
-- La función filter se utiliza para filtar elementos de una lista basandose en una condición. Toma una lista y un predicado como argumentos y devuelve una lista nueva que contiene solo los elementos para los cuales ese predicado es verdadero

-- ¿A qué equivale la expresión map succ [1, -4, 6, 2, -8], donde succ n = n+1?
-- Lo que me está diciendo la expresión es que aplique succ a la lista [1, -4, 6, 2, -8], succ le suma 1 a mi elemento, entonces la expresión será equivalente a [2, -3, 7, 3, -9]

-- ¿Y la expresión filter esPositivo [1, -4, 6, 2, -8]?
-- Lo que me está pidiendo la expresión es que filtre los numeros positivos, lo que me devuelve la lista [1, 6, 2]

------ EJERCICIO 8 ------
-- Programá una función que dada una lista de numers xs, devuelve la lista que resulta de duplicar cada valor de xs

--- A ---
-- Definila usando recursion
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = x*2 : duplica xs 

-- Ejemplos:
-- ghci > duplica [1, 2, 3, 4]
-- [2, 4, 6, 8]
-- ghci > duplica [5, 8, 2]
-- [10, 16, 4]

--- B ---
-- Definila utilizando la función map
duplica' :: [Int] -> [Int]
duplica' xs = map (*2) xs 

-- Ejemplos:
-- ghci > duplica' [9, 2, 6]
-- [18, 4, 12]
-- ghci > duplica' [0, 53, 6]
-- [0, 106, 12]

------ EJERCICIO 9 ------
-- Programá una función que dadda una lista de numeros xs, calcula una lista que tiene como elementos aquellos numeros de xs que son primos

--- A ---
-- Definila usando recursion
sonPrimos :: [Int] -> [Int]
sonPrimos [] = []
sonPrimos (x:xs)  | esPrimo x = x : sonPrimos xs
                  | otherwise = sonPrimos xs 

-- Ejemplos:
-- ghci > sonPrimos [1, 4, 8, 3]
-- [1, 3]
-- ghci > sonPrimos [1, 4, 8, 3, 7, 2]
-- [1, 3, 7, 2]

--- B --- 
-- Definila utilizando la funcion filter
sonPrimos' :: [Int] -> [Int]
sonPrimos' xs = filter esPrimo xs

-- Ejemplos:
-- ghci > sonPrimos' [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
-- [1, 2, 3, 5, 7]
-- ghci > sonPrimos' [11, 12, 13, 14, 15]
-- [11, 13]

--- C ---
-- Revisá tu definicion del ejercicio 6g ¿Se puede mejorar?
multiplicaPrimos' :: [Int] -> Int
multiplicaPrimos' xs = productoria' (filter esPrimo xs) id

-- Ejemplos:
-- ghci > multiplicaPrimos' [1, 2, 3, 4, 5, 6, 7, 8, 9]
-- 210
-- ghci > multiplicaPrimos' [11, 12, 13, 14]
-- 143

------ EJERCICIO 10 ------
-- La función primIgualesA toma un valor y una lista, y calcula el tramo inicial más largo de la lista cuyos elementos son iguales a ese valor. Por ejemplo:

-- primIgualesA 3 [3,3,4,1] = [3,3]
-- primIgualesA 3 [4,3,3,4,1] = []
-- primIgualesA 3 [] = []
-- primIgualesA 'a' "aaadaa" = "aaa"

--- A ---
-- Programá primIgualesA por recursión
primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA _ [] = []
primIgualesA n (x:xs) | n==x = x : primIgualesA n xs
                      | otherwise = []

-- Ejemplos:
-- ghci > primIgualesA 'a' "aaargeentiinaa"
-- "aaa"
-- ghci > primIgualesA 3 [3, 3, 3, 3, 3, 4, 5, 3, 3, 3, 3]
-- [3, 3, 3, 3, 3]

--- B ---
-- Programá nuevamente la funcion utilizando takeWhile
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (==n) xs 

-- Ejemplos:
-- ghci > primIgualesA' 'v' "vvaaacaaccvvv"
-- "vv"
-- ghci > primIgualesA' 5 [5, 5, 6, 7, 8, 6, 5, 5, 5]
-- [5, 5]

------ EJERCICIO 11 ------
-- La funcion primIguales toma una lista y devuelve el mayor tramo inicial de la lista cuyos elementos son todos iguales entre si, Por ejemplo:
-- primIguales [3,3,4,1] = [3,3]
-- primIguales [4,3,3,4,1] = [4]
-- primIguales [] = []
-- primIguales "aaada" = "aaa"

--- A ---
-- Programá primIguales por recursión
primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales (x:y:xs)  | x==y = x : primIguales (y:xs)
                      | otherwise = [x]

-- Ejemplos:
-- ghci > primIguales "aaargeentiinaaa"
-- "aaa"
-- ghci > primIguales [3, 4, 5, 3, 3]
-- [3]

--- B ---
-- Usá cualquier version de primIgualesA para programar primIuguales. Esta permitido dividir en casos, pero no usar recursion
primIguales' :: Eq a => [a] -> [a]
primIguales' [] = []
primIguales' (x:xs) = primIgualesA' x (x:xs)

-- Ejemplos:
-- ghci> primIguales' "aargentina"
-- "aa"
-- ghci> primIguales' [3,3,2,1,2,3]
-- [3,3]