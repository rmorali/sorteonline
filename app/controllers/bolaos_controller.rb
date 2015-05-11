class BolaosController < ApplicationController

  def index
    @bolao = Bolao.new
  end

  def create
    @bolao = Bolao.create(params[:bolao])
    redirect_to :back
  end

  def edit
    @jogo = Quina.first
  end

  def update
    redirect_to :back
  end

  def zera
    Quina.destroy_all
    AnaliseQuina.destroy_all
    redirect_to :quinas
  end

end
