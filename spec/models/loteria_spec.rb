require "rails_helper"

describe Loteria do

  it { should serialize :linhas }
  it { should serialize :colunas }
  it { should serialize :menos_sorteados }
  it { should serialize :mais_sorteados }
  it { should serialize :multiplos }
  it { should serialize :fibonacci }
  it { should serialize :numeros_primos }
  it { should serialize :quadrantes }
  it { should serialize :intervalos }

  it 'should return loteria type' do
    quina = create(:loteria)
    tipo = 'QN'
    Loteria.parametros(tipo).sigla.should == 'QN'
  end

end
