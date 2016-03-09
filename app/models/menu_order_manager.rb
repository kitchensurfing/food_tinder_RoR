class MenuOrderManager
  STARTING_MENU_REF_IDS = ["MEAT008", "MEAT070", "PORK065", "CHIX050"]

  def initialize(user:)
    @user = user
  end

  def get_next_menu
    get_next_starting_menu || get_next_custom_menu
  end

  def get_next_starting_menu
    if response_count < STARTING_MENU_REF_IDS.length
      next_ref_id = STARTING_MENU_REF_IDS[response_count + 1]
      menu = Menu.find_by(ref_id: next_ref_id)
    end
    menu
  end

  def get_next_custom_menu
    if response_count < Menu.all.count
      menu = Menu.all.sample
      while @user.menu_responses.where(menu_id: menu.id).count > 0
        menu = Menu.all.sample
      end
      menu
    else
      nil
    end
  end

  def response_count
    @user.menu_responses.count
  end
end
