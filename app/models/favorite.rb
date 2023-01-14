class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :game_comments
  validates_uniqueness_of :game_comment_id, scope: :customer_id
end
