require "rails_helper"

feature "#User management" do
  background do
    FactoryGirl.create(:user, email: 'a1@mulodo.com', password: '123456')
  end

  scenario "Sign up" do
    visit new_user_registration_path
    within("#new_user") do
      fill_in 'Email', with: 'a2@mulodo.com'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
    end
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario "Sigin is success" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Email', with: 'a1@mulodo.com'
      fill_in 'Password', with: '123456'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  given(:other_user) { FactoryGirl.build(:user, email: 'a2@mulodo.com', password: '123456') }

  scenario "Signin is invalid" do
    visit new_user_session_path
    within("#new_user") do
      fill_in 'Email', with: other_user.email
      fill_in 'Password', with: other_user.password
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end