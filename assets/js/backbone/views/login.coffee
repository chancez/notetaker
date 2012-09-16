myApp.views.Login = Backbone.View.extend({
  attributes: {
    class: 'row'
  }

  render: ->
    @$el.html(templates.login_view())
    @
})
