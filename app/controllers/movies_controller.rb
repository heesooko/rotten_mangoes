class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def popular
    #render text: "hello, welcome to popular movies!"
    # only fetch @movies that have a average review of 7 or greater
    @movies = Movie.where("average_rating > ?", 7) # won't work b/c there is no average column. We'd have to join with reviews table
    #@movies = Movie.all.select { |m| m.average_rating >= 7 if m.average_rating }

    #render text: @movies.inspect # for easy debugging instead of creating a view
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    if @movie.destroy
      flash[:notice] = "No more movie!" # :notice
      redirect_to movies_path
    else
      # no dice
      flash[:alert] = "Don't do that man. This movie has reviews!" # :notice
      redirect_to movie_path(@movie)
    end
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description
    )
  end

end