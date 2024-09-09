------ EJERCICIO 1 ------

---A---
--esCero :: Int -> Bool, que verifica si un entero es igual a 0.
esCero :: Int -> Bool
esCero x = (x == 0)

-- esCero 2 = False
-- esCero 0 = True

---B---
--esPositivo :: Int -> Bool, que verifica si un entero es estrictamente mayor a 0.

esPositivo :: Int -> Bool
esPositivo x = (x > 0)

--esPositivo 4 = True
--esPositivo (-2) = False
--esPositivo 0 = False

---C---
--esVocal :: Char -> Bool, que verifica si un caracter es una vocal en minúscula.

esVocal :: Char -> Bool
esVocal x = (x == 'a') || (x == 'e') || (x == 'i') || (x == 'o') || (x == 'u')

--esVocal 'a' = True
--esVocal 'e' = True
--esVocal 'i' = True
--esVocal 'o' = True
--esVocal 'u' = True
--esVocal 'j' = False

---D---
--valorAbsoluto :: Int -> Int, que devuelve el valor absoluto de un entero ingresado

valorAbsoluto :: Int -> Int
valorAbsoluto x | (x >= 0) = x
                | (x < 0) = -x

--valorAbsoluto 3 = 3
--valorAbsoluto (-4) = 4
--valor Absoluto 0 = 0
--valorAbsoluto (-11) = 11

------ EJERCICIO 2 ------

---A---
--paratodo :: [Bool] -> Bool, que verifica que todos los elementos de una lista sean True.

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs) = x && paratodo xs

--paratodo [True,False,True] = False
--paratodo [True,True] = True

---B---
--sumatoria :: [Int] -> Int, que calcula la suma de todos los elementos de la lista de enteros.

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

--sumatoria [1, 5, -4] = 2
--sumatoria [-4, -5] = -9

---C---
--productoria :: [Int] -> Bool, que calcula el producto de todos los elementos de la lista de enteros.

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

--productoria [2, 4, 1] = 8
--productoria [2, 6, 0] = 0

---D---
--factorial :: Int -> Int, que toma un número n y calcula n!

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

--factorial 0 = 1
--factorial 5 = 120

---E---
--Utilizá la función sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de números no vacia y calcula el valor promedio(truncado, usando división entera).

promedio :: [Int] -> Int
promedio (x:xs) = div (sumatoria xs) (length xs)

--promedio [7,4,10] = 7
--promedio [6,8,10] = 9

------ EJERCICIO 3 ------
--Programá la función pertenece :: Int -> [Int] -> Bool, que verifica si un número se encuentra en una lista.

pertenece :: Int -> [Int] -> Bool
pertenece n [] = False
pertenece n (x:xs) = (n==x) || pertenece n xs

--pertenece 4 [2,4,6] = True
--pertenece 6 [2,4,6] = True
--pertenece 7 [2,4,6] = False

------ EJERCICIO 4 ------ 
--Programá las siguientes funciones que implemetan los cuantificadores generales. Notá que el segundo parámetro de cada función, es otra función!

---A---
--paratodo' :: [a] -> (a -> Bool) -> Bool, dada una lista de xs de tipo [a] y un predicado t :: [a] -> Bool, determina si todos los elementos de xs satisfacen el predicado de t.

paratodo' :: [a] -> (a->Bool) -> Bool
paratodo' [] t = True
paratodo' (x:xs) t = t x && paratodo' xs t

--paratodo' [0,0,0,0] esCero = True
--paratodo' "aeiouf" esVocal = False

---B---
--existe' :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un predicado t :: a -> Bool, determina si algún elemento de xs satisface el predicado t.

existe' :: [a] -> (a->Bool) -> Bool
existe' [] t = False
existe' (x:xs) t = t x || existe' xs t

--existe' "dfghjartyk" esVocal = True
--existe' [-1, -2, -4, -8] esPositivo = False

---C---
--sumatoria' :: [a] -> (a -> Int) -> Int, dada una lista de xs de tipo [a] y una función t :: a -> Int (toma elementos de tipo a y devuelve enteros), calcula la suma de los valores que resultan de la aplicación de t a los elementos de xs.

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] t = 0
sumatoria' (x:xs) t = t x + sumatoria' xs t

