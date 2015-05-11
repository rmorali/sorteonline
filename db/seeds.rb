# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

quina = Loteria.create( 
    nome: 'Quina',
    sigla: 'QN',
    qtd_min_dezenas: 5,
    qtd_max_dezenas: 7,
    min_soma: 42,
    max_soma: 368,
    max_pares: 4,
    min_pares: 1,
    max_impares: 4, 
    min_impares: 1,
    mais_sorteados: [1,2,3,4,5],
    min_mais_sorteados: 1,
    max_mais_sorteados: 3,
    max_menos_sorteados: 0,
    min_colunas_cheias: 0,
    max_colunas_cheias: 0,
    min_linhas_cheias: 0,
    max_linhas_cheias: 0,
    min_colunas_vazias: 0,
    max_colunas_vazias: 0,
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
    colunas: [1,11,21,31],
    colunas_da_esquerda: [1,11,21,31],
    colunas_da_direita: [6,16,26,36],
    menos_sorteados: [6,7,8,9,0],
    multiplos: [3,4,5,6,7,8,9,10,11]
)
