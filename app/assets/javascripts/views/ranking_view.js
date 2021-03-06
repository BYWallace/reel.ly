var CurrentRankingsView = Backbone.View.extend({
  tagName: "ol",
  className: "current-rankings",

  template: _.template( $("#ranking-list-template").html() ),

  initialize: function() {
    // we listen to the collection to rerender on fetches
    this.listenTo(this.collection, 'sync', this.render);
    this.render();
  },

  render: function () {
    var html = this.template({ collection: this.collection });
    return this.$el.html(html);
  }

});

var CurrentWatchlistView = Backbone.View.extend({
  tagName: "ol",
  className: "current-rankings",

  template: _.template( $("#watchlist-template").html() ),

  initialize: function() {
    // we listen to the collection to rerender on fetches
    this.listenTo(this.collection, 'sync', this.render);
    this.render();
  },

  render: function () {
    var html = this.template({ collection: this.collection });
    return this.$el.html(html);
  }

});
