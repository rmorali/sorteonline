class LoteriasController < ApplicationController

  def index
    @loterias = Loteria.all
  end

  def create
    @loteria = Loteria.create( bolao_params )
    redirect_to :back
  end

  def edit

  end

  def update
    redirect_to :back
  end

private

  def bolao_params
    params.require(:loteria).permit!
  end

end
