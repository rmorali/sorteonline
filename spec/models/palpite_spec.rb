require "rails_helper"

describe Palpite do

  it { belong_to :bolao }

  before(:each) do
    @palpite = create(:palpite)
  end

  it 'returns only numbers' do
    expect(@palpite.dezenas_do_palpite).to eq([1,2,3,4,5])
  end

  it 'returns quantity of numbers' do
    expect(@palpite.qtd_dezenas_do_palpite).to eq(5)
  end

  it 'get parameters' do
    expect(@palpite.parametros.nome).to eq('Quina')
  end

  it 'get score' do
    @palpite.analises
    expect(@palpite.pontos).to be > 0
  end

  it 'tests soma das dezenas' do
    @palpite.update_attributes(dezenas: "0001 - 14 21 41 75 80")
    @palpite.analises
    expect(@palpite.teste_soma).to be(true)
  end

  it 'fails min soma das dezenas' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 03 04 05")
    @palpite.analises
    expect(@palpite.teste_soma).not_to be(true)
  end

  it 'fails max soma das dezenas' do
    @palpite.update_attributes(dezenas: "0001 - 70 72 73 78 79")
    @palpite.analises
    expect(@palpite.teste_soma).not_to be(true)
  end

  it 'tests min soma dos digitos' do
    @palpite.update_attributes(dezenas: "0001 - 14 21 41 75 80")
    @palpite.analises
    expect(@palpite.teste_soma_dos_digitos).to be(true)
  end

  it 'fails min soma dos digitos' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 11 12 20")
    @palpite.analises
    expect(@palpite.teste_soma_dos_digitos).not_to be(true)
  end

  it 'fails max soma dos digitos' do
    @palpite.update_attributes(dezenas: "0001 - 74 77 78 79 80")
    @palpite.analises
    expect(@palpite.teste_soma_dos_digitos).not_to be(true)
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
