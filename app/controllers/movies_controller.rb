class MoviesController < ApplicationController
  def index
    # postgreSQL
    if rand(1..10) > 5 && current_user.movies.count > 50
      @movies = [current_user.rankings.sort_by(&:win_percentage).map {|ranking| ranking.movie }.pop(10).sample()]
      @movies.push(Movie.order("RANDOM()").first).to_json
    else
      @movies = Movie.limit(2).order("RANDOM()")
    end
    render json: @movies
  end
end
