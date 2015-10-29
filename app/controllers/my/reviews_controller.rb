class My::ReviewsController < My::BaseController

  # /my/reviews
  def index
    # SELECT * FROM reviews WHERE reviews.user_id = 1;
    # find_by(...) == where(...).first
    # @reviews = Review.where(user_id: current_user.id).where()
    # @reviews = Review.where("reviews.user_id = ?", current_user.id) # 
    # @reviews = Review.where("reviews.user_id != #{current_user.id}") # dont do this ! security issue
    @reviews = current_user.reviews.favourite

    # SELECT * FROM reviews JOIN movies ON movies.id = reviews.movie_id WHERE movies.runtime_in_minutes <= 60;
    @short_film_reviews = current_user.reviews.on_short_films
    # Review.favourite.where(user_id: current_user.id)
  end

end
