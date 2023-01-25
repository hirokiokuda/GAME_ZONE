class GameComment < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :game 
  has_many :favorites, dependent: :destroy
  
  validates :comment, presence: true
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
