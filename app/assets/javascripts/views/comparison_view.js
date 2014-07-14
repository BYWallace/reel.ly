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
    "click img" : "onSelectMovie"
  },

  onSelectMovie: function(event) {
    currentUserRankings.create({ collection: this.collection });
    this.collection.fetch();
    this.render().appendTo(".col-md-10");
  },

  render: function () {
    // this.remove();
    var html = this.template({ collection: this.collection });
    return this.$el.html(html);
  }

});
