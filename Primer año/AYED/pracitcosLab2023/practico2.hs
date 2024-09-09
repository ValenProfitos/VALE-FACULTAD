------EJERCICIO 1------
-- Tipos enumerados

---A---
-- Implementá el tipo Carrera
data Carrera = Matematica | Fisica | Computacion | Astronomia

---B---
--Definí la siguiente función, usando pattern matching: titulo :: Carrera -> String que devuelve el nombre completo de la carrera en forma de string.

titulo :: Carrera -> String
titulo Matematica  = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"

-- titulo Computacion = "Licenciatura en Computacion"
-- titulo Fisica = "Licenciatura en Fisica"

---C---
--Para escribir música se utiliza la denominada notación musical, la cual consta de notas. Además estas pueden presentar algún modificador sostenido o bemol. Definí el tipo NotaBasica con constructores Do, Re, Mi, Fa, Sol, La, Si

data NotaBasica = Do | Re | Mi | Fa | Sol | La | Si deriving (Eq,Ord,Bounded,Show) 

---D---
--El sistema de notación musical anglosajón, también conocimo como cifrado americano, relaciona las notas básicas con letras de la A a la G. Programar usando pattern matching la función: cifradoAmericano :: NotaBasica -> Char

cifradoAmericano :: NotaBasica -> Char
cifradoAmericano Do = 'C'
cifradoAmericano Re = 'D'
cifradoAmericano Mi = 'E'
cifradoAmericano Fa = 'F'
cifradoAmericano Sol = 'G'
cifradoAmericano La = 'A'
cifradoAmericano Si = 'B'

-- cifradoAmericano La = 'A'
-- cifradoAmericano Re = 'D'

------EJERCICIO 2------
--Clases de tipos

---A---
-- Completar la definicion del tipo NotaBasica 

-- Preferí aplicar directamente el deriving en mi definición original

------EJERCICIO 3------
-- Polimorfismo ad hoc

---A---
-- Definir usando polimorfismo ad hoc la función minimoELemento que calcula (de manera recursiva) cuál es el menor valor de una lista tipo [a]. Asegurarse que sólo esté definida para listas no vacías

minimoElemento :: Ord a => [a] -> a
minimoElemento [x] = x
minimoElemento (x:xs) = min x (minimoElemento xs)

-- minimoElemento ['f','a','m'] = 'a'
-- minimoElemento [123,456,12] = 12
-- minimoElemento [Fa,Sol,Si] = Fa

---B---
-- Definir la función minimoElemento' de manera tal que el caso base de la recursión sea el de lista vacía. Para ello rvisar la clase Bounded

minimoElemento' :: (Ord a, Bounded a) => [a] -> a
minimoElemento' [] = maxBound
minimoElemento' (x:xs) = min x (minimoElemento' xs)

-- minimoElemento' ([3,12,4,2]::[Int]) = 2
-- minimoElemento' ([]::[Bool]) = True

---C---
-- Usar la función minimoElemento para determinar la nota más grave de la melodia [Fa, La, Sol, Re, Fa]

-- minimoElemento [Fa,La,Sol,Re,Fa] = Re

------EJERCICIO 4------
--Sinónimo de tipos; constructores con parámetros

---A---
-- Implementá el tipo Deportista y todos sus tipos accesorios (NumCamiseta, Altura, Zona, etc)

type Altura = Int
type NumCamiseta = Int

data Zona = Arco | Defensa | MedioCampo | Delantera deriving Show
data TipoReves = DosManos | UnaMano deriving Show
data Modalidad = Carretera | Pista | Monte | BMX deriving Show
data PiernaHabil = Izquierda | Derecha deriving Show

type ManoHabil = PiernaHabil

data Deportista =    Ajedrecista
                    |Ciclista Modalidad
                    |Velocista Altura
                    |Tenista TipoReves ManoHabil Altura
                    |Futbolista Zona NumCamiseta PiernaHabil Altura 
                    deriving Show

