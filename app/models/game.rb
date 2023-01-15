class Game < ApplicationRecord
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags
  has_many :game_comments, dependent: :destroy
  has_one_attached :image


  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @game = Game.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @game = Game.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @game = Game.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @game = Game.where("name LIKE?","%#{word}%")
    else
      @game = Game.all
    end
  end
end
