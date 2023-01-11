class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報の編集に成功しました"
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end 
  end
  def customer_params
    params.require(:customer).permit(:email, :nickname)
  end
end
