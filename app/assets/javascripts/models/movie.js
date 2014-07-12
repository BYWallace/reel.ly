var Movie = Backbone.Model.extend({
  defaults: {
    id: 0,
    title: "",
    year: 0,
    poster_url: ""
  },
});

var MovieCollection = Backbone.Collection.extend({
  model: Movie,
  url: "/movies"
});

var movieCollection = new MovieCollection();
