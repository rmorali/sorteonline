class BolaosController < ApplicationController

  def index
    @bolao = Bolao.new
  end

  def create
    @bolao = Bolao.create( bolao_params )
    #raise @bolao.inspect
    redirect_to :back
  end

  def edit

  end

  def update
    redirect_to :back
  end

  def zera
    Quina.destroy_all
    AnaliseQuina.destroy_all
    redirect_to :quinas
  end

private

  def bolao_params
    params.require(:bolao).permit!
  end

end
