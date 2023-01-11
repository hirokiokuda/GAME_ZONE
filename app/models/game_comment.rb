class GameComment < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :favorites, dependent: :destroy
end
