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
    qtd_dezenas: 80,
    qtd_min_dezenas: 5, 
    qtd_max_dezenas: 7, 
    min_soma: 92, 
    max_soma: 310,
    min_soma_dos_digitos: 20, 
    max_soma_dos_digitos: 60, 
    max_pares: 6, 
    min_pares: 1, 
    max_impares: 6, 
    min_impares: 1, 
    min_mais_sorteados: 0, 
    max_mais_sorteados: 2, 
    min_menos_sorteados: 0, 
    max_menos_sorteados: 7, 
    min_colunas_cheias: 0, 
    max_colunas_cheias: 10, 
    min_linhas_cheias: 0, 
    max_linhas_cheias: 8, 
    min_colunas_vazias: 0, 
    max_colunas_vazias: 7, 
    min_linhas_vazias: 0, 
    max_linhas_vazias: 5, 
    min_fibonacci: 0, 
    max_fibonacci: 2, 
    min_numeros_primos: 0, 
    max_numeros_primos: 3, 
    min_digitos: 0,
    max_digitos: 0,
    max_numeros_consecutivos: 2, 
    min_quadrantes: 2,
    min_multiplos: 0,  
    max_multiplos: 3,
    max_distancia: 48,
    intervalos: [[1,45],[2,61],[10,73],[23,79],[37,80],[37,80],[37,80]],
    linhas: [[1,2,3,4,5,6,7,8,9,10],
             [11,12,13,14,15,16,17,18,19,20],
             [21,22,23,24,25,26,27,28,29,30],
             [31,32,33,34,35,36,37,38,39,40],
             [41,42,43,44,45,46,47,48,49,50],
             [51,52,53,54,55,56,57,58,59,60],
             [61,62,63,64,65,66,67,68,69,70],
             [71,72,73,74,75,76,77,78,79,80]],
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
    quadrantes: [[1,2,3,4,5,11,12,13,14,15,21,22,23,24,25,31,32,33,34,35],
                 [6,7,8,9,10,16,17,18,19,20,26,27,28,29,30,36,37,38,39,40],
                 [41,42,43,44,45,51,52,53,54,55,61,62,63,64,65,71,72,73,74,75],
                 [46,47,48,49,50,56,57,58,59,60,66,67,68,69,70,76,77,78,79,80]],                     
    mais_sorteados: [39,4,52,49,53,16,53,40,44,29,42], 
    menos_sorteados: [58,35,23,47,67,65,6,24,3,20], 
    fibonacci: [1,2,3,5,8,13,21,34,55], 
    numeros_primos: [2,3,5,7,11,13,17,19,23,29,31,41,43,47,53,59,61,67,71,73,79], 
    multiplos: [3,4,5,6,7,8,9,10,11]
)

