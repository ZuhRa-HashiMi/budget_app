# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before :all do
    @user = User.new(name: 'zuhra', email: 'zuhra@gmail.com', password: '123456')
  end

  before :each do
    visit root_path
    click_link 'Log in'
  end

  after :all do
    @user.destroy
  end

  it 'See username and password inputs, and Log in button' do
    expect(has_field?('Email') && has_field?('Password') && has_button?('Log in')).to be true
  end

  it 'Detail error with empty credentials' do
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Detail error with wrong credentials' do
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
