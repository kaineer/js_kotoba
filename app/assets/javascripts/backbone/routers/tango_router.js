//
JsKotoba.Routers.Router = Backbone.Router.extend({
  //
  routes: {
    "": "login"
  },

  //
  login: function() {
    JsKotoba.Get("/users/sign_in.json", function(data) {
      JsKotoba.user().set(data.data);
    });
  }
});

