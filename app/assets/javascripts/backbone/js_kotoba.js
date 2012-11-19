//= require_self
//= require_tree ./templates
//= require_tree ./models
//= require_tree ./views
//= require_tree ./routers

window.JsKotoba = {
  Models: {},
  Collections: {},
  Routers: {},
  Views: {}
};

var EmptyFn = function() {};

var ajaxRequest = function(method) {
  return function(url, parameters, callback) {
    if(_.isFunction(parameters)) {
      callback = parameters;
      parameters = {};
    }

    callback || (callback = EmptyFn);

    return $.ajax({
      url: url,
      data: parameters,
      success: callback, 
      type: method, 
      dataType: "json"
    });
  };
};

_.extend(
  JsKotoba,
  {Get: ajaxRequest("GET"),
   Put: ajaxRequest("PUT"),
   Delete: ajaxRequest("DELETE"),
   Post: ajaxRequest("POST")
  });

JsKotoba.user = function() {
  return (JsKotoba.currentUser || (JsKotoba.currentUser = 
                                   new JsKotoba.Models.User()));
};

$(function() {
  var router = new JsKotoba.Routers.Router();
  var loginView = new JsKotoba.Views.Login({
    el: "#login",
    model: JsKotoba.user()
  });

  loginView.render();

  Backbone.history.start();
});