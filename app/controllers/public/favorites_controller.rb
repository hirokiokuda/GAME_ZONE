class Public::FavoritesController < ApplicationController
  def create
    game_comment = GameComment.find(params[:game_comment_id])
    favorite = current_customer.favorites.new(game_comment_id: game_comment.id)
    favorite.save
    redirect_to game_game_comment_path(game_comment)
  end

  def destroy
    game_comment = GameComment.find(params[:game_comment_id])
    favorite = current_customer.favorites.find_by(game_comment_id: game_comment.id)
    favorite.destroy
    redirect_to game_game_comment_path(game_comment)
  end

end

