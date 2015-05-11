class Palpite < ActiveRecord::Base
  serialize :linhas
  belongs_to :bolao

end

