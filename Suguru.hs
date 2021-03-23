module Suguru (matrizToLinha, getGrupo, tamGrupo, pegaPos, pegaPosMatriz, pegaPosMatrizLinha, mostraMatriz) where
{-
 - Esse arquivo foi implementado como a representação do puzzle para o resto do programa.
 - Nele são implemetadas funções que representam a forma como uma pessoa leria o puzzle enquanto o soluciona,
 - por exemplo: forcar em um grupo(getGrupo), contar o tamanho máximo de um grupo(tamGrupo), etc..
 - Também são implementadas funções que servem especificamente pra trazer representações mais úteis para o
 - próprio programa.
-}

import Puzzle

--Transforma uma matriz de tipo Int em uma lista do mesmo tipo
matrizToLinha :: [[Int]] -> [Int]
matrizToLinha [] = []
matrizToLinha (h:t) = h ++ (matrizToLinha t)

--Conta o número de grupos existente no puzzle
--Basicamente o maior valor na matriz de grupos
numGrupos :: Int
numGrupos = maximum (matrizToLinha grupos)

--Recebe a numeração única de um grupo, a matriz de grupos e a base dos dados
--e retorna os números presentes no grupo especificado
--Por que a base? Durante o cód. de solução nasceu a necessidade da busca dos
--dados de um grupo apartir de uma lista diferente da principal
getGrupo :: Int -> [Int]-> [Int] -> [Int]
getGrupo x [] base = []
getGrupo x l base
    | x > numGrupos = []
    | (x == (head l)) = base !! (length base - length  l) : getGrupo x (tail l) base
    | otherwise = getGrupo x (tail l) base

--Recebe a numeração única de um grupo e a matriz de grupos e retorna o seu tamanho
--Poderia ter sido implementada como length de getGrupo.., mas preferimos esse modelo
tamGrupo :: Int -> [Int] -> Int
tamGrupo _ [] = 0
tamGrupo x l
    | (x == (head l)) = 1 + tamGrupo x (tail l)
    | otherwise = tamGrupo x (tail l)

--Recebe uma posição e uma lista e retorna o valor naquela posição
pegaPos :: Int -> [Int] -> Int
pegaPos _ [] = 0
pegaPos x l = l !! x 

--Descontinuada--
--Recebe as informações de linha e coluna e retorna o valor nessa posição da matriz principal
--Substituita pela pegaPosMatrizLinha - facilita a utilização já que lê de qualquer lista
--que represente uma matriz
pegaPosMatriz :: Int -> Int -> Int
pegaPosMatriz row col 
    | row >= tamanho || col >= tamanho || row < 0 || col < 0 = -1
    | otherwise = principal !! row !! col

--Recebe uma lista que representa uma matriz, informações de linha e coluna, e retorna o valor
--naquela posição, interpretando a lista como uma matriz
--Por que retorna -1 caso outOfRange? Essa solução nos facilitou na hora de checar a vizinhança,
--elas representam a vizinhança imaginária que estaria fora do puzzle, e não atrapalham na comparação já que
--nenhum valor da solução será -1, assim não precisamos fazer checagens de vizinhança específicas para
--os números na borda do puzzle.
pegaPosMatrizLinha :: [Int] -> Int -> Int -> Int
pegaPosMatrizLinha matriz row col
    | row >= tamanho || col >= tamanho || row < 0 || col < 0 = -1
    | otherwise = matriz !! ((row*tamanho)+col)

--Recebe uma linha que representa uma matriz e retorna uma String que representa
--a forma de sua representação para ser exposta ao usuário
mostraMatriz :: [Int] -> Int -> String
mostraMatriz [] _ = ""
mostraMatriz (h:t) aux
    | aux `mod` tamanho == 0 = "\n" ++ show h ++ " " ++ mostraMatriz t (aux + 1)
    | otherwise = show h ++ " " ++ mostraMatriz t (aux + 1)