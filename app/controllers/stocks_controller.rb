class StocksController < ApplicationController
  def search
    @stock = Stock.new_lookup(params[:stock])
    render json: @stock
  end

  private
  def search_params
    params.require(:stock).permit(:stock)
  end
end