class Group < ApplicationRecord
  has_many :groupusers, dependent: :destroy 
  has_many :customers, through: :groupusers
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :image, presence: true
  has_one_attached :image
end
