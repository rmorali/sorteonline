class Resultado < ActiveRecord::Base
  has_attached_file :arquivo
  validates :arquivo, :attachment_presence => true
  validates_attachment_content_type :arquivo, :content_type => 'text/plain'

  has_many :resultado_palpites

  after_save :importa_resultados

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

  def dezenas
    self.resultado_palpites
  end

  def importa_resultados
    self.arquivo_contents.each_line do |arquivo|
      ResultadoPalpite.create(:resultado => self, :dezenas => arquivo.delete("\n"))
    end
  end


end
