module Suguru (matrizToLinha, getGrupo, tamGrupo, colocar, pegaPos) where

import Puzzle

matrizToLinha :: [[Int]] -> [Int]
matrizToLinha [] = []
matrizToLinha (h:t) = h ++ (matrizToLinha t)


numGrupos :: Int
numGrupos = maximum (matrizToLinha grupos)

getGrupo :: Int -> [Int]-> [Int]
getGrupo x [] = []
getGrupo x l
    | x > numGrupos = []
    | (x == (head l)) = (matrizToLinha principal) !! (length (matrizToLinha principal) - length  l) : getGrupo x (tail l)
    | otherwise = getGrupo x (tail l)

tamGrupo :: Int -> [Int] -> Int
tamGrupo _ [] = 0
tamGrupo x l
    | (x == (head l)) = 1 + tamGrupo x (tail l)
    | otherwise = tamGrupo x (tail l)

colocar :: Int -> Int -> [Int]
colocar x pos = take pos (matrizToLinha principal) ++ [x] ++ drop (pos+1) (matrizToLinha principal)

pegaPos :: Int -> [Int] -> Int
pegaPos _ [] = 0
pegaPos x l = l !! x 