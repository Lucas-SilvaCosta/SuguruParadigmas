import Suguru
import Puzzle
import Resolvedor

main = do
    --Inicia a solução do do puzzle
    let a = backtrack (Init 0)
    --Verifica a resposta e printa a saída caso seja viável
    case a of
        Just b -> putStrLn (mostraMatriz b 0)
        Nothing -> print("Error")

    {- Testes das funções implementadas -}
    --print (principal)
    --print (matrizToLinha grupos)
    --print (getGrupo 2 (matrizToLinha grupos))
    --print (tamGrupo 6 (matrizToLinha grupos))
    --print ([1..(tamGrupo ((matrizToLinha grupos) !! 2) (matrizToLinha grupos))])
    --print (pegaPos 4 (matrizToLinha principal))
    --print (checarVizinhos 2 1 0 (matrizToLinha principal))
    --print (checarGrupo 3 (getGrupo 1 (matrizToLinha grupos)))
    --print (a)
    --putStrLn (mostraMatriz [1, 2, 3, 4, 5, 6, 7, 8, 9] 0)
    --print solucao
    --print (backtrack (Init 0))
    --print (principal)
    --print (juntaMatriz (matrizToLinha principal) [1])
    --print (ultimoEspacoVazio (matrizToLinha principal) 0)