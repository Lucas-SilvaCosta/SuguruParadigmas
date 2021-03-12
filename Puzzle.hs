module Puzzle (tamanho, principal, grupos) where
{-Esse arquivo é utilizados para inserir o puzzle

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

-}

--Tamanho no puzzle
tamanho :: Int
tamanho = 3

--Matriz com os números presentes no puzzle
--0 representa a casa vazia
principal :: [[Int]]
principal = [[0, 3, 4],
             [0, 5, 0],
             [0, 0, 0]]

--Representação das áreas do puzzle
--Mais informações no relatório
grupos :: [[Int]]
grupos = [[1, 1, 2],
          [1, 2, 2],
          [2, 2, 3]]