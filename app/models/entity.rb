class Entity < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :group
    validates :name, presence: { message: "Name can't be blank!" }
    validates :amount, presence: { message: 'Amount must be greater than Zero (0)' }
end
