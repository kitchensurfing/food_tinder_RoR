class Menu < ActiveRecord::Base
  has_many :menu_property_values
  has_many :menu_responses

  ENTREE_TYPES = %w("MEAT" "LAMB" "PORK" "CHIX" "WHFI" "SLAM" "VEG")

  def entree_type
    (ref_id.match /[A-Z]*/)[0]
  end
end