---D---
--productoria' :: [a] -> (a -> Int) -> Int, dada una lista de xs de tipo [a] y un función  t :: a -> Int, calcula el producto de los valores que resultan de la aplicación de t a los elementos de xs

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] t = 1
productoria' (x:xs) t = t x * productoria' xs t

------EJERCICIO 5-----
--Definí nuevamente la función paratodo, pero esta vez usando la función paratodo' (sin recursión ni análisis por casos!)

paratodo'' :: [Bool] -> Bool
paratodo'' xs = paratodo' xs id

------EJERCICIO 6 ------
--Utilizando las funciones del ejercicio 4, programá las siguientes funciones por composición, sin usar recursión ni análisis por casos.

---A---
-- - todosPares :: [Int] -> Bool verifica que todos los números de una lista sean pares

---FUNCIÓN AUXILIAR---
-- creo una función auxiliar que me determine cuando un elemnto es par
esPar :: Int -> Bool
esPar x = (mod x 2 == 0)

todosPares :: [Int] -> Bool 
todosPares xs = paratodo' xs esPar

-- - todosPares [2,4,6,8] = True
-- - todosPares [2,3,4] = False

---B---
-- hayMultiplo :: Int -> [Int] -> Bool verifica si existe algún número dentro del segundo parametro que sea multiplo del primer parámetro.

---FUNCION AUXILIAR---
-- creo una función auxiliar que me indique cuando un número es múltiplo de otro
esMultiplo :: Int -> Int -> Bool
esMultiplo m n = (mod n m == 0)

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo g xs = existe' xs (esMultiplo g)

-- hayMultiplo 20 [3,7,5] = True
-- hayMultiplo 21 [2,4,5] = False

---C---
--sumaCuadrados :: Int -> Int, dado un número no negativo n, calcula la suma de los primeros n cuadrados.

sumaCuadrados :: Int -> Int
sumaCuadrados x = sumatoria' [0..x] (^2)

-- sumaCuadrados 4 = 30 
-- sumaCuadrados 6 = 91

---D---
--Programar la función existeDivisor :: Int -> [Int] -> Bool, que dado un entero n y una lista ls, devuelve True si y solo si, exite algún elemento en ls que divida a n

---FUNCIÓN AUXILIAR---
--- creo una función auxiliar que me indique cuando un número es divisor de otro
esDivisor :: Int -> Int -> Bool
esDivisor n x = n `mod` x == 0

existeDivisor :: Int -> [Int] -> Bool
existeDivisor n ls = existe' ls (esDivisor n)

-- existeDivisor 2 [1,2,3,4] = True
-- existeDivisor 35 [2,3,4,6] = False

---E------
--Utilizando la función del apartado anterior, definí la función esPrimo :: Int -> Bool, que dado un entero n, devuelve True si y solo si n es primo

esPrimo :: Int -> Bool
esPrimo n = not (existeDivisor n [2..(n-1)] || (n<1)) 

-- esPrimo 17 = True
-- esPrimo 25 = False

---F---
-- ¿Se te ocurre como redefinir factorial (ej. 2d) para evitar usar recursión?

factorial' :: Int -> Int
factorial' x = productoria'[1..x] id

-- factorial' 5 = 120
-- factorial' 7 = 5040

---G---
--Programar la función multiplicaPrimos :: [Int] -> Int que calcula el producto de todos los números primos de una lista

---FUNCIÓN AUXILIAR---
-- creo una función que tome una lista de números y me devuelva otra lista con los números que son primos

listaPrimos :: [Int] -> [Int]
listaPrimos [] = []
listaPrimos (x:xs) | esPrimo x = x : listaPrimos xs
                   | otherwise = listaPrimos xs

multiplicaPrimos :: [Int] -> Int
multiplicaPrimos xs = productoria' (listaPrimos xs) id

-- multiplicaPrimos [1,2,3,4] = 6
-- multiplicaPrimos [1,3,4,6,8] = 3

