class Public::GamesController < ApplicationController
  def index
    @games = Game.page(params[:page])
    #games = params[:tag_id].present? ? Tag.find(params[:tag_id]).games : game.all
  end

  def show
    @game = Game.find(params[:id])
    @game_comments = GameComment.where(game_id: @game.id)
  end
  
end
