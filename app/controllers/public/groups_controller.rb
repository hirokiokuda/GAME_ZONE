class Public::GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_customer.id
    @group.customers << current_customer
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def index

    @groups = Group.all
  end

  def join
    @groupuser = current_customer.groupusers.new(group_id: params[:group_id])
    if @groupuser.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  def leave
    @groupuser = current_customer.groupusers.where(group_id: params[:group_id]).first
    @groupuser.destroy
    redirect_to groups_path
  end

  def show
    @game = Game.new
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :introduction, :image)
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_customer.id
      redirect_to groups_path
    end
  end
end