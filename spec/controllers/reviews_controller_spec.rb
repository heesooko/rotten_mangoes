require 'spec_helper'

describe ReviewsController do


  describe "Deleting a review" do 
    before :each do 
      @review = FactoryGirl.create :review
      session[:user_id] = @review.user.id
    end
    it "should allow me to delete my review" do
      params = { id: @review.id, movie_id: @review.movie.id } 
      delete :destroy, params
      review = assigns(:review) # @review from inside controller
      expect(review).to be_a(Review)
      expect(review).to be_frozen # assert review.frozen?
      expect(response).to redirect_to(@review.movie)
      expect(flash[:notice]).to eq("Deleted your review")
    end
    it "should not allow me to delete someone else's review" do 
      @user = FactoryGirl.create :user
      session[:user_id] = @user.id
      params = { id: @review.id, movie_id: @review.movie.id }
      expect { delete(:destroy, params) }.to raise_error
      review = assigns(:review) # @review from inside controller
      expect(review).to be_nil
    end
    it "should throw an error if review is not within given movie" do 
      @movie = FactoryGirl.create :movie
      params = { id: @review.id, movie_id: @movie.id }
      expect { delete(:destroy, params) }.to raise_error
      review = assigns(:review) # @review from inside controller
      expect(review).to be_nil
    end
    pending "should raise error if movie could not be found"
    pending "should raise error if review with that id could not be found"
  end

end
