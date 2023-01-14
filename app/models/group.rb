class Group < ApplicationRecord
  has_many :groupusers
  has_many :customers, through: :groupusers
  
  validates :name, presence: true
  validates :introduction, presence: true
  has_one_attached :image
end
