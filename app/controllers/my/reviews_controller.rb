class My::ReviewsController < My::BaseController

  # /my/reviews
  def index
    @reviews = Review.where(user_id: current_user.id)
  end

end
