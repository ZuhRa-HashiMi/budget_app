class Entity < ApplicationRecord
    belongs_to :user
    # belongs_to :group
    has_and_belongs_to_many :groups
    validates :name, presence: { message: "Name can't be blank!" }
    validates :amount, presence: { message: 'Amount must be greater than Zero (0)' }
end
