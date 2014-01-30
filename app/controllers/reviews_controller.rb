class ReviewsController < ApplicationController

  before_filter :restrict_access
  before_filter :load_movie

  def new
    @review = @movie.reviews.build
    @review.rating_out_of_ten = 5
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      # recalculate the average rating stored in the movie record
      # TODO: This works, but it's business logic and should thus be in the Model layer
      @movie.average_rating = @movie.calculate_average_rating
      @movie.save
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
