require 'rails_helper'

# testing a signup

RSpec.describe 'User creates a new registered user', type: :feature do
  before(:each) do
    @user = User.new(name: 'exampleUser', email: 'example@example.com')
    @user.save
  end
  scenario 'they access the home page and click the signup button' do
    visit login_path

    fill_in 'email', with: 'example@example.com'

    click_button 'Sign In'

    expect(page).to have_content('exampleUser')
  end
end
