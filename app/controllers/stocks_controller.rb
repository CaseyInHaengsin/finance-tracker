class StocksController < ApplicationController
  def search
    if params[:stock].present?

      @stock = Stock.new_lookup(params[:stock])

      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end

      else
        respond_to do |format|
          flash.now[:alert] = "Enter a valid symbol; do you even know one?"
          format.js { render partial: 'users/result' }
        end

      end

      else
        respond_to do |format|
          flash.now[:alert] = "Enter a valid symbol; do you even know one?"
          format.js { render partial: 'users/result' }
        end
    end
  end

  private
  def search_params
    params.require(:stock).permit(:stock)
  end
end