class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :themes
  has_many :answers

  validates :name, :unique_code, :email, presence: true
  validates :unique_code, uniqueness: true

  attachment :profile_image
end
