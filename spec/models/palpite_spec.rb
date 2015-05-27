require "rails_helper"

describe Palpite do

  it { belong_to :bolao }

  before(:each) do
    @palpite = create(:palpite)
  end

  it 'returns only numbers' do
    expect(@palpite.dezenas_do_palpite).to eq([1,3,5,7,9])
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

  it 'tests soma dos digitos' do
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

  it 'tests pares e impares' do
    @palpite.update_attributes(dezenas: "0001 - 14 21 41 75 80")
    @palpite.analises
    expect(@palpite.teste_pares_impares).to be(true)
  end

  it 'fails min pares' do
    @palpite.update_attributes(dezenas: "0001 - 01 11 13 15 17")
    @palpite.analises
    expect(@palpite.teste_pares_impares).not_to be(true)
  end

  it 'fails min impares' do
    @palpite.update_attributes(dezenas: "0001 - 14 22 42 76 80")
    @palpite.analises
    expect(@palpite.teste_pares_impares).not_to be(true)
  end

  it 'tests mais sorteados' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 03 04 80")
    @palpite.analises
    expect(@palpite.teste_mais_sorteados).to be(true)
  end

  it 'fails min mais sorteados' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 03 04 05")
    @palpite.analises
    expect(@palpite.teste_mais_sorteados).not_to be(true)
  end

  it 'fails max mais sorteados' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 78 79 80")
    @palpite.analises
    expect(@palpite.teste_mais_sorteados).not_to be(true)
  end

  it 'tests menos sorteados' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 03 04 75")
    @palpite.analises
    expect(@palpite.teste_menos_sorteados).to be(true)
  end

  it 'fails min menos sorteados' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 03 04 05")
    @palpite.analises
    expect(@palpite.teste_menos_sorteados).not_to be(true)
  end

  it 'fails max menos sorteados' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 75 76 77")
    @palpite.analises
    expect(@palpite.teste_menos_sorteados).not_to be(true)
  end

  it 'tests colunas cheias' do
    @palpite.update_attributes(dezenas: "0001 - 01 11 21 31 41 51 61 71")
    @palpite.analises
    expect(@palpite.teste_colunas_cheias).to be(true)
  end

  it 'fails min colunas cheias' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 03 04 75")
    @palpite.analises
    expect(@palpite.teste_colunas_cheias).not_to be(true)
  end

  it 'fails max colunas cheias' do
    @palpite.update_attributes(dezenas: "0001 - 01 02 03 04 75")
    @palpite.analises
    expect(@palpite.teste_colunas_cheias).not_to be(true)
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
