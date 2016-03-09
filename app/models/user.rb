class User < ActiveRecord::Base
  has_many :menu_responses
  has_many :user_profile_elements
  has_many :menu_response_elements, through: :menu_responses

  def initialize_profile_elements
    Property.all.each do |property|
      profile_element = UserProfileElement.new(property_id: property.id, user_id: self.id, value: nil)
      profile_element.save
    end
  end

  def update_profile
    initialize_profile_elements unless self.user_profile_elements.count > 0
    user_profile_elements.each do |profile_elem|
      property = profile_elem.property
      vc = ValueCalculator.new(menu_response_elements.joins(:menu_property_value).where({'menu_property_values.property_id': property.id}), property)
      value = property.get_value(vc.calculate_value)
      profile_elem.value = value
      profile_elem.save
    end
  end

  def show_profile
    user_profile_elements.each do |profile_elem|
      puts "#{profile_elem.property.name}: #{profile_elem.value}"
    end
  end

  def get_menu_recommendation
    possible_menus = Menu.all.to_a

    #Process binaries
    restrictions = user_profile_elements.joins(:property).where('properties.value_type = ?', Property::BinaryType).where(value: 'f')
    possible_menus = possible_menus.reject do |menu|
      restrictions.any? do |restriction|
        restricted_property = restriction.property
        value_for_menu = menu.menu_property_values.where(property_id: restricted_property.id).first.value
        value_for_menu == 1
      end
    end

    #Process scalars
    scalar_profile_elements = user_profile_elements.joins(:property).where('properties.value_type = ?', Property::ScalarType).to_a
    ordered_scalar_profile_elements = scalar_profile_elements.sort_by do |profile_element|
      property = profile_element.property
      value_hash = property.get_value_hash_from_string(profile_element.value)
      value_hash[:high] - value_hash[:low]
    end.reverse!

    properties_included = []

    ordered_scalar_profile_elements.each do |profile_element|
      property = profile_element.property
      value_hash = property.get_value_hash_from_string(profile_element.value)
      if possible_menus.length > 1
        puts possible_menus.length
        new_possible_menus = possible_menus.select do |menu|
          value_for_menu = menu.menu_property_values.where(property_id: property.id).first.value
          puts value_for_menu
          puts value_hash
          (value_for_menu >= value_hash[:low]) && (value_for_menu <= value_hash[:high])
        end
        if new_possible_menus.length > 1
          possible_menus = new_possible_menus
          properties_included.append property.name
        else
          break
        end
      end
    end

    {menus: possible_menus, properties: properties_included}
  end

  private

  class ValueCalculator
    def initialize(menu_response_elems, property)
      @menu_response_elems = menu_response_elems
      @property = property
    end

    def calculate_value
      accepted_response_values = @menu_response_elems.where(accepted: true).pluck('menu_property_values.value')
      if @property.value_type == Property::ScalarType
        high = accepted_response_values.max
        low = accepted_response_values.min
        {:high => high, :low => low}
      elsif @property.value_type == Property::BinaryType
        acceptable = accepted_response_values.any? do |value|
          value == 1
        end
        {:accepted => acceptable}
      end
    end
  end
end
