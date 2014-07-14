class MoviesController < ApplicationController
  def index
    # postgreSQL
    if rand(1..10) > 4 && current_user.movies.count > 4
      @movies = current_user.movies.limit(2).order("RANDOM()")
    else
      @movies = Movie.limit(2).order("RANDOM()")
    end

    render json: @movies
  end
end
