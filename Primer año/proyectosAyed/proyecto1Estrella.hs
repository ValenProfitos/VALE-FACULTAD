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

-- Para resolver este ejercicio voy a necesitar hacer una función auxiliar llamada alCuadrado :: Int -> Int, que dado un entero me devuelve el cuadrado del mismo, es decir, multiplicado por si mismo

--- FUNCION AUXILIAR alCuadrado ---
alCuadrado :: Int -> Int
alCuadrado x = x * x

-- Ejemplos para saber que funciona correctamente
--

--- D ---
-- Programar la funcion existeDivisor :: Int -> [Int] -> Bool, que dado un entero n y una lista ls, devuelve True si y solo si, existe algún elemento en ls que divida a n

--- E ---
-- Utilizando la función del apartado antenior, defini la funcion esPrimo :: Int -> Bool, que dado un entero n, devuelve True si y solo n es primo
-- Ayuda: En Haskell se puede escribir la lista que contiene el rango de números entre n y m como [n..m]

--- F ---
-- ¿Se te ocurre como redefinir factorial para evitar usar recursión?

--- G ---
-- Programar la funcion multiplicaPrimos :: [Int] -> Int, que calcula el producto de todos los números primos de una lista

--- H ---
-- Programar la funcion esFib :: Int -> Bool, que dado un entero n, devuelve True si y solo si n está en la suceción de Fibonnacci
-- Ayuda: Realizar una función auxiliar fib :: Int -> Int, que dado un n devuelva el n-esimo elemento de la suceción

--- I ---
-- Utilizando la función del apartado anterior, defini la función todosFib :: [Int] -> Bool que dada una lista de xs de enteros, devuelva si todos los elementos de la lista pertenecen (o no) a la sucesión de Fibonnaci

------ EJERCICIO 7 ------
-- Indagar en Hoogle sobre las funciones map y filter. Tambien podemos consultar su tipo en ghci con el comando :t
-- ¿Qué hacen estas funciones?
-- ¿A qué equivale la expresión map succ [1, -4, 6, 2, -8], donde succ n = n+1?
-- ¿Y la expresión filter esPositivo [1, -4, 6, 2, -8]?

------ EJERCICIO 8 ------
-- Programá una función que dada una lista de numers xs, devuelve la lista que resulta de duplicar cada valor de xs

--- A ---
-- Definila usando recursion

--- B ---
-- Definila utilizando la función map

------ EJERCICIO 9 ------
-- Programá una función que dadda una lista de numeros xs, calcula una lista que tiene como elementos aquellos numeros de xs que son primos

--- A ---
-- Definila usando recursion

--- B --- 
-- Definila utilizando la funcion filter

--- C ---
-- Revisá tu definicion del ejercicio 6g ¿Se puede mejorar?

------ EJERCICIO 10 ------
-- La función primIgualesA toma un valor y una lista, y calcula el tramo inicial más largo de la lista cuyos elementos son iguales a ese valor. Por ejemplo:

-- primIgualesA 3 [3,3,4,1] = [3,3]
-- primIgualesA 3 [4,3,3,4,1] = []
-- primIgualesA 3 [] = []
-- primIgualesA 'a' "aaadaa" = "aaa"

--- A ---
-- Programá primIgualesA por recursión

--- B ---
-- Programá nuevamente la funcion utilizando takeWhile

------ EJERCICIO 11 ------
-- La funcion primIguales toma una lista y devuelve el mayor tramo inicial de la lista cuyos elementos son todos iguales entre si, Por ejemplo:
-- primIguales [3,3,4,1] = [3,3]
-- primIguales [4,3,3,4,1] = [4]
-- primIguales [] = []
-- primIguales "aaada" = "aaa"

--- A ---
-- Programá primIguales por recursión

--- B ---
-- Usá cualquier version de primIgualesA para programar primIuguales. Esta permitido dividir en casos, pero no usar recursion

