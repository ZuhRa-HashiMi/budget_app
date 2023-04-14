require 'rails_helper'

RSpec.describe 'Transactions pages', type: :feature do
  before :all do
    @user = User.new(name: 'zuhra', email: 'zuhra@gmail.com', password: '123456')
    @group = Group.new(user: @user, name: 'first')
    @group.save
  end

  before :each do
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'zuhra@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    click_link @group.name
  end

  after :all do
    @group.destroy
    @user.destroy
  end

  it 'Expect section Title' do
    expect(page).to have_content('TRANSACTIONS')
  end

  it 'Add a new Transaction' do
    click_link('add a new transaction')
    fill_in 'Transaction name', with: 'Apples'
    fill_in 'Transaction amount', with: '15'
    click_button('Save')
    expect(Entity.last.name).to be == 'Apples'
    Entity.last.destroy
  end
end
