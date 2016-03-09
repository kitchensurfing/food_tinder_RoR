require 'smarter_csv'

info_by_menu = SmarterCSV.process("csv_with_stuff.csv", remove_empty_values: false)

base_assumptions = Set.new ["Contains Nuts", "Contains Dairy", "Contains Gluten", "Contains Meat", "Not Spicy", "Not Vegan"]
info_by_menu.each do |i|
  m = Menu.new
  m.ref_id = i[:id]
  m.title = i[:title]
  m.save
  #Verify that it is a new reference id

  #Process dietary tags
  dietary_tag_list = i[:dietary_tags].split(',')
  menu_untruths = Set.new
  dietary_tag_list.each do |tag_name|
    if tag_name =~ /Nut/
      menu_untruths.add "Contains Nuts"
    end
    if tag_name =~ /Dairy/
      menu_untruths.add "Contains Dairy"
    end
    if tag_name =~ /Gluten/
      menu_untruths.add "Contains Gluten"
    end
    if tag_name =~ /Vegetarian/
      menu_untruths.add "Contains Meat"
    end
    #if tag_name =~ /Spicy/
      #menu_untruths.add "Not Spicy"
    #end
    #if tag_name =~ /Vegan/
      #menu_untruths.add "Not Vegan"
    #end
  end
  base_assumptions.each do |assumption|
    #Find property
    property = Property.find_or_create_by(name: assumption, value_type: Property::BinaryType)
    property_value = !menu_untruths.member?(assumption)
    menu_property_value = MenuPropertyValue.new(menu: m, property: property, value: property_value)
    menu_property_value.save
  end

  #Process other properties
  pre_processed_keys = [:id, :title, :dietary_tags, :key_ingredients, :photo_type, :photo_type, :kid_friendly, :value_perception, :cost]
  auto_processed_hash = i.except *pre_processed_keys
  auto_processed_hash.each do |key, value|
    property = Property.find_or_create_by(name:key, value_type: Property::ScalarType)
    menu_property_value = MenuPropertyValue.new(menu: m, property: property, value: value)
    menu_property_value.save
  end

  puts "#{m.title} added to database (#{m.entree_type})."
end

u = User.new
u.email = "marcus@ks.com"
u.save
