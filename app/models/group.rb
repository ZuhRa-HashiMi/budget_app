class Group < ApplicationRecord
    belongs_to :user
    # has_many :entities
    has_and_belongs_to_many :entities
    validates :name, presence: { message: "Name can't be blank!" }
    has_one_attached :image
end
