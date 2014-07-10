var movieCollection = new MovieCollection();

movieCollection.fetch().then(function() {
  var movieComparisonView = new MovieComparisonView({collection: movieCollection});
  movieComparisonView.$el.appendTo(".col-md-10");
});
