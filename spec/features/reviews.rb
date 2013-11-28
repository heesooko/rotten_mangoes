require 'spec_helper'

feature "Review Delete link" do 

  scenario "should be displayed to the user that wrote the review" do 
    create_user_and_login
    @review = FactoryGirl.create :review, user: @user
    @movie = @review.movie

    visit movie_path(@movie) # visit "/movies/#{@movie.id}"

    expect(page).to have_link 'Delete Review'
  end

end
