FactoryGirl.define do
  
  factory :loteria do
    nome 'Quina'
    qtd_dezenas 5
  end

  factory :bolao do
    arquivo_file_name 'QN-Teste'
  end

end
