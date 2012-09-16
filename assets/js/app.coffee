#= require myApp
#= require lib/jquery-1.8.1.min
#= require lib/underscore-min
#= require_tree lib
#= require_tree backbone
#= require util

$ ->
  for template in $('.handlebars')
    templates[$(template).attr('id')] = Handlebars.compile($(template).html())

  $('ul.nav').html(templates.logged_out_nav())

  myApp.routers.appRouter = Backbone.Router.extend({
    routes:
      "!/": "main",
      "!/login/": "login"
      "!/logout/": "logout"
      "*path": "catchall"

    main: ->
      view = new myApp.views.Home()
      $('.content').html(view.render().el)

    login: ->
      view = new myApp.views.Login()
      $('.content').html(view.render().el)

    catchall: (path) ->
      console.log 'Caught undirected route: ' + path
      appRouter.navigate("#!/", true)

  })

  if not $.cookie('request_token')
    $.get('/request_token/', (data) ->
      myApp.request_token = data.oauth_token
      window.appRouter = new myApp.routers.appRouter()
      Backbone.history.start()
    )
  else
    myApp.request_token = $.cookie('request_token')
    window.appRouter = new myApp.routers.appRouter()
    Backbone.history.start()