---B---
-- ¿Cuál es el tipo de constructor Ciclista?

-- :t Ciclista = Ciclista :: Modalidad -> Deportista

---C---
-- Programá la función contar_velocistas :: [Deportista] -> Int que dada una lista de deportistas xs, devuelve la cantidad de velocistas que hay dentro de xs. Programar contar_velocistas sin usar igualdad, utilizando pattern matching

---FUNCION AUXILIAR---
-- creo una función auxiliar que me devuelve True cuando un Deportista es Velocista
esVelocista :: Deportista -> Bool
esVelocista (Velocista _) = True
esVelocista _ = False

contar_velocistas :: [Deportista] -> Int
contar_velocistas [] = 0
contar_velocistas (x:xs) |esVelocista x = 1 + contar_velocistas xs
                         |otherwise = contar_velocistas xs

-- contar_velocistas [Ciclista Pista, Velocista 180, Ajedrecista, Velocista 140] = 2
-- contar_velocistas [Tenista DosManos Derecha 184, Futbolista Arco 23 Izquierda 197, Velocista 173] = 1

---D---
-- Programá la función contar_futbolistas :: [Deportista] -> Zona -> Int que dada una lista de deportistas xs, y una zona z, devuelve la cantidad de futbolistas que juegan en la zona z. No usar igualdad solo pattern Matching

---FUNCION AUXILIAR---
-- creo una función que me compare zonas
compararZonas :: Zona -> Zona -> Bool
compararZonas Arco Arco = True
compararZonas Defensa Defensa = True
compararZonas MedioCampo MedioCampo = True
compararZonas Delantera Delantera = True
compararZonas _ _ = False

