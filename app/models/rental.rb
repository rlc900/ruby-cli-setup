class Rental < ActiveRecord::Base
  # add associatons!
  # attr_accessor :game_id, :user_id

  belongs_to :user
  belongs_to :game
end
