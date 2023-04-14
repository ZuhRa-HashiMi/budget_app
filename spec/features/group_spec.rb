require 'rails_helper'

RSpec.describe 'Category pages', type: :feature do
  before :all do
    @user = User.new(name: 'zuhra', email: 'zuhra@gmail.com', password: '123456')
    @group = Group.new(user: @user, name: 'first')
    @user.save
    @group.save
  end

  before :each do
    visit root_path
    click_link 'Log in'
    fill_in 'Email', with: 'zuhra@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  it 'Expect section Title' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'Add a new Category' do
    click_link('Add a new Category')
    fill_in 'Enter Category name', with: 'Movies'
    click_button('Save')
    expect(Group.last.name).to be == 'Movies'
    Group.last.destroy
  end
end
