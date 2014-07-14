var Ranking = Backbone.Model.extend({

});

var RankingCollection = Backbone.Collection.extend({
  model: Ranking,
  url: "/users/" + window.currentUserId + "/rankings"
});

var currentUserRankings = new RankingCollection();
