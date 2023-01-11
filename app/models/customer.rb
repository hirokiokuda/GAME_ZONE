class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games
  has_many :groupusers   #ここ！
  has_many :groups, through: :groupusers
  has_many :favorites, dependent: :destroy
  has_many :game_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy 
end
