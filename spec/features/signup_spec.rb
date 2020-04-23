require 'rails_helper'

RSpec.describe 'User creates a new registered user', type: :feature do
  scenario 'they access the home page and click the signup button' do
    visit signup_path

    fill_in 'user[name]', with: 'exampleUser'
    fill_in 'user[email]', with: 'example@example.com'

    click_button 'Sign up'

    expect(page).to have_content('exampleUser')
  end
end