contar_futbolistas :: [Deportista] -> Zona -> Int
contar_futbolistas [] _ = 0
contar_futbolistas (Futbolista z' _ _ _ :xs) z | compararZonas z' z = 1 + contar_futbolistas xs z 
contar_futbolistas (_:xs) z = contar_futbolistas xs z 

-- contar_futbolistas [Futbolista Arco 13 Izquierda 176, Futbolista Delantera 34 Derecha 187, Futbolista Arco 21 Derecha 187] Arco = 2 
-- contar_futbolistas [Futbolista Arco 13 Izquierda 176, Futbolista Delantera 34 Derecha 187, Futbolista Arco 21 Derecha 187] Delantera = 1

---E---
-- ¿La función anterior usa filter? Si no es así, reprogramala para usarla

---FUNCION AUXILIAR---
--creo una función que verifica si un deporista juega en una zona especifica

esFutEnZona :: Deportista -> Zona -> Bool
esFutEnZona (Futbolista z _ _ _) zona = compararZonas z zona
esFutEnZona _ _ = False

contar_futbolistas' :: [Deportista] -> Zona -> Int
contar_futbolistas' deportistas zona = length (filter (`esFutEnZona` zona) deportistas)

-- contar_futbolistas'  [Futbolista Arco 10 Izquierda 180, Futbolista Delantera 7 Derecha 175, Futbolista Defensa 5 Derecha 182, Futbolista Arco 1 Izquierda 190, Futbolista MedioCampo 8 Derecha 170] Arco = 2

-- contar_futbolistas'  [Futbolista Delantera 13 Derecha 183, Futbolista Delantera 9 Izquierda 190, Futbolista Defensa 12 Derecha 168, Futbolista MedioCampo 8 Derecha 170] Arco = 0

------EJERCICIO 5------
--Definición de clases 

---A---
--Implementá la función sonidoNatural

sonidoNatural :: NotaBasica -> Int
sonidoNatural Do = 0
sonidoNatural Re = 2
sonidoNatural Mi = 4
sonidoNatural Fa = 5
sonidoNatural Sol = 7
sonidoNatural La = 9
sonidoNatural Si = 11

---B---
--Definir el tipo enumerado Alteracion que consta de los constructores Bemol, Natural y Sostenido

data Alteracion = Bemol | Natural | Sostenido deriving (Eq, Ord)

---C---
--Definir el tipo algebraico NotaMusical que debe tenr un solo constructor que llamaremos Nota el cual toma dos parámetros. El primer parámetro es de tipo NotaBasica y el segundo de tipo Alteracion. De esta manera cuando se quiera representar una nota alterada se puede usar como segundo parámetro del constructor un Bemol o Sostenido y si se quiere representar una nota sin alteraciones se usa Natural como segundo parámetro

data NotaMusical = Nota NotaBasica Alteracion deriving (Eq, Ord)

---C---
--Definí la función sonidoCromatico :: NotaMusical -> Int que devuelve el sonido de una nota, incrementando en uno su valor si tiene la alteración Sostenido, decrementando en uno si tiene la alteración Bemol y dejando su valor intacto si la alteración es Natural
--`mod` 12 porque trabajamos desde el 0 al 11 (12 números)

sonidoCromatico :: NotaMusical -> Int
sonidoCromatico (Nota nota Natural) = sonidoNatural nota
sonidoCromatico (Nota nota Bemol) = (sonidoNatural nota - 1) `mod` 12
sonidoCromatico (Nota nota Sostenido) = (sonidoNatural nota + 1) `mod` 12

--notaDoBemol = Nota Do Bemol
--sonidoCromatico notaDoBemol = 11
--notaFaSostenido = Nota Fa Sostenido
-- sonidoCromatico notaFaSostenido = 6
--notaMiNatural = Nota Mi Natural
--sonidoCromatico notaMiNatural = 4

---E---
--Incluí el tipo NotaMusical a la clase Eq de manera tal que dos notas que tengan el mismo valor de sonidoCromatico se consideren iguales

--Preferí aplicar deriving en mi definición original. También me pedía que se lo agrege a Alteracion, así que así lo hice

--doNat = Nota Do Natural
--reSos = Nota Re Sostenido
--faBemol = Nota Fa Bemol
--laNat = Nota La Natural

-- doNat == doNat = True
-- reSos == faBemol = False

---F---
--Incluí el tipo NotaMusical a la clase Ord definiendo el operador <=. Se debe definir que una nota es menor o igual a la otra si y sólo si el valor de sonidoCromatico para la primera es menor o igual al valor de sonidoCromatico para la segunda

--faBemol <= reSos = False
--laNat < doNat = True

--Preferí aplicar deriving en mi definición original. También me pedía que se lo agrege a Alteracion, así que así lo hice

------EJERCICIO 6------
--Tipos enumerados con polimorfismo

---A---
primerElemento :: [a] -> Maybe a 
primerElemento [] = Nothing
primerElemento (x:_) = Just x 

-- primerElemento [] = Nothing
-- primerElemento [3,4,5] = 3

------EJERCICIO 7------
--Tipos recursivos

data Cola = VaciaC | Encolada Deportista Cola deriving Show

---A---
--Programá las siguientes funciones

--1--
-- atender :: Cola -> Maybe Cola, que elimina de la cola a la persona que está en la primer posición de una cola, por haber sido atendida. Si la cola está vacía, devuelve Nothing

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada a b) = Just b

-- colaVacia = VaciaC
-- atender colaVacia = Nothing
-- dep1 = Futbolista Arco 10 Izquierda 180
-- dep 2 = Futbolista Delantera 7 Derecha 175
-- colaConGente = Encolada dep1 (Encolada dep2 colaVacia)
--atender colaConGente = Just (Encolada (Futbolista Delantera 7 Derecha 175) VaciaC)

--2--
-- encolar :: Deportista -> Cola -> Cola, que agrega una persona a la cola de deportistas, en la última posición

