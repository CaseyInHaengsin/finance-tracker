class UsersController < ApplicationController
  def portfolio
    #Note - Devise uses a curent_user and user_signed_in? method
    @tracked_stocks = current_user.stocks
  end


  def friends
    @friends = current_user.friends
  end
end
