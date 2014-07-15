$(document).ready(function() {

  window.currentUserRankings.fetch().then(function() {
    var currentRankingsView = new CurrentRankingsView({collection: currentUserRankings});
    currentRankingsView.$el.appendTo(".col-md-2");
  }).then(function(){
    window.currentUserWatchlist.fetch().then(function() {
    var currentWatchlistView = new CurrentWatchlistView({collection: currentUserWatchlist});
    currentWatchlistView.$el.appendTo(".col-md-2");
    });
  });



  window.movieCollection.fetch().then(function() {
    var movieComparisonView = new MovieComparisonView({collection: movieCollection});
    movieComparisonView.$el.appendTo(".col-md-10").hide().fadeIn();
  });
});
