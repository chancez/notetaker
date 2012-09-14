myApp.views.Home = Backbone.View.extend({
  initialize: ->

  render: ->
    @$el.html(templates.home_view())
    @
})
