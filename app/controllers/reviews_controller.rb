class ReviewsController < ApplicationController

  before_filter :restrict_access
  before_filter :load_movie
  before_filter :disallow_multiple_reviews, only: [:new]

  def new
    @review = @movie.reviews.build
    @review.rating_out_of_ten = 5
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user = current_user 
   
    if @review.save
      redirect_to @movie, notice: "Review created successfully"
    else
      render :new
    end
  end

  protected

  def disallow_multiple_reviews
    if @movie.already_reviewed_by?(current_user)
      redirect_to @movie, alert: "You've already reviewed this movie"
    end
  end

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end

end
