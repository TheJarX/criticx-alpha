class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create!(
      name: game_params[:name],
      summary: game_params[:summary],
      release_date: game_params[:release_date],
      category: game_params[:category].to_i,
      rating: game_params[:rating],
      parent_id: game_params[:parent_id]
    )

    if @game
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    render plain: "Game doesn't exists!", status: 400 unless Game.exists?(params[:id])
    @game = Game.find(params[:id])
    render :show
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to(@game)
    else
      render :edit
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_path
  end
  private
  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, :summary, :release_date, :category, :rating, :parent_id)
  end
end
