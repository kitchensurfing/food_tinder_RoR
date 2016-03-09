class MenuResponse < ActiveRecord::Base
  has_many :menu_response_elements

  def self.create_from_menu_and_response(menu:nil, accepted:nil, user:nil)
    response = MenuResponse.new(menu_id: menu.id, accepted: accepted, user_id: user.id)

    menu.menu_property_values.each do |mpv|
      response_element = MenuResponseElement.new(menu_response_id: response.id, menu_property_value_id: mpv.id, accepted: accepted)
      response_element.save
    end

    response.save
  end
end