---H---
--Programar la función esFib :: Int -> Bool, que dado un entero n, devuelve True si y solo si n esta en la sucesión de fibonacci

---FUNCION AUXILIAR---
-- creo una función auxiliar que me devuelva el n-ésimo elemento de la sucesión
fib :: Int -> Int 
fib n   | (n<= 1) = n
        | otherwise = fib(n-1) + fib(n-2)      

---FUNCION AUXILIAR 2---
-- creo otra función auxiliar que genera una lista de los primeros n elementos de la sucesión (en orden inverso, e incluye el 0)

listaFib :: Int -> [Int]
listaFib 0 = [0]
listaFib 1 = [1, 0]
listaFib 2 = [1, 1, 0]
listaFib n = fib n : listaFib (n-1)

esFib :: Int -> Bool
esFib t = existe' (listaFib 20) (==t) --Limito la función a 20 numeros porque la computadora tiene recursos limitados de memoria y tiempos de procesamiento, de esta manera limitarla garantiza que la función se ejecute de manera eficiente y segura.

-- esFib 144 = True 
-- esFib 4 = False 

---I---
--Utilizando la función del apartado anterior, definir la función todosFib :: [Int] -> Bool que dada una lista xs de enteros, devuelva si todos los elementos de la lista pertenecen (o no) a la sucesión de Fibonacci

todosFib :: [Int] -> Bool
todosFib xs = paratodo' xs esFib

-- - todosFib [1,2,3,5,8] = True
-- - todosFib [1,2,3,4] = False

------EJERCICIO 7------
--Indagá en Hoogle sobre las funciones map y filter.

-- ¿Qué hacen estas funciones?

--map :: (a -> b) -> [a] -> [b] 
-- Esta función se utiliza para aplicar una función dada a cada elemento de una lista y devuelve una lista con los resultados de aplicar esa función a cada elemento. 

--filter :: (a -> Bool) -> [a] -> [a] 
-- La funcion filter se utiliza para filtar elementos de una lista basandose en una condición. Toma una lista y un predicado como argumentos y devuelve una lista nueva que contiene solo los elementos para los cuales ese predicado es verdadero

-- ¿A qué equivale la expresion map succ [1, -4, 6, 2, -8] donde succ n = n + 1?

-- Lo que me esta diciendo la expresion es que aplique succ a la lista [1, -4, 6, 2, -8], succ le suma 1 a mi elemento, entonces la expresion seria equivalente a [2, -3, 7, 3, -7].

-- ¿y la expresión filter esPositivo [1, -4, 6, 2, -8]?

-- Acá la expresión me esta pidiendo que filtre los números positivos, lo que me devuelve la lista [1, 6, 2]

------EJERCICIO 8------
--Programá una función que dada una lista de números xs, devuelve la lista que resulta de duplicar cada valor de xs.

---A---
--Usando recursion
duplica :: [Int] -> [Int]
duplica [] = []
duplica (x:xs) = x*2 : duplica xs

-- duplica [1,2,3,4] = [2,4,6,8]
-- duplica [12,22,35] = [24,44,70] 

---B---
--Usando map

duplica' :: [Int] -> [Int]
duplica' xs = map (*2) xs

-- duplica' [5,6,7,8] = [10,12,14,16]
-- duplica' [11,45,78] = [22,90,156]

------EJERCICIO 9------
--Programá una función que dada una lista de números xs, calcula una lista que tiene como elementos aquellos números de xs que son primos

---A---
--Usando recursion

sonPrimos :: [Int] -> [Int]
sonPrimos [] = []
sonPrimos (x:xs)        | esPrimo x = x : sonPrimos xs
                        | otherwise = sonPrimos xs

-- sonPrimos [1,2,3,4] = [1,2,3]
-- sonPrimos [4,5,6,7] = [5,7]

---B---
--Usando Filter
sonPrimos' :: [Int] -> [Int]
sonPrimos' xs = filter esPrimo xs

-- sonPrimos' [4,6,8,10] = []
-- sonPrimos' [1,6,8,4,3] = [1,3]

---C---
--Revisá tu definición del ejercicio 6g ¿Cómo podes mejorarla?

