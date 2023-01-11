class FavoritesController < ApplicationController
   before_action :authenticate_customer!
  # お気に入り登録
  def create
    if @game_comment.customer_id != current_customer.id   # 投稿者本人以外に限定
      @favorite = Favorite.create(customer_id: current_customer.id, game_comment_id: @game_comment.id)
    end
  end
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(customer_id: current_customer.id, game_comment_id: @game_comment.id)
    @favorite.destroy
  end

  private
  def set_game_comment
    @game_comment = GameComment.find(params[:game_comment_id])
  end
end
