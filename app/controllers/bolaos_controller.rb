class BolaosController < ApplicationController

  def index
    @bolao = Bolao.new
    @boloes = Bolao.all.reverse
    @boloes_ranking = Bolao.all.sort_by { |bolao| bolao.media_geral }
    @debug_mode = true
  end

  def create
    @bolao = Bolao.create( bolao_params )
    redirect_to :back
  end

  def edit

  end

  def update
    redirect_to :back
  end

  def zera
    Bolao.destroy_all
    Palpite.destroy_all
    redirect_to :bolaos
  end

private

  def bolao_params
    params.require(:bolao).permit!
  end

end
