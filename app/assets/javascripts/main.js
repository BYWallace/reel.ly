$(document).ready(function() {

  window.currentUserRankings.fetch();

  window.movieCollection.fetch().then(function() {
    var router = new Router();
    Backbone.history.start();
    // var movieComparisonView = new MovieComparisonView({collection: movieCollection});
    // movieComparisonView.$el.appendTo(".col-md-10");
  });
});
