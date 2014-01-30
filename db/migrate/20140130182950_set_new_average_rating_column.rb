class SetNewAverageRatingColumn < ActiveRecord::Migration
  def change

    print "Updating all movies: "
    Movie.all.each do |movie|
      print "."
      movie.average_rating = movie.calculate_average_rating
      movie.save
    end
    puts "DONE"

  end
end
