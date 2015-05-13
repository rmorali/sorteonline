class Bolao < ActiveRecord::Base
  has_attached_file :arquivo
  validates :arquivo, :attachment_presence => true
  validates_attachment_content_type :arquivo, :content_type => 'text/plain'

  has_many :palpites

  after_save :importa_palpites

  def arquivo_contents
    content = "vazio"
    unless self.arquivo_file_name == nil
      path = self.arquivo.path
      content = File.open(path).read
    end
    content
  end

  def nome
    nome = self.arquivo_file_name.remove(".txt")
  end

  def tipo
    tipo = self.nome.first(2)
  end

  def parametros
    Loteria.parametros(tipo)
  end

  def importa_palpites
    self.arquivo_contents.each_line do |arquivo|
      Palpite.create(:bolao => self, :dezenas => arquivo.delete("\n"))
    end
  end

  def qtd_de_palpites
    self.palpites.count
  end

  def media_estrita
    total_de_sucessos = 0
    self.palpites.each do |palpite|
      total_de_sucessos += 1 if palpite.pontos == 100
    end
    media = (total_de_sucessos * 100 ) / qtd_de_palpites
    media.round.to_i
  end

  def media_normal
    total_pontos = self.palpites.sum(:pontos)
    media = total_pontos / qtd_de_palpites
    media.round.to_i
  end

  def media_geral
    media = (media_estrita + media_normal) / 2
    media.round(2)
  end

end
