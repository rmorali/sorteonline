require "rails_helper"

describe Bolao do

  it { should have_attached_file(:arquivo) }
  it { should validate_attachment_presence(:arquivo) }
  it { have_many :palpites }

  before(:all) do
    @quina = create(:loteria)
    @bolao = create(:bolao)
  end

  it 'have archive contents' do
    expect(@bolao.arquivo_contents).not_to eq('vazio')
  end

  it 'get the bolao name' do
    expect(@bolao.nome).to eq(@bolao.arquivo_file_name.remove('.txt'))
  end

  it 'returns the bolao type' do
    expect(@bolao.tipo).to eq(@bolao.arquivo_file_name.first(2))
  end

  it 'get parameters' do
    expect(@bolao.parametros.nome).to eq(@quina.nome)
  end

  it 'import palpites' do
    @bolao.importa_palpites
    expect(Palpite.count).not_to eq(0)
  end

  it 'returns palpites quantity' do
    expect(@bolao.qtd_de_palpites).to eq(11)
  end

  it 'calculates strict average' do
    Palpite.update_all(pontos: 90)
    expect(@bolao.media_estrita).to eq(0)
  end

  it 'calculates normal average' do
    Palpite.update_all(pontos: 50)
    expect(@bolao.media_normal).to eq(Palpite.average(:pontos).to_i)
  end

  it 'calculates general average' do
    expect(@bolao.media_geral).to eq(( @bolao.media_estrita + @bolao.media_normal) / 2)
  end

  it 'gives title accordingly to type' do

  end

end
