class MenuResponseElement < ActiveRecord::Base
  belongs_to :menu_response
  belongs_to :menu_property
end
