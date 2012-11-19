//
JsKotoba.Views.Login = Backbone.View.extend({
  initialize: function() {
    this.model.on("change:email", this.render, this);
  },
  events: {
    "click #submit_jabber": "submit_jabber"
  },
  template: JST.template("login"),
  render: function() {
    this.$el.html(this.template(this.model.toJSON()));
  },
  submit_jabber: function() {
    var loginName = this.$el.find("#login_name");
    JsKotoba.Post("/users.json", {login: loginName.val()}, function(data) {
      //
    });
    loginName.val("");
  }
});
