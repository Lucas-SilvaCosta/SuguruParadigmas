module Resolvedor(ultimoEspacoVazio, checarVizinhos, checarGrupo, backtrack, juntaMatriz, Back(Init, Val, Put)) where
{- Esse arquivo faz a solução do puzzle, mais infromações sobre o método de solução no relatório -}
import Data.Maybe
import Suguru
import Puzzle

--Recebe uma lista que representa uma matriz (provavelmente a principal) e um número que representa
--uma posição e vai dessa posição até o inicio até encontrar um 0
--Essa função serve para o backtracking saber para onde deve voltar, antes dela ele voltava
--uma posição para trás mas caso essa posição fosse um número já fornecido no puzzle
--ele iria avançar automaticamente forçando o programa a ficar preso em loop
ultimoEspacoVazio :: [Int] -> Int -> Int
ultimoEspacoVazio l x
    | x <= 0 = (-1)
    | (l !! (x-1)) == 0 = (x-1)
    | otherwise = ultimoEspacoVazio l (x - 1)

--Recebe um número para verificar sua presença nos arredores, informações de linha e coluna
--para o meio e a matriz em forma de linha onde será feita a verificação
--Aqui fica evidente a implementação do -1 em pegaPosMatrizLinha, o número para comparação
--nunca será -1
checarVizinhos :: Int -> Int -> Int -> [Int] -> Bool
checarVizinhos number row col matriz
    | pegaPosMatrizLinha matriz (row - 1) (col - 1) == number ||
     pegaPosMatrizLinha matriz (row - 1) col == number ||
      pegaPosMatrizLinha matriz (row - 1) (col + 1) == number ||
       pegaPosMatrizLinha matriz row (col - 1) == number ||
        pegaPosMatrizLinha matriz row (col + 1) == number ||
        pegaPosMatrizLinha matriz (row + 1) (col - 1) == number ||
        pegaPosMatrizLinha matriz (row + 1) col  == number ||
        pegaPosMatrizLinha matriz (row + 1) (col + 1) == number = False
    | otherwise = True

--Recebe um número e uma lista do grupo, e verifica a presença desse número no grupo
checarGrupo ::  Int -> [Int] -> Bool
checarGrupo _ [] = True
checarGrupo number (a:b)
    | a == number = False
    | otherwise = checarGrupo number b

--Essa função recebe a representação em lista das matrizes principal e solução, respectivamente, e
--retorna fusão entre elas. Essa fusão é feita colocando os valores da lista solução nos locais
--onde a lista principal possui zero
juntaMatriz :: [Int] -> [Int] -> [Int]
juntaMatriz [] _ = []
juntaMatriz princ [] = princ
juntaMatriz (ap:bp) (as:bs) 
    | (ap == 0) = (as : juntaMatriz bp bs)
    | otherwise = (ap : juntaMatriz bp (as:bs))

--Init é o tipo de dado que inicia a busca
--Val representa valores que vão ser aprovados para colocação na solução
--Put coloca valores na solução
data Back = Init Int | Val Int Int [Int]| Put Int Int [Int]

--O backtrack efetivamente resolve o puzzle, efetivamente tentando colocar valores(try) nas posições(pos)
--da matriz linha da principal e guardando esse valores na pilha de solução(sol)
--Mais informações sobre o método estão no relatório, aqui comentaremos apenas sobre questões
--mais específicas da implementação em código
backtrack :: Back -> Maybe [Int]
backtrack (Init a) = do
    backtrack (Val 1 0 [])
backtrack (Put val pos sol) = do
    --A lista sol é interpretada basicamente como uma pilha, caminhar em uma solução
    --e desfazê-la é basicamente empilhar e desempilhar
    backtrack (Val 1 (pos+1) (val:sol))
backtrack (Val try pos sol) = do
    --Se a posição chegar ao final da matriz lista ela retorna a junção da principal com a solução (invertida
    --já que empilhamos em ordem, mas precisamos dos primeiros valores antes)
    if pos >= (tamanho*tamanho) || pos < 0 then Just (juntaMatriz (matrizToLinha principal) (reverse sol))
        --Caso a posição em que estamos já estiver preenchida na matriz principal seguimos a diante
        else if (pegaPos pos (matrizToLinha principal)) /= 0
            then backtrack (Val 1 (pos + 1) sol)
            --Caso o valor que estamos tentando inserir já exceda o tamanho do grupo
            --devemos voltar para o valor solução anterior(desempilhar) e tentar o próx.
            else if (try > tamGrupo (pegaPos pos (matrizToLinha grupos)) (matrizToLinha grupos))
                then (backtrack (Val ((head sol) + 1) (ultimoEspacoVazio (matrizToLinha principal) pos) (tail sol)))
                --Caso o valor atual possa ser colocado como solução (seguindo as regras) o colocamos na pilha
                else if checarVizinhos try (pos `div` tamanho) (pos `mod` tamanho) (juntaMatriz (matrizToLinha principal) (reverse sol)) && checarGrupo try (getGrupo (pegaPos pos (matrizToLinha  grupos)) (matrizToLinha grupos) (juntaMatriz (matrizToLinha principal) (reverse sol)))
                    then do
                        backtrack (Put try pos sol)
                    --Caso não possa tentamos o próximo valor
                    else (backtrack (Val (try + 1) pos sol))
