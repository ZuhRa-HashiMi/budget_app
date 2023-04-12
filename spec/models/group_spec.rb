# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.new(name: 'zuhra', email: 'zuhra@gmail.com', password: '123456')
    @group = Group.new(user: @user, name: 'first')
  end

  it 'Create a valid category' do
    expect(@group).to be_valid
  end

  it 'Cannot create category' do
    group = Group.new(user: @user, name: '')
    expect(group).to be_invalid
    expect(group.errors[:name][0]).to be == "Name can't be blank!"
  end
end
