class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  validates :username, presence: true, uniqueness: true, length: { minimum: 7, maximum: 25 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
