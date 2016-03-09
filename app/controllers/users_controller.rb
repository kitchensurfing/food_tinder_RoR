class UsersController < ApplicationController
  def recommendation
    @user = User.find(params[:user_id])
    @recommendation_info = @user.get_menu_recommendation
  end
end
