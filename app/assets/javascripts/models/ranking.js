var Ranking = Backbone.Model.extend({

});

var RankingCollection = Backbone.Collection.extend({
  model: Ranking,
  url: "/users/" + window.currentUserId + "/rankings"
});

var WatchListCollection = Backbone.Collection.extend({
  model: Ranking,
  url: "/users/" + window.currentUserId + "/watchlist"
});

var currentUserRankings = new RankingCollection();
var currentUserWatchlist = new WatchListCollection();
