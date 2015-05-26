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
    @palpite.teste_soma.should == true
    @palpite = Palpite.find(2)
    @palpite.teste_soma.should_not == true 
  end

  it 'should test max soma das dezenas' do
    @palpite.teste_soma.should == true
    @palpite = Palpite.find(3)
    @palpite.teste_soma.should_not == true 
  end

  it 'should test min soma dos digitos' do
    @palpite.teste_soma_dos_digitos.should == true
    @palpite = Palpite.find(3)
    @palpite.teste_soma_dos_digitos.should_not == true 
  end

  it 'should test max soma dos digitos' do
    @palpite.teste_soma_dos_digitos.should == true
    @palpite = Palpite.find(4)
    @palpite.teste_soma_dos_digitos.should_not == true 
  end

  it 'should test min pares' do
    @palpite.teste_pares_impares.should == true
    @palpite = Palpite.find(6)
    @palpite.teste_pares_impares.should_not == true 
  end

  it 'should test min impares' do
    @palpite.teste_pares_impares.should == true
    @palpite = Palpite.find(7)
    @palpite.teste_pares_impares.should_not == true 
  end

  it 'should test min mais sorteados' do
    @palpite.teste_mais_sorteados.should == true
    @palpite = Palpite.find(8)
    @palpite.teste_mais_sorteados.should_not == true 
  end

  it 'should test max mais sorteados' do
    @palpite.teste_mais_sorteados.should == true
    @palpite = Palpite.find(9)
    @palpite.teste_mais_sorteados.should_not == true 
  end

  it 'should test min menos sorteados' do
    @palpite.teste_menos_sorteados.should == true
    @palpite = Palpite.find(10)
    @palpite.teste_mais_sorteados.should_not == true 
  end

  it 'should test max menos sorteados' do
    @palpite.teste_menos_sorteados.should == true
    @palpite = Palpite.find(11)
    @palpite.teste_mais_sorteados.should_not == true 
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
