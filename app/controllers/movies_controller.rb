class MoviesController < ApplicationController
  def index
    # postgreSQL
    @movies = Movie.limit(2).order("RANDOM()")
    render json: @movies
  end
end
