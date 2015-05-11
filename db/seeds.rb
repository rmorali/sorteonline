# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

quina = Loteria.create( 
    nome: 'Quina', #OK
    sigla: 'QN', #OK
    qtd_min_dezenas: 5, #OK
    qtd_max_dezenas: 7, #OK
    min_soma: 42, # OK
    max_soma: 368, # OK
    max_pares: 4, # OK
    min_pares: 1, # OK
    max_impares: 4, # OK
    min_impares: 1, # OK
    min_mais_sorteados: 1, #OK
    max_mais_sorteados: 3, #OK
    min_menos_sorteados: 1, #OK
    max_menos_sorteados: 3, #OK
    min_colunas_cheias: 0,
    max_colunas_cheias: 0,
    min_linhas_cheias: 0,
    max_linhas_cheias: 0,
    min_colunas_vazias: 0,
    max_colunas_vazias: 5,
    min_linhas_vazias: 0,
    max_linhas_vazias: 0,
    min_mesma_linha: 0,
    max_mesma_linha: 0,
    min_mesma_coluna: 0,
    max_mesma_coluna: 0,
    min_coluna_esquerda_direita: 0,
    min_digitos: 0,
    max_digitos: 0,
    min_sequencia: 0,
    max_sequencia: 0,
    linhas: [1,2,3,4,5,6],
    colunas: [[1,11,21,31,41,51,61,71],
              [2,12,22,32,42,52,62,72],
              [3,13,23,33,43,53,63,73],
              [4,14,24,34,44,54,64,74],
              [5,15,25,35,45,55,65,75],
              [6,16,26,36,46,56,66,76],
              [7,17,27,37,47,57,67,77],
              [8,18,28,38,48,58,68,78],
              [9,19,29,39,49,59,69,79],
              [10,20,30,40,50,60,70,80]],               
    colunas_da_esquerda: [[1,11,21,31,41,51,61,71],
                          [2,12,22,32,42,52,62,72],
                          [3,13,23,33,43,53,63,73],
                          [4,14,24,34,44,54,64,74],
                          [5,15,25,35,45,55,65,75]],
    colunas_da_direita:  [[6,16,26,36,46,56,66,76],
                          [7,17,27,37,47,57,67,77],
                          [8,18,28,38,48,58,68,78],
                          [9,19,29,39,49,59,69,79],
                          [10,20,30,40,50,60,70,80]],       
    mais_sorteados: [1,2,3,4,5], #OK
    menos_sorteados: [6,7,8,9,0],
    multiplos: [3,4,5,6,7,8,9,10,11]
)
