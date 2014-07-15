class Movie < ActiveRecord::Base
  has_many :rankings

  def self.generate_imdb250
    top_250 = Imdb::Top250.new
    top_250.movies.each do |movie|
      movie_title = movie.title.sub(/\d{1,3}.\s+/, "")
      Movie.create(
        title: movie_title,
        year: movie.year,
        poster_url: movie.poster,
        rating: movie.rating,
        imdb_url: movie.url
      )
    end
  end
end
