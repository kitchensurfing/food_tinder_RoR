class MenuResponsesController < ApplicationController
  def new
    @menu = next_menu
  end

  def create
    MenuResponse.create_from_menu_and_response(menu: last_menu, accepted: params[:accepted], user: user)
    binding.pry
    #user.update_profile
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
