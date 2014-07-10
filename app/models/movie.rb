class Movie < ActiveRecord::Base
  def self.generate_imdb250
    top_250 = Imdb::Top250.new
    top_250.movies.each do |movie|
      Movie.create(
        title: movie.title,
        year: movie.year,
        poster_url: movie.poster
      )
    end
  end
end
