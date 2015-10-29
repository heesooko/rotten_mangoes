class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie, foreign_key: 'movie_id'

  # option 1
  scope :favourite, lambda { rated_above(6).order(rating_out_of_ten: :desc) }
  scope :rated_above, lambda { |rating| where("reviews.rating_out_of_ten > ?", rating) }

  scope :on_short_films, lambda { joins(:movie).where("movies.runtime_in_minutes <= 60") }

  # option 2 (newer ruby syntax)
  # scope :favourite, -> { where("reviews.rating_out_of_ten > 6") }

  # class method
  # class << self
  #   def favourite
  #     where("reviews.rating_out_of_ten > 6")
  #   end
  # end

  validates :user,
    presence: true

  validates :movie,
    presence: true

  validates :text,
    presence: true

  validates :rating_out_of_ten,
    numericality: { only_integer: true }
  validates :rating_out_of_ten,
    numericality: { greater_than_or_equal_to: 1 }
  validates :rating_out_of_ten,
    numericality: { less_than_or_equal_to: 10 }
    


end
