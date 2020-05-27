class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.exists?(params[:id])
    if !@game
      render plain: "Game doesn't exists!", status: 400
    else
      @game = Game.find(params[:id])
      render :show
    end
  end
end
