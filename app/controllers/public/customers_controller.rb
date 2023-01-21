class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @game_comments = @customer.game_comments
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:game_comment_id)  # ログイン中のユーザーのお気に入りのgame_comment_idカラムを取得
    @favorite_list = GameComment.find(favorites)     # game_commentテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "登録情報を編集完了。"
      redirect_to customer_path(current_customer)
    else
      flash[:alert] = "エラーが発生しました。"
      render :edit
    end
  end

  def customer_params
    params.require(:customer).permit(:nickname, :introduction, :email, :profile_image)
  end
end
