class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, uniqueness: true
  has_one :profile
  has_many :posts, through: :profile
  has_many :comments, through: :posts

end
