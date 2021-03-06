Soundclone.Views.UserFollow = Backbone.View.extend({

  initialize: function (options) {
    this.counts = options.counts || false;
    this.listenTo(this.model, "sync", this.render)
  },

  template: JST['users/follow'],

  events: {
    "click button": "submit"
  },

  render: function () {
    this.$el.html(this.template({user: this.model, counts: this.counts}));
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var view = this;
    this.model.follow({
      success: function (data) {
        view.model.set(data);
        view.render();
      }
    });
  }

})
