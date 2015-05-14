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

  def titulo(item)
    texto = []
    case item
      when 'soma'
        texto << "Soma<br> > #{parametros.min_soma} < #{parametros.max_soma}"
      when 'pares_impares'
        texto << "Minimo<br>#{parametros.min_pares} Par / #{parametros.min_impares} Impar"
      when 'mais_sorteados'
        texto << " + Sorteados<br> >= #{parametros.min_mais_sorteados} <= #{parametros.max_mais_sorteados}"
      when 'menos_sorteados'
        texto << "- Sorteados<br> >= #{parametros.min_menos_sorteados} <= #{parametros.max_menos_sorteados}"
      when 'colunas_cheias'
        texto << "Colunas cheias<br> >= #{parametros.min_colunas_cheias} <= #{parametros.max_colunas_cheias}"
      when 'colunas_vazias'
        texto << "Colunas vazias<br> >= #{parametros.min_colunas_vazias} <= #{parametros.max_colunas_vazias}"
      when 'linhas_cheias'
        texto << "Linhas cheias<br> >= #{parametros.min_linhas_cheias} <= #{parametros.max_linhas_cheias}"
      when 'linhas_vazias'
        texto << "Linhas vazias<br> >= #{parametros.min_linhas_vazias} <= #{parametros.max_linhas_vazias}"
      when 'fibonacci'
        texto << "Seq.Fibonacci<br> >= #{parametros.min_fibonacci} <= #{parametros.max_fibonacci}"
      when 'numeros_primos'
        texto << "Num.Primos<br> >= #{parametros.min_numeros_primos} <= #{parametros.max_numeros_primos}"
      when 'numeros_consecutivos'
        texto << "Num.Consecutivos<br> <= #{parametros.max_numeros_consecutivos}"
      when 'quadrantes'
        texto << "Quadrantes<br> >= #{parametros.min_quadrantes}"
      when 'multiplos'
        texto << "Multiplos<br> <= #{parametros.max_multiplos}"
      when 'distancia'
        texto << "Distancia<br> <= #{parametros.max_distancia}"
      else
  

    end
    texto.join(' ')
  end

end
