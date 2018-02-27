class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @director = Director.find(params[:director_id])
    @movies = @director.movies
  end

  def show
    @movie = Movie.find_by(slug: params[:slug])
  end

  def new
    @director = Director.find(params[:director_id])
    @movie = @director.movies.new
  end

  def create
    @director = Director.find(params[:director_id])
    @movie = @director.movies.new(movie_params)
    if @movie.save
      redirect_to director_movies_path(@director)
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description)
  end

  def set_movie
    @movie = Movie.find_by(slug: params[:slug])
  end

end
