var Ranking = Backbone.Model.extend({
  defaults: {
    id: 0,
    title: "",
    year: 0,
    poster_url: ""
  },
});

var RankingCollection = Backbone.Collection.extend({
  model: Ranking,
  url: "/users/" + window.currentUserId + "/rankings"
});

var currentUserRankings = new RankingCollection();