dupla_sena = Loteria.create( 
    nome: 'Dupla Sena', 
    sigla: 'DS', 
    qtd_dezenas: 50,
    qtd_min_dezenas: 6, 
    qtd_max_dezenas: 15, 
    min_soma: 25, 
    max_soma: 200,
    min_soma_dos_digitos: 20, 
    max_soma_dos_digitos: 60,
    max_pares: 14, 
    min_pares: 2, 
    max_impares: 15, 
    min_impares: 2, 
    min_mais_sorteados: 0, 
    max_mais_sorteados: 2, 
    min_menos_sorteados: 1, 
    max_menos_sorteados: 10, 
    min_colunas_cheias: 0, 
    max_colunas_cheias: 10, 
    min_linhas_cheias: 0, 
    max_linhas_cheias: 5, 
    min_colunas_vazias: 0, 
    max_colunas_vazias: 7, 
    min_linhas_vazias: 0, 
    max_linhas_vazias: 3, 
    min_fibonacci: 0, 
    max_fibonacci: 2, 
    min_numeros_primos: 0, 
    max_numeros_primos: 3, 
    min_digitos: 0,
    max_digitos: 0,
    max_numeros_consecutivos: 2, 
    min_quadrantes: 2,
    min_multiplos: 0, 
    max_multiplos: 3,
    max_distancia: 38,
    intervalos: [[1,30],[2,40],[10,45],[12,50],[20,50],[22,50],[1,50],[1,50],[1,50],[1,50],[1,50],[1,50],[1,50],[1,50],[1,50]],
    linhas: [[1,2,3,4,5,6,7,8,9,10],
             [11,12,13,14,15,16,17,18,19,20],
             [21,22,23,24,25,26,27,28,29,30],
             [31,32,33,34,35,36,37,38,39,40],
             [41,42,43,44,45,46,47,48,49,50]],
    colunas: [[1,11,21,31,41],
              [2,12,22,32,42],
              [3,13,23,33,43],
              [4,14,24,34,44],
              [5,15,25,35,45],
              [6,16,26,36,46],
              [7,17,27,37,47],
              [8,18,28,38,48],
              [9,19,29,39,49],
              [10,20,30,40,50]],
    quadrantes: [[1,2,3,4,5,11,12,13,14,15,21,22,23,24,25],
                 [6,7,8,9,10,16,17,18,19,20,26,27,28,29,30],
                 [31,32,33,34,35,41,42,43,44,45],
                 [36,37,38,39,40,46,47,48,49,50]],                     
    mais_sorteados: [39,45,33,47,4,11,42,14,19,21], 
    menos_sorteados: [26,37,41,13,17,2,24,27,48,22], 
    fibonacci: [1,2,3,5,8,13,21,34,55], 
    numeros_primos: [2,3,5,7,11,13,17,19,23,29,31,41,43,47,53,59,61,67,71,73,79], 
    multiplos: [3,4,5,6,7,8,9,10,11]
)

lotofacil = Loteria.create( 
    nome: 'Lotofacil', 
    sigla: 'LF', 
    qtd_dezenas: 25,
    qtd_min_dezenas: 15, 
    qtd_max_dezenas: 18, 
    min_soma: 166, 
    max_soma: 227,
    min_soma_dos_digitos: 62, 
    max_soma_dos_digitos: 87, 
    max_pares: 13, 
    min_pares: 5, 
    max_impares: 13, 
    min_impares: 6, 
    min_mais_sorteados: 11, 
    max_mais_sorteados: 14, 
    min_menos_sorteados: 0, 
    max_menos_sorteados: 5, 
    min_colunas_cheias: 0, 
    max_colunas_cheias: 5, 
    min_linhas_cheias: 0, 
    max_linhas_cheias: 5, 
    min_colunas_vazias: 0, 
    max_colunas_vazias: 0, 
    min_linhas_vazias: 0, 
    max_linhas_vazias: 0, 
    min_fibonacci: 2, 
    max_fibonacci: 6, 
    min_numeros_primos: 4, 
    max_numeros_primos: 7, 
    min_digitos: 0,
    max_digitos: 0,
    max_numeros_consecutivos: 10, 
    min_quadrantes: 2,
    min_multiplos: 2, 
    max_multiplos: 6,
    max_distancia: 6,
    intervalos: [[1,3],[1,5],[1,7],[1,9],[1,11],[7,13],[8,15],[10,16],[11,18],[13,19],[15,21],[17,22],[19,23],[21,25],[21,25],[23,25],[23,25],[23,25]],
    linhas: [[1,2,3,4,5],
             [6,7,8,9,10],
             [11,12,13,14,15],
             [16,17,18,19,20],
             [21,22,23,24,25]],
    colunas: [[1,6,11,16,21],
              [2,7,12,17,22],
              [3,8,13,18,23],
              [4,9,14,19,24],
              [5,10,15,20,25]],
    quadrantes: [[1,2,3,4,5,11,12,13,14,15],[21,22,23,24,25]],                     
    mais_sorteados: [2,24,11,13,4,1,22,12,21,19,23,6,14,25,10,3,15,9,20,17], 
    menos_sorteados: [5,7,8,16,8], 
    fibonacci: [1,2,3,5,8,13,21], 
    numeros_primos: [2,3,5,7,11,13,17,19,23], 
    multiplos: [3,4,5]
)


