FactoryGirl.define do
  
  factory :loteria do
    nome 'Quina' 
    sigla 'QN'
    qtd_dezenas 80
    qtd_min_dezenas 5 
    qtd_max_dezenas 7 
    min_soma 92 
    max_soma 310
    min_soma_dos_digitos 30 
    max_soma_dos_digitos 60 
    max_pares 6 
    min_pares 1 
    max_impares 6 
    min_impares 1 
    min_mais_sorteados 1 
    max_mais_sorteados 2 
    min_menos_sorteados 1 
    max_menos_sorteados 2 
    min_colunas_cheias 0 
    max_colunas_cheias 0 
    min_linhas_cheias 1 
    max_linhas_cheias 2 
    min_colunas_vazias 0 
    max_colunas_vazias 7 
    min_linhas_vazias 0 
    max_linhas_vazias 5 
    min_fibonacci 0 
    max_fibonacci 2 
    min_numeros_primos 0 
    max_numeros_primos 3 
    min_digitos 0
    max_digitos 0
    max_numeros_consecutivos 2 
    min_quadrantes 2 
    max_multiplos 3
    max_distancia 48
    intervalos [[1,45],[2,61],[10,73],[23,79],[37,80],[37,80],[37,80]]
    linhas [[1,2,3,4,5,6,7,8,9,10],
             [11,12,13,14,15,16,17,18,19,20],
             [21,22,23,24,25,26,27,28,29,30],
             [31,32,33,34,35,36,37,38,39,40],
             [41,42,43,44,45,46,47,48,49,50],
             [51,52,53,54,55,56,57,58,59,60],
             [61,62,63,64,65,66,67,68,69,70],
             [71,72,73,74,75,76,77,78,79,80]]
    colunas [[1,11,21,31,41,51,61,71],
              [2,12,22,32,42,52,62,72],
              [3,13,23,33,43,53,63,73],
              [4,14,24,34,44,54,64,74],
              [5,15,25,35,45,55,65,75],
              [6,16,26,36,46,56,66,76],
              [7,17,27,37,47,57,67,77],
              [8,18,28,38,48,58,68,78],
              [9,19,29,39,49,59,69,79],
              [10,20,30,40,50,60,70,80]]
    quadrantes [[1,2,3,4,5,11,12,13,14,15,21,22,23,24,25,31,32,33,34,35],
                 [6,7,8,9,10,16,17,18,19,20,26,27,28,29,30,36,37,38,39,40],
                 [41,42,43,44,45,51,52,53,54,55,61,62,63,64,65,71,72,73,74,75],
                 [46,47,48,49,50,56,57,58,59,60,66,67,68,69,70,76,77,78,79,80]]                     
    mais_sorteados [78,79,80] 
    menos_sorteados [75,76,77] 
    fibonacci [1,2,3,5,8,13,21,34,55] 
    numeros_primos [2,3,5,7,11,13,17,19,23,29,31,41,43,47,53,59,61,67,71,73,79] 
    multiplos [3,4,5,6,7,8,9,10,11]
  end

  factory :bolao do
    arquivo_file_name 'QN-Teste.txt'
  end

  factory :palpite do
    association :bolao, factory: :bolao
    dezenas '0001 - 01 03 05 07 09'
  end

end
