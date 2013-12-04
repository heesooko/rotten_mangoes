class Admin::MoviesController < ApplicationController
  
  layout 'admin' # default is 'application'

  def index
    @movies = Movie.all
  end

end
