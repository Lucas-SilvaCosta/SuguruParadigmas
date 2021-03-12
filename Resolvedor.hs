module Resolvedor(geraPossibilidadeBase, fazerBase) where

import Suguru
import Puzzle

geraPossibilidadeBase :: Int -> [Int]
geraPossibilidadeBase x
    | (pegaPos x (matrizToLinha principal)) /= 0 = [(pegaPos x (matrizToLinha principal))] 
    | otherwise = [1 .. (tamGrupo (pegaPos x (matrizToLinha grupos)) (matrizToLinha grupos))]

fazerBase :: Int -> [[Int]]
fazerBase x
    | (x < ((length (matrizToLinha principal))-1)) = [geraPossibilidadeBase x] ++ fazerBase (x+1)
    | otherwise = [geraPossibilidadeBase x]