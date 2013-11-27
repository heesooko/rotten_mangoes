require 'spec_helper'

feature "Authentication" do 

  scenario "fails with incorrect credentials" do 
    visit '/sessions/new'
    fill_in 'email', with: 'abc@lighthouselabs.ca'
    fill_in 'password', with: 'lafdsfdsa'
    click_button 'Log In'
    expect(page).to have_content 'Log in failed'
  end

  scenario "succeeds with correct credentials" do 
    u = FactoryGirl.create :user, email: 'kvirani@lighthouselabs.ca'
    visit '/sessions/new'
    fill_in 'email', with: u.email
    fill_in 'password', with: 'gobbledigook'
    click_button 'Log In'
    expect(page).to have_content 'Welcome back'
  end


end
