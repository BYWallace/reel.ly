var Ranking = Backbone.Model.extend({
  defaults: {
    id: 0,
    user_id: 0,
    movie_id: 0,
    win_count: 0,
    match_count: 0
  },
});

var RankingCollection = Backbone.Collection.extend({
  model: Ranking,
  url: "/users/" + window.currentUserId + "/rankings"
});

var currentUserRankings = new RankingCollection();
