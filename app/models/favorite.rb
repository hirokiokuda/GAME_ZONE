class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :game_comments
end
