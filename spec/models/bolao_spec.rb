require "rails_helper"

describe Bolao do

  it { should have_attached_file(:arquivo) }
  it { should validate_attachment_presence(:arquivo) }
  it { have_many :palpites }

  it 'should have archive contents' do
    bolao = build(:bolao)
    bolao.arquivo_contents.should_not == 'vazio'
  end

end
