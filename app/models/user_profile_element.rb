class UserProfileElement < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  def to_s
    "#{property.name} : #{value}"
  end
end
