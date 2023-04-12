# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entity, type: :model do
  before :all do
    @user = User.new(name: 'zuhra', email: 'zuhra@gmail.com', password: '123456')
    @group = Group.new(user_id: @user, name: 'first')
    # @transaction = Entity.new(user: @user, groups: @group, name: 'Fruit', amount: 100)
  end

  it 'Create a valid transaction' do
    transaction = Entity.new(user: @user, group_id: @group.id, name: 'Fruit', amount: 100)
    expect(transaction).to be_valid
  end

  it 'Create an invalid transaction due to wrong name' do
    transaction = Entity.new(user: @user, group_id: @group.id, name: '', amount: 90)
    expect(transaction).to be_invalid
    expect(transaction.errors[:name][0]).to be == "Name can't be blank!"
  end

  it 'Create an invalid transaction due to wrong amount' do
    transaction = Entity.new(user: @user, group_id: @group.id, name: 'Fruits', amount: '')
    expect(transaction).to be_invalid
    expect(transaction.errors[:amount][0]).to be == 'Amount must be greater than Zero (0)'
  end
end
