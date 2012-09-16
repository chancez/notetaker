module.exports = (app) ->
  app.get('/', (req, res) ->
    res.render('default')
  )

  app.post('/login/', (req, res) ->
    console.log req.body
  )
