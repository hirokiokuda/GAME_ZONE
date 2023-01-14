class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @game_comments = @customer.game_comments
    
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:game_comment_id)  # ログイン中のユーザーのお気に入りのgame_comment_idカラムを取得
    @favorite_list = GameComment.find(favorites)     # game_commentテーブルから、お気に入り登録済みのレコードを取得
  
  end

  def edit
  end

  def update
  end
end
