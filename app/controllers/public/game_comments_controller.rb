class Public::GameCommentsController < ApplicationController
  def index
    @game_comments = GameComment.all
    @game = Game.new
  end

  def destroy
    GameComment.find_by(id: params[:id], game_id: params[:game_id]).destroy
    redirect_to request.referer
  end

  def create
    @game_comment = GameComment.new(game_comment_params)
    @game_comment.customer_id = current_customer.id
    if @game_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @game_comment = GameComment.find(params[:id])
  end


  private
  def game_comment_params
    params.permit(:content, :game_id, :comment)
  end
end