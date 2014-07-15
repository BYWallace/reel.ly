class MoviesController < ApplicationController
  def index
    random_number = rand(1..10)
    # postgreSQL
    if random_number < 6 && current_user.movies.count > 2
      @movies = [current_user.rankings.where(has_watched: true).sort_by(&:win_percentage).map {|ranking| ranking.movie }.pop(10).sample()]
      @movies.push(Movie.order("RANDOM()").first).to_json
    elsif random_number == 6
      @movies = current_user.rankings.where(has_watched: true).sort_by(&:win_percentage).map {|ranking| ranking.movie }.pop(10).sample(2).to_json
    else
      @movies = Movie.limit(2).order("RANDOM()")
    end
    render json: @movies
  end
end
