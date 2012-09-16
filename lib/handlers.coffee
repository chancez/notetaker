dbox = require('dbox')

dropbox = dbox.app({ "app_key": "e0wpxdh95x98j9y", "app_secret": "v15r2tssv5ac9a0" })


module.exports = (app) ->
  app.get('/', (req, res) ->
    res.render('default')
  )

  app.get('/request_token/', (req, res) ->
    dropbox.requesttoken((status, request_token) ->
      res.cookie('request_token', request_token.oauth_token, {})
      res.json(request_token)
    )
  )

  app.get('/access_token/', (req, res) ->
    if req.cookies.request_token
      dropbox.accesstoken(req.cookies.request_token, (status, access_token) -> 
        res.cookie('request_token', access_token)
        console.log(access_token)
      )
      console.log req.body
    else
      res.json('Need request token')
  )
