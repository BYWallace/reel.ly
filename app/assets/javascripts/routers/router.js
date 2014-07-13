// var Router = Backbone.Router.extend({
//   routes: {
//     "*default" : "compareMovies"
//   },

//   clearView: function() {
//     if (this.view) {
//       this.view.remove();
//       this.view = null;
//     }
//   },

//   compareMovies: function() {
//     console.log("compareMovies is firing");
//     this.clearView();
//     this.view = new MovieComparisonView({collection: movieCollection });
//     this.view.$el.appendTo(".col-md-10");
//   }
// });