multiplicaPrimos' :: [Int] -> Int
multiplicaPrimos' xs = productoria' (filter esPrimo xs) id

-- multiplicaPrimos' [1,2,3,4] = 6
-- multiplicaPrimos' [4,6,8,5] = 5

------EJERCICIO 10------
--La función primIgualesA toma un valor y una lista, y calcula el tramo inicial más largo de la lista cuyos elementos son iguales a ese valor

---A---
--Por recursion

primIgualesA :: Eq a => a -> [a] -> [a]
primIgualesA _ [] = []
primIgualesA n (x:xs)   |n==x = x : primIgualesA n xs
                        | otherwise = []

-- primIgualesA 'e' "eeeje" = "eee"
-- primIgualesA 3 [3,4,4,3] = [3]

---B---
--Utilizando takeWhile
primIgualesA' :: Eq a => a -> [a] -> [a]
primIgualesA' n xs = takeWhile (==n) xs 

-- primIgualesA' 'a' "aaaddaa" = "aaa"
-- primIgualesA' 4 [4,4,4,5] = [4,4,4]

------EJERCICIO 11------
--La función primIguales toma una lista y devuelve el mayor tramo inicial de la lista cuyos elementos son todos iguales entre si. 

---A---
--Por recursion

primIguales :: Eq a => [a] -> [a]
primIguales [] = []
primIguales [x] = [x]
primIguales (x:y:xs)    |x == y = x : primIguales (y:xs)
                        |otherwise = [x]

-- primIguales "lllaaa" = "lll"
-- primIguals [1,1,2,3,1] = [1,1,1]

---B---
--Usando primIgualesA

primIguales' :: Eq a => [a] -> [a]
primIguales' [] = []
primIguales' (x:xs) = primIgualesA' x (x:xs)

-- primIguales' "eeeje" = "eee"
-- primIguales' [True, True, False] = [True,True]

------EJERCICIO 12(*)------
--Definí de manera recursiva la función cuantGen (denota la cuantificación generalizada)
--recibe de argumentos un operador, su elemento neutro, una lista xs y un termino t

cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
cuantGen _ z [] _ = z
cuantGen op z (x:xs) t = t x `op` cuantGen op z xs t 

--Reescribir todas las funciones de; punto 4 utilizando el cuantGen

paratodo''' :: [a] -> (a -> Bool) -> Bool
paratodo''' xs t = cuantGen (&&) True xs t 

existe'' :: [a] -> (a -> Bool) -> Bool
existe'' xs t = cuantGen (||) False xs t 

sumatoria'' :: [a] -> (a -> Int) -> Int
sumatoria'' xs t = cuantGen (+) 0 xs t 

productoria'' :: [a] -> (a -> Int) -> Int
productoria'' xs t = cuantGen (*) 1 xs t 

------EJERCICIO 13(*)------
--Definir una función que se denomina distancia d edición. Que toma como entrada dos strings. distanciaEdicion :: [Char] -> [Char] -> Int. La función distancia Edicion se comporta: Si alguna de las listas es vacía devuelve la longitud de la otra lista. Si las dos listas son no vacías x:xs e y:ys, compara los primeros elementos de cada lista: si x==y no suma y sigue computando la distancia para xs e ys. Si x/=y, suma 1 y sigue computando la distancia para xs e ys.

distanciaEdicion :: [Char] -> [Char] -> Int
distanciaEdicion [] ys = length ys
distanciaEdicion xs [] = length xs
distanciaEdicion (x:xs) (y:ys)  | x==y = distanciaEdicion xs ys
                                |otherwise = 1 + distanciaEdicion xs ys

------EJERCICIO 14(*)------
--Definí una función primeros que cumplen, priQueCumplen :: [a] -> (a -> Bool) -> [a] tal que, dada una lista ls y un predicado p, devuelve el tramo inicial de ls que cumplen p

priQueCumplen :: [a] -> (a -> Bool) -> [a]
priQueCumplen [] _ = []
priQueCumplen (x:xs) p  | p x = x : priQueCumplen xs p
                        | otherwise = []
