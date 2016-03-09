class User < ActiveRecord::Base
  has_many :menu_responses
  has_many :user_profile_elements
end
