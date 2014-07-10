define(function(require) {
  // Imports:

  var Backbone = require("backbone");
  // Implementation:

  var Movie = Backbone.Model.extend({
    defaults: {
      title: "",
      year: 0,
      poster_url: ""
    },
  });

  var Movies = Backbone.Collection.extend({
    model: Movie,
    url: "/movies"
  });

  return new Movies();
});
