class Public::GameCommentsController < ApplicationController
  def index
    @game_comments = GameComment.all
    @game = Game.new
  end

  def update
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
  def post_params
    params.require(:game_comment).permit(:content)
  end
end