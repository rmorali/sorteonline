class ResultadosController < ApplicationController

  def index
    @resultado = Resultado.new
    @resultados = Resultado.all
  end

  def create
    @resultado = Resultado.create( resultado_params )
    redirect_to :back
  end

  def edit

  end

  def update
    redirect_to :back
  end

  def zera
    Resultado.destroy_all
    ResultadoPalpite.destroy_all
    redirect_to :resultados
  end

private

  def resultado_params
    params.require(:resultado).permit!
  end


end
