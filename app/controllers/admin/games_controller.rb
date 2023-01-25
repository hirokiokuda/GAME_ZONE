class Admin::GamesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @games = Game.all
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      flash[:notice] = " 作成されました。"
      redirect_to admin_game_path(@game.id)
    else
      flash[:alert] = "エラーが発生しました。"
      render :new
    end
  end
  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    game.update(game_params)
    flash[:notice] = "編集完了。"
    redirect_to admin_game_path(game.id)
  end

  private
  def game_params
    params.require(:game).permit(:name, :introduction, :image, tag_ids: [])
  end

end
