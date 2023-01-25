class Admin::GamesCommentsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @game_comments = Customer.find(params[:id]).game_comments
    
  end
  
  def index
    @game_comments = GameComment.all
  end
  
  def destroy
    @game_comment = GameComment.find(params[:id])
    @game_comment.destroy
    redirect_to admin_games_comments_path
  end
  
  def edit
  end

  def update
  end
  
  
  
end
