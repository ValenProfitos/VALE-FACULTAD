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
paratodo (x:xs) = x && paratodo xs

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
sumatoria (x:xs) = x + sumatoria xs

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
productoria (x:xs) = x * productoria xs

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
factorial n = n * factorial (n -1)

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
promedio (x:xs) = div (sumatoria xs) (length xs)

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
pertenece x [] = True
pertenecce x (y:xs) =