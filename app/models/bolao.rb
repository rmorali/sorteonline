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

  def relevancia
    total_de_sucessos = 0
    total_de_palpites = self.palpites.count
    self.palpites.each do |palpite|
      total_de_sucessos += 1 if palpite.pontos == 100
    end
    total_relevancia = (total_de_sucessos * 100 ) / total_de_palpites
    total_relevancia.round(2)
  end

end
