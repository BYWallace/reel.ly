var MovieComparisonView = Backbone.View.extend({
  tagName: "div",
  className: "col-md-12",

  template: _.template( $("#movie-comparison-template").html() ),

  initialize: function() {
    // we listen to the collection to rerender on fetches
    this.listenTo(this.collection, 'sync change add remove', this.render);
    this.render();
  },

  events: {
    "click img" : "onSelectMovie"
  },

  onSelectMovie: function(event) {
    event.preventDefault();
    currentUserRankings.create({ collection: this.collection });
  },

  render: function () {
    this.remove();
    var html = this.template({ collection: this.collection });
    return this.$el.html(html);
  }

});
