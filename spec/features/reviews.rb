require 'spec_helper'

feature "Review Delete link" do 

  context "while logged in" do 
    before :each do 
      create_user_and_login
    end
    
    scenario "should be displayed to the user that wrote the review" do   
      @review = FactoryGirl.create :review, user: @user
      @movie = @review.movie

      visit movie_path(@movie) # visit "/movies/#{@movie.id}"
      expect(page).to have_link 'Delete Review'
    end

    scenario "should not be displayed to the user that didn't write the review" do 
      @review = FactoryGirl.create :review
      @movie = @review.movie

      visit movie_path(@movie) # visit "/movies/#{@movie.id}"
      expect(page).to_not have_link 'Delete Review'
    end

    scenario "should delete review when clicked" do 
      @review = FactoryGirl.create :review, user: @user
      @movie = @review.movie      

      visit movie_path(@movie)
      click_link 'Delete Review'
      expect(page).to have_content("Deleted your review")
      expect(page).to_not have_content(@review.text)
    end
  end

  context "while not logged in" do
    pending "should not be displayed to the user even if they own the review"
    pending "shows message to user that they should login to review a movie"
  end

end