------ EJERCICIO 12 * ------
-- Todas las funciones del ejercicio 4 son similares entre sí:cada una aplica la función termino t a todos los elementos de una lista, y luego aplica algún operador entre todos ellos, obteniendose así el resultado final. Para el caso de la lista vacía, se devuelve el elemento neutro. De esa maera cada una de ellas computa una cuantificacion sobre los elementos de la lista transformador por t:
-- paratodo’.xs.t = ⟨ ∀ i : 0 ≤ i < #xs : t.xs!i ⟩
-- existe’.xs.t = ⟨ ∃ i : 0 ≤ i < #xs : t.xs!i ⟩
-- sumatoria’.xs.t = ⟨ Σ i : 0 ≤ i < #xs : t.xs!i ⟩
-- productoria’.xs.t = ⟨ Π i : 0 ≤ i < #xs : t.xs!i ⟩

-- Por ejemplo, para sumatoria' el operador asociado al cuantificador ∑ es la suma (+), por lo que
-- sumatoria' [1,2,3] t = (t 1) + (t 2) + (t 3) + 0
-- donde el calculo consisitio en aplicar t a cada elemento, combinandolos con el operador (+) hasta llegar a la lista vacía donde se devuelve el neutro de la suma (0). Guíandote por las observaciones anterirores, definí de manera recursiva la funcion cuantGen (denota la cuantificacion generalizanda):
-- cuantGen :: (b -> b -> b) -> b -> [a] -> (a -> b) -> b
-- cuantaGen op z xs t = ...

-- que tomando como argunento un operador op, su elemento neutro z, una lista de elementos xs y una funcion término t, aplica el operador a los elementos de la lista, transformados por la función término. En otras palabras sea ⊕ un cuantificador cualquiera y ⊗ su operador asociado,
-- cuantaGen.⊗.z.xs.t = ⟨ ⊕ ⅈ : 0 ⋜ ⅈ < #xs: t.(xs!ⅈ) ⟩

-- Reescribir todas las funciones del punto 4 utilizando el cuantificador generalizado (sin utilizar induccion y en una linea por función)

------  EJERCICIO 13 * ------
-- Definir una funcion que se denomina distanciad e edición. Que toma como entrada dos strings (lista de caracteres). distanciaEdicion :: [Char] -> [Char] -> Int. La funcion distanciaEdicion, se comporta de la siguiente manera: -Si alguna de las listas es vacía, devuelve la longitud de la otra lista. -Si las dos listas son no vacias x:xs e y:ys,comprara los primeros elementos de cada lista:
-- Si x == y, no suma y sigue computando la distancia para xs e ys
-- Si x != y, suma 1 y sigue computando la distancia para xs e ys

------ EJERCICIO 14 * ------
-- Definí una funcion primeros que cumplen, primQueCumplen::[a] -> (a->Bool) -> [a], tal que, dada una lista ls y un predicado p, devuelve el tramo inicial de ls que cumple p

------ EJERCICIO 15 * ------
-- Para cada uno de los siguientes patrones, decidí si están bien tipados, en tal caso dá los tipos de cada subexpresión. En caso de estar bien tipado, ¿el patron cubre todos los casos por definición?

--- A ---
-- f :: (a, b) -> ..
-- f (x, y) = ...

--- B ---
-- f :: [(a,b)] -> ...
-- f (a,b) = ...

--- C ---
-- f :: [(a,b)]- > ...
-- f (x:xs) = ...

--- D ---
-- f :: [(a,b)] -> ...
-- f ((x,y) : ((a,b) : xs)) = ...

--- E ---
-- f :: [(Int,a)] -> ...
-- f [(0,a)] = ...

--- F ---
-- f :: [(Int, a)] -> ...
-- f ((x,1) : xs) = ...

--- G ---
-- f :: (Int -> Int) -> Int -> ...
-- f a b = ...

--- H ---
-- f :: (Int -> Int) -> Int -> ...
-- f a 3 = ...

--- I ---
-- f :: (Int -> Int) -> Int -> ...
-- f 0 1 2 = ...

------ EJERCICIO 16 * ------
-- Para las siguientes declaraciones de funciones, da al menos una definición cuando sea posible. ¿Podés dar alguna otra definición alternativa a la que diste en cada caso?
-- Por ejemplo, si la declaracion de f :: (a,b) -> a, la respuesta es: f (x,y) = x

--- A ---
-- f :: (a,b) -> b

--- B ---
-- f :: (a,b) -> c

--- C ---
-- f :: (a -> b) -> a -> b

--- D ---
-- f :: (a -> b) -> [a] -> [b]