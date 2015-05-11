FactoryGirl.define do
  
  factory :loteria do
    nome 'Quina'
  end

  factory :bolao do
    nome 'QN-8000b'
  end

  factory :palpite do
    dezenas [1,2,3,4,5]
  end

end
