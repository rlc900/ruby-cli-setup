class Game < ActiveRecord::Base
# add associatons!
  has_many :rentals
  has_many :users, through: :rentals
end
