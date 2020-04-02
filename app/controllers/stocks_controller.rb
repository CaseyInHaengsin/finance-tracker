class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      render 'users/portfolio'

      else
    flash[:alert] = "Please enter a symbol to search"
    redirect_to portfolio_path
    end
  end

  private
  def search_params
    params.require(:stock).permit(:stock)
  end
end