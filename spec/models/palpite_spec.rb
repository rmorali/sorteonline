require "rails_helper"

describe Palpite do

  it { belong_to :bolao }

  before(:all) do
    Palpite.all.each { |palpite| palpite.analises }
    @palpite = Palpite.first
  end

  it 'should return only numbers' do
    @palpite.dezenas_do_palpite.should == [14,21,41,75,80]
  end

  it 'should return quantity of numbers' do
    @palpite.qtd_dezenas_do_palpite.should == 5
  end

  it 'should get parameters' do
    @palpite.parametros.nome.should == 'Quina'
  end

  it 'should get score' do
    @palpite.pontos.should == 100
  end

  it 'should test min soma das dezenas' do

  end

  it 'should test max soma das dezenas' do

  end

  it 'should test min soma dos digitos' do

  end

  it 'should test max soma dos digitos' do

  end

  it 'should test min pares' do

  end

  it 'should test min impares' do

  end

  it 'should test min mais sorteados' do

  end

  it 'should test max mais sorteados' do

  end

  it 'should test min menos sorteados' do

  end

  it 'should test max menos sorteados' do

  end

  it 'should test colunas cheias' do

  end

  it 'should test colunas vazias' do

  end

  it 'should test linhas cheias' do

  end

  it 'should test linhas vazias' do

  end

  it 'should test fibonacci' do

  end

  it 'should test numeros primos' do

  end

  it 'should test numeros consecutivos' do

  end

  it 'should test quadrantes' do

  end

  it 'should test multiplos' do

  end

  it 'should test distancia' do

  end

  it 'should test intervalos' do

  end

end
