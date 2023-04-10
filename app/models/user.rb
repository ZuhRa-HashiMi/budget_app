class User < ApplicationRecord
    has_many :entities
    has_many :groups
  
    validates :firstname, presence: { message: "Firstname can't be blank!" }, length: { minimum: 3, maximum: 250 }
    validates :lastname, presence: { message: "Lastname can't be blank!" }, length: { minimum: 3, maximum: 250 }
  end
end
