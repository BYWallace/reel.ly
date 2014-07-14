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

  successCallback: function(event) {
     $.ajax({
        url: '/rankings/win/' + $(event.target).data("id"),
        type: 'post',
        dataType: 'json'
        //don't need to send any data...just love-tapping controller
      });
  },

  onSelectMovie: function(event) {
    currentUserRankings.create({ collection: this.collection }, {success: this.successCallback});
    this.collection.fetch();
    currentUserRankings.fetch();
  },


  render: function () {
    var html = this.template({ collection: this.collection });
    return this.$el.html(html);
  }

});
