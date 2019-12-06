class User < ActiveRecord::Base
  # add associatons!
  has_many :rentals
  has_many :games, through: :rentals
end
