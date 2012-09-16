myApp.views.Login = Backbone.View.extend({
  events:
    "click button": "login"
  
  attributes:
    class: 'row'

  render: ->
    @$el.html(templates.login_view())
    @

  login: (ev) ->
    ev.preventDefault()
    login_data = @$el.find('form').serializeObject()
    # We will post this login data to the server
    $.post('/login/', login_data, (result) ->
    )
})
