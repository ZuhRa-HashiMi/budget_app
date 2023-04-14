class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entities
  has_many :groups
  has_one_attached :avatar

  validates :name, presence: { message: "Firstname can't be blank!" }, length: { minimum: 3, maximum: 250 }
  validates :email, presence: true
end
