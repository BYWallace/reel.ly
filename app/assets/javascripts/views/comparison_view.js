var MovieComparisonView = Backbone.View.extend({
  tagName: "div",
  className: "col-md-12",

  template: _.template( $("#movie-comparison-template").html() ),

  initialize: function() {
    // listen to the collection to rerender on fetches
    this.listenTo(this.collection, 'sync change add', this.render);
    this.render();
  },

  events: {
    "click img" : "onSelectMovie",
    "click button" : "onButtonClick"
  },

  addWin: function(event) {
     $.ajax({
        url: '/rankings/win/' + $(event.target).data("id"),
        type: 'post',
        dataType: 'json'
        //don't need to send any data...just love-tapping controller
      }).then(function(){movieCollection.fetch();}).then(function(){currentUserRankings.fetch();});
  },

  addWatchlist: function(event) {
    $.ajax({
        url: '/rankings/add_to_watchlist/' + $(event.target).data("id"),
        type: 'post',
        dataType: 'json'
        //don't need to send any data...just love-tapping controller
      }).then(function(){movieCollection.fetch();}).then(function(){currentUserWatchlist.fetch();});
  },

  onSelectMovie: function(event) {
    this.$el.fadeOut();
    currentUserRankings.create({ collection: this.collection });
    this.addWin(event);
  },

  onButtonClick: function(event) {
    this.$el.fadeOut();
    this.addWatchlist(event);
  },


  render: function () {
    var html = this.template({ collection: this.collection });
    return this.$el.html(html).hide().fadeIn();
  }

});