encolar :: Deportista -> Cola -> Cola 
encolar a VaciaC = Encolada a VaciaC
encolar a (Encolada a' c) = Encolada a'(encolar a c)

-- colaVacia = VaciaC
-- dep1 = Futbolista Arco 10 Izquierda 180
-- dep2 = Futbolista Delantera 7 Derecha 175
-- coladep1 = encolar dep1 colaVacia
-- encolar dep2 coladep1
-- Encolada (Futbolista Arco 10 Izquierda 180) =(Encolada (Futbolista Delantera 7 Derecha 175) VaciaC)

--3--
-- busca :: Cola -> Zona -> Maybe Deportista, que devuelve el/la primer futbolista dentro de la cola que juega en la zona que se corresponde con el segundo parámetro. Si no hay futbolistas jugando en esa zona devuelve Nothing

busca :: Cola -> Zona -> Maybe Deportista
busca VaciaC _ = Nothing
busca (Encolada a b) zona | esFutEnZona a zona = Just a
                                       | otherwise = busca b zona


-- dep3 = Futbolista Defensa 5 Derecha 182
-- coladep1y2 = encolar dep2 coladep1
-- coladeps = encolar dep3 coladep1y2 
-- busca coladeps Arco = Just (Futbolista Arco 10 Izquierda 180)


---B---
-- ¿A qué otro tipo se parece Cola?
-- Cola se parece a una Lista 

------EJERCICIO 8------
--Tipos recursivos y polimórficos

data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b) deriving Show

type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String

---A---
-- ¿Cómo se debe instanciar el tipo ListaAsoc para representar la información almacenada en una guía telefónica?

type GuiaTelefonica = ListaAsoc String Int 

---B---
--Programá las siguientes funciones:

--1--
-- la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una lista

la_long :: ListaAsoc a b -> Int
la_long (Vacia) = 0
la_long (Nodo a b c) = 1 + la_long c 

--lista1 = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 Vacia)
--la_long lista1 = 2

--2--
-- la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b, que devuelve la concatenación de dos listas de asociaciones

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b 
la_concat Vacia c = c
la_concat (Nodo a b d) e = Nodo a b (la_concat d e)

--lista1 = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 Vacia)
--lista2 = Nodo "Gaston" 135792468 Vacia
--la_concat lista1 lista 2 = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 (Nodo "Gaston" 135792468 Vacia))

--3--
-- la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b, que agrega un nodo a la lista de asociaciones si la clave no está en la lista, o actualiza el valor si la clave ya se encontraba

la_agregar :: Eq a => ListaAsoc a b -> a -> b -> ListaAsoc a b 
la_agregar Vacia a b = (Nodo a b Vacia)
la_agregar (Nodo a b c) d e | a == d = Nodo a e c 
                            | otherwise = Nodo a b (la_agregar c d e)

--lista1 = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 Vacia)
--la_agregar lista1 "Luli" 3512320428 = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 (Nodo "Luli" 3512320428 Vacia))
--la_agregar lista1 "Lauti" 2143658709 = Nodo "Lauti" 2143658709 (Nodo "Valen" 987654321 Vacia)


--4--
-- la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asociaciones en una lista de pares clave-dato

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b c) = (a, b):la_pares c

--lista1 = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 Vacia)
--la_pares lista1 = [("Lauti",123456789),("Valen",987654321)]


--5--
-- la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista y una clave devuelve el dato asociado, si es que existe. En caso contrario devuelve Nothing

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia c = Nothing
la_busca (Nodo a b d) e |a == e = Just b
                        |otherwise = la_busca d e

--lista1 = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 Vacia)
--la_busca lista1 "Valen" = Just 987654321
--la_busca lista1 "Azul" = Nothing

--6--
-- la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada una clave a elimina la entrada en la lista

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b 
la_borrar a Vacia = Vacia
la_borrar a (Nodo b c d) | b == a = la_borrar a d
                         | b /= a = (Nodo b c (la_borrar a d))

--lista1 = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 Vacia)
--la_borrar "Lauti" lista1  = Nodo "Valen" 987654321 Vacia

--la_borrar "Gaston" lista1  = Nodo "Lauti" 123456789 (Nodo "Valen" 987654321 Vacia)

------EJERCICIO 9(*)------

