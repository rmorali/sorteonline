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
    nome = self.arquivo_file_name.remove!(".txt")
  end

  def tipo
    tipo = self.nome.first(2)
  end

  def parametros
    Loteria.parametros(tipo)
  end

  def importa_palpites
    linhas = []
    self.arquivo_contents.each_line do |arquivo|
      linhas << arquivo.chomp
    end
    palpites = []
    linhas.split(' ', self.parametros).each do |linha|
      palpites << linha.to_i
    end
    2.times { palpites.delete_at(0) }
    palpites.each do |palpite|
      Palpite.create(:bolao => self, :dezenas => palpite)
    end
  end

  def numeros
    columns = []
    self.palpite.split(' ', 25).each do |palpite|
      columns << palpite.to_i
    end   
    2.times { columns.delete_at(0) } 
    columns
  end

end
