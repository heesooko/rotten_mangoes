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
    create_user_and_login
    expect(page).to have_content 'Welcome back'
  end

  scenario "able to logout successfully if logged in" do 
    create_user_and_login
    visit '/'
    #page.save_screenshot('screenshot.png')
    click_link 'Log out'
    expect(page).to have_content 'Adios'
  end

end
