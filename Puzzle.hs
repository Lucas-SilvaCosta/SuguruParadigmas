module Puzzle (tamanho, principal, grupos) where
--Esse arquivo é utilizados para inserir o puzzle
{-
--Tamanho no puzzle
tamanho :: Int
tamanho = 6

--Matriz com os números presentes no puzzle
--0 representa a casa vazia
principal :: [[Int]]
principal = [[0, 3, 4, 0, 0, 2],
             [0, 5, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 3],
             [0, 1, 0, 0, 0, 0],
             [0, 0, 0, 0, 0, 0],
             [0, 0, 0, 4, 0, 0]]

--Representação das áreas do puzzle
--Mais informações no relatório
grupos :: [[Int]]
grupos = [[1, 1, 1, 2, 2, 2],
          [3, 1, 1, 4, 4, 5],
          [3, 3, 6, 6, 4, 4],
          [7, 3, 3, 6, 6, 4],
          [7, 7, 7, 7, 6, 8],
          [9, 9, 8, 8, 8, 8]]

solucao :: [Int]
solucao = take (tamanho * tamanho) (repeat 0)
-}


--Tamanho no puzzle
tamanho :: Int
tamanho = 10

--Matriz com os números presentes no puzzle
--0 representa a casa vazia
principal :: [[Int]]
principal = [[4, 0, 3, 6, 0, 0, 0, 0, 3, 1],
             [0, 1, 0, 5, 2, 0, 0, 0, 0, 0],
             [2, 4, 6, 0, 0, 3, 0, 2, 0, 5],
             [0, 1, 0, 7, 0, 0, 5, 0, 1, 0],
             [5, 0, 0, 0, 1, 7, 0, 7, 0, 5],
             [0, 0, 0, 0, 3, 0, 2, 0, 6, 0],
             [0, 0, 3, 0, 1, 6, 0, 7, 0, 4],
             [4, 1, 6, 0, 5, 0, 0, 0, 5, 2],
             [6, 0, 0, 0, 0, 1, 0, 0, 0, 0],
             [0, 4, 5, 2, 3, 0, 5, 0, 0, 3]]

--Representação das áreas do puzzle
--Cada grupo recebe uma numeração única e todas as casas dentro dele
--recebem esse valor
grupos :: [[Int]]
grupos = [[ 1,  1,  2,  2,  2,  2,  3,  3,  4,  4],
          [ 1,  1,  2,  2,  3,  3,  3,  4,  4,  4], 
          [ 1,  5,  5,  5,  5,  6,  6,  6,  7,  4],
          [ 1,  8,  8,  9,  5,  5,  6,  6,  7,  7],
          [10, 11,  8,  9,  9,  5,  9,  6,  6, 12],
          [10, 11,  8, 13,  9,  9,  9, 12, 12, 12],
          [10, 11,  8, 13, 13, 14, 14, 14, 12, 12],
          [10, 10, 10, 10, 13, 13, 15, 14, 14, 16],
          [17, 17, 17, 17, 17, 18, 15, 15, 14, 16],
          [19, 17, 17, 18, 18, 18, 15, 15, 14, 16]]
