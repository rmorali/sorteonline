require "rails_helper"

describe Bolao do

  it { should have_attached_file(:arquivo) }
  it { should validate_attachment_presence(:arquivo) }
  it { have_many :palpites }

  before(:all) do
    @quina = create(:loteria)
    @bolao = create(:bolao)
  end

  it 'should have archive contents' do
    @bolao.arquivo_contents.should_not == 'vazio'
  end

  it 'should get the bolao name' do
    @bolao.nome.should == @bolao.arquivo_file_name.remove('.txt')
  end

  it 'should return the bolao type' do
    @bolao.tipo.should == @bolao.arquivo_file_name.first(2)
  end

  it 'should get parameters' do
    @bolao.parametros.nome.should == @quina.nome
  end

  it 'should import palpites' do

  end

  it 'should return palpites quantity' do

  end

  it 'should calculate strict average' do

  end

  it 'should calculate normal average' do

  end

  it 'should give title accordingly to type' do

  end

end
