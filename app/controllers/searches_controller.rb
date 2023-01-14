class SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Customer"
      @Customers = Customer.looks(params[:search], params[:word])
    else
      @Games = Game.looks(params[:search], params[:word])
    end
  end
end
end
