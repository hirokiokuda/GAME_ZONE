class Public::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page])
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
  end
end
