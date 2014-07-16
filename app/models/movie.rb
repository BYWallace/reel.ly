class Movie < ActiveRecord::Base
  has_many :rankings

  def self.generate_imdb250
    top_250 = Imdb::Top250.new
    top_250.movies.each do |movie|
      movie_title = movie.title.sub(/\d{1,3}.\s+/, "")
      Movie.create(
        title: movie_title,
        year: movie.year,
        rating: movie.rating,
        imdb_url: movie.id
      )
    end
  end

  def self.update_posters
    Tmdb::Api.key("cb3bad947e989cd047e54de3cdbe0ce3")
    Movie.all.each do |movie|
      poster_path = Tmdb::Find.imdb_id("tt#{movie.imdb_url}")["movie_results"][0]["poster_path"]
      movie.update(poster_url: poster_path)
    end
  end
end
