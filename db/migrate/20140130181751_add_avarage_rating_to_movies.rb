class AddAvarageRatingToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :average_rating, :decimal, :precision => 3, :scale => 1
  end
end
