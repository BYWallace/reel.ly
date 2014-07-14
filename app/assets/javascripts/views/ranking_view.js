var CurrentRankingsView = Backbone.View.extend({
  tagName: "ol",
  className: "current-rankings",

  template: _.template( $("#ranking-list-template").html() ),

  initialize: function() {
    // we listen to the collection to rerender on fetches
    this.listenTo(this.collection, 'sync change add remove', this.render);
    this.render();
  },

  render: function () {
    this.remove();
    var html = this.template({ collection: this.collection });
    return this.$el.html(html);
  }

});
