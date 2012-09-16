myApp.views.Login = Backbone.View.extend({
  events:
    "click .grab_access_token": "grab_access_token"

  attributes:
    class: 'row'

  render: ->
    access_token = $.cookie('access_token')
    if not access_token
      @$el.html(templates.login_view({request_token: myApp.request_token, oauth_callback: 'http://localhost:3000/access_token/'}))
    else
      $("ul.nav").html(templates.logged_in_nav())
      @$el.html(templates.logged_in())
    @

  grab_access_token: () ->
    $.get('/access_token/', (data) ->
    )
})