data Arbol a = Hoja | Rama (Arbol a) a (Arbol a)

--Programá las siguientes funciones

---A---
--a_long :: Arbol a -> Int que dado un árbol devuelve la cantidad de datos almacenados.

a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama izq _ der) = 1 + a_long izq + a_long der

---B---
--a_hojas :: Arbol a -> Int que dado un árbol devuelve la cantidad de hojas.

a_hojas :: Arbol a -> Int
a_hojas Hoja = 1
a_hojas (Rama izq _ der) = a_hojas izq + a_hojas der

---C---
--a_inc :: Num a => Arbol a -> Arbol a que dado un árbol que contiene números, los incrementa en uno.

a_inc :: Num a => Arbol a -> Arbol a
a_inc Hoja = Hoja
a_inc (Rama izq valor der) = Rama (a_inc izq) (valor + 1) (a_inc der)

---D---
--a_map :: (a -> b) -> Arbol a -> Arbol b que dada una función y un árbol, devuelve el árbol con la misma estructura, que resulta de aplicar la función a cada uno de los elementos del árbol. Revisá la definición de la función anterior y reprogramala usando a_map.

a_map :: (a -> b) -> Arbol a -> Arbol b 
a_map _ Hoja = Hoja
a_map f (Rama izq valor der) = Rama (a_map f izq) (f valor) (a_map f der)

------EJERCICIO 10(*)------

--Programar los siguientes apartados:

---A---
--Definir el tipo recursivo ABB utilizando los constructores:
-- RamaABB :: ABB a -> a -> ABB a
-- VacioABB :: ABB a

data ABB a = RamaABB (ABB a) a (ABB a) | VacioABB

---B---
--Definir una función insertarABB que tome un valor y un árbol binario como entrada y devuelva un nuevo árbol que contenga el valor insertado en el árbol original. La función tiene que tener el siguiente tipado: insertarABB :: Ord a => a -> ABB a -> ABB a

insertarABB :: Ord a => a -> ABB a -> ABB a
insertarABB x VacioABB = RamaABB VacioABB x VacioABB
insertarABB x (RamaABB izq valor der)   
    | x < valor = RamaABB (insertarABB x izq) valor der
    | x > valor = RamaABB izq valor (insertarABB x der)
    | otherwise = RamaABB izq valor der

---C---
--Define una función llamada buscarEnArbol que tome un valor y un árbol binario como entrada y devuelva True si el valor está presente en el árbol y False en caso contrario.
--La función tiene que tener el siguiente tipado: buscarABB :: Eq a => a -> ABB a -> Bool

buscarABB :: Eq a => a -> ABB a -> Bool
buscarABB _ VacioABB = False
buscarABB x (RamaABB izq valor der)
    | x == valor = True
    | otherwise = buscarABB x izq || buscarABB x der

---D---
--Definir la función verificarABB que devuelve True si el árbol cumple con la propiedad fundamental o False en caso contrario. De manera auxiliar pueden definir las funciones:
--mayor_a_todos :: Ord a => a -> ABB a -> Bool
--menor_a_todos :: Ord a => a -> ABB a -> Bool
--Asegurarse que la función verificarABB devuelva False para los dos ejemplos mostrados.


---FUNCION AUXILIAR 1---
mayor_a_todos :: Ord a => a -> ABB a -> Bool
mayor_a_todos _ VacioABB =  True
mayor_a_todos x (RamaABB _ valor der) = x > valor && mayor_a_todos x der 

---FUNCION AUXILIAR 2---
menor_a_todos :: Ord a => a -> ABB a -> Bool
menor_a_todos _ VacioABB = True
menor_a_todos x (RamaABB izq valor _) = x < valor && menor_a_todos x izq 

verificarABB :: Ord a => ABB a -> Bool
verificarABB VacioABB = True
verificarABB (RamaABB izq valor der) = mayor_a_todos valor izq && menor_a_todos valor der && verificarABB izq && verificarABB der