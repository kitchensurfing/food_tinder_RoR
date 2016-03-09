class MenuResponsesController < ApplicationController
  def new
    @menu = next_menu
    if @menu.nil?
      redirect_to user_recommendation_path(user: @user.id)
    end
  end

  def create
    MenuResponse.create_from_menu_and_response(menu: last_menu, accepted: params[:accepted], user: user)
    user.update_profile
    @menu = next_menu
    if @menu.nil?
      redirect_to user_recommendation_path(user_id: @user.id)
    else
      render 'new'
    end
  end

  private

  def user
    @user ||= User.first
  end

  def next_menu
    mom = MenuOrderManager.new(user: user)
    mom.get_next_menu
  end

  def last_menu
    Menu.find(params[:menu_id])
  end
end
