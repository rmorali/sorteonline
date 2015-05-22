FactoryGirl.define do
  
  factory :loteria do
    nome 'Quina'
    sigla 'QN'
    qtd_dezenas 5
  end

  factory :bolao do
    arquivo_file_name 'QN-Teste.txt'
  end

end
