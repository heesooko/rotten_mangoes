require 'spec_helper'

feature "Registration" do 

  scenario "succeeds with valid information" do 
    user = FactoryGirl.build :user
    visit 'users/new'
    fill_in 'user[email]', with: user.email
    fill_in 'user[firstname]', with: user.firstname
    fill_in 'user[lastname]', with: user.lastname
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    click_button 'Submit'
    expect(page).to have_content 'Welcome aboard'
  end

end

