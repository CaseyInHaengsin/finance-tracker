class UsersController < ApplicationController
  def portfolio
    #Note - Devise uses a curent_user and user_signed_in? method
    @user = current_user
    @tracked_stocks = current_user.stocks
  end


  def friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])

      @friends = current_user.except_current_user(@friends)

      if @friends
        respond_to do |format|
          format.js { render partial: 'users/friend_result'}

        end
      else
        respond_to do |format|
          flash.now[:alert] = "Couldn't find that person"
          format.js { render partial: 'users/friend_result'}

        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "please enter a friends name or email to search"
        format.js { render partial: 'users/friend_result'}
      end
    end

  end
end
