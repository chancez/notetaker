dbox = require('dbox')

dropbox = dbox.app({ "app_key": "orfem8lt490u9fo", "app_secret": "n35d0g5ugnjlbe1" })


module.exports = (app) ->
  app.get('/', (req, res) ->
    res.render('default')
  )

  app.get('/request_token/', (req, res) ->
    dropbox.requesttoken((status, request_token) ->
      res.cookie('request_data', request_token, {})
      res.json(request_token)
    )
  )

  app.get('/access_token/', (req, res) ->
    if req.cookies.request_data
      console.log req.cookies.request_data
      dropbox.accesstoken(req.cookies.request_data, (status, access_token) ->
        console.log access_token
        res.cookie('access_token', access_token, {})
        console.log(access_token)
        res.json(access_token)
      )
    else
      res.json('Need request token')
  )
