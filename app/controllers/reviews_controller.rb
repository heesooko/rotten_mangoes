class ReviewsController < ApplicationController

  before_filter :restrict_access
  before_filter :load_movie

  def new
    @review = @movie.reviews.build
    @review.rating_out_of_ten = 5
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user = current_user 
    # loop through all reviews for the @movie
    # and check if one of them is from the current_user
    # if we get one back, disallow creation and 
    # return error to user

    if @review.save
      redirect_to @movie, notice: "Review created successfully"
    else
      render :new
    end
  end

  protected

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end

end
