var movieCollection = new MovieCollection();

movieCollection.fetch().then(function() {
  movieCollection.each(function(movie) {
    console.log(movie.get("title"));
  });
});
