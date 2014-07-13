$(document).ready(function() {

  window.currentUserRankings.fetch();

  window.movieCollection.fetch().then(function() {
    var movieComparisonView = new MovieComparisonView({collection: movieCollection});
    movieComparisonView.$el.appendTo(".col-md-10");
  });
});
