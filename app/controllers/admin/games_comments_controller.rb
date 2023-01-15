class Admin::GamesCommentsController < ApplicationController
  def show
  end
  
  def index
    @game_comments = GameComment.all
    
  end
  
  def edit
  end

  def update
  end
  
  
  
end
