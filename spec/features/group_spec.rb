# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Category pages', type: :feature do
  # let(:user) {User.create(avatar: 'zuhra.jpg', name: 'zuhra', email: 'zuhra@gmail.com', password: '123456')}

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

  # after :all do
  #   @group.destroy
  #   @user.destroy
  # end

  it 'Expect section Title' do
    expect(page).to have_content('CATEGORIES')
  end

  # it 'Navigate to categorie\'s transaction page' do
  #   visit root_path
  #   click_link(@group.name)
  #   expect(page).to have_current_path("users/#{user.id}/groups/#{@group.id}/entities")
  # expect(current_path).to be == user_group_entities_path(:user_id, group_id: @group.id)
  # expect(page).to have_content('TRANSACTIONS')
  # end
  # it 'Navigate to add category page' do
  #   click_link('Add a new Category')
  #   expect(current_path).to be == new_user_group_path(user_id: @user.id)
  # end

  it 'Add a new Category' do
    click_link('Add a new Category')
    fill_in 'Enter Category name', with: 'Movies'
    click_button('Save')
    expect(Group.last.name).to be == 'Movies'
    Group.last.destroy
  end
end
