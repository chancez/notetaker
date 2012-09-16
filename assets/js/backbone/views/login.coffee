myApp.views.Login = Backbone.View.extend({
  events: 
    "click .grab_access_token": "grab_access_token"

  attributes:
    class: 'row'

  render: ->
    access_token = $.cookie('access_token')
    if not access_token
      @$el.html(templates.login_view({request_token: myApp.request_token}))
      @

  grab_access_token: () ->
    $.get('/access_token/', (data) ->
    )
})
