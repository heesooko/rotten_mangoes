class ReviewsController < ApplicationController

  before_filter :restrict_access
  before_filter :load_movie

  def new
    @review = @movie.reviews.build
  end

  def create
    @review = @movie.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to @movie, notice: "Review created successfully"
    else
      render :new
    end
  end

  def destroy
    @review = @movie.reviews.where(user_id: current_user.id).find params[:id]
    @review.destroy
    flash[:notice] = "Deleted your review"
    redirect_to @movie # redirect_to movie_path(@movie)
  end

  protected

  def load_movie
    @movie = Movie.find(params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:text, :rating_out_of_ten)
  end

end
