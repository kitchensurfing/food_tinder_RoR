class MenuPropertyValue < ActiveRecord::Base
  belongs_to :menu
  belongs_to :property
  has_many :menu_response_elements
end
