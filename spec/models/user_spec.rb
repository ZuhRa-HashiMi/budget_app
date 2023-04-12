require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Create a valid user' do
    user = User.new(name: 'zuhra', email: 'zuha@gmail.com', password: '123456')
    expect(user).to be_valid
  end
  
  it 'is not valid without a name' do
    user = User.new(email: 'zuhra@gmail.com')
    expect(user).to_not be_valid
  end
  it 'Create an invalid user due to empty firstname' do
    user = User.new(name: '', email: 'zuhra@gmail.com', password: '123456')
    expect(user).to_not be_valid
    expect(user.errors[:name][0]).to be == "Firstname can't be blank!"
  end

  it 'is not valid without email' do
    user = User.new(name: 'zuhra')
    expect(user).to_not be_valid
  end
end


